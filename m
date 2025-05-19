Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE70C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kb2EaVu+tw3z9feWzOl0s5q/HEzQlpZTiYkpCG3fyT8=; b=d093RnTHlSnYhowDwnLhVJprTN
	JW7aovd79oQ8XpInf8oMgzLOAQgzFsRl3IIJz+Ck6a/Gvilvs1RHodhVfLOH7zSN/1bp4JARLWuO6
	tcq5arRNPMHlVwaO/Z0xeQZ/+bo0Yc72Q9I4FJbLlccmHdxSUodm0ANFHYx4qX6OjFF5P47IQXoaf
	fOoliXRnsfPqBVCaOiM4IdakvmBzt34Zo8qggj7HrcWJ2ZMuM3hrf6m3ZVK5mnVfcDUNMSnNLh1eh
	Td8Ie6xXB40CEZqaVMPQhbVuFvh+ueRx4LU3PZYyikivM1jndbusImKM0RrAPmnDZ9GuuA9QdPfor
	EkJGa6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGydI-00000008z72-2Sim;
	Mon, 19 May 2025 11:26:12 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyYW-00000008yZU-0CxX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Kb2EaVu+tw3z9feWzOl0s5q/HEzQlpZTiYkpCG3fyT8=; b=EXJsw4
	Xktl9gbZfKjcILnAX70a3EDODknb1RKPY/1RyzoPys38UqPV2fmDwQb4REgSDjZ6
	0HMPmdJd51SJK4DnDdEzyvrbi7RVF7CSTW0vS6sze3nC2EGF8xXXfDok1ktPiQ5R
	lceVqjhlJMqXppqSdScw9WSEBBefN5oJWesz6QNF49JkK9Luh/h4Q0sGR9zatX2Q
	MjMiIxGLdTobtYLPDCCJG0gRILhCVs5fdVlzOKBbLixzhKCnUe2YyMuuTgIy8tGX
	USsyJMH3Paj2RX62tXjkmUfdUgwcb+iWDW9FMxM9qQgBHgzRWktpfCJ5uz9vB/uE
	HzpnBmdaQGQ8aNFg==
Received: (qmail 2456830 invoked from network); 19 May 2025 13:21:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:21:11 +0200
X-UD-Smtp-Session: l3s3148p1@EK85VHs1WMJZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: cirrus: ep7211: use recent scl/sda gpio bindings
Date: Mon, 19 May 2025 13:21:03 +0200
Message-ID: <20250519112107.2980-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
References: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_042116_361437_89A3F5E3 
X-CRM114-Status: UNSURE (   9.93  )
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

We have dedictaded bindings for scl/sda nowadays. Switch away from the
deprecated plain 'gpios' property.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/cirrus/ep7211-edb7211.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts b/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts
index adc74243ed19..0b15ccaa762e 100644
--- a/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts
+++ b/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts
@@ -46,8 +46,8 @@ timing0: timing-320x240 {
 
 	i2c: i2c {
 		compatible = "i2c-gpio";
-		gpios = <&portd 4 GPIO_ACTIVE_HIGH>,
-			<&portd 5 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&portd 4 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&portd 5 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,delay-us = <2>;
 		i2c-gpio,scl-output-only;
 		#address-cells = <1>;
-- 
2.47.2


