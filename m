Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6841ED13C09
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gfsrjq9NOABKFprxCcRQhHSSHcslbxFVtzSf5iYy7Sg=; b=qJjcw8/TBaMYiPxNoS7J3V8xix
	6z+XWnnV6iV6vYrACjFLzwhGJYvaCaE5HcImbBuXKEeoY2Jbl4oTgDBiYYN21LX3csX3dx0fKWDEn
	hDQqtKYumMw2IZcmnyNqaviTxAxxn79xEEYpIG+5bH8j6re0DUigu6Qxh0I9apxr3H0nrJqG1flHy
	HnrtPram6ycvbKMzzCcRUSqMYa4Bt+sGZh7MvocSDn6LL/XaoxGqn64SU8sWIBRki+8dn8Ot4wGL5
	bMKS0mD/i90ehLOomVE0NTDQuCcIoDH82CT2chb4kwyS5mZVZceiBXTmkt8LAs+TzdX+bIZSZqXED
	AkB4NvfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMNO-0000000Cb3b-2mnt;
	Mon, 26 Jan 2026 13:11:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMNM-0000000Cb2w-2bGQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:11:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vkMNA-0001ii-9C; Mon, 26 Jan 2026 14:11:16 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vkMNA-002aPy-1F;
	Mon, 26 Jan 2026 14:11:15 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vkMN9-000000009mq-2b88;
	Mon, 26 Jan 2026 14:11:15 +0100
Message-ID: <69592713b7bd419e23df458734ca78070a83e8ac.camel@pengutronix.de>
Subject: Re: [PATCH 2/4] phy: s32g: Add serdes subsystem phy
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Vincent Guittot <vincent.guittot@linaro.org>, vkoul@kernel.org, 
	neil.armstrong@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ciprianmarian.costea@oss.nxp.com, s32@nxp.com, linux@armlinux.org.uk, 
	ghennadi.procopciuc@nxp.com, bogdan-gabriel.roman@nxp.com,
 Ionut.Vicovan@nxp.com, 	alexandru-catalin.ionita@nxp.com,
 linux-phy@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Frank.li@nxp.com
Date: Mon, 26 Jan 2026 14:11:15 +0100
In-Reply-To: <20260126092159.815968-3-vincent.guittot@linaro.org>
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
	 <20260126092159.815968-3-vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_051128_654206_92EC1BD1 
X-CRM114-Status: GOOD (  13.61  )
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

On Mo, 2026-01-26 at 10:21 +0100, Vincent Guittot wrote:
> s32g SoC family includes 2 serdes subsystems which are made of one PCIe
> controller, 2 XPCS and one Phy. The Phy got 2 lanes that can be configure
> to output PCIe lanes and/or SGMII.
>=20
> Implement PCIe phy support
>=20
> Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Co-developed-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.c=
om>
> Signed-off-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com=
>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Co-developed-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  drivers/phy/freescale/Kconfig               |   9 +
>  drivers/phy/freescale/Makefile              |   1 +
>  drivers/phy/freescale/phy-nxp-s32g-serdes.c | 569 ++++++++++++++++++++
>  3 files changed, 579 insertions(+)
>  create mode 100644 drivers/phy/freescale/phy-nxp-s32g-serdes.c
>=20
[...]
> diff --git a/drivers/phy/freescale/phy-nxp-s32g-serdes.c b/drivers/phy/fr=
eescale/phy-nxp-s32g-serdes.c
> new file mode 100644
> index 000000000000..8336c868c8dc
> --- /dev/null
> +++ b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
> @@ -0,0 +1,569 @@
[...]
> +static int s32g_serdes_get_ctrl_resources(struct platform_device *pdev, =
struct s32g_serdes *serdes)
> +{
[...]
> +	ctrl->rst =3D devm_reset_control_get(dev, "serdes");

Please use devm_reset_control_get_exclusive() directly.

[...]
> +static int s32g_serdes_get_pcie_resources(struct platform_device *pdev, =
struct s32g_serdes *serdes)
> +{
[...]
> +	pcie->rst =3D devm_reset_control_get(dev, "pcie");

Same here.

regards
Philipp

