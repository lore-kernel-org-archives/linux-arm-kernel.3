Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250C7C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 04:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=No7Pu3tcjEAADdHGcFgLAj3F1mPvZDUYYqN+X5/IaJo=; b=ga6IeABhIgjiUe+zaYUPXqYPCs
	jPBJbQ3ztbslALlYTmYLVWCKrOvTgtNNa5h7Qs4Psn4+GKvoSt9b+1Ww92KUy6grZQLyNCnlUHr1d
	hdLfq7G/Aj4rh9Hr+P1rnVxTbgtPxIa+gZ+ARNgcIev0qpOC5gCYPPWxBW2U3Q72fgB3crtbcH21o
	Te3YILkgmIM2MVErZ97d+8VYIOicesrP6Xb3XMsMZcJ81bwvVaSh2UzKFUE7EpE4ms+v2NeO/udxN
	hQOneuHW+T/OK8i5N3WGEgP5jEVXIRsAB/REpBTZcEHfNLJJ5V1MZ6z/NjJ6+zx6ks7JU7Pc4eQpq
	T+Yxtrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq1gj-0000000Dtjc-0SzI;
	Sat, 01 Aug 2026 04:51:09 +0000
Received: from out203-205-221-236.mail.qq.com ([203.205.221.236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq1gQ-0000000Dtcr-3vQn;
	Sat, 01 Aug 2026 04:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785559846; bh=No7Pu3tcjEAADdHGcFgLAj3F1mPvZDUYYqN+X5/IaJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CZ9WhUoiZBbwq01Vg7QQ3WFEDUB0QEy/zIhdU7463zRcD26FZvmTd4LLzKPPa9tgR
	 UnasAfg1vb9WOn5hRm+F61XBVYF++I1EQ0xAs3lUsn6CvMj6zKDBuyh5NzZ1p0TDtd
	 S81mwW/tsefTezv7FJeUCPNEG3pdyPz12AiYmZ1Y=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C9E2EA5C; Sat, 01 Aug 2026 12:50:30 +0800
X-QQ-mid: xmsmtpt1785559840te9blvcwc
Message-ID: <tencent_1F34C8A722B644F01E486007EC91C9350605@qq.com>
X-QQ-XMAILINFO: OGvxYKx7ShGEuAwaZM+a+SyCxk9ihAx5WfZKVDoZxR1Yf9a5csHiMEj3DzjJSd
	 IpwxEqLjOltpGJndf7HbowTbiEoE9hoybMziI64NFS8hKrXhDH7yqA2RQAVdGJJWgtBAE0gLU9VW
	 blXx+DuBnsBcy586vGq5QiXIgWf2FKQt4VSarAAqx+SdaKduJW+/7b/3OsGkQajC0VWkN70YeLzF
	 0DFwVv56KnKf5Fit6hqCEWWIC0d71xaQCl4GIV5vWSmKWeaLtwiP970IfglFSvl97/f+bC4ZEhia
	 HX5c6AcEmal34A1Rm2iXuQHBDdie0mSWp/12kr1YMA1s0kjZYKl+r4o8HTywADZnNEhIFTFjpGiX
	 L+pQWeeSgRCQV7njzLJbYVDPvzGEXzDFTRZkJIFfSSCJup9i5Gi7pHLyVwAVxI2GtyX7P3C7SxWo
	 JpKtfRR2DwB/CuqDLyjhmsnNDk3RYKlo4FslE0BDELjgX6bZ3VGE4qCfU8V/76+CbAGJ0uYE0Huz
	 fDDvroxJiWPPHD8EQka6IqywQv9Dy0MjgdeaVk5McZRz9XTZk14pETF45Ck4r9Y+mjUVI0ko3naJ
	 i27QeASuFuXfoFglenTKo3d2wmv0L4xz/awSj7NvwVlPDrgpjLmsNFTn51e0kANrSG5ejDQh9iZw
	 Vc4+QJzg9lvb0tqMzweLyVstWb0TohSbCTXPI0xBreyVGs8JOTZ7gc/Fpo4+yv/+uEwXayrlD1IU
	 Ugo23hxwUeOckhDFeb3+c5UA9Y9voVOUuo9Krc12+iqU7oUNyzvbgmv8dZ6GsNEZurxVqbbh35F+
	 FDwgGa3ywVrfNIPfo9w4G1RKQhEBhK6PgpPlLzaJ8eQoxmAK5/wohHZeDLs7SCl3qVugwIP6crZW
	 GL+mpr71XxBk66081khfqfLXgmqykNFpKwsI4IwnSUFfiUjbRdOQ/Cph64dY/ft15joAQ/rzKqt8
	 xhOCYeOQ+IDCweQmWJ/cx23qYTJDZzR7mDd2UyDsQXuBcI4BwHjepkY4dk+AjrYm8eeMXtW53ezz
	 9BGDaT92q8F18LT14xCtOFYO9h8mjVn+rwbrXvt41QiI68yObvr7goR+lmMhvhNQWaIyDQluWEoR
	 hH/zzL8y6ZW38rpWmPyKrk3dRInf8gj+mQlQGS
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Pufan Jin <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: rockchip: Add fan cooling maps for LubanCat 4
Date: Sat,  1 Aug 2026 12:50:24 +0800
X-OQ-MSGID: <20260801045025.67512-3-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801045025.67512-1-2254650260@qq.com>
References: <20260801045025.67512-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_215051_331370_2AE62FF1 
X-CRM114-Status: GOOD (  11.87  )
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

The fan node has no cooling maps, so nothing binds it to a thermal zone.
The pwm-fan driver deliberately falls back to the highest cooling level
when it probes without a thermal zone to drive it, which leaves the fan
running at full speed regardless of temperature.

Bind the fan to the package thermal zone with one active trip per cooling
level, reusing the trip temperatures from the vendor kernel. The lower
bound of the first map and the upper bound of the last one are left
unlimited so that the fan can stop below 42C and reach full speed above
65C.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index bf413de979cd..a0fc128ce6e1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/thermal/thermal.h>
 #include "rk3588s.dtsi"
 
 / {
@@ -300,6 +301,58 @@ rgmii_phy1: ethernet-phy@1 {
 	};
 };
 
+&package_thermal {
+	polling-delay = <1000>;
+
+	trips {
+		package_fan0: package-fan0 {
+			temperature = <42000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan1: package-fan1 {
+			temperature = <55000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan2: package-fan2 {
+			temperature = <60000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan3: package-fan3 {
+			temperature = <65000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&package_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map1 {
+			trip = <&package_fan1>;
+			cooling-device = <&fan 2 2>;
+		};
+
+		map2 {
+			trip = <&package_fan2>;
+			cooling-device = <&fan 3 3>;
+		};
+
+		map3 {
+			trip = <&package_fan3>;
+			cooling-device = <&fan 4 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &pcie2x1l2 {
 	pinctrl-0 = <&pcie2_reset>;
 	pinctrl-names = "default";
-- 
2.55.0


