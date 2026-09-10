Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2D8C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTp9lxLeKRbiCoZS9F/44u4HKEZO1wVF2r7BeB36fqY=; b=WnXD+y4d7oGOk4zdpiVzPigNic
	KWyH0lbVpCHKGOQkmf+bvqYXBnh8TDYTcV9LBeLkyFEzY9/F6iZAY/0sI9pBsas7PM5cV0AjAoj5l
	PpuQSBXeJgxbe2i+qbYS+bpcXFE3xAsF6+y0SXy2wT6PV4YQ/mzSLVSiNOWWmH4heJ15cf0kIbPGn
	iK6nAZ6v2tk7V1Y8tYPzIi2JgSv/v0FouQeq2pGkiJCvyp/byCLBbRsnC5ryS/KZn8sAOJRAjz+z9
	rQTNgRFDCjs9VerioZZ8Mem+oxiK4kr9H7qf3hV2xcCIwcuTwNx0ajdf9wQUzcF3Qoh4CLno1tkne
	leuID44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oT0-0000000FZJi-4BRY;
	Thu, 10 Sep 2026 23:46:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oSy-0000000FZIN-0nNf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:46:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB5B343E3C;
	Thu, 10 Sep 2026 23:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDA21F00899;
	Thu, 10 Sep 2026 23:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789083963;
	bh=gTp9lxLeKRbiCoZS9F/44u4HKEZO1wVF2r7BeB36fqY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lHqPBuLgBqrS+824l4rkCo+ZQvHSLJyxluudzZ0KnJol3QccbAodAcf9llJDXRYTc
	 3Ynnk3gZq/4Wd8sNNam9xifYPLwj2nakMx81Gc0NFKekltPlJYFuas61UIRNVNxZEm
	 uI+Xpsl+MZQwOFG7r+0vNblonPdK9bR281W1VlXbhlizg7jtYtiCtxF4S2M8DqriAy
	 YeWGXpsST4HPwsckgg7SbXxNg3koCxagh3bAMyF66WGvJ6PP5Oj0mJMi4SE8lJQJEj
	 RuVGjTSZzZ/bj9Jre+zbO4HvkBCG91jt5GnAu3+CACTJt6zCna3hSc8+h22aD/hKoD
	 l6ZneZ/pwIdTA==
Subject: Re: [PATCH net v4 4/7] net: stmmac: Do not advertise S-VLAN stripping
 when it is disabled
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 23:46:02 +0000
Message-ID: <178908396239.219967.5065369273822811230@kernel.org>
In-Reply-To: <20260908164309.59282-5-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-5-ovidiu.panait.rb@renesas.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 (1) · Medium: 0 · Low: 2

- [Low] Commit-message premise vs. actual code: with rx-vlan-offload off
  (priv->hw->hw_vlan_en == false) the driver did not stop stripping…
- [Low] The patch carries 'Fixes: 750011e239a5' yet its hunk depends on
  priv->hw->hw_svlan_en, a struct member added by the immediately…

Pre-existing issues:
- [High] Hardware-stripped S-VLAN tags are handed to the stack with the
  wrong TPID.

--

net: stmmac: Do not advertise S-VLAN stripping when it is disabled

The patch makes NETIF_F_HW_VLAN_STAG_RX follow NETIF_F_HW_VLAN_CTAG_RX in
stmmac_fix_features(), so that rx-vlan-stag-hw-parse is no longer reported
as enabled after rx-vlan-offload is turned off.  Both are driven by the same
EVLS field, so the two features are tied together in hardware.

A few questions below.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index cd9671493b41..c81c5bb5b075 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6189,6 +6189,13 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
>  	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
>  		features &= ~NETIF_F_CSUM_MASK;
>  
> +	if (priv->hw->hw_svlan_en) {
> +		if (features & NETIF_F_HW_VLAN_CTAG_RX)
> +			features |= NETIF_F_HW_VLAN_STAG_RX;
> +		else
> +			features &= ~NETIF_F_HW_VLAN_STAG_RX;
> +	}
> +

[Severity: Low]
The commit message describes the problem purely as a stale advertisement
("rx-vlan-stag-hw-parse keeps being advertised as enabled"), but clearing
NETIF_F_HW_VLAN_STAG_RX here also turns off the software S-tag stripper in
the same file:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_rx_vlan() {
	if ((vlan_proto == htons(ETH_P_8021Q) &&
	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
	    (vlan_proto == htons(ETH_P_8021AD) &&
	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
	...
}

With rx-vlan-offload off, hw_vlan_en is false and stmmac_rx() takes the
stmmac_rx_vlan() path, so before this change 802.1ad tags were still popped
into skb metadata by the driver; afterwards they are left in the linear
frame.

This looks harmless in practice, since __netif_receive_skb_core() calls
skb_vlan_untag() for any eth_type_vlan() protocol and re-establishes the tag
with the correct ETH_P_8021AD TPID.  Would it be worth mentioning the
datapath side effect in the changelog, so it is clear that only the place
where the S-tag is moved into skb metadata changes?

[Severity: Low]
The commit carries Fixes: 750011e239a5 but the hunk tests
priv->hw->hw_svlan_en, which is a struct mac_device_info member added by the
preceding, non-Fixes patch of this series ("net: stmmac: Rework S-VLAN
handling").  A backport of this patch alone onto a kernel that only has
750011e239a5 would not build.

Could a note about that dependency be added for stable backporters?

[Severity: High]
This isn't a bug introduced by this patch, but keeping
NETIF_F_HW_VLAN_STAG_RX advertised whenever NETIF_F_HW_VLAN_CTAG_RX is on
also keeps advertising an S-VLAN parse offload whose result is labelled with
the wrong TPID.

In the hardware path, the stripped outer tag is always handed up as 802.1Q:

drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c:vlan_rx_hw() {
	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);

		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
	}
}

while the descriptor helper deliberately accepts S-tagged and double-tagged
frames:

drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:dwxgmac2_wrback_get_rx_vlan_valid() {
	et_lt = FIELD_GET(XGMAC_RDES3_ET_LT, le32_to_cpu(p->des3));

	return et_lt >= XGMAC_ET_LT_VLAN_STAG &&
	       et_lt <= XGMAC_ET_LT_DVLAN_STAG_CTAG;
}

So on a dwxgmac2 core with rx-vlan-offload on, an 802.1ad frame is delivered
as 802.1Q: an 8021ad upper device never sees it, a same-VID 8021Q upper
device does, and a forwarded frame is re-tagged with the wrong TPID.

This appears to date back to 750011e239a5 rather than to this patch, and
vlan_rx_hw() is untouched by the rest of the series: the later "net: stmmac:
Disable S-Tag processing on dwmac4" only drops the STAG advertisement for
non-XGMAC cores, and dwxgmac210_vlan_ops still points .rx_hw_vlan at
vlan_rx_hw().  Since the ET/LT field already distinguishes S-tag, C-tag and
double tag, could vlan_rx_hw() use it to pick between ETH_P_8021Q and
ETH_P_8021AD?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908164309.59282-1-ovidiu.panait.rb%40renesas.com

