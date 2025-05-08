Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B032C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 06:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeci1CKmFnzx0hOCPypBr16L1uNoihnrKD0bKhK7A9A=; b=Bd/+nnl0AOvze1Q7tvSpm7guUh
	Fu3PzGMsmPHxrVv5fCUhPrlBdr+5dQC6JTscBeVlJrxYtBzJmSgYrU/fI3OIftOLhAYGg3egMsMf1
	dzOLh/fLrzKw0MO07fvTPl10rl354TDKcFDAjORUd3duKSUuqwnXL+uxe0I49GoC5yI1oBypAXetJ
	5HQthLFgYCACDqmcShBusQflyOrV0iNc/TJgra/xLeoD0jFz+bvwQWDCXEuqtIf6YOU2Xrj8c0y02
	/rhQDPMK/UEo6l8WVwPxL37msVOZXx9OTPuFRXq5vfjGhFAyNYrrT6MQpKUKB/MQbvJgTTC7OqFi3
	LYq9ib4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuTf-0000000HRES-2eXH;
	Thu, 08 May 2025 06:11:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuRi-0000000HQyP-2xYc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 06:09:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3FED5C619A;
	Thu,  8 May 2025 06:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8671DC4CEEB;
	Thu,  8 May 2025 06:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746684565;
	bh=aNzIdCINKAyp+r1r0nEkypLqIzGYNhghY5XaHOpNRBo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GhF+i6qW8ZUnWN8dJpgO8wPFp4CzysEiMLcaKsUSTc4bXQ3fIW/f8W7Flv7mUM5s8
	 Eq2NF19N2dGwdcnpr5ZqX4pe4buqsAH/KiRMQ9IjiXb3tMnT+LIx68xfQG5pIQXOh9
	 S4onWkn0Da13dfjAIbj77/bx6KxZAfNJBGBpisqRZz65B0GAKEsb5XVkTiuMu4rU98
	 SeZfCogDffRDlR08ZRAfQukpxQkqqscM25t3h25xczyYpUZf2iVzAeoegEz6B+uw9K
	 HSD/xPvjUvijtVuy7vtOVQEorb66kiGAoraC0nXdQNt9RSPSC9RYdqaT52wQkAXfkH
	 PMmpPvhSmTkJw==
Date: Thu, 08 May 2025 01:09:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andre.draszik@linaro.org, tudor.ambarus@linaro.org, krzk+dt@kernel.org, 
 sre@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dima.fedrau@gmail.com, 
 alim.akhtar@samsung.com, conor+dt@kernel.org, badhri@google.com, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
To: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20250508050856.674782-2-amitsd@google.com>
References: <20250508050856.674782-1-amitsd@google.com>
 <20250508050856.674782-2-amitsd@google.com>
Message-Id: <174668456195.3462769.556560233730725103.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: power: supply: max17201: add port
 property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_230926_786375_C92AB7EF 
X-CRM114-Status: GOOD (  10.00  )
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


On Wed, 07 May 2025 22:08:51 -0700, Amit Sunil Dhamne wrote:
> Add port binding to represent an endpoint that connects the power line
> from the battery to the Type-C port connector
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
>  .../devicetree/bindings/power/supply/maxim,max17201.yaml     | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250508050856.674782-2-amitsd@google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


