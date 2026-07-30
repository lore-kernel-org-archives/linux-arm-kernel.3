Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D00C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiynT78oIPX1RAHlRH5+0StsOYMM0ByoUKjomq2+Khg=; b=f6eNeuBK/dveDbHxykI8TddM8o
	OdDvJOKFdK/Z7rvT1Xp5wKCsyMSp9L3+s8B3lOekX4LudEZHAHbYHe2a1g1dr7rPV/R/7bnipEqey
	shy3YPETAw4Nk3XqfA5olNKZoF92+uHYCNJdQ4ouTW8ucmo8rF2nJpnYtDwBXeqLSzCBDHfh4bXTE
	2vKdR1hK0qWrab8QRU7q8yjH7xRz1Q7HbKSk275pwu/tjkIMoy9DHUSqqrCdQPa7wCsxyQ4Pynaxb
	yKexc2cxvM7tKfQR5LuWtSuQtXAgR1o44lPMawLJVrJFDEtoSiF1MyKLYs+oDubAkcuxJTegobjrH
	ZhDv+k4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRrH-0000000Alar-28vl;
	Thu, 30 Jul 2026 14:35:39 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRr3-0000000AlNl-2gRG;
	Thu, 30 Jul 2026 14:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785422102; bh=OiynT78oIPX1RAHlRH5+0StsOYMM0ByoUKjomq2+Khg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TboLKejonrBMd5pXR1CBLuVkl9eluURMKcm5fu4fnYBS7zV51RgT187dHpm73EJUD
	 Ey50fn3hIsM4vyAC7nHnRY83U0qNgd9R3YxiYJjLxzCZ+oVaezBAOA4xMdoJkzJfjZ
	 5NgpOsgv0u8lTevbgwObv9KMe9vZ1g4g1MQWTaaU=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 8B38245A; Thu, 30 Jul 2026 22:34:51 +0800
X-QQ-mid: xmsmtpt1785422099tb9ugx61j
Message-ID: <tencent_A982C9885A401DE2AB5F405336CDA14C7C06@qq.com>
X-QQ-XMAILINFO: M91SeYiYjPckoQIolAYWVdM2SqAync6XSnGvaPkVT9uD+DPfGzokokbZfIz5J7
	 u2+O1K7ittY2x5epwqXNh7IyfMdeYXWQPcSOxt7V+QRVd5fVpMICUdyan9FT8Gfyoep3+oanVk/6
	 cnx6L/BBHNtI5XnUaxvKb1/T8pEqvucHjgW59SNh3bJH2rwNc/h8dpiZITmimCXbMlCxD57VEIvG
	 LSgX/wPef8v0kOw7WPfwKk6wdy8P0URzCwmnk1OmVkKqlcopgyUiIAgcQtG3xRaUB6DpwJTMXkjh
	 3kVkazuHL0SejqiGO6FjnWTe1dWBCFJt+Fb5WmAZ66nrN3BnwhS1I1jKC0J3PP26XwXAfIcGqI2q
	 IGb+ZueM8kWoEu+W3es4xiE2Uvclk/d1Zw8jMbaWpukQ8fevoAm7v1KEuBLmrp7Um3FqUzbAJkrQ
	 pmGWCaISd0ASpIEUdSOi4Y79aHA/dnrLZW2c9X1p76/15fkHXFUj38HcEZWN2cbC2zF2zrVSQQIt
	 ZOmss7aW5/xKMdnsv67D3rGibt8RE/NR2MG1Kgnl2jDWLZhCxYlFGe+9B7CK1GBwvM77Zp9w2+N6
	 7OVV9biRr5wQg30s6HIgU22P1AzmcdvjCDigb0k/GLT2A/UKOWwE9A0BHHgfwMkoreMDja3MiNm4
	 FGk2fr/9DT0G5hOvt1BKaY9BLtpgxJ1K44MCAbD6IpuUZ+uWbZmR+Y+NAVZZrtv7dzby0GfLcVQ2
	 o4xRGaSKaMrZVMSBoH3CEPaA2McwOaAO9ashwH87dBbasV6IwoeqqxueW2im2pmbVrPmVlbGvmfW
	 jvhp6GgunIJO6KX1VC/S+SPKhJXpA42c4mo/ux6nxRIK9CII3mvsuo6PNpWLtQ24BmFYJYQ5idMz
	 4tgoT10j7J7OBPAqPpTViWLyYLkbCSSh8hJccoVLwn00iVer6F/oozyIZKxMwc7hDnQ/CVdTMt/f
	 C+BtovmeUxuCuKkCGepgRuBePR0Ur4yqTVKSJDoY0BWagSbib0sKqoVopx05HsP4oi9a8q8mDEZR
	 MwoI7+7cZWk1TWS1nR9m0uiqDlVzReO7Vn+UNQCDqWP9tOy45kEgnEzFlvl89fB2QNc45qTX/VIM
	 0q7jVX6E4d60p0McchSAhBJUpzgfUJKFbUVqWA7gN3Vw5E9+kOAwV64SnvYJQ3sy7S8Ut0
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Cunhao Lu <1579567540@qq.com>
Date: Thu, 30 Jul 2026 22:34:05 +0800
Subject: [PATCH v6 4/4] arm64: dts: rockchip: Enable CAN controller on
 RK3588-Tiger-Haikou
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260730-master-v6-4-dfb63e234775@qq.com>
References: <20260730-master-v6-0-dfb63e234775@qq.com>
In-Reply-To: <20260730-master-v6-0-dfb63e234775@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Cunhao Lu <1579567540@qq.com>, linux-can@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Heiko Stuebner <heiko.stuebner@cherry.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_073526_547888_6520F4D1 
X-CRM114-Status: GOOD (  10.08  )
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

CAN0 is piped through the Q7 connector to the CAN header on the Haikou
baseboard, so enable support for it there.

At least on RK3588 Tiger, the CAN clocks default to 99 MHz, limiting
usable CAN bitrates without skew. The RK3568 errata documentation
mentions 300 MHz as the default frequency, so request the same rate to
allow more bitrates.

The CAN clock setup is common to the Tiger SoM regardless of which
carrier board exposes CAN0, so place it in rk3588-tiger.dtsi. Keep CAN0
disabled by default and enable it in rk3588-tiger-haikou.dts, where the
carrier board routes it to a transceiver.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi       | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index 873fbeb8daa1..6c57c9f54a30 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -155,6 +155,10 @@ vddd_audio_1v6: regulator-vddd-audio-1v6 {
 	};
 };
 
+&can0 {
+	status = "okay";
+};
+
 &combphy2_psu {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 139f70e7bbd9..161c89c62bcd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -90,6 +90,11 @@ vcc5v0_sys: regulator-vcc5v0-sys {
 	};
 };
 
+&can0 {
+	assigned-clocks = <&cru CLK_CAN0>;
+	assigned-clock-rates = <300000000>;
+};
+
 &cpu_b0 {
 	cpu-supply = <&vdd_cpu_big0_s0>;
 };

-- 
2.34.1


