Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874D9C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fuOrU+/aRvKHB+bkuI9ZfEA7MdxiGHZ/hwHu+G3Nb8=; b=WnaxLxRZXa66wjcFP5lY/nKf6P
	gtGs6MOWrNzU20H8BoxCFLXL2smeMxLr5NISuUoFnCvdhfATyubW5KEdFruW06DMEFRMgWTy8o5Jk
	h6xuAQ9nBqpHyjJR6AKsj0rU77Lj42MlX+3RFVgO+xLinH+TscQANYWobi9E9O9srEGfjIhXeshyH
	qdkcin9Cp1c5Yuf3BW7xNJINNP8nqZh5yqcxvk7NsH6Vy1fiHWF7/fWeYana5WErF4DRjWPR1y/EB
	hpbfIR95oD6s9CHSPL1EVmonW2UPlQu99myM9X0S6tDADteutCtrfHGHnnFXubG00tPu7f/ogr4tl
	YUZ2QMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArlQ-0000000Ga1S-1FZY;
	Sun, 27 Sep 2026 16:30:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArkd-0000000GZ13-1Z4C;
	Sun, 27 Sep 2026 16:29:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B989F60D78;
	Sun, 27 Sep 2026 16:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2088D1F00898;
	Sun, 27 Sep 2026 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790526558;
	bh=2fuOrU+/aRvKHB+bkuI9ZfEA7MdxiGHZ/hwHu+G3Nb8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YGEyjPbV6JT1GifxMINWmW6xewJZG4mUegS88xxSJzhf8hg24ChLvOVnMAPybvpuz
	 gpLgdCKWq4S4Dx3Eomi8CZX1jvuZIx0K+YsacmlCmaqevD9BN2hbRq5LJpsP6oVQgZ
	 jWWeCbevU2LtknBmZmf293Wyk/Ft8HLcpo86nvV+OiY4vzcXSH6Esp8dRT6S3oHQkp
	 eh7XLBVV3ZiGUfNuYUdBUotyeBvqP9E28hXu200SmJmZusHYKQXw4S7D0zshWL3qPY
	 QzdUPDQtFOkjQy/6eI3WLjZyWVzsojMWBc0tx5e0OBXPgaC+NZzW4WvUCWU8ZpLdYT
	 ZPOQInYXwFMNA==
Subject: Re: [PATCH net-next v15 6/9] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
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
Date: Sun, 27 Sep 2026 16:29:15 +0000
Message-ID: <179052655571.2160803.8220457316051367747@kernel.org>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-6-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-6-e82f33720737@oss.qualcomm.com>
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

- [Low] This patch fixes a regression added by the previous patch in the
  same series, "net: stmmac: qcom-ethqos: set serdes mode before…
- [Low] The new comment in ethqos_mac_finish_serdes() (dwmac-qcom-
  ethqos.c:638-641) says phy_mode is kept in sync "for later…

--

net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()

This patch updates ethqos->phy_mode in ethqos_mac_finish_serdes() from the
interface that phylink resolved, so later serdes_powerup() calls program
the SerDes to the correct mode. It also widens the guard in
qcom_ethqos_set_sgmii_loopback() to cover PHY_INTERFACE_MODE_SGMII. This
keeps the loopback in place on resume with a 1G SGMII link.

> ethqos->phy_mode is read by serdes_powerup() and
> qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
> wrapper for the correct interface. It is set once at probe from the DT
> phy-mode property and never updated.

[Severity: Low]
Is this a long-standing problem, or was it added earlier in this series?

As far as I can tell, serdes_powerup() only started reading phy_mode in
the preceding patch, "net: stmmac: qcom-ethqos: set serdes mode before
powerup". That patch added this to qcom_ethqos_serdes_powerup():

	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
			       ethqos->phy_mode);

Before that patch, power-up never used the stale probe-time value.

With only that patch applied, every open/resume replaces the resolved
interface held by the SerDes PHY driver (data->interface in
phy-qcom-sgmii-eth.c) with the DT mode. This stays in effect until
phylink_mac_initial_config()->ethqos_mac_finish_serdes() programs the
resolved mode again.

The commit message doesn't mention this dependency, so backporters won't
know about it. Bisection can also stop on the intermediate commit.

Both patches are in the same unmerged series, so a Fixes: tag isn't the
right fit here. Could this change be folded into "set serdes mode before
powerup", or placed before it? Could the commit message then say so?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 47b70b5e706f2..e067ceee01621 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> @@ -634,6 +635,12 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
>  
>  	qcom_ethqos_set_sgmii_loopback(ethqos, false);
>  
> +	/* The interface mode is only known once phylink has resolved it and
> +	 * may change at runtime, so keep it in sync for later
> +	 * serdes_powerup()/serdes_powerdown() calls.
> +	 */

[Severity: Low]
This isn't a bug, but is the mention of serdes_powerdown() accurate?
qcom_ethqos_serdes_powerdown() never reads ethqos->phy_mode:

static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
{
	struct qcom_ethqos *ethqos = priv;

	phy_power_off(ethqos->serdes_phy);
	phy_exit(ethqos->serdes_phy);
}

The comment also leaves out qcom_ethqos_set_sgmii_loopback(). That
function is called from ethqos_clks_config(true) on every open/resume:

	qcom_ethqos_set_sgmii_loopback(ethqos, true);
	ethqos_set_func_clk_en(ethqos);

After this patch, its loopback decision depends on this assignment,
which is why the guard had to be widened.

Would it be clearer to list serdes_powerup() and
qcom_ethqos_set_sgmii_loopback() as the readers?

> +	ethqos->phy_mode = interface;
> +
>  	if (interface == PHY_INTERFACE_MODE_SGMII ||
>  	    interface == PHY_INTERFACE_MODE_2500BASEX)
>  		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260923-qcom-sa8255p-emac-v15-0-e82f33720737%40oss.qualcomm.com

