Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEA1C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYN6gB7Ijq5F3mQPt8j/w5U9BHlrr8gpwOqMcp1ScAg=; b=wpTxveDNglrJNC6Wmb9lPsC3ux
	gu9XXAkGsJjzR+rWuucpSI2NGhTZbmfyyyR+GnIZncAIXkWayH3wIkKSwuSCoFA7Kpjd23ysJPsaz
	yXmkNx7FwT33biFmcqXkFXjNVaQkehkwCzZ25xgpeaTsn7wdjuZbZvbvn9mgGcyFaSpA05bFzZ4kZ
	ErlqY0AT00XxY2o3XNlAUknCB3FVTKaLxHSTpXB3YLMB2vRKZDLBLGIHWaKrEM+txcVImRyxkWG2v
	V1syt3pGtuxO3aB1LSObjPjHeJ5pr48Eaf7KNzoyB1MCK6R+u/SY98vUCGrUatddrATIyBXz7Nj7h
	Opex/i9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fpG-00000002ahN-0Von;
	Mon, 21 Sep 2026 15:21:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fpF-00000002ahD-1FcH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:21:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C047E40F3E;
	Mon, 21 Sep 2026 15:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BD81F000FF;
	Mon, 21 Sep 2026 15:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004060;
	bh=sYN6gB7Ijq5F3mQPt8j/w5U9BHlrr8gpwOqMcp1ScAg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=OBxIhJsPI6FsskimLCHHwrb8YKf6UPRxsiFCq59DToJg9t5AnuMw/QWSc+aBld6qV
	 NB3NNeRcUt3wKYVht8mQrwSIZ7/mOEejWEpr1fF/Dwd3BpiED8bv/PAPMsLaXsNGJl
	 q2NGUlDPTERSUs4uxPzUsiSo/mS/VKDXMhwjsqHr7hWE48gYYswEiAI8J5HyCcHPA0
	 EPSKVPrlwvmniMaY3C8eAC48YqmZNW9dFf1Lrsc/M2n4fFGXj3kV2L62rgB4CPVW//
	 4lFlmRyZkfTB24GFesazvM4qSuSQ8ITvwJTIy8phGp6Q5YPcDWnSUIR3Tfkim3WJvW
	 aGFFPbZg+71jA==
Date: Mon, 21 Sep 2026 10:20:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: sumit.garg@kernel.org, linux-arm-kernel@lists.infradead.org, 
 akpm@linux-foundation.org, mark.rutland@arm.com, 
 linux-kernel@vger.kernel.org, sudeep.holla@kernel.org, 
 thierry.reding@kernel.org, david@kernel.org, rppt@kernel.org, 
 jenswi@kernel.org, linux-mm@kvack.org, danielmentz@google.com, 
 catalin.marinas@arm.com, op-tee@lists.trustedfirmware.org, 
 devicetree@vger.kernel.org, will@kernel.org, ardb@kernel.org
To: Vincent Donnefort <vdonnefort@google.com>
In-Reply-To: <20260921110050.3977591-8-vdonnefort@google.com>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <20260921110050.3977591-8-vdonnefort@google.com>
Message-Id: <179000402021.412547.18161897733601725746.robh@kernel.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: reserved-memory: Add Arm FF-A lend
 pool
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


On Mon, 21 Sep 2026 12:00:49 +0100, Vincent Donnefort wrote:
> Add bindings for the "arm,ffa-lend-pool" reserved-memory CMA pool.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  .../reserved-memory/arm,ffa-lend-pool.yaml    | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.example.dtb: ffa-lend-pool (arm,ffa-lend-pool): {'compatible': ['arm,ffa-lend-pool'], 'reusable': True, 'size': 67108864, '$nodename': ['ffa-lend-pool']} is valid under each of {'if': {'required': ['iommu-addresses']}, 'then': {'required': ['reg']}}, {'required': ['size']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/arm,ffa-lend-pool.yaml
Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.example.dtb: ffa-lend-pool (arm,ffa-lend-pool): Unevaluated properties are not allowed ('reusable', 'size' were unexpected)
	from schema $id: http://devicetree.org/schemas/reserved-memory/arm,ffa-lend-pool.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260921110050.3977591-8-vdonnefort@google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


