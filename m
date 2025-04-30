Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4D0C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPJRIRjIVSNpyQoQChOyubUqA46qURdU/3MhDLyhuMA=; b=fVAhchq8wL1jJ6sRe6OCgNNUEX
	w99UZDMMP7AInAW6+2dCBiMp2JvvhNy5nI25yF0uQI70E+r8J4Cl63wxUqagI+9ufqbNiCKnqjm0e
	q5GMmXze/UuB0gOaxD4Vo/5HpTqJf3z/WqwTCTw5izBNWLPDJd/uRz/eTrWbTZ9u4xz+nDWBO+jQC
	FeRUwH3h3Ra8eRnQsdAun9Vj/gxCWvTJHxxfMOLURbjbmtZqDCOPc3Q9ykHPq1REo0EdBd//2MOql
	WCtrL6wihr31mROtchubhzPjwgs9LDteQsjxu4Kozze9qsPcRd5gxZtQ0GVxS+v3HsKmt8XUzx7wV
	kIqAySzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4WP-0000000CVKJ-0bjg;
	Wed, 30 Apr 2025 10:18:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3yB-0000000CPjn-463r;
	Wed, 30 Apr 2025 09:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WPJRIRjIVSNpyQoQChOyubUqA46qURdU/3MhDLyhuMA=; b=iH2jCh3nF+5D+w/4JTWbSM4goC
	lDV6IqfGiig3EW29GLuNMI/wtYevpDoGkmc7pXJAqXOnViyXgnfPvxfXtgHxJ1zl3ToRmZNI4KJAU
	9YyDvRoFtfrcsmp3oq45MS1YWgbbDFkD/in20lJijdwbny+0LQUbYG+4DIb2rd4CL1QLuEkmZ5Efz
	8mRi0pY6pHLbfU8GqGt/41ijHDGtSgAw6ll6+ejoJSsOWWFeg3gxoW1YLz1dMFWIJSfUYQovTu62X
	HxZaVwvNP6dLxhcEzFqccpEHKHWK5N6N87OjzRSO6LMWeVM0CyQiLYOW0XNWCpzU6YXz0JISLmY4H
	ZgCPZIhw==;
Received: from i53875ba4.versanet.de ([83.135.91.164] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uA3xi-0004AU-M6; Wed, 30 Apr 2025 11:42:42 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, michael.riesch@collabora.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Michael Riesch <michael.riesch@collabora.com>
Subject: Re: [PATCH v6 01/13] Documentation: admin-guide: media: add rockchip camera
 interface
Date: Wed, 30 Apr 2025 11:42:41 +0200
Message-ID: <1833589.VLH7GnMWUR@diego>
In-Reply-To: <20240220-rk3568-vicap-v6-1-d2f5fbee1551@collabora.com>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-1-d2f5fbee1551@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_024312_009141_8FCEFBAF 
X-CRM114-Status: GOOD (  28.19  )
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

Hey Michael,

Am Mittwoch, 30. April 2025, 11:15:50 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Michael Riesch via B4 Relay:
> From: Michael Riesch <michael.riesch@collabora.com>
>=20
> Add a document that describes the different variants of the Rockchip
> Camera Interface (CIF), their hardware layout, as well as their
> representation in the media controller centric rkcif device driver,
> which is located under drivers/media/platform/rockchip/rkcif.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

> diff --git a/Documentation/admin-guide/media/rkcif.rst b/Documentation/ad=
min-guide/media/rkcif.rst
> new file mode 100644
> index 000000000000..f35f644a54a0
> --- /dev/null
> +++ b/Documentation/admin-guide/media/rkcif.rst
> @@ -0,0 +1,83 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Rockchip Camera Interface (CIF)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs in
> +different variants.
> +The different variants are combinations of common building blocks, such =
as
> +
> +* INTERFACE blocks of different types, namely
> +
> +  * the Digital Video Port (DVP, a parallel data interface)
> +  * the interface block for the MIPI CSI-2 receiver
> +
> +* CROP units
> +
> +* MIPI CSI-2 receiver (not available on all variants): This unit is refe=
rred
> +  to as MIPI CSI HOST in the Rockchip documentation.
> +  Technically, it is a separate hardware block, but it is strongly coupl=
ed to
> +  the CIF and therefore included here.
> +
> +* MUX units (not available on all variants) that pass the video data to =
an
> +  image signal processor (ISP)
> +
> +* SCALE units (not available on all variants)
> +
> +* DMA engines that transfer video data into system memory using a
> +  double-buffering mechanism called ping-pong mode
> +
> +* Support for four streams per INTERFACE block (not available on all
> +  variants), e.g., for MIPI CSI-2 Virtual Channels (VCs)
> +
> +This document describes the different variants of the CIF, their hardware
> +layout, as well as their representation in the media controller centric =
rkcif
> +device driver, which is located under drivers/media/platform/rockchip/rk=
cif.
> +
> +Variants
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Rockchip PX30 Video Input Processor (VIP)
> +-----------------------------------------
> +
> +The PX30 Video Input Processor (VIP) features a digital video port that =
accepts
> +parallel video data or BT.656.
> +Since these protocols do not feature multiple streams, the VIP has one D=
MA
> +engine that transfers the input video data into system memory.
> +
> +The rkcif driver represents this hardware variant by exposing one V4L2 s=
ubdevice
> +(the DVP INTERFACE/CROP block) and one V4L2 device (the DVP DMA engine).
> +
> +Rockchip RK3568 Video Capture (VICAP)
> +-------------------------------------
> +
> +The RK3568 Video Capture (VICAP) unit features a digital video port and =
a MIPI
> +CSI-2 receiver that can receive video data independently.
> +The DVP accepts parallel video data, BT.656 and BT.1120.
> +Since the BT.1120 protocol may feature more than one stream, the RK3568 =
VICAP
> +DVP features four DMA engines that can capture different streams.
> +Similarly, the RK3568 VICAP MIPI CSI-2 receiver features four DMA engine=
s to
> +handle different Virtual Channels (VCs).
> +
> +The rkcif driver represents this hardware variant by exposing up to thre=
e V4L2
> +subdevices:
> +
> +* rkcif-dvp0: INTERFACE/CROP block for the DVP
> +* rockchip-mipi-csi fdfb0000.csi: MIPI CSI-2 receiver
> +* rkcif-mipi0: INTERFACE/CROP block for the MIPI CSI-2 receiver
> +
> +and up to five V4L2 devices:
> +
> +* rkcif-dvp0-id0: The support for multiple streams on the DVP is not yet
> +  implemented, as it is hard to find test hardware. Thus, this video dev=
ice
> +  represents the first DMA engine of the RK3568 DVP.
> +* rkcif-mipi0-id[0...3]: The four DMA engines of the RK3568 MIPI CSI-2
> +  receiver. Each DMA engine can capture a certain MIPI CSI-2 Virtual Cha=
nnel.
> +
> +.. kernel-figure:: rkcif-rk3568-vicap.dot
> +    :alt:   Topology of the RK3568 Video Capture (VICAP) unit
> +    :align: center

in patch 6 you already have a block stating

	Finally, the RK3588 VICAP unit constitutes an essential piece of the
	camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
	units, and a data path multiplexer (to scaler units, to ISP, ...).

so the rk3588 seems to be on the table "soonish" ;-) .
So maybe also already include it here in the description already, if there
is a next version, and your investigation is already that far along?

Otherwise a really nice (and concise) read, and made me understand the
setup somewhat nicely.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



