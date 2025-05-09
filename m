Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7731BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le5KQCvWqOEE8uCC3fpbzR33yLLuBj9VjVM/PROhn9Q=; b=U0xUT+mfzMov9rwFyg6X9qs0G/
	ZJf/iUglsEgt8Og2m06om/0R644OaHu5jFBEVCrNjV9M3ZDcmF2YKrZuPdsJZUmsMr25ozVRcZUDB
	DwyONuTSlS8x00XzgRsAt06RzQkaaKXV04LQH5PMDprB0v/IAbLP0Nqfo+nWCcFniGGiL4uWyT186
	dSDxUhqB9w7UiVNa7zgtBwwq8V+t671hHtUad13Epf7+HAcmejjS1Ita+p8k9gaSciXPyCRdFm6BP
	yVAe4+Z4HAaxi2Uxzo4J0UeyNLJl3x8uI66Nn8Auyz8d8iUyyL4FoF2Cj0NRxqJcbyNqiMtbrD2Fw
	vjQtzEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNdc-00000003jZa-0jRn;
	Fri, 09 May 2025 13:19:40 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMoZ-00000003aN7-2Bzf;
	Fri, 09 May 2025 12:26:56 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7c9376c4dbaso234562685a.0;
        Fri, 09 May 2025 05:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746793614; x=1747398414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le5KQCvWqOEE8uCC3fpbzR33yLLuBj9VjVM/PROhn9Q=;
        b=eSOv773d0Y649NYDBV8PBharBQJQ79xAcEE4rUYQaCOzhqG5kkWgKnY5as5NAE8ID9
         cqMZiUcyH3BxCL6r5PD8ottoOqA2w5nlCQ84Iz/iRTNjoWu6FQ3fcfN3WVr3z7HVx5rO
         QUODhsegYtwkfNs3B8aBJ2N56pO7aCzvklv/suUR27Gfhg1gJsz7NroMzyDgxlyEtIzp
         /C6fgl+B+OpSmjo/Ji/J5Bv5U4wBOrVQ6dKKLt/EAcoN4rhkeGwfrqGNpVi/tPM4OXBK
         QhU31LNIobBzqtYTf0f4HOqbsLnvLWicyFaiMDX7uI4XEsH08FUbtVWBKl8YYH2GyzHK
         ZIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793614; x=1747398414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=le5KQCvWqOEE8uCC3fpbzR33yLLuBj9VjVM/PROhn9Q=;
        b=Y8655jzPalWnSJRqCVN9Yl3aTiqgnirYBHGeI5NAczjPf6eroia9diRlv0tx0dZcq/
         9gFFJgvDgbG/d2zGMGgqoS27pEtKHTYbbaZY3S598bqpDQQnbeyZIEnk/NAOLqb81Qoq
         OIrVXrlaGS3lU7lYrV08tUUDVq8SPH6d3G5PUP23azKbnJgMX5+jDZux3Ki+1a6QLXUr
         JNQ3FFiVky9+LI3PkPKa2l9x8mxeNsIItOKH5vvmpR+px44OWZ+cMQfxTBI9vJc6R7To
         mwAQcq62N1S0yJTqgSg2ZpqgruZwSuoeQM3JaHsnczuWNCTXKgoE1BTY4iMb14O4idJq
         WZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCX43z8mci+pfsmeOPYpEtGw4nX+0GQ6XVv+XJVZ3YxPzn6tRpwcmmwnGqLs1HzjnqpLFAHBguE5JXBYk1R7V/1f@lists.infradead.org, AJvYcCXSaiSaEMQhL0avHVVNRWaOXDWluDWhJ3387zyhmAGqHaAkrAc3usuIKIfsAE0twtKTsUV2+vsJEv4XwQlTtOY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLihCrNQLh1HdcVy0hCGMfS3+nKrU3qwGNSOiznYs/lORZ+Xo/
	CQk+LXuCfhcRU1x5TekNSLhuyjC4xqBnJbollv9A8DGjEyEnbSu9
X-Gm-Gg: ASbGnctH5uWQW1K05fufk/s6jQokb2LbSnEJGkyAfD+AvM+5qDj55yUTRrF7BQMINIM
	7DD/rjS6bBZmQXvzgmwGPzn1JgKWAwNUJciCdCqEBPiOrQmgRKqABrn2u3tUQJqclVzA+bj9bWU
	c2S69RrRUdPKdlye0tPNmqIVSjZOO/xCcwG5hmigNEWp4Uqf0vqs5Pzt74Q4aNyK7Pw0JToNFNI
	a16DdfgLY5Q03cSDXl6A8iC+dO9avvEKrR9RsOdN11sXo730jiBVq5FG3wvFl7c3xeia0+m+niU
	KrJMaGInpPZ7RJDb9VSJcY/H9fliYsoU/pGO3vNDTGhuVuU/tXkw
X-Google-Smtp-Source: AGHT+IFmUN1sOyjiXVtW6fvf+qtt5Z/s83L1cfg+MbzsT46u6LjOO/rPg694Jihyms/1VYwtTVnq7w==
X-Received: by 2002:a05:620a:c55:b0:7c5:d71c:6a47 with SMTP id af79cd13be357-7cd0177177bmr410380485a.8.1746793614322;
        Fri, 09 May 2025 05:26:54 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f4e19asm131843485a.4.2025.05.09.05.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 05:26:54 -0700 (PDT)
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
Subject: [PATCH RESEND v4 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
Date: Fri,  9 May 2025 08:26:36 -0400
Message-Id: <20250509122637.26674-3-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250509122637.26674-1-inindev@gmail.com>
References: <20250509122637.26674-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_052655_554847_6D7CEEF9 
X-CRM114-Status: UNSURE (   9.46  )
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

This patch adds device tree binding support for Luckfox Core3576 Module
based boards, specifically the Luckfox Omni3576, with compatibility for the
Rockchip RK3576 SoC.

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b77..92f494bae3bf 100644
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


