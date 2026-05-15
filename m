Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766FCCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YXeYvlbGnNmMv9PUsmYFfNNN3O6C6muQR1bAD60qYI=; b=5GCI0Zsg5uoDfpjoTs1+DXwxvq
	7YXgM1DALSKXakZNqroFR8760iTU1GRNdsSGnnlrspiMRbqYaNeW8j+Pkvj06hHneZzwFTVcSYnnA
	Jh9mI9CgtZOesmjGnEgiPTAnTJ3zsUMp47deKCH3XBAJ44xLkdXbg0M+XcXCJfbM1hb1N7RE32JFY
	U0MwpZGnqHZBChhZCQTOwa2qNN6C5mJSqBgBTvM3Yml5pJ/1NiG56rfA82gouh1yKhCOIXZ5DQzi7
	Vo4fr7tHS3UB8J31RoFdbbBZEIpopPeYfujAyHtZkEwQLANI0a7n11g11vKOT9XyHyRv/ABrZAY+l
	zukp/oGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRN-00000007p4A-3HYX;
	Fri, 15 May 2026 09:02:41 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRL-00000007p1E-0rt9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:02:40 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so3798428a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835758; x=1779440558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YXeYvlbGnNmMv9PUsmYFfNNN3O6C6muQR1bAD60qYI=;
        b=Z30ogoSthB7KLfJ1zS0EE6H9KXcLSR9hDEu8KS0Z1+kTbu1leqmeS7pXt/wJC+GZVl
         s3/1Eg920GZrfBVeqn+tKoCeFxMoLyCzAGg15ngu1nx//0LkXm/i8mUlmhUsilLQt0Bd
         sXrG6MGWKfpJRDWTj7VftqWBUga+esUKitFO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835758; x=1779440558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YXeYvlbGnNmMv9PUsmYFfNNN3O6C6muQR1bAD60qYI=;
        b=AFwf0BSHXiS68kkROJHUSVgrDyFtCoM9FrE/xxGmL4n+i3QPn18kwSVrd3uTcZO+eJ
         /AE7m6ebsQyeRUsUbad7/qzOEc8Njxbup1vnOeWVrCZvcgBKAisndNK3kgiYUktaBmKl
         2dla5o8pALFkqxAs6uhKkPJoRTzR0+OAVgNBeptVwk3PazP4+vwXxBiuA22uTSQAam5x
         eEK+OZ24aeuRE+US8wtoVPn3gna1A8iSFgFarkgqXLFY8ceQDWZvpS0LFoLOv9GUAL85
         e9Sphj5u3PHYFI3uAtHe+siZJK9XUHo9Kd08TgkfKt8tbBa+U6wfRWqbiXG3sKEiJ3dK
         wowg==
X-Forwarded-Encrypted: i=1; AFNElJ9pf8tPGnBt46+7y09WOi8RN+KAUlKQXVUJQWBbBF3zVLV5tJ6oPFF/ddYDuc1EkJx5APN333I2bE8/Xb9OzfAj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7gOja9Xoq2mDuLOVfCbcbbJIo1aOU56PHZCPjcrD0mrR+AwJe
	PKUT3IqlAN+CqMH7cAUgs4z+bttal0FNJrlVUZMbwJJ6QwopX/8W02Ar1cKSQChW3Q==
X-Gm-Gg: Acq92OHXxj+sJvV5AKIaWobk5BK89BdRxee8W+NT+981DQFNIldxfX9IZPZt3bPnMhp
	XPlOS2TZRF217rSo1hZzbLqg0sEaCUAotceA5dCA3ym2ctihKd+8YonV+/vtaHW7WCvcvW7b1YR
	4jid//IjsCMBXi4/wTXYYiotx8AudXHz6gbLrSwe/nI+4rII4fuQ/D+1ZHS2puwF3+Qpxo9G7Hk
	wWUieX1WP1YMEHREdO33iSp3NHEM45NRUuB0jwrBsUkyCb/eNdR5lFBi5I1cRVfFvicRwCHKsJK
	e0dsMjn63v/74p8hJ1/cn19f8sroZVO3JQPRLJprsD0gQBUQopxB1ikZLs4TdW7/Hd+VfmBmqku
	ZdcVrzHZE1W1vvUT62murAhyW0Q0SBBBaTMQpkk/HkTnt55yvklHCSxYVF5JbAaGCQwrHUMsbxs
	WMpFyDtKDbe1S8PB2n+FBkJKMLq6FnL/HvWh0gp1+9dicZ38WIZXIiDWT7rWYm33SSB/rIzmVuj
	9zIMonz
X-Received: by 2002:a17:90b:3d0a:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-369518b25cemr3280292a91.2.1778835758557;
        Fri, 15 May 2026 02:02:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 09/12] arm64: dts: mediatek: mt8192-asurada: Add M.2 E-key slot
Date: Fri, 15 May 2026 17:01:45 +0800
Message-ID: <20260515090149.3169406-10-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020239_250680_DCA427EC 
X-CRM114-Status: GOOD (  14.07  )
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

The MT8192 Asurada design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller. Also clean up the
pcie controller node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 65 +++++++++++++++++--
 1 file changed, 58 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index fb4d92750770..901240384a4a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -318,6 +318,41 @@ usb_a_u3_ep: endpoint {
 			};
 		};
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		w-disable1-gpios = <&pio 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 59 GPIO_ACTIVE_LOW>;
+		/* PCIe auxiliary signals wired to controller. */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+
+				wifi_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+
+				bt_ep: endpoint {
+					remote-endpoint = <&usb2_hub_p4_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &afe {
@@ -671,19 +706,19 @@ &pcie {
 	pinctrl-0 = <&pcie_pins>;
 	memory-region = <&wifi_restricted_dma_region>;
 
-	pcie0: pcie@0,0 {
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
 		device_type = "pci";
-		reg = <0x0000 0 0 0 0>;
 		num-lanes = <1>;
-		bus-range = <0x1 0x1>;
-
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi: wifi@0,0 {
-			reg = <0x10000 0 0 0 0x100000>,
-			      <0x10000 0 0x100000 0 0x100000>;
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1206,6 +1241,14 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+			output-high;
+		};
+	};
+
 	mmc0_default_pins: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO184__FUNC_MSDC0_DAT0>,
@@ -1773,6 +1816,14 @@ usb2_hub_p3_ep: endpoint {
 					remote-endpoint = <&usb_a_u2_ep>;
 				};
 			};
+
+			port@4 {
+				reg = <4>;
+
+				usb2_hub_p4_ep: endpoint {
+					remote-endpoint = <&bt_ep>;
+				};
+			};
 		};
 	};
 };
-- 
2.54.0.563.g4f69b47b94-goog


