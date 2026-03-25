Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD68109C05D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 21:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9QX/7zuW4PRdWvukdv95Pz7/SCg2+VZ38fqrKFSMfk=; b=FF50BszyCC3Mzq/FwM8AcL4t/I
	98u7zYcSY9d1FXZ6VHuwNxOtbo58wg7ncnDad4T0b0TqtKcMcdNpY/bez8VgitlMOUkQ+Wzqu0yIW
	85EoySW/YQvLHBSVn7OgOHlcsQ45CvZCNAoJpxrLhJZ1PcUbdpBwipWQ4DWjMV2s3wQfcO+diaLXO
	Oyu4qLURAclVrKTwfNu474YvH5ml+MtXsnFGD1GBdl/TyRnSrnR/qp5cwaVAJ8mZmL94C7SNEOkVM
	QNFiQXsmyaJaI7clcww0n7N/bYmDtsyELAKpcFjTLclLvhGZb/Ap2EG8MauB/eARrEOfQmiBJT2Wf
	veJEY0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5VUc-00000004Ft6-3N9d;
	Wed, 25 Mar 2026 21:10:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5VUZ-00000004FsM-3Vw6;
	Wed, 25 Mar 2026 21:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/9QX/7zuW4PRdWvukdv95Pz7/SCg2+VZ38fqrKFSMfk=; b=MwzbQSsu1iD88gkB3IH1zeZiIR
	KqZ0nyf0GKrdHH0VKi7UtAwIR8Lo/PcRwkIg9KR07u74bQOTES45rI9JMbopS+J2PF6wAoznrEGt6
	cv+cD36+oFV4fnMEsbXqQ/fMekGhiWQW0TEGXE3IGmaU2FgBkQRhpbgPuOQObWEbHTKtb0PXZIOzm
	Sfch0xoiZJ0LtuZesc8ncS0J3Oc9hwiwrx1y7+KGNpck0OxH0DfKS8HbczaRJFrgNCX255DaceQyA
	Rv5kUxT3Tzv9fc1ZbUUgu2okVyMGDHfLxEf49X1a6px/CP6wELl7p/8VpXdP/TEcKp1mT7W8oNeDt
	mj7p7fVA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52710)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5VU9-000000003vl-1BWv;
	Wed, 25 Mar 2026 21:09:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5VU4-000000006NG-0Nnm;
	Wed, 25 Mar 2026 21:09:48 +0000
Date: Wed, 25 Mar 2026 21:09:47 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v9 6/6] net: stmmac: qcom-ethqos: add support
 for sa8255p
Message-ID: <acRPGxx_KbrvUh6t@shell.armlinux.org.uk>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
 <20260316-qcom-sa8255p-emac-v9-6-c58934e76ff2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-6-c58934e76ff2@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_141019_880612_20D7BAFE 
X-CRM114-Status: GOOD (  26.31  )
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

On Mon, Mar 16, 2026 at 01:05:11PM +0100, Bartosz Golaszewski wrote:
> Extend the driver to support a new model - sa8255p. Unlike the
> previously supported variants, this one's power management is done in
> the firmware using SCMI. This is modeled in linux using power domains so
> add support for them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Shouldn't the SerDes driver be doing the power management rather than
the ethernet driver?

We already have the crappy situation with this driver that the stmmac
clocks are not running when they need to be, which is now causing
warnings with the VLAN code. The platform glue driver itself doesn't
_actually_ have enough information on its own to know when it needs
to ensure that the PCS and SerDes need to be operational which is what
is leading to this problem.

Also note that the core stmmac driver does runtime PM management which
covers both the stmmac MDIO block and the core MAC as well. How does
your implementation interact with those, when e.g. a MDIO bus on one
stmmac instance could be used to access a PHY on a different instance.

> +struct ethqos_emac_pd_ctx {
> +	struct dev_pm_domain_list *pd_list;
> +	int serdes_level;

I don't think serdes_level is appropriate nor correct (see below.)

> +static void ethqos_configure_sgmii_pd(struct qcom_ethqos *ethqos,
> +				      phy_interface_t interface, int speed)
> +{
> +	switch (speed) {
> +	case SPEED_2500:
> +	case SPEED_1000:
> +	case SPEED_100:
> +	case SPEED_10:
> +		ethqos->pd.serdes_level = speed;

This is called at mac_link_up(), after mac_finish() has done its
stuff...

> +	}
> +
> +	ethqos_configure_sgmii(ethqos, interface, speed);
> +}
> +
>  static void ethqos_configure(struct qcom_ethqos *ethqos,
>  			     phy_interface_t interface, int speed)
>  {
> @@ -710,6 +785,45 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
>  	return ret;
>  }
>  
> +static int ethqos_mac_finish_serdes_pd(struct net_device *ndev, void *priv,
> +				       unsigned int mode,
> +				       phy_interface_t interface)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +	int ret = 0;
> +
> +	qcom_ethqos_set_sgmii_loopback(ethqos, false);
> +
> +	if (interface == PHY_INTERFACE_MODE_SGMII ||
> +	    interface == PHY_INTERFACE_MODE_2500BASEX)
> +		ret = dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);

... which means this won't get called with anything but a stale speed
from the _previous_ link up event.

> +
> +	return ret;
> +}
> +
> +static int qcom_ethqos_pd_serdes_powerup(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +	int ret;
> +
> +	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
> +	if (ret < 0)
> +		return ret;
> +
> +	return dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);

and same here.

The fundamental question arises - why does the power domain need to know
the _media_ speed (which is completely unrelated to the speed at which
the SerDes link operates at) ?

For example, with SGMII, the link operates at 1.25GBaud irrespective of
whether it is operating at an underlying Ethernet data rate of 10M, 100M
or 1G speeds.

To me, the whole "serdes_level" stuff looks completely wrong.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

