Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDFAE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TgYRWKrBT4x2/7OKtG/vlEAcXmGZZN4TsXVm7o2K1I=; b=RDxk7Sr0QJOaYJ2/2tsK20BCzv
	i+6SikweJUR1k3l5vsIFFqGeZQGGVX5FsBBHPLGC4dfRjTXTI2xbPcpzoIIAEUfcN9HsgFXh/PzmJ
	lc6lV+pgvvg72zEFDtmwMTAW0eLikKzqPoIfJIC9fsCEsps7ohWqu5hBdmQbETzQsprwnb2thSdtL
	6IGsBXi8vyMukZeNkHRzxOvcZ3fKVgo+Otxwx0HPnruxXaHPjov6T6JwaFdcIAsmbhbVELa3DNfhj
	6yMaz7vYWltxTZ5C93BRnTDpuBSmcI14R3xKP+nLt4qOXKSzKG6E61SFly282WyI0fWGgFUZvGkiI
	qwQDiNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKapp-00000007FmA-1rqe;
	Mon, 09 Dec 2024 10:17:49 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaRY-00000007A69-2Iq1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:52:46 +0000
Received: from wsk (095160158109.dynamic-2-waw-k-4-2-0.vectranet.pl [95.160.158.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2849088B64;
	Mon,  9 Dec 2024 10:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1733737961;
	bh=2TgYRWKrBT4x2/7OKtG/vlEAcXmGZZN4TsXVm7o2K1I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=esPYALMVjpVOUkI8/CAsguyrUxuh8FMSTTtKqG6U/5ClMnInIoqizAHSulrXFQINm
	 0LKFikzSXg97Ewh8XZeDPRfMOf1UZXKowHDEdSz56ppcKjg18uZT+W3WXWW5y78SZj
	 idtejTcRVdC+vmPWHQaPxOBNTKn1ot4qoZQ0SwcjFixJkS48JVL5Fh0O1ah3BoDoaN
	 67XsivyHEz3MC6fg3TEbe3FDJBTrt9ZFFZgthl9rLDkIAuqDWwwRZDP1kzlBaVsszv
	 yEa9AlpLibVUnYg46AiDZcWoAMo5vqCNGGyAT53rtTbUZfEjtjUzNsY2MDUgv1msgK
	 Q94AmHcP8ivBg==
Date: Mon, 9 Dec 2024 10:52:40 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <20241209105240.72d8d84a@wsk>
In-Reply-To: <20241107085705.490940-1-lukma@denx.de>
References: <20241107085705.490940-1-lukma@denx.de>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//Fyy5bZHZM.GutZmTzQ0v9p";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015244_911149_768414BE 
X-CRM114-Status: GOOD (  24.65  )
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

--Sig_//Fyy5bZHZM.GutZmTzQ0v9p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Community,

> This patch provides the DT Schema description of:
> - powertip,st7272  320 x 240 LCD display
> - powertip,hx8238a 320 x 240 LCD display
>=20
> Used with the different HW revisions of btt3 devices.
>=20
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Rob Herring <robh@kernel.org>

Are there any more comments for this particular patch?

If not - can it be applied as it prevents dts patchs to be pull by
Shawn.

> ---
>=20
> Changes for v9:
> - New patch
>=20
> Changes for v10:
> - None
>=20
> Changes for v11:
> - Combine both separate dt-bindings patches for powertip,st7272 and
>   powertip,hx8238a into one
> - Drop the quotes for in "title" entry of powertip*.yaml files
> ---
>  .../display/panel/powertip,hx8238a.yaml       | 29
> +++++++++++++++++++ .../display/panel/powertip,st7272.yaml        |
> 29 +++++++++++++++++++ 2 files changed, 58 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> create mode 100644
> Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
>=20
> diff --git
> a/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> new file mode 100644 index 000000000000..b7d74faeb5d5 --- /dev/null
> +++
> b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> BSD-2-Clause +%YAML 1.2
> +---
> +$id:
> http://devicetree.org/schemas/display/panel/powertip,hx8238a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> +
> +maintainers:
> +  - Lukasz Majewski <lukma@denx.de>
> +
> +allOf:
> +  - $ref: panel-dpi.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: powertip,hx8238a
> +      - {} # panel-dpi, but not listed here to avoid false select
> +
> +  height-mm: true
> +  panel-timing: true
> +  port: true
> +  power-supply: true
> +  width-mm: true
> +
> +additionalProperties: false
> +
> +...
> diff --git
> a/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> new file mode 100644 index 000000000000..f3622800f13f --- /dev/null
> +++
> b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> BSD-2-Clause +%YAML 1.2
> +---
> +$id:
> http://devicetree.org/schemas/display/panel/powertip,st7272.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> +
> +maintainers:
> +  - Lukasz Majewski <lukma@denx.de>
> +
> +allOf:
> +  - $ref: panel-dpi.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: powertip,st7272
> +      - {} # panel-dpi, but not listed here to avoid false select
> +
> +  height-mm: true
> +  panel-timing: true
> +  port: true
> +  power-supply: true
> +  width-mm: true
> +
> +additionalProperties: false
> +
> +...




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_//Fyy5bZHZM.GutZmTzQ0v9p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmdWvegACgkQAR8vZIA0
zr06jwf/Uki+jPjbdKp28ndQTmn0DS2DhJn04m0+xpfsdAF10D8JInAbJtWlVEQU
B61lINUcP/H/t6mpGMwYFb1QdRbFAzmxEGr4leiMRMQ9A4RxvzzzPWbF1Tu3hfnf
OyPEfvWYHxdUh0qXvO5Cd7wKxxRw1gDF+yEzcu/VxvrniJPUSQIv7brOvmXNNP2d
j4yvvb3p/tWXTjJL+m+lyLkjdJriAdKH+if3wCU++dyPOLq+P48jr9s9peMcFXLI
+j8UUL5T8tKhDWpYfnLjh4uE89J6VSwoLmgMppYQuzYWaNk1DEKSshn1eVdhVS15
suRvKryJhDfKkCi1xfF2wxgHZCUBGw==
=S4ZQ
-----END PGP SIGNATURE-----

--Sig_//Fyy5bZHZM.GutZmTzQ0v9p--

