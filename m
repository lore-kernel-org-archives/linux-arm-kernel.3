Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AD7C61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 14:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFFuj3QQSZD7LeCNBxunYZwdaK7XJbhE0YBdQnmKYTE=; b=S4+6eD6KN9J5FoEf/Wc06cGTqE
	nV3SXecS905O47uVJyHScpDAXVtcDUo/AJ6e7smE8kEQy1TKUeDU6u9aeMB0u4B5xNB09lMJVoCKt
	tUj0Ynpm4Cc/zxk5rlhE25397o2fV8aFmAz1GC5RnNeF0u0ihXFhspef5hjE2fn35zfNoF2Td1EfP
	QNQ2LaPlYIFhI9C6XgqdTi9J8SkpesPUV34w5kZpVaYkYL+mdAr5vVg5rsLL2w3vaIzkWScaxN/zi
	Lqj1GzLpo+WUnPLafGoz/YCKlq3mPhr3v5W3T4taKK3E1+n2bsT0SBQ41pp+ROkrF7Rpnx3z88Twd
	eDPA4oDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gQd-00000007nDG-3tTK;
	Sun, 30 Aug 2026 14:22:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gQT-00000007n8z-1aQk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 14:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E6B743F96;
	Sun, 30 Aug 2026 14:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2ED6C2BCF5;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788099744;
	bh=BZZYf9REXU7acvmjIiBUNWktgp5lIoBvVJa7kgwRxaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eNhqr6xpKbNzIijALOoX/xtotFDjEGXPkyOKpU++3fMmEvqwUCM4S+6VxNf225UYr
	 Xs1suevVgwD3SAmk2tB/ZdPV2AEiZekptG1vwix2Q4zKiTnT6R753MyazvaYciSyV2
	 0RqY61QsA6yVP3TlRaQPAyyCscU8mC8wW67bCWkvO8JEdaUvYnsPgE2PrOpzAbEsS3
	 dmBTBc/RM3Ha5T74qLp4axAIqmHsuW+LCtuK2UtLmp2OKluqb8/651i8wSLpzbq0HY
	 YyML9FK+y8HMtrre8ASq5h/YSLLZ4Ikp0lkXkd6yAog4exFRgkehps3bQb+/W25HA1
	 43scpGWHQ4yQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D281FC61DEB;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 16:22:09 +0200
Subject: [PATCH 3/3] arm64: dts: apple: t6032: Fix cpus node indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-dts-fixes-v1-3-cc20f8445754@kernel.org>
References: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
In-Reply-To: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=BZZYf9REXU7acvmjIiBUNWktgp5lIoBvVJa7kgwRxaY=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9YUm/kbbz1N+Xc39Nhxa/8db+VatcWXH+ep6lVWXHDUJ
 b807v2jjlIWBjEuBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBE+EMYGS4EqpoEG/mtiji0
 N5h3iayH06Vom2ku/e/OGBkvfXEiP4/hf36xJZeTEpPt80+72K5fEj00oWnuaYWiiEYhrQXBTf1
 fmAE=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Drop the extra space indentation of the closing brace of the cpus node.

Fixes: 67d9574cf8ed ("arm64: dts: apple: Initial T603[124] (M3 Max and Ultra) device trees")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t6032.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index bbf19ecdaaec..61d044f3a734 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -283,7 +283,7 @@ l2_cache_5: l2-cache-5 {
 			cache-unified;
 			cache-size = <0x1000000>;
 		};
-	 };
+	};
 
 	die0: soc@200000000 {
 		compatible = "simple-bus";

-- 
2.55.0



