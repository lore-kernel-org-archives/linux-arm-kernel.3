Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE66C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qq96DEO5ZYiYuvC5tRF65RfzLVb0kR0ROfti8ESKxsM=; b=ZT9khIUVQWGuOtZiUwkxHZ1P0R
	FrCcuTzD6L3pjAvSxeZo+EsNVqt0SPNf9rSXXzzY/qHBPbg8KCZKJDxgjgz30rykvmmP+9hX2n9t8
	ielp4Gbla+W1pr4TDtUnx94UbDv5rMCSDBdm5nwZYc+2DwA3MJfuQFxbrVBV07o65jDDiHAyFXB7w
	3nK0VWQMECshLUFVdeYI/D/AeBPEHVBaKL1MMNTXRY8B7bnk81V9YJ0rqkx5+QQrcJZBp3+Rxx2r+
	gbpCjj1qBPc58BzrFX1AJdgVhva7NHGuS7qMMhFuh/0Rm4wZrDMemPEjJsom57BA9VymSfUWf/11K
	BLBIRTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkTQ-00000008mQg-2VTQ;
	Thu, 27 Feb 2025 20:27:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkQm-00000008lrg-1rig
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 20:24:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 045885C582A;
	Thu, 27 Feb 2025 20:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDFDC4CEDD;
	Thu, 27 Feb 2025 20:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740687867;
	bh=vKEFN02TyY7ZwOZN17NJzRX12EebHAeazOra1CnCquo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jcY4i8ztzsfWPDQTm5DOUGAh6zBmlu/yzbBczZEzBczuoo7YYCXt/nByGPvJMJjvQ
	 +z2EWIvbPDUq3NZmzeKKCEbbGovcEdgAcNAxEsQDNQKBqclJXJLQpzib4xekxujQFQ
	 yTHrVyEL3Oyr7xsBwtLWyS4rym4nVt2Zk69yg+I82GjMwYej3PX1W1DZESVjUg/3xZ
	 LBjSgwI25CtDJVf/OKE2NcXTFlcRl5Fu0XWLI99v29DaHGS/S5Rd5+/qFQe1m96mUJ
	 L79zzbBqgG9UZrs7Egr8iswrwZ4w/Ue0uPdfoscJwb89WWrRAhsfiCSnmEeEK1+rK7
	 I/8m7blhsrCgw==
Date: Thu, 27 Feb 2025 14:24:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, salee@marvell.com, 
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
 gregory.clement@bootlin.com, p.zabel@pengutronix.de, gakula@marvell.com, 
 devicetree@vger.kernel.org, andrew@lunn.ch, krzk+dt@kernel.org, 
 sebastian.hesselbarth@gmail.com
To: Wilson Ding <dingwei@marvell.com>
In-Reply-To: <20250227192536.2426490-2-dingwei@marvell.com>
References: <20250227192536.2426490-1-dingwei@marvell.com>
 <20250227192536.2426490-2-dingwei@marvell.com>
Message-Id: <174068786548.161165.4348563654300627455.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add Armada8K reset
 controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_122428_536031_048E9CFA 
X-CRM114-Status: GOOD (  10.69  )
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


On Thu, 27 Feb 2025 11:25:34 -0800, Wilson Ding wrote:
> Add device-tree binding documentation for the Armada8K reset driver and
> create the new head file for the reset line index definitions.
> 
> Signed-off-by: Wilson Ding <dingwei@marvell.com>
> ---
>  .../reset/marvell,armada8k-reset.yaml         | 48 +++++++++++++++++++
>  .../reset/marvell,armada8k-reset.h            | 27 +++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
>  create mode 100644 include/dt-bindings/reset/marvell,armada8k-reset.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reset/marvell,armada8k-reset.example.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227192536.2426490-2-dingwei@marvell.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


