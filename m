Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B757BC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zDRy0amAmiBw6egOaxifJbdE2F/pvrbTmoQr4H4lVeQ=; b=hLoGuyIxLc+97KAFYNgQUYpCyv
	mewJto56Y+/6AUQL1ksrUpLeNd7EHkoMLUO4SJpYVe6M+Kmiwrl9s7LwMlpbB/pPv5I+OVnzeF4Lo
	By4qQfqIBde2M7lNXp/018kfHK/lvY+f5vX7oeySkvhp8BliR37yEloWaB+IgJMj0jPhxKzmZQd1P
	Og7lTFdbc9Yz9UP4jhh/4snVbDYtRjUiCWYbSa/DOZrJmvoXT4d8W7iusRodZNDDm4sIi/MCkKAa6
	E1CWV34rThKoqZYW92Z8pu4bY8PCESc+z4TJa7gOUain2EhSpPPMpuWe6Ja3tgjbLMtIzdMAHG1nq
	CLWqacug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoZ9-0000000Bqyr-2KxF;
	Mon, 05 Jan 2026 17:40:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoZ7-0000000Bqy4-0oVR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F06A44393;
	Mon,  5 Jan 2026 17:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A218C19422;
	Mon,  5 Jan 2026 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767634824;
	bh=2uciPgKZTfAN+kHFN9+AWCUpup3++wuAGSvEJP++CVU=;
	h=From:To:Cc:Subject:Date:From;
	b=rxdJfilehYXTF2CXiJ68ugDkk0WeJK8N06jer4golHbxFQ+Kl18nLFOWgjY5ZxIlI
	 oyRraD2Lsu8pxVtW+nvLafUTgCQyRt13ut4qqNj3YWwW6rYG0uA1/styq2XtGTQFIS
	 TfiK/H8S6kr6tb1PSBR5imilYtm3n6zwFeqE5GCyqOheL1N0QWDjzYgvVx2MJW7Rwy
	 TcmkjPzAsWLiBQUHsH+KmHpxQzWIO4cZ20HrS0bpbUug8/Crxx5nVwkJoq9jp/7pWN
	 QrUoyINpByyFZPZWAFJYgv1oopnCyXHTFNRIpvtd2vwVVT1AEGSkiVpuZGcIrk5PCY
	 xPUY/US74WR4A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Wei Xu <xuwei5@hisilicon.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: hisilicon: hikey960: Drop "snps,gctl-reset-quirk" and "snps,tx_de_emphasis*" properties
Date: Mon,  5 Jan 2026 11:40:02 -0600
Message-ID: <20260105174002.2997615-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_094025_254248_C50F624B 
X-CRM114-Status: UNSURE (   9.75  )
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

"snps,tx_de_emphasis" is supposed to be a u8, not a u32. Since it is big
endian, 0 will be read rather than 1. The DWC3 Linux driver simply ORs
the value if "snps,tx_de_emphasis_quirk" is set, so the 2 properties
have no effect. (The driver doesn't clear the field either which is
another problem).

"snps,gctl-reset-quirk" is not documented nor used in the driver, so
drop it as well.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 3f13a960f34e..ed84ab92fb19 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -675,10 +675,7 @@ &dwc3 { /* USB */
 	snps,lfps_filter_quirk;
 	snps,dis_u2_susphy_quirk;
 	snps,dis_u3_susphy_quirk;
-	snps,tx_de_emphasis_quirk;
-	snps,tx_de_emphasis = <1>;
 	snps,dis_enblslpm_quirk;
-	snps,gctl-reset-quirk;
 	usb-role-switch;
 	role-switch-default-mode = "host";
 	port {
-- 
2.51.0


