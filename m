Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720D0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 15:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10Y+7hCgrbf+meK//NTUzvM8tflNvxw7lTAJsiQC+Sw=; b=XHSqlliFR1LriWLQS8hdgfyg4K
	q+UyHYn9VrNa32kqXXX/xFnPmQcYe7d3wTI+ogwe2wtyh2Aiwi8EO4qzOu1wHZBAsIATzoaboZHLz
	w6cdU5MgqUzAcP1ZVrYvm1eZB3pFhW5hFzxKIcpn8ouwgXOuuqeJk3KUgPAVaixhfzDaPvC9qL7ka
	Z2HUnTz6MItfOFXARVVExzR6q8kVs5qajVQizj4biPCkyWMYmD7+bbmfKuPaTt9Na5dPM98BV+FO+
	E0/SlEuCILJVBTA6TQ/vtFRE4hUHH2YJW0bwARiitysLY1EE1sRRcw08VgD/FcKdytVaynYkif5nV
	gk1uY/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2dX-000000011Ik-3NPD;
	Thu, 07 Aug 2025 15:34:35 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2WY-000000010Aq-1ysm;
	Thu, 07 Aug 2025 15:27:24 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 4A1CD1F00055;
	Thu,  7 Aug 2025 15:27:16 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 3D76DB012B1; Thu,  7 Aug 2025 15:27:14 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id E09D5B012B0;
	Thu,  7 Aug 2025 15:27:11 +0000 (UTC)
Date: Thu, 7 Aug 2025 17:27:09 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 01/22] dt-bindings: iommu: sun50i: remove resets from
 required property
Message-ID: <aJTFzQP61Kt02gOj@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-1-13b52f71fb14@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NVigExWBuOabMF3V"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-1-13b52f71fb14@linumiz.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_082722_820232_367E46BE 
X-CRM114-Status: GOOD (  18.20  )
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


--NVigExWBuOabMF3V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Parthiban,

On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
> iommu in a133/a100 does not have reset control. remove it
> from required property to make it optional.
>=20
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml |=
 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-=
iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-io=
mmu.yaml
> index a8409db4a3e3..03176f68485b 100644
> --- a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.y=
aml
> +++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.y=
aml
> @@ -42,7 +42,6 @@ required:
>    - reg
>    - interrupts
>    - clocks
> -  - resets

Since it was previously specified that other platforms do need the reset li=
ne,
the required part should be applied conditionally based on the compatible, =
not
removed entirely.

Also your commit title and message would look better with uppercase first
letters at the start of a sentence :)

All the best,

Paul

>  additionalProperties: false

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--NVigExWBuOabMF3V
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmiUxc0ACgkQhP3B6o/u
lQxePg/+I0antnSk4NZw/II2a+R7vYY846KcFkqe7Hdo6lt9AuNigC7OGCb//F4L
LW4uXEl9CXkYopR2+NyD02PK1B7Pleojfy82QoqXF9MLE4/KCDSEc73YuNxMUeVc
R1gbG4msxjFjDMCTofXCuVqFUApxag6j1H6UEgwN7+3bMWtgGIjWnyT5miP9dkYs
qXTlz9D4Z6FmfYJzGHARhwAUYnbgVFCfCsrJVgvwu33pylJufcK/i3QMy9bdM/Bh
5fYLCAAu1FVcTBqjVTHjAgSI5ZbQMzISZwxTZlKU/SEb2Mu5ua2rOMDvwvkls10X
VXyn14xdaleJuWmSOVl4tgvJ28BSR/KkSrzfjx164jP8U530L3IZGKLzAOitm/Wx
Im40uRt6IF7kFV/oQhB/SEeGaIu+e7c76NmRcDtlIXSi5nv4DH/S7r5eFQ2g9JUT
r3D9gnBKLch8e/axI1I0nL+ppzFaE8dlxCP29rCpNZQaB3UyaP0EJr6xdLmf+CpH
ZKQiXypL+YoDAA/g6h+tjIxfirJod7wz6K7iOXJQ+mD4S/NhEV4zbN+Ik3H5ucxc
jC8amc1AIaO/ozQMPweLX6Uo1+wtlN5PELms4aWobzl+PIHQ//ndLq2jlQ5rRGhT
VoLcL8+6G9omA96w1h6c/I5I6MT2AikJ8vLqD3qUi+ILP9dZ8W0=
=yKpA
-----END PGP SIGNATURE-----

--NVigExWBuOabMF3V--

