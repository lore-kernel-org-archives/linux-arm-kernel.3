Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9DCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 13:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bBpOUP7TMWOfZ8wMYmfi+OnEbjzuQlp3+ToGhCF9zAw=; b=oZdkpJ0UZJgqvm5mB4l2ulsW6/
	UchN/alukElLexBGvQ3lYvQV/g5o5pKZpACoa2JTLqcwoJ05QnYaQo5H4Pxt1wL6SekTl/cYsFfaS
	DA1DUKF2ktRsjkjd9mI/bNIu+g8ypSv9xHIpjzcq2kL0xxTv0MeMX281UYVgZKOuaJ8NKqtl855iQ
	7w3xBEt64eFfDWk3IytK63IPAKKYmRIz2A5w6wkukv1on4flUKg/MI/+XaiC+rpfSOVlHXfT41KRr
	0LPjg4UbtSCKff9FUxICSf7lfP+iYxtZuV7DXz3ZBcIZ+zbwMRydI59R4xGdHiLkYVSkcAOO006V2
	X9iNGMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbjQ-00000003Rlo-3OYm;
	Tue, 01 Apr 2025 13:32:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbhd-00000003RWr-1adn;
	Tue, 01 Apr 2025 13:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8DCA43696;
	Tue,  1 Apr 2025 13:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2996C4CEE4;
	Tue,  1 Apr 2025 13:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743514251;
	bh=Ul6lJvNEHBV/pZeVWxl97I6QputJg4xYguuegwagemc=;
	h=From:Date:Subject:To:Cc:From;
	b=R0nXnBHK+h56PKjMT/5qxNKseT3aIYCEfkg+iICdVnAYkSyVf+/sLwKvt+lgp7A6j
	 21z3BlE6WMo64ddo54dH/lQBUyTaUC4+skd/Bi4vgl5mzyfE6ot6BQVQfRxqeI1blC
	 LTILvkFOt/nMDIVd3zOUeBLOLA7nIq9Nw9OB2z5Kt7iD5yFCl9yHzFMeruBRdCw8S0
	 4NqI/VlEitmpQ0b+XHJJF+G8Ks31zJCKYwg1eChqc6dWoqu/JrnoZ7tyNXzYsjDfDY
	 AP2U1OFkVXY7tQ+IGjEcszhGRQ+AzTjLr76qgoqv6hgjjnoP6WPMBbqf98H0k7j1pB
	 zioIngRf90MEA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Tue, 01 Apr 2025 15:30:37 +0200
Subject: [PATCH] dt-bindings: mediatek,mt6779-keypad: Update Mattijs' email
 address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-mattijs-dts-korg-v1-1-0f8d96bf8a99@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHzq62cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwND3dzEkpLMrGLdlJJi3ez8onRdQ4vUNEtzSwsLIxMzJaC2gqLUtMw
 KsJHRsbW1ABsjdO5iAAAA
X-Change-ID: 20250401-mattijs-dts-korg-18ef97988246
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.14.3-dev-94c79
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=Ul6lJvNEHBV/pZeVWxl97I6QputJg4xYguuegwagemc=;
 b=owEBbQGS/pANAwAIARkNHbRmThk1AcsmYgBn6+qIuKsPabzv/RSvLVVc64fSuzem7BVylb01dply
 PyvhJXaJATMEAAEIAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCZ+vqiAAKCRAZDR20Zk4ZNbvXCA
 CJy+j4InTSuxmwJ0+YwXmooqhVHpiX5qNSmoiOGWB5L9p7+KtQPUq7HFvyg+NY6VlzVycvggb4WmHn
 J+8es2yRg3QFdORFSfoTxGfPCeClajHC8TKmZ5gMmA1X9lzP1IzbGVVcF/9xlZ5aGH5X5pSDNU1x4q
 a6hT5S9ForxGyuKHgwqMorY+CapbkDiYe+opCzp3XeBFfpVuBWvtPXIKzbdBrydalHk9OjuEAH79EN
 S43cmUIYvLyNhSZSnRbIfpwxfkLhUZgx8+oa7XIawEj5TFjjNPzAjKhWj9HSHe9zOGPBmgphhrS1V6
 50Zm2XB1BtHJeXJnZ/va5BDtuVTMvj
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_063053_442380_B3526E05 
X-CRM114-Status: UNSURE (   9.14  )
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

Update Mattijs Korpershoek's email address to @kernel.org.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 517a4ac1bea3..e365413732e7 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek's Keypad Controller
 
 maintainers:
-  - Mattijs Korpershoek <mkorpershoek@baylibre.com>
+  - Mattijs Korpershoek <mkorpershoek@kernel.org>
 
 allOf:
   - $ref: /schemas/input/matrix-keymap.yaml#

---
base-commit: 08733088b566b58283f0f12fb73f5db6a9a9de30
change-id: 20250401-mattijs-dts-korg-18ef97988246

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@kernel.org>


