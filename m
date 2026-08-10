Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F622C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycaA4zP669aUiie8zKyoviwsLCosDdRQ+6HaaafWNQs=; b=EpycVpmqDRFbeRJc2PHZPCzIAu
	wNgSFslJEQXRbKOGwvxzi/MlxBQO8NuOHHt9gN/XbI2W/CBZaOXwg1RmKGWHCXipHissOKN5oD/KQ
	iXrBEsQALSUCHxy7LKvjOjJLa+yZtxhuwbV+2+KE0iFMkztlr/iGlR8fg96qDU9ILcz5K2GPQpFtG
	pJ+Rslfy5WeJ4eSmSyCVkhqc+XfxBVJj2uZIRt+gmOvTuNdiZmLm8fSOtWRYB92oPowQaZ0lInR1y
	xUKDhPw7QDqhgJ4cuGXs8jhl28p5/QOGoNCGkInFhyNoytN/4FksbxDXj1ImbihEr5B5qsid3TPSj
	UWmv7YXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOw5-0000000BkJz-3DdL;
	Mon, 10 Aug 2026 12:16:57 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvn-0000000Bjgm-0S1c;
	Mon, 10 Aug 2026 12:16:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4944C0519;
	Mon, 10 Aug 2026 15:16:34 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364196; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ycaA4zP669aUiie8zKyoviwsLCosDdRQ+6HaaafWNQs=;
	b=QoQQGobmRzM3gxEeKdVkx2BgbCm09kZqHISI75T8RbTj4qaJ3BY6BF5BZKwsEg36M9na7D
	SvTi9kaRdRhu5km1rWvfGMezx7UOeENFCSxyiox/L+6HkzGKtkviPS+fDRwJvlplMQhrbW
	2H280posq3dZNoh2sl3a+zgh+rMsGQI0bgQPpSexjjKgiW1Lzc903n+j0IqcSewXKoN8Ld
	lHVl3XqwzS1oYW2oUjXjyohuZlxRUZNbcwd0ClvEmTUhN2ZFTxTfVfxTgZj98X30WPlNLl
	yLp01qdmZiR6CdWnbw9MQvvR1sLr2VTvts41TNVhKiOqk9FhWu31WNPhXNdv6Q==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org
Subject: [PATCH 24/25] dt-bindings: pwm: rockchip: Add RV1106 compatible
Date: Mon, 10 Aug 2026 15:11:15 +0300
Message-ID: <20260810121121.210040-25-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051639_351406_6114E2F7 
X-CRM114-Status: GOOD (  10.61  )
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

Add the compatible for the PWM of the RV1106 which is compatible
with RK3328 vatiant.

RV1106 PWM channels also wire up an interrupt line each, with the
channel that supports capture mode using a second one for that.
Add "interrupts" to the schema to describe this.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
index c8cdfb723336..8fa75cabf025 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
@@ -34,12 +34,20 @@ properties:
               - rockchip,rk3562-pwm
               - rockchip,rk3568-pwm
               - rockchip,rk3588-pwm
+              - rockchip,rv1106-pwm
               - rockchip,rv1126-pwm
           - const: rockchip,rk3328-pwm
 
   reg:
     maxItems: 1
 
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    description:
+      Some PWM channels (e.g. on rockchip,rv1106-pwm) additionally
+      support capture mode and use a second interrupt for that.
+
   clocks:
     minItems: 1
     maxItems: 2
-- 
2.47.3


