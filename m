Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C79E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 05:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=; b=3x4UpMjBZTaAxzm8b6ZilT/XCd
	sIOBpyj2JJOl27TTSEng0aIa/WOOIV0//lsEoVUsFjYR/56cj3cw+1mHCH8nt7dCy9y0vkNqbUfxS
	0PlolAdvZAC5mE3lU4a2k7SKWQnvL7DBH9vd3jkNro+fr1HUjXyc8GDigI/0uh+t/8zW8vDnFvHWQ
	fd5DEiwD1RFrjZgQz+ENyub7QSJono47KUs8p505unqBjhkEi6/ws4aAAkb7eTEN7qF0bdoE2D6Ff
	QdC9mpcgKSj8Q9pzpUc1wWPCUAsT1hcXXs5/Tih2nqT/YNzfvSMJVi18IASsC2g1yJZaB01fEEgGc
	L6y4PqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVl0b-0000000AnL3-0WNr;
	Thu, 09 Jan 2025 05:23:05 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVkug-0000000AmSX-1ZaA;
	Thu, 09 Jan 2025 05:16:59 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-71e3167b90dso283425a34.0;
        Wed, 08 Jan 2025 21:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736399817; x=1737004617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=;
        b=fQgYmW49qTVkCCzKWq1cL6zO177MKqPtsuyDIpPk5x7qLAJdhnuU34/G8+HveUcAyy
         gg7w8gKwSB36OiQpv7ErC5e9EHukV4/irsR3hf/LtP/pEa61106+jbeptfce+Hu2uSVr
         a4UYkkrnhSiYTVhfEHGnBvIAmKwkAYU7uq+mY8c7sYtypcN93pvMziBB0hBE5Wm9rWfL
         7unvcFfQkDRkC5u6hUaoGV+ELeuilzxtGWXFDd1LCdHANihEf69kYeJjVYD08NBUG825
         JH1YAUnyV593xvK126a2TL9zoNt6to4MgY7xvguntoikhJKQ7HpX2BmC2/Cji89OCR7/
         0VOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736399817; x=1737004617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=;
        b=cyrZN5Q/3njt7cI7SxOlPE0/ukE4KMWdFC2eOBS81FSXTGkpCk+47zlP6U77ZNQK4g
         wYub3vPQeRHPhDGP1rnXLhWVfYSdcl5ORVEYr5N0iQTrRLjnkcCX4LDLJUuvNypRjt7p
         s3VDQYD6Esbqhyg7RJ8HR5WzT3W8QNaxuLSjiePhQsTrAsg4clg9GStM+0b3HRu+Ms5B
         7QT5HatsshHmhGPD1xyWWe3JL3wkgBMjzWhsYrvPXQo+GrIQqR4HIuBeVbpKYSAv6QzH
         w1McD9YUeaooHHYpRTPYFx/NDOAAUiEdPih1i4ngLl4ksXZtBylggskkZP7NSF14Lx33
         Ko0w==
X-Forwarded-Encrypted: i=1; AJvYcCUy/OrALFJGccAeuYGj4v9pNbv38AaPZkY6BI49fG26RdLsDytQUiixxndha1JtR0pInTnKbgXnzXh4TybUnIw=@lists.infradead.org, AJvYcCVL/JJOsj9/aIEQ8XfkxLXhI13c5+lNbn4GlhVLzYqIR00ogzPt2gqmvzRFmGoMSZjP/u+VuiAUTrLgSLAcOQwp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8M4XpV95Icc3sr+gCO9blu96jKrKJWyukbhgIhJeDVJx3qUtV
	bwpQBxWVJhit8axUJ+3EZRuFVw3JC8wh5zqsatOUrDtpx+A0NZqA
X-Gm-Gg: ASbGnctOU9ezuxsEsPyOFLAmpbv+O8HE8QoF36Vr+4awNW2zP1zWqqEABEiSxpNI/Ir
	uh5oDwwBHaTxWc1pHMs16NrM9yBcbvDfPVFdoqh6MIUNBWQzjUHEkZA4aou7TUAOY0O/ojDN2fX
	Xs41eUrhEB/Akby4vUwYgrJp2bLYoVid9EdbIyhm7BYFI1sd9p6Cp7K9HIW+ZA1krid+T9pfJBd
	3hd3fGKhQq8Ju3Vpp1y0IV8ROdQZhH7X8Kbc0ZihaZRsu8OUWRMD60oYnQzQz7loQ==
X-Google-Smtp-Source: AGHT+IEpt0d5ijmwFkkrX4I7/Zuu+7GGnQCle9sRDy4Mh3arQmHmqyc3VJTxBx4Hrg0pJkqoZChGFg==
X-Received: by 2002:a05:6830:6213:b0:718:d31:feb8 with SMTP id 46e09a7af769-721e2e2ded2mr3597170a34.7.1736399817306;
        Wed, 08 Jan 2025 21:16:57 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:f022:ffa3:5bc0:c1c3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-723185481bcsm187612a34.21.2025.01.08.21.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 21:16:56 -0800 (PST)
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
Subject: [PATCH v8 4/4] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
Date: Wed,  8 Jan 2025 23:16:18 -0600
Message-ID: <20250109051619.1825-5-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109051619.1825-1-honyuenkwun@gmail.com>
References: <20250109051619.1825-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_211658_627051_CE8D99B2 
X-CRM114-Status: UNSURE (   9.57  )
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


