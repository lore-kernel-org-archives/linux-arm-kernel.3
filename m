Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DC210987A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6E9BtR9nb+vdawdXLEWrvR70DSk9gZH7D7f5tboMx0A=; b=Mdz112HbN16zV1
	YIq3VJ8X8yCYs+UKEn7j42CJ9c2WNTBAKs6jMFhrNZrU8QLdcxHLPy1eadywXQbjq4zudTML8vJpp
	mBHVFfsgByglY3IFXQV5OehFbPuBzDZC5dgPbe5HwNTwAx4CTlXWer7IvNSGN/XbeQuuGAti9hZMd
	5NaKTksu2q/2tcFouEB0WexykPXDYTQCIY5xdNwARiw81qybeOpBuncKB+U04F2R0H6X65VqcUtJg
	x+6cJfqgytyBje9k9BbuZ2s5j+SXukFGRAyVgiYtwfnTCnT4JYZveEwMMyd25E8DOln+hS6pi6iYb
	sog/I/JYttfArOjoiovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0f-0000000DBZ0-2oZg;
	Fri, 20 Mar 2026 16:47:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0a-0000000DBUN-17ks
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E96260053;
	Fri, 20 Mar 2026 16:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66E7C4CEF7;
	Fri, 20 Mar 2026 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774025255;
	bh=FgOYDvJZfSmo7EDTl4VOVx7cZ1LLI5/WXtiITqbbNbs=;
	h=From:Subject:Date:To:Cc:From;
	b=E8ZbO74RyubCUNIUTKFcy/XPlKXvlamHwIAWkIUIFCUydanD4e2aSVITu1a4uqcOt
	 slSq8HEzMhMlSYbiuQ8xCbpnbAfHR8jIASNU46/G8px3nPqXk8XyrMVMzPjsTxIi0h
	 g6eQnCBMTtP2hWO8BlKGZUuTLo7TXV6THO+IUYyg/PBUHDeVOh14jTjnk5Jb82JlYR
	 4O7HF0Ek+lP2R2O6Rql9DDKwUaaWBOtxuEPU7BF54cLcoD8URbR5LG8Hjf3wHPU0LE
	 OxRe2EfRNRvkzuRrLWCH40YpDInWRDyhU8JpeAAGkmQPU9vljs1bNtVUFibnO6NIkb
	 +EVSv4g5h4Rjg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/5] arm64: dts: Add Corstone1000-A320 platform
Date: Fri, 20 Mar 2026 11:47:13 -0500
Message-Id: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABF6vWkC/4WNQQ6CMBBFr0Jm7ZiZEjS48h6ERUsHaDStmRKiI
 dzdygVcvp///t8giwbJcKs2UFlDDikW4FMFw2zjJBh8YTBkLsSmRr/gkDQvKQoTEdraEPqhsVd
 ruRmdQFFfKmN4H7NdX3gORdDP8bLyL/0zuDISEjvvnWlLs70/RKM8z0kn6Pd9/wJgslL1uQAAA
 A==
X-Change-ID: 20260123-dt-corstone1000-a320-dc5a7aa15fbe
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Frazer Carsley <frazer.carsley@arm.com>, 
 Hugues Kamba Mpiana <hugues.kambampiana@arm.com>, 
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
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

The Corstone1000-A320 is a new Corstone1000 variation with Cortex-A320 
cores and an Ethos-U85 NPU. This series adds the new compatible strings, 
restructures the .dtsi files to handle the common parts, and then adds 
the new Corstone1000-A320 FVP platform.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (5):
      dt-bindings: arm,corstone1000: Add "arm,corstone1000-a320-fvp"
      dt-bindings: npu: arm,ethos: Add "arm,corstone1000-ethos-u85"
      arm64: dts: arm/corstone1000: Move cpu nodes
      arm64: dts: arm/corstone1000: Move FVP peripherals to separate .dtsi
      arm64: dts: arm/corstone1000: Add corstone-1000-a320

 .../devicetree/bindings/arm/arm,corstone1000.yaml  | 15 ++--
 .../devicetree/bindings/npu/arm,ethos.yaml         |  2 +-
 arch/arm64/boot/dts/arm/Makefile                   |  1 +
 arch/arm64/boot/dts/arm/corstone1000-a320-fvp.dts  | 15 ++++
 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi     | 91 ++++++++++++++++++++
 arch/arm64/boot/dts/arm/corstone1000-fvp.dts       | 96 ++++++++--------------
 ...{corstone1000-fvp.dts => corstone1000-fvp.dtsi} | 33 --------
 arch/arm64/boot/dts/arm/corstone1000-mps3.dts      | 13 +++
 arch/arm64/boot/dts/arm/corstone1000.dtsi          | 13 ---
 9 files changed, 167 insertions(+), 112 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260123-dt-corstone1000-a320-dc5a7aa15fbe

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


