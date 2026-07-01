Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE84BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 19:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snLU1eFT4LzsIrtC77An4/P+s5Ttcpj33qcJtxNCgOs=; b=ogdKZUHY5sfGAvPZc3vDO4vMJx
	ZFw3JrRMPeW8dgesA1eZ+RPEyhg3BhjvmNW5n2aWF2o7uEf7n8ELrdqR6OudCxcCojph0bTVufg38
	L69tc6hBLQ8pCRftLg3sAoeD/0VqLRo0RATfdhAjXoYiGIbvKYF+2aj33KeAkECFAOb1wjjDR5TnR
	Hk8LGkHGlvGHrfIeBdsml8SoQ6rfkm8xVIXE/2S5XOCFJahpRQA9WBLkEdl8XOBRohvOF7CA2Wlm8
	CGsYGCRP7W42TJqnnsQ40zco9Kc+6mSudlZKdkVGCgmTVYQEyWkdA5yueFgyIA4YKnq0ejAAZygZ1
	+EAj7K8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf14w-00000002vhO-2GGo;
	Wed, 01 Jul 2026 19:58:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf14u-00000002vh4-3jql
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 19:58:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C31896001D;
	Wed,  1 Jul 2026 19:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8381F000E9;
	Wed,  1 Jul 2026 19:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782935915;
	bh=snLU1eFT4LzsIrtC77An4/P+s5Ttcpj33qcJtxNCgOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K1bwuJyUPO0aoycSbE7Ytyuv8rtNs7TE4RRDVr1hEF/h2qpeHZOWdL4i1d9ilHhND
	 S/OUeqX1ClXRuXlhFswDzqlULH0DF4fwVMWfF+YptjbnZ9GsyN720btSxBornoAUYR
	 BA+cjDEWQV/iRwejBxNvd+VyGJLnjof1FhViHLpRybxmPLSK/s75dSjCL6llZ7PHWk
	 qsNIjuSlArXURCjSSra3BdboeK2Nv6Z4iStXVQeXVSlne7/IPPMlvBtwEbtG/CKcVs
	 g+Sbb4PE7EhzjjYv4Mu7wxvpFZNmwLHvujOd8ooycwKhN5Y18Snv05PSDdxEtRwkhw
	 UZdNhQBnRh8aQ==
Date: Wed, 1 Jul 2026 14:58:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: samsung: exynos-pmu: Restrict children
 with unevaluatedProperties
Message-ID: <178293591372.1662355.5233552174253951440.robh@kernel.org>
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
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


On Wed, 01 Jul 2026 12:57:32 +0200, Krzysztof Kozlowski wrote:
> Each schema for a child node should end with either additionalProperties
> or unevaluatedProperties, so add missing one making the schema tighter.
> Defining 'type: object' is on the other hand not necessary when other
> schema is referenced.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


