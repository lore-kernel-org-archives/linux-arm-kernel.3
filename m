Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBAA6083638
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LlyaK/Dg;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PkZdU3xL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RgMfHtQfX+v2Ee7n7QJ9yHGqz356fJRC9YMgowZV0Hc=; b=LlyaK/DgwZKOGu
	MJda2Sh9Bka58KNunKSsAOL9RUJwIu2OeUpuc17Pou+ctp3n+dr9Mn/NgsfFwQd+oAPrBBmdY5aPE
	WZT+6BEYX7BiKCZMDfNCLt1JPugTtO3TWKx9CyuTsqUk/6SKKz+GomxefmdP2iqlB0UtbL2rZsyJO
	BIVP6lK9SVgpHgehkpBLJP9ACPItTYeC3Ro4hobICx2+htyb9DpDNTfe3AWPEobIQSobDByGcqdB9
	5WWttbEuZ9/LiVaJ/X5Qw+C/RGWtieCO/7zB3NFTM/xdpE1iIOR7drpPVfYD5L4rm13E3UuL4RRvb
	JKyBMuMYJQvSZsjwaxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeBw-000000066YQ-49IT;
	Wed, 04 Nov 2026 16:50:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeBt-000000066QL-1AMS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:50:27 +0000
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF5A4175;
	Wed,  4 Nov 2026 17:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793810883;
	bh=OKJRnRv1W357X1nFZqikOtPnYU0npjJNQOHsHy8nJzE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PkZdU3xLwbvoIPjM9WMZax2YEuaSJX0u+E1Sx4IzoksPwQ40pKVfje4W9cua4o1R6
	 7DbTW3QlLXOOStVtr4sU7X/9+b0xUEG64dX7vkkp87qDzedJRPMEDVgKj2BPBwZN/H
	 Fyi+bhLkuj3SZwauQkoBeVvN0g5s7msEQOlyNTFg=
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261102211549.1011388-1-t-lannynd@ti.com>
References: <20261102211549.1011388-1-t-lannynd@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62x-sk: Add orientation to IMX219 sensor node
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: b-brnich@ti.com, praneeth@ti.com, r-donadkar@ti.com, devarsht@ti.com, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Thorsten Lannynd <t-lannynd@ti.com>, linux-arm-kernel@lists.infradead.org
Date: Wed, 04 Nov 2026 16:50:18 +0000
Message-ID: <179381101896.194410.4650216012053782559@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_085025_501023_E905D12D 
X-CRM114-Status: GOOD (  11.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thorsten,


Quoting Thorsten Lannynd (2026-11-02 21:15:49)
> The IMX219 CSI2 expansion module is externally attached. Without the
> orientation property, V4L2_CID_CAMERA_ORIENTATION (0x009a0922) is not
> exposed and libcamera fails with:
>=20
>   ERROR CameraSensor camera_sensor_raw.cpp:465 'imx219 4-0010':
>   Mandatory V4L2 control 0x009a0922 not available
>=20
> Set orientation =3D <2> (V4L2_CAMERA_ORIENTATION_EXTERNAL) to fix this.
>=20
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/a=
rm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> index 149c59c07182..829ed98345dd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso

#include <dt-bindings/media/video-interface-devices.h>

> @@ -72,6 +72,7 @@ ov5640: camera@10 {
>                                 VDDL-supply =3D <&reg_1p2v>;
> =20
>                                 reset-gpios =3D <&exp1 13 GPIO_ACTIVE_HIG=
H>;
> +                               orientation =3D <2>;

and then you can do:

				orientation =3D <MEDIA_ORIENTATION_EXTERNAL>;

--
Kieran


> =20
>                                 port {
>                                         csi2_cam0: endpoint {
> --=20
> 2.34.1
>

