Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E209EC55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMXBx6JiVxExqi9nyxpGvBkZnmNfKmRnM7bi6imU1IA=; b=TUHHzthseYZuW09RGad11TpgPa
	O/iHxSzdzULPKZb4ogz9/gp14N6W/MJhw+DK64gLJEfymJ4pZRFFLQLw4OtSNEUQql4bm7FWPpjxC
	YMKCDsgL96SZhEjTgRiZRFkymE5YEIdwJvA9FEr3AcDV03yZTkzF/YAoiKjlNfd9FO2z/ENfNFRq+
	tSLkkhXQFCNQtxxaDMZdxAIO9b/3Cqar/vdfgAvN5s81Pgf0R5U6lnkwPjqyUqBYqDnENkBBv0n5t
	iy6638XnyFHhOVMdUx5yCNhkC0PTpZKKLI65+UI1RwuSS784cji+uDLQzG0l1tjv2V+NDaMTBWQhX
	SFKh23dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEyA-00000001teQ-40ce;
	Tue, 04 Aug 2026 13:14:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEy8-00000001tcY-3U9y;
	Tue, 04 Aug 2026 13:14:10 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMXBx6JiVxExqi9nyxpGvBkZnmNfKmRnM7bi6imU1IA=;
	b=1+DPPkTgN63DpQwSgnY9hrTeHhZD0P4DbHBv5T9BQaUpL4Q+GO4i8b5uyG9iiyAQiMmI37
	PVWGWir8MZsbPbDoUMXiD9ut0tmxgQ/UEEMFEMx8xvLHGM+Y7BmO3RaCdB9bvUzXxz+lmo
	EiihaxrddoEyK4dXGZ5oK1RbfQdGgkztWyB1gB1XCLAsoa8EzkCbrt4NjrghpK/i/GHcXR
	h18KSNnDy1E3AdRraa7joigyd48UgF1p2+q3lc/yytz2gPSyBBsgYpSQnAeC37TNtJgf3o
	YtcBt7oijP1AfJHyDoqHHKezXisv2MvfIDFiPaBrpOc4PLrWqgNg/CH/qQRRRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMXBx6JiVxExqi9nyxpGvBkZnmNfKmRnM7bi6imU1IA=;
	b=/NhH7eej9OJkM9cQ1wrFVl/WnOlf7wUIew0TM+tuv73zzXQIDXENNCK04gA8+Xg0Cz7BTK
	o/+gbgZUXp8WRCBw==
Date: Tue, 04 Aug 2026 15:13:48 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0
 Stepping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-bcm2712-d-stepping-compatible-v3-1-1860094486eb@linutronix.de>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
In-Reply-To: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785849242; l=762;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=/MKWKONQK9pvBmbMb+jL2ulg4+Hsp+n+1Tof1+X5ess=;
 b=hYfhb/epw5l1XpP1ikvPBir7/LQlcjvLdkGiGpsbrTRqo1i7+jezcSOYxuaBa/xjFYMgqgUda
 kb8SbdhoHVMA/9daln+zsow/fKPFFgxbqhUdaVKBTPeyo8emnNc5fhp
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_061409_090016_5F965AE4 
X-CRM114-Status: UNSURE (   7.31  )
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

Add the Raspberry Pi 5 d0 Stepping to the schema.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 2729a542c4f35..e2b32905c6a8f 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -26,6 +26,7 @@ properties:
       - description: BCM2712 based Boards
         items:
           - enum:
+              - raspberrypi,5-model-b-d0
               - raspberrypi,5-model-b
           - const: brcm,bcm2712
 

-- 
2.47.3


