Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EB1CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjdDAtkHag7L59AafcSIKkSs/qMPdcaehc7O1ON7iT4=; b=XaMLIVmHNyLRu/sgd+LGNJc01L
	Tdylz0otmbEV0DJq5Ucii0iSkge2EpJt69HhBh0uhYDBHqbWVZ70n1vlPPDhzupZuKPvEBOBex/NH
	N4LnNdaGuNjMnmPy+IDrvqIoBCVERR5j0M+S5G9euIcgo85UXsNUVcjuEw/crxwMtQt1iCAnMQIZ+
	KqDScVWqjbj+56PmPo9qHplzxi2YAhOQbK4XQCbRm07rZpABmBgt5dGDyH9ZSm4QhCCAdFp42A1ps
	pzUt9C8JygCaRFV7cv1OtEJcS+sMWDpCbONdtNoYElvhxK3y0jDrBkygxXJsnKAKJsS2MEUifh+e6
	91r9bn1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNuI-00000006rGO-35Qc;
	Mon, 11 Aug 2025 08:29:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNSm-00000006mkw-1wdN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 08:01:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D41B75C5DC4;
	Mon, 11 Aug 2025 08:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9DEC4CEED;
	Mon, 11 Aug 2025 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754899259;
	bh=srkUTP+YUtpEUUTBY0f0QKZb5Nq7ktoTvVw8gPJrI4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BST4RaTpjHP8ItttfIowfKeh0pqkoeEBV4Vnoq4Oz8gDhVzuBRcgJBFGNzis6dgHl
	 vCfir7NSUpdKq4mzd6cQSwrZGWqE5AaaYDDuHDgnNYOxNDwVXdfNAXTgwv9h4iRfsZ
	 aekPgle3MI50jEWQDSwU5jkM9WbycrPYMz515EKHUhLn9+wTYlegpIHoo9DqA8uDd+
	 QiyfZ9cYMweQqLL5ZnMOMM5yvg6bGVaqk3rN4NH/2Es9hBN4wQnEpEM+PMJokbOc65
	 h3vt3mqHMpp/yt6iwv8cbimBerBEyTPQ4TIvSgeY3szdTCTr13VSuHS0eHmETKi0DW
	 Z0OAUMX99h0Pw==
Date: Mon, 11 Aug 2025 10:00:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image
 sensor
Message-ID: <20250811-successful-military-dragon-d72486@kuoka>
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-2-will@willwhang.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250810220921.14307-2-will@willwhang.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_010100_574708_98E1B7C5 
X-CRM114-Status: GOOD (  11.91  )
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

On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> +description:
> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sony,imx585
> +      - sony,imx585-mono

I don't understand this second compatible. Is this different hardware?
Can you point me to "mono" datasheet?

Your description should explain this. Commit msg as well, instead of
speaking about driver (in fact drop all driver related comments).

> +
> +  reg:
> +    maxItems: 1
> +
> +  assigned-clocks: true
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true

Drop all three.

> +
> +  clocks:
> +    description: Clock frequency 74.25MHz, 37.125MHz, 72MHz, 27MHz, 24MHz
> +    maxItems: 1
> +
> +  vana-supply:
> +    description: Analog power supply (3.3V)
> +
> +  vddl-supply:
> +    description: Interface power supply (1.8V)
> +
> +  vdig-supply:
> +    description: Digital power supply (1.1V)
> +
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO
> +    maxItems: 1
> +
> +  sony,sync-mode:
> +    description: |
> +      Select the synchronisation mode of the sensor
> +        0 =E2=80=93 internal sync, leader (default)
> +        1 =E2=80=93 internal sync, follower
> +        2 =E2=80=93 external sync
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [ 0, 1, 2 ]

Previous comments not applied.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +          link-frequencies: true

Drop

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        imx585@1a {

Nothing improved.

You replied that you applied comment, but send the same.


Best regards,
Krzysztof


