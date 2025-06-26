Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B27C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=720kfZoFtMDlrr572xYqxmnb2B0trzxwv9XIDsUPSI0=; b=lPlWum71ZDWz2X7Gx2Osqiw8Kg
	ig19uw54sZWDtbgHTiyw5mbpthE3KHqZBJyJf40Z/psZacGAQhBCGgxb6f/zgaooZBC+KAJWPMm8J
	HyUPIjKG4ycdzlcleeqfCEJoHBZHebIDLUqbRf3mfc1dIzmWsiAJT++dDzcKX/OGzXl7zXroFkYlT
	U9hj24ZsGiKF01XX+MkL+9YGghhbE0WKcBNb0x118RUx+BjtpAgEFjI4RmA0pC4V335AvZLbELPti
	GVvcPJJAkXrKkixsRTFkOVrELn0gultvRsqfmrNnbCX8a6nehcKPT8GbMZZzWFjwm+dpdRXld9TI5
	QdjcLMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvlu-0000000D1h0-2iXq;
	Thu, 26 Jun 2025 23:12:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu05-0000000CogU-1JyV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 21:19:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCD7344F07;
	Thu, 26 Jun 2025 21:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9E8C4CEEB;
	Thu, 26 Jun 2025 21:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750972756;
	bh=28uNc/vEFpqvghgBWV99ylJqmaORBokqPOIAZlT5Edg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bbF9XJlul92CmEGz3T4uQ+yndC/DlJOuuo42kGpnawZlzPRbvVNUAo6S1NnSvvvqJ
	 mGLgTWTcyPGSpu74VJjKbv8HrO3lcGcLqj1eTACiGW7PwR8fKbklDtULObkihl1Ue7
	 PPi/EI5Dw3ZMUccOKbL5/fISnsfHPTQxB5cUEivQV8vItuLr6JxecvCBNO1YEENwqQ
	 qcc0e6LguLIwq34dOxDixADb2i9t8PlGSiIgwYXD8AGhrgiVvX1JWn+6kQnV80QWcf
	 9L6Yh0PXMyH5ilHF58rjqvrbzb3ZepOM25v3iGmIcC2smqNXGYYbswVPhcDu5IrXtG
	 6c47qfe4l0hgQ==
Date: Thu, 26 Jun 2025 16:19:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Mark Rutland <mark.rutland@arm.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 Will Deacon <will@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250626-ddr-bindings-v1-2-cae30933c54c@foss.st.com>
References: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
 <20250626-ddr-bindings-v1-2-cae30933c54c@foss.st.com>
Message-Id: <175097275573.957711.15313846796838099778.robh@kernel.org>
Subject: Re: [PATCH RFC 2/2] dt-bindings: perf: stm32: introduce DDRPERFM
 dt-bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_141917_396619_EBE4C44D 
X-CRM114-Status: GOOD (  11.65  )
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


On Thu, 26 Jun 2025 21:48:35 +0200, Clément Le Goffic wrote:
> DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
> It allows to monitor DDR events that come from the DDR Controller
> such as read or write events.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml: ignoring, error in schema: properties: compatible: oneOf
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml: properties:compatible:oneOf: {'enum': ['st,stm32mp131-ddr-pmu', 'st,stm32mp151-ddr-pmu'], 'const': 'st,stm32mp251-ddr-pmu'} is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml: properties:compatible:oneOf: {'enum': ['st,stm32mp131-ddr-pmu', 'st,stm32mp151-ddr-pmu'], 'const': 'st,stm32mp251-ddr-pmu'} should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml: properties:compatible:oneOf: {'enum': ['st,stm32mp131-ddr-pmu', 'st,stm32mp151-ddr-pmu'], 'const': 'st,stm32mp251-ddr-pmu'} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.example.dts:44.37-47.11: Warning (unit_address_vs_reg): /example-1/ddr4-channel@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.example.dtb: /example-0/perf@5a007000: failed to match any schema with compatible: ['st,stm32mp151-ddr-pmu']
Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.example.dtb: /example-1/perf@48041000: failed to match any schema with compatible: ['st,stm32mp251-ddr-pmu']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250626-ddr-bindings-v1-2-cae30933c54c@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


