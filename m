Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68C5F43683
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqR6e7mGEHYAWR3QQWmXJTzL6gO1pRUin2VrxIcFaNY=; b=eJ4j/dYG3WGLRfwf3k+btywz+B
	1189x3yrMVTAzfPMl1/o9Ac9niED3t3oiZFOZXnKyEbCKlC/6WRYusMhzgL8+em+ilEIakdhN+LJH
	qcQQpG1P3zfND9E6prCsTLv0fezqrE/G6QOiMr7WACLE2vo6jsIIFIpdEWuykIwkH4XTpjI8xU8U1
	RaEvNoo366gvtf0LG54jh7SnQCNjDkCLsHDEwSszWnzcvds9pokIa9PH3LxJp9SClxbjqnwNn6dBt
	v/VPSBfGzyySTzwrbLSopYZOI4vKNdyFQTsg1FDNuAXQGiTJnYXiZsUsrSy6hBlHueViiaYTW6zVG
	8PVihe8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfUC-00000003nTT-0Y2T;
	Fri, 17 Apr 2026 09:27:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSF-00000003l5q-3mnl;
	Fri, 17 Apr 2026 09:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VqR6e7mGEHYAWR3QQWmXJTzL6gO1pRUin2VrxIcFaNY=; b=J7kfJCdDmVDl6mhWHz1Wjt4nGM
	1wbO3l+Itdh35XMO1zKIUGQmlI4tg8hv7pgLPVS0Sht3GmNtKh2/agHno0GpoCFfVJ6bMHQF2tSsB
	ztfmMTYQyeMWh5B7b3UpHGC83R+rCqQPIl/ImgluTl+r6q1e1NHMS8IT+5jHo5RBEOz4Vj4+nBL1D
	1u7eBPDq9gwsXUct44G3JAxBkAVt/CzMsutGgMnY+2KxT1zYYr9uM7E2Wwfw4W2TcjcXKEZz8ZM8M
	IdO4Ms7D3PvdjJFtK5qX1HzQWB7luMBFJf209ea4WUomsKSZBGc0O70xxQ0pOibqGn8SV6ZeFdHUW
	KdIJhHTg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSA-000000054Pn-49Dk;
	Fri, 17 Apr 2026 09:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417933;
	bh=EZy0iRhW34YjUTSaavNlkSZjuxVOhJZt7v3evV/vx0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ESGbskLvBEHqBeEqbRvHjjQK0OF5s6+2RFN2ayhjJrvMg7RGWLiFTMtDqBg7zw+Xo
	 OWIAJJfWqyNA8YGR7QXGGbPogpR8gIZ4LjEKVo56O7PKeepxsariPdzeB1Gy02vflZ
	 JR/9RilwrD2ZrF3x54mg9qOqtHYcVGrtJVXBYb3c72ESuyJs+V+cVxQPTOne/uL9rT
	 7QzREys1MBmBhJAjOAw9QpVtzYmG3Ul5KtBFM1Llh/VZLP3GRalN/bUdfWa/lLCwGN
	 b1UGGkID9mu8tCWEi60/igzrZQg6e93+aMvolqKuu+7Vd1TZI9O6geGTpOZXR7L8pJ
	 njDhskrlqJudQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3479117E1340;
	Fri, 17 Apr 2026 11:25:33 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:05 +0300
Subject: [PATCH 31/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-indiedroid-nova
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-31-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_102535_205495_8FA37EE9 
X-CRM114-Status: GOOD (  10.98  )
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

The board exposes the GPIO4_B6 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index 174d299cc6bb..9a98574ecf7d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -278,8 +278,10 @@ &gpu {
 
 &hdmi0 {
 	pinctrl-0 = <&hdmim0_tx0_scl>, <&hdmim0_tx0_sda>,
-		    <&hdmim0_tx0_hpd>, <&hdmim0_tx0_cec>;
+		    <&hdmim0_tx0_hpd>, <&hdmim0_tx0_cec>,
+		    <&hdmi0_frl_en>;
 	pinctrl-names = "default";
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -517,6 +519,12 @@ bt_wake_host: bt-wake-host {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 
 		hym8563_int: hym8563-int {

-- 
2.53.0


