Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C388C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kQbiD1Lcj2OWY/76m82GwPbkC5l7XKW4gKK4kfOBnY=; b=KVNogY+0NV45+EAewLAa4fsYhw
	8TFKWbcYBSSrLl4xf7fd/bk+Irc1DSPz1mS6Qq7T+S7FX3WLMnhG6ZPIjzDpLJd5NCG7gSdQ1TkNu
	F/EUZhNDbZd3xok/2+Q3quEKz5qS0ihrgDA6pgm5Sozj8kadBDa2p4UPPnNwhNv1ptS43W+KIcYl7
	DVR6N86Zy3FlzNxkbHs4hFACEZsdceGtBTehiEwhsQmUZ7JEopAdQy50lKWszmThSixLv3B9rXLgO
	Uzkxm0jWzlAhRHNJD/WfLNYBShLCgTExf2v5XpafOV2GU37mAhkDGXAlZL+EuF1JyCDezzXswwjik
	NEup8IOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8shh-00000004DqR-3GbC;
	Tue, 22 Sep 2026 05:06:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8shW-00000004Do4-20x6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:05:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2ECE543A3F;
	Tue, 22 Sep 2026 05:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2201B1F000FF;
	Tue, 22 Sep 2026 05:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790053554;
	bh=6kQbiD1Lcj2OWY/76m82GwPbkC5l7XKW4gKK4kfOBnY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YcT/qu6sl+JMXk1R4lstVDIs3tHiwLFBrWGn5UYrktqxptGWL0IIJOMYY8rdgNM0l
	 SU3YGWMifg5l1/Qt7f9y71UTNocq7w1SHYz4xVE3M1tPmbzIBFrBW/xDr9HqOtVyk9
	 DdCAp39crKTJ5oK/LvTKxQESWx3ORivyqFFnoJzAh2sHnt+1YY33pU44RtBmx+zEZi
	 9/JxOsIx0ZgL0kwoDwlHp1oA5bCKH9V2bd3CIVy73eRjFNsrWc4JNgrLpKhLbty3HP
	 8U+BrTgri6PpHjemyobkJEYDJzsHArSUWXwqy0F9Q2dHs7HPSz/IrjSDkcQHivrhr0
	 BDaB5GKzNVKFg==
Subject: Re: [PATCH net v2 3/3] net: stmmac: qcom-ethqos: enable 2500BASE-X in
 integrated PCS
From: netdev-bot+sashiko@kernel.org
To: tom.karpiniec@outlook.com
Cc: netdev@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux@armlinux.org.uk, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 yong.liang.choong@linux.intel.com, brgl@kernel.org, coiaprant@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 22 Sep 2026 05:05:52 +0000
Message-ID: <179005355270.2160803.6905383715293377235@kernel.org>
In-Reply-To: =?utf-8?q?=3CSJ2PR11MB84018DBB1F18F07D79DBC5E3E4872=40SJ2PR11MB?=
 =?utf-8?q?8401=2Enamprd11=2Eprod=2Eoutlook=2Ecom=3E?=
References: =?utf-8?q?=3CSJ2PR11MB84018DBB1F18F07D79DBC5E3E4872=40SJ2PR11MB8?=
 =?utf-8?q?401=2Enamprd11=2Eprod=2Eoutlook=2Ecom=3E?=
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Misattributed Fixes: tag and inconsistent stable range.
- [Medium] Setting STMMAC_FLAG_SERDES_SUPPORTS_2500M makes
  stmmac_mac_select_pcs() (stmmac_main.c:1031-1033) return the dwmac…

--

net: stmmac: qcom-ethqos: enable 2500BASE-X in integrated PCS

This sets STMMAC_FLAG_SERDES_SUPPORTS_2500M in qcom_ethqos_probe() when the
optional SerDes phy is present, so that stmmac_integrated_pcs_init() adds
PHY_INTERFACE_MODE_2500BASEX to the integrated PCS supported_interfaces
bitmap.

A couple of questions about this one.

> Fixes: 61e9be0efbe8 ("net: stmmac: qcom-ethqos: add support for 2.5G BASEX mode")
> Cc: stable@vger.kernel.org # 7.0+

[Severity: Medium]
Is this the right commit to blame?  The behaviour being corrected is the
flag gate in stmmac_integrated_pcs_init():

drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c:stmmac_integrated_pcs_init() {
	...
	/* Only allow 2500BASE-X if the SerDes has support. */
	if (priv->plat->flags & STMMAC_FLAG_SERDES_SUPPORTS_2500M)
		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
			  spcs->pcs.supported_interfaces);
	...
}

git show 61e9be0efbe8 only touches dwmac-qcom-ethqos.c (it adds
qcom_ethqos_speed_mode_2500() and the PHY_INTERFACE_MODE_2500BASEX switch
case); it does not touch stmmac_pcs.c or include/linux/stmmac.h.

git blame points both the gate above and the

	#define STMMAC_FLAG_SERDES_SUPPORTS_2500M	BIT(16)

definition in include/linux/stmmac.h at 68cff4fff61f ("net: stmmac: add
BASE-X support to integrated PCS"), which is also where the flag first
appeared, and no in-tree platform ever set it.  Should the Fixes tag name
68cff4fff61f instead?

There is also a mismatch between the two tags: 61e9be0efbe8 shipped in
v6.11, so the Fixes tag nominates trees that predate the code being fixed,
while the Cc annotation says 7.0+.  Which range is intended?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ac7d6d3e205a..0e07225a70ca 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -786,6 +786,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		plat_dat->host_dma_width = data->dma_addr_width;
>  
>  	if (ethqos->serdes_phy) {
> +		plat_dat->flags |= STMMAC_FLAG_SERDES_SUPPORTS_2500M;

[Severity: Medium]
Does setting this flag leave auto-negotiation enabled for 2500BASE-X on
ethqos?

With 2500BASEX now in the integrated PCS supported_interfaces,
stmmac_mac_select_pcs() starts returning the integrated PCS for that
interface instead of NULL (ethqos installs no plat->select_pcs):

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_mac_select_pcs() {
	...
	if (priv->integrated_pcs &&
	    test_bit(interface, priv->integrated_pcs->pcs.supported_interfaces))
		return &priv->integrated_pcs->pcs;
	...
}

That newly routes ethqos through dwmac_integrated_pcs_config():

drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c:dwmac_integrated_pcs_config() {
	bool changed = false, ane = true;

	/* Only configure the advertisement and allow AN in BASE-X mode if
	 * the core supports TBI/RTBI. ...
	 */
	if (phy_interface_mode_is_8023z(interface) &&
	    spcs->support_tbi_rtbi) {
		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
	...
	dwmac_ctrl_ane(spcs->base, 0, ane,
		       spcs->priv->hw->reverse_sgmii_enable);
}

ethqos is the non-TBI case, per the comment in
stmmac_integrated_pcs_init():

	/* If the PCS supports extended status, then it supports BASE-X AN
	 * with a TBI interface to the SerDes. Otherwise, we can support
	 * BASE-X without AN using SGMII, which is required for qcom-ethqos.
	 */

So support_tbi_rtbi is false, the branch is skipped, ane stays true, and
dwmac_ctrl_ane() programs GMAC_AN_CTRL_ANE|GMAC_AN_CTRL_RAN even though
dwmac_integrated_pcs_inband_caps() reported only LINK_INBAND_DISABLE for
802.3z on this core and phylink therefore passed an out-of-band neg_mode.

That also leaves two layers writing GMAC_AN_CTRL in opposite directions:
pcs_config() sets ANE, while the glue clears it later at link up:

drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:ethqos_fix_mac_speed_sgmii() {
	...
	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
	...
}

Is correctness then dependent on a mac_link_up() always following
pcs_config()?  If the interface is configured while the PHY link is down,
or on a repeated major_config without a link-up, the PCS looks like it is
left with AN enabled and restarted on a 2500BASE-X link whose SerDes does
no AN.

Should the ane initialisation in dwmac_integrated_pcs_config() be fixed
first, and should the now-redundant ethqos_pcs_set_inband() write be
mentioned in the commit message?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/SJ2PR11MB8401F5C3A075DE2A0013E063E4872%40SJ2PR11MB8401.namprd11.prod.outlook.com

