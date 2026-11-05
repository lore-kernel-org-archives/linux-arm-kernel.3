Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC092606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=stRyUrWA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KX1psBg3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oXC0xO4zLhmVGs6KoURlIdb6x3QgmfrvscYjlJ8lq1E=; b=stRyUrWAM2jdMU
	tZV4tQzWugEJZC3XxxgDCTkshbknnatOJEPgz36Kuer0AHmzfcG3ynhWix/o6huqqijxTJezFsxWy
	pIfkFVwx7PbfSkifDIZu3HCitUQuYuaRolInLpOD5cVCnhuB4MPVbMxSWONJpt63eY8SVL03EuwTL
	3WeoBGZ9TuGTS8+s8zsuoPXYOVW3ty56pKswKzZIrrk0TBTQ2SPQIJUuENzTK71aZs6zd9JTtkHOv
	kiu0mE6TTExMRxTDo9lsL8G0hTY8gBwsvGuHg+w1DvNANfdgYLpKYqLgIvbOvF2yU2nWFteMqBTfP
	zroYf086zNIJOwAiL11w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62o-0000000AoZO-254V;
	Thu, 05 Nov 2026 22:34:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62V-0000000AoQ5-0udS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:34:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A918A600C8;
	Thu,  5 Nov 2026 22:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262191F0089F;
	Thu,  5 Nov 2026 22:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918074;
	bh=oXC0xO4zLhmVGs6KoURlIdb6x3QgmfrvscYjlJ8lq1E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KX1psBg3zJQ7zeMKw49FUfKb6aUTjYarvYcFw7vMZUjCWNa5IF5JdfsownZSOlJkd
	 M160PX/O0rcLqu27r4aWz4t6mCPT2i/dhGu59dhG5DY25e0COGXkm8AFQSiS3knE+c
	 KUO7Sb3lcMg3YVPW0Hv6C8ZxRlUjOjlpUn5/vJjuHJWoGnEb30nfkTm/vj75XzVvYI
	 FH94nRl58QuA7n0UhwJrdWmkjIn7/Z6t/qruWc39+BpQyZNQWkzjOI6CTJF8I1WRXG
	 Fg9EMBi/fCrGu58LfXaN+o05NHTAh9KmeQfRcpNyOsS1EUM/YQ6XL5oS0/0hpjMIts
	 IrfLrVOWryFQg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:18 -0600
Subject: [PATCH 5/7] ARM: dts: arm: Add missing "#dma-cells"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-5-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"#dma-cells" is a required property for DMA controllers. Add it where
missing.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/arm/versatile-ab.dts          | 1 +
 arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts | 1 +
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/arm/versatile-ab.dts b/arch/arm/boot/dts/arm/versatile-ab.dts
index 907c3dd2849d..f1c927e8a8fc 100644
--- a/arch/arm/boot/dts/arm/versatile-ab.dts
+++ b/arch/arm/boot/dts/arm/versatile-ab.dts
@@ -234,6 +234,7 @@ dma-controller@10130000 {
 			interrupts = <17>;
 			clocks = <&pclk>;
 			clock-names = "apb_pclk";
+			#dma-cells = <2>;
 		};
 
 		uart0: serial@101f1000 {
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
index 72a65a83c7c3..dd68250fa999 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
@@ -122,6 +122,7 @@ dma-controller@7ffb0000 {
 			     <0 91 4>;
 		clocks = <&sys_pll>;
 		clock-names = "apb_pclk";
+		#dma-cells = <1>;
 	};
 
 	timer {
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
index 7b74ba30b8a3..8f210671b287 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
@@ -207,6 +207,7 @@ dma-controller@7ff00000 {
 			     <0 91 4>;
 		clocks = <&oscclk6a>;
 		clock-names = "apb_pclk";
+		#dma-cells = <1>;
 	};
 
 	scc@7fff0000 {

-- 
2.53.0


