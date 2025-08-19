Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF736CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+VuMuqUxh/QC1ZYDbuqe0LgUx9lNmMl4TpCC5TwwPA=; b=LPk1MaX+I1MvEDAU+Vg93ZZ0XQ
	HnTjyGlBT2/GzWv8T0tBvr2gO/1bvJ2sd0AoRZUnbeKAOeKOAXqSwEEGGEm3cq6kgzOSRdHr7E1kr
	XuAgjFkTdQXRW7aFzMQ82J65zVIGaFcBb6ZEQq53dxcRn4L6ZFLEPr0+fMSX+D8/PoYAAjkrw8/+9
	ozwQbYFcDho1BgjqDga8he6uXCih7EXcJjppWequoOWMU7es6n4Xr27UkW0p4yHYuL/rJFVlqGTa3
	vXnvkadnFVqDXyKgvw+dqkrn3vu0rSVK3wrZoWh0toB0kwiYCeAIElUlOhX+YzuWqRXNWbZXLYNUl
	7I1TJy8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOF3-0000000AtGy-48Wk;
	Tue, 19 Aug 2025 15:27:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLVt-0000000ARbV-1sPC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E27B462DC;
	Tue, 19 Aug 2025 12:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD125C19421;
	Tue, 19 Aug 2025 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755606749;
	bh=MTiHv6t2LpJIY7fgJdikRO0+EvUhRQm0Kzkj4vfM1+c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Q1rfmTDm0WCrzSxGP1lVOKYUmYsUym84cdSHq9O3bu+WYLcLQ9rWqAJ3svPS8z9vR
	 sRQdwU/UvRczMP75BeelR26iyOGgK502Ltb275jIIzqJWlIYBb2763ZzqTmA4xVh56
	 VYuFkU1sIGcVGTd6z8e1uFLKK/1sIHE4ij3BMWMikxHH4tq7IMHow8+c9bvLIyzlqW
	 xsHTaHz2MLxYuYguwHGXSlilW3OpFAM/onIWm5ctWslTcbjZsAjAiZnTD5HAd0TSZa
	 Zenzii1E7Acb61MWpdhb2gSEqDgQTee8KO0aKLTAI4+0bTNSSGdQQ1Xpbp7tCMNrm0
	 SQfpOokxyx2rw==
Date: Tue, 19 Aug 2025 07:32:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: James Clark <james.clark@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org, 
 kernel@oss.qualcomm.com
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
 <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
Message-Id: <175560674472.26193.14154235220441518996.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Coresight
 Interconnect TNOC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_053229_503670_A130D9D3 
X-CRM114-Status: GOOD (  11.79  )
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


On Tue, 19 Aug 2025 03:27:43 -0700, Yuanfang Zhang wrote:
> Add device tree binding for Qualcomm Coresight Interconnect Trace
> Network On Chip (ITNOC). This TNOC acts as a CoreSight
> graph link that forwards trace data from a subsystem to the
> Aggregator TNOC, without aggregation or ATID functionality.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


