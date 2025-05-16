Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1995C3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 00:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zG1srQqLDMHsfN+f66cDo9FQI+23IqqYDi3JvlxhSCs=; b=s9cCz2nY9Q5dxyyGcvJF0l/FUf
	lMEXkfhqAjVz2ZhaIG6UXDXrZWPS7tZb54zL/d/xED7De9YTZjPXSzzTPF4veXAoJrvwmdV8umbd+
	Kfx/pFKHM7FWaRmWyI7YlAKhxsXXzuDTCHGv0zWZGR723C9b1v2YidYvoFeugO1cmDImzYBnsyQdt
	1k+jBBspCrekRf9CqCtAwhFVnbPTQo6jJj7gvKUaw6kGESfa5KIbUnj9xXcm4aBXcbOTmXYX4sz2u
	1Hte5GJAM5QHA5ljCi3Onjb2t31KR9acPNaQ8jLXT54ZCnQVUMGN9VK4rzFAH8pi6HCTfOknuJGQF
	NeFc4jXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFizg-000000028dT-2WKS;
	Fri, 16 May 2025 00:32:08 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFiv9-000000028Bl-46nl;
	Fri, 16 May 2025 00:27:29 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4769aef457bso19752721cf.2;
        Thu, 15 May 2025 17:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747355247; x=1747960047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG1srQqLDMHsfN+f66cDo9FQI+23IqqYDi3JvlxhSCs=;
        b=GuATH3zaA4/vU8GH5DcFb5lE/j5rlLCSRHi5V7qPRSJ6yFdzpAQCJTNfXrga526vrs
         htqGhZOl11e8oor4YmE2y9uoxMA6eZFU1M0O3rs8AVlKn5OSdOrPYADtAsKJ+b4cfTkl
         iid24RnHekzG/Xl8OgxlX187ZKFwcfQz7I2lRActnbKaq1DbG6kCGMZpf26aiNo/Kjp2
         pqBL8/iliEU/vu5IpOtFRbv5BRUx1iKK0YWlFM1C/4r6adjJTKiK0I8k5z+DEx5PBCIg
         eSPPEysEJ2ydWA/lTEQaGg7r7jjYRr2EqnKe537QHiZ4hYToQSRGrd7uCUorX3BC8qsF
         efRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747355247; x=1747960047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG1srQqLDMHsfN+f66cDo9FQI+23IqqYDi3JvlxhSCs=;
        b=AtErjwpNnelLQINW7J2upg58g5PjnTrnbKezWOTzXv7Nb3TVnfX8yYzVZ9M+UH09Y+
         E/5483xcr+qQdSSOlSNZyJXeOnuVd1GhcB0PYINjEfwRGNnIFHR5M94IeWHB7hrHWdhT
         1803+BEw95TQejv5OQWVDRn9HD1bdiWuqNCPlMjk4FzYPEYv84BYz5X3626t2e0D+vJB
         HQHUO3Q+ndQFKMoWvQ3LJ1XNdKo+UPzGgJdWRM6YUNvb5/jQoyQlAYxr/g7Z/ap2fP1D
         Fkyw2NElJtQnMQZd74rB/3vBCq7oWoqPDvznx3NUWUDyw3PK+vWelv0B8aajreLkuvtN
         F2dw==
X-Forwarded-Encrypted: i=1; AJvYcCVZJQ9QbON89dtN2gKw9hsOKdYrv7AGWjHTveAMDRviUWL1d8tWn86NOU9ehE2tUxddxYkalocRVFbnpyeLsIo=@lists.infradead.org, AJvYcCWQql7eES+MMFNftcE1/Jac8j871au2yvBA52ctpa8NSJyDEpj3AKc8iER7C6wAzYWvKNySU4t4WwT+ht0/zZyt@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd6cfjIbzuZlxH7kf0qa9QpF4WsZROYW27CNFI6GKgMJj5enbG
	HJS8p4iQUbflj6sngCb+ngYjJCDixVbnsYVZnMCpG2lSw4bXOLyW6AOa
X-Gm-Gg: ASbGnctjvwl0DFjp8GkLw39KTlufCggSB55tb18Qi+BeCKEH4Njc9I5AU0rot01taoW
	cxMhK8GHDi5Az0ZgYX0gqqt9Oc4+psQpCQbtQf8VBiLnCgRAD7DVJbZg6G3ef6v+crvWnR+88bR
	s7pRyrj6QRMSYAoZL5lXqtsFrTLnvr+ZsFBSbCgfvQskOYB/hrIA6+zhrd8L+o4aXG6ZDoPJP3/
	VWeagwKrvPWtDJnKFOWOIGYakZimdlP8xbk2JZwPRd2Z9e8PrIK7bY3CKzFgJn6K9aoQXAeCDU8
	7jpfECIfFaMeVLEwGw055mA/NzwuEVJorXJ6CPW9TbPyMqRKnqbXv1zWwO+Ok9k=
X-Google-Smtp-Source: AGHT+IEjVGD+KJUzfAVDNX3aei6Ghs7s/wzZPF1MSYk1HD/3RtP42wverW+f60i4kYRC6qGzqu1QSA==
X-Received: by 2002:a05:622a:4c05:b0:48a:de9c:8c0e with SMTP id d75a77b69052e-494ae3d8194mr23972861cf.24.1747355246704;
        Thu, 15 May 2025 17:27:26 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3cef1fsm4563991cf.9.2025.05.15.17.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 17:27:26 -0700 (PDT)
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
	John Clark <inindev@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add luckfox prefix
Date: Thu, 15 May 2025 20:27:11 -0400
Message-Id: <20250516002713.145026-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250516002713.145026-1-inindev@gmail.com>
References: <20250516002713.145026-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_172728_022074_56DAD2B1 
X-CRM114-Status: UNSURE (   9.09  )
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

Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
produces development boards like the Luckfox Omni3576.

Signed-off-by: John Clark <inindev@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..4fc73fbd592b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -884,6 +884,8 @@ patternProperties:
     description: Nanjing Loongmasses Ltd.
   "^lsi,.*":
     description: LSI Corp. (LSI Logic)
+  "^luckfox,.*":
+    description: Shenzhen Luckfox Technology Co., Ltd.
   "^lunzn,.*":
     description: Shenzhen Lunzn Technology Co., Ltd.
   "^luxul,.*":
-- 
2.39.5


