Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C7BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 18:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=; b=sfjTffNRjWikk6KhBzAwSQpJdm
	Aiq8nXSYICy4roUW7m8O7zXvYPPZMMwHF/uQ42WjvdEZgqENaTCsWrJxRTi5158/6QozjSRd9U2hQ
	dZh8bwOAAD0ZtIp63FJlH+C2KStj4eU1DhocHC+PVi7HDLh8fY8CUxwoCipTxHmPab7HPUdmwV/B7
	ja6NDRwYNGGltQN93t/cjnymuocv895F8fA/xz1J/lFSNaXZte+QTMiU90HFVyi2OxjZGGoOuFhnq
	4H32d8IkpM8Sm963l+6Gq64n5ljjpEF3NDa9R1Xy1vVPUbJCKpymUzikEY6q/4KOIiH29WVxqH0r5
	9aC94yTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyOw-00000003m9y-41pf;
	Sun, 29 Dec 2024 18:52:35 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyHw-00000003lEF-0JH3;
	Sun, 29 Dec 2024 18:45:21 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3eb9ba53f90so2139815b6e.1;
        Sun, 29 Dec 2024 10:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735497919; x=1736102719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=;
        b=f+1XxlK69wWRo30vpZ2a21t4VSqHUm1gkt2MED3JJQytI7ASyDAx1wWO8YVLjmUHbW
         2DLwulgG9fVIMaVzeKdWl1YDmyjRxbtEj0nviV0BuwfpGey8iugVxWwaJtS12U4PTuXL
         YKriPphB/puDCJ/2Zaxy8aaG14OaHnmUUcpg/XUoFHDE7h8b/7pi9jJ6yyGQjPIMYi5l
         8fP3XGeBC9Dg2MUXPMDr1Xi7g4SbYgqFIlZslhcwJpV57QAr/1OxCL6XtZRfJRTK+RiN
         fwfU4bvrUOOISnJuG2XknJukm2b6dkgSbv3QDBOBMjgpE3gbnNWkLV32M7icx3CDlns2
         68VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735497919; x=1736102719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=;
        b=S2VmdrqAa93ril75pKVlhzSAckNdtXph5uleA33+V/swlnsQFCs2UhsiujiBNd6s4t
         pUBMPlNaPV812gK21gt/51G6qKyUqJ1x+rKprcSqMP92cdinbuHvah/OAznWaEmCckyy
         JeO04b9TnOTe/4isFjHa7CmHgtDFyH0U6hX/nk9VCk4MhHbZNmjo9WET5Fjn+L35vfdL
         bhWs2RI/TwB3DpJBAvT7XgcrrXhEKmKOS6FHdCROAWcnEGgT0QxPWyOTtaDURlbem4E9
         ASJa33WXMe5AlX9pV2f70TRQkj8iYKNn2r6fnP62DcqB66UGvcgEkP4j3xjJrQtWgAzW
         Xk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwzdSij4berI2XPmzrDhh7NWe8xYVZujvboQkTSZ+WJef0OGeUch7Q5+NUo0zUK3vR3u9J16nuitCPGzJMgs7H@lists.infradead.org, AJvYcCWXdEW3JEEZ61o/YX9P0fCxVTbFSU6mFThZ/4HmKV3TXQn+fvJEV8Mp06oWEpxg7Rrh+K5QfaVrlz+9D+xXfdI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2IRnEL9Nm5FfFTTnzR/1RWnnSn8/3MuCvgTVdHg36K5KNQKW1
	n4m1r64TbGpTMnLqGL9LgsvXCWSrM9MxuiBt84Psr75zmccxPMiJitMNf0/R
X-Gm-Gg: ASbGncvqsQ/NzvrJZEuT0Rq0yDu3HtBrIw71ccQXaSpecEIjvMxM5gE2C/61MTpvzDv
	Mb0gDXyjHLES5fN/wBK+LEBxyQCX10hIwFAM+XptVmBUbPBY1eIT5XZW9+O0oN+inub8GPdnjSV
	cVYlHWWl6SfB2mzJiUUheDehR2fx20Aw2l9sFS4WpX5kzKZs88czVR15UEe1MsqnPBgyxmfTTnL
	CzuWU/WV/BgVr3CeL7OJnj7X/teexmutT31RMImg7nOJW/BYiRowkWW0ZezMQNY
X-Google-Smtp-Source: AGHT+IG5Dz6PKTeZW52qvpIKHumr7L106ymsa0PWmwxEz12ib8r4giLp1CEwxs+6Mx00o60XZ9fD4Q==
X-Received: by 2002:a05:6808:1903:b0:3eb:62d4:7098 with SMTP id 5614622812f47-3ed890b15f0mr18259001b6e.37.1735497919043;
        Sun, 29 Dec 2024 10:45:19 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:e765:a49c:5c4:1103])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc97d6fafsm5515645a34.31.2024.12.29.10.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 10:45:17 -0800 (PST)
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
Subject: [PATCH 6/7] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
Date: Sun, 29 Dec 2024 12:41:34 -0600
Message-ID: <20241229184256.1870-11-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229184256.1870-2-honyuenkwun@gmail.com>
References: <20241229184256.1870-2-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_104520_129568_85E936A2 
X-CRM114-Status: UNSURE (   9.49  )
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


