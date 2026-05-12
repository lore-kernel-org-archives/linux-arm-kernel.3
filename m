Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C257ECD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8p2kpdkft2Ua1doPk30sxoaxUJf132dfboWLlXI3eXE=; b=PYEtVcrPSUK/AH1C48QTczzPJz
	zuo+HLSusucl2/8ZmAIK/0MHkhiYb8IPHDYx1Z71b0UiIk1lnj/Hcw49YGv8H3v70qu4xBmcAUK1O
	puWeLTEnkqnoYEcbh9q+C5Lp6joOpLkVQl1IVCqmWH8uCcJBdLU/CvrWO1uraT51uHPEldxhbRlG0
	eA0UnZxweB6iFvHhY0caFqm9+xZPscWa+6F9vXsxREqSs6kKtQwPuo5HV/Ap21QfK+Xd0LW5nL6EG
	UTPwklQGp65/KbSqkPMQzcJsu6n//m0mEm5R0a9yRCvoCxB+K6nuiUJXqp6SvkbkVH+wGGErBtDL0
	7bCHJjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wModR-0000000H9AV-3s3o;
	Tue, 12 May 2026 15:03:01 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wModO-0000000H99G-3jAe;
	Tue, 12 May 2026 15:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=8p2kpdkft2Ua1doPk30sxoaxUJf132dfboWLlXI3eXE=; b=c3Oa7xSTaKbW8yfu2Yp976W2ju
	xsglxIIyqsElVUGscyMaw/USnpJ8XbS8gIb8NaJSfJPjIlW7ncFLPYpMXkIOEMUiVV1noObcnuchK
	FtrGIV58i+QrjXdbnhs8vduyPznPwkE5aRa+nuGsL7/MYAdDWFqmbkvUL3gqgZn+zBV9Qo/AHrHHv
	7cIB6WdullGWwrfaoPJsnpFZvmYqNToSQhISSyk9W4GPl/Og0NX3+V4vy/XhtRDICnnwS+AeoKni0
	Hvtr0klEluHYdr+jPjuX2tacnh47+5z+1yquJQ66/iX0YuaRZOySYS7MJ0ADtBn5fLbHoWAM67FwZ
	3kGUJIpA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wModA-000N4T-29;
	Tue, 12 May 2026 17:02:44 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wModA-000E7A-2F;
	Tue, 12 May 2026 17:02:44 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Michael Riesch <michael.riesch@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] media: synopsys: Add imx93 support
Date: Tue, 12 May 2026 17:02:42 +0200
Message-ID: <5993213.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27998/Tue May 12 08:24:57 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_080259_039304_1CA716D5 
X-CRM114-Status: GOOD (  17.93  )
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

Hi Frank,

Am Montag, 16. Februar 2026, 20:18:38 CEST schrieb Frank Li:
> This 3rd time try to support DW CSI2RX support for imx93.
>=20
> 1st: Create new dw csi2 driver
> https://lore.kernel.org/all/20250701-95_cam-v1-5-c5172bab387b@nxp.com/
>=20
> 2nd: Based on legacy imx6's DW CSI2 constroller.
> https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/
>=20
> Now rockchip create a common DW CSI2RX driver at
> drivers/media/platform/synopsys/dw-mipi-csi2rx.c
>=20
> This time base on rockchip's implement.
>=20
> i.MX93's version is newer than rockchip one. i.MX6's is more similar with
> rockchips.
>=20
> But i.MX6 is too old. So start at i.MX93 firstly even it has bigger
> difference.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I'm trying to give this a try. Did you actually manage to run a CSI pipelin=
e?
What did you do for the D-PHY driver? (please refer to csi2->phy =3D devm_p=
hy_get(dev, NULL);)

Best regards,
Alexander

> ---
> Changes in v3:
> - use dw_mipi_csi2rx_has_reg().
> - detail change see each patches's change log
> - Link to v2: https://lore.kernel.org/r/20260213-imx93-dw-csi2-v2-0-8be60=
39f44c6@nxp.com
>=20
> Changes in v2:
> - use enum and array map to real register offset.
> - Please keep the order:
>  - #includes
>  - #defines
>  - enum and struct definitions
>  - the rest
> - detail change see each patches's change log
> - Link to v1: https://lore.kernel.org/r/20260210-imx93-dw-csi2-v1-0-69667=
bb86bfa@nxp.com
>=20
> ---
> Frank Li (6):
>       media: synopsys: csi2rx: use devm_reset_control_get_optional_exclus=
ive()
>       media: synopsys: csi2rx: only check errors from devm_clk_bulk_get_a=
ll()
>       media: synopsys: csi2rx: implement .get_frame_desc() callback
>       media: synopsys: csi2rx: Use enum and u32 array for register offsets
>       media: dt-bindings: add NXP i.MX93 compatible string
>       media: synopsys: csi2rx: add i.MX93 support
>=20
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  47 +++-
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 278 +++++++++++++++=
++++--
>  2 files changed, 303 insertions(+), 22 deletions(-)
> ---
> base-commit: ada3fa02f7a95623b724dfe300fce6f49cc2d75a
> change-id: 20260128-imx93-dw-csi2-b472ddcb176a
>=20
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



