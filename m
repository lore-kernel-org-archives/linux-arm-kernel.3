Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93EDE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0VwiM9nxxzmS+ePDHs5D4iy5/JOkHL4yMar6bNKC5+s=; b=eOIXIaHwdSLtHw53bO2DZjjyiF
	/a/Ur+zbuqXs9HkUjJTLeeTYFqO6KTMJwF5BIwnHDw/qZusVQM1zmcVFzI9CQJ78uCdJXDot5l5a9
	C3BxWIX2w9QwEq0HjyM2OPEnb96QyDbXC1xKby2oCGThAQ70tC5mZ1rdYkDuRcHbIosIEosjAoNCt
	H9F8FH2jxXx0CzFZvEGxFsDU61AngOkjL4am9+HH2R9e+BZp7g/zTREgbbqPJaGjJwKVazXjpB1Bg
	7S55UKiJEhxF0ww5+Khbk6ekdDzPjlp70MWlJ8dyaE6eQIINM/dLbmdYMI8YZv88ORIRvCY716evm
	vgeBXUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqgD-0000000BiJ0-2OEE;
	Thu, 09 Jan 2025 11:26:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqez-0000000Bhre-2ZjI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 11:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736421907;
	bh=N05fkHtT2/ScRMfQYWTPlP4NhcjC9bT8xvqCn1glVvY=;
	h=From:To:Cc:Subject:Date:From;
	b=IVszyOaqYxgHAmxWWvHTVzgHT6S5V37WjlVZ4x16GdF+wZQh1Mnlv6Fq6VTLasIlA
	 4xzr4pxF8zkyFeWF76jnWVM2mNWuiyh+xMXLfEqHHE1mT9lIySSWba8aBeWcDyf21/
	 jNVaX+tujl3ibOQsF6lmT4ecByuP7VIw2idzhjc6weozAFIQ4byQZwi99mS18cWm93
	 sv2whnaMUBhLLtaVSEyp+Yoi4m4+KZc/+StXYZl9gdo65Mw9sWPwBHWPTQJ0I8xNVt
	 7SP2MZr4/VwqtHQaOpsuqCEiFW8QZ5JbhzGKjhn2HrZiYEyETUKpmrIu1RqrKv1ze0
	 O/CG4kft+IhsQ==
Received: from pan.lan (unknown [IPv6:2a00:23c6:c338:be00:61ad:9488:9583:2010])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: martyn)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 50B6D17E1555;
	Thu,  9 Jan 2025 12:25:07 +0100 (CET)
From: Martyn Welch <martyn.welch@collabora.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martyn Welch <martyn.welch@collabora.com>
Subject: [PATCH v2 RESEND] arm64: dts: ls1028a-rdb: Add iio-hwmon compatibility table
Date: Thu,  9 Jan 2025 11:24:57 +0000
Message-ID: <20250109112457.553169-1-martyn.welch@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_032509_816441_67AB527D 
X-CRM114-Status: UNSURE (   9.32  )
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

Add an iio-hwmon map to utilise the iio framework and access power
information via the hwmon framework at the same time.

Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
---

Changes since v1:
 - Added missed PATCH keyword in subject
 - Simplified commit message

 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
index 757a34ba7da3..f23cf156734d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
@@ -94,6 +94,12 @@ simple-audio-card,codec {
 			system-clock-frequency = <25000000>;
 		};
 	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&ina220 0>, <&ina220 1>,
+			<&ina220 2>, <&ina220 3>;
+	};
 };
 
 &can0 {
@@ -253,8 +259,9 @@ i2c@2 {
 			#size-cells = <0>;
 			reg = <0x02>;
 
-			current-monitor@40 {
+			ina220: current-monitor@40 {
 				compatible = "ti,ina220";
+				#io-channel-cells = <1>;
 				reg = <0x40>;
 				shunt-resistor = <500>;
 			};
-- 
2.45.2


