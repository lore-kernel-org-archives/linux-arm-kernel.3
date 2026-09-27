Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68754C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 16:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gu8ErsYBV4PgFuSVNd6NTMG6a/XMTjplo6GasQz5ZLc=; b=W90JhU64r+DN2j9zz3IRAxjaWw
	MPYyqRxzNo9hRLe67FSjq3wIBt8XLWRo10BrGgix066HIfaafWt0CsNZTcPEU0sMFz52NCADQpXHf
	5kEmJRSBiiRh1SMvo8smod9g39255YICkGg04TXFI8jWxNdBbesOgEAa59JEZiTnhKgFB8C431ItQ
	z/JDMJAyseZfzelK63lUDePPkHr/nEqLpdBHrFPj7muSrDLlLcnE6dVG0B5HzOvnbLur3Aj/W6kXi
	lgjf1HQjW9pS5glAAb4Ht9tT6vA7VxfuZG17H9OOis3p2txp7OnRraOhQlxci3lellZD+Vo5qT2tS
	4DJfFfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArkz-0000000GZRz-0fRc;
	Sun, 27 Sep 2026 16:29:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArka-0000000GYyj-4ANj;
	Sun, 27 Sep 2026 16:29:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE09160D78;
	Sun, 27 Sep 2026 16:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37B31F00893;
	Sun, 27 Sep 2026 16:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790526555;
	bh=Gu8ErsYBV4PgFuSVNd6NTMG6a/XMTjplo6GasQz5ZLc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iDY33W3T4QiioPZtBknBI0Hq0QgYFuTcCI7P1JfrkjQgq1FCbxJ1S8bhxkF6Mj8V4
	 CmD4CJv5XTM/MAPSN4+zoZmBy3jcKvTOXF5u+gi5KNLLj0V2Nxs0PDwqqW1sRfmpSW
	 dDL/CSRmlVQtRYf3EPkIIl8orwyCtq2sO4OeN0mWIk1TIKXxbadkhug4vJrrfxbnu+
	 SKik9AGA1zrqyXJv93oBRLX7Z7Cn9pKD8TveuPwAnt2b9zyz2m6cnv1HqhAj9OfkGm
	 XwaBadjHMC6PZkU/2g7NHVsAOsRBgmAvU7QJny8hm/K3BCFo0tHuL0xiCfq80EyEuM
	 XSOFGK03vXxIA==
Subject: Re: [PATCH net-next v15 5/9] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
From: netdev-bot+sashiko@kernel.org
To: bartosz.golaszewski@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vkoul@kernel.org,
 peppe.cavallaro@st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 shawnguo@kernel.org, festevam@gmail.com, jan.petrous@oss.nxp.com, s32@nxp.com,
 mohd.anwar@oss.qualcomm.com, romain.gantois@bootlin.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, mripard@kernel.org,
 christophe.roullier@foss.st.com, brgl@kernel.org, radu@rendec.net,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dfustini@tenstorrent.com,
 linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 bartosz.golaszewski@linaro.org
Date: Sun, 27 Sep 2026 16:29:12 +0000
Message-ID: <179052655254.2160803.14087106323968541578@kernel.org>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-5-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-5-e82f33720737@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In qcom_ethqos_serdes_powerup()
  (drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c), the patch…

--

net: stmmac: qcom-ethqos: set serdes mode before powerup

This patch adds a call to phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). On SCMI systems the PHY driver needs it to
pick the right performance level, which sets the link speed. It prepares
for adding support for the firmware-managed EMAC on Qualcomm sa8255p.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ac7d6d3e205a1..47b70b5e706f2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
>  	if (ret)
>  		return ret;
>  
> +	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
> +			       ethqos->phy_mode);
> +	if (ret)
> +		goto err_out;

[Severity: Medium]
What happens here if ethqos->phy_mode is one of the RGMII variants?

qcom_ethqos_probe() accepts RGMII, RGMII_ID, RGMII_RXID and RGMII_TXID.
It installs serdes_powerup whenever a "serdes" PHY is found, whatever the
phy_mode is:

qcom_ethqos_probe() {
    ...
	if (ethqos->serdes_phy) {
		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
	}
    ...
}

The qcom,ethqos binding allows this combination too. It has "phys: true"
and "phy-names: const: serdes", with no condition on phy-mode.

Both SerDes PHY drivers reject any submode other than SGMII, 1000BASEX
and 2500BASEX. In phy-qcom-sgmii-eth.c, qcom_dwmac_sgmii_phy_validate()
is called from qcom_dwmac_sgmii_phy_set_mode():

	if (submode == PHY_INTERFACE_MODE_SGMII ||
	    submode == PHY_INTERFACE_MODE_1000BASEX ||
	    submode == PHY_INTERFACE_MODE_2500BASEX)
		return 0;

	return -EINVAL;

The new qcom_dwmac_sgmii_phy_scmi_validate() in
phy-qcom-sgmii-eth-scmi.c does the same.

Take a DT that sets phy-mode = "rgmii*" and also references an enabled
serdes PHY. With this patch, powerup would fail like this:

stmmac_open()
  stmmac_legacy_serdes_power_up()
    qcom_ethqos_serdes_powerup()
      phy_set_mode_ext()
        qcom_dwmac_sgmii_phy_set_mode()
          qcom_dwmac_sgmii_phy_validate() returns -EINVAL
      goto err_out -> phy_exit()

"SerDes powerup failed" is logged, and both stmmac_open() and
stmmac_resume() fail. Before this patch the same DT powered the SerDes
on without an error.

The other caller of this API in the same file already limits the call to
SerDes modes:

ethqos_mac_finish_serdes() {
    ...
	if (interface == PHY_INTERFACE_MODE_SGMII ||
	    interface == PHY_INTERFACE_MODE_2500BASEX)
		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
				       interface);
    ...
}

Later patches in the series don't change serdes_powerup. The patch that
updates phy_mode to the resolved interface in mac_finish() only touches
phy_mode inside mac_finish. mac_finish is only installed for SGMII and
2500BASEX, so an RGMII phy_mode would still reach this call at the end
of the series.

I checked the in-tree DTs. The boards that reference a serdes PHY
(lemans.dtsi and monaco.dtsi based) all use sgmii or 2500base-x. The
RGMII boards have no serdes PHY. So "harmless for existing users" holds
for in-tree users, and this only affects DTs the binding allows but that
aren't in the tree.

Should the call be guarded the same way as in ethqos_mac_finish_serdes()
(SGMII, 1000BASEX and 2500BASEX only)? Another option would be to
install serdes_powerup only for SerDes phy-modes in qcom_ethqos_probe(),
or to restrict the binding.

> +
>  	ret = phy_power_on(ethqos->serdes_phy);
>  	if (ret)
> -		phy_exit(ethqos->serdes_phy);
> +		goto err_out;
>  
> +	return 0;
> +
> +err_out:
> +	phy_exit(ethqos->serdes_phy);
>  	return ret;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260923-qcom-sa8255p-emac-v15-0-e82f33720737%40oss.qualcomm.com

