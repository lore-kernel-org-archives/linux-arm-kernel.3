Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8060CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLOztf0dJob0Wz9AqRbfa8xvCCr+6HbtB94Bg87OFLM=; b=vBLvNKgWAQXmQllX9XjTddEnpC
	b3SOwwi8ERhj0wJ/HYoqoTYoAHhRwq4opkVChjBT+PDw2t4dXghld8ttAc0/EJfBoDBIhsWxRX8cw
	LDfvpGn9VuuHrYEXm5bRvydN93ukOrP24O04eRxsdoN1nd+Eb3jXpbqsg+YbrStDvib9nk1sYQjYp
	X3M7rUqxPULpux99NU5P81leX8mFPdYGkJgoFE/+y0weNh1b3UkBOauEzJZx36bMJ8AQRX33/3Fwy
	0F64Wa73PrR3mv6WnmMB5ZcoQiuEatrmrZfVnWqyt55t+HV/ypaQg7HNoQtrutuhoiBY5+w/Mr3TP
	CG1i50mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usg8U-0000000A6H5-3ixg;
	Sun, 31 Aug 2025 11:22:14 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfkw-0000000A4ZR-0apB;
	Sun, 31 Aug 2025 10:57:55 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7722e0ca299so1384159b3a.1;
        Sun, 31 Aug 2025 03:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637873; x=1757242673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLOztf0dJob0Wz9AqRbfa8xvCCr+6HbtB94Bg87OFLM=;
        b=lQJ7AcfCs3XQQ+CHLk7GRAZAo043XRrDFqkIaqOVQGQF5RgAbEeMuQ7W+jfVtnOIkV
         NtOEoSja+V2teQtElYqeMHBJKND1T8CtvpjNapP9+epXFp7KuJnZJbZPGcMyP6VvEceb
         kcXRAcNw/n+N7IIHRscSLjfTQCSFaPI71VPRJyTfFNSrepCvmVWzadzAFeOHI0tKQiGH
         S4ikPzr9B1GZ21kPG3Y6ij4hxZ7qGdbCmmv3B12o78lWhcF5jlnlPWyMkyfT6vBRzek/
         +uSe0ZqbYm4G1LowSCQAyXfLMI82wvN3N106e2VunpC9V9hrCom3Y5VAGnHiIxn7Vhps
         Wu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637873; x=1757242673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLOztf0dJob0Wz9AqRbfa8xvCCr+6HbtB94Bg87OFLM=;
        b=KcL5w9ifmDlHFbJZ7sRLyeMkdjkDXY1k9Joiuo8W71xYSqyv8lSVQIn6KQ7RgsJrGn
         VaikelD7QvQgWkaP5hxJR92538PXTntbKKXIjPz8rb7dhsHuI9g1qRpcrrRGCikLQTJZ
         avZA8ojIafoZpq4ZoVjrqt0GLpa3focFKcKU7JTtLb8dRaVO0f0tkAplpl17ILDw8d88
         mBZ32RGddfdtwpnYgfVVMPcsKr6Fqo8oqsWVgQ4hoz1f5SyOw8erVjwRr3WnFIK5n9Z/
         EaAZ9pKB1sDHy4vH19TMMQcGmZ1pXIbvaOVVBLbvd4YrVN8jXMi/BsSmcK5Lf4chGPrV
         suvw==
X-Forwarded-Encrypted: i=1; AJvYcCV/SQEA/OjWEoNAW2pf4rwNjmjZJSmAg0B05dbblWmindRh2gZYgJxHEl218/esyOHiQxvS5Um1jxRhWSvh8hhL@lists.infradead.org, AJvYcCXgIXqKAXzgS6MTZL5sziJGC8SHVhSN0xrs1yUyJ7jFyvcTfH6xd7IwF2R5GVKutdh6g0xVbJ83r3y8qlbbO58=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGiYkoFlqtWVDL9h3zUZ7lRVFcbr4B85MlXISiLf0OOUUVEbOy
	wugE5pOpqRCW3XaYPgRQ5keYljHr0pIzlRa8nt4H4quuNwkGwuQmefBy
X-Gm-Gg: ASbGncuPV7ew/yO4jMOleHIe4imLYJG10EciNzHPLAQPzsQlzdWKcjdPtQc5gJTc12+
	IH8A4ZSSTvD/0PSpWGMPppbgvpOLDrGZC+W9B/AOTWhrQP77fIF8sfl9gmeYL6y3tVzTLm5kVQn
	UlGfzp4Uttbtob5b8Z/WEYo0Vj6by5U8aE6BFVInN07CWTHqPd4xR2+k5+xGnYC6hnZdikKo3p9
	J3o49Z+JNiuLnZZCnlUKTEhnMif2DKSSAwAVfzpgMDeC+9v0CAZlkVQMB238eoYwAqg5qIoU6X7
	dMYh2JMv1ew+9nptGbrt0gJV0mgEZYlgebqPCoAt3JlQWppU3EQEDmBxFZWgeTV0FH+r9MpMYUk
	Pl5hVZinuOVvcR2qTg8DYY5zyjRxqDckqekIUej0=
X-Google-Smtp-Source: AGHT+IFcnaEG9C5JF/FXFKuK2oaDx4Si9HMfxZu5+ntpUnNLfkk/5IWfmxp/YZe6PoFE7zQc+vl/kA==
X-Received: by 2002:a05:6a20:549d:b0:240:387:d10 with SMTP id adf61e73a8af0-243d516d7b5mr7539046637.17.1756637873294;
        Sun, 31 Aug 2025 03:57:53 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:57:52 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 7/7] ARM: dts: rockchip: Add DSI for RK3368
Date: Sun, 31 Aug 2025 18:48:55 +0800
Message-ID: <20250831104855.45883-8-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_035754_180878_F8AFFD3B 
X-CRM114-Status: UNSURE (   9.96  )
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

Add the Designware MIPI DSI controller and it's port nodes.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 674a3676d..5226b7e6f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -875,6 +875,11 @@ vop: vop@ff930000 {
 		vop_out: port {
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			vop_out_dsi: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dsi_in_vop>;
+			};
 		};
 	};
 
@@ -884,6 +889,40 @@ display_subsystem: display-subsystem {
 		status = "disabled";
 	};
 
+	mipi_dsi: mipi-dsi@ff960000 {
+		compatible = "rockchip,rk3368-mipi-dsi", "snps,dw-mipi-dsi";
+		reg = <0x0 0xff960000 0x0 0x4000>;
+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_MIPI_DSI0>;
+		clock-names = "pclk";
+		resets = <&cru SRST_MIPIDSI0>;
+		reset-names = "apb";
+		phys = <&video_phy>;
+		phy-names = "dphy";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			mipi_in: port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dsi_in_vop: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vop_out_dsi>;
+				};
+			};
+
+			mipi_out: port@1 {
+				reg = <1>;
+			};
+
+		};
+	};
+
 	video_phy: video-phy@ff968000 {
 		compatible = "rockchip,rk3368-dsi-dphy";
 		reg = <0x0 0xff968000 0x0 0x4000>,
-- 
2.47.2


