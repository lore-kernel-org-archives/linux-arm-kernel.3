Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785EED3ABCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 16:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfIh7QFf8oEaQfYkdv6ZpaO6sL/ncFNHIot8BWk/VIc=; b=sPxOiD/eZgL2IjJWKBXIhZ8faC
	ul/W/19vojILKfy4E1JG1m9RL49CpvuCVDWbr8u3FL2JDXiheLAGcWyMP2Qkq/9qvk3UFDxziPBUI
	+/W7TPLV5Z5tpoxD2n2+HrpLKlmBAzOcbQ5IPCkPuLMrO/jMAXTLVzXHAjB+lnMSOV3i2Yk/mZNBO
	SJfMz50PqbYc70GCGYUaciecAsk/bqcaYVPexbbwASKSj5xv0j5wtmz656WeIhZUr9BiT84AhosIh
	TdlPX3sZzGUmeF+58zMKByGkBtHxz5XMjRw8H29p0G6MjfScpnOogbpmxflhRLAdIu3fCt4g5A1Gp
	oH3GUasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXi1-00000000dwz-0Vnr;
	Mon, 11 Nov 2024 16:56:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXct-00000000dCQ-10bC;
	Mon, 11 Nov 2024 16:50:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e67102283so98698b3a.1;
        Mon, 11 Nov 2024 08:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731343849; x=1731948649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfIh7QFf8oEaQfYkdv6ZpaO6sL/ncFNHIot8BWk/VIc=;
        b=cuGaDI8bpIB/jz5nasDFaG+06Z1XTYIDCz84CFqIol52HxgDtC4Cn4k1Qo2dCjG7Pl
         DNg4aVhl28bmuipEs8Twly/jWAwvAJR6IDyqrhArjA5uqM5B7V+oHc9fHoPdbIuOT/jr
         R+FYHWBC/uiuQh4lrhYPmy3XjJ3kuuD/EvoUzHn+ZE+bCqRXp6Em3aF07s0FsQWFc0vq
         SZnlbKrV49wsKtwlZiBJJW9H4UjS68zWVRGRWDt4i4eD+ItxinIOii4Y6zlFPqD7ya+H
         iJZx1chNIyY3walh4djeafq2AokUPAcVcu1kjq1MVjYdGrIdxbeU8HH9K6TtBL+zmTRb
         2xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731343849; x=1731948649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfIh7QFf8oEaQfYkdv6ZpaO6sL/ncFNHIot8BWk/VIc=;
        b=t9b9uQZRm1q8uwPWKzFWI5BOZDGoqj0M2xYpi8bG18Nu3l82deZ36G2hHnGtEFMuc4
         2Z+G77NfpSoNy2zEA2Ze4DDci9dUE4TaDt/UxYSP+g+B57wzS+LZ83beJ7Uht8cRaGX4
         ja0NvNa5wsGABCj52nq8MZVfxvmYOIE23GAjsvqirD4KXWtzqNdHxT/XdWgqtdy8FTvf
         BbIHXpx0/zWmSbrQIVPuL6zx+t2p9sAJW9OzABZQPssrlimgamfkbmWhaEiI5Z8cipok
         vIs66xiflj4+L3z7V9X84ZfEs30FKfzj5W07K0ggATnJAhlHguWAx8/cth4F/Gt9zJ9+
         8JvA==
X-Forwarded-Encrypted: i=1; AJvYcCUAsdRaIAZ4uxnZhD7KyWvobtpAc6po+MVBRFlolmkla6hBsL6OpGaQhQ2CEZ+jYaBwNfcoWgxe6szkiWlsi7So@lists.infradead.org
X-Gm-Message-State: AOJu0YxInzoYDqiVZSczTsknrkUCZrThJbXzmsKXofKq6QDIbb8eKcgy
	Efs3O05nYuhas7fpiNh48wM6lTeZpfDN1a1ZKpv0mgDwOVxQWcCwsFk09zO2
X-Google-Smtp-Source: AGHT+IHfynhJtyo2TYb9cgYePvmyNGNyO/FFedYkfCOY6PP3kqTXtwUZx7toT125k2vM6Ak06pC67g==
X-Received: by 2002:a05:6a00:4614:b0:71e:5e9a:2db with SMTP id d2e1a72fcca58-7241338307amr7053453b3a.6.1731343849040;
        Mon, 11 Nov 2024 08:50:49 -0800 (PST)
Received: from rock-5b.. ([221.220.134.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a19dd8sm9401955b3a.157.2024.11.11.08.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 08:50:48 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: rockchip: Enable HDMI0 on armsom-w3
Date: Tue, 12 Nov 2024 00:50:04 +0800
Message-ID: <20241111165026.60805-3-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241111165026.60805-1-liujianfeng1994@gmail.com>
References: <20241111165026.60805-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_085055_306616_EE61B72E 
X-CRM114-Status: GOOD (  11.22  )
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

Add the necessary DT changes to enable HDMI0 on ArmSoM W3.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

---

 .../boot/dts/rockchip/rk3588-armsom-w3.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
index 779cd1b1798..5b5a18c8edf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588-armsom-lm7.dtsi"
 
 / {
@@ -32,6 +33,17 @@ analog-sound {
 		pinctrl-0 = <&hp_detect>;
 	};
 
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -138,6 +150,26 @@ &combphy2_psu {
 	status = "okay";
 };
 
+&hdmi0 {
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdptxphy_hdmi0 {
+	status = "okay";
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -406,3 +438,18 @@ &usb_host1_xhci {
 &usb_host2_xhci {
 	status = "okay";
 };
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
-- 
2.43.0


