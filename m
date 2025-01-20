Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69622C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NaISGLJR03FYklXMebGcqoa5Dp1o8Ttfq525ZbxkqY=; b=xPhAfa514musww+dGhg0R5sh1o
	kBLjD+0nP645M1Ag5lDqIwJuSwEoI4vjVGLJsypjyCYYrxZ78s3LYBsKDckEH0A4yJKrgIxVBY1tU
	L0noT/S7Ys9xhrd7UA3HHhiBpDrDDyBl5RCge97ALsK06P06ZTcnqu3jc2d/T11ggp9CIvW/gLIiW
	g3OJDWbk+Bkn5OUkuRQnHjy7KRN1FaCv1x2bmOEnYkXP51I0U3/yhefl4LJj/CS2DSdNbREizp3TN
	d9hiiaFQu2C9T/lrZNkMEFxYy7mOAaQYblsZ3m37EZHdml9mq5kXkrOivycvKnXQWZzi6dZAk7wp9
	1qREI5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZmgT-00000004yWU-1fks;
	Mon, 20 Jan 2025 07:58:57 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZmf7-00000004yQo-3Lz1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 07:57:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A72D31040DBF6;
	Mon, 20 Jan 2025 08:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737359849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8NaISGLJR03FYklXMebGcqoa5Dp1o8Ttfq525ZbxkqY=;
	b=OZoSdQMkRQTNc7qfmGcxxT31s0/qJ6e9W8kxfx7WZ5Brj372WMEN9lvKS07sJ+i/ePX6bs
	i/TtJerWU0ZvITtW3iP8equwf2uKDCKgSTS7kjbG2eUc3sshbgqaamk6aQ49bH8zBSvDzj
	faWJmgJAUfqoWNiFkDmr90eiJn/9ydKjsr1wGBEdDLx3ErvxnW3NluYnVyRZKu1g+Sg8V7
	rZwcR1/xZGERYTwJs7fk/7roNdAyvs3sync4t+kNP85jbMX+mQSb3jyzidrgTKRG1nhx1r
	UToMciDqcyYvT19aaQ2+ATN3NDtHPba6DNkWL6PISkisRlaCgZinFAmeq9/+pA==
Date: Mon, 20 Jan 2025 08:57:24 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [RESEND PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <20250120085724.5caf80af@wsk>
In-Reply-To: <20250109154149.1212631-1-lukma@denx.de>
References: <20250109154149.1212631-1-lukma@denx.de>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U/yll50iKgE5KldfaI.Ejar";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_235734_127785_65D565F6 
X-CRM114-Status: GOOD (  22.04  )
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

--Sig_/U/yll50iKgE5KldfaI.Ejar
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Community,

> This patch provides the DT Schema description of:
> - powertip,st7272  320 x 240 LCD display
> - powertip,hx8238a 320 x 240 LCD display
>=20
> Used with the different HW revisions of btt3 devices.
>=20

Gentle ping on this patch...

> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
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

--Sig_/U/yll50iKgE5KldfaI.Ejar
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmeOAeQACgkQAR8vZIA0
zr0jbAf9GiMn13F0dhmGWZLn3VDJ643cS78yCNzck9CuQgS5unj84y7aiawwzcWB
O/zrorxzpuNnpxQpXYZN2+Ayu7q9B99J8/WwNvi1nM2m4ffoF7HsqE1mSd8TWxkC
6yKehoD74CdSYcKGZEh0anPDFV331lN8L6opnm70kvMM0ar+7QhQwy62eLiX7qOW
jyHytccvg9c+ATLThSeET87I2Ke4oAJpE/QJGHEdCIk6ZBvINEK5L8vgNJUU4Wkh
QD+dMaQAfU+G2ncwk1T2dlyJmtl01dWriR/mHQEQSaR90gTleuRsxycQvUL9ljix
F8YQnQzI1VSwxIHqUW8q5zPtV8YDZw==
=oVKs
-----END PGP SIGNATURE-----

--Sig_/U/yll50iKgE5KldfaI.Ejar--

