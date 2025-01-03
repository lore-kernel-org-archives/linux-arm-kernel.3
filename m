Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30036E77197
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 00:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=; b=fdLbSC+iu8Q0mNlwikq78OBBeM
	mYRbyLxNmurV8Y+VKiau9yqOXS8yEr8bkhWDFm4TSJhCDvBIHahAe7GgiKPiNHp12bV2vIXo+q16s
	2/bRCiojaTYNyVOiCmMkzIFeM6RWkNZgQU0QwvjKONejsy+h6UbhMJr75cS2VZMowIrl+y8Tnd7r/
	/c3rm62h8kwNi9bNSENdCQMXEttJm/wxWrZ15UVKzg1521I4lp+66TNAnNxJxKKRwKas/VRjrc06C
	haNt8yfiEfF+C87tBME+iaFN/8Qs8ixDRJXWOSIi+ugRUwRwCakPTqEMnrmXyVnBW8rRNPZMFJKpJ
	ezpWgfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVr5-0000000Bn6O-2XfP;
	Fri, 03 Jan 2025 00:47:59 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVlC-0000000BmCB-3EdQ;
	Fri, 03 Jan 2025 00:41:55 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3ebbec36900so6648344b6e.1;
        Thu, 02 Jan 2025 16:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735864913; x=1736469713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=;
        b=IopJjy+4htGbFyvRuIA3d+W4GxSDgdBl5Jiqo11xrNPr4MY3Cm++gUfHGwbuS2JASq
         kAb+ofpkS7sF9qaGcDySuu0Ft2au6PSz7QP7ZIIbeG/hEkXRzAzeCd85spTLNLmpKi8e
         /G0uzHXb7YGI9hzy0sYCliFatbImy6Ez3wE0Okw8J3Z6NhxW6/M6/Hc6IcxSRLVyfhki
         OK/L4Bj29rKMEzN4iGNeyG2evwkD/IJQ1/7WfQvzd6M/i8UbqzRPo2zP6Ffop0+1WvVT
         3EHQfOEcSayTMczhmVD4nDQWY2vysiEV9xM0RbKB6PsyPIe2iIv478JHp3T95Kt64Yzi
         PuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735864913; x=1736469713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=;
        b=d8ICJQa1nId5BUWyq4WLRs1RNIMdNKqAoqqPYAfse94Uu5DDZK71+Y9RvnytFC85ME
         3a1w0e8ftugEo8OcoQhtQS9tsGedqsJDYiA0eu3WEFNrK0C908o/pwbBIe8t+t/iLRvi
         IT3ucIpxSj4PewSzaPS5MdC1k8XMBn6dEGW/k9h3Qd8lFETsKQ4fUzUeeuKZ7Dwo1PHR
         bNkmT2r3E2raKs6j8MbDh9UDEeshaGj97degS8Ss3tNV0amYAruHP93Muv9H0QBWrMO8
         shIiYVqctrV9CUveCCdxctG6JBgvCjgakP7zOXchOpY97Fq7L/wE2r4oNvF0fGfnKBBC
         tTJg==
X-Forwarded-Encrypted: i=1; AJvYcCUxN2I5XQXdyKs3i+DqoLt7ZWDdFSXhCNCWbbvs69UEZmDn6pXF/4DnQdqpk9QOO9EQUwt2N31txsNASd9wao1j@lists.infradead.org, AJvYcCXvIlpKFye5YGjkT0I8jL6pCOHf+QzyDo9f5nchxESWSBXNFdIWRyCca01Biqnq2LYJg7Cg0tVXTQcE34Wh+pE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvyx/E8l/Wzv9EYmJvU2jyGI9XeK2INZ9ZqLxUgitywWZ3cN7x
	LO3QAM/tHiMRMu1OGJoLa1I3DjxWuqLRuWJWRgkOPf+1JX6M+caPFPsJqeTB
X-Gm-Gg: ASbGncvulgJeewRTGVe2BgKfKv2oOxFzdwejztCsuTCy31TzaNT7a36z6s6Em19LHJl
	gbt8uuUVz6Xs5lZsR6zVp71qa9TFieyFw6V2BkPun1SFjsG9ea5NRjUwm/9n0XN3vYv5A///ta/
	IubVU0Dcxv3uAk1PQ31PUgTfhM1FOSXeKwcG4bneyTJMwK4iqpVeF6VhY8Mf/Ia/R7uB7Cig2g3
	4ZAHUak3v4QEQJT/yt6SOTdLLYq+kAjtVhGYjyYl4/SGuxW5FeIHRrFEzrqTmDhKQ==
X-Google-Smtp-Source: AGHT+IEoHQWwiLapEKVgytJxSQmhBEks8va984wiDZUIavYE5wi+XlT5dD2vv0dEfEgVlwxD3tjWSw==
X-Received: by 2002:a05:6808:2e8d:b0:3ec:d34f:4c73 with SMTP id 5614622812f47-3ed890d85b9mr32263494b6e.27.1735864913718;
        Thu, 02 Jan 2025 16:41:53 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:19f2:4f54:d97c:af6e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ece2549542sm8087778b6e.32.2025.01.02.16.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 16:41:52 -0800 (PST)
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
Subject: [PATCH v5 4/4] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
Date: Thu,  2 Jan 2025 18:41:13 -0600
Message-ID: <20250103004114.1902-5-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103004114.1902-1-honyuenkwun@gmail.com>
References: <20250103004114.1902-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_164154_805086_435EEF40 
X-CRM114-Status: UNSURE (   9.52  )
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


