Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85046CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhsHpSvBEiVQxPG+m1u9q1lWHrpKkyac5Xz6BS5qCPU=; b=omhJEOGMfKxsL6Py2m4pOXtrcL
	cOqy8zLAsA32n1P3qnAd8QKaL+fHNcylUfRRyUMJ1mqDaM5o/gunNrsiMyZ3z8VdDavYxRrybjFX6
	BljeRvmOPXElkpDgapjXlN9mtbvwoz4I5u/ZcxCKoxF0soC84y3KIak5aS67L12t1av83fIs4Hrqo
	H/Qg67v+lzXafcaLK5gH6tuN+5uMCjJZS+I616mwOlzotS1z48GFTMRsj80xdIAimtVJ0H/2TSqEh
	zTYGcU49xBtsjiB4kqIpYwvW7P++af1cCYGhIDFlG2kbAOg3iLwJWKW06r6SpkLTUCnHDrFYvLNkE
	as2GcwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0e2-00000008SQx-4BH8;
	Fri, 12 Sep 2025 10:04:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0e0-00000008SQd-1pMz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:04:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E2A716A3;
	Fri, 12 Sep 2025 03:04:30 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 392C63F66E;
	Fri, 12 Sep 2025 03:04:37 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:04:34 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via B4 Relay"
 <devnull+j.ne.posteo.net@kernel.org>
Cc: j.ne@posteo.net, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add Amediatech X96Q
Message-ID: <20250912110434.2a520acc@donnerap>
In-Reply-To: <20250912-x96q-v1-1-8471daaf39db@posteo.net>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
	<20250912-x96q-v1-1-8471daaf39db@posteo.net>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_030440_517535_02045425 
X-CRM114-Status: GOOD (  12.94  )
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

On Fri, 12 Sep 2025 01:52:09 +0200
J. Neusch=C3=A4fer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrote:

> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>=20
> The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM,
> 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> output, and infrared input.
>=20
>   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
>=20
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index c25a22fe4d25cbd8a8132689f1326548f7f43f2c..c9940b44bc888f7ab81ace671=
040bd663556c113 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -963,6 +963,11 @@ properties:
>            - const: hechuang,x96-mate
>            - const: allwinner,sun50i-h616
> =20
> +      - description: X96Q
> +        items:
> +          - const: amediatech,x96q
> +          - const: allwinner,sun50i-h616
> +
>        - description: X96Q Pro+
>          items:
>            - const: amediatech,x96q-pro-plus
>=20


