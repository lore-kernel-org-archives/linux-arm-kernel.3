Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8F7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeJr9FDsSYw8HIYplOiopf+69p0J/ihX2v3ROipEQ7M=; b=MB7b4G5fJaeeiA06Aq4efv3jlp
	0ra0VSsvb4ZpTPkHCkt9oWHLhPCeXXTPAM80NYGNA06wWnlcrrBNy1ZUxT0nobmptqLVl3QQpH4I/
	hnqZEw3pZZX68e2ra9R3nCxdHe7ismfb40zSBHUpvIeQns8MHTB2ZNtPlqiqzNsNEU7i0/UXFT62C
	9GtWxX3o2CsTyKa4CiqPTE/QYYLTo55ZB7pRwamU79+Gje6rXRWx3mHn0vtWp6+P2DAed3/4oqD4Y
	KDz3+YZ1/W+VV7u9qWUyJWM77IJwQ05k+V7FFh20HMUUc61DEIDF7wWd5OrW4FdoGB7GdyJkg/jve
	z1BYwPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiF0b-00000007voX-3Uy7;
	Wed, 12 Feb 2025 15:50:41 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiExr-00000007uvz-0c83
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:47:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2981440F0;
	Wed, 12 Feb 2025 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739375267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeJr9FDsSYw8HIYplOiopf+69p0J/ihX2v3ROipEQ7M=;
	b=GqpzyR3I4uTG51rFsmP2OeUzCa08P781lS4wsNvNHRNmd/hynSxYClZvWG9WFq2IegO/w1
	A51zUmwAIb0tOVWCNvmAm9n0/A10chDETCHI+1HKsHM/Ovz2OSajwF00FkXJnJE/C15SAs
	1GkkhvqpLHoqtvNznIDUPJ/QO7jw2R03OEZe0dPHPfZ/rAprtx/OaRnE5ajysaKp7aiJaD
	NJAPcz7JIiZ2rrwNQdGBgQQl82Varuc7mZ5G61xLisFjCSzBSTTEG6P398TclZh2xpV16S
	ECf/mp+xCkm4t/Rvk0jOMaTYbLNCBc6adWLKI2NJXyi9GNSzbQy7l/aWePLSdw==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 12 Feb 2025 16:46:20 +0100
Subject: [PATCH 01/12] dt-bindings: bluetooth: describe wilc 3000 bluetooth
 chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-wilc3000_bt-v1-1-9609b784874e@bootlin.com>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
In-Reply-To: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Kalle Valo <kvalo@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedtjeetgeduueefffevueeuheffudffleehhffgjeefkeeguefhvdejvdekjeeknecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhit
 ggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehluhhiiidruggvnhhtiiesghhmrghilhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_074751_319408_59A1E6C0 
X-CRM114-Status: GOOD (  12.35  )
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

WILC3000 is a combo chip providing 802.11b/g/n and Bluetooth 5. The wlan
part is exposed either through SDIO or SPI interface, and the bluetooth
part is exposed through uart. The notable peculiarity of this chip is
that the bluetooth part is not fully autonomous: its firmware is not
loaded through UART interface but through SDIO/SPI interface, so the
bluetooth description needs a reference to the wlan part to get access
to the corresponding bus.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../net/bluetooth/microchip,wilc3000-bt.yaml       | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/microchip,wilc3000-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/microchip,wilc3000-bt.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2a83ca3ad90b26fd619b574bc343bee9654a1e43
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/microchip,wilc3000-bt.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/microchip,wilc3000-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Bluetooth chips
+
+description:
+  This binding describes UART-attached Microchip bluetooth chips. These
+  chips are dual-radio chips supporting WiFi and Bluetooth. The bluetooth
+  side works with standard HCI commands over 4-wires UART (with flow
+  control)
+
+maintainers:
+  - Alexis Lothoré <alexis.lothore@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,wilc3000-bt
+
+  wlan:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the wlan part of the combo chip
+
+required:
+  - compatible
+  - wlan
+
+additionalProperties: false
+
+examples:
+  - |
+    serial {
+        bluetooth {
+            compatible = "microchip,wilc3000-bt";
+            wlan = <&wifi>;
+        };
+    };

-- 
2.48.0


