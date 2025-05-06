Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D606AC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gT+hqvYnvFoiGUuape8lhiuYp0FjZhhNlHilKAoqjy0=; b=SuJvevrrjlDh6+1s1oz20tP+qZ
	NgPEyut6FBRwzb6IbLLaAROMhvimy2H15wKpHwTg0z8JFJxjcU0TM9mXOlMRcZ4exeNEtUjtDCI+i
	oGZnbsRTeZcqJAEnalkumg/WcVCUhT0qZa1+UN44ihgvrrKe8W8YMzehc9bPWdHJKt0148Af+sn6n
	4RSl/PHtn6dcugiJHp+xNPLipN4GkqSla5EP8pyXWSlJkHn03ESizpkipHmeuukugfVxmzn7gy1+f
	7xIWvkrODijdrW31FAfHthdiqNMHUnM3/vc95deAk5LjXRZw5Et90ZT9r8iltcZJjwKlWOmyEhv4q
	pNrtA2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUcf-0000000DyD7-2dB4;
	Wed, 07 May 2025 02:35:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQjH-0000000DaX7-44zL;
	Tue, 06 May 2025 22:25:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so27958675e9.2;
        Tue, 06 May 2025 15:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746570334; x=1747175134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gT+hqvYnvFoiGUuape8lhiuYp0FjZhhNlHilKAoqjy0=;
        b=chNd7Y8ZR7Mm9vY7MsUTwIgc5ldNim92Nb/9JCEEJkUh8pMCAn2MviQY5fbAldfj65
         EfXP6gPjcJy1GN4Fi3mGNP1BskNsMHIpTb9MYixHFYcYm4mN4gw8+sgsLcsoh1672aJP
         ffEo7eQjfYsqzJOQAvRfXAfZZdIaDm7HgosekAviq4IGw15KS7fNL+DificIVhFZTqXR
         PtxiNBDSHcl5t9q8kYtmRYBfh8ZYAD7VS7VCV8F+YOZWjKFdRQ2N3vmY9kqPOPdICuTP
         sDFQ6QXmUALS1v3nzYRSG+249iqKvfYkC41dX6lsyN9SWSCs97C4DKxq/4kJNRK5ULCi
         4Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746570334; x=1747175134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gT+hqvYnvFoiGUuape8lhiuYp0FjZhhNlHilKAoqjy0=;
        b=KqlsFpIj7lM1J3SFcSYIc5B0eoiH0srZxyBH6jVB+sn4U4TuqXCDCZZAVIZcEaQFbH
         zXaaELRRw6YvVuMDjaioQP8IR1Bs2vlbUSn2o5EamWgz9FSFhQFWwMhzV0iDDqwAOMW+
         fY+LafuSqtFKxKuoRhdDQPOIgZ2l0sIaSHlMTaOzhhpeHk61ws/UwuInPTooi5S0lMCU
         L8gjIaioMEdH0VjC2t40TMQxN0RtcWY9Ll/sC6BQa0g8nAuqrAcG4y6FRwBVdNXeja91
         oV7vdyeb9jB1i/kHjC8iCffqFDA4/aQ3H/QpxEirhf+vHSNtzlLgfFxh+JLODNI2nMqy
         UDAw==
X-Forwarded-Encrypted: i=1; AJvYcCVYdSgvHdHWWnSRPIxtnpIwiyiyTByMHYSckrw+dXjxWFJRYjRmR4thuURcupbobsrwvQwnKihH8RqpiekvoBZU@lists.infradead.org, AJvYcCWXa4/RRBI4oi4nb2f64WCasbwP2TWUOhY4Y5vCQy6NKSpgcVQUO9l+kEcAK0+V3W9luJVDQiJ+fLXsFGEtCAY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFj7k+LDxC0Wv8Fnq/DUf4i9nHbZZLB3652dyvZtMiZKobcINN
	FtTKiSD/Iol+xmL8X08ISyCJImjb8DxS4yAo1s3GNhwS88F6J2zW
X-Gm-Gg: ASbGncuw1dgsu6x7YKwFzM7Re1nIu5DEVRl3JB17TPGkhvm5tgbJyuR/m3DGBqSvy3F
	y9Au58lvrcFQ5P3R+Oc8jLZfyoTDvOVW+QnfGz1MMwqmMxKc6WVHyBMDCWGuSeTaqfFYW51/E1b
	c5srrYtxF4mwS5UkQcS4IAXaDQvlbj/HuHtn+uJ014Sb7YfhnT5NSNulkd9WwseK5j6pMq9Y8Fw
	t/tzNV+JWRClFVq2N3jRbRCLw7GaPAaOwQkktoNKdKaKwFYSEei9POYy/bTlCmX3vI80HnQ446o
	U5cYAspVZX7eGaFQKWSDdQKPv0We5razj8erC4HnXpZ4rgQLSWTuzAE/Fw7WtamUxdN7v9e7DsW
	as+dPqpl084vwPiwx/gXwSmQetPlczH/aiByBwFuwfdcQNfKl2ufVI/i5b+GvQ9BMzZsTb1euic
	w=
X-Google-Smtp-Source: AGHT+IGGW2UR02UyKr5m7oSO8uNudVCq7G0oipkdATajemKEbGILj6K3P8WqusgC9FWz3WuR33yVkQ==
X-Received: by 2002:a05:600c:c10:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-441d44c7c36mr4619785e9.19.1746570334058;
        Tue, 06 May 2025 15:25:34 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-441d43cb59bsm8202305e9.2.2025.05.06.15.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 15:25:33 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Tianling Shen <cnsztl@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Update eMMC for NanoPi R5 series
Date: Tue,  6 May 2025 23:25:28 +0100
Message-ID: <20250506222531.625157-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_152536_011910_CEF5C6CD 
X-CRM114-Status: GOOD (  13.78  )
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

Add the 3.3v and 1.8v regulators that are connected to
the eMMC on the R5 series devices, as well as adding the
eMMC data strobe, and enable eMMC HS200 mode as the
Foresee FEMDNN0xxG-A3A55 modules support it.

Fixes: c8ec73b05a95d ("arm64: dts: rockchip: create common dtsi for NanoPi R5 series")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

I had reports from some Fedora users that their eMMC didn't work
on the R5C and this fixes it, the schematic of the eMMC is the
same across all of the R5 series of devices.

 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
index 00c479aa18711..a28b4af10d13a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
@@ -486,9 +486,12 @@ &saradc {
 &sdhci {
 	bus-width = <8>;
 	max-frequency = <200000000>;
+	mmc-hs200-1_8v;
 	non-removable;
 	pinctrl-names = "default";
-	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd>;
+	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd &emmc_datastrobe>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
 	status = "okay";
 };
 
-- 
2.49.0


