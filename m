Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628A6606BA55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zlRHoDVE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HLPfZeTg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dWAvnXAK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8UsCKoNbKnaX6mGeBQ8/pSx+fuQaOrU6twLBEIFwNZU=; b=zlRHoDVEC3aHxO
	kO0a6tnATMBiMbYyNPhgG37jmX/KLQBJo8qCbF018u4HTXdAKZB7VSI4ousPIl4oKXjOuF9MxqYW7
	qfOhe9edfjHYxJzlY9y75Xk0eIkPlrIiRH/CFSfYdnMvLo/1GqpoQiX+59hXFIchvHhEhjhv58LJP
	vnqpiwgjoXrg/BnlD6LwX7eM85XUiN3PHrEhb9K33i6BNqI7airZX/jNes3z4w4aA9ns0GR8o5Sfx
	3y+pv0oZ7I7Yffkem6+xAw1S/mfm/1spX7yvWfC9EZbR+I2xtYh8PQoyIqjKNI4Z/vxOiI3rXSYmO
	KAmTdQgrjH0Dx7leuEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgr-0000000HQyl-0b1N;
	Mon, 02 Nov 2026 17:19:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgp-0000000HQw6-2UGT
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 17:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8UsCKoNbKnaX6mGeBQ8/pSx+fuQaOrU6twLBEIFwNZU=; b=HLPfZeTgj2klfjPX5mC+bAuNBR
	vrqVYD4lvVuLOCMCgkyG5Pkv9YRX3F77kFovq8yhRjDi+BZ+mWLulSCWxz4HZZ8GW2x5uuZexawvo
	kE18Inl+W26ONkxRtKKhwnLm7KvQRv9LQVYq7vR4cNJ2tk5wv0eohJdCYxMKbvx68AEpjKY8/XjpR
	afJewOHF8zEQ+jTEeQRk7Hq5QZtKBNEJoI1mfUa0jxCBS4/qck+dTNz7iL+o3+S+EgSK+g7bedgJh
	GbaIKhN7z29ShSsTXNIWOgMGKo8ZKLioBR+4wuR6LltQ9KLh+C48+tw17At2Ejw18NvZU5pVUJ+XP
	Z1NgcjQw==;
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgk-00000002s5X-3ogD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:19:20 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1974507eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639957; x=1794244757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UsCKoNbKnaX6mGeBQ8/pSx+fuQaOrU6twLBEIFwNZU=;
        b=dWAvnXAKUBOsQ851Oi/8/ncThGI6tKDd8VN1Y/me9uu5lLtHHIxEjeI3xXlK7R5RGk
         TZYLTRY6QeXvy9dPo+wG8Dq1n7ytpZdcJnUiOktNNY86BG4MPHyZYmG40peeyFGGGlTx
         WMIQ5kKvaK4D6ctV5on2qAKOuyQu8g7nBnxtCvjM+Y+9Bf4BYpuJyHxl9yedAxjx8Bhr
         KZYiKdolw6fh5+pC+ifmiaohUnwK+wZL4VoOiLatCin9Jgojcf8iX1dzFSvO2cvQBvuk
         RrXfk8u8fU3yJ6GIFACpXl1LRPQt/cwtCNyreIJzMNqPaUK7I3dXA9sAGV/cBrG6UrAp
         wCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639957; x=1794244757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8UsCKoNbKnaX6mGeBQ8/pSx+fuQaOrU6twLBEIFwNZU=;
        b=Wy1GGjL8gAG53CElZYsi4BhRQVKU6929HwuJyxC2i6P4KgtOy/VanZJofAAmXamYA0
         CMXJQoWmUhDCa59zgb3POV7S5j6fPzSoymub0I+DwYZrpZm4nKYIZsxChze77C/ItFSi
         ZMZtOOLJD6woTBFWGiV9b47ZmilQlMuqWGocXV7SZMkUT5M9tzZITrW+q7LZ2r/6dgOS
         d+v8Cuu9kWbG3vtuC+covb7ARXrei9j7qB3s03OIP68otRU5qIkH/MvCsSvDzwrvoJVA
         9FNTkiIFQXICTySBGQSYwg7OqmmAdKfRN7Nv5HVPZffj6pmjNdrQFHegJUYziS2JhEp/
         VCqw==
X-Forwarded-Encrypted: i=1; AKwUvBzfdX7yPBQSN9p4EFPqzPRZnsSHbw7O3z+A2RA2pcctejpFPLCxP4NsQLTe9W+BXhmOeUnG0ERM6aOPQwDATSbs@lists.infradead.org
X-Gm-Message-State: APuU4Z9HotdwzVaEIjGBtjrTkQh/SAiCMVWj+euokDujL+0gOBhWFPwy
	MJFFW8KP9Ah5S6DA+h4MCUvfTOHecrwRRa9XWoH0tGhQqcbphZ5nSn7k
X-Gm-Gg: AYBFou1fxVeksrBx3+z8pS7ToIGrWFd9JOikoau0rvA8GTagJl09haWtldAXjDTusHu
	877bi5XmAX2V3hHK3c08z70YNzruPbyu9LSqRjEKwzAkpMocFsispvQW5AbKWOdT+HwY2eDBmVz
	8vC8EcTsAXsOyy56m5Slpmzyw1HB30lySLGcvZlyyQspPWDXDPpV3CAHWbJQLi3nk12nZ8ZCmt0
	qlJXVfSmrlWCkowDJB4cWfc4qoaelpHGylWSVXtgWMs+Y/QsZMxtJCOp6nXuuDa8KJsVAz17ff5
	XYODJx351eSHfH/tAaA2tqorGxZW1vCvgqnDavaRgxDts4fg0zyfYUFkQHmjxg5NtP/IN9MVnB8
	8EC+0svK4SjNjti+cM4a6vXuODMEkQ4lq3sBLQ240SvDvn6yrIczh8NvAhHb+YIsGxOxsOGDdkf
	a5MG6eNPowe/yjOzfzT3343PG+U2ZH1++fUbxYfy0F/QYqDQZnQomsDDmnMfTUXqsfW8l17qvyK
	syu8zajwjhtQp4YH+sJbqW52BPxXRVc50rL0NofVbi1HY4ta7izMNNCN6HHcDffWc19te7rfxo9
	aF3GVR8wIGljU+A6SiYaBg1v7CA=
X-Received: by 2002:a05:7300:c00c:20b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36a422039cdmr18657739eec.1.1793639956509;
        Mon, 02 Nov 2026 09:19:16 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:15 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Tue,  3 Nov 2026 01:18:37 +0800
Message-ID: <20261102171838.2958552-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_171919_204385_B37B79B4 
X-CRM114-Status: GOOD (  18.30  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the Ariaboard Photonicat runs on battery, the USB port has no power
output and attached devices are not detected. With the external supply
connected, the same port works fine.

Per the schematic, the 5V_OUT rail that feeds the USB load switch (U12,
enabled by USB_HOST_PWREN_H) is the OR-ed combination of two sources:
- VCCIN_5V (external DC input), OR-ed via D16.
- 5V_BOOST from the VBAT boost converter (U16, enabled by BOOST_EN /
  GPIO4_D2), OR-ed via D5002.

The 5V_OUT rail has no enable pin of its own. Since the regulator
framework can only model a single power supply dependency per
fixed-regulator, add a v5v_boost node for the VBAT boost converter, and
a v5v_out node to represent the OR-ed 5V_OUT rail. Bind the vin-supply
of v5v_out to v5v_boost to ensure VBAT is boosted when the system runs
on battery. When VCCIN_5V is present, D16 takes over.

The USB load switch (vcc5v0_usb30_otg0) is then supplied by v5v_out.
This restores USB host functionality on battery power, matching the
vendor firmware behaviour.

Link: https://github.com/immortalwrt/immortalwrt/issues/1534
Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonicat_rk3568_sch_20221116.pdf (Page 15,18)
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Cc: stable@vger.kernel.org
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 7e0a2ab829209..11ac78acca3be 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -59,6 +59,47 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	regulator_5v_boost: regulator-5v-boost {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_en>;
+		regulator-name = "5v_boost";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vbat>;
+	};
+
+	/*
+	 * 5V_OUT is the OR-ed combination of the VBAT boost (via D5002)
+	 * and VCCIN_5V (via D16).
+	 * It has no enable pin of its own.
+	 * Model it as a fixed regulator depending on the boost converter,
+	 * so that VBAT is boosted when running on battery.
+	 *
+	 * 5V_OUT supplies:
+	 * - VCC5V0_USB30_OTG0 (USB VBUS via U12 load switch)
+	 * - VCC5V_HDMI (HDMI 5V via D5000)
+	 * - J53 expansion header (Pin 1)
+	 */
+	regulator_5v_out: regulator-5v-out {
+		compatible = "regulator-fixed";
+		regulator-name = "5v_out";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&regulator_5v_boost>;
+	};
+
+	vbat: regulator-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat";
+		regulator-min-microvolt = <3400000>;
+		regulator-max-microvolt = <4200000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_1v8";
@@ -148,7 +189,7 @@ vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
 		regulator-name = "vcc5v0_usb30_otg0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vccin_5v>;
+		vin-supply = <&regulator_5v_boost>;
 	};
 
 	vccin_5v: regulator-vccin-5v {
@@ -446,6 +487,12 @@ pcie_pwren_h: pcie-pwren-h {
 		};
 	};
 
+	power {
+		boost_en: boost-en {
+			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc0 {
 		sdmmc0_pwren: sdmmc0-pwren {
 			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.47.3


