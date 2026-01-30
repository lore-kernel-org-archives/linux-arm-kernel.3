Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FB1E6BF06
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 12:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMm1cdnkfrY0oZvaf90df8+jlEV+VoXRPG6bWagljEA=; b=3WBwOcr93nWV6OvDRNgboddWiP
	FLgu1S20v/MzRa5jCP8smrSazvoTPMWpzVbEKidH5i5VC01qlusQHUe+oKAXO79uhYr6lw6jwqNjE
	jgdPBabN9oLnOXlmMyvqmsABXovB6ikprPIJO2OF9kxBDHOYPSR/3lYAGrrCTAnFYvWejZfDj9wr1
	+la0vnXab0eHu7jmp16n2L1+J/u3z3oBRsV8yC75kgVHfjQKpKHvYtSrznXR54fsP1Zt6ZZopSj7m
	ow8MMnq4kVGSYxTjwB31M/KS7F1kJE56vmGWm3H/iRzdPIE6sSDFsJJdX2wY9tE+5EiNFdQMxkrc0
	I8E+KxHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnrU-00000001UY9-2gVo;
	Fri, 30 Jan 2026 12:44:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnrS-00000001UXo-34QU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 12:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9830041674;
	Fri, 30 Jan 2026 12:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5723EC4CEF7;
	Fri, 30 Jan 2026 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769777069;
	bh=orp++8gz1k1HbaQq7SXgFqxVbkLzY6LuZrbAVZfoJXc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VJQqTcQDAwaTQRQ3hVsyhvY0veUJOLZP+XrsxLSb3SClCpFNchadGAP53XD2IutHd
	 duYx7qFjnTHB6ll3IcVpB//Hgx0jjAPM1moUwd9p+7WtHc9dnPpwJplfMbRzgguVKd
	 sKBFE2k9RIGWzMHcKlvN+6vm/zbxxcR73hSDSY3CyR4MAxXtIxDJU8sPvWve/oWPbW
	 5wxY9ORN1Txa7ahrTAIATGxl39BMxQl0pc30Dgm0i5oOP4LNsBhVvNYkpdJDnKlPfz
	 Bzq6kVa7KD8rxx+N48hrVvWJabRPv1YsmgsJANKpDshIDt7Lc/6i5jFwDP9nXk0ZJ1
	 RgkQoV3+o+Iqg==
Date: Fri, 30 Jan 2026 06:44:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: peter.ujfalusi@gmail.com, nm@ti.com, 
 linux-arm-kernel@lists.infradead.org, r-sharma3@ti.com, 
 gehariprasath@ti.com, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
 vigneshr@ti.com, krzk+dt@kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, vkoul@kernel.org, ssantosh@kernel.org
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
In-Reply-To: <20260130110159.359501-14-s-adivi@ti.com>
References: <20260130110159.359501-1-s-adivi@ti.com>
 <20260130110159.359501-14-s-adivi@ti.com>
Message-Id: <176977706843.3699469.624952435786400951.robh@kernel.org>
Subject: Re: [PATCH v4 13/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_044430_810924_B8585691 
X-CRM114-Status: GOOD (  10.30  )
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


On Fri, 30 Jan 2026 16:31:53 +0530, Sai Sree Kartheek Adivi wrote:
> New binding document for
> Texas Instruments K3 Packet DMA (PKTDMA) V2.
> 
> PKTDMA V2 is introduced as part of AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../bindings/dma/ti/ti,k3-pktdma-v2.yaml      | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,k3-pktdma-v2.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/ti/ti,k3-pktdma-v2.example.dtb: serial@2800000 (ti,am64-uart): 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260130110159.359501-14-s-adivi@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


