Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0A2C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEodPovTTAvnmzNUTxzbBUHYxKJDkUSLU0GlJpaXIFM=; b=GVHFpJ0eLaUxC6YFxahJRSEUGL
	9ea1Z5bP7qAYcDrt+E8VezAhcllPfPOR0/97ep0Lkw6Xv/dA8IbsIw1Eujk+J2NsvpCxJyRxscF+N
	8NLgiCek03oXNoZHvnLl6+uwvUOzGV+4FJUbQQeLuU3xtNpMnVpF/xwS74Osx7qgSCp8hxbtOq/Ju
	tB4UqD6OlMJx6UtQjGtn2MyaJIUmBqWHZ5Uv9zPfKe0Cb+a9P6TAqSeL2jJ5vybJt2aLrU+/S+ACf
	z3Sz3Q9fId+AxU2QI0ix3C+BZQcPSwLhTtBtIV9eEk6K9Mi+nGv/nqSEw2KtfmGmdjM5OTyRKhVk3
	Gp55/w2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOCR-0000000Aa9G-15nl;
	Tue, 03 Jun 2025 09:44:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOAF-0000000AZc6-0u25
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:42:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B57F65C54F3;
	Tue,  3 Jun 2025 09:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCF6C4CEED;
	Tue,  3 Jun 2025 09:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748943754;
	bh=dbV/utlJZsAmXKza9Scy8Pvl3ynRvyPanNSPnq6zrJg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Hkite6jMMxAGOm50Ea2u62+Aep6JFDMPsX1jjU94Oe8lbTEiQTz9l5H137JrOLWBa
	 5fYPC67RSKTfte0X06ogcsaKBQ4iPotQCQMbY14IOv87Tp69e0Hgp7ecAlVZR77qEO
	 XOne9yF+muIfRfuHG/LxGd+GiBC221jT6MHtyf9CwOFd6ju9pbeVGL5xRWrK4SmzE4
	 Dm9pifWH9JD6cg7H9y3xl/zZcGvHalV/hWiuo6M3MjjPEF8E1p3HdIjAHHuMSGtSPG
	 tP98ZDF1uXOaaIS928Q+u+Gvym9V1Z1Stdb7anXKpHMM9t/mBSkH4OMGTjoXwBGB0u
	 fxlFJ4rNI0TDg==
Date: Tue, 03 Jun 2025 04:42:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 joel@jms.id.au, linux-kernel@vger.kernel.org, jassisinghbrar@gmail.com, 
 conor+dt@kernel.org, andrew@codeconstruct.com.au
To: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20250603075450.133604-2-jammy_huang@aspeedtech.com>
References: <20250603075450.133604-1-jammy_huang@aspeedtech.com>
 <20250603075450.133604-2-jammy_huang@aspeedtech.com>
Message-Id: <174894375223.360822.13996455735829436919.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_024235_299406_265088A9 
X-CRM114-Status: GOOD (  11.28  )
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


On Tue, 03 Jun 2025 15:54:49 +0800, Jammy Huang wrote:
> Introduce the mailbox module for AST27XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../mailbox/aspeed,ast2700-mailbox.yaml       | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.example.dts:29.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250603075450.133604-2-jammy_huang@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


