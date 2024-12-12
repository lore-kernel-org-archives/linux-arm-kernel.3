Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C9BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 22:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AAzp9mFQDQXSAMZbtvyLzknXICcbV/pJ/YlVUR107U=; b=MjiFebFv47lltSUbd4JU77vEac
	G4bhHda66HWmd8BKn0s/9wWR8ucez4LLNBiPGuVjJCNhH10d999daXDueb+UtNU94POYzKe23KGqS
	Mg8NASxvEdFn+GHg0bJwFpCgiMOX0a2b4kMZ732eVFAQVFVBFGczbu4pLKobh/IdJuSDmXFJo0OQw
	EKom95DYXwWUzfRa/0EqzLsD6fYrtXzcAoaO46xl42gxhhKWHof8Ycdl+x2lhW8LtujEcWxgBzMGz
	9uI3XGjhp1W0I8LCXqBQHR2oSBF9Ynbof2JiKNTRAxZxRnuZJha+B75pomuYyTMYvjbc1gKvM2ZME
	ScFp1Gpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLrib-000000026T1-1AqH;
	Thu, 12 Dec 2024 22:31:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLrhV-000000026GF-1ZDd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 22:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB42AA42ADC;
	Thu, 12 Dec 2024 22:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9691EC4CECE;
	Thu, 12 Dec 2024 22:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734042627;
	bh=GfgvB7VvI35d4Y+A3lfg32jaJdQuBRvgZUCRKZU/NDA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mLaq9Bxk3T7mh86p6zkb4Ec0ewssBIdzj4uNX3smwvAeWx1QasB99CUvJGH8qvWWf
	 6WyIdk8ECJXakyB7fSFlgipr8s2Ez2rCTtECyciq3x2iC+TATu9Sh18Coza/JnhMvL
	 +hC56oloGoBD6RXMtWdVv78fVDT5FH4HkWqmAmqghBF3JyRv/gPtOZktF4kyAvePuB
	 EjgQ62I7JKRwQx9N+Fs4hGpbVs2Fcu/kD2FDmN4ZFF1VHRnHbqCPQU5KuDX42fs0EW
	 rDXHYXwWFt2dXU2W6PnT01Kexg/k26D5uoL24acpGK05eFGYGKp64Vfy158tdF3ZNd
	 5gQfiEXMRHWjw==
Date: Thu, 12 Dec 2024 16:30:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Maksym Holovach <nergzd@nergzd723.xyz>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
To: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <20241212-speedy-v1-1-544ad7bcfb6a@gmail.com>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
 <20241212-speedy-v1-1-544ad7bcfb6a@gmail.com>
Message-Id: <173404262581.3370297.1817961099331187454.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: soc: samsung: exynos-speedy: Document
 SPEEDY host controller bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_143029_552121_70BC8013 
X-CRM114-Status: GOOD (  11.49  )
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


On Thu, 12 Dec 2024 23:09:01 +0200, Markuss Broks wrote:
> Add the schema for the Samsung SPEEDY serial bus host controller.
> The bus has 4 bit wide addresses for addressing devices
> and 8 bit wide register addressing. Each register is also 8
> bit long, so the address can be 0-f (hexadecimal), node name
> for child device follows the format: node_name@[0-f].
> 
> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  .../bindings/soc/samsung/exynos-speedy.yaml        | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml: ignoring, error in schema: properties: clock-names
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml: properties:compatible: [{'items': [{'enum': ['samsung,exynos9810-speedy']}, {'const': 'samsung,exynos-speedy'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml: properties:clock-names: [{'const': 'pclk'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml: properties:compatible: [{'items': [{'enum': ['samsung,exynos9810-speedy']}, {'const': 'samsung,exynos-speedy'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml: properties:clock-names: [{'const': 'pclk'}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Documentation/devicetree/bindings/soc/samsung/exynos-speedy.example.dtb: /example-0/speedy@141c0000: failed to match any schema with compatible: ['samsung,exynos9810-speedy', 'samsung-exynos-speedy']
Documentation/devicetree/bindings/soc/samsung/exynos-speedy.example.dtb: /example-0/speedy@141c0000: failed to match any schema with compatible: ['samsung,exynos9810-speedy', 'samsung-exynos-speedy']
Documentation/devicetree/bindings/soc/samsung/exynos-speedy.example.dtb: /example-0/speedy@141c0000/pmic@0: failed to match any schema with compatible: ['samsung,s2mps18-pmic']
Documentation/devicetree/bindings/soc/samsung/exynos-speedy.example.dtb: /example-0/speedy@141c0000/regulator@1: failed to match any schema with compatible: ['samsung,s2mps18-regulator']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241212-speedy-v1-1-544ad7bcfb6a@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


