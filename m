Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED310E91297
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xh6wHExqeA5n6IMsD3EGtDkJKvRvUzSg32v/BWdv0gE=; b=IrfKkJS8ghOVufWW2YlloTRjAD
	5soDBVIaM0I5I1GsOX5w3sndYMo5REZ5mBPiTzEd9fXBsWqsEWRdEOxYoVICA5jDCmatopAeAIZ+Y
	RIE33IeFrJu/adajDynBNmiJHreRlzYfZEbMIaxMhhI/AwPT27hB4x+YH/jmuOX4HrwaOl3H279e9
	qYa1HTKWKiwdXoloM4IeNXMXgk2e5+bBJQUy7xI0CQof4RkxN858L0m9GswbIxCvxNzMjtPfGFOQe
	PSTyK7gpC90zGqABwaz+SR34oZ9wPg3GUi3KZiiufq+uWFT57GvF/AGJG8jV1Egfsnr3amz+QM0ol
	sfqk333w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvAR-00000009dle-03vh;
	Thu, 05 Feb 2026 08:56:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvAO-00000009dl4-1kKq;
	Thu, 05 Feb 2026 08:56:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01B164354B;
	Thu,  5 Feb 2026 08:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1D4C4CEF7;
	Thu,  5 Feb 2026 08:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770281807;
	bh=EpeKVSUECcB0qRTU/0YGWj2Tn1oofcM/dtc2qrBjOCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEqnGVOAoESTGAH1kB0Oty8u2WWao6axm3BidFtcpHznfrpYXSrc/a7v55Q6z+DGh
	 iOcCxtSKu6pINMwf9h3nbdFgopXZWj2ZtBocy+n/FP3+gEbCio2NJuZPKA4H4L42Qj
	 wcLsE38wpK1r1L1QRNrkPvyVM0/8ZTpqcfmVeLnMSZ8hAs9iI8ILQe+gJ8ugHtX3ZV
	 k6UKX/HQ7GcLOlYspbbkhddXgkOtnY3dglQ1jZtlFDbbOF9/yk+8tDOvwkWIgLUwdh
	 WDQg1xdSnzDg0kIHnBJdRRlIngHV33u6pFR44VxvoSp7Kdy3aJjFf/3Z6QE6XposNS
	 S5GOd9t+tLwkw==
Date: Thu, 5 Feb 2026 09:56:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] dt-bindings: interrupt-controller: aspeed: Remove
 legacy AST2700 interrupt binding
Message-ID: <20260205-neat-honored-monkey-74d37a@quoll>
References: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
 <20260205-irqchip-v1-4-b0310e06c087@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205-irqchip-v1-4-b0310e06c087@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_005648_496853_C125682D 
X-CRM114-Status: GOOD (  10.18  )
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

On Thu, Feb 05, 2026 at 02:07:22PM +0800, Ryan Chen wrote:
> Remove the legacy AST2700 interrupt controller Devicetree binding.
> 
> The legacy binding was limited to a PSP-centric view of the interrupt
> architecture and cannot describe interrupt routing and protection for
> the full AST2700 system.
> 
> It is superseded by the new ASPEED AST2700 INTC0/INTC1 binding, which
> describes the interrupt controllers at the block-function level.

You just added all this ~year ago. I also do not understand how multiple
previous revisions of patchset [1] were just ignored. No versioning, no
references.

This is either unprofessional or just wasting our time.

[1] https://lore.kernel.org/all/20251030060155.2342604-1-ryan_chen@aspeedtech.com/

Best regards,
Krzysztof


