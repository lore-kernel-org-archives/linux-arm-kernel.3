Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651F5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 21:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQ/2jO9kY86PBveaA7H07jnCAULpl2h71VwR4VV58eY=; b=PJQfmSvpH7tUIeZD5Kv7hVJiYa
	hSmj7raGd0Yx9FImYYxe+zyjkZjxmLv7ayRhUgBaSOCoc8408g0HXh9x1seWiac0ti/bFdpqEGLNj
	uo9cvD4n4RgWrDyuzHZIZpxpymGF/kWjUmOOW/6+OGvMmPpgzSzxS8Mdph7Ya/u3K/sbVBJwZjhm0
	YvFtayfjSvpuzIwTQ9m6Hs/OwYtY8ZlsIb8k4LQAaSda5HwPugnIgE5I/mbTG6rUx8rmnUBDDoO47
	9HehrT9gki/lS1xd2R6fq8Y4ZuvQg05lzwhq1E3eTBKB/2zaXxS89DQE8hK/inwrZFPzm35bl4awT
	xN8yjRtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepn-00000006t3w-3BSc;
	Sat, 11 Jul 2026 21:02:03 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepe-00000006syc-31AR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 21:01:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C983119826;
	Sat, 11 Jul 2026 23:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803708; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IQ/2jO9kY86PBveaA7H07jnCAULpl2h71VwR4VV58eY=;
	b=OKYLE/VVcOkNBDQn2Yd4FgbE+2flqHj5p4DN0VcY+B4XF0gEyGkfvODqgGNUlrT9QqzxQU
	0hqzG2VUxj4bbpUNS1cXmLtvaaGZ2r5ZSNy1XSsB1O7/dlGSpHP/24m7f7EZfC0G9zaLVW
	GmlJYO2VqdTqEiMzZhKQukhXp2McDoiV2khX766HzS+uDeE+kLp6SGaXky8M53Vqkb45oJ
	8s1Ackks7Tyoi8KCVyOXXKJYYykLVPocsGjGZirKcGf4vQgbanMpt739gsn2AQ0MfpRI3t
	E4ymYcHNTo5aiAzli4NpwtlkIU2hGT8tGxFO/X0fYYvTDkgjUnm/PjrY7UwTVg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 02/10] dt-bindings: gpio: pca95xx: Document Kinetic KTS1622
Date: Sat, 11 Jul 2026 22:59:31 +0200
Message-ID: <20260711210131.236025-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_140154_907738_C9C58523 
X-CRM114-Status: UNSURE (   8.03  )
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

The Kinetic Technologies KTS1622 is a 16-bit general-purpose I/O
expander via the I2C bus for microcontrollers when additional I/Os
are needed while keeping interconnections to the minimum. Datasheet
comparison suggests that it is compatible with TCAL6416, add the
compatible string and TCAL6416 as a fallback compatible.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 4f955f855e1ab..4631388a7d914 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -22,6 +22,9 @@ properties:
       - items:
           - const: diodes,pi4ioe5v6534q
           - const: nxp,pcal6534
+      - items:
+          - const: kinetic,kts1622
+          - const: ti,tcal6416
       - items:
           - enum:
               - exar,xra1202
-- 
2.53.0


