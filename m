Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E343CC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muvQnjrD0lZ97lHGH/9/vXL1MMfZ4a+cyU2MgUNnBpk=; b=MbDfMx+mr4smKrkCE3htYdn1VA
	pCg107E3tMLMPrIChlHlWas3vJbKPbMjEk/WUpxGZQRU+5YACnUE9j6fNUtmKHpgmtrJ3NM+oyglH
	TSlWv4d7dqPrYAZYz8ff0ULxO8RVahb/M4h2FYtB29Jxlm226ScSHuPXpfFI/nDTFYxsnr2yzpoL0
	7nUxMBgmm3Cw/kc2KQiZlw04U0j7wEkZgkKtPt5zfLkh463+Vt2/PAvpIrd+Gs0W5O7zgoYAZhBtc
	GMjQvglPaCQyGvXbQRrq1XBOyDciWEotohLeaYdo2tz9lzucpCaEtop4zKAx5q10Qf7kZmwU6ZB82
	3689rHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWky-0000000BGlq-3s7D;
	Thu, 30 Jul 2026 19:49:28 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWkq-0000000BGi0-3X7J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:49:22 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0EA0041C2A;
	Thu, 30 Jul 2026 21:49:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNCcvnCjca7V; Thu, 30 Jul 2026 21:49:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785440958; bh=oP/7/X7LVlKSo31gPcRHpIls0+Y5eEnnq2IMVb1d09A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Sl32IOQSC/xf6N1g6abR1McJhAS/b2Apha3UnUcWE6b6sRDBCt3bonIbT/9vLSZHW
	 b9njLQFBlRjgXggegm/XOSB21mxda8DC+PJosT/9ZUUMrbf96KoKKTqDxsMeVxQbU4
	 wlILa+jQY2kd9SihS/km07euRpUa33HRSI0dr7vZqzkst/RlBh01T7mSG+58ceK4dR
	 m97ni6SI/ujQVLaZCNyKaFOR6eolwa2EfHjTe+3QbHVe3vkraE7rUzes39ZZ3WOAaM
	 wJxFn6HrNRjzZvGxEMGaHL1b4ZTqCtOrsnL0gn+lrzvUfGg2YIPwikLEHZ6aOFFxK2
	 ZY7bx+KIm9kbw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Jul 2026 01:18:24 +0530
Subject: [PATCH v2 4/5] dt-bindings: input/ts/zinitix: document mode 0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-zinitix-modes-v2-4-ffe2ec9a9031@disroot.org>
References: <20260731-zinitix-modes-v2-0-ffe2ec9a9031@disroot.org>
In-Reply-To: <20260731-zinitix-modes-v2-0-ffe2ec9a9031@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_124921_034752_1AF154DF 
X-CRM114-Status: GOOD (  10.99  )
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

Zinitix touchscreens support three modes, numbered 0 to 2. These modes
differ based on their event report schema.

The devicetree schema does not mention mode 0, thus does not consider it
as a valid state. Add it.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/input/touchscreen/zinitix,bt400.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
index f1ce837b16df..9b51212ea9b9 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
@@ -76,9 +76,9 @@ properties:
   zinitix,mode:
     description: Mode of reporting touch points. Some modes may not work
       with a particular ts firmware for unknown reasons. Available modes are
-      1 and 2. Mode 2 is the default and preferred.
+      0, 1, and 2. Mode 2 is the default and preferred.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [1, 2]
+    enum: [0, 1, 2]
 
   linux,keycodes:
     description:

-- 
2.54.0


