Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE541F43683
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FSAEtMkSceTrshpBiiAm6ioxzukZODs0quNCtI9vA8=; b=i5mbXXYKiMYg2Jlk3ku1G4LP6S
	QbUzddEclQZmdCPhWaCD76YvUrzrReQWA6SK7oU9RAIyvXq9iZdUNiKrK4N8P03zp+cZ5CFja/Xdd
	dGcfkVhzG1+FzERU67G14puIGWC9i92HxboD44Vr+RLfCsV0GrC9GHhzwTC3buA/JHGjquLZNR+WR
	MevFGZONLMsFIsjYDSji4L4adJbdPAFvZw3lBWa5PXRhUcPiNOu7MNFUtyIfPIMd1AkxJfXhT/T3N
	ASEojt5ukYYXPp2JL87YI0SsEkQCbRXFP2k3gn0Zyd6Yt/WCNIwgI0IBIbDP3aMgylSxdBRNjR6wB
	Y7XfoujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfTl-00000003myK-1iaB;
	Fri, 17 Apr 2026 09:27:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSF-00000003l4F-0uVt;
	Fri, 17 Apr 2026 09:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5FSAEtMkSceTrshpBiiAm6ioxzukZODs0quNCtI9vA8=; b=mMTjcdD7/I+2rKZ9x4SnScHA/3
	UUAkvMSZrQcSzUp3RLFSl9PBlfiTz29XIRe/Nx6eOWGwaV9OOHx3SxCuYX3PIxQE9EClrUUE4wB4W
	k9lST8KF/kk0KRJimxIOZeMm5LOJ9L9aNiVqcYUn2l7BiwQDEQPnm2NWNEX/jBFAAKjeekh24dpQL
	05okUC1rtnDU8i7fmUIjWRKDiD13dcFuYgKP7vVBzN5jgPYUNOt2X/kky3TqdYXaiPwGTMOffv1UW
	yqK+fD21BHLAzXp7lCjUSi5eJ9UkaMtKBtBWwsTyZu/L4Yr53J0SE8Nzkgp5Qh7Z2a2w68X20RJ43
	QL7PGIbA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSA-000000054Pf-403h;
	Fri, 17 Apr 2026 09:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417930;
	bh=Mj96npqe5eWQyiE9xQJGP2k+rJjcyPso7RNDzVb3ixI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hCVYC4vlBYbdG7U9oZ54/+F8L4WPyYxsTMzcCE9jgmF1bbRiLRbPj4rUmWD1ljOKm
	 SmrzOkH0MGFQEjF76+1sRO8E4Ewtdo5G4YJN/iFmkkHRTSTrCqHzO/EdIboeMjnsW3
	 VTnu0439lWdT0YZyp62t5DbQVtXmv0aO7akYoCrduXYn+pM9aKnIfKKKekeDW9wkrw
	 7ws2AHRvD0xIb57o6ZxzhyxsgvWJ/SE+t5TNVNQxtp7zrV0DoFBizY05ZZ0Vm3TBd7
	 pj/TPqyUOKaNrFXwKd7evJs9jWG5lxMoOS+uOlMRV+e+aCpwicfQsrKJQZeRFXpAKt
	 lcGKWxb78h/Fg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F20F117E137E;
	Fri, 17 Apr 2026 11:25:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:01 +0300
Subject: [PATCH 27/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-rock-5b-5bp-5t
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-27-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_102535_178717_094539B7 
X-CRM114-Status: UNSURE (   9.97  )
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

The board exposes the GPIO4_B1 and GPIO4_A1 lines to control the voltage
bias on the data lines for the HDMI0 and HDMI1 ports.  These lines must
be asserted when operating in HDMI 2.1 FRL mode and deasserted for HDMI
1.4/2.0 TMDS mode.

Wire up both HDMI ports to their respective GPIO lines using the
frl-enable-gpios property to allow adjusting the bias when transitioning
between TMDS and FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index bf4a1d2e55ca..924de5a69570 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -183,6 +183,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -204,7 +207,8 @@ &hdmi0_sound {
 
 &hdmi1 {
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
-		     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -505,6 +509,16 @@ &pd_npu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0


