Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB33FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 11:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5qnDiUIOftQ1UGMYjPAY5aOTb/9TMIIrEGlK8HEkf0=; b=pThZh4VNU/huChGpOy1oRhDN8k
	VldLHzrFofKgQOgqm/5xX5t3WS0bTRYw5V0TAQzhtn0uDDe2RfyKKHog3PTyGL82SN9IKa9iXIjuq
	BX4BINsmPIuPpHQ1WyePD47tNYgHVX3HFBFEx+eaRxNZM50mXdlRMaeK+ZttybAliRYdDxeZfQP5L
	QjJUuwmWf//JtK4x26/Ujdole2i2YdOQXpL/w2iyyuJk3V6N3GIIuNeOto9srK0IkfR7CvNQmmj4S
	8Z/CsA+EGY6e+RNLsEfhHRuFPJj2Kgrcegbmo67aZaNNAKcG8VQ4QvOWF3L7W5R14BmWJim7OvlQt
	pWbcZvRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfh8-0000000D5Q6-20r1;
	Thu, 12 Jun 2025 11:02:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdj1-0000000CjmV-0Etk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C99C844209;
	Thu, 12 Jun 2025 08:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A6AC4CEEE;
	Thu, 12 Jun 2025 08:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749718554;
	bh=RQYBtssOY7+oGdh2lG5OPgacAKGthN9dqgrlCVHiJRE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tKTGJlXb7NbO6b72bfefP6nbDKNQIB3EPfZ0fRG9zHBuxX+fFJBmM8JWl9A4wNp/v
	 AkNRhDzu+4ySC7dtwTvZSNlgxGB+7ewfbaWK5dmxhClE0JsHuHf7sbDpq0hxqcbbt5
	 dzHrHEa5uGzGQBn+ULgzXGLd/USBX3zERlwZUx8W7rVnapqLQmcjFlBGWuw+6N8er3
	 mQEUsjf45FweghnyY8tFh/T7yXa9qiYDwxeZr/QYcItPdEvIM6IWKfWJPYzllmt7+c
	 IxBj3LPrx4TF5DVcjZLSarj3g1d8bQl2avHfL44BVhst20ce2laoO6mq9aP7rjp/cj
	 URlXZ3zyVZ2hA==
Date: Thu, 12 Jun 2025 03:55:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: u-kumar1@ti.com, linux-arm-kernel@lists.infradead.org, 
 Nishanth Menon <nm@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 a-chavda@ti.com, p-mantena@ti.com, vigneshr@ti.com, 
 Santosh Shilimkar <ssantosh@kernel.org>, praneeth@ti.com, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
In-Reply-To: <20250612071521.3116831-14-s-adivi@ti.com>
References: <20250612071521.3116831-1-s-adivi@ti.com>
 <20250612071521.3116831-14-s-adivi@ti.com>
Message-Id: <174971855245.3983211.889546911604873358.robh@kernel.org>
Subject: Re: [PATCH v2 13/17] dt-bindings: dma: ti: Add document for K3
 PKTDMA V2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_015555_117898_5F110198 
X-CRM114-Status: GOOD (  10.43  )
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


On Thu, 12 Jun 2025 12:45:17 +0530, Sai Sree Kartheek Adivi wrote:
> New binding document for
> Texas Instruments K3 Packet DMA (PKTDMA) V2.
> 
> PKTDMA V2 is introduced as part of AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../bindings/dma/ti/k3-pktdma-v2.yaml         | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.example.dtb: /example-0/cbass_main/dma-controller@485c0000: failed to match any schema with compatible: ['ti,dmss-pktdma-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250612071521.3116831-14-s-adivi@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


