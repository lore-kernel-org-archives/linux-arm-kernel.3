Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3140AFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 10:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jq25Q/IJKGa0yoxmppRs1ynNyRwAjtJo3EKr+Ili/4w=; b=NToorKIEZXaJ2F+Be5wiENgbcR
	+G3/Ynb06HBmpz5hL5KtHGJObR7yXutiCTy+ncrKqFOsCOUOfNlFr8EuM1KvWV1CBAA4Av4Z2xp9x
	1CJE82B/pZlb4VQECatcLzDTWifXXBu4hYZ23AtKB2+xzEcZTw4g4x1kqp8Mf4wkDowdHsxwthY4P
	n2uKNLGXCKO7A4Tfv0+G/FarQbqzfKuXGeDdAVDfABU+UWm1GSMSqxRh50IMLIgTsfPUaM2YaLpQw
	pyz98gKGBQx9ItMdEEGr6/Dnz9V06CTJdaX/Hf+rX3DfagdSrvM7CC0iTgKxqveieeM7UkMcys4PY
	8O9sx8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwXE-0000000FRFH-36SR;
	Sun, 26 Apr 2026 10:16:20 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwXB-0000000FRDr-0nWm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 10:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jq25Q/IJKGa0yoxmppRs1ynNyRwAjtJo3EKr+Ili/4w=; b=k1ZvvGfXleAA2QDQoAxLzZuCQY
	GHqBUj6dvBfNg7w7V/jfiRgW7PXgVyC6fq1ZIzeNkeAW03LoYBLHCpFI8uqWyeAO9pib6ijylOGrU
	W/EWsUFNihn/6DSCNgEGThObjfz6hpAUh/0hNoxlAY3JS6d1Njv2aL9nBxbO4qd0t+djrvWc9Ci1e
	X22k7LSnwWw0v8M3FCYbIHsixefAgkAx7Nms9aQmt1aQRmf3SeHyRRqwLYmwIGFWOnSinFoKbhudH
	xNbxZdWagtdD4KrKJFpi4cV0Pfo6UbQWGuCoLjLu6dWSCdTrxCrCuZTj71i8sN50EXs4aGcoElel0
	d1FoNp+w==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wGwX7-0000000CBIP-2XYL;
	Sun, 26 Apr 2026 12:16:13 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 26 Apr 2026 12:15:26 +0200
Subject: [PATCH v2 1/4] dt-bindings: timer: allwinner,sun5i-a13-hstimer:
 add H616 and D1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-h616-t113s-hstimer-v2-1-e65e9dc0c9da@mmpsystems.pl>
References: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
In-Reply-To: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777198529; l=1582;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=OVN+6fknNDBag7Gi2EVxMIXAe9MWOflXV4ObvO/Z4zQ=;
 b=2AFNTsFrYikoipywaS+A83NFcT8hrsWEp7X/Fi54c/FfQbutDX+37Jluhw6RnYpDyBBs7P0Ry
 Uj6jALUaABHCKBpd8kTYW8HuFRBDhkjh9U4118BI2X/kmqImLLVl8rM
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_031617_732464_FD2F211D 
X-CRM114-Status: UNSURE (   8.93  )
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

D1 is similar to existing sun5i, but with different register offsets.
H616 uses same offsets as D1.

Add allwinner,sun20i-d1-hstimer
Add allwinner,sun50i-h616-hstimer with fallback to
allwinner,sun20i-d1-hstimer
Extend schema condition for interrupts to cover D1 compatible variant.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 .../devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml   | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
index f1853daec2f9..3e2725c56995 100644
--- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
+++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
@@ -15,9 +15,13 @@ properties:
     oneOf:
       - const: allwinner,sun5i-a13-hstimer
       - const: allwinner,sun7i-a20-hstimer
+      - const: allwinner,sun20i-d1-hstimer
       - items:
           - const: allwinner,sun6i-a31-hstimer
           - const: allwinner,sun7i-a20-hstimer
+      - items:
+          - const: allwinner,sun50i-h616-hstimer
+          - const: allwinner,sun20i-d1-hstimer
 
   reg:
     maxItems: 1
@@ -45,7 +49,10 @@ required:
 if:
   properties:
     compatible:
-      const: allwinner,sun5i-a13-hstimer
+      anyOf:
+        - const: allwinner,sun5i-a13-hstimer
+        - contains:
+            const: allwinner,sun20i-d1-hstimer
 
 then:
   properties:

-- 
2.43.0


