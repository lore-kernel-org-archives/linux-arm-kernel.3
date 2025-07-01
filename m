Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF479C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCI2Z4burxKp6jBffEO2j5Dy3QC9TkNlBODfA23SKF0=; b=LaMlmqqmqwazY+pckp3kk+fQ1j
	rduboEpQmo9tNFUWgkycAQQ5E07505rllftghayIgWw+YtYRsj46A3MRMLOWjp/InwKBvCfdkCjBw
	2DTw310ONtyGvOy0TNBxt1YLAFYTVx59ALHzcQ0Ef+nsm6IrSlKGzzmk+9XivH91IW+GGLO+UfM5j
	FZi5r+ZcjOUVKlyqMe4Ud85R/vyQQphZiUoi9YENnotWkMHHPBKVqpmjOirriyb3zZyRyhsn/jO0x
	pclwNVu/pfTKpUCLAwNUkeTQy/Z5v5hw4v48QJl4kZPah3ZA+UjEHL7TTFKP7vTcDt8gMHixpyUaU
	geaw3GQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWULk-0000000482i-3t3Z;
	Tue, 01 Jul 2025 06:20:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWU8y-000000046Ko-1rKl;
	Tue, 01 Jul 2025 06:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CA914638A;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4B91C4AF0D;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350018;
	bh=pUnXGCRHe1PAu0P7R3hbtfyW7147Oqq1sb7DvZqbUgg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hH8VpUaCkMKyW9pDPAszC89p+2uaxKWyhuAEAa0qzlKzCTRqbDsq8opeNR1ahR6d3
	 PhYoVBhKAk+ZbPjF5iSkf8VYD/Ehv3+2fY2Ks0lwvpxfWJjHZARywDQwPBbRHJTRsh
	 jQ9GkTNHtXVfmRquCqM2qW7VBL2a/Cn1wxuqFw/szTJ+NmauSA9vrsnUrHFDZmel0A
	 EvuYKB54SYKwmhjEI4+a1es/jUCO2InLHi5O5iBiPn9nknbsEb+7T7z1NirWBeGSYh
	 SDU7XLyLGyLVR/i8ySQ1g8tuW2dzFOpzmiJzpU3vQ81gPOgLpN8KERHAWo40gvQPV5
	 IydaisVN33WgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB28DC8303C;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:06:59 +0300
Subject: [PATCH v3 05/11] dt-bindings: vendor-prefixes: add JTY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-5-8937cfa33f95@proton.me>
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
In-Reply-To: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=984;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=szH3lFOduJEY4mq69Ikm7Luzlgze9u32D6UzfN8hmck=;
 b=KlWi/u1OEZ6NUMG56rOUWo/GTXVtXy1dVK8IsC4DSD0BMzEyuyOLcrKnrUIyx5PW93Pmo1SUj
 2Kj5iPOQw0mAaG4r7TbQEalf8Utut1jaMwQ6Sq6J20bFFDCw9grUIyT
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_230700_572734_B886CC6F 
X-CRM114-Status: UNSURE (   9.02  )
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

JTY produced low-cost Android tablets based on various
MediaTek MT65xx SoCs.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae217643bf7a63a471f74819d18238..517bd129288c96483ffe358127ce8e16f60d902b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -782,6 +782,8 @@ patternProperties:
     description: Jide Tech
   "^joz,.*":
     description: JOZ BV
+  "^jty,.*":
+    description: JTY
   "^kam,.*":
     description: Kamstrup A/S
   "^karo,.*":

-- 
2.50.0



