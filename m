Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05060C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTebZHS4gk5PFvDqlcXeMybwJIw7UkV3r+TMXWTUvHQ=; b=UrfdbuCBfrGhmnrAb3DgJf3qGq
	iExHFeq80nNhCgMb6cGqWt80OlG0GYzPyhYErjXBMbxlIvfIIHAWHACCWCdFdKGoLJdgNHEhOPI1z
	ANSdVctzsnyJD+mspsTlJ1Jri05087aZ3x6MaRrwoZdiBUNn2t64iVkZ5mvVtHZQYCRoYzCBcoCqV
	4T68cFxAPB0sst60scpy1JIlLQm8/oxPyS1kSijO/osYvZ5vkx2MCgbixWs9VnDEsBcQMXoBodStI
	ym81xRJwuS/icaXFC/zF8TmAscA6h4T5hbf5Tex7kWc4yMCswvjHKOAcrkD8BZwhQO2EVQztq+xrH
	w2RlCeNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thc2o-00000001cBQ-1vxg;
	Mon, 10 Feb 2025 22:14:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbyg-00000001bKi-090L;
	Mon, 10 Feb 2025 22:10:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-436345cc17bso33927125e9.0;
        Mon, 10 Feb 2025 14:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225404; x=1739830204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTebZHS4gk5PFvDqlcXeMybwJIw7UkV3r+TMXWTUvHQ=;
        b=AEA4DW1LeNkSM9Qi4AAqF8h4psDFrwSAGVXMxJ3uCdS0lUlN2Br5fAiZjC3ekAfEDZ
         8nLjzZZuuMdObW833iYy2iaW15PZfxWC4c8eQbJeLPluFARYkYDZTl4SoZMs0W3QqwVv
         Mee4Q7+VUEURqoWx65zOrkUYeMTfP95uCvzaIfW5gFUISYTUQff0gB/TinsEySZdYy+6
         TShjauvGWS7WNuhhYpTXtJQJgzM20FF0UOdlglJaxGK25fKgqQaXl4CNTtsKNR/WVl5f
         CgGxTqb4LnmUviMGOsbzHngmsUUr9F5ZFMJSESoR4QCeHiYqsg72cK4EiKF0j612XiCd
         q9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225404; x=1739830204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTebZHS4gk5PFvDqlcXeMybwJIw7UkV3r+TMXWTUvHQ=;
        b=HZEmZbvHlVO/sN/BV4zN8Wj5R/KlVdVv1xk0HqmQqqAAJZHXLNdPGB/g8O1vPnShep
         NOrCrTlKCcD2CvVBrQSJwzhcfLUOelgXPWT82jWckkL1+EsUlg38ZVysw87Usg7UvYp1
         3DcaW9Y8SNkOBOT+HCoJ8gjDc1nERVQN+qcOA4OFsebx0B+YjX5JqePlK16qT3W9Ps2p
         Wa5XOqImlROZlJSOWx7g8UJJrM9SIVhwUz4n2Rm23wykSqN85JE/b+jkQC0uOxF6SK2T
         s1UQb3P5Sf+WUS0N9SxEZuvw1e/ZWMwA4whF4ab95YOtKXVS3dF+JozFTztTucATzLUw
         AxHA==
X-Forwarded-Encrypted: i=1; AJvYcCUQOK1cOAiNpAhy5ykiqdcsF7GXAND5Fbd30Y1Yt/BRcdDLtnJm5pnyGDAjyLaUHMe6umgoFxIZgzS4Lii1V623@lists.infradead.org, AJvYcCUTfSHbKnLGEWmCSYHzMe8BHJj03I28aWs0SAjxNa0CUUXLqAN8fNkigBE6FMDnkAiz+weH5TobSpzd+v0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0LlVwHIcSCw0RYf9+UtNZ4he8K+DPZ6lShpqaSE6XTnw8IzUq
	tqUz9kU1bCkb3q3Dl8wmlhU2hy11ynM67DLpDQv5xNKAq+HbjgeY
X-Gm-Gg: ASbGncsPleLi9UXcF7SkQOismHSDzgZdlAheaOs2GfT1tDtE0YdbEsarfvhJn8JzR2T
	XefB+LmgRl+MvIpk1gawwfJnLp1RJ6jEEMyuxN7vOeWBrT5+1b3yugBuPT1IDGgBqQxbsg1u8Fp
	hBBPMDV1yhY85rR+C2TZQfR+2wDe/GiHYn+VET4rEHGExaOzNZVwcZY+w/Ce/WazKPSqJZ+ol7S
	pZKUU+IqJrwtAy6atYobF+aW23uH3GrmpmSpcufHJ/y4kKJzXBFR2R2A1lOY9c8BV6uUu1InxPB
	sMIz9hBe0ldMeIJs9VqZP+ly4hHz
X-Google-Smtp-Source: AGHT+IFDQWvsMaFRnPlrYGf48iq281hise14mQ/LTGh9TT2T0tV9t8mYcQ5+AwVJvhksx+xbz2dF6Q==
X-Received: by 2002:a5d:5f91:0:b0:38d:df05:4d9 with SMTP id ffacd0b85a97d-38de41bdfb5mr1082207f8f.43.1739225404338;
        Mon, 10 Feb 2025 14:10:04 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:04 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sre@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 2/7] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Mon, 10 Feb 2025 23:09:42 +0100
Message-ID: <20250210220951.1248533-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_141006_071421_B366D04A 
X-CRM114-Status: UNSURE (   8.87  )
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

Move sophgo.yaml from riscv into soc/sophgo so that it can be shared for
all SoCs containing ARM cores as well. This already applies to SG2002.

Add SG2000 SoC, Milk-V Duo Module 01 and Milk-V Module 01 EVB.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
similarity index 80%
rename from Documentation/devicetree/bindings/riscv/sophgo.yaml
rename to Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index a14cb10ff3f0..5d73d0ccc547 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sophgo SoC-based boards
@@ -26,6 +26,11 @@ properties:
           - enum:
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
+      - items:
+          - enum:
+              - milkv,duo-module-01-evb
+          - const: milkv,duo-module-01
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.48.1


