Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A036C5DF84
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u5HjavDM57+tHoNGzplZZwhNzCckopNZ0dngFdmd6do=; b=YflSHwdMb01oBykNxZ1VKbBNrf
	YqOOOceiJaRSYVzwg9rOdrcK+UAqa+g2hwG6jEuoDIMSnehssFh1TkR0cGqbn+hBtagX+gL9HHYE9
	qS6HI7r8erZX7n52P0XeNMwjIzPP5ZwhxobgI17A0tQikW7RF/B79piqFqTDOBB/q5kp2P25rYrvy
	BiO5vUffmR8vmCXa56cTa08MbtwKHeSUTocfE5S0Z1pj0d9adcGdxFv5FvOc6ubrEznexTCV2Nqii
	In9BKp2DmLVXeQ18e6i0kH1hYrrTupMyqlLIaGkSMfyAG+3mZMD7c/xrkd7dHi6C/VoNuDSrd8Xug
	RbeDknRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ8I-00000007x5f-2l8U;
	Tue, 18 Aug 2026 12:41:34 +0000
Received: from out203-205-221-164.mail.qq.com ([203.205.221.164])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ8B-00000007wzW-0P8J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 12:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787056885; bh=u5HjavDM57+tHoNGzplZZwhNzCckopNZ0dngFdmd6do=;
	h=From:To:Cc:Subject:Date;
	b=juSTHrwQZLAS//+DZHD1fv7iK0qwZWYi/2Z1wyBiKWTYekxlXwboJy3y3mNiNAJgh
	 pVvlgvyluynVCXG4PymOUhpD2vSW9m1RLRfkNEbZUFPer+flgpzXGVRq9z+z8HIWMm
	 rWt2beKEhKd3UQSGYxyLQayapGXUrRgZ/nemgLv8=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id A5618CC1; Tue, 18 Aug 2026 20:41:22 +0800
X-QQ-mid: xmsmtpt1787056882te8hosznl
Message-ID: <tencent_C64D9117A4A42E8C130360EA2F696559BD06@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoejfPLqL4ymCuTGrKCAiwaM+lnnOfRe++ZlDKbIwcFatD1fXNUSl
	 JnOgR7K/2j8h8LPaCZ+xr8krKe2LlUi6QkmFbQJF9m6kq1ltc5Q+QTcRBELYmvwrwmMxTdWJugp+
	 JnrByeG9Z57vKknil9k9yMSeLqq5BN4c5Iw+rpJ2phg2eP2fNaKNM0c/sliEgvQAHLT6p0Bt6I/N
	 KAW400fZWbGOVAXeheIjw36ui6H+AAOG0Pnfj5ovwlZdghDRbHGX+Fg5hAcXEn9PDM0t9psU7Cwk
	 Bsu9Y/tDhHRZztyAEG27qGGvG0JMOxYelAhJgk/YnElOpgL3T8MyhPiJs7GOf29rXJZhfIDQOKyO
	 SW2FRkWmaGZO47U5OBd4YA8u6iPcUOOZLKEYo2xVkt95Pe7XeGFbad9mmAqAPWpUiRaxPUDE5hcn
	 x7wSBc40BgagpQJipd0zlnIJkr2HEE2K+SupDGltdD09O8UG1W3GEhksMmDjvxlctyhJSXUIH65J
	 1QvEH78QGoKvMq+6IqjenmEvhVAhmLi8OpxSQB1Ox29jqgF3FOSM9wYn2ULQGGkq+q/BGIVrPJIt
	 jMGCpbh8abgXnGrRwP5B6L/FV0VtIFHa8L9b+qn0AIx4nYRQcipNAcGLybky7ejM7axfuocLuM8U
	 hsWgntyp+rJcMnvF6lOKWFC+5w0y3O+D6OgilU4DD0kAvJTR9UUB9P9ak96cujl1MDozAtE2W2Nb
	 YsiM9kPFWCammf4+Og4lyX+v+PUwGWw0Kd8eBzNm5fTYBBE7SHJtog1ncdlZW0SYEog+25uFb5w4
	 LHj6o2lVhkYwLcgCzD7eYR2YBKkP+AYFGiJGOW6QObRG6xjbMQomK0DweuPmHYpDyBclKfjQod5b
	 cSvoB6gP4SdxIHssQ7EOiHxZhc51/Qjq/EUBbsXAFo66KxS5Lq5OX8mMHM8PknXiRsDxWHI5ToP8
	 inCdF/HJsVLSrBBf+WSx+50ju9voh9mBMwy394eNBiCKfxUhUnlkoByMuM/8twucB1DJycBdKWTq
	 oaoolMIWRhlvn7z6r/VvmSxmDEId9Jt4XcehpGxVENaRcmYSLvPljUFQVkDN+sVz1qU2GSPzeDcz
	 u1b1vFQefrwn6DLNQ=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Jiawen Liu <1298662399@qq.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jiawen <1298662399@qq.com>
Subject: [PATCH] rtc: lpc24xx: fix clock disable order in remove
Date: Tue, 18 Aug 2026 16:41:21 +0400
X-OQ-MSGID: <20260818124121.246938-1-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_054127_474327_9F4DD540 
X-CRM114-Status: UNSURE (   7.56  )
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

From: jiawen <1298662399@qq.com>

lpc24xx_rtc_probe enables clk_rtc before clk_reg, and its error path
disables clk_reg before clk_rtc. However, lpc24xx_rtc_remove disables
clk_rtc before clk_reg, which is the opposite order. This can leave a
clock prepared if probe fails after enabling both clocks, since remove
is not called on the error path.

Fix the remove function to disable clk_reg before clk_rtc, matching the
enable order and the error path cleanup order.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/rtc/rtc-lpc24xx.c b/drivers/rtc/rtc-lpc24xx.c
--- a/drivers/rtc/rtc-lpc24xx.c
+++ b/drivers/rtc/rtc-lpc24xx.c
@@ -272,8 +272,8 @@
 
 	rtc_writel(rtc, LPC24XX_CCR, LPC178X_CCALEN);
 
+	clk_disable_unprepare(rtc->clk_reg);
 	clk_disable_unprepare(rtc->clk_rtc);
-	clk_disable_unprepare(rtc->clk_reg);
 }
 
 static const struct of_device_id lpc24xx_rtc_match[] = {


