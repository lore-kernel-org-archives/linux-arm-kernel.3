Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D004BC36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 03:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBmaI1F3khfg5+m2nr03cMmSVAdLbuEwhA3VNeIpdUo=; b=LTo6RIr88n1se0GNB6cxA0497h
	AH78s2Mlt8N+fWTOxs+BHpTFFs+/Pgg7o9/FZfKS6CLEsy867Fp8nvfYw9NVVcJpERHmptz7JiMt+
	JxDtYCm38c0iZOlytSv0foZNxzwNSyGrhPjUyeZnpzGL+Y6fVcJ91cjMMGbF4rxTKRNJ0DzQaE19u
	GKsZGyT8ZMWfGbuldxvmqhNfY4mnuEYoV8Mlzn0sLiJOYYicK3w6qb0Os8d2pPlkrm8nu8lzBLGPC
	Gt5v23v2x+yXMH12QX9iOh6z7LB61KqWuQC4uxd/EY8SL+P124V5/qeFywBatYX44WzqUMWBWGEJy
	hYuFJ3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0BZk-00000007ha1-3ybw;
	Thu, 03 Apr 2025 03:49:09 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0BPL-00000007g5H-2TYf;
	Thu, 03 Apr 2025 03:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=VBmaI
	1F3khfg5+m2nr03cMmSVAdLbuEwhA3VNeIpdUo=; b=A/N1wYSkhEBxPy3/zSEFm
	1YvUyu2XuVUqZV4lNTWWgz2NoKTqi4nj4Rp9WjayfT84hzKgvO7B3ntS0OizdORA
	TPYbR4Ioy0VU99zUwf8+E0kJOjKMfu//Vq3cxM8nKNjTz660mUm+kWeKb4JnLzvZ
	sgwLsfMQpyqucZOs1xcpbY=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHWgmNAu5n7FfDDg--.28713S10;
	Thu, 03 Apr 2025 11:38:05 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 8/9] arm64: dts: rockchip: Enable DisplayPort for rk3588s Cool Pi 4B
Date: Thu,  3 Apr 2025 11:37:36 +0800
Message-ID: <20250403033748.245007-9-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403033748.245007-1-andyshrk@163.com>
References: <20250403033748.245007-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHWgmNAu5n7FfDDg--.28713S10
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur48WF43Jw4ktFWxJw4fZrb_yoW8AFy3p3
	ZxArsYgrZ7urWUt3sYyF1xJrsxCrs5ua97Jr13Z34SyFW7Was3Kwn3GwnYkry5ZF4fX3yr
	trn5XasF9F1DXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jY9aPUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g4kXmfuAW8woQAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_203823_998546_80F396CA 
X-CRM114-Status: UNSURE (   9.13  )
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

Enable the Mini DisplayPort on this board.

Note that ROCKCHIP_VOP2_EP_DP0 is defined as 10 in dt-binding header,
but it will trigger a dtc warning like "graph node unit address error,
expected "a"" if we use it directly after endpoint, so we use "a"
instead here.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v2)

Changes in v2:
- Sort in alphabetical order

 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index e892dd7c91aae..4f471da1d866a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -39,6 +39,18 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	dp-con {
+		compatible = "dp-connector";
+		label = "DP OUT";
+		type = "mini";
+
+		port {
+			dp_con_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+	};
+
 	hdmi-con {
 		compatible = "hdmi-connector";
 		type = "d";
@@ -215,6 +227,24 @@ &cpu_b2 {
 	cpu-supply = <&vdd_cpu_big1_s0>;
 };
 
+&dp0 {
+	status = "okay";
+	pinctrl-0 = <&dp0m0_pins>;
+	pinctrl-names = "default";
+};
+
+&dp0_in {
+	dp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&dp_con_in>;
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -889,3 +919,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};
-- 
2.43.0


