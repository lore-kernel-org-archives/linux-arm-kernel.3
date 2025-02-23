Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373D4C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHczvSSk5h351i00BwsKZf8PI4LoDDRa7hJpbsRqGqM=; b=R7c0WojZ5iroA+EE87pty835fQ
	DZYwWxxiItA3th0j7vVuVXLor6v3NYinkyek5uhjAQRF3i5ZQSLatg2NQif17utZmEO2pom9zU5cD
	gPjKk28BQIljCm5KdHZ0OLUUrTxRQ2ss1aDMkSWsLiQWE22b5gwytx390M/XyYWBss0FaKFjt/Z5r
	kXy77ckdFumdF2gywSbY33eXcbAQLraXKmmvNWATTMg0YS5SRJGMo9oKv2di+oh9f4Y1Sun/cBCuY
	/ek8V//C0yYYa35RsmVGzc4gPru3J/9F7GZ5Q42/EdSb9B5RLdHlULMKm03uOsEZgdkg98FjcYssY
	/XnueSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAIK-0000000AzlE-0ea8;
	Sun, 23 Feb 2025 11:37:12 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmACS-0000000AyNs-3Sv6;
	Sun, 23 Feb 2025 11:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=EHczv
	SSk5h351i00BwsKZf8PI4LoDDRa7hJpbsRqGqM=; b=JQeth/Oj8PqnJ/7Xc69V8
	0q18sNMHKMpvnUHYpbvxUtKPRNab5OxjRFaduMGS25RZDFYBUkPemhCsT5rY5oPJ
	Jl1yfxCIdEm2/jiLsUeVLytyJV5pVsvDPf6ZRRxTzQfNHVbZo7w6fosQoE2MYI3Z
	Ny/WRhY1UlO9DuTaUv4oZQ=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHWqbdBrtnleHpAg--.47651S8;
	Sun, 23 Feb 2025 19:30:49 +0800 (CST)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 6/6] arm64: dts: rockchip: Enable DisplayPort for rk3588s Cool Pi 4B
Date: Sun, 23 Feb 2025 19:30:29 +0800
Message-ID: <20250223113036.74252-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223113036.74252-1-andyshrk@163.com>
References: <20250223113036.74252-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgBHWqbdBrtnleHpAg--.47651S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur48WF43Jw4ktFWxJw4fZrb_yoW8WFykp3
	ZxArsYgFs7urW7t3s5tF4xJFs8Ars5ua97Jr13Za43KFW7W3s5t34fGw1vyrWYvF4fX3yr
	tr1kXasF93WDXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXjjkUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hv8Xme6-oyBhQAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_033109_315456_FBB43D64 
X-CRM114-Status: UNSURE (   8.72  )
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

 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index e892dd7c91aa..0f58eb56557f 100644
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
@@ -220,6 +232,24 @@ &gpu {
 	status = "okay";
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
 &hdmi0 {
 	status = "okay";
 };
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
2.34.1


