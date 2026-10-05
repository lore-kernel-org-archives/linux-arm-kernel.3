Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02663CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruyeKuz6DedPpkIcesJmpP9H55Ihr0QFSivp3ZU/g1k=; b=b/O6gaxTLGUu6Bv9zxi/blp1Ds
	gPSrpCCxt7PJqdZYS6/4cQR60u5dTSHV4LOFY/ZJYtL/yVVTIWR5Kr8L5VmeSORQnnmsUoBWXMVL/
	3WGjAwaKcdPsfJR6R6QDdnuQVbfgztmYTXevsG8s6z/fDRYuG+jzQ/vIyx+Q9lLWR2WFfzfuiRc7a
	3ZEE74Lu6AAsUiDpu2GaOGxgzimZzY0bxJVxNlIrQ09gEM71N9KzDGV88OULC6zwlUbbFdhytCZwg
	5YPEteY6A8H41RPwvSldH5Ek3WtaOMugs1oU+XRzNXXWjM37Y2Ft+RMXu1D7t0UFckKvOBVGrl9Ti
	3pNc6grg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjhW-0000000GeBY-2Z6K;
	Mon, 05 Oct 2026 14:29:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjhS-0000000GeAF-3yI9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 14:29:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FABF6024D;
	Mon,  5 Oct 2026 14:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7461F00893;
	Mon,  5 Oct 2026 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210594;
	bh=ruyeKuz6DedPpkIcesJmpP9H55Ihr0QFSivp3ZU/g1k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RgLf90bdcHausTN5PPUM3X+yUceCwShIKNw6bJS84ZKTODurULCZCm5BZtsdbmiJg
	 CbR0HTYDh+d3XvQ8tkyQ1pdr5PBT5S6HV7gkMSWt1ZbXIhBmVu3/zRLrQpIh1gNLrQ
	 2c72I4u6esbQxOzN0IvbjH2Pb2pwsl4iyHd60A0GUB/j5r4zbZQYufSi7o1vIiYUip
	 D6LWo/4eFgg8LSZtoNreJD8hLwZPRMZu6GrNXAvN1cHNOsdtTmnoYb/TZK+RmLVi0w
	 pPc0DgoHQAXD+WbbyPOkAIWR0N2iT8tazFv3OutIC0oR0XNg0Y7NqoQ0N6cu74VI59
	 p9gqAf2JHfnuA==
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Don't set or get RSS
 parameters when not supported
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 jitendra.vegiraju@broadcom.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, pbrobinson@gmail.com, joe@dama.to
Date: Mon, 05 Oct 2026 14:29:52 +0000
Message-ID: <179121059252.434549.3845635961153166403@kernel.org>
In-Reply-To: <20261002142806.1299041-4-maxime.chevallier@bootlin.com>
References: <20261002142806.1299041-4-maxime.chevallier@bootlin.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit fixes a user-visible bug that goes back to 2019 but
  has no Fixes: trailer.

--

net: stmmac: Don't set or get RSS parameters when not supported

This commit makes stmmac_get_rxfh_key_size() and
stmmac_get_rxfh_indir_size() return 0 when stmmac_rss_is_supported() is
false. The ethtool core then reports -EOPNOTSUPP instead of returning a
bogus key and indirection table for ethtool -x, or failing with -EINVAL
for ethtool -X.

> The RSS kselftests fail on stmmac, and this is partly due to the driver
> reporting bogus data for the RSS ops :
>
>  - ethtool -x reports an indirection table and a key while the hardware
>    doesn't have any of that
>  - ethtool -X fails with -EINVAL.
>
> Return a 0 indir size and key size when rss isn't supported, effectively
> meaning we don't support RSS here.
>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

[Severity: Low]
The commit message describes a user-visible bug fix, but there is no
Fixes: tag. Should one be added?

Both callbacks were added by commit 76067459c686 ("net: stmmac: Implement
RSS and enable it in XGMAC core"). Since then they have returned
sizeof(priv->rss.key) and ARRAY_SIZE(priv->rss.table) whether or not RSS
is supported.

Because those sizes were non-zero, ethtool_get_rxfh() and
ethtool_set_rxfh() in net/ethtool/ioctl.c, and rss_prepare_data() in
net/ethtool/rss.c, never reached their -EOPNOTSUPP path:

    if (!rxfh_dev.indir_size && !rxfh_dev.key_size)
        return -EOPNOTSUPP;

Instead, ethtool -x reached stmmac_get_rxfh() and returned the defaults
set at probe time. ethtool -X went through
stmmac_set_rxfh()->stmmac_rss_configure(), and stmmac_do_callback()
returns -EINVAL there when the core has no rss_configure callback.

The previous patch, "net: stmmac: Introduce a helper to check RSS
support", notes that no platform sets rss_en yet. That means this affects
every stmmac user today.

Would something like this help stable maintainers?

    Fixes: 76067459c686 ("net: stmmac: Implement RSS and enable it in XGMAC core")

Any backport would also need the helper patch from the previous commit,
which also has no Fixes: tag.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261002142806.1299041-1-maxime.chevallier%40bootlin.com

