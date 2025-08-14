Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77238CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 04:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1pO16L5QdbGKJ5VhTALDG/Y1jGCzjHpJyNtj9JR2aIU=; b=FT5aaEh5xw4F1SgE8Y8poIJPLk
	2tDnbvSXO1InzFyv8xeR0Q/BvBIsHpKITUT1rpPev5Z8hqNQ7TY8vrV/sYwgTnmRrZ2/u4u9FmiLr
	WECdEio6FJsv9klxyv/5aOMuCogjmEimXc+8YrzYfqAjcgq4KWlAJKnXoiWuf8l64x4EMQNDawfuk
	ktdEj0C8d64oxP6IGWgs4lEQikJyn18j8ebMVkVpR8zvTqkph17OHxKIUm7Mhea7qM750f8B/q8p/
	mJg4Mqf2mUoXVh7BuHwc0+ww4XO3v5NZbgdYpeYbETRjKRwYxEOaRer/SvyaX1d5W9uDWkgKEaG0K
	1RvynntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umPiT-0000000FlKZ-0Zx7;
	Thu, 14 Aug 2025 04:37:29 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umPfr-0000000Fl71-2IxI;
	Thu, 14 Aug 2025 04:34:49 +0000
X-QQ-mid: esmtpsz20t1755146002teef8830e
X-QQ-Originating-IP: Peg8pNWex+cqhVtTMZ0ezMqa3HAUy9biynpsprY/6KQ=
Received: from localhost.localdomain ( [183.51.121.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Aug 2025 12:33:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6940595432327476163
EX-QQ-RecipientCnt: 15
From: Kaison Deng <dkx@t-chip.com.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: honyuenkwun@gmail.com,
	cenk.uluisik@googlemail.com,
	i@chainsx.cn,
	damon.ding@rock-chips.com,
	jbx6244@gmail.com,
	sebastian.reichel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kaison Deng <dkx@t-chip.com.cn>
Subject: [PATCH] arm64: dts: rockchip: fix es8388 address on rk3588s-roc-pc
Date: Thu, 14 Aug 2025 12:32:30 +0800
Message-Id: <20250814043230.2774813-1-dkx@t-chip.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:t-chip.com.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OcFnI1CoIwQYoSw/arj5+ha4qGFv7aIhaNFHPWWztBoa6o8lJmp6Czjr
	ONbRUAgWKFMPVTNDVxFw0khZZ7zmTRyTBCNv0HII4mRQlPt24Po60hhbS5t5LTJAbEXSXQy
	rcyW/CWrGgBSwc3ajymZgkrRt8RbwrdJM4lJqYMA1Yx/PrvI8weuhnSvZrPDBGC0O4skzZK
	jjKY1r9t7YlxsR6/3NTpoJrUBz+LJFD+LpOBO/Iy2lZt3zr67C39s3/afftfDfQni4YvNbD
	1+VU7U3woXsjYTuCUoN4P7glNsrLrOumkLqMDk9hl6nXPzqUOFv3qSTQ8NxjiedEj3o/rrj
	RulqJucQIf1ahJTwMe+s2ZwAW/xi/pVQJ/yQ4qANHjOt5rA9w4hfoKl9vuLKwzBmSPer2Sj
	9EKbs+8vrJJDid6XvwRJXzcYY/KOSKLqskfUfuthLsXcGGFOKJVJ64Tgo5kygfA1MGFaCWc
	Llrio3Dkaxit10QSQb+LjdM2a67pBoiE2AaNTYCHOWjl8Ii6iCtM+mpRuPl8/0Gp4dgrNkg
	CUWw0H4U5xKkXthyhBouzvFemaBIzrdg+aAJwV6JnAXDQpLzdq+JQ9du5i3fzrLw5XfGcsw
	n45wEWai0g87XUwQSFhJulRoEjHlK/Zdp3n/am1GWgOWDBhItdWAb6XFYUhsqTmgeK6nZKG
	Z4u83zsZi6H0MuW8+B6kEvkm+YUlTkUJ4wwWSZHzE5nvDrrlzzhaCinc/0EXkLth9nKTTwv
	xup2uSNjCvRFso7BumNHK6Ywyywh4xqrhGdBnhIQb07IEQTILKvYjPo/hC3PKbHoitr6tuV
	xRikKu8HlYhE4ZxMjGiMZYCKoNQjub0ISpSOY/p5AqbPpc3gA5WtQpmHBsGUNd4W4Qtp/9e
	XJTW5j6RyneLfVvfHTlepGd7MuvDW7L8b6LZZEWmxLHZB4ZwWFLd90rUGOp/1y9FAmzxu6h
	pvivAPN/s3VKyTJ2dy8cwG7mq6yWAtzjtS3TnoerSysRgRVDbhH26b2MVMNnNU1jJgDZhxV
	zPwna3uRl+PpZW2GzC3yKoZsdg73Kmt5FBkwySOP1CKN560RpAGrongY8DB//6h3wHHfa5u
	g==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_213448_434863_500152E1 
X-CRM114-Status: UNSURE (   9.85  )
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

Use the correct es8388 address for rk3588s-roc-ps

Signed-off-by: Kaison Deng <dkx@t-chip.com.cn>
---
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
index 7434ac39246f..7e179862da6e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
@@ -320,9 +320,9 @@ hym8563: rtc@51 {
 &i2c3 {
 	status = "okay";
 
-	es8388: audio-codec@10 {
+	es8388: audio-codec@11 {
 		compatible = "everest,es8388", "everest,es8328";
-		reg = <0x10>;
+		reg = <0x11>;
 		clocks = <&cru I2S1_8CH_MCLKOUT>;
 		AVDD-supply = <&vcc_3v3_s0>;
 		DVDD-supply = <&vcc_1v8_s0>;

base-commit: 7f0817eee7ba40b48e956955d6fd8ba14750168c
-- 
2.25.1


