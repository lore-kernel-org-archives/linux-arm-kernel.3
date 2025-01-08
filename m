Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14559E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUSvQ4Xu4ATShuWHhFsElgSbFZFR6pefGB8G2DsImpU=; b=yaNNcRHVBsFrYy2rdSZ6XCEdFI
	XUIO2WNwVEljIQ7qSMvx4fRHFUpKJ5BzhaHTqk3+5xEhI32cTIaH+81uKbaLz+pnOQep6lhzaDRTB
	+FLzKq7zLUGNA/YAowkUp/du+eLBG91fijfgX/Zx1ZumjCt/yE1JWKNetZPwu+WCeUmRixmsSPDvF
	YmQAGhFhpIySuCMwogBt/2N+2LpslkC0VecKBYnTUJd3V3B/rtlQXPSRoRBM+eS0PdnIZvNgbyHuk
	uEVXs3SDUhR5qmLHdF9OzcThjNW5fpcJAmAEMn8DRQ1ijBs8w5wubCK/sDuFbinn/BhFPNOmGbDmD
	Wd0FDqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS74-00000007hsh-0NTF;
	Wed, 08 Jan 2025 09:12:30 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS4l-00000007hF7-4Ar4;
	Wed, 08 Jan 2025 09:10:09 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54024aa9febso17516620e87.1;
        Wed, 08 Jan 2025 01:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736327406; x=1736932206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUSvQ4Xu4ATShuWHhFsElgSbFZFR6pefGB8G2DsImpU=;
        b=cIpfUokT7N/GIVkJMcGEjq89/jtXP7ChX7RryPKqfkRtJ+e+lyjbURaxy6wzmwD9c3
         zuP0KkwQcQHYhcv119N+wOlfB5AdRXhcGVbFcRbLW7EStS+Ukmb8cDkC2rRQv6AsVAuT
         GuKRmCr7UR+eRk9xsfEWStnHHu0KacpB15Ds9Vo/+vNpLkUAYTkbVJFN5iHAmiOMrmBL
         IiHi58TPamhWyCEn1eGsGKTapovsSOwbBJ/B3Mzc3znW4PtOYVWTzAU5jDRDOnO5vJpT
         V+mji/eujG9N5Od4uZLioBDZmq3IVOrArt2vux65l5/uHV+JpiM+Ts98OvBPvrGbFcGm
         BooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327406; x=1736932206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUSvQ4Xu4ATShuWHhFsElgSbFZFR6pefGB8G2DsImpU=;
        b=FUGRzXYxpH7eJnFHXUyvN7z4ay+rAbmrFsMsHbYSUvhOsS0Y50Gb97m0nRCIFrdmky
         WQB9IePRA6n6H3z0CoYO87Vfu/qbznVKliE3iLE4FzB9eDHc/ODNnqPDfUERn518B5mU
         2984iCztTWIaz9Xu7lmkYmEREDvr3zf7vQgFSDXNkcy3DkzH+Atnt9OYPqZQqr8yvyaU
         EzhTUgtXvuPbbUhbJ/V0NDfbQqwNl3ok3C3s/LW3UuqQ53nM5HTLanS++0OqELovU6oU
         MT6jFXLD00QvnAJUUqGJ+LRBhNqEbNUDd4hhDrkbF4LORfLku0g9b87KF9W15aRHtRMe
         XqKw==
X-Forwarded-Encrypted: i=1; AJvYcCWo81kA/EWUusdGFVyLm2bPvtMrrJphYnbEcIrBBs45JOXQrK0xHO2L2Xpa8parheMx3Poq8iRU49/rwfrzgTY=@lists.infradead.org, AJvYcCWoQtS0cCQUJERXdosBjehKmRuhBwqsf7FW3JbAS3wtdHU/KtGcEspwrt9gd/4ZWgpX5tNCRt5Vl5Q14fcM/OlO@lists.infradead.org
X-Gm-Message-State: AOJu0YwKhlZOn1IzbMwjFzOAK282ZjzpSuBuKdhssLPJxllQUaGiYSt+
	JpfW4/MLBRpchL0VWfqcT3CLnbM8ex2r5zXSKToknl38AL41JTzFIwBw0ZOzRIiwqg==
X-Gm-Gg: ASbGnctB3TVP+j8xOWr3TRdhfuwRr1mj349yY1Gmwu5F6LfTCFOIl4jBtThJND+FS9q
	ua63pfUVNRax4/06lu33Q0ww97/deq4JD8A1Qm8ragiENl9WfGdLA1DL0eHyn82RCkf9UEQpW+d
	a5gScXuhMpbJxdOUzIv1kL/1EHvwuXTCG2HgeDjyZn0uksCzhUH/ljCRFhLnaRbZeAVDL7T4AoC
	yEZZcQIqvsg2PRC0fgWNJcY+/euyLT80Z+iXCjHLZ2em7j/h7sBUcD3Xg==
X-Google-Smtp-Source: AGHT+IGqheEd5px2UdkuTaxcRoCOzQeOILEnsMyEgdd8cdUdR02/8V8GvWYY7/7UaqdFPDM1m5lwpw==
X-Received: by 2002:a05:6512:acc:b0:540:2549:b6ca with SMTP id 2adb3069b0e04-5428481cc82mr524834e87.55.1736327406001;
        Wed, 08 Jan 2025 01:10:06 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813898sm5386450e87.154.2025.01.08.01.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:10:04 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 08 Jan 2025 13:09:06 +0400
Subject: [PATCH v2 1/3] dt-bindings: arm: rockchip: Add H96 Max V58 TV box
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-rk3588-h96-max-v58-v2-1-522301b905d6@gmail.com>
References: <20250108-rk3588-h96-max-v58-v2-0-522301b905d6@gmail.com>
In-Reply-To: <20250108-rk3588-h96-max-v58-v2-0-522301b905d6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736327393; l=1088;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=+x3csT4k7ekXzqHzS8jNnW3Fpv3OJz+8CHDZS6BnFRk=;
 b=HWWcXGqo2JBDjD6947tLYXHkSebYGscP7VMeqD2GFDgTyfMT6jymmDGIOJeHCp8jpzEteMLtC
 5AMSfMSaSEkDk36f1dGG/td1qOEdOwUeEazL8/IcTdW2apldRVMQ8gU
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_011008_036075_4DCC4206 
X-CRM114-Status: UNSURE (   8.32  )
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

Add Devicetree binding for H96 Max V58: a compact Rockchip RK3588 based
device that ships with Android and is meant for use as a TV connected
media box.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923fadaa48c407a8e55e7854db7203e..010db4731d5f368365c72d17f66cb55d94ae1630 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -597,6 +597,11 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: H96 Max V58 TV Box
+        items:
+          - const: haochuangyi,h96-max-v58
+          - const: rockchip,rk3588
+
       - description: Haoyu MarsBoard RK3066
         items:
           - const: haoyu,marsboard-rk3066

-- 
2.47.1


