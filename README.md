# Headless WordPress Blog

This is a headless WordPress setup using Docker, designed to be used as a backend for a Next.js frontend application.

## Features

- WordPress latest version
- MySQL 5.7 database
- Docker and Docker Compose setup
- WPGraphQL for efficient data querying
- Persistent data storage using Docker volumes

## Prerequisites

- Docker
- Docker Compose

## Setup Instructions

1. Clone this repository
2. Copy `.env.example` to `.env` (if not already present)
3. Start the containers:
   ```bash
   docker-compose up -d
   ```
4. Access WordPress at `http://localhost:8080`
5. Complete the WordPress installation
6. Install and activate WPGraphQL plugin (already done)

## Environment Variables

- `WORDPRESS_DB_HOST`: Database host (default: db:3306)
- `WORDPRESS_DB_USER`: Database user
- `WORDPRESS_DB_PASSWORD`: Database password
- `WORDPRESS_DB_NAME`: Database name
- `WORDPRESS_DB_ROOT_PASSWORD`: MySQL root password
- `WORDPRESS_DEBUG`: Enable/disable WordPress debug mode

## GraphQL Endpoint

The GraphQL endpoint is available at:

- `http://localhost:8080/graphql`

### Example Queries

1. Fetch Posts:

```graphql
query GetPosts {
  posts {
    nodes {
      id
      title
      content
      date
      author {
        node {
          name
        }
      }
    }
  }
}
```

2. Fetch Single Post:

```graphql
query GetPost($id: ID!) {
  post(id: $id, idType: DATABASE_ID) {
    title
    content
    date
    author {
      node {
        name
      }
    }
  }
}
```

3. Fetch Categories:

```graphql
query GetCategories {
  categories {
    nodes {
      id
      name
      description
    }
  }
}
```

## Development

For local development:

1. Make sure Docker is running
2. Run `docker-compose up -d`
3. Access WordPress admin at `http://localhost:8080/wp-admin`
4. Access GraphQL IDE at `http://localhost:8080/graphql`

## Production Considerations

For production deployment:

1. Change all default passwords
2. Enable SSL/TLS
3. Configure proper security headers
4. Set up proper backup strategy
5. Consider using a CDN for static assets

## License

MIT
