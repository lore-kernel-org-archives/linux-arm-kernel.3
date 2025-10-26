Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD4FCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 10:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IZq/s0DjJJahu5RTJBwLJxq2XEK/C2uaMOs7qh3NCts=; b=2OyD4s/KbpbrN2/r4d+A1aEb+o
	ouMaIC/h3nbXwRY4Ymk/dSvRQSk81QG0sqLkVo4bfae5nPaHWIvywJ/nn8shk+TNadMi0+vCtZaSq
	JZwwoFRvNZivDILvfzpfPdhAjqMKIrnL8i563WMVCWoQTITJ46U3keLAZ1BrE7J9LUXnrmnxYtze3
	Yb3iawOK9uK3qjqaYUgXpIHjRQqUAgmwhjoEsPFHkd7UXrueOa4ckzDtmBZ0NoE9ZzzVBYO0ikDLc
	vagyZ12+uar80Kc66Tdpr6Ktwcx9Ih4lB7ddHXYU1B0V3N21cKali7lreT2YJWaM9t/1UVhtuxEHu
	p3b9kNUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCxos-0000000CF8P-1roA;
	Sun, 26 Oct 2025 10:17:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCxoq-0000000CF7h-2Z5A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 10:17:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4271234b49cso572947f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 03:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761473867; x=1762078667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IZq/s0DjJJahu5RTJBwLJxq2XEK/C2uaMOs7qh3NCts=;
        b=V6k1NO4vTXI+dDHWyQbeFN52sZDoZ7/Y3wBzxiceqTI38lSVN2aDoIEI7E/JVqL9C3
         H+2PrE50gYIXUazCOqbhb8G88Nn8mN/UIfHiYwcj7LoubBnstHeabReTiaXc8ZDYsPP+
         dGQwkwHBXIGDAdhdPpBH8qgq86Me6rDdUh5UyRrF5R5b/wpEXzewPX1mtBu5LF5f44Ii
         Cc0J2FQe3MetkY5LJjPT5g/2KK0v90hfqfv/KNq3H2yyXpC2gg5JEL4viV843b51LYNc
         CR98uTqZ0rb+nZ//Z3WZOpZX6pGNWeP450kchAyH0lXNAf2blpesjXwDvoFv5UbGO3DT
         Jr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761473867; x=1762078667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZq/s0DjJJahu5RTJBwLJxq2XEK/C2uaMOs7qh3NCts=;
        b=qw6SsMzfcehZiJSGitm/q9KSVvMjbTa0kJtj6H4g+DOMmLHiwX7mYf4uIc4LRSuaXy
         jIjS6rytkMh0LQQPZncDr+GR95WXFT/A84W4giIoswmzG4yqurYv2MDloiGanfXXU4/2
         YXmkLQzHJ+K0AHy/yeSmBwU3nyCAlCIAESQ5NPXHCblpGB36EolX3S60mYXn9giAplPC
         i1autqkLiR4Mo9avScJitt75RKWjDIfNOgtej8VsNQiyYSe8wPvgEeATd2MOa0v4wMdc
         VE+4ERGKayjrCFJL2hVRkzGmSo4Fa/nsA5IUSkDLrFEph9NgsbVl4opPhB1KJOMZvnIE
         T8qw==
X-Forwarded-Encrypted: i=1; AJvYcCWPQVRRbbD6WcMZkMSL+G6NEUo9ag+VsuejB/GP5YG1Fcvm0DzTmXzJBQlbEIXsAigMslbuzJuZARQzcctqriuo@lists.infradead.org
X-Gm-Message-State: AOJu0YxFLWJFRVCvpgvXqpCZIaYZBXKSqq1O7jBvEqmPGb3yTIfZBSPY
	XWhx0hdx2sytDvE1WgV2shXnB0aroXSU5T62eb/4KcziEZr+RgjbVvYwVkc9qoF2RTw=
X-Gm-Gg: ASbGnctmk4iZezTG6oUD45Iw/HYimGiejEr0D9c13XY3pq2rxRASKf1/HUNUnPW9SKz
	7BvycRXQvfLtXMyLPINTmJfFAW8PS6kJAhw+O3+0kzztwb5ZiKCi2ENjNBhpvYrknn2iqy8vDJ6
	HN25iYhQkgSHhoH9xt2++21vn9OxvjbzbyeZqhZJpR//NMXtQ6papU3zo38VTeWZnAn3/Eu7knU
	aqSL0Vh1l5V+mOpDI79GL/golzvsUbhiFldjJ5DfZnz+h/bf8HWsFMoHYhqONFOHL5hp7MbgmvU
	veoxn17Bmx1zjk0e47Gi5j8YkSfdy4wMpHj06mxZgCMhPzGFmzCqy949jKGIYXbak+BF1Qh2f+p
	3pDF/7B2HYIPYGlTiX94bolPY3dEV3CGOSbpJld4D2iDF75ijqUWWpKtXCby5sEfnsufLmi+scw
	rEQ0qbAh32OjY=
X-Google-Smtp-Source: AGHT+IFLV+eNu2OSqeI3IjKQUumE2rjQrLB05yL6GBy5AvpUTXb5dLnZv8q1GKaxjIshEGpVcuT/KQ==
X-Received: by 2002:a05:6000:220b:b0:429:8d46:fc5e with SMTP id ffacd0b85a97d-4298d46fdffmr4538761f8f.4.1761473866761;
        Sun, 26 Oct 2025 03:17:46 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9d1sm7966166f8f.35.2025.10.26.03.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 03:17:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net v2] dt-bindings: net: sparx5: Narrow properly LAN969x register space windows
Date: Sun, 26 Oct 2025 11:17:42 +0100
Message-ID: <20251026101741.20507-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_031748_663590_AC0A6A49 
X-CRM114-Status: GOOD (  11.43  )
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

Commit 267bca002c50 ("dt-bindings: net: sparx5: correct LAN969x register
space windows") said that LAN969x has exactly two address spaces ("reg"
property) but implemented it as 2 or more.  Narrow the constraint to
properly express that only two items are allowed, which also matches
Linux driver.

Fixes: 267bca002c50 ("dt-bindings: net: sparx5: correct LAN969x register space windows")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

No in-kernel DTS using it.

Changes in v2:
1. Fix typo in commit msg.
---
 .../devicetree/bindings/net/microchip,sparx5-switch.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index 5caa3779660d..5491d0775ede 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -180,9 +180,9 @@ allOf:
     then:
       properties:
         reg:
-          minItems: 2
+          maxItems: 2
         reg-names:
-          minItems: 2
+          maxItems: 2
     else:
       properties:
         reg:
-- 
2.48.1


