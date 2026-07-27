Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA902C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVsgJPRHn51XcESko363GMJRqIFO2EWO17u2oafb950=; b=lJZ9BNHQzQZWIg7lOEDSKzy89S
	L/OCS6YZe2VS4d6GWJwhvJOYBopH9ClA8MnMuMEtclF2IfyDOWl8n2iCX1SFCuai4TEVit7GCBmi7
	/6+nEOHMr0WW0imps10RiBdzi7SLgsUVP3xAONVR5Xy1wJCrM3egwehkkd2ngaeEi+C5x0fRHuirq
	WpSbCfsqoheQr7cwpoZDb3AIZOKu5uA2irJ41s3BUBJNpkm62bVZ1Fi98AOfbjWv2/xCFFckxcyZF
	q1N6nMyahQ3kVx0BuQFC2LoFkFHRWIYG4utb3ZGyOahpxafpzO9iFOl8LTBthu8haU/zKNMz5q8is
	phBKJcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woEkq-000000020wW-3L8I;
	Mon, 27 Jul 2026 06:24:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woEkp-000000020wJ-1MAR;
	Mon, 27 Jul 2026 06:23:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1257A43505;
	Mon, 27 Jul 2026 06:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8A71F000E9;
	Mon, 27 Jul 2026 06:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785133438;
	bh=eVsgJPRHn51XcESko363GMJRqIFO2EWO17u2oafb950=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHHfYYc/EVunwM/BogFHtGsU8/oSwATiUe4Bbl4i0C2qoQ6OVAEk3yBR3a1xuW82R
	 Jwg+AKk0O9Dj/ms1Pi0LOfABiQpx51jWFUDbWZWwSPsanpvCZtmKETuJZ2Ii7B6Xmi
	 R2nEYVkkm1wGQzMdfCs5fqvygonY8z0HocJF+KA8ebmredvBuAFGKJDU+fB4j/bohA
	 Vf9eBnGJfIWXfaKPWUXl+VrJX1uFv8mQudo7ewu4wqa3/qRC5IdLpdQugAqN5jnpx8
	 fPRZ9gGtpDbOQv9CpNdfZbHblCd6rUJvplquMEZN3WQhMeYznCI8xs7bAaHH3G/MPC
	 DnbXxDCrPpPSQ==
Date: Mon, 27 Jul 2026 08:23:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
Message-ID: <20260727-brawny-silent-kangaroo-a02c9c@quoll>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-3-6072a7ee7428@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-3-6072a7ee7428@amlogic.com>
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

On Fri, Jul 24, 2026 at 03:04:53PM +0800, Zhentao Guo wrote:
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
> +    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
> +    #include <dt-bindings/power/meson-s4-power.h>
> +    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
> +    video-codec@fe320000 {
> +      compatible = "amlogic,s4-vdec";
> +      reg = <0xfe320000 0x10000>,
> +            <0xfe036000 0x20>;
> +      amlogic,canvas = <&canvas>;
> +      reg-names = "dos",
> +                  "dmc";

Please read carefully DTS coding style.

You also need to address all comments from Sashiko.

Best regards,
Krzysztof


