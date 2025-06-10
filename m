Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8331DC7113C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qE/rfEQ0BSvD5l2KmuVrEAKvHDZFvMHIFsatoaAFjFI=; b=u1rxH4nKKrp4ubceAl+8W0WtKv
	SH8XlBGm2tiAOugoNl9KAxNGk3qG8Q5Z1pMjIJXzs2BlhtanvVemZHysP5f0g1dLtpQtiDMI1GCEa
	9aNnAtZMdZUCaj5DsjNRXT7/lG/i0i7tAPyyxuPp27n5vdkin/7rjouXGD/9V4MXeRLIOCqJD32cr
	/0CVhGSsQm2pSPeKuN0A64QSpm3oAv8yPPjUgsKuVdSShikeBn116Sn4uo5rSMLiNsl9zOwj83i7z
	8xSM+e58FOGtr0Ezku0qjkWluhNRWBmCCl+K0mcLDARDa4VogWSjmvxX2VAIEyDMJRpKzOxyNARsC
	h4vvAGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lI-00000008EnE-2jkp;
	Tue, 10 Jun 2025 22:48:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2bX-00000007bLJ-27Al
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 17:17:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC5534A56A;
	Tue, 10 Jun 2025 17:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AA47C4CEED;
	Tue, 10 Jun 2025 17:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749575860;
	bh=/oOOPnbIZun7zpCdcWpErbK1hHRhmjF7RqBExrZ88vw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kq6pLf3CXVh7TZHtX+jlnsOJq/MjD+DiVqPe85XWy+oED7SFnT5diodjhAxOzcZ7K
	 prcB0IwbfoWJr2g/Akv1et4lG6U3H/exuls+7BxZeW9+UStdc+2VsB8rlFmlHBUhjO
	 fvbQdhwOGJb1qML7JSgI8YLyaiOymeyXUzSyfml0YCNZBXDgwboDVaVXsPlVgdRNGa
	 8614LYExgDCDxUOz/YSQWCeskd/k55Qb6rvK1FebhosRZ+gQm1mF5YZ+48jwT9xTA/
	 HmiXmKeB5ev93ooD1pNu1kEw905vuUURQhpWqv3Q3QExRT7nbVz+STb1dMRZJ9R5/7
	 1jIyCEF6U61IA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C350C71132;
	Tue, 10 Jun 2025 17:17:40 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 17:17:35 +0000
Subject: [PATCH 2/2] arm64: dts: apple: Add bit offset to PMIC NVMEM node
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-nvmem-bit-pattern-v1-2-55ed5c1b369c@kernel.org>
References: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
In-Reply-To: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3530; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=/oOOPnbIZun7zpCdcWpErbK1hHRhmjF7RqBExrZ88vw=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZHxkauiXzqc+TuxG9Y+u/i3ydbn4he/GKjfTL0xdydy
 6tO77G82lHKwiDGwSArpsiyfb+96ZOHbwSXbrr0HmYOKxPIEAYuTgGYyNT7jAwfPr+SKNtcZnCF
 ReX+VWv2nyLvOxqdHpbvlTDtqtL995aFkWGKv8ujpB5dodI/Nm1P2jmb/y3fOaujIDuh78AGq0c
 CiXwA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_101743_587654_E2A2776D 
X-CRM114-Status: UNSURE (   9.64  )
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

Now that the dt-binding has been extended to allow indicating the bit
position the following warning about a duplicate unit address with W=1
can be fixed:

arch/arm64/boot/dts/apple/t8103.dtsi:764.46-767.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmic@f/nvmem-layout/boot-error-count@9f02: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmic@f/nvmem-layout/panic-count@9f02)

Fixes: 14b7178a76e2 ("arm64: dts: apple: Add PMIC NVMEM")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 6 +++---
 arch/arm64/boot/dts/apple/t8103.dtsi      | 6 +++---
 arch/arm64/boot/dts/apple/t8112.dtsi      | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 110bc6719512e334e04b496fb157cb4368679957..17ad9328baa14de66ff0f0fdf9e26b3f4a80524a 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -72,12 +72,12 @@ boot_stage: boot-stage@6001 {
 					reg = <0x6001 0x1>;
 				};
 
-				boot_error_count: boot-error-count@6002 {
+				boot_error_count: boot-error-count@6002,0 {
 					reg = <0x6002 0x1>;
 					bits = <0 4>;
 				};
 
-				panic_count: panic-count@6002 {
+				panic_count: panic-count@6002,4 {
 					reg = <0x6002 0x1>;
 					bits = <4 4>;
 				};
@@ -86,7 +86,7 @@ boot_error_stage: boot-error-stage@6003 {
 					reg = <0x6003 0x1>;
 				};
 
-				shutdown_flag: shutdown-flag@600f {
+				shutdown_flag: shutdown-flag@600f,3 {
 					reg = <0x600f 0x1>;
 					bits = <3 1>;
 				};
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 20faf0c0d80927b2e18dd966a61b5507b322c72f..76bab19f99c89d5c0a025fb313b53bac1f703bc9 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -761,12 +761,12 @@ boot_stage: boot-stage@9f01 {
 						reg = <0x9f01 0x1>;
 					};
 
-					boot_error_count: boot-error-count@9f02 {
+					boot_error_count: boot-error-count@9f02,0 {
 						reg = <0x9f02 0x1>;
 						bits = <0 4>;
 					};
 
-					panic_count: panic-count@9f02 {
+					panic_count: panic-count@9f02,4 {
 						reg = <0x9f02 0x1>;
 						bits = <4 4>;
 					};
@@ -775,7 +775,7 @@ boot_error_stage: boot-error-stage@9f03 {
 						reg = <0x9f03 0x1>;
 					};
 
-					shutdown_flag: shutdown-flag@9f0f {
+					shutdown_flag: shutdown-flag@9f0f,3 {
 						reg = <0x9f0f 0x1>;
 						bits = <3 1>;
 					};
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index e95711d8337f6cea898e88a3d564caf2c4f94404..a27e2312b0c73d5352a80dd050c7b314786add4a 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -809,12 +809,12 @@ boot_stage: boot-stage@f701 {
 						reg = <0xf701 0x1>;
 					};
 
-					boot_error_count: boot-error-count@f702 {
+					boot_error_count: boot-error-count@f702,0 {
 						reg = <0xf702 0x1>;
 						bits = <0 4>;
 					};
 
-					panic_count: panic-count@f702 {
+					panic_count: panic-count@f702,4 {
 						reg = <0xf702 0x1>;
 						bits = <4 4>;
 					};
@@ -823,7 +823,7 @@ boot_error_stage: boot-error-stage@f703 {
 						reg = <0xf703 0x1>;
 					};
 
-					shutdown_flag: shutdown-flag@f70f {
+					shutdown_flag: shutdown-flag@f70f,3 {
 						reg = <0xf70f 0x1>;
 						bits = <3 1>;
 					};

-- 
2.34.1



