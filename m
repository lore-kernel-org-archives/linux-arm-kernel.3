Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A018FD3CC8E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 23:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3FyQ8l8W5vapyv4/AJjZuv6MrqDzDHS9HXxBaes7wo=; b=W/aO5fCejaMh8OOReM6H87UhqC
	9ebE0zehCzNuz6/fTsuCXjjUA9yhVsKfKYUFGbYPZTUDuBPBQ18S1Blg2u0lfrYnfoJWwvdPOId9O
	OCK7im8uzsTyB5dPR8yKdPoENE11vNaKPW4sEvOwsc04rvcV4SYvZvi6PrwkDH7O5WtTTGrFpcR92
	lyhKWXCyhevLUI44p2BGkAQAYhdgp1cMxX7gS4FDvQtvLSMgc++9ruqtvb3Z9ouvjCkCKDd9jL1Qa
	dqEdjIe8n6OtVoktac33N0q1bWdhGdGTQjDEsn91cXL83TNT8iWV6/vwMrgzJ7SUSNQqDyFKu62Pt
	PtOBNyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9xe-0000000B1pb-46Wd;
	Wed, 14 Jan 2026 23:07:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9xX-0000000B1hO-02bU;
	Wed, 14 Jan 2026 23:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=M3FyQ8l8W5vapyv4/AJjZuv6MrqDzDHS9HXxBaes7wo=; b=byj12oTETIGnqf641qCNP1nArD
	NLg5VSPfB0yBx0mNeI1sIv9AJTdmKQbRFcNegf80YXw4Ez27pA7KYdLPPHwvmydYtMg7NfoCi2YZw
	ccYC6VMFg8CIVfQsJnpItyUjYga/1slTRDak1co8LsO0edfAvmlllaaAD8ULFbUK7m9pdIL88+VcI
	YJ4/ugdiGNb0OIr6OTghJ5UuHpjzPOQhJIVo4HtI2neNVNLify7a2TwAD/c84iVuG2zT3poQM/iSb
	yNnNtrlgN63BpbEOk6GR3aPDfuIFmTrPpryk2L3D+pNayw92vsqe3zSUPELr8N2BLMrQ1vFcUkKLq
	Cum2OFBA==;
Received: from i53875b96.versanet.de ([83.135.91.150] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vg9xU-002N2m-Ew; Thu, 15 Jan 2026 00:07:25 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v3 4/5] arm64: dts: rockchip: Enable pwm1 on rk3368-lion-haikou
Date: Thu, 15 Jan 2026 00:07:06 +0100
Message-ID: <20260114230707.4175162-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260114230707.4175162-1-heiko@sntech.de>
References: <20260114230707.4175162-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_150727_269207_6B265AAE 
X-CRM114-Status: GOOD (  11.68  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The pwm1 is exposed as BLT_CTRL signal on the MISC I/O pin header of the
haikou baseboard and the Qseven  standard specifies this signal is only
for PWM (either for a panel backlight or generic PWM).

So enable it in the Haikou baseboard for Lion.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
index ec843a1b0266..1b3a498d3624 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
@@ -74,6 +74,10 @@ eeprom: eeprom@50 {
 	};
 };
 
+&pwm1 {
+	status = "okay";
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
-- 
2.47.2


