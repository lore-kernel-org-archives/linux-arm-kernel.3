Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6755DC36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YvPPksWSsF+tDMCbvEs2TcRi7+oLctmG615v6XJg4jg=; b=DJVdN++TGmKla+2aW1k7uSQcih
	Vw/f6wWL42vzREonyfIKZ/9w0AN8Re3Z/kIJxuf0pmWcHDu7xG6K1Rl8tDm87wXcEH8DCVdHP1RjR
	ewqMroE0b4GKZ1qVHUtZAfR+lYmik8KD3pCL2o9Zt7rH+8hLxV19L5csdKVjJB7fMBEo9M4tm08pE
	ZW3VzV6ldT6popgskawHBU0XcvSxXNs+Wk1k3iiherRV9IHmHA20b+PjiU30BXEh21u9crR4eEctl
	8m4/oMoFAMIaGAGLoWsGfC5Moa2Ojzj0nU84udFkJDAdzqBNO/TECZ5EhrAl89A4HeI+Yl+hkTXMS
	XUdUgxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K9l-00000005Vmm-0viT;
	Mon, 28 Apr 2025 08:48:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JxY-00000005TUC-0qyS;
	Mon, 28 Apr 2025 08:35:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA1DD61156;
	Mon, 28 Apr 2025 08:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDBDC4CEE4;
	Mon, 28 Apr 2025 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745829323;
	bh=klD0yv01bNm8wfCoVGBvRVDfqDEPJmac1efJ8e3eiuU=;
	h=From:Date:Subject:To:Cc:From;
	b=EWssw/degF9d52y01LUX3btS1KaiMEgTm8vT9UI7TXsPEy8aku9mD+fpzl6p7usS+
	 QcA93ZUz+uxUgPIFXKKqI5efNteLeVSBu/cIsGrQIthKcUZzgIzTliWMN/2jqhB+SD
	 TG4Dlet4Rsh9XkFXp//cD+rpnRTWYpmFlVIfLD8/qfc7BPNMhPes93ed97zYCB27Ad
	 kDxG448m1u+t9waz7UhPLdi6bZLD57cBVTeg7dYaHcedOgdMTgtYJZKWH6WZrJTQKc
	 tiQMA/aZgrU56G8QD1HWbPur0Qx0oUQqmwATEWeFSCjfs4qKZlivNUH3NdG/cgDUY7
	 mwRqk3wPbqq3A==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Mon, 28 Apr 2025 10:35:13 +0200
Subject: [PATCH RESEND] dt-bindings: mediatek,mt6779-keypad: Update
 Mattijs' email address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-keypad-email-v1-1-dde6ac76725b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMA9D2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3ezUyoLEFN3U3MTMHN2URIMUE8s0E8NEIwMloJaCotS0zAqwcdF
 KQa7Brn4uSrG1tQCLzcXtZgAAAA==
X-Change-ID: 20250428-keypad-email-da0d49f41a20
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.3-dev-7b9b9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=klD0yv01bNm8wfCoVGBvRVDfqDEPJmac1efJ8e3eiuU=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBoDz3IMCv1w77XgX5NrlwsfIOOrq7C9ZyynIyHL
 xD7dUlX1seJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCaA89yAAKCRAZDR20Zk4Z
 NduXB/0f7JL64NbMpgZ91HFYYNb/FNnjQYOXVD/hnH0iIEGh8QkXpJyoHRfCk9pWYrekxRW5FBM
 8I4wPQyEepyHbWa49tQspk6xU/Vp7vwQuY0mtxeHZewHtRDxSqIXqaCaXLXp+XOfqQfXs6wMSxc
 yOGKU1oDrJ/W09S8HzM5RZtV8Lq04e2OkeMyeunabYfqMxPl+1XSVCyqjbGYwWlxNDJnPZElNFv
 5Eyg7jjmQ5caLlvqreAB+E1cuMaTOM4GEBGXmdUMfwdaXNveAl6gZQKBEjIybWJzwVpAEf+hZ+5
 4IHhRo7A+vgpAIEUPt8MK2qJj5Ni85UzoNu5ShVWvAAOLIFJ
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Hi Dmitry,

Would it be possible to pick this up please?
My BayLibre email will no longer work soon and I'd really like to stay
involved with the mt6779-keypad driver.

Thanks!
Mattijs
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
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250428-keypad-email-da0d49f41a20

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@kernel.org>


