Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5754CC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFIlhKUzEOuQHbZEQC0lKg9ZMLPMih7Wyfel8ewcFu4=; b=gKiWZZA4Bg1nCDJhrANdnJuaxh
	Is0TeypZDN6NyjdPCiWkFqmHpJqDDPceYthn52x/+LzJZMUSFCl1BVR86GHqjawys2B0llV3VR1ZZ
	OqiMFFwf5DTDMNRJ7sepdMnudmy1lmK11xTRyVUwky/w7Q+f5EFCoiCNnIR4P1a4DoZ9m/GIY8/VP
	bZs0xkc4aVutKWIMYUSzQ/UlWJf93S9TVszH0ymFITup2dbJA4vAYxEt3YJTuZBUqwpGncur9aLmJ
	CUjkBBtoR3S5DdU+wy4HVGvwFM3dAlm4rg2iFUe70DCSBLZnn+z4Zv5ElImFD1QE5/KhV6DHLS4H8
	yjKzRPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxxb-00000000Gc9-1KQb;
	Tue, 25 Feb 2025 16:39:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvP3-0000000HRMo-41Mb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:55:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmvP0-0003K8-TI; Tue, 25 Feb 2025 14:55:14 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmvP0-002mjO-1D;
	Tue, 25 Feb 2025 14:55:14 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmvP0-0009vz-0s;
	Tue, 25 Feb 2025 14:55:14 +0100
Message-ID: <460ce86a847cb13e6e51cf0c89a65602e0080e67.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org,
 krzk+dt@kernel.org,  shawnguo@kernel.org, mathieu.poirier@linaro.org,
 conor+dt@kernel.org,  s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
 andersson@kernel.org, Frank.Li@nxp.com, peng.fan@nxp.com, 
 laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Date: Tue, 25 Feb 2025 14:55:14 +0100
In-Reply-To: <CAEnQRZBL+r2-CRDszK54SD_8E9=1QRKRj3_YDHsM7YetKMcs_w@mail.gmail.com>
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
	 <20250225102005.408773-3-daniel.baluta@nxp.com>
	 <78e60d723c27b7fa0f03bc6a74f6ad37d6508734.camel@pengutronix.de>
	 <CAEnQRZBL+r2-CRDszK54SD_8E9=1QRKRj3_YDHsM7YetKMcs_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_055518_001227_466236AE 
X-CRM114-Status: GOOD (  26.46  )
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

Hi Daniel,

On Di, 2025-02-25 at 15:41 +0200, Daniel Baluta wrote:
> Hello Philipp,
>=20
> Thanks for your comments!
>=20
> > The DAP core reset is mentioned in the commit message. Why is it
> > missing here? After reading the discussion in [1], I'd expect both the
> > stall and the (core) reset signal to be documented, something like:
>=20
> There is no reset controller driver for DAP area yet.

This is about the device tree bindings, not the driver. Even if the
driver maps DAP address space with a hard-coded address, ...

> We manipulate the bits directly by remapping the DAP address space
> inside remoteproc driver.

... which it should not, the bindings could already correctly describe
the core reset.

I'd just like to make sure that there will be no confusion about the
stall "reset" signal, and adding a reset-names property would be an
easy way to do it.

> See for example: drivers/remoteproc/imx_dsp_rproc.c
>=20
> /* Reset function for DSP on i.MX8MP */
> static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> {
> =C2=BB       void __iomem *dap =3D ioremap_wc(IMX8M_DAP_DEBUG,
> IMX8M_DAP_DEBUG_SIZE);
> =C2=BB       int pwrctl;
>=20
> =C2=BB       /* Put DSP into reset and stall */
> =C2=BB       pwrctl =3D readl(dap + IMX8M_DAP_PWRCTL);
> =C2=BB       pwrctl |=3D IMX8M_PWRCTL_CORERESET;
> =C2=BB       writel(pwrctl, dap + IMX8M_DAP_PWRCTL);
>=20
>=20
> If we agree that this is the right way to go, the next step would be
> to create a new reset controller driver for DAP area.
>
> I want to keep this as a follow up patch in order to not compilate
> this patch series even more.

I have no issues with adding a reset driver for the DAP region and
hooking it up to the DSP driver in a separate series, but the device
tree bindings could be correct from the start.

> > Is there nothing else in this range that will have to be controlled by
> > the DSP driver in the future, such as the IMPWIRE register or the
> > XOCDMODE[OCDHALTONRESET] bit?
>=20
> We are internally running SOF for couple of years now and we didn't
> need any of these bits.

Ok.

regards
Philipp

