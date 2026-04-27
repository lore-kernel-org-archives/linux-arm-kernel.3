Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAC3FF8865
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uhZliK46vNmN06GpBmT72mPTDJjzjGf3JsziDVDaJI8=; b=i3b0UFHZY45ChLqpgEJyPpA+MI
	CswtmgQlg7BxclH9RE0DbLiZPsp2qMFis+vNx4IkcJx7Jjik/APbrQKIA1ftFEr1R3nBYW+FM+fnV
	pGrCxqZHmKokCboNNTOD8GrHbizkTQsnfvIHft5I90IKidqfDVVG+CwNt2s1pSylvt8AAu0zHUX51
	XU+eyGJ9N3eG9jCCPg/Zygare4ItZFqslirs87neGbo8h9kZTW+binfBrHqmcO4GTgbnUID80VEUl
	jg3BDZSKwHj72hHTY5hfeVsP7B1qpyNmrYBg1Q4e/Yl7Fda2MbIm78ZHAKl8y0+dLr2YdCAodfmve
	6e/UzF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMTi-0000000H2VO-0hkD;
	Mon, 27 Apr 2026 13:58:26 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMTe-0000000H2Uc-2YSB;
	Mon, 27 Apr 2026 13:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777298295; bh=uhZliK46vNmN06GpBmT72mPTDJjzjGf3JsziDVDaJI8=;
	h=From:To:Cc:Subject:Date;
	b=KzPfB0Y8oiTm/ItS/Qr0nm0KEq0eQ/DHqi5UYEyWJOj+qcOEu0MxAMRHERnIK5K6w
	 TSCML3HvoVi7WB7NBt4u4jjY0giln7sSwMNYJaJFcx6EMqJZREC3XGlk9Cdq+6CyLA
	 BOJ904WJg+0o7GyEuTANB1e12+UHWHPupxh08sZw=
Received: from gwx-Ubuntu.. ([183.207.4.238])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id E860F2C8; Mon, 27 Apr 2026 21:58:06 +0800
X-QQ-mid: xmsmtpt1777298286txx3ao52a
Message-ID: <tencent_5035EEE630C845B1B51DEA4284DE23DCCE06@qq.com>
X-QQ-XMAILINFO: OU8np720w0N4z9oo858OjYSsBcV8oimpQiPSUMGVq/7ow77ou3/FfoYom8RgNk
	 KSHn+N5dq0/lG04kjGYkaUBVlVWAruhA0mIYv7N4PeaP+n6jJUdmyuJ0ELHAbdpTszJ17I8Xr9+0
	 35cyfi3KcMZCJviFAIylT5dR+784ydOGIUs4dKQF+CZo5jlDxyv7bdJbkKoUqtNLVyeFTvNNOqH8
	 SYnz0wjdbGJH5ExGXioHQeaTHVVx5i0oUjMy/zvzF2UgLVTlWUYrr33PZnbadTfu3gCq3htt0f5v
	 B0mUb0HVGOgGQhqWa00rdTPjgol2DrKUZk2F/Sp4Y+mJVIdkvwv03CMYWl/mpDwobzx+DAURuxnK
	 nSQ00nIcC07g02XcXX1qC8qE2ecnHNTb8IMyVhUTBZbZqOAswloNDaCdOdRfeWjrXuc8RW1QeFu3
	 nts/4POZsMXPfWZBij9hXiXjKP32cbaT4Sf75VSGjnNsy5Lf8UHZbOEaut9+Ruj5a+ax+jEzbPuN
	 3iak38TQZxcItD+nDq5TIPDKjdbPuv9xk+jiidZaZ3Jbv2Gq+dKDjy67deO2jYmvUwFQ1aC8NrnD
	 mtrLyt/GJEQZCi3hhIH7xqXKznJH7Wfb+D6+InpSGI6JX4bmx7WduG7QNn1+8B0KE2T9XVDhh6IQ
	 nkNZMBi+DucXp63VUzri937Co7zL9hZr0cDKPzc4lMvTovCpOnOVDLJYh6nmCSi9/2GBo7/hWPQf
	 CYiygnnYNFecbzsGlKIv2Ho63txR1Es7TWdA/XM5npr5ouILdRhESnn985VSHoSSAZeLR7gq2Ukn
	 AV1aFx+RufoxNiKsBrpUBIZmZBM2kH0LH56PwkaYgmp1uqN39Dg3xnKKH5IuiFZx+3cW+1FScmt5
	 FzrwAUSlH4QaMV+TipXZGHyeHAnRsbv0wtffr9xjGlAcFLLOSptgJ43Gjjx3g1UkkPztnX8gnjOx
	 /uGIMfLdl60fcp+Hh5jOPfUXzZ6IRTNqc7BsSmmfAc/JEp+tQ8AobEXUyahYGIcq6k8TKXv43TC9
	 6Z6dIm1AGBur/jd7kAFV/XtdLQRB2XK/1iCYp5975UW6VlUSi8NvVFLUpJTHk5Xo32o5+kgyL5hy
	 TMyWps3oL5YCVKDOioZn3mw7Yz24xjrVWkq6SC6pHq15S8ZJLVsWkpT2k8FWXIs1QZGZI/42vE2g
	 qP5dI=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Weixin Guo <2298701336@qq.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.kardame@manjaro.org,
	pgwipeout@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weixin Guo <2298701336@qq.com>
Subject: [PATCH v2] arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc
Date: Mon, 27 Apr 2026 21:58:04 +0800
X-OQ-MSGID: <20260427135804.754895-1-2298701336@qq.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_065823_001286_4591CC72 
X-CRM114-Status: GOOD (  10.53  )
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

The RK809 PMIC interrupt pin on the Firefly ROC-RK3566-PC (Station M2)
is physically connected to GPIO0_A3 (RK_PA3) according to the board's
schematic.

Currently, the PMIC node incorrectly specifies RK_PA7 for the interrupt,
which prevents the PMIC from correctly signaling interrupts. (Note that
the pinctrl node 'pmic_int' correctly configures RK_PA3).

Fix this by updating the interrupts property to use RK_PA3.

Fixes: 30ac9b4e25d8 ("arm64: dts: rockchip: add dts for Firefly Station M2 rk3566")

Signed-off-by: Weixin Guo <2298701336@qq.com>
---
Changes in v2:
- Updated author name to standard "Given name + Surname" format per maintainer's request.

 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
index 7e499064e035..985770e3a5e2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
@@ -245,7 +245,7 @@ rk809: pmic@20 {
 		compatible = "rockchip,rk809";
 		reg = <0x20>;
 		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PA7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
 		clock-output-names = "rk808-clkout1", "rk808-clkout2";
 		assigned-clocks = <&cru I2S1_MCLKOUT_TX>;
 		assigned-clock-parents = <&cru CLK_I2S1_8CH_TX>;
-- 
2.43.0


