# Hekto Deployer
Github action for Hekto CI/CD.

Automatic deployment of branches to Hekto.

This action assumes that the application has already been prepared for deployment. Use this action after other actions that builds the application.

## Inputs

### `token`

**Required** Token for authorization. Can be found on your Hekto profile page.

### `source`

The source folder to deploy. Default `/`.

### `url`

For development purposes. Specifies what url the action should target. Default `https://hekto.app`.

## Example usage

```
uses: standout/hekto-deployer@v1
with:
  token: 'ukBGtVBVk1uCEgZhayJkjxMsaBwM9H72dXe5ULW1AgFyTvBo'
```
