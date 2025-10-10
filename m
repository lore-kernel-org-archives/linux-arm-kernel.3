Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CE4CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmuTl518CVfD8qVU2OusJy708vtIWB98EwRQUPnB9w4=; b=JW1Qv0fF2JN5Pl1Ez6PmGLw8MI
	OCbmMf0R0NE3Hm7KaAxsJPOUyJWQBE+RF+XrYGqz60WGoINs9v9VRC6tGG8Uh7Ip4cxx1L+qUS+ZS
	7ulLTKo6vngTgHklQsvrBioGGz6shBmb/aANkJtO4cGnmgRH443dfRXLeF3gaz+202+MAjNEhA2Ho
	4UUXZCDhZ+3JbzDX4VntBytShvYbdMn9iEuggSkMMizs6A4hXgdkOF4WrX5RG5VGwxXrfK6HYDIjk
	bIQ/DFGYuXC0zOBa1uOn5MdamwqPB/JMzXFCIhP2jhqtpw0TxI0VdTcNFFzLGyQejXRAnakDsapXP
	4dW38law==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7C9O-00000008PvV-3ZXZ;
	Fri, 10 Oct 2025 12:23:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7C9M-00000008PvB-27kh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3009944E46;
	Fri, 10 Oct 2025 12:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBF7C4CEF1;
	Fri, 10 Oct 2025 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760098988;
	bh=R/kafU+m4XW/sdA5FXdw8G0Cze3OBc3X+cHKIZZOcF4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=O9DedpxeYgxvGTE3qra42PaTuxXlqEo5zRrbgWrcTkeypkLVm0UhI/8MjYFTlYxSr
	 GQyYO+lHKGdK3xP2Z6a18q33zHaSDMw12VsGjxBVzv0jAauWJLW/sYXCkoguCZMQbH
	 PVEwVpvxpHJh0bgZDc7do4OKGgEUrQ7q2gYbzlnLd/qmas0QOEb9VEvD01JZiCNuO7
	 kA6S4rZTP9HCmWHPWdvMvjS0wbJiVoBDBOPmqFL2lGBMj2+k6Kclju/GlnuY3HU5Bl
	 oqqBE0JUYniQaQczzfjK+XIw3Qp5TBo3uohK18Tgwv0aZSjoT9KVs1nkkt3IxrI84y
	 FGOs0AkFl6tgw==
Date: Fri, 10 Oct 2025 07:23:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-2-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
 <20251009-gs101-pd-v2-2-3f4a6db2af39@linaro.org>
Message-Id: <176009895995.7689.883182155048414797.robh@kernel.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_052308_565736_82754284 
X-CRM114-Status: GOOD (  11.50  )
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


On Thu, 09 Oct 2025 16:25:04 +0100, André Draszik wrote:
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

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/soc/samsung/google,gs101-pmu.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251009-gs101-pd-v2-2-3f4a6db2af39@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


