Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E2EC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 18:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=73fMxQITK2EqY2jmXi3Pm27EorfS7v8vMbAmAANuJFQ=; b=K+QvDr8Uu7Emtv/ze7UiHrZ3tU
	k4K2ustNcfp9wWFqv7nb7Q+HicFO2effNZQC6/wHJOXelnB24o6pcf/i9qrExczLNM9clmIMXRtby
	98ZAfsughmzTLiGoMgeM6OLM+LiZUOYnUH6sh3HGjsCZGkNYwbvypP3lmCGi+keoqv5KAiipNiF65
	zixHektzqIad5q06AuIcViCMP/3xwoJtWeYrb49yGcNNfjuU/0bWHLkPcutZVgpGNjfh2HX4nMDO7
	JB6eYZaWHCR5TKizUNCWpeEjDo4XJgvbG6lhWHePpyyDXsQN4IWbbxPHYK0ADlVFkhZ0hSz5P38Ld
	BmR72vvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u96ev-00000003rkl-0oyc;
	Sun, 27 Apr 2025 18:23:21 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u96cz-00000003rgX-0qlA;
	Sun, 27 Apr 2025 18:21:22 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-400b948600aso1082446b6e.0;
        Sun, 27 Apr 2025 11:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745778079; x=1746382879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=73fMxQITK2EqY2jmXi3Pm27EorfS7v8vMbAmAANuJFQ=;
        b=mmVEJmsc3l21tCICc/iP6pgmKOWh5fdb8XYWrGRF3LkWzKrIZ5hPIuMDNEESsnRtam
         V20O9i1TEeqWDK7OhBldjLJNXy9Da3Z8rhj0sYFAuG9BfX0yJ47Jx1oWQH0uVmM8nzaw
         pip/AWNUGiU8FLpEMccMNw8A+XyhliJMp12Fdowv08wL0d7fDnJ0RjXDKrnywKV3zPnK
         dG3mcbLToG8is0Q+YqULf+EJqJE/nfsadpRPh8dKKAuj00QMhxapFAV/3/LsKwZYYtMo
         n8T3OZNypbWsxR0vSx2XxHs66S2i87bfl/SNw3upMRCvsYbPC/IeUJr7+laNNSV6RZTT
         9A7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745778079; x=1746382879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73fMxQITK2EqY2jmXi3Pm27EorfS7v8vMbAmAANuJFQ=;
        b=WBSkAlmxf8iB3JLkidfudPY1ZJ6SVaZsxbQuCtk+DBHCfdzNOcQBFP1K+ZqXpWzWFW
         qRtRBoldG4+ZUQGuIf3YKRUSXw51WxU/pYGsv/8mBuxNsGYLyb+akuurWO4EwHZpfnPy
         wRF1xUeFM8gwcQlSk0pBSG6zwglooVpE2xsD05rB1McGdwQvbZE9XtX44opSFatgR1QM
         5c3pdzCiXpem8wotsZslWsPGczNS6zQXbW/qVv4sY0F407CXOSfr170P8uJykRu2A8DF
         ZyOaovEYbCAjgmksZzHqUk8PM5gOIjHKfUDblt2KXvvTcSD8I5DsfeB+kut13xqs89fd
         X1TA==
X-Forwarded-Encrypted: i=1; AJvYcCUDBj9bWT8Ugtw9k/hEMdhNmAkORznbeRVrhtqmj8q+k3IKBw1AIWxGWR8bVJ8iYvv2u6T64wWDojsTAWIWfCSk@lists.infradead.org, AJvYcCWG9P/eO+urosbMjnmueSGVQVW348U/S8qlQwOBa5Yo0XRSfU8PdgqopCCBoPZIy+nong8yYEVUNI8Jusknnuk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcd7P7MjfnfIgMdCbDPAEutVMl5bgyWkVfhEG3RgsyZtSwo9RN
	U0DOqdRBFk/GotDTt929XcNuZEWi+/W4WwNE3+Apwt7QUJNTn4Ujhhil7fQy
X-Gm-Gg: ASbGncs8dQ8kM9F1PBddI84B7tf6i6ai0YadQciMzMfAEicQaRoKJUhqdyI5GZAh+fJ
	dbVlVK+6d/W2iVgZ3ZTel0iGMjjszrKJt0zI3SwAya0/DeF7ZW8r5eKbcYRi8K++VPHJi+1bkz+
	h7E8DYjiWoiIl3x6v4kUDpSOItQIHspjks/KYjSQjj8OivBUaS7u7kv79g7Oa2lV1Dd+OZItgav
	i0wA/eSA/u6fvyd8REvRqI4FQBuG9QJlEc4jlrh1RglgfaZp4VQOhWNRi7aQUrAlWRO3H6fvx5i
	dtlf7MuREGWW/2wfvcMVxlUx12tMHvAhZiCEQm8ruzgIfeqnSA==
X-Google-Smtp-Source: AGHT+IHfU8D2Q4pN7gREyDUCcPDBeyTCo+tChoH/GincDxT+n1zgrIzH78BXb8X/PXM393z/USMXmQ==
X-Received: by 2002:a05:6808:6b89:b0:402:2a3:57e9 with SMTP id 5614622812f47-40202a35929mr1874134b6e.11.1745778079468;
        Sun, 27 Apr 2025 11:21:19 -0700 (PDT)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:af5b:bac8:c484:5295])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970d10sm1737859b6e.36.2025.04.27.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 11:21:18 -0700 (PDT)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Johannes Erdfelt <johannes@erdfelt.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Enable bluetooth of AP6611s on OPI5 Max/Ultra
Date: Sun, 27 Apr 2025 13:20:19 -0500
Message-ID: <20250427182019.1862-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_112121_241178_F8E6534A 
X-CRM114-Status: UNSURE (   8.47  )
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

Orange Pi 5 Max and Ultra has onboard AP6611s with Bluetooth 5.3
connected via UART7.

The chip reports as:
[    3.747864] Bluetooth: hci0: BCM: chip id 3
[    3.750021] Bluetooth: hci0: BCM: features 0x0f
[    3.775923] Bluetooth: hci0: SYN43711A0
[    3.775930] Bluetooth: hci0: BCM (001.001.030) build 0000

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../rockchip/rk3588-orangepi-5-compact.dtsi   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
index f748c6f760d8..ab07a7fd5359 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
@@ -87,6 +87,20 @@ usb_host_pwren: usb-host-pwren {
 			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	wireless-bluetooth {
+		bt_reg_on: bt-reg-on {
+			rockchip,pins = <4 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <4 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm4 {
@@ -120,6 +134,28 @@ &u2phy1_otg {
 	phy-supply = <&vcc5v0_usb20>;
 };
 
+&uart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart7m0_xfer &uart7m0_ctsn &uart7m0_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+                compatible = "brcm,bcm43438-bt";
+                clocks = <&hym8563>;
+                clock-names = "lpo";
+                device-wakeup-gpios = <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;
+                interrupt-parent = <&gpio0>;
+                interrupts = <RK_PA0 IRQ_TYPE_EDGE_FALLING>;
+                interrupt-names = "host-wakeup";
+                pinctrl-names = "default";
+                pinctrl-0 = <&bt_reg_on>, <&host_wake_bt>, <&bt_wake_host>;
+                shutdown-gpios = <&gpio4 RK_PC4 GPIO_ACTIVE_HIGH>;
+                vbat-supply = <&vcc_3v3_s3>;
+                vddio-supply = <&vcc_1v8_s3>;
+        };
+};
+
 &usb_host0_xhci {
 	dr_mode = "host";
 };
-- 
2.49.0


