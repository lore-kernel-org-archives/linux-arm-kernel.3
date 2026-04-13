Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C20F531DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 22:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdK2j2rWFotPEy+YdVQvd2A1W9nJFbHZrxPj0syBgnU=; b=k4xKoEpV2z9yBkAp9xLXQYeHMZ
	FqDznREGQx3f95odC6Iai2HzFfZkwN40AZbIvJoWMeVG12B1tWDBvD2wIFs/gdPUUaes52i3QK/S/
	bknXHNJZ40cGya84snrp/A89cAaW8ktEHJ7wCCVkmsaW8mN2i/JF5IMbcL+6cQIBWQs6kK27/nifE
	aQIdlMXiyk3w0TvlLnDt6TnW23XJ5xXPSOyAiC3vJm1Rer0b/n9xNqWyKxUTpB95h5GMpegP5Dz7a
	F/RzjuBo6WBBa0u/yEt4CxkqfPalvS+IDugAPIfOiXAXvWrLhXhOEatGqM/TNo/0oocDp1CtyZlDJ
	PGcesO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPaF-0000000GQtS-3P2A;
	Mon, 13 Apr 2026 22:16:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPaE-0000000GQsx-0PhB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 22:16:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF93461339;
	Mon, 13 Apr 2026 22:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E5BC2BCAF;
	Mon, 13 Apr 2026 22:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776118600;
	bh=ZPV8j6woHqmMX+C+tViyHCpt/QUU2vIwRkFqnvR4S8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqT71u8RzdXSnF6K5fsbFr8URahNmMY1Rv4dyxQI7yrHpedW6u3XrxQEpxSlmkUor
	 iKfOCkF8Uj6aL1LOj09ekvcNHCE+CqsvrwyJRci2FLKEOHP7HDtU4irV8OfaC/WnDQ
	 ueNt/NVYgWP7t/Iw2mWjjVsu5wD+5L2AjveLBgxmVO5pgSPJtyNZhW94TQiVMnWhvA
	 DLmxGH44CUy2T1fD00kLmMw/wCDgYDLxkeGGA8Pm4s2VoSno1aQ7PufadXRZQANg0T
	 R/tBUDXAhzxatYm/UQYkvB6iqp20FylFBZXHicpk1DTy8OID6AwHO6VfOYNb4s4JQy
	 alfVXcniysCHQ==
Date: Mon, 13 Apr 2026 17:16:38 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
Message-ID: <20260413221638.GA3624532-robh@kernel.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
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

On Wed, Apr 01, 2026 at 05:51:55AM +0100, Alexey Klimov wrote:
> Some Exynos-based SoCs, for instance Exynos850, require access
> to the pmu interrupt generation register region which is exposed
> as a syscon. Update the exynos-pmu bindings documentation to
> reflect this.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 76ce7e98c10f..92acdfd5d44e 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -110,6 +110,11 @@ properties:
>      description:
>        Node for reboot method
>  
> +  samsung,pmu-intr-gen-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to PMU interrupt generation interface.
> +
>    google,pmu-intr-gen-syscon:

Does this mean the driver is just going to have to look at both 
properties for the same thing? If so, just use the existing property. We 
don't need 2. Yeah, 'google' in Samsung SoCs is a bit weird, but that's 
Samsung's fault for not upstreaming support for their h/w first.

Rob

