Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0C0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/IgEXneIniXkPZT8bYgKBxJsUil0rvnBRux5XQE4VE=; b=hqYv0bxHpnfgvM0U586RX7RFax
	BTSOHlrVNYywNMuUuL7JJGfdYh35eYeCVChC5JFHLhxuhtc3TrFX69wFQToubV6Lly2sDaMSzlS/M
	kj+z3nwUfD6EGiDsA1jw4sd1DoQOq0FIMa/Jat1dJYbkjYQHkf7w6+8xeLJLMfSfsVCZYqKEAxafq
	1znoOFKRc900aoD2DPgue8kDx+bJ6zgQXFsNgnMCy+kmCIvPLmoRtm6pTAbNquMUihLA6STlA1oLV
	XZaJSDxnqeiyFhKL5Ni3aVctLFriZIcU0J3ZwJmXgBuOZGFrbtd4tGI1Vi9rPDE7yTR7tKcQVpmHF
	T4I2eo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWc-00000001pkI-02Cp;
	Thu, 09 Jul 2026 09:58:34 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWY-00000001pfL-3bbi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:58:32 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-381065a7a03so1161676a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591110; x=1784195910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/IgEXneIniXkPZT8bYgKBxJsUil0rvnBRux5XQE4VE=;
        b=c+/qzv17559PB1S/QLmUJvmKAkZgGRpg8uFPTYEmrj4XZ8T3qBDMQB5ZepajmE4aje
         xk9g941Ea+chcD8ow6aXqdYvcmGtoYXNKgVhzoYYRXPrZ34CnYvz85HryVatXPAqKG32
         hAqZvqIqBQWN7Ud6A3+FeOf6W1U7fUG5OVsTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591110; x=1784195910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/IgEXneIniXkPZT8bYgKBxJsUil0rvnBRux5XQE4VE=;
        b=bme5t0qWvc6n1r/UIg4mihw7QQ/uypApPaV27rx+HgAgRfL88WKMXvEE3ghrzhm2lz
         FDcB2SW9npiRkY+KXIS7PEd4ptln9drAvTQR6T/H/NeeCnz2A67I8DZvsvAZ/tTDKklY
         tQ5L9UT06KBi63i5SYqUdFdoRoL4O8T6JnH7df3K0YwuMgcOMjZFALKAVQ+w0imsuGMf
         XitXO4nEGGnWHUWPhNwRDQue/spZRviHRMnRMx6aHZoYYkSlG5zJeMno4xHoU4z+gvEO
         mT5xDgUOYvBRNFdEbRjRh9tXQfpXFEgNiuCAIFU4cSf2dPpPmpXDZlebLKIVmQKe9IR7
         aY1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp/OJ1h8S0ZhjO0FlEQMev2tJFZiWnKMgGHgazixX9NzRoO3uT0h7LuXhiVvwJSkjynjEvfDpTa8W1tVMaN/nHY@lists.infradead.org
X-Gm-Message-State: AOJu0Yya+kiSoygAoXqdO5Sc5qjGYango6V2hkAPS4RIKPTQ5RVVeEZk
	57cGipnjnK6oKWHYuHQ1dumeAehYgGn7tKgI2FP/k2d73aCIA8b9fWE4SHRZt4NEbg==
X-Gm-Gg: AfdE7cmJ7ErC26viy4rBlxJl11pYrn5lJz+zr3sFdnuc8mfBo3lxA6fW4W+++1ld6X1
	FW2+LvxT9z7math8ETwkDxekeco8OHfsYBIWMdntmfyvjS5bF3kAd2dMMWq0hXE9z/kH6yfZJhF
	EnmiwSvXcXHiDsMlbORbK0b/OkGPDu0XbcH4d2juj3JlrImQF9sssUIcX5rd2TtTbOtbJA+ZLwo
	hUo/M86ZA3XzSbkZhFRyt4kOMb2lzVAuD6J+KszrFAQBT7pZnjhcDcoLSWk+S4enjeOzqeZVpIX
	mmtv4C0H8UD/q0P2ztF0mfzhK1rZaehdqOg4V2JqKibna+i16DEiiaqXGoMNzywZYgTf4PkLNxe
	NfyOry2ZLjOyJVI6J/GPhnKSVR6OZMbunSafaPc4uvFNRnMRKx1iMDqKgZH8C/+rneq8NpZn+Em
	J4nAUd/FkIBisQaTjCzZz2RuqAgjKcZcZ6Jt6KYjStiHHu6jlu0EK1u9Y03Ue+XCaVYuDrNQ==
X-Received: by 2002:a17:90b:3ccb:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3893d81f4f6mr6100304a91.0.1783591110117;
        Thu, 09 Jul 2026 02:58:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 10/14] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Thu,  9 Jul 2026 17:57:15 +0800
Message-ID: <20260709095726.704448-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025830_941011_BADB4504 
X-CRM114-Status: GOOD (  13.24  )
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability. The SSUSB controller
handles the device or gadget mode. Saying that SSUSB handles the HS
portion is wrong.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Switch to a "ports" sub-node for describing USB connections. Port 1 is
Super Speed if the controller is SS-capable, otherwise it is High Speed.
Port 2 is High Speed if SS-capable. This port mapping scheme directly
matches what the hardware returns in its capability registers.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Squashed DT binding revert and addition together
- Dropped reviewed-by from Bartosz
---
 .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
@@ -188,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.55.0.795.g602f6c329a-goog


