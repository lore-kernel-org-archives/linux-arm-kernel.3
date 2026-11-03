Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9636070AA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PKJEmths;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=La+wt0O4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=82BvmWOY3UHYSQatbXCiejLma5rEulIN7cYz5EX3x0I=; b=PKJEmthsuHLfosif1XXd1talaT
	pmQdU1WSp9QSJOdEvAIeJ7BkZXMTiYJTkQAeaSQAr7pEHNBTfdDkJD3ooRv0IAsDvhMvXs5AjJl0J
	MalzlKF3r20aUOmZ3b2uhHq0KubCEbRNH7nQH8nr822GXEsm6wKzTNiNvDsNzkxvooeMmo/z2t69I
	TLKoqIhO6Ot4avQii/HFk49naxUqKQFgukq1+Xy7x3zowutn6g2p09BrZjuImEKJ573CI8GMdNlqq
	nKDIPNquL/fitCWsknHWLhysJ/PGNSal7LhHEMXTOCLnbjGR8WjCTgml8tS8pnu+bNlMaJ0IJAOkF
	LowsOPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBXk-00000001vSe-3LZ2;
	Tue, 03 Nov 2026 10:15:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBXY-00000001vDV-2wrg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:14:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 763C743F7C;
	Tue,  3 Nov 2026 10:14:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793700892;
	b=PS2iwRo6sf+SWiw7/VDelacHBZcKb3tXW2UA58/NUJiqdRv8TBliLvmRvWMdpGCt0GwR
	 +czSNCO0STVjOesBPc0msmNbIMjZS5uwUzcLag2XabUFMcyTP/xv6FB5Ub4R8CfLzrVHL
	 TMVVzj3NJRTtsAORdx2/rvALg2HGC9lX1fs0OyXwG4ZCsZxlA1Y/m9F2XqjS16m5JG5lU
	 zTNv5s33Zc6Am+s81RuADIdVV5eC62B+MwrXkpSHEtH5Ldx0LM7D4tFEo93WcUGxcd9D+
	 Gp8IP28meeBTVHM9rAlmKW7c8POFMj0rB5PJA6Woydnc57f2/2w89VsQKNedgHxIm+g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793700892;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=82BvmWOY3UHYSQatbXCiejLma5rEulIN7cYz5EX3x0I=;
	b=Sy/kPYW25WXgw8ZLj2KDw7cbvTLeColNmCRfUMIhFkonKEJUsUElZuAeU3Rd/t/M1D3G
	 8hdgD2JJn/zVevi1hUAD8Mtwa64iB+UW/j7AKu9CJaCAZiFcE3k7UNyB5RKiFC2M5KHxQ
	 asBlzC7Jif056eejFUDMCJ/eXEK9JBNtB5Yo71fiy2Qf+2uLld/K0s52iBJwg7WCrlwgx
	 ap9EtkXF5LeU7Hae5ayACgRUOWrAnvLoyaUbTZGXBFvU0JnmrH/X7x/9+Y90K89oSnjmp
	 UCDQe2ic+84G9Q1PK3ohyqyZkPfb+/KaZiUGIZtG/V2liwJjMJcmiMZJ7pU1TQxWCkg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0320E1F00A29;
	Tue,  3 Nov 2026 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793700892;
	bh=82BvmWOY3UHYSQatbXCiejLma5rEulIN7cYz5EX3x0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=La+wt0O4grbU+kfOx4qaeZwiq7H4TeH15xpP6nYzn5/jz9LSjzTqKIwKuHQAT2wnA
	 zDxl0mKSGBMAXc2O0dDOi+6ED6ZtuVJ2wfogolPbe/YCpsdDiT+7+PwF2dBmvIRFYt
	 fkrqsLUmiE3E3VGbuUsg0Wlu7jwuBZ7IV2bGyQRpizbXXCHliCDayR4XftrErZx7OV
	 /uXu4QYxjxB5tuasJqidkicX3ZbXz1sGlZycfQ5awm5vsEEO4OB9AwiOSkSoIF0N/Z
	 Brci6FfgzEIITBzR57BwT6CGFQIFy/143GuHmxzUJrYDy5igz1y5slMnWr38GaGBHJ
	 Q3uEeX/FizEaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0F477468B9;
	Tue,  3 Nov 2026 10:14:48 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 21:14:45 +1100
Subject: [PATCH 10/13] arm64: dts: apple: t8122: Add PMU Device Nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-m3-plus-pmu-events-v1-10-a8eb6c1139fe@gmail.com>
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
In-Reply-To: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Yuvan Shen <yuvanshen09@gmail.com>, 
 Myria Sarvay <myrialsarvay@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=849;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=rNa2BkUs4YYaDGXSrrZeznuk/MnM9Ng1trURn1MGr4U=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYsl5uEb16urq0R9FsThrb09xdr40Xu/WpFJstOdzOp
 lvWtudNuW5HKQuDGBeDrJgii75pmvZktoZLpctct8DMYWUCGcLAxSkAEwl5zfBX+O3Lz38XXelm
 Pm+XKvxsLWPDjNk+Kzi5zxg6SJ488/xLL8P/TEureyEhnVIt4k9es8aUWD/j2LWc/e/11Z4Omz/
 NN7/KDgCApkwq
X-Developer-Key: i=myrialsarvay@gmail.com; a=openpgp;
 fpr=2F35662B930680D275A645B452444118A8ADFEE9
X-Endpoint-Received: by B4 Relay for myrialsarvay@gmail.com/default with
 auth_id=1027
X-Original-From: Myria Sarvay <myrialsarvay@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: myrialsarvay@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Myria Sarvay <myrialsarvay@gmail.com>

Adds the PMU nodes to all t8122 devices.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 959ddf36efa1..c9e81a6cc9b7 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -180,6 +180,18 @@ l2_cache_1: l2-cache-1 {
 		};
 	};
 
+	pmu-e {
+		compatible = "apple,sawtooth-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,everest-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;

-- 
2.56.0



