Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BE8E77198
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 22:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=; b=dqRviy/vpR5hhg389fq2hJSD4/
	mCTitMrOU/oUIc5McHCNgO4ikKiU9zDNLwXbgl8W5rRavMv6OzhIyIST5mCxszM//HN3NHEvuXNur
	kTElqsQRG3a1gPULYtnCjTbp4It5TqmoAoku0gBItj95swmkYYguRobAetUcXteLorRSGb+BTRT/Q
	PhOB5l9I7PGsBQhCTmEjHBZ81FXA4bkXyn6B/FeNwEM0MuuJcgC7aBFmhYHa6nlJ5Tn3NZ6JNNwKI
	tZU8dkCcOHRKElGH0Kghb6yGBaY2RFr2Kixb9TR8A+5y6gFcn8nCC9swPTc7eYISHYxB+IQ+Cr4EQ
	1abhGaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZAv-0000000HTTs-3dCn;
	Sun, 05 Jan 2025 22:32:49 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZ5D-0000000HSyB-2Bv3;
	Sun, 05 Jan 2025 22:26:56 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-71e15717a2dso7444350a34.3;
        Sun, 05 Jan 2025 14:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736116014; x=1736720814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=;
        b=HHgxjKBiwEtsRka3+5DYjslTB/7szLx6NIsws+BEDT+x3biIsweqTYaD4iwumnqzp2
         5ubEMnKr6eYjnbrU9am8UH0UEjgvaxEwE5qnRhOYdeORn+1snnehHdhyKLwxn4WCwNEt
         EQ8wKBza7T4YLVlVLSelZmrselRW0LBV1NrmX2F0g0ZjCbLDiTgxtBaIbOmK3YXoZKD9
         8Zgm1eU+UubIirUJZwwbIDTUsG63PAt6fAh+veBe0+mLUyiOc2w28OnI+Mvk9g1lCHuK
         MD4Gu5TY/m8yHAv0hjXtvQpyAF1EWMkpD4TT2exgp6PlJ1IkOgyzIg/y5sjzitWXgnur
         I8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736116014; x=1736720814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=;
        b=TGgTspLZxsiQEuh1FlliALMVGI90CFg2Yw9sk5j3SLtpdkR7dWOb/XsF04lTWVzSbC
         PtMx+L3ihrAsNkvBVew0jXvFDNLut2KzNZYo3umnHYNfWJ9EBXzTjxWg9V2rIJ0tQTdU
         r7Xr+8CGqMYrYEukC8ryyObtRnNZQDY5chRrK4LGu3DRzRnuc+qKus6MuIn+MlousNhP
         VfED4ibaa5w0vHvbntb47c8OpjW6Zx+Q5d4gh9QPbjplAdo8+G8wEeQH+nedDbnsI/yY
         Yyticn6+s1E9UkmrJTsbbSiSaRnmuGRabYhMvc0ErExnnYsZhnXqGItt2RV+sfHipQRU
         gffA==
X-Forwarded-Encrypted: i=1; AJvYcCUwGRpOsWfbHkQvjR2fihs7dM8uBtPgCbg6tlKx0DNqhdjUHekJ+8KCCpq9gkXp2B8V5EHiaZ1TH3pc8rxCmRs=@lists.infradead.org, AJvYcCVTsEDEi9sn94jOKaThwd0HgC6ql3bB8qVQ1mzW5Yy2Fp6HCqx1HpkUx2j9pP636Fs8B+TWppE/88JSl4KM8CBq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5o3TwoGhAx8MH794WWbNiyFXex/qOmrFuO9VgulgAiaVU/9cF
	rzAXrpvLtZorIHLu1Amsmr1e6G5mel4rHS6/OkG7J7tEOx3+WcRD
X-Gm-Gg: ASbGncsuj9MVBB8grUp/OnIQNAgnBPiqO63QHV4K2NUfiAPKzbuuJEByJlLr/Jiiouv
	9XmYTwW7C+k3YGGQvjQwiN9/Dzh7cCI2YVl1vgLXJ1Pp9ZbnrP5obOWenXIzun53MLIfA9aj8+E
	UHAcRNTITQh8+5znErSppZvmWGgCwuSRsxdshABPlBlnaz1sv3VcqclPTPXu3LRRwmpc2RuwBGc
	yhm6JDMpjZ6Qhd4hnf0Hva5BwtycqjlNIxUNbQ0D0sacMEvhTyFprizw7UIS8JSAw==
X-Google-Smtp-Source: AGHT+IF4vEVHzh5/AimguGUuOryLcd5I5gDSJ8ysFfJWBp1omx9gXOcL0Usi0by3qaFodgPsGc+NoA==
X-Received: by 2002:a05:6830:d86:b0:71d:5bfd:8537 with SMTP id 46e09a7af769-720ff867237mr35722481a34.14.1736116014552;
        Sun, 05 Jan 2025 14:26:54 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:b377:72ce:54b5:bddf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc980a9e8sm9555227a34.43.2025.01.05.14.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 14:26:54 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v7 4/4] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
Date: Sun,  5 Jan 2025 16:26:13 -0600
Message-ID: <20250105222614.2359-5-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105222614.2359-1-honyuenkwun@gmail.com>
References: <20250105222614.2359-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_142655_551761_1B8AC89D 
X-CRM114-Status: UNSURE (   9.16  )
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

Enable the second HDMI output port on the Orange Pi 5 Max

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../dts/rockchip/rk3588-orangepi-5-max.dts    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
index ce44549babf4..ecfbed2d0059 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
@@ -21,6 +21,17 @@ hdmi0_con_in: endpoint {
 			};
 		};
 	};
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
 };
 
 &hdmi0 {
@@ -39,10 +50,33 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
+			     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
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
 &hdptxphy_hdmi0 {
 	status = "okay";
 };
 
+&hdptxphy1 {
+	status = "okay";
+};
+
 &pinctrl {
 
 	usb {
@@ -58,3 +92,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
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
2.47.1


