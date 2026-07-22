Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC43C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0DOZ6IJ9ra0/dlBSWtiIdXa1p1W7GVECGzod3oAz00=; b=LOsBmPAcnlgpYPesdzO3McKmm+
	SE/AmkQ89ClK5OXxdniZ9zg254l4Hxx/pdYwuCVu8odeIbU4xcqb+n74zSp4fXYq4TSnf/FBABJ+R
	plwcPCcBJGECRiYRDGYUSQRqMkNVjoTtRMeIUxo7iDn4iS3qJCxPoQCL4U/jpVHej87FeceUbV6J/
	XppSbPEyZ9k1euAPwEptzzxvdaAVgt5HM2ArTnhD3rdeT+IzC11WwhivSycPV5IrySdhH26RtcS0s
	fmzGHV58JYRvHCimp7zd8gdBWY6zKlVujtqHyMrkcvxzfO3pu+SQZKxv9ysy8I3e1FPo8sx2mnoHu
	FVXePm/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmReB-0000000B8tx-0fQ0;
	Wed, 22 Jul 2026 07:45:43 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRe7-0000000B8tM-3wwC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784706337;
	bh=F0DOZ6IJ9ra0/dlBSWtiIdXa1p1W7GVECGzod3oAz00=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dGfWOxgQM8b6nirRFWRn9PTfUHrA5xIHQZBzIx9qrKgUwiomGtO1iWJ5XwL/JnDo1
	 jg7gjWJfkrUEqXd+2QnhKu8NO1p0ScMontpwibmhx3uTJxzeX+7zwbep6nJZbI9OSx
	 IPO3D0OyTjPs0o7+u/wU6oWLtvSOMfT0xw1pIx0hmHI2tXwJs7xeWkHCz6wtiGehrB
	 E5gCcMaQlYKxVUNZexGGUlPH9+Pp0sQe0kc2jGVhkUPyoA/LH8GgzCtEeCC91xfHjU
	 wIWGUI6OT38gJReLxhRh7NP12NFcRRhypHRQtODNP/yEJI/zK6mu1eNCfwRMlGSyop
	 nQrVYOTMewLAg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 424E8662E1;
	Wed, 22 Jul 2026 15:45:37 +0800 (AWST)
Message-ID: <b707f061cbdfe52f8d72ccd33ec177113e20a5e5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Huang <jackyhuang@nvidia.com>, joel@jms.id.au, robh@kernel.org, 
	krzysztof.kozlowski@oss.qualcomm.com, conor+dt@kernel.org, andrew@lunn.ch
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Date: Wed, 22 Jul 2026 17:15:36 +0930
In-Reply-To: <20260710054849.3178747-3-jackyhuang@nvidia.com>
References: <20260710054849.3178747-1-jackyhuang@nvidia.com>
	 <20260710054849.3178747-3-jackyhuang@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_004540_213780_B0517488 
X-CRM114-Status: GOOD (  12.07  )
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

Hi Jacky,

On Fri, 2026-07-10 at 14:46 +0900, Jacky Huang wrote:
> Add the device tree for the Aspeed AST2600 BMC for NVIDIA's Vera
> Rubin NVL compute platform.
>=20
> MAC0 uses phy-mode =3D "rgmii-id" because the on-board PHY supplies
> both RGMII internal delays.=C2=A0 The matching U-Boot device tree does no=
t
> enable SoC-side MAC clock delays, leaving the MAC internal delay at
> zero so the PHY-provided delay is not doubled by the MAC controller.
>=20
> The corresponding U-Boot change has been submitted to openbmc/u-boot:
> Link: https://lore.kernel.org/all/20260629105202.1417679-1-jackyhuang@nvi=
dia.com/
>=20
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
> v3: reword the &mac0 comment per Andrew Lunn's feedback.
>=20
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts=C2=A0=C2=A0 | 901 +++++=
+++++++++++++
> =C2=A02 files changed, 902 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nv=
l-bmc.dts

We now have scripts/dtc/dt-check-style, and going forward I'm asking
that all new devicetree submissions pass in strict mode.

Currently:

   $ ../scripts/dtc/dt-check-style --mode strict ../arch/arm/boot/dts/aspee=
d/aspeed-bmc-nvidia-vr-nvl-bmc.dts 2>&1 | wc -l
   152

Can you please address those?

Andrew

