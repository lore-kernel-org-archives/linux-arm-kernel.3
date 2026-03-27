Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA5A10BA43C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wJnXUQTenxc9RZDVoq3EseDikp7ghECE8gQ8w5nINM=; b=AQKzwg0ykDYhfXx37TdeDZoWpU
	ltAb6mvG0VhWCdnSfpNuUjSKVPwpoir4T07SGSMP4pkZ8BQ+Rv244Giuj/3wXBA4Iws1q0JxJSroD
	FYnWOBocXP6qWUj66jLLdbGumZuGi49yDQCCGSGa3BC4UIj6CVIC3utPtMZouLwQrVnKk1opY9pZG
	IAZqahKFnUMoAg3WIEFT9gxuU1WjwgxhTlcUYIEUHV4R8HTCXMdbhD/2Jf32/Kf/v3M/6c/ILYmkW
	bIDurP8kmmCBSx9NbS+lW+u6U7b8iit8YDddlYIEkCWvo+g7EVXSgHYFDVq4y/lyLiE+eQiefWAg0
	HFSPPZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62VV-00000006xjE-3pBL;
	Fri, 27 Mar 2026 08:25:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62VU-00000006xj0-0sCO;
	Fri, 27 Mar 2026 08:25:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 390C66132B;
	Fri, 27 Mar 2026 08:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEFDC19423;
	Fri, 27 Mar 2026 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774599926;
	bh=HFmd/yN0zDbunaZil2hF63355iXilUJ4h7GpPaZQYk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYbU4xPW0QmniiP7pbZ2rN5WhRhXZl3OHs06Um/vct+r0dI26c2lvARKJzAwNK1fW
	 L22HxRlPr8pUt519LPW9Ge1QpOX5zfz4I1s2QPszCUrd1PB13gjuL06F3x82aS8fCE
	 QGg8YO3/6RNnGhbG81KrSkCmBfFEaiM8shU/8RuCG42h5GcqGmlClvtrZ4Y6aV/mjS
	 Q8Kl1/VLOdj/g8dirfcHT0w8Gl0cRPCa0CPo2IVjsCOyUDWFH0g/juNL0GL4Diib7S
	 G26MGyL6C13drt6+H1StyHY9m0pMyjNGFfV2Ub94odhO45eEnvLa7PVsGoVsd4cNKi
	 aDO14AE8Xs3Fg==
Date: Fri, 27 Mar 2026 09:25:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: amlogic: Add new bindings for S6
 S7 S7D
Message-ID: <20260327-cormorant-of-strange-spirit-d8fdc5@quoll>
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
 <20260326-s6-s7-pwm-v1-1-67e2f72b98bc@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326-s6-s7-pwm-v1-1-67e2f72b98bc@amlogic.com>
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

On Thu, Mar 26, 2026 at 06:35:38AM +0000, Xianwei Zhao wrote:
> +      - items:
> +          - enum:
> +              - amlogic,s6-pwm
> +              - amlogic,s7d-pwm
> +          - const: amlogic,s7-pwm
>        - items:
>            - enum:
>                - amlogic,meson8b-pwm-v2
> @@ -146,6 +152,20 @@ allOf:
>          clock-names: false
>        required:
>          - clocks
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,s7-pwm
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: input clock of PWM

so simpler: "maxItems: 1"


> +        clock-names: false
> +      required:
> +        - clocks
>  
>    - if:
>        properties:
> @@ -182,3 +202,10 @@ examples:
>        clocks = <&pwm_src_a>, <&pwm_src_b>;
>        #pwm-cells = <3>;
>      };
> +  - |
> +    pwm@1000 {
> +      compatible = "amlogic,s7-pwm";

You already have three examples, don't add more.

With these changes:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


