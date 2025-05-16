Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366D7C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 00:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSa81401b4zyS6qA0a4vLeim4ZysnMHWmu7eBDTP9pI=; b=ZMe6uN0HClqdor7GQrc1UNkOK5
	UagbuvBKuBLWZlCWRgUy0tc6r19kIGT5Zat7dh7yd4Y+CyQjoYtButvq16Xo+8RmFxegWXjLQ4lJu
	jYndS/Ha1K4T3Bc1LXrNAntsnx4GV37rSqQSoj8wbxh4C7bUBEkNhJsb79ZAv45zEbkhPr8K7Nncf
	ieshMd127aifavHRxknVR7h7s0KZU4FwTMiPh0nX1BuVo1XdCEcwFODsXwtce/1KKNuYrepKbUzYK
	x11Iixled2P6vc9jYRZQeH6tdBR1Fb7p022yDbm3Vh//bDRR9ALrDRdcrJfFjY2Y4aUfGG2ACZCBe
	NJ0I3BFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFj1l-000000028lc-2weR;
	Fri, 16 May 2025 00:34:17 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFivB-000000028CB-2zRg;
	Fri, 16 May 2025 00:27:30 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-476b89782c3so17160991cf.1;
        Thu, 15 May 2025 17:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747355249; x=1747960049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSa81401b4zyS6qA0a4vLeim4ZysnMHWmu7eBDTP9pI=;
        b=DksPfwkUQHznRvuUxL84JlgP6DFEanB0x23w12qM8SToFwQv6pud8tbd6OmKxTnvnn
         dXl/Y9tJ2QYFjl8rBg7gxNo1tfY5JPn1uf3z/ntP5B2nABVX3w/qLO52pQ0TG2YxGSmr
         HMPSUkO69lWwcvYLtQyrJVo7YPpCykAYdz8OVGD3bUPsHr5CLlC4m2P6dLDXpjqClcRG
         oKVaaHYbEbwpesIKi7cVaHGC6cJzi928CCBe9yyfYiui0BldL0WInCMmOifxqshJg5Qc
         D5RbhUn9/d0n0VMN8jPIjuwF+zXadMVpsLFhVHGaQH6BNyrOrplZgiqLnBKxcXzpN3xz
         vV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747355249; x=1747960049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSa81401b4zyS6qA0a4vLeim4ZysnMHWmu7eBDTP9pI=;
        b=UVqDWuz1ECuhq/gS5xUQLjgZ3+sjpuFs5lLhJNBFLnXW97rjgN918H5QIQacUrvqqn
         JuDKHryVqubc+RBXDY/FwDZ9EQFI8dSpJuhUDBDv7Frd/jZq6dOOF1+XVqZuqru5d9bA
         EZdxz08DPW0OHdP47+9cOAMQz1YYyW5KV+f5X/wqMopx8MVcvrQMERCJAqtTvZT9jtHw
         b9AbzdsaroeXv5jtG4pN5F4d6gnlfLBTSF2gf1L97iH0VoSkMFjWi1XzZ5zDMiYSqYE2
         RuKUwe1MqdUmrqEUtoNxy0oZZ91slfMob+gQbfnQwqvvzZKJEi20/EikQtOoENQ9VuyP
         URTA==
X-Forwarded-Encrypted: i=1; AJvYcCXr1hZjFIeJBU8XH5Y/OzfuVJmAJ/wRhKpVPNppLJh/mwE4Iock559FyntK2Jl925Gpi6g8thwFy8KJhvUE9QeE@lists.infradead.org, AJvYcCXtQLF1SUH34C98M7i4zLh4FND6314gLvZoMUW1USe6ZOhb/JqyxiCsOt3PNnvoYXOV3LrN5drE/MJKLo8y88M=@lists.infradead.org
X-Gm-Message-State: AOJu0YziLnnvuKO1ke1nmdMN0ytOzqBgt2DBscFWZlPgjG1Um/wed2+l
	y6DhF2n+oXIn0Qv55RXBAZcfBLLHZAinj02tVgZIqnEfeecHFUuGfxCr
X-Gm-Gg: ASbGnctrykL+90RzsyzWm2mdHf3FsmsjjNL6f3+t2veUw5lvnqHDVhe+jSLuhCN3CvZ
	oLDTudeP0g72e+xvll8hYiQ7xouTcr3++H3ANiX7KvMCjLBjw2jqXznbI3CPjGsw/aEBcJLU89x
	qMYu6JId/RGoUXBzi8qguSGXuIBD7RlMzmpT5XTbGHflCrQ/eqBwWOhHjBeEJyYKMKntVYd0YKv
	37ZCf8njG7e+qwlepS68zfC8eVq5/+IllVGeorIKqSdolF3MeeJokXljQ7y0SbgVHX4cLW1GUIZ
	pNnBRommlIBSpKfJh4zZ8Qf3fjOMBRqKrO76jFjhxY6EyllGQ9G7p9sIAAyRcRocSUPQojdOaA=
	=
X-Google-Smtp-Source: AGHT+IGY9gDIvQoDUW7e0xAMa0XYpwcmd5UyXBXiD3f/EUiU07xUR6ZkEpVF77phe/RPdGCJO/4i9Q==
X-Received: by 2002:a05:622a:5a0e:b0:494:ac5d:15f9 with SMTP id d75a77b69052e-494ae3a42d8mr27723371cf.29.1747355248929;
        Thu, 15 May 2025 17:27:28 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3cef1fsm4563991cf.9.2025.05.15.17.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 17:27:28 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
Date: Thu, 15 May 2025 20:27:12 -0400
Message-Id: <20250516002713.145026-3-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250516002713.145026-1-inindev@gmail.com>
References: <20250516002713.145026-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_172729_754027_D1E3D7CE 
X-CRM114-Status: UNSURE (   8.77  )
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

Add device tree binding for Luckfox Core3576 Module based boards,
specifically the Luckfox Omni3576, with compatibility for the Rockchip
RK3576 SoC.

Signed-off-by: John Clark <inindev@gmail.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5772d905f390..6e0b6e49a3bc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -715,6 +715,13 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: Luckfox Core3576 Module based boards
+        items:
+          - enum:
+              - luckfox,omni3576
+          - const: luckfox,core3576
+          - const: rockchip,rk3576
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.39.5


