Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF23ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaWChzm75NlxUDXwoRa3Ny5ymA7uyfLqxhMSPQgO+EI=; b=4urV+u2FKfJ8l36OBFge8JyA8T
	A2agPMhWwM+RzOMGjL/U373PyhuJOC+NZsQxibQW4KT/TAKgYdYEH6y9NccJm1+6NjEwdl3vskUB+
	tgbkes4DYrjnQh00PoUs8elLRMj5OCTDNfxMADeW4Et68R2lduQqqPzcy3mO9fttobhu73mY8wfEV
	jAYlScSDu95YnbASQHU8mwEzqwKgu/sAmxr6+m7MZbjmJV9hBin2dekmTX1x9YMZLyiDnyhY6xpSR
	+S4xMS5tRaXmTN6c1V1RAv5cM3wfI+3PBnHsNhhalbP0b/TQQDskUUhSTKgVXoXCmEeRCkhrplyzQ
	KUcFDhgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo09E-00000007e57-2EeB;
	Mon, 18 Aug 2025 13:43:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unzuw-00000007RzA-2xfc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 13:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEA525C4BEF;
	Mon, 18 Aug 2025 13:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F16C4CEEB;
	Mon, 18 Aug 2025 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755523733;
	bh=RBe2h9lREBKMOmk9gFLPEM/Gqn8YS4oH4RhZ7ngYXOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzKL51+l7SeFj7U7Tu6qmnCM0DnKHgZbXB2R5bG+feymwxfsZPoEhbY3NNAOrd+j5
	 rYTnggDp0uvf+rEIvs5bDyBqFi5zSlBUX6Ul41V6VH5v3anL8D29xazLs7nnVS7yWx
	 XnuU3+glg5x90JJsU3smQvLEmWLhfGj/RFpcZ+HaDw0zf58CjP/aey0OETt4jPGXpD
	 GIuxyxGJeWcbnjFzi4N5NmjKzUaDG6Vud2R6Kbiwqd9CWHMUmymLc0B6pevLjVLc1v
	 fPqGLWBLn6NkdHFX1/GM7PL+Rkd75t+AT9GqYGqjHABQYavWpIIlvgPlcgCTior7FU
	 M+i6djJxKbmgA==
Date: Mon, 18 Aug 2025 08:28:52 -0500
From: Rob Herring <robh@kernel.org>
To: Marc Olberding <molberding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 0/3] Adding device tree and binding for Nvidia mgx cx8
 switchboard
Message-ID: <20250818132852.GA882651-robh@kernel.org>
References: <20250815-mgx4u_devicetree-v1-0-66db6fa5a7e4@nvidia.com>
 <175530106151.3523036.5305359646677111575.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175530106151.3523036.5305359646677111575.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_062854_785225_A5C9AFDF 
X-CRM114-Status: GOOD (  19.11  )
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

On Fri, Aug 15, 2025 at 06:38:54PM -0500, Rob Herring (Arm) wrote:
> 
> On Fri, 15 Aug 2025 12:45:54 -0700, Marc Olberding wrote:
> > Patch 1 Adds the binding for the Nvidia mgx cx8 switchboard
> > Patch 2 Adds dtsi's for the mgx cx8 switchboard itself
> > Patch 3 Adds the dts for the mgx cx8 switchboard motherboard reference implementation.
> > 
> > This is an Aspeed AST2600 based reference implementation for a BMC
> > managing an Nvidia mgx cx8 switchboard. Dtsi files are broken out for
> > managing the mgx cx8 switchboard over i2c, so that others may reuse these
> > if they choose to implement their own board. There are two dtsi files
> > since the i2c topology is not symmetric between busses going to the mgx cx8
> > switchboard.
> > 
> > Reference to Ast2600 SoC [1].
> > 
> > Link: https://www.aspeedtech.com/server_ast2600/ [1]
> > 
> > 
> > Signed-off-by: Marc Olberding <molberding@nvidia.com>
> > ---
> > Marc Olberding (3):
> >       dt-bindings: arm: aspeed: Add Nvidia's mgx4u BMC
> >       ARM: dts: aspeed: Add device tree includes for the cx8 switchboard
> >       ARM: dts: aspeed: Add device tree for mgx4u BMC
> > 
> >  .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
> >  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
> >  .../boot/dts/aspeed/aspeed-bmc-nvidia-mgx4u.dts    | 1078 ++++++++++++++++++++
> >  .../dts/aspeed/nvidia-mgx-cx8-switch-north.dtsi    |   80 ++
> >  .../dts/aspeed/nvidia-mgx-cx8-switch-south.dtsi    |   80 ++
> >  5 files changed, 1240 insertions(+)
> > ---
> > base-commit: 7bac2c97af4078d7a627500c9bcdd5b033f97718

next-20250521!? Why are you using linux-next from 3 months ago?

Base your patches on the latest rc1 unless you have some dependency on 
post rc1 changes. Usually that means you need to base your tree on the 
maintainer's tree the series applies to (ASpeed in this case). 
The *current* linux-next is a shortcut for that.

Rob

