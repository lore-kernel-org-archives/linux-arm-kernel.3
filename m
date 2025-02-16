Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85ECC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rt5BxxZTV58xNDbNgF1327IOm+eImblrMkl1NBTJjbU=; b=elmdX6mnXoXFmuF58V4ClNVPF9
	3pPOJzODbMVmn6axGcv3KcqhZakDND1zTDZNJsBxTH3MN27MrLBRk6TkgQTOXYgMVo+Fox7C47ECL
	oXkauM7kLecgIa+BndvZKsXcL0Xxl2KdpbffWOySaCvPvvk/LOmJ8qm9RZZMENh7run5WU+1yJqRG
	rwpi8fkLkI6SauBb/Xjjr4nTwJjgrqQsAMwmTBk+qlrNBAQzuqM6l9b9aM/L61m5dzp5OCmErSwx8
	k7fLSbtEXApYOlawoc/qp47xvJfbXw+UHAkL6Sv3m7C/K+hZ5MMl6EL8OAO8mnGsNXkw+TAAJfEi3
	9QGoLINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjb7i-00000001ZMR-1G2R;
	Sun, 16 Feb 2025 09:39:38 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjajr-00000001Vmt-2MDn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 09:15:01 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1739697294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rt5BxxZTV58xNDbNgF1327IOm+eImblrMkl1NBTJjbU=;
	b=v15MyCK5VSdUac9qEUd85mvpHjw/ERNDvC8jyAnhFW4zew4w21adQpj3/P92SrQYd1kn0y
	jnOKakNZqFiXmeBcBRE7fS/5f2ziYRGsaYJufmuoGYHaVoJegCLYDNOv5aVFXunU907H2k
	VdIhzB7Vb4+DF8Jqghfrdfe5QQMAAQttkA/yUHZkhUEoNd2mlrynfR/tIlZR1L2SyKEo7u
	ftai2xalUGo5519NOkkwyeW5Fs+UMGAYa7woGgZkts2cRZk7d1RLfVzbGymyE/qzpkhIBy
	xkCS3BIawEmDQuuMVLIGDtcdjHDh/LP54/ZWiOiN39FPk506Bl9PEi9P9ZyVPA==
Content-Type: multipart/signed;
 boundary=d97e42a6c6353b7a4f9cd5bcce86d935721f1028ac7c8ebefddaa40ab478;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Sun, 16 Feb 2025 10:14:45 +0100
Message-Id: <D7TR7VP9UPQA.2U5BL328HNSXU@cknow.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: phy: add
 samsung,exynos2200-snps-eusb2-phy schema file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Ivaylo Ivanov" <ivo.ivanov.ivanov1@gmail.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Philipp Zabel" <p.zabel@pengutronix.de>
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_011500_315828_3C8CCB68 
X-CRM114-Status: GOOD (  15.11  )
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

--d97e42a6c6353b7a4f9cd5bcce86d935721f1028ac7c8ebefddaa40ab478
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Feb 15, 2025 at 1:24 PM CET, Ivaylo Ivanov wrote:
> The Exynos2200 SoC uses Synopsis eUSB2 PHY. Add a dt-binding schema
> for the new driver.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../samsung,exynos2200-snps-eusb2-phy.yaml    | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2=
200-snps-eusb2-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-snp=
s-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200=
-snps-eusb2-phy.yaml
> new file mode 100644
> index 000000000..d69a10f00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2=
-phy.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-snps-eusb2-phy=
.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SNPS eUSB2 phy controller
> +
> +maintainers:
> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> +
> +description:
> +  eUSB2 controller supports LS/FS/HS usb connectivity on Exynos chipsets=
.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos2200-snps-eusb2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: Reference clock
> +      - description: APB clock
> +      - description: Control PCLK
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: apb
> +      - const: ctrl
> +
> +  phys:
> +    maxItems: 1
> +    description:
> +      Phandle to USBCON phy
> +
> +  vdd-supply:
> +    description:
> +      Phandle to 0.88V regulator supply
> +
> +  vdda12-supply:
> +    description:
> +      Phandle to 1.2V regulator supply
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - vdd-supply
> +  - vdda12-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/samsung,exynos2200.h>
> +
> +    usb_hsphy: phy@10ab0000 {
> +        compatible =3D "samsung,exynos2200-snps-eusb2-phy";
> +        reg =3D <0 0x10ab0000 0 0x10000>;
> +        clocks =3D <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>,
> +                 <&cmu_hsi0 CLK_MOUT_HSI0_NOC>,
> +                 <&cmu_hsi0 CLK_DOUT_DIV_CLK_HSI0_EUSB>;
> +        clock-names =3D "ref", "apb", "ctrl";
> +        #phy-cells =3D <0>;
> +        phys =3D <&usbcon_phy>;
> +    };

Shouldn't the example have at least all the *required* properties?
Same for patch 2 of this series.

Cheers,
  Diederik


--d97e42a6c6353b7a4f9cd5bcce86d935721f1028ac7c8ebefddaa40ab478
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ7GshwAKCRDXblvOeH7b
bkU8AQCibICp1eXeMpoYosoeOHqF70rWCWBxmLXFVyJRfJNcqAEAjc2hyFVdJERG
U1ReV+OtGUBaTo1Ha+wF3AZwDhfJlwE=
=3NNk
-----END PGP SIGNATURE-----

--d97e42a6c6353b7a4f9cd5bcce86d935721f1028ac7c8ebefddaa40ab478--

