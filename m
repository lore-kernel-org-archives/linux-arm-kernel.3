Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A31CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxe5BSccCwYqwYXYtSp/pqL90fAgWYLtdO456JDofP8=; b=4ugKjL0FSSPxwu8h7DImjbD+t2
	fqtpw/D5FXugg7JYc4PO4p4Sd3XiMeotEU8P5fDC2Fg4z2h5zQf53jAXOqkt9g65LfKwTUaH97uZY
	d2AHtB9B7lP1XCUCZqKiXln4i6WSAK6CtEstc2vJ0/PDVZ9W388ZFhSDHXoJGGv5S+OKsYTs9iOzL
	2Oe8XR49hfQYRmcaYPChvs0SiOXCJiHMzaDO9hFdAlNzC2ml9frAChl/330Zs1WhcDZIQNw18bZtN
	PVp1l/brHrLJe1b5zvsXH4U3EAPjwhXl9LNdMMT8HvWoilbbO0+XL2H9PS8zCZ4KSQ6uds4A/LxM0
	EMwoIDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Dom-00000008cvr-3YKj;
	Fri, 10 Oct 2025 14:10:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Dok-00000008cvM-07dE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 14:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 514CE403AD;
	Fri, 10 Oct 2025 14:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2C7C4CEF1;
	Fri, 10 Oct 2025 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760105396;
	bh=MJ/XTs/xRIZjpCaFnEFWN9AdmuOs8luescrHAQRcVDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sddgdCJy4ffkyEWBzieZwW2GSxvSjAqL21K+ylmSi/0/m2z4bWsByIOxWJbzK+Yvs
	 O2X+j3QazvxML/91MmrnmJNv8MunlEe4RWdPhR+6OFRD3+eeMK9uKn6andO/nQaV7q
	 cd59zEqSpiYGKlSJRSKRQS1EiymgyJj4TGZeYh1ikMu6PA+Y6kUM6VVGacdz8boqT1
	 67D2nHhmomdC3AvW19VTfbXzpE9lGSsYURyWHd6JCji7nyxwyjx8dQP7fo+r6/qTlj
	 F96KcrVoOxjg0iCpqMz9HKMC1vvg2W5SOwGb/V67PHfGfW5v8bBMSBuYl3w+r3zgix
	 b2J+USz9rbGSw==
Date: Fri, 10 Oct 2025 09:09:54 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 02/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
Message-ID: <20251010140954.GA217599-robh@kernel.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
 <20251009-gs101-pd-v2-2-3f4a6db2af39@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251009-gs101-pd-v2-2-3f4a6db2af39@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_070958_089971_60F6AFCA 
X-CRM114-Status: GOOD (  15.30  )
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

On Thu, Oct 09, 2025 at 04:25:04PM +0100, André Draszik wrote:
> The gs101-pmu binding is going to acquire various additional (pattern)
> properties that don't apply to other PMUs supported by this binding.
> 
> To enable this, move google,gs101-pmu into a separate binding.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  .../bindings/soc/google/google,gs101-pmu.yaml      | 67 ++++++++++++++++++++++
>  .../bindings/soc/samsung/exynos-pmu.yaml           | 20 -------
>  MAINTAINERS                                        |  1 +
>  3 files changed, 68 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..209ee2f80d449c3eec568188898b3c6f7ae0ddd4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/samsung/google,gs101-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 Power Management Unit (PMU)
> +
> +maintainers:
> +  - André Draszik <andre.draszik@linaro.org>
> +
> +# Custom select to avoid matching all nodes with 'syscon'

That's not necessary.

> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: google,gs101-pmu
> +  required:
> +    - compatible

