Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D35FC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk1ECRw2Yyocn/6K3wE85Ur7O62uYCnJHZBJkQdAbyI=; b=OSaQSF4K9UBqNr7iJAINI0izGW
	IYQsc5IVa2IgpI5UjngEyjuINyxRCW4FTN5+3v+QcrtiCJjfKl3a38FWBjpQyzNYGiNQZ29Ai+8gP
	DXqVNiXA9xzfMduq5UBw3VHmZASG4c5JUjXe7UlVUJfwLw5OA55Qaw3L9GV/sVu8HPZE4YAbw8J/r
	RAIwSPCdgXbiZOttZPfe9DwM4En/9HkW+SbWjk+5HSefgHs8JhxElh/YE+T8hm9iOMkKuQtPxdnII
	H4Uj78+FWzJpA4R4s9pDDPiMbbZ48PyHLwuBF803KnYO/PpB1fnbmbxcqAlMXo929YjAotTXH7XPu
	HrBtOtiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOSo-0000000Bf0I-2UYn;
	Mon, 10 Aug 2026 11:46:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOSm-0000000Beyu-0fiR;
	Mon, 10 Aug 2026 11:46:41 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786362397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pk1ECRw2Yyocn/6K3wE85Ur7O62uYCnJHZBJkQdAbyI=;
	b=4DsGh//QE48BwOAa+ppUSo5lqNTMrto9evYOUAHs9nmD8qyYyQr/VzGfU56M5JZjGNndzF
	ewWPeXaJOmIKc+/QX4Q+K73Tjue92pWEVvCKgc+gAXAbVEHx03H0LhURp1NrARezRFcnPq
	lHvICBI18KUCv9FXq3S/3gmpIXMow3EJer7iFRWyWOeqskPwaCR6XisuOIq1UgOgwYCuv5
	yyuHl9+uLrXwcl746M6C+viPbILXRbkWwkc97IbF9eCZ8Zn5+0SoYWhqk3+GtTcm0WsVu+
	EIe+A7IQiqUzezNkI6TxR1wdgk8QzZab800ec/gTxkdh4a0QpCXdLfscyWC3XQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786362397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pk1ECRw2Yyocn/6K3wE85Ur7O62uYCnJHZBJkQdAbyI=;
	b=ojujx0/R5TlGrwh5PY5OZonLNhSv61XCpge0Fd1ahlyeXbr6ugNhUZqv72dXnM6TE4PFWb
	2kNAb0B1BYVngxBg==
Date: Mon, 10 Aug 2026 13:46:33 +0200
Subject: [PATCH v4 1/2] dt-bindings: arm: bcm2835: Add 2712-d0 Stepping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786362397; l=1074;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=OY8lc8Vz8pu7sRcvxbNmJANYtvunkxTE4JtLFk346G0=;
 b=dUI5DcroJ9xnueLOGMGFrLNGsm+UmtIfhuGRsVDNJwWf9LsK8eQdpE9R9Ql0L63Hb9zTmhlh0
 iUE60sK4BAKAiglwM3n2Z8rWXX6okPN3BU8PCGYGxIU2Itxweqp6fkY
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_044640_343279_F458A846 
X-CRM114-Status: UNSURE (   7.69  )
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

The bcm2712 SoC, found on the Raspberry Pi 5, is available in a d
Stepping and in a c Stepping. The two steppings are not compatible.

Introduce a new SoC compatible string together with a new board
compatible string.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 2729a542c4f35..7ad6583f7fae0 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -29,6 +29,12 @@ properties:
               - raspberrypi,5-model-b
           - const: brcm,bcm2712
 
+      - description: BCM2712-d0 stepping based Boards
+        items:
+          - enum:
+              - raspberrypi,5-model-b-d0
+          - const: brcm,bcm2712-d0
+
       - description: BCM2835 based Boards
         items:
           - enum:

-- 
2.47.3


