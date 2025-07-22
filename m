Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CD0C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWluu49IJdbI2h3dbimjwSTi4G/MwPZWZ2gMCYo3Vrw=; b=bVRjOG213V36tachj0cJmwz8it
	DtPLFR4gBVhb4OREMssf0syILHa5qTwy3ECPxYmjfhxOvcBmDWxJhKSn07J5270huXMBRh3fIYumP
	lEWOUJ+dcws1TgEvWNMZ4yPeo1gv7omowNgmp3srlRiHp0YrdqhcePbO6MrMQbfuboy5spWb3IkAF
	ook1gT07dhypOONc8ATEz8c/LIRK7AlBNpUcadhmaZVWjtXU/RvU8QY/4FQejnq3pfQpsXBifCMwe
	lyEdb2eX9zeiNjkXvHZKo1owuzcFyzYYQ1x9RC5qn6VsspEVkj2vl2Q2XVSJDfl/SG3ofCiLPDoUT
	L34VKyjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDFm-00000002a5I-35eT;
	Tue, 22 Jul 2025 13:41:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCH0-00000002SIy-1mz6;
	Tue, 22 Jul 2025 12:39:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4561ca74829so59952635e9.0;
        Tue, 22 Jul 2025 05:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187949; x=1753792749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWluu49IJdbI2h3dbimjwSTi4G/MwPZWZ2gMCYo3Vrw=;
        b=hxt7UITP0PoSOgrrwTqaCK+AEIWp/wPj5QhY6qmjUVaozFFdl7hncsEsHwHp1q60h2
         az7NfMiQNdAFcoerqw63a6Cw06nAfeiC7UWARhI9UgyXZNlO4N0zjOg7RbqTHlvuNS94
         eDMIf/4bnkIrg66pzJ8xzWTzZBhTvMIS3J5ANda0Q/6gr8AQQapzgsKDjmjiTPsS9Q1B
         rS6Rf47zIU6EVRkLyO4x/wGcfkdJpR+yUiUaarS1qFQsrfOBENcw8HMhXmPf+Br231ji
         yhy6lquBY9MJUYNjZQgs45fYy8E2DeZlEeDJzmxCJRHZoRTpr7f58IWm7CVXbbXuMArZ
         xNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187949; x=1753792749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWluu49IJdbI2h3dbimjwSTi4G/MwPZWZ2gMCYo3Vrw=;
        b=a+betSwyBvyn9riv9qUsgXVr8JaBOYq8kVFXFCKFOrFW2GQWezUPYVGf0oX8gnfb6W
         dtRhYQbxAxBOlG8LckkN/greiH0ocRXz1gTMdAPdERc55/wvrYU5RBJ/ge+m9UibF/Wr
         n0l605YQRLcCjL+v5QIzBkQYEpz8NK+HmOka5R8Wf6xd0xXsX6H0kEy//kHs+R3hAZnZ
         DoXm4xocxSUI4ydm5E+NzQigigGOqNNQqHHx9OVmDuE4jMIOUq/QrOTb/9KP2yj0F/gP
         V8Iv5WXH0V1nS5H5g0yaxwtcgPc95FjjUpBA9X6cYlMWX3dXL6g/XpAS2eWdSGQHZ76F
         bo3A==
X-Forwarded-Encrypted: i=1; AJvYcCU+Q+l6SStNW+Npo2ekvFeCCpqMMFW7oY7mgcFTVHCyTxVqFewOVwW3HNl08K1s7nux+9rKjoLu44BCmeVDWQJz@lists.infradead.org
X-Gm-Message-State: AOJu0YwCvfbv8emOA22e0E2t1HYpJUEEyDm6vR3jlYNupw3uvaZV4pFq
	yGqaY4TM6Q49/fbiNKZCY1/d0h+iGoCr6+nhivkEQ8W1s4ul89QpuocEI5+EfbIVoCdPZA==
X-Gm-Gg: ASbGncvQka2tG+0YjeZM7FDqQydE5WCzYezfByJzLHuZK0YoAkPq0VVYh5UNWcvj2Yz
	LY60LK6e5CRsZ0uNy0KOxvdqOhq6d6idXyTbrBUOg1l5V7y4jJCN8HFr3DwNQEVrow2WhIaINTo
	k0nc7MeNidixsKPGIJ0g+KUJrVslegQjERZXuLNWilkMgPvO3Qh8ZTGk7OXr8l8jD4FMyqCAEdv
	sd249BnDvTUWEpI2sysTl92AhZvjYfOW4dBMvibLSqSc2TTm6pil4xfrOwLtln1ou8BtXeIwOcW
	fdKhcxP9/+u0U2wnpztU9u/TpF3D5izbfb3liIgaoA/2BeKDqIO0XtZeTFZskyZH0FiAaTorcTN
	HXgJQdw4UTSOhuFTrI9vcrkrXpCU=
X-Google-Smtp-Source: AGHT+IEraH3X9pXO4sggn30Iq2vKffU5EddS/TLc3q5rEJWuWsuIcw3mUY8Btgrh8ziam+8yV1+nNQ==
X-Received: by 2002:a05:6000:2286:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3b60e53ef79mr17656375f8f.55.1753187948418;
        Tue, 22 Jul 2025 05:39:08 -0700 (PDT)
Received: from tearch ([46.104.48.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48c40sm13525197f8f.58.2025.07.22.05.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:39:07 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v2 1/5] dt-bindings: mfd: khadas-mcu: add new compatible for Khadas Edge 2
Date: Tue, 22 Jul 2025 15:38:11 +0300
Message-ID: <385b22d3f1d30e559cfdc08616812de0f958e5af.1753179491.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753179491.git.efectn@protonmail.com>
References: <cover.1753179491.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_053910_467950_221BFC49 
X-CRM114-Status: GOOD (  10.10  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Add new khadas,mcu-v2 compatible which is going to be used with Khadas
Edge 2 and potantially new Khadas boards like Vim4, using the same fan
control register.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
index 084960fd5..fd57ed92c 100644
--- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
+++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
@@ -11,13 +11,14 @@ maintainers:
 
 description: |
   Khadas embeds a microcontroller on their VIM and Edge boards adding some
-  system feature as PWM Fan control (for VIM2 rev14 or VIM3), User memory
+  system feature as PWM Fan control (for VIM2 rev14, VIM3, Edge2), User memory
   storage, IR/Key resume control, system power LED control and more.
 
 properties:
   compatible:
     enum:
-      - khadas,mcu # MCU revision is discoverable
+      - khadas,mcu    # Used by VIM2 rev14, VIM3
+      - khadas,mcu-v2 # Used by Edge2
 
   "#cooling-cells": # Only needed for boards having FAN control feature
     const: 2
-- 
2.50.1


