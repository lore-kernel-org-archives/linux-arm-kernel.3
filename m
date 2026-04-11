Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C4FF3ED4C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tY+MWIgerZDZMC5nEmhhWGHXS7tYtHnjGnyCGjmdwdA=; b=ObzqB/EawNN2yeDoohUI10Dprc
	ppFTOtWYYRJjpwbUGOW9Kvl0jIN4RkPHRKHx4cdeCuf8YCLUQa4d2OhGj37+blCGjhJY5LQ8/GESs
	Hz/s3Xpi+GY+EwrHiQAHbsd6+1IECMsHdU1Bt1Zh5HtQ4igBV8VRbK2ZzEal8gZTezN31U+alO5J9
	jHFj6Rv8998jdY9ncT5aBjtw0DYBUCVnBxrkqlJr3ox0sPebmVjDis2T1QKsI6yZqBaihVBPYGFFU
	/nIUL1AW5+ql+pqZP37s39LeZHYg2OgOVU/5K86guC/Gdv9JQCiLps39Zqi5GhrX09yBC3T+n/qnj
	eC58KJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXzd-0000000DS8I-0eRu;
	Sat, 11 Apr 2026 13:03:21 +0000
Received: from [2a00:f820:417:0:178:251:229:89] (helo=mx.nabladev.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXzX-0000000DS7C-35yS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 13:03:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C073011371B;
	Sat, 11 Apr 2026 15:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775912586; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=tY+MWIgerZDZMC5nEmhhWGHXS7tYtHnjGnyCGjmdwdA=;
	b=Tv/MiZoz2mDF6OhoVBBgkhaOmCNXJLfj4Me2rHdSLas+bEnY9T0hBDofBHW43DKF6glu+0
	Ihb3tdMKB2Wsr2Sd4jj0mlnsSy4ME5teogtgdL3pNR0uqsp1usSD6dnZPjOsRjfpPhceGC
	0z7PkANosekLZ6D+8ApI0Vj1/djYbhwSJtfORIQSMvJGSQp/OEpGwNDNxyIRs1c2LKf1H+
	0JWJsZHq9ABlW4LeIHNx/hv5wwmYFwZZkaNHSrPJlf2swiYb/t8/DLsFejI2I6RLI6dSZd
	dSI1toTwf9P2W7OwZxD0Rsw3cJAnUi4KQu/CGpBV2w0/vD2qpXMrbt8c2sc/+A==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] arm64: dts: st: Fix SAI addresses on stm32mp251
Date: Sat, 11 Apr 2026 15:02:35 +0200
Message-ID: <20260411130300.19603-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_060316_013450_0B712946 
X-CRM114-Status: UNSURE (   9.39  )
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

The second field of SAI register addresses should be within 0x3f0 bytes
from the start of the SAI register addresses, the second field describes
the ID registers which are at that addrses. Currently, the second field
does not match RM, fix it.

Fixes: bf26d75a95f1 ("arm64: dts: st: add sai support on stm32mp251")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e69..9c63fdb5a885a 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1202,7 +1202,7 @@ spi5: spi@40280000 {
 
 			sai1: sai@40290000 {
 				compatible = "st,stm32mp25-sai";
-				reg = <0x40290000 0x4>, <0x4029a3f0 0x10>;
+				reg = <0x40290000 0x4>, <0x402903f0 0x10>;
 				ranges = <0 0x40290000 0x400>;
 				#address-cells = <1>;
 				#size-cells = <1>;
@@ -1236,7 +1236,7 @@ sai1b: audio-controller@40290024 {
 
 			sai2: sai@402a0000 {
 				compatible = "st,stm32mp25-sai";
-				reg = <0x402a0000 0x4>, <0x402aa3f0 0x10>;
+				reg = <0x402a0000 0x4>, <0x402a03f0 0x10>;
 				ranges = <0 0x402a0000 0x400>;
 				#address-cells = <1>;
 				#size-cells = <1>;
@@ -1270,7 +1270,7 @@ sai2b: audio-controller@402a0024 {
 
 			sai3: sai@402b0000 {
 				compatible = "st,stm32mp25-sai";
-				reg = <0x402b0000 0x4>, <0x402ba3f0 0x10>;
+				reg = <0x402b0000 0x4>, <0x402b03f0 0x10>;
 				ranges = <0 0x402b0000 0x400>;
 				#address-cells = <1>;
 				#size-cells = <1>;
@@ -1362,7 +1362,7 @@ usart1: serial@40330000 {
 
 			sai4: sai@40340000 {
 				compatible = "st,stm32mp25-sai";
-				reg = <0x40340000 0x4>, <0x4034a3f0 0x10>;
+				reg = <0x40340000 0x4>, <0x403403f0 0x10>;
 				ranges = <0 0x40340000 0x400>;
 				#address-cells = <1>;
 				#size-cells = <1>;
-- 
2.53.0


