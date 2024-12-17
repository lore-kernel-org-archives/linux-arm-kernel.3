Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CDAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YiXq7fc9Q9zmCNDLExrP7wuxZy1F4oDTGtqOrwXHJE=; b=ZepaBTq+HfgjxV+JRI3lw9Jm+M
	eXIzisTGspKLxhUyWwf2L1CNXi/tU/taE3vCvW+l38e+WljouF2Qx/2Uy611Wdcj0N1W4Hg6XXlFJ
	npKeBUZ7LvyCpV/cC+GSoNc26G7rWURoVoWKEq1HGK8jrPsbLZaQX9HUipPpisefaRvqk5s5d4qjC
	n0vHnzBwQYyToAt9RlfOoYZYNinuCXXIXw7ArZR082xqXng8kQDG513uJ4LpuEH135dz/a/g56QXS
	2/DXaeYIh15j8scKiOK5gk9nleqXaXyCLgebqxwXQl8UCyBaNYUWpyqqwloW3x6GSzsb5BSrcJvtL
	L67gAHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRr6-0000000CYTe-0D65;
	Tue, 17 Dec 2024 07:18:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRXY-0000000CV9p-0sSM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 06:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4YiXq7fc9Q9zmCNDLExrP7wuxZy1F4oDTGtqOrwXHJE=; b=b0W82RMpLEjZ25Icq9gvkkdSB+
	udIrwqox/v6gPA8h7DvLD+Ol5B0xreXaifVLenKvx7KnNnOBg9RnXWODcXiJa0Xjh+zQ08vCGECrX
	DGVSHKWc32I43vQfvUT87BO8y6S41mosq5kGHujMLJNxM2Qbwn2JPXN3zMBUnxrFiLLWrl/Nh+Y6M
	9KlAQgeyYoprSmdZrEnPPZvEuLTCy8FmgWOGHt650NLpgdIRUoXEtcFVuXdJc9/NiIB44/qayeOv+
	V9dQHugYdA+RyEXAhAGfBvBzgHqAA7E18zC3vOgJWQKFbZDF9jFKMnisbxzHcOx/XKe/8uIQ08DUX
	+TR/VH6Q==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRXV-00000005PXC-0qMw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:58:43 +0000
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63E9C59D;
	Tue, 17 Dec 2024 07:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734418364;
	bh=V5v0lNkKk40IY3Gj/m4+uJf5hLK5Tg98NdjWvK4g80w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=g9fCuMypy6JIfUqCZbRSUybDYo3BHTvj2P8c7ZXWnuSKJj2M/DZFhva5EY2QvSHeP
	 PBv+49c0VSirMFSg14kjsRpoMzev3V8wrAJ9RyVMsanxh/+uSSDdPyVlZ/82xOPXwP
	 I/a3EBQ+TMgKpKj4sREqzaRSH1wX09EJ6zYKcsM0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241217032821.1712916-1-david@ixit.cz>
References: <20241217032821.1712916-1-david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: media: imx283: Describe sensor address using the reg property
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Umang Jain <umang.jain@ideasonboard.com>
Date: Tue, 17 Dec 2024 06:53:18 +0000
Message-ID: <173441839809.2983864.13556053856142193864@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_065841_302837_93C8CC0B 
X-CRM114-Status: GOOD (  12.22  )
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

Quoting David Heidelberg (2024-12-17 03:28:17)
> Use the reg property instead of text in the description.
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/i2c/sony,imx283.yaml         | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml=
 ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
> index e4f49f1435a5..f4ee991c89a3 100644
> --- ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
> +++ ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
> @@ -13,16 +13,15 @@ maintainers:
> =20
>  description:
>    IMX283 sensor is a Sony CMOS active pixel digital image sensor with an=
 active
> -  array size of 5472H x 3648V. It is programmable through I2C interface.=
 The
> -  I2C client address is fixed to 0x1a as per sensor data sheet. Image da=
ta is
> -  sent through MIPI CSI-2.
> +  array size of 5472H x 3648V. It is programmable through I2C interface.
> +  Image data is sent through MIPI CSI-2.
> =20
>  properties:
>    compatible:
>      const: sony,imx283
> =20
>    reg:
> -    maxItems: 1
> +    const: 0x1a
> =20
>    clocks:
>      description: Clock frequency from 6 to 24 MHz.
> --=20
> 2.45.2
>

