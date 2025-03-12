Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1C6C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3PExpSAgYFU633sginPVCP7ej78ofIXD9jecy4Y1r0=; b=SXo6nn7jIbLxbv8kdurr/zpXiV
	l124zCCSGkVm+ywr5wgWiqjSY91CnEQR6ArMeScpTMiqEnAGfoDmSeoYF5f8qDLTKXwkhu8uQfEzQ
	UN8hc4eTippV97FSGPdfyC7d2PCy7iFiri2i/5t1M0i9Un6erNDnGCHUOZM8SndPelcJcxVnw1Uox
	QvlmDKBtNdAP5V5cNBuwCX9IdZw6bUzQ/E9xVqKhSmliA2gRDJNw3/omkyD6FqMjiWzZ8Zp2tmkiF
	NDuVJYo0m4QBRhk+MRgph2PdkOEt6+hGP7JMJBwJUgYaZePlrItpDkxp4EPkyiJCw3vvPksxKl/Sf
	4AOU13yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJgC-00000008AIb-2jWr;
	Wed, 12 Mar 2025 10:51:16 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJY4-000000088R7-0np8;
	Wed, 12 Mar 2025 10:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=R3PEx
	pSAgYFU633sginPVCP7ej78ofIXD9jecy4Y1r0=; b=PlrYWyD+WuSgp9buUMnxE
	y/i9/ncmWxY5yLKey7KJPrLcyrKfszTkeGAmrqc7ZaGSmPvH9C0UhG0itxLGiqcC
	7Y6LK1j8Nbwd5ns5FCSA5OOgC5yzeb4iUmWjgqYuoiqfJzfZYujOwDT9n0tiEHBv
	JACdSdOrjykW4KxtQjesqM=
Received: from ProDesk.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAHUvcHZdFnEN_+Kg--.14177S9;
	Wed, 12 Mar 2025 18:42:28 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	lumag@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 7/7] arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX
Date: Wed, 12 Mar 2025 18:42:08 +0800
Message-ID: <20250312104214.525242-8-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312104214.525242-1-andyshrk@163.com>
References: <20250312104214.525242-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgAHUvcHZdFnEN_+Kg--.14177S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW7WFyfCryfCFy7Gw4rXwb_yoW8Cr1xp3
	ZFyrs3Krn7CryYqwnavF18ZFn8Krs5ua97Ary2qry8tFW7uas3K3WrWr9Ygw1jvF1xZws0
	qrWkXa9F93WDWaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j15l8UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqB4OXmfRYalQtgAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034252_557067_461982C0 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The HDMI Port next to Headphone Jack is drived by
DP1 on rk3588 via a dp2hdmi converter.

Add related dt nodes to enable it.

Note: ROCKCHIP_VOP2_EP_DP1 is defined as 11 in dt-binding header,
but it will trigger a dtc warning like "graph node unit address
error, expected "b"" if we use it directly after endpoint, so we
use "b" instead here.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 .../boot/dts/rockchip/rk3588-rock-5-itx.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 67b886329248..29f10ec9f0c1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -57,6 +57,18 @@ analog-sound {
 			  "Headphone", "Headphones";
 	};
 
+	dp-con {
+		compatible = "dp-connector";
+		label = "DP OUT";
+		type = "full-size";
+
+		port {
+			dp_con_in: endpoint {
+				remote-endpoint = <&dp1_out_con>;
+			};
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -268,6 +280,24 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&dp1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp1m0_pins>;
+};
+
+&dp1_in {
+	dp1_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp1>;
+	};
+};
+
+&dp1_out {
+	dp1_out_con: endpoint {
+		remote-endpoint = <&dp_con_in>;
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -1262,3 +1292,10 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
 		remote-endpoint = <&hdmi1_in_vp1>;
 	};
 };
+
+&vp2 {
+	vp2_out_dp1: endpoint@b {
+		reg = <ROCKCHIP_VOP2_EP_DP1>;
+		remote-endpoint = <&dp1_in_vp2>;
+	};
+};
-- 
2.34.1


