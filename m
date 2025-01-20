Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F487C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 19:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CerU6xvl9lcXiaDqDUt8ZKpDTAlJGqkJkLTkeLu13Uk=; b=Z4l9kC88YSgTy+WWxZbB57BDRV
	g94rLfqvbeRJRI3Z9hGmzQ6+UAE4FaE/H6jdZFnMcPYVC/yAPT2QBSodtE2DDx7wgYnpucMmeHNfl
	lBbDNMUiHsqn9BaIpX8Ydc3G6RwlFAoLxfGlY4z82QmUeJoMbhy6lwkygYQM5xr2UE2P/M07ouENL
	Riyoqwt6b4R1miYyvftbasyzArcJD1X0tRq4JSGRCK9r39IMRimKrpycbXX8PZpidRmMHt2IWGYpp
	aWcTF/9kkF4vPch8QKsU29Ak6wNf+vI7mcak7RDA90YK3+zULud/x/YS/7oDZqAqaueK5XgLIEckl
	eUY7Iwyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZxQJ-00000006Jx1-01VD;
	Mon, 20 Jan 2025 19:26:59 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZxMg-00000006JU3-1xJ8;
	Mon, 20 Jan 2025 19:23:15 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so4579998e87.3;
        Mon, 20 Jan 2025 11:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737400992; x=1738005792; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CerU6xvl9lcXiaDqDUt8ZKpDTAlJGqkJkLTkeLu13Uk=;
        b=k6lvX2fmx+aP5YAeAAZ4fBOyMpLcTdzOqzvPqRtsqXo9Bk58EO+cPAupdnZ7JrJPxL
         JHzdGkLK14XReu07jdKWEmB/lln9e9eHO+cSf+B5F59L5qMuOWGS6PqyrPlswKhh5ihV
         3MHahwn9ScmqovHDFW4Zixq5tv+mvjXm8BvqRmCIICcfsZ77DXxHKNl0I7i+ouKFPtrm
         uVFOETfp2zWPXspWt0zXiLKQFadARiMktxEPIel+BGEu4gB2FHqYEvhoQ+PVHAGGoYvZ
         7X/8xx6WY36DBP6BqBZKJ/K0iuS6GOGkStpv/f+NVGIfNFTxWhFNKsKhMjlp5otjJpvO
         Y2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737400992; x=1738005792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CerU6xvl9lcXiaDqDUt8ZKpDTAlJGqkJkLTkeLu13Uk=;
        b=QyiJPKYGdFvIdWSJhevrlQ/XZ/aU9QOXmrmqB+bUK2m4xD7kuFOZAsQ1on5eThrUml
         rsjdEN8W5A0zfuQlZx4oQnJByM1BT6PKf0+Kcd8lCPt7OdoXvYqI8Vev9Q4F3DciqrdQ
         iRA97WwDabp1B7bJ5U9VkfHB/ryEEdh3y1+utKizL37tEtdIEYbCYbaV0uveJOXX/VWu
         ii9ggdwsum52r/nts7ojY5HxCLcmkCYcEszFVRjXY9IDHnd9roD8J93gwleeyf5Y/N/x
         tO1JjLDrEWA1MPjUxSS+m/Uy7/KmSli4Y+bEAac5mRRpgobby61YucFTSgDiJc3BV5IZ
         aj1A==
X-Forwarded-Encrypted: i=1; AJvYcCVtq0KXVfPEAy5bjdP15W8c1Qmv3JiHnEfLcM39DmzGbiNClwQa2s8irJ5ONd8Dm7k4Y1rt9Qkzlpzuy8yIRxw=@lists.infradead.org, AJvYcCX7tiHmwuNL23eMJ4e++kzhRzR1sgq70zEgfoZOcFjAqIRWbu60N84t8aKznt5jRxDM/CcAWEWXvl47oKpxTC61@lists.infradead.org
X-Gm-Message-State: AOJu0YxcYbquLH4ykchua0Oi3g4/AeGIgxFvA/LLDL8bd5ZcCbw8BaKD
	MN5BsAo2X6lmKzy09tWq9Mg29vLBVznEK8MgdBloop8ZwiRKcGX1
X-Gm-Gg: ASbGncsm4RIrVbeHN0XCQbRrtQBjqjBrLmgMp7rIzYFvy2F7LteB9or03mZJKKE6vIS
	lhJu12oEqSQ9y1QmDrGSBJBvG4RXH0svnAR6sF6D8B2IEyNbxBVZiwK29dzGRZJVas7AKEgwVDS
	P/u+u6Ck7ebyWznpr0tt+uGfVp3Jd7ve5pGrn9LyrtTBoZIryRv1rirW05Pidx6MF1H4QeRo+Z7
	1ON1uOG0IT/AZpVg+87nBNKBvpmBKmjUWq+Et3VanD+akFtbC/a2kGjZAE6UAYN+/PnUAM=
X-Google-Smtp-Source: AGHT+IHf2PZbpFBhm6xQF3fctlNvkttb0vgzfqpVAIWgHcDB65Se341pGvnkDgcpLLDfHvKr17lOlA==
X-Received: by 2002:ac2:511e:0:b0:542:98bb:5678 with SMTP id 2adb3069b0e04-5439c248293mr3381366e87.25.1737400992347;
        Mon, 20 Jan 2025 11:23:12 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78fb0sm1460156e87.247.2025.01.20.11.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 11:23:11 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 20 Jan 2025 23:22:47 +0400
Subject: [PATCH 2/2] arm64: dts: rockchip: Enable automatic fan control on
 Radxa Rock 5C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rock-5c-fan-v1-2-5fb8446c981b@gmail.com>
References: <20250120-rock-5c-fan-v1-0-5fb8446c981b@gmail.com>
In-Reply-To: <20250120-rock-5c-fan-v1-0-5fb8446c981b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737400976; l=1557;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=//LokAOrRA/EeaT7c38MIMn9xv0OF0OdXdgFumo2L3E=;
 b=b//UblCwgSfsCubs+uRP/+gxXObDUfoo+IKG9h27aNXw/OVa7YQkqZJFdMFxG4gh+/RMZt7JV
 trcFo0mQya+A1AmnYJ1eIpQ3nvSieGqS7QJX7s7iuErEwIhD6cuvSeQ
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_112314_511829_AC307386 
X-CRM114-Status: GOOD (  10.58  )
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

Add the necessary cooling map to enable the kernel's thermal subsystem
to manage the fan speed automatically depending on the overall SoC
package temperature on Radxa Rock 5C

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts | 32 +++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index 1b66a69cf0f8795d7305852fa7fef3d0672ada7f..6e56d7704cbe0dc06242cb39df56b2fc9d6bc774 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -68,7 +68,7 @@ led-1 {
 		};
 	};
 
-	fan {
+	fan: fan {
 		compatible = "pwm-fan";
 		#cooling-cells = <2>;
 		cooling-levels = <0 24 44 64 128 192 255>;
@@ -417,6 +417,36 @@ rgmii_phy1: ethernet-phy@1 {
 	};
 };
 
+&package_thermal {
+	polling-delay = <1000>;
+
+	trips {
+		package_fan0: package-fan0 {
+			temperature = <55000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan1: package-fan1 {
+			temperature = <65000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&package_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map1 {
+			trip = <&package_fan1>;
+			cooling-device = <&fan 2 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &pcie2x1l2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie20x1_2_perstn_m0>;

-- 
2.48.1


