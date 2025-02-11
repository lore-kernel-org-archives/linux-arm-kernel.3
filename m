Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD1AC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 06:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJiswliuC8yJUwUEEk+zWNkofLRfEQuTytGzzJetlvI=; b=LS2vouBAL8EEs8
	ggPWiZX1g0pFaDHu51DzdX8l26+OIhpD90j5KUoQLdvHbtZgNGx1iLI6fkYLjMfkJUyYjVF3CU3mI
	WSDjHfB5NyDE4IGM8C4AobzRb+yq2Vb1Qhn8dFksS1fHPdG8zyO/KA2RHN6O0ZS91aZBGVgFxnT8N
	RwX4jrj5H7vEHahhb0lhgztE3e8IYN1oPnHVmvj0bJCAkrCjGAlK4R7VuHub8APt6OJbNpJ8u6/Ye
	4VS2YJ+PxSBmvfrBwFuMvUUH3xBXK1khOb/0BK4NxaTPV8ritjh5bZMY65w6ZpUL9mOMFcgQIfEWW
	jip1i7VqcW8qXADKH+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkCR-00000002lG5-2qfX;
	Tue, 11 Feb 2025 06:56:51 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thk8H-00000002kTY-36Jg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 06:52:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60BFD1487190;
	Tue, 11 Feb 2025 07:52:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJiswliuC8yJUwUEEk+zWNkofLRfEQuTytGzzJetlvI=;
	b=VmQ9o9xYAgNrT+nU8eBegHtGR8nBQlz3zDcxlT7SvS+Q1fNzgj+bt7raCaHVaG6fH3/47f
	lDGAAnSm9LiotxkTQfrEt5sx6wh2aVYFuOZT43NdGjW2bnGWrnUPVcmdfZLlRI0aPnap7m
	REPJqrhwawW67j+lfDn0Q6keJ889Wv1C+r2HGne/vQA3YMKaF4RCvbofyFKnXyrq54MIh8
	Eau6kAidC43rG4o0GoDR/hql3mSwPTRq+RcHe9WjXAGZk23Zb1mUGX8u45SFextzXNBbVH
	ETEyYnlIx61LMyv/MFA7v3ED9uPfdNX3vXtLwTX+yZUitF5d3+7NCLqlNRozMw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 12/16] ARM: dts: microchip: sama7g5: Add OTPC clocks
Date: Tue, 11 Feb 2025 07:52:23 +0100
Message-Id: <20250211065223.4831-3-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211065223.4831-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065223.4831-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_225233_945994_D8071610 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Wanner <ryan.wanner@microchip.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

These clocks should be enabled, datasheet says:

> The OTPC is clocked through the Power Management Controller (PMC).
> The user must power on the main RC oscillator and enable the
> peripheral clock of the OTPC prior to reading or writing the OTP
> memory.

Earlier discussions suggest, MCK0 must be enabled, too.  MCK0 is parent
of peripheral otpc_clk, so this is done implicitly.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - new patch, not present in v1

 arch/arm/boot/dts/microchip/sama7g5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index f68c2eb8edd54..b33204688b90c 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -1023,6 +1023,8 @@ otpc: efuse@e8c00000 {
 			reg = <0xe8c00000 0x100>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
+			clock-names = "main_rc_osc", "otpc_clk";
 
 			temperature_calib: calib@1 {
 				reg = <OTP_PKT(1) 76>;
-- 
2.39.5


