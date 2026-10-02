Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADE2CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cZoWWwPM7c4295sa+RXkoXcRWR5SogB4LZu0Q52UIs=; b=TO/nDKUWOSs2lbyVtj2Tvm1rfE
	wz4WbyQVkYJzjeK2ojr5IHkWwGxiT2So7qVEVsflKPDAuOc4SvE8jUUc1BBccOOTJNgIs4RXA5nEP
	kT0O1QPSoPi3hTkZEZCU5+w64ltYanj6Q+OyWsnBjHUjIEUMqCn8hkt0DoePsa3iAId6l6k/srKaE
	/40wZZwgFnr5adSdZajdFRzK6vidqtH8SXf83HatOhu8C3gYL2O7QGMEJTwuJJLNyjUNkKjKU8hqq
	bTFuSaJ0GXQajBF18TMH9B23A4qTjDKjoSq9k16EBtAdOcryFGj6KjxS09KPzZW0D8snz4oPTDp14
	smmQ77bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYm5-0000000B0WU-0ajb;
	Fri, 02 Oct 2026 08:37:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYm1-0000000B0UM-2ARO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:37:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3B7260A80;
	Fri,  2 Oct 2026 08:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49471F000FF;
	Fri,  2 Oct 2026 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930264;
	bh=3cZoWWwPM7c4295sa+RXkoXcRWR5SogB4LZu0Q52UIs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e/4IgrQcYHlcUmdIQiE9A/XhTWasECD91vHaRYCXkiiIepAr75j4W8zDQJVzJx9D6
	 haUMIVvM3l584kg0U/+heCzQ97SQ0w/2BCC3/LNqg3vZyw1mlRu8RpLKH7vX+JGXQL
	 j4nBA7lcEErBzfOnwHs4Sun1mKCypH+6C6PEcEMsYYOFcyMmCwG783fH7sHQnrEbgJ
	 HsEahdivH1lDlR4tQSna5ezw2ogHqzT5xPzBT0tOaFRxIk91a5s7+CJzol+Slsmrm2
	 NGgd15lAxLZ5FZj2u0ViTTgM9I3Tm5ywyjL6e6w+V3y9E3REUlFO4LMhwLtn0rnU/P
	 41qJFE8VFECVQ==
Subject: Re: [PATCH net v6 3/5] net: stmmac: Rename double VLAN references to svlan
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 jun.ann.lai@intel.com, yi.fang.gan@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 08:37:43 +0000
Message-ID: <179093026338.434549.16397575185437884627@kernel.org>
In-Reply-To: <20260928203441.34876-4-ovidiu.panait.rb@renesas.com>
References: <20260928203441.34876-4-ovidiu.panait.rb@renesas.com>
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

- [Low] The self-test renamed to "SVLAN Filtering (perf)"
  (stmmac_test_svlanfilt_perfect), and likewise…

--

net: stmmac: Rename double VLAN references to svlan

This patch renames the "double VLAN" identifiers in the stmmac driver to
"svlan". It covers the VLAN hash callbacks, the num_double_vlans counter
and the selftests. The ESVL and DOVLTC bits control S-VLAN tag
processing, not the inner-tag double VLAN feature. No functional change
is intended.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> index c25dc9f89270..c485217ba880 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c

[ ... ]

> -static int stmmac_test_dvlanfilt_perfect(struct stmmac_priv *priv)
> +static int stmmac_test_svlanfilt_perfect(struct stmmac_priv *priv)
>  {
>  	int ret, prev_cap = priv->dma_cap.vlhash;
>  
> @@ -1171,7 +1171,7 @@ static int stmmac_test_dvlanfilt_perfect(struct stmmac_priv *priv)
>  		return -EOPNOTSUPP;
>  
>  	priv->dma_cap.vlhash = 0;
> -	ret = __stmmac_test_dvlanfilt(priv);
> +	ret = __stmmac_test_svlanfilt(priv);
>  	priv->dma_cap.vlhash = prev_cap;

[Severity: Low]
Does the "SVLAN Filtering (perf)" test still exercise perfect VLAN
filtering?

This test forces perfect-match mode by clearing priv->dma_cap.vlhash
before it calls __stmmac_test_svlanfilt(). An earlier patch in this
series, "net: stmmac: Remove VLAN perfect matching dead code", removed
the fallback in stmmac_vlan_update() that used to read vlhash:

    if (!priv->dma_cap.vlhash) {
        pmatch = vid;
        hash = 0;
    }

At this commit, the only reads of dma_cap.vlhash outside the selftests
are the probe-time feature check in __stmmac_dvr_probe() and the
debugfs dump. The filtering path never reads it:

__stmmac_test_svlanfilt()
  vlan_vid_add()
    stmmac_vlan_rx_add_vid()
      stmmac_vlan_update()
        stmmac_update_vlan_hash(priv, priv->hw, hash, is_svlan);

stmmac_vlan_update() always computes a non-zero hash for the active VID.
vlan_update_hash() and dwxgmac2_update_vlan_hash() then do:

    value |= VLAN_VTHM | VLAN_ETV;

so hash matching stays enabled throughout the "(perf)" run.

That seems to make stmmac_test_svlanfilt_perfect() a repeat of
stmmac_test_svlanfilt(). It could pass even if perfect filtering via
stmmac_add_hw_vlan_rx_fltr() were broken. The same applies to
stmmac_test_vlanfilt_perfect().

This patch renames the test but keeps it in this state, and the
remaining patches in the series do not touch the selftests. Should
these two "(perf)" tests be reworked or dropped?

>  
>  	return ret;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928203441.34876-1-ovidiu.panait.rb%40renesas.com

