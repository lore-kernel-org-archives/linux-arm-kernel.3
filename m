Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F69C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 11:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7rpCXoQa8qBRKAGEbT3aJ+9iCXIjVhuZnCnBsSzdhY=; b=KWRK5oaAOMwCXSLCV0a9bNc2pX
	C7lfxOdn8oZhjwVemdZECMgqj/VBBGd9rwr8aq8tzbmP5quqRP0MXaiACsx6M06kx3UAN1zTP+J9i
	xB4SlV+PW78wq3X2hxRHrr/v9w5tkfWRys0BeY13ymrrwBN+9OyF7I13YcoSDvUltTvbbIwUV9ND4
	dWUp0dcqise19CK7y53Odmqj01HsvdOV/dcH30ss7A86uQnZdJHf5LExDTPZ+93SFtnL9vn9hSwvw
	DuF3OoeM1rEq8KUn0XfaL5u2klFroWLToq/MSAfE7QVkBLs26D2rIJjtLe2OKDGrCEkw4wMtfFPeh
	mNe7ow9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPff2-0000000D5D3-3NjU;
	Thu, 12 Jun 2025 10:59:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdj0-0000000CjlM-1bCh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2BF14A4FB;
	Thu, 12 Jun 2025 08:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55480C4CEEA;
	Thu, 12 Jun 2025 08:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749718553;
	bh=0QUTCiUny0eCr51w7ek1yKVwt5TNV5EjnPzwiEPvTMA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Yy4qzLDf07NFS4ydPK/3k4p/HYydUhpDxE7fSzbg319wHA0xctInGEHO0SuFXwaVb
	 chQhJdMyJZ3Tmg/ozH03H2giBJBJK0tEQ4TgnaD0H9fT9GOcWI22j/QXfN9W5KM4HY
	 ClTplDgWRItB6ZfASmbCvk+m0IlYm15w4MQOAwRTTmWL9falFUEqgNJ8IYwor1GhOu
	 dKVzm5DRrEbKhKwRAVXfLgQOGtIvYLs7TSYyjbz0wrGd+3fDekzD7CBn15oYH97l0D
	 nbmUFfuE+JnExjsoXssmsAWKSfrc2Nuj2pvj4gi93YT8Am1cKo2DjnlZhSax8wFYB8
	 dsDsEjjhTbg6Q==
Date: Thu, 12 Jun 2025 03:55:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: u-kumar1@ti.com, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 vigneshr@ti.com, a-chavda@ti.com, p-mantena@ti.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Santosh Shilimkar <ssantosh@kernel.org>, praneeth@ti.com, 
 Conor Dooley <conor+dt@kernel.org>, dmaengine@vger.kernel.org, 
 Nishanth Menon <nm@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
In-Reply-To: <20250612071521.3116831-13-s-adivi@ti.com>
References: <20250612071521.3116831-1-s-adivi@ti.com>
 <20250612071521.3116831-13-s-adivi@ti.com>
Message-Id: <174971855176.3983058.3404871673988477983.robh@kernel.org>
Subject: Re: [PATCH v2 12/17] dt-bindings: dma: ti: Add document for K3
 BCDMA V2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_015554_435725_1FA1205C 
X-CRM114-Status: GOOD (  10.53  )
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


On Thu, 12 Jun 2025 12:45:16 +0530, Sai Sree Kartheek Adivi wrote:
> New binding document for
> Texas Instruments K3 Block Copy DMA (BCDMA) V2.
> 
> BCDMA V2 is introduced as part of AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../bindings/dma/ti/k3-bcdma-v2.yaml          | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-bcdma-v2.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/dma/ti/k3-bcdma-v2.example.dtb: /example-0/cbass_main/dma-controller@485c4000: failed to match any schema with compatible: ['ti,dmss-bcdma-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250612071521.3116831-13-s-adivi@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


