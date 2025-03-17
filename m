Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22F0C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YWWEyuRSXEh4jYuipM2cPauSQC9QSyQVuvZY6z5PEnM=; b=NaWz2tr22BkdrpxbPx5nlyqVN1
	cTgOzkt+sDTOAoa+W3f2f5QDpoRAkmnQ3rVOSezTDAxyiTId9emGeR1Z2OhIiwm6XtdWMcWDmIgod
	+RXpORHpdwAYglpyUT5OrmGmehz470xwxFeHKwtX2sbD5ramJLvqNdrTvaDRVnb2na0JxOveDfHuR
	CpH1iqOncwr/bU4cq4zRWaG9RoiIE+9AN53HjIjJN2snpPGBO8sFCxyGfy6cUiV/al3b56jPCxjl5
	gxxvw1XH7AvIe2ZQp5SaZJJWT3SPtlWRGxdS0TyQs+h1GEmPyq8zTHHQA0++Zh4IUaMjnE4+wT8D0
	afYHeq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDSN-00000003LhC-1M9k;
	Mon, 17 Mar 2025 16:36:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDOU-00000003L6j-2VaG;
	Mon, 17 Mar 2025 16:32:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2232aead21aso12960595ad.0;
        Mon, 17 Mar 2025 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742229169; x=1742833969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YWWEyuRSXEh4jYuipM2cPauSQC9QSyQVuvZY6z5PEnM=;
        b=FuYxDsTbyhiQPoBPHSdTWo7ek560TwTPEvs/vmtYzcuRZMa+vyiuwMInIFT6OZSOtt
         mVxbRF3Mu3VsMa9qUZBJEdmDrLvgzscdf8dLVcxlzzRYo8JDcWx2jfsHMrfiX8Z+ZjkH
         JWxxMKGiilcD5wHo9HDORzBWKAhNBihiFXK78TRytMiXSrRWByX/RzevFV8y5XBTUSzw
         pBFX0p/KvG9DYWq+8BApnbtomF9zaDydsz0HLp5VymteOAkIA3LFRoPRlddHLdWyxndz
         +9Bz/KVcups59TKH/XQ3xxGCOkilTOT0VAcHsmb03xll5gtoTPoJlBsEQfzwTuJW2lsb
         kH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742229169; x=1742833969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWWEyuRSXEh4jYuipM2cPauSQC9QSyQVuvZY6z5PEnM=;
        b=Z5EZcYtl7Q0Apnn046cYSYjWtJ9UD0HMsilomjKPSbkBHa//a1nQyBlac/LV+Bdp9s
         MkiyW6Rn0070Bpua89KhzJhCZt68dxMHsn/VUzJvMxDEpivWqI7iq+AKM/kC+OsHpNdg
         l+YiBHdGh4+hbYojY38oqG2STTosn8N8Y/piUtBSaCpbIUb3gbRYyEM9+mdzGZrsXqHb
         gViIC6Fg+FAYizRWGpUjn8QRISyzIS7Xit1pX/j2oxoxizCQK/HzgvznGP2CX/f5WeKd
         RshDuRU9VynKOuYwx7h0hM6MZdwSBbtve4XF3qerqPOdu4njQYzjcRLZUmpCDTIwptcF
         X+eA==
X-Forwarded-Encrypted: i=1; AJvYcCWWiZV0qeClWUyQuzPSvJrb0nQj8HZjAogq9sjbX5mHVDq/0gBJAnb0LQsAWn3d5A9kdIT8e5BlP//HIJMifr5I@lists.infradead.org
X-Gm-Message-State: AOJu0YwRERAUNtLT2cQNEj5OZoUC6UuLFwfr/lsPteyueQOMUmxs/c4y
	zm1GUwlBxbaRh3jbAwsxfYnp4DDgSpcyXDmRMju/aP29mp0l1iWGeow6TOGt
X-Gm-Gg: ASbGncuIPpde1GJJL4XQCwF80F/a/q3R3Rzrrya1llIuy72MPy0nizm1xUfRVOpWgsX
	nU/KywzqCO+VrYILes2dOWyPxLDSzJoNVCNRJD44MhjyqnoftsUyVEM7w84NN4LTKvoYsWF9Te+
	qEi6ewuGTix9TSsdUkxucV/cRX3fgY+gmFp6TeX2R44IjLG6IDqkZY0pbYGSPI4oFCwCbE2tCws
	KTrAKWV0XWZVDKi1TdbZHHnNZ7P3FcyDQqweS3N/junh9GiNRAIxRYE93E4N9zX+zNI/m33D+/k
	oK8wZxR5548GaUryAuzx6oeZ9eOmzZwVhuPt2sK9hPM40yQdAw==
X-Google-Smtp-Source: AGHT+IHcoui3nf6KS5wNjwxWgXPGU2WvUeQ+KSV0Bq5p427ioSnqGupQXz+IQZm/xDJmnCLpIAFiyw==
X-Received: by 2002:a17:903:1207:b0:224:252c:eae1 with SMTP id d9443c01a7336-225e0a666d3mr63113675ad.6.1742229169062;
        Mon, 17 Mar 2025 09:32:49 -0700 (PDT)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a4876sm77282825ad.70.2025.03.17.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 09:32:48 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: rockchip: Enable HDMI ports on ArmSoM W3
Date: Tue, 18 Mar 2025 00:32:21 +0800
Message-ID: <20250317163240.3083908-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_093250_637524_69B9A535 
X-CRM114-Status: GOOD (  11.23  )
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

Enable the two HDMI ports on ArmSoM W3. And audio output of these two
ports are also enabled.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 .../boot/dts/rockchip/rk3588-armsom-w3.dts    | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
index 779cd1b1798c..6ad2759ddcca 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588-armsom-lm7.dtsi"
 
 / {
@@ -32,6 +33,28 @@ analog-sound {
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
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -138,6 +161,54 @@ &combphy2_psu {
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
+&hdmi0_sound {
+	status = "okay";
+};
+
+&hdmi1 {
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
+&hdmi1_sound {
+	status = "okay";
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
+&hdptxphy1 {
+	status = "okay";
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -192,6 +263,14 @@ i2s0_8ch_p0_0: endpoint {
 	};
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
+&i2s6_8ch {
+	status = "okay";
+};
+
 &package_thermal {
 	polling-delay = <1000>;
 
@@ -406,3 +485,25 @@ &usb_host1_xhci {
 &usb_host2_xhci {
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
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
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


