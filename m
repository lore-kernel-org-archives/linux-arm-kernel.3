Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004C6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NLH7Xmd1zNbIyVGn5V1KyBpmu9YhPaZ2W9vJmT8n4bU=; b=IkjntiQRvJRn2Jm7nby4ndDrqy
	AI6Dn4uLE2sGSQPVcJegkfb1BGE5jxJaYhyFPCZYO/TzGZI3798deT0NbiY9ohiLjgjcRdPwDfM3l
	xz+JQa/mubv9+4iJXpfg+MFbx1xgSsKmGZaT+lWPMWC+8vdJRxvxM4/SbG9U0GiellqS3CvqUz2Bw
	2/KntEsZIfEJ5wbkhfZSbiAOS8HfRifi5WftNznpgW4Mp8kySvGBbQmUHjiDZgd6l5xJxouQQgx2v
	ob24bYYSzWEN/HaSeUjBJ87i7LgAx2fztckPdY0zTZiMbFMcUW5gD6AgxnWIAozbIh4VdoSm58sMk
	4CoB2Fsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurjs-00000002hTl-3YYs;
	Fri, 14 Aug 2026 13:14:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurjr-00000002hTP-0Wfz;
	Fri, 14 Aug 2026 13:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7688A43566;
	Fri, 14 Aug 2026 13:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F7B2C2BCB9;
	Fri, 14 Aug 2026 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786713262;
	bh=SehANLEi1AhnebfTL1kjlO9MbWFqPE1U/G9I2+q8iqs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=por2zTBMLibZcg4USnC89ZsLcBriS53gQfOjGVBSgXR8XfNxPZ40hTCGfTgCwxb+T
	 qmaIt/siez/re03IegYooGWBV9Dzw6A0a2XLJhaUZse9y9YczqyTXpa2y3J6G6hMLJ
	 VC0z4QcLyIxoMJ48eJkTpb+vNf7a5T9M7thxxuePeBXiRoaQx4TZ3NwC/pPnI0nm6q
	 hrtfe3U4vjr+eyZr/s3tYzZvc7cF7LMROI4m6VlYrjuAWvU2cGujD0v+3ln+3eta8w
	 XqE2Rb1q1YqY1uCNYcl/9uOM/v1tCuj5uploimcBpeUxCjXzjazJ4mrvmEnQvF+b8h
	 loV25GCyLoqJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A47FC5B572;
	Fri, 14 Aug 2026 13:14:22 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Fri, 14 Aug 2026 16:13:52 +0300
Subject: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0MTXTNTcyPdlBLd7NTKgsQUXaM0QwNDS4NUA4skAyWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgCOtcbzcgAAAA==
X-Change-ID: 20260814-6572-dt-keypad-2f10190e08b0
To: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786713259; l=1041;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=dnFCakk4vuGhlPYs5js9z6YmW0GnQtXr03hvBnhKxc0=;
 b=n5oqb/qqHWnBuYOLTPzQm8tLKvcunF+q145rv7u6gZq2JHxvdLiDZCezeD+FxS7AWq7o+O9F0
 jNVhnoo38TAD3bJqDh5TZBqVx6BwcorClnTnwfd24kRG74EOJNUf32w
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 keypad, that is compatible with
mt6779.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 914dd3283df3..20fa41f691ed 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -26,6 +26,7 @@ properties:
       - const: mediatek,mt6779-keypad
       - items:
           - enum:
+              - mediatek,mt6572-keypad
               - mediatek,mt6873-keypad
               - mediatek,mt8183-keypad
               - mediatek,mt8365-keypad

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260814-6572-dt-keypad-2f10190e08b0

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



