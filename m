Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B0DC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Eofn3HtQq7k+NzCKSnf9p7qcjZFvGwxsHG2dNd3qB8=; b=KOw8uSqS+en51crakBwNO8XhE4
	OuOWgYrUXaQlQSW6ulb/g1DyAdZgFvYUpOWOxa5sF1nJyBxVn3iJciCqKejrq6+VzxUEUxjHc8/yf
	9oUIsoNQxc4lGauoq1y2lZ0KgYMgUJZsC/AwPfB2+LTvfLY3b4R358jRYc5y4gsA78ZGFZrZG1iD5
	IFBxD9ZghcmAjqoWYaQpLo2AQqIaOIzmxhf5DMNvnxZIz0s97YxHKepAsut9SXqrV2Z86caqeabKc
	vmpn2VQU5dffxQNYFrPrwPTn2ZiBaGWjfMN+m//KMtkS4aMr3ejGyQv7fd7AcjR7zL1LlKVy6+ENc
	qn4v1OyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncfk-00000007IG7-2H6X;
	Thu, 27 Feb 2025 12:07:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc76-00000007CHB-1JBk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:31:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F87115A1;
	Thu, 27 Feb 2025 03:31:51 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F98A3F6A8;
	Thu, 27 Feb 2025 03:31:33 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: (subset) [PATCH v7 00/10] arm64: dts: Add Arm Morello support
Date: Thu, 27 Feb 2025 11:31:19 +0000
Message-Id: <174065576473.2740592.10867811098764653721.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_033136_389088_461EFBCC 
X-CRM114-Status: GOOD (  10.60  )
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

On Fri, 21 Feb 2025 18:03:39 +0000, Vincenzo Frascino wrote:
> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA [1].
> 
> This series adds dts support for the Arm Morello System Development
> Platform.
> 
> [...]

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[01/10] arm64: Kconfig: Update description for CONFIG_ARCH_VEXPRESS
        https://git.kernel.org/sudeep.holla/c/a3b955ac911b
[02/10] dt-bindings: arm: Add Morello compatibility
        https://git.kernel.org/sudeep.holla/c/51e877f12d23
[03/10] dt-bindings: arm: Add Morello fvp compatibility
        https://git.kernel.org/sudeep.holla/c/73d251e7068c
[04/10] dt-bindings: arm: Add Rainier compatibility
        https://git.kernel.org/sudeep.holla/c/91ee16438965
[05/10] dt-bindings: arm-pmu: Add support for ARM Rainier PMU
        https://git.kernel.org/sudeep.holla/c/807945ae7325
[07/10] arm64: dts: morello: Add support for common functionalities
        https://git.kernel.org/sudeep.holla/c/8fc53e26fdd8
[08/10] arm64: dts: morello: Add support for soc dts
        https://git.kernel.org/sudeep.holla/c/7f6838da3c67
[09/10] arm64: dts: morello: Add support for fvp dts
        https://git.kernel.org/sudeep.holla/c/34f3b3745ce5
[10/10] MAINTAINERS: Add Vincenzo Frascino as Arm Morello Maintainer
        https://git.kernel.org/sudeep.holla/c/6ceb0dd64727
--
Regards,
Sudeep


