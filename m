Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0795BF433CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 22:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQHfec3hH72Y3B7+L+P3++YEgIgRyAungMyYeGhbsSQ=; b=bjm5DxBB4q748e8i+dH3bZioxj
	5qkoA1EBkrmD7txIreK6GNxVdY2zW+plBo1lffTPoet3O3KlcKqTlLwaOO982bqYgyfp+cupNCRez
	pXnC8kDUEpc95A4mannGxWEuIGxaVqdy7cmILxJKoSh3PJta9/hRfyLcoKGPnwgE9Xwg/r0x9xQhe
	s8MEa0XrK5gqxKiZGHWG1npFDZlIXgyZP0mgCL0zqyRKLIwKM43CWg4QlYa4gpYbTBnAYca20oHHe
	xP1tyUE00ulJF/gWEZBLl+7S4JVanzJe8AvQRmjrxOzUrhn9kPvszprska0kyRS9qf3kgKcbL76H3
	iFIO+I5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8U6-00000001fa1-0FOV;
	Wed, 15 Apr 2026 22:13:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8U4-00000001fZq-3v8t;
	Wed, 15 Apr 2026 22:13:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29F6560121;
	Wed, 15 Apr 2026 22:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4ACDC19424;
	Wed, 15 Apr 2026 22:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776291199;
	bh=qSg+kNESVJo61aBZDdNgiU9KJvIQqTHcGul9KHiHi/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxNxNToFUFgjmJk98CnKj500nmscrXFmTs1IfgrgSZPhnw59DyVmfurlClhf+rMYr
	 I///l/oCbWV4sZ0F0VUO3JewFiCHHrGIgQJfXN0Ns7Nz9UWl08WCTDSGuh6fjAdOR8
	 2E4PH1Ggh04LhZv16g9lS9XbtJrjFd1fmKl9sc12Yw0Hjtl3ULi8UAWTWMPTPJeZJF
	 4oxpWyqFS6JdjI7/0YDl4r9Yk9HYj6P8+SdskXzIpRCYNG/izu+hSnO4ndHdHg751S
	 E+PL4D0LEyDAmI0q/Swnu+FWkuSWvPFKIVCz/MPm9/ckFZxN1EHV+W/3OKW2T0DOFd
	 Ysohiw6Q4gByQ==
Date: Wed, 15 Apr 2026 17:13:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: linux-riscv@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org,
	Thomas Gleixner <tglx@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: interrupt-controller: Describe
 AST2700-A2 hardware instead of A0
Message-ID: <177629119770.789152.6115453884565821746.robh@kernel.org>
References: <20260407-irqchip-v5-0-c0b0a300a057@aspeedtech.com>
 <20260407-irqchip-v5-1-c0b0a300a057@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-irqchip-v5-1-c0b0a300a057@aspeedtech.com>
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


On Tue, 07 Apr 2026 11:08:04 +0800, Ryan Chen wrote:
> Introduce a new binding describing the AST2700 interrupt controller
> architecture implemented in the A2 production silicon.
> 
> The AST2700 SoC has undergone multiple silicon revisions (A0, A1, A2)
> prior to mass production. The interrupt architecture was substantially
> reworked after the A0 revision for A1, and the A1 design is retained
> unchanged in the A2 production silicon.
> 
> The existing AST2700 interrupt controller binding
> ("aspeed,ast2700-intc-ic")was written against the pre-production A0
> design. That binding does not accurately describe the interrupt
> hierarchy and routing model present in A1/A2, where interrupts can be
> routed to multiple processor-local interrupt controllers (Primary
> Service Processor (PSP) GIC, Secondary Service Processor (SSP)/Tertiary
> Service Processor (TSP) NVICs, and BootMCU APLIC) depending on the
> execution context.
> 
> Remove the binding for the pre-production A0 design in favour of the
> binding for the A2 production design. There is no significant user
> impact from the removal as there are no existing devicetrees in any
> of Linux, u-boot or Zephyr that make use of the A0 binding.
> 
> Hardware connectivity between interrupt controllers is expressed using
> the aspeed,interrupt-ranges property.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> 
> ---
> Changes in v3:
> - squash patch 5/5.
> - modify wrap lines at 80 char.
> - modify maintainers name and email.
> - modify typo Sevice-> Service
> Changes in v2:
> - Describe AST2700 A0/A1/A2 design evolution.
> - Drop the redundant '-ic' suffix from compatible strings.
> - Expand commit message to match the series cover letter context.
> - fix ascii diagram
> - remove intc0 label
> - remove spaces before >
> - drop intc1 example
> ---
>  .../interrupt-controller/aspeed,ast2700-intc.yaml  |  90 ----------
>  .../aspeed,ast2700-interrupt.yaml                  | 188 +++++++++++++++++++++
>  2 files changed, 188 insertions(+), 90 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


