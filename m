Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42A7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 10:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=; b=biN9JrcEe4ml1vrm+L0zKo14QS
	zyQULYPXWIVavuhnqpl29BLhSdBJSKj9zoCfZw+oOCiG76A9HYzQQYCg34zTvbXe0ArRRUvzPyIfg
	33cZlIQwguGe3HKMs+xyO9dbV1+pBR9U+ymQKcah46nB31FOuizt0N2RBS54yCsvv2EYuGAm+r7iX
	bxdYjX+11xa0u1ejYb/V+nVOVFWFWmjMYJfreQ3L/+yoPfQ+2LH5GBKr9/9svYbiqNxD657EgzPDz
	ENQyXhA0NY2TSwk3dQRR+cFhw7Fwcx9ffWYJXqI62241Gxb3+mCV3V21jTb5WaNxH5/7NHXEqhDLU
	Kq3vMwig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUO6b-0000000GhBA-4BKS;
	Sun, 05 Jan 2025 10:43:38 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUO3d-0000000GgiH-408q;
	Sun, 05 Jan 2025 10:40:34 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-300392cc4caso153527131fa.3;
        Sun, 05 Jan 2025 02:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736073632; x=1736678432; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=;
        b=fRdC5cD1RGiPWEnAAggaPybsZf3aR2PjI6OsXVnlN5GbHhCQ42G5DQ3Jwloo3OOuW4
         fVZFsiNbf2ZYBdTdwxWEPZbb5LIbVMbKEeJBY7wzCPDeRoYb8x/GmS0G1oLYl9beDFDB
         pgnTHovUer693rwsc3CKwLw4XbQ0e8kigIa+b8dumIiNqZQgd8d1BRi5JjXhslJ7hhyn
         pxlYdV+YC35WYrh6OAZJE1Ed2P9h6lNjH07UjJaXID1uUDVyMt1gKrxdQP0dwvvzSndX
         zO7SRJ+ZSip4pl2+t6Eur0P/N2sRNGjxs0gAAwPlogF84zADQf2RAIK6BYwSarhWckD4
         Nn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736073632; x=1736678432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=;
        b=nGJiShEeWG1+pa5pO8jjJXAdEYvBT6ypI8BIz8MOSmK7I1aRpTA5lNQNXyYbtiynBp
         jABCXbRMhJt+k7Nffkp/IQB++2lSWzjpNjnDMu2H+BAEujp23kBD5fgDZ5sHu/JbDWIJ
         25Xxn5NKVaWFySXaFpQ84NBBpwyO/829vE9gK2uZCd0RPVulTPaGWLw6lbaexX8Cj8Dm
         877az36ESSHwG3OfZrxhb2eW5tdPWiMzvfdE39In1iJwU7NeTAvLB3hxzRdOLZ8dWasG
         zIQdnzl/qRQuGNFQrP9z0dRyOaxjiXzuCaLzVA1IoLb+KlbN86gxUQFAoagDN420UO8e
         g1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYOJrJ11MHpotFVZbD4T0CH4buFnncpTMlQzgYzI8/A0FwiVHgPVMljZkUbGXR3hDcO0nPq4j+fX4Dm7zK9Jve@lists.infradead.org, AJvYcCWZqZrSdLe942/3KWHUjTZMQi1/85/aBt84EnCRjQG56wmxr/RooJMpiEpf7Xmay2qn/4NP9UNoyuQuP/tNli0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGncyzvbXo+5OI/D9qlbYMawPUJat6gyskBJ3gNHkOzfKoLWCK
	O52mAYEbK1/IUhWIUxyypM3nlLNqAfBcbJ5ryhzYopl7GO3LqWg=
X-Gm-Gg: ASbGncvmGlHw/4cx4RO0O8mpmmXMQge92Wqji/NZbERxlLUiMbH3Hvjy6OVQjBKqME7
	eIgnHH8On3KotPiYiuu0FgnBz2WMNrniBNVaoS8D01OFmfoXWOTU4q15M7Ofopr7mm5/LRnHsfb
	0S7FkFJMgvlLQqKTvVmqm8ho98BHEFSqMgbFXdnKiC45ZFD94Gjc9WenZPen+cvs5PM/Thef5Ct
	wGDZq5VCejXGj7yVb8UqM/kG8M1dXEdUascBmMM+XTW7HpV0/3aPPtLsOA=
X-Google-Smtp-Source: AGHT+IE0caNAMxPYJCF7Zz+XrUoBE8azb25sS9Q+9Ccb+I7OrmJowXuuqHIKpehjzy8O90b0xI9yOg==
X-Received: by 2002:a2e:a9aa:0:b0:300:33b1:f0d7 with SMTP id 38308e7fff4ca-3046850333amr166975921fa.5.1736073631870;
        Sun, 05 Jan 2025 02:40:31 -0800 (PST)
Received: from JetTurbine.homenetwork ([2a0e:e6c0:20d3:2100::1d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082e01sm52248861fa.98.2025.01.05.02.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 02:40:31 -0800 (PST)
From: Ivan Sergeev <ivan8215145640@gmail.com>
Date: Sun, 05 Jan 2025 13:40:30 +0300
Subject: [PATCH v6 1/2] dt-bindings: arm: rockchip: Add BigTreeTech CB2 and
 Pi2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250105-bigtreetech-cb2-v6-1-ee7bc9c4df46@gmail.com>
References: <20250105-bigtreetech-cb2-v6-0-ee7bc9c4df46@gmail.com>
In-Reply-To: <20250105-bigtreetech-cb2-v6-0-ee7bc9c4df46@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivan Sergeev <ivan8215145640@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=ivan8215145640@gmail.com; h=from:subject:message-id;
 bh=p5DkTJDu5QlNVWl35gjaVUthknkZBv6iZeP84hntyqE=;
 b=owEBbQKS/ZANAwAIAbzfXRlQM5b9AcsmYgBnemGeEXmJPNXBb+jHGA/0OjqOFMlyrlvkswP4T
 BnkjyUXVvyJAjMEAAEIAB0WIQROCZtApKFz1fvvsOS8310ZUDOW/QUCZ3phngAKCRC8310ZUDOW
 /UNyD/9qYntOtE4VksPm3dys85cARBjDzkBIQ5ujW2v6+YwxoJ0XHj286liqdYlnPy4mZQkYo7+
 n6qreRrv8uPseAeKBjK3acVHnhM7wmkvTbFm/XG8MRNK6BNXLLmNq74H31XFQk+nloSVQGDYzJp
 tfRCsnbZdVJY+wUQaf69Hv8xTpvYj1nv/RY2MA3zeZLKDJLod6jmxGdajikgjgfHL4tW1F9pekI
 FbQfrS+sxzg8XYWABZj6zLEWDkU/SJPxt8hezhJg5xgMozb+rk6IADnhiW7hyz1l0Af99AAaUTa
 HNPEWfFSo3LsPBFJjzvr4234Kqpcw5x4FfMWS505iFK/iw/qjxx+9PUiAwSz+p0HLsmsa1HRrP0
 x0QFLnK2Ix81dPc5IcT0SgcyrnA4MGincwW0HvHZ23pErv+PpUpGFRVBcTCz+c/p+qEspPk8lPP
 w7VK9Omho+dlH9jiCKmFVNxlIOQDwljRLEjFsPzhA2Rw3eA9Pf5YQK+DEr7bxm/zmDAm5Ro0/d8
 xdvpGIVAc96OUEMcPD1g33OGZS6MSDDlibxPO9F879bY95N/1Mskyrem5ziiHu1uVsdXtdkCJ/v
 73UTY5Dz2mMbqKM65+VgLrQa7743vd6dGB6JgjyTqx1XLFo+aHRB4ngDeHg87wCQieM/nGW3PTN
 AGHyEWNPJP7CG7Q==
X-Developer-Key: i=ivan8215145640@gmail.com; a=openpgp;
 fpr=4E099B40A4A173D5FBEFB0E4BCDF5D19503396FD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_024033_988748_F35C9C9F 
X-CRM114-Status: UNSURE (   7.85  )
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

BigTreeTech CB2 and Pi2 are Rockchip RK3566 based boards

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ivan Sergeev <ivan8215145640@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923fadaa48c407a8e55e7854db7203e..349453b1676bfac45abf5cd49d6bd9f847281213 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -81,6 +81,17 @@ properties:
           - const: azw,beelink-a1
           - const: rockchip,rk3328
 
+      - description: BigTreeTech CB2 Manta M4/8P
+        items:
+          - const: bigtreetech,cb2-manta
+          - const: bigtreetech,cb2
+          - const: rockchip,rk3566
+
+      - description: BigTreeTech Pi 2
+        items:
+          - const: bigtreetech,pi2
+          - const: rockchip,rk3566
+
       - description: bq Curie 2 tablet
         items:
           - const: mundoreader,bq-curie2

-- 
2.45.2


