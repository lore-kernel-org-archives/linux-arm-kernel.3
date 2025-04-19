Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4972C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgCIG/KUeTm5AFeThSZkpuDFjJWXcCxfvkAjBpN4Wug=; b=TO7Q8lDmcDd5b3UbzijpN/BrS1
	0YtEYYgXU7bFJGQiRsLW4jOqBiTYoNo4/bzrAdVFHN/FS3njYgym71HfPA/BFLy1oscuKw5eIFK09
	GiMA13LzYU5NJRYFIznaPV0u5Am6qNd8ADcJSxZt1XEoS3C49cD+1wpC8ScZav0WrbcsRZYZqIB/F
	nsnciN8G9CI/9Mj9cb1PG0MGhzTvQA0s6moXcoEs+THyFJbauDF+Zp7My7OfJ0fVp4HWCmdwhwDDr
	pxyHBZ3PMnTSXlTuSuKqae173GcPUsDd/zZ8IXYePeYGTytLAu1vMhbxgr4XzTtirXNr1uapG+Dj3
	R9ShC9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u67Ai-00000001HhD-0tK9;
	Sat, 19 Apr 2025 12:19:48 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6752-00000001HFr-1c92
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 12:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=qgCIG
	/KUeTm5AFeThSZkpuDFjJWXcCxfvkAjBpN4Wug=; b=hD3GOCcHiZB95qiOjtxkM
	3nhQg3Bz/zoy76B2Uzuy5GYO3QAgqz4hqIrT6GKhZ0wTY4G77iHarKwC3TMHtgns
	c7kIpciqII22EvOhq02LtuHJ65RDb0nwQ4EPEdJkJo5Ve2aPQsK35RSgJ8iAc6o4
	mQXT0+wNvR1klqX0emc86I=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBn3XtnkwNoWWZ+BA--.31074S3;
	Sat, 19 Apr 2025 20:13:32 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 2/3] arm64: dts: rockchip: Enable HDMI1 on Cool Pi CM5 EVB
Date: Sat, 19 Apr 2025 20:13:17 +0800
Message-ID: <20250419121326.388298-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250419121326.388298-1-andyshrk@163.com>
References: <20250419121326.388298-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBn3XtnkwNoWWZ+BA--.31074S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF18Jry8ArWkGw1xZFW8Zwb_yoW8WrykpF
	nxArZagFn7ury7trn0yF1xAF1Ykws5u393Gw13Zry3tF17WF1ktw17Wrn5tFyDAFy7Zayf
	ZF4kJF1j9F1DtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_dgAUUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gg0XmgDkx0IRQAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_051356_782771_4E0A6EA2 
X-CRM114-Status: UNSURE (   8.88  )
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

Enable the second HDMI output port on Cool Pi CM5 EVB

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
index 3beeb0616455e..4e1b05c698ded 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
@@ -34,6 +34,17 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+
 	leds: leds {
 		compatible = "gpio-leds";
 
@@ -133,10 +144,32 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
 
+&hdptxphy1 {
+	status = "okay";
+};
+
 /* M.2 E-Key */
 &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
@@ -265,3 +298,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};
-- 
2.43.0


