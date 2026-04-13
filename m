Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDF7F531DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 22:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QuVlt+O02PlWc1Tc9dCctIo/clnD4iLIkeluLe9ETA=; b=abuW+3LLImFfDlBMLVunG+TX83
	5yX9PHTDwozQydZHM2EPLmpApe5ykmZRe/jKCwbDe7prKG8H3VM9uBGADcGSITLidr047qKphBFWo
	AV5MDvPyaLJ9z/vEOzD+cjLrMYYiPkCjeiiquVtpAq5QPw/M/paCzVu1bnovrrmRYF1yx2bHsIDgg
	DA5M3chvC0IZWKs11UBSEB+zbRY8iQrueKDdKrAUkGae4PgcMRBfALNSLCtgQFEEQx92PyC7r8aPb
	jJLc61Uq+090U9u48BSZ8h2WnReQUvgFRjosKqH8a5qhlOxXu903/G2J7QrxJCKUpbJDA9DJXPigi
	TWh+V6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPiL-0000000GRcX-29dq;
	Mon, 13 Apr 2026 22:25:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPiK-0000000GRcN-3091
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 22:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1F4061421;
	Mon, 13 Apr 2026 22:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C18EC2BCB3;
	Mon, 13 Apr 2026 22:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776119103;
	bh=Ut/oQBbdrKL/HKzzwqF5uKl3t0Tq44YB/2vrPO74Pdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrABTqufmtyESUPGG0WBWPGrchpdlesDdmvZeoVHqytKV9rF+2j1HYkF/H2OwDmGB
	 nVzdzAtJdOmD+FyvtExDIj6OCFvcSzuD1hv8H0rVGgvWASDquH0OD9GOlzk2u1JkA9
	 dwfrGJDpJ1r6qm4Lu1jT3Td3Dy6arvkf7sAE3o9a83gTxLo5u0/nf1f4fvGEcoTRSN
	 pDD5ESotBpFyGCRVmvp6vUpVh6rOinzmRrehztxg//l4hfZpq4Y/vX+U2mLQsM5LMM
	 UiCb7QgMDKf43lPlPc05O3aMqU0ukd+jW6iZZes/vOGuvvo519sUj8gelDuV8iFofz
	 24GQJdRgzEUFw==
Date: Mon, 13 Apr 2026 17:25:01 -0500
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
Subject: Re: [PATCH v2 3/7] dt-bindings: soc: samsung: exynos-pmu: deprecate
 google,pmu-intr-gen-syscon
Message-ID: <20260413222501.GA3642201-robh@kernel.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-3-c5a760a3e259@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-3-c5a760a3e259@linaro.org>
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

On Wed, Apr 01, 2026 at 05:51:56AM +0100, Alexey Klimov wrote:
> The generic property samsung,pmu-intr-gen-syscon should be used
> by default for Samsung Exynos PMU hardware blocks. Update binding
> document to add deprecated flag for google,pmu-intr-gen-syscon
> property.
> While at this, also add dependency to not allow usage of both
> above mentioned properties in the same time.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 92acdfd5d44e..1ff1a8729989 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -119,6 +119,7 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to PMU interrupt generation interface.
> +    deprecated: true

Deprecating doesn't really help. We still have to support both forever. 

>  
>  required:
>    - compatible
> @@ -207,6 +208,11 @@ allOf:
>        properties:
>          samsung,pmu-intr-gen-syscon: false
>  
> +dependencies:
> +  google,pmu-intr-gen-syscon:
> +    not:
> +      required: ['samsung,pmu-intr-gen-syscon']

Disallowing both means you couldn't update the DT in a compatible way 
where you have both properties for some transistion period.

Rob

