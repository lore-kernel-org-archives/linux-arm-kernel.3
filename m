Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E44CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SqRz2S6w8ZZfe2IgOKvWtcp2XojqETnm6PqKSIicJqI=; b=jQuQKtZPONrqgCp3aNQgnhkZvv
	nNeUz+UtaOUMNRGtbsSNJ4JcX3N4ux5pP81fsZcwOHgKLwCbIxbSNoYMPMRc1KI+IY6JcSSBPS1iV
	FyTP5RIY80PEF8J8yzos4ZRv17IQNC/y8URDz4TRqXianbvu3jPCUYqMp66MSlS4wdnoBX4cf2uYK
	vCoBAdKDiqwv9P70zc8iIknMXokX9S6NhVKmMTnB8M+4MB4ZUJigjsF0LCmdnCsSncSOXbDxdG+xQ
	1ejb+e5HUmd69M5Cmp5NakLfDtJj1t8T1s5W+8HjtP4NkgWZQh8l1oF4TkZODwlaYDxarCmmvRrMT
	wgEL+wgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upF8z-00000000yqz-0Xdf;
	Thu, 21 Aug 2025 23:56:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAda-00000000DtH-23Rl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 19:07:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CF4143988;
	Thu, 21 Aug 2025 19:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9785C4CEEB;
	Thu, 21 Aug 2025 19:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755803269;
	bh=RPmQF6mnQdnGp9QUWME/YW9qBlWrRt+tgOREDQtfpc8=;
	h=From:To:Cc:Subject:Date:From;
	b=EejnxMjrf6zHCJbY0GiID8QPnHIO8b4KgoqIsLTY9/73yarfuaGo3QgLlgaLj6T77
	 nnAuJAJsMloUcjJyMn9g8TgcxoIWCiyOiVgAz+EDoJifDlfpl8DBbJpInlKtz69q7X
	 9XL/Q5hRjhpgcvh3r3wbXHRfr2JLkHWC3UeDEs5kWlMQOs8GN6W11OJKRkDVwacbIY
	 uJM9P7eOwe/PpmJC7ZmKRJ2vE8rAYmixHZznsIIRO8sx546cFXZORWlPNMPMZhbM0S
	 6Y+TmOfTjL5bRLb2eZ/LQCAzx4ZqONMbxYtt7fLmtjEbRFKriHAos3ZK4o8JJS8IqM
	 AT2O6HopIvc6A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: Add Cortex-A320/A520AE/A720AE cores and PMU
Date: Thu, 21 Aug 2025 14:07:21 -0500
Message-ID: <20250821190722.417639-1-robh@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_120750_550263_CF0D00B9 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

Add the recently introduced Cortex-A320/A520AE/A720AE core and PMU
compatible strings.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 3 +++
 Documentation/devicetree/bindings/arm/pmu.yaml  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index bb1ab514924d..17dda753bd3b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -145,11 +145,14 @@ properties:
       - arm,cortex-a78
       - arm,cortex-a78ae
       - arm,cortex-a78c
+      - arm,cortex-a320
       - arm,cortex-a510
       - arm,cortex-a520
+      - arm,cortex-a520ae
       - arm,cortex-a710
       - arm,cortex-a715
       - arm,cortex-a720
+      - arm,cortex-a720ae
       - arm,cortex-a725
       - arm,cortex-m0
       - arm,cortex-m0+
diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 295963a3cae7..9bb109e947dd 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -48,11 +48,14 @@ properties:
           - arm,cortex-a76-pmu
           - arm,cortex-a77-pmu
           - arm,cortex-a78-pmu
+          - arm,cortex-a320-pmu
           - arm,cortex-a510-pmu
           - arm,cortex-a520-pmu
+          - arm,cortex-a520ae-pmu
           - arm,cortex-a710-pmu
           - arm,cortex-a715-pmu
           - arm,cortex-a720-pmu
+          - arm,cortex-a720ae-pmu
           - arm,cortex-a725-pmu
           - arm,cortex-x1-pmu
           - arm,cortex-x2-pmu
-- 
2.50.1


