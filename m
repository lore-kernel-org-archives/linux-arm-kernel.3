Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC0ACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2en9nq3L+d0fr45TyjrHfqOEIYBYC2n45esf7o40X7A=; b=DEvzcYlZLfo1zT7c2z3zhmzPkZ
	mdg3vQJ/DtIg3+UBc4sxBoIUwZ4QSPglOlT2MTF4UD7yd7qiaMNSOr8UZ6pzr+HIGtcUvkxpuN8cr
	IMsAb2z7+8KE+mGKiWMgGiQa/dgPuYghZnAbgxQNDW6osAljWQ5wR3Et9IagP2ydUBEbJbdWmql8Z
	7Mm7Wik/RLRJjL/MZ6lcpi6qi+tCaWnVnId6NYde8MPaInHfLQS2FhtL0Sob0XRinD7wo0r8KcoEl
	dfKHTuqkPn/R/qTp882JORLMqNJae/vk92Y1RbXPXIYLuwwioXnx7+PDur01ncWZZ3sZy5uVMqYkD
	tXhNcyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTVx-00000002qcI-1ILw;
	Tue, 29 Sep 2026 08:48:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTVr-00000002qZ0-1HUR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 08:48:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B75B40569;
	Tue, 29 Sep 2026 08:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AE11F000FF;
	Tue, 29 Sep 2026 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671714;
	bh=2en9nq3L+d0fr45TyjrHfqOEIYBYC2n45esf7o40X7A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NYigNocC7aAx7W+GLbnPMunsoyfwqUQ9jQNXDOV9zR2XcQh8dV2dRnO3HHeBCN7DM
	 GMnGrpB7o1I22tyHKh/YKrWl9BD2hkGn3H96OCDVpCzWQWrUEO4KqvVcVEQjDJmh+A
	 jN9Nd66ILgzhzeNPjqKi0HWTxGrxACuTJWwTxQFlfTcVCPKQQHnlMHoeLd7kHyWIoK
	 xwd+5w0pzS6K1ls1vkzmM1t4jmqnROIMz7UwZS1IpK2Cc799vqAahxryNr/0AKcazb
	 he3dXzNzjKsIWyZSniQ/4mAAZQLTHhxTj+iU9mT+A52Cs2dwIO7QToU0x+pWUM+YtI
	 dualbVsMeLIow==
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Don't set or get RSS
 parameters when not supported
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, nb@tipi-net.de, jitendra.vegiraju@broadcom.com,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, pbrobinson@gmail.com
Date: Tue, 29 Sep 2026 08:48:33 +0000
Message-ID: <179067171307.434549.1093187286398187440@kernel.org>
In-Reply-To: <20260928145043.1228968-3-maxime.chevallier@bootlin.com>
References: <20260928145043.1228968-3-maxime.chevallier@bootlin.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch makes stmmac_get_rxfh() in
  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c return…
- [Low] The commit message describes a user-visible bug: on stmmac
  devices without RSS, 'ethtool -x reports an indirection table and a…

--

net: stmmac: Don't set or get RSS parameters when not supported

This commit changes the stmmac ethtool RSS ops to return early when
stmmac_rss_is_supported() is false. The key and indirection sizes now
report 0, and get_rxfh/set_rxfh return -EOPNOTSUPP. The aim is to stop
reporting bogus RSS data and to make the RSS kselftests work on stmmac.

> The RSS kselftests fail on stmmac, and this is partly due to the driver
> reporting bogus data for the RSS ops :
>
>  - ethtool -x reports an indirection table and a key while the hardware
>    doesn't have any of that
>  - ethtool -X fails with -EINVAL.
>
> Let's return early in the rss ops if we know the hardware and platform
> don't support RSS.
>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

[Severity: Low]
The commit message describes a bug that users can see, but there is no
Fixes: tag.

Blame shows that the unconditional stmmac_get_rxfh_key_size(),
stmmac_get_rxfh_indir_size(), stmmac_get_rxfh() and stmmac_set_rxfh()
logic came from commit 76067459c686. The later refactor fb6e30a72539 only
moved these functions to the ethtool_rxfh_param API.

Should this carry the following tag?

Fixes: 76067459c686 ("net: stmmac: Implement RSS and enable it in XGMAC core")

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 1cf0f8820b33..56019683f399 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c

[ ... ]

> @@ -943,6 +949,9 @@ static int stmmac_get_rxfh(struct net_device *dev,
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	int i;
>  
> +	if (!stmmac_rss_is_supported(priv))
> +		return -EOPNOTSUPP;
> +

[Severity: Medium]
Does this -EOPNOTSUPP break namespace-wide ETHTOOL_MSG_RSS_GET dumps?

rss_dump_one_dev() in net/ethtool/rss.c only skips a device when it has
no get_rxfh op, and stmmac still provides one:

net/ethtool/rss.c:rss_dump_one_dev() {
    ...
	if (!dev->ethtool_ops->get_rxfh)
		return 0;

	if (!ctx->ctx_idx) {
		ret = rss_dump_one_ctx(skb, cb, dev, 0);
		if (ret)
			return ret;
    ...
}

The error then comes back through this path:

ethnl_rss_dumpit()
  rss_dump_one_dev()
    rss_dump_one_ctx()
      rss_prepare()
        rss_prepare_get()
          ops->get_rxfh() -> stmmac_get_rxfh() returns -EOPNOTSUPP

When it reaches ethnl_rss_dumpit(), the loop stops:

	for_each_netdev_lock_ops_compat_scoped(net, dev, ctx->ifindex) {
		...
		ret = rss_dump_one_dev(skb, cb, dev);
		if (ret)
			break;
	}

	return ret;

So the dump fails at the stmmac netdev, and no device with a higher
ifindex gets reported. That includes NICs that do support RSS.

No in-tree platform sets plat->rss_en. The only match is the declaration
in include/linux/stmmac.h. That means stmmac_rss_is_supported() is false
for every in-tree stmmac device.

Before this patch, stmmac_get_rxfh() always returned 0. The dump used to
complete, even though it reported bogus data.

The RSS selftests use this dump path. In
tools/testing/selftests/drivers/net/hw/rss_ctx.py,
test_rss_context_dump() calls:

    ctxs = cfg.ethnl.rss_get({}, dump=True)

It also runs a dump with {'start-context': 1}. On a test host that has a
stmmac port plus the NIC under test, would these now fail, when they
passed before?

mvpp2 and mvneta already return -EOPNOTSUPP from get_rxfh, so the core
already stopped dumps this way. This patch applies that behaviour to every
in-tree stmmac device.

Would it be better to have rss_dump_one_dev() skip devices whose get_rxfh
returns -EOPNOTSUPP, or that report zero indir and key sizes? Another
option is to not provide the stmmac get_rxfh op when RSS is unsupported.

>  	if (rxfh->indir) {
>  		for (i = 0; i < ARRAY_SIZE(priv->rss.table); i++)
>  			rxfh->indir[i] = priv->rss.table[i];

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928145043.1228968-1-maxime.chevallier%40bootlin.com

