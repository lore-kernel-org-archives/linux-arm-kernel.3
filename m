Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D717C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 03:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=elpjqOmNwpb5zLF3nxKBv/pF+35q6+L3HqlbKg46eQo=; b=ut8of68kSulT2aLwJhvjFC7KqU
	xXFlEtuH9O4jsL/vbFvnNGZMZ1LUGr6goIujvxjNJsdKW1TivT/H3q3pMKvEHugQ5LH/YfH14RVVx
	lJeWZ2r7gKwTwBz0wfKYLrKgReJvGj2wnU3SFkrfyQ/dwnCNHsOoo8G6Ma7yvG5RWLoc+28ee0iNj
	tniDeaZfrwbyQuWZNvcXf9s7uzM5SfKwgAaH21hD343fMElX7jnNEU5f126gLqsQj2DmPpRSbvesJ
	tv3Fo8/uX+Irm9+dz7vHTyIMUj9+UWGPVuhmAoj5jIO4sztQ3h+NXQCGcxB/VeGXbP1QYZ12rOFm+
	KF2IyyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlMi-0000000Fqmo-2SCz;
	Tue, 25 Feb 2025 03:12:12 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlJt-0000000FqPa-2U6L;
	Tue, 25 Feb 2025 03:09:18 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-220c3e25658so12166265ad.1;
        Mon, 24 Feb 2025 19:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740452956; x=1741057756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=elpjqOmNwpb5zLF3nxKBv/pF+35q6+L3HqlbKg46eQo=;
        b=erhMfekGzfOU/bdY4S5Kn4Kr+DU9GL6AT3ODPtX9Wh7a/qBr22VS3hWEww/7+Cy4k+
         6D5Np9i7gT1+7OpMSGULUXGN+oAv7N5snXrrOfkAJgVSWO+tlSe9SholDNyCEIWS1fi2
         IgfmzRQD3dqGKBs/AAD95gj2c/ZuM7by88L+iRjiGYf8thwQ4Zf5A2n3rvRBL6f/o8Su
         25wvT4o0Rx45rkb/eQ8RiHEJzlGjY4/vnpU9wb/4j+g1baYiRQlYvV8St5bKLerPz6HE
         VKTD6W2PzozM5uUXT/jd+b5Ny0fe3UZdwAFpBf23MSMRJiHZy4oBhA7rwCufsRHTqAeG
         amUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740452956; x=1741057756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elpjqOmNwpb5zLF3nxKBv/pF+35q6+L3HqlbKg46eQo=;
        b=HRgHW/EM6cy1aFOtxHEj7AE0s6cu/tazYOShhkJOcAXh+et4/K8XmRNOXEGw6ckJi6
         q0jW/SFWY5FZ53emGtrNSZaCkzTaG0v0/RbWbOiSt1EK4nAG2JDZJkQ5DuLXdMXMCRfo
         nafMzOC/WWFe4vpEyQ/jjuV/woEOxS/LeRww+ihFko8TNScJ8F5TWDw4ZTJEwwZqsluC
         YodPjNXVE2U565JMKV9h3yWduPa6HT557QxG06o3PeCunmMDeM21jf4HNF7G3UDCwGTW
         m5HlJwXHWggcbyQRlGAjZ4tytCFIFqYct1dUMXCROhMnpaG7VWveq68a0BUWE0t4w+9e
         7mzg==
X-Forwarded-Encrypted: i=1; AJvYcCWJyTXZ7dQRTfEz9j9qESZIOot5JfaJfer7KEP81+p8qwqFg5vyOEBx+jhzVf8sG4xy/2WnFLGSK86dfmNXfovf@lists.infradead.org
X-Gm-Message-State: AOJu0YxXh/PYwvbkUQJZvZpSbbacYxhDB7UffMBzem6QddJLUU/ql7/w
	3YwoSi5NuQhaJLcpi6YtA6FvVjaAh/2kkew/0ZoxuW0PCPzxA6bobmokUK9P
X-Gm-Gg: ASbGncuD7AIoeF+xzmYUYfGHTK9jOGzplVLzUHFCxyERrxR1semq3y04shcllcdSyhY
	wFNiwZvWmoCvEu4OA+qezZ5eSEYxOf+BsbKArszfu0HhuwT4bck+2geTfopoMJWp+d+HxBmlqh8
	xM8u3lmU9o7x9MOqSvMYtoaev0fN/5MyAN0MT5FZXvVQcKn395akU6d4PTOf1v+pSpHlRu+BGip
	1ZRsoUp2ZgyfCngOVs8srFfo0o8PeG+CKKku9JtHuzbRtOj6YobHZWH/5diR9wVP8kIoDh26Ytu
	AtsW/yy4kTvya0jTO1kcfb1NklkoTEs=
X-Google-Smtp-Source: AGHT+IFDe2Sgq26vK2EiPZfc+NSBNuzC6A0u7dIPc3aRtjWh21i36Ss1MdvlgxEx1VMTHu4uwTgcIQ==
X-Received: by 2002:a17:903:1c5:b0:220:bf1c:35da with SMTP id d9443c01a7336-2219ff72473mr96063675ad.7.1740452956032;
        Mon, 24 Feb 2025 19:09:16 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0aea5fsm3405505ad.224.2025.02.24.19.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:09:15 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
Date: Tue, 25 Feb 2025 11:08:48 +0800
Message-ID: <20250225030904.2813023-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_190917_635219_ECED7137 
X-CRM114-Status: GOOD (  11.63  )
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

Enable the HDMI port next to ethernet port.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v2:
- Remove wrong port &hdptxphy_hdmi0
- Link to v1: https://lore.kernel.org/all/20250215152550.3975614-1-liujianfeng1994@gmail.com/

 .../boot/dts/rockchip/rk3588-rock-5-itx.dts   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 6d68f70284e4..891c8afff160 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "dt-bindings/usb/pd.h"
 #include "rk3588.dtsi"
 
@@ -89,6 +90,17 @@ fan0: pwm-fan {
 		pwms = <&pwm14 0 10000 0>;
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
 	/* M.2 E-KEY */
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
@@ -261,6 +273,28 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi1 {
+	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
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
+&hdptxphy1 {
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -1209,3 +1243,18 @@ &usbdp_phy1 {
 	rockchip,dp-lane-mux = <2 3>;
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};
-- 
2.43.0


