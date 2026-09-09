Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339B2C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u51wIMseDkxpNxShtMSfkG0JWTpwrhqNHA6Dm1oZaNs=; b=eh5uKsImggw3TMAiwDTaWTehS4
	HKe3SS4k8PfwBiEzaRPDnhxK8hb7xgvlzcOTqRyzNxsJgSZQibl8xYSjpCBk0pW4opn0U8CNQSZou
	yas/m7ekpGAJ9guc6QryfgarrFq2o0q1j2I+fRazs1bly4R+Dlp6gx1vT1gUGpteYYdfy+lZXYPr2
	UGu6345ujpAJVjKhF1NPuZbuwpd+e4+4s97UY4jPELhr2varJM6QsQdxXT+lkVVb8UUdLsZB6+OE6
	rfBmshKx1rj2dUm8mszXUL2siN1/1xOWqkm0nRXaymqGeklzjJy9hKF/nnBm7F6h3Rz8HfgTdUnEV
	fB7i2YYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q8r-0000000Cuum-0hHC;
	Wed, 09 Sep 2026 21:47:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q8R-0000000Cuh8-2Otj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 21:47:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 590AD601EF;
	Wed,  9 Sep 2026 21:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AE01F0089C;
	Wed,  9 Sep 2026 21:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788990434;
	bh=u51wIMseDkxpNxShtMSfkG0JWTpwrhqNHA6Dm1oZaNs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lAfLYe8b5+GZyzAOdsogQyUui5DYNZtHMauM++5n5SYZIvnjSvFlrPgCAk8DWRAtC
	 kgmeghX6HGJXg1S6C41pAGl5nq02nykLw1QpAdh3UjcTN73X3hiSQUr57Otm/c5Yr+
	 a7Ujx/KqjQzU40XFi6d9znR7UE1/v1yCYRSXCKT/CZNYiE7Y0bG8NdaKVVPlts8L0P
	 ljtbA3hIo8lLhyHr0YIMf+5Q2wKRG13oFMzfxTuW8sz6w2r1JPfUtZQ5d8UerpI7PI
	 OTUmIe/KZXtRwMLAM/+tWbiYbPpRid7NQyZlp0LqiBq5yqB4FbYI99n/WhadzHPvyD
	 WKAkq9qJW9knA==
Subject: Re: [PATCH net-next 6/9] net: stmmac: qcom-ethqos: warn about legacy
 RGMII PHY modes
From: netdev-bot+sashiko@kernel.org
To: mohd.anwar@oss.qualcomm.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, richardcochran@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 09 Sep 2026 21:47:12 +0000
Message-ID: <178899043209.219967.1138402258618527467@kernel.org>
In-Reply-To: <20260904-shikra_ethernet-v1-6-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-6-a50765996035@oss.qualcomm.com>
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
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 2 · Low: 0

- [Medium] Unbounded log spam: the new dev_warn("legacy RGMII phy-mode
  detected; consider upgrading to a newer DTB") is placed in the body of…
- [Medium] The warning fires for a PHY mode the commit message never
  mentions.

--

net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes

This adds a dev_warn() in ethqos_fix_mac_speed_rgmii() for the RGMII
configuration paths that are not rgmii-id, to encourage migration to
DTBs using "rgmii-id" with PHY-provided delays.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 67738c1598c50..2ca2f03de3017 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -554,6 +554,8 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
>  		return;
>  	}
>  
> +	dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");

[Severity: Medium]
Can this print repeat without bound?  ethqos_fix_mac_speed_rgmii() is
installed as plat_dat->fix_mac_speed in qcom_ethqos_probe():

  ethqos->phy_mode = plat_dat->phy_interface;
  switch (ethqos->phy_mode) {
  case PHY_INTERFACE_MODE_RGMII:
  case PHY_INTERFACE_MODE_RGMII_ID:
  case PHY_INTERFACE_MODE_RGMII_RXID:
  case PHY_INTERFACE_MODE_RGMII_TXID:
          plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;

and stmmac_mac_link_up() calls it on every resolved link:

  if (priv->plat->fix_mac_speed)
          priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
                                    speed, mode);

The only early return before the new print is the
phy_mode == PHY_INTERFACE_MODE_RGMII_ID branch, so for the other RGMII
modes every link-up, cable re-plug, link flap, autoneg speed change,
ifdown/ifup and resume emits another identical warning.  The condition
being reported is the static DT phy-mode, which is already known at probe
time and does not change afterwards.

Would dev_warn_once(), or a single check in qcom_ethqos_probe() where the
phy_mode switch already exists, be preferable here?  dev_warn_ratelimited()
would at least bound the output.

[Severity: Medium]
The commit message says:

  "However, existing DTBs use "rgmii" and "rgmii-txid" and must remain
   supported for backwards compatibility."

  "Warn when either of these legacy PHY modes is used [...]"

but the code warns for anything reaching ethqos_fix_mac_speed_rgmii()
that is not PHY_INTERFACE_MODE_RGMII_ID, which also covers
PHY_INTERFACE_MODE_RGMII_RXID, dispatched to this callback by the switch
in qcom_ethqos_probe().

Documentation/devicetree/bindings/net/ethernet-controller.yaml lists
rgmii-rxid as the correct description when the TX delay is provided by the
PCB:

      # TX delay is provided by the PCB. See below
      - rgmii-rxid

So a board that legitimately describes itself as rgmii-rxid is now told to
move to "rgmii-id", which would misdescribe the hardware.

Should the condition be narrowed to the two modes named in the commit
message, or should the commit message explain why rgmii-rxid is deprecated
too?

>  	/* Initialize the DLL first */
>  
>  	/* Set DLL_RST */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260904-shikra_ethernet-v1-0-a50765996035%40oss.qualcomm.com

