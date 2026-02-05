Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271ACE9126B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 06:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuuoArhoN7YHgElTuyX5x2btTuXcHcj+Y7v9TWNK+ZA=; b=lkrdJVx0nIyYyzAq/Ida8Cp7FO
	R5MEGk+cfc+hAXyB/GHFk9HhyoQv1EH3rSEkbTw27JsvuRpMPnBoTkyvN0meEVBV4MwgzMX1VJ/NZ
	mimhiiXuml0/O13Lo6APrG2DrBTBQ7HyauFZVaI5fhc/o81qSnujYEvheQyC2C5K2TdtW5+7KU7NV
	XzyEr36uuf1tX3Etq+q8UMfSVT+pHJAe9ALyIE8jw8wdpDB0YVbG4WTevE3OpuotBDkCnsweDNmpG
	Z6kRiUu81nzBOHXeP7/x4Co1VuWUZVOa56EEWrRees15/5WJjEo4sepA1KTybG3Z9LRFjs2k+d41e
	/TkxD1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsTK-00000009TaQ-0BQo;
	Thu, 05 Feb 2026 06:04:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsTH-00000009TYs-143t;
	Thu, 05 Feb 2026 06:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1294844422;
	Thu,  5 Feb 2026 06:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBDCFC2BC86;
	Thu,  5 Feb 2026 06:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770271445;
	bh=/8ctvmeakP5gITWGA22K/VCIdEe+GIFB4PDMdxs3dp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hG7KJzR012Lijpw41otOqz7SbvorehYF9I6tR/Z9zYZ3JSGlBecOb9zfcxLjvVBJ7
	 qay2Z1iRzGEzmayI3AkiSQPXRC3cf84En/lz9bpLht33UDoJdCgj10C9S1NWOo+sFF
	 2I32D+Awcj850x8uPCmEJ0VZjOvS3wUqQbs5cSqzHySsGCpYsklaP37hDKxjra7/vk
	 vZBHiQbWSD4tHXu8B2S/XbVKbSQaggcZsRNHDtx1pl6dSHY8883UvACYZ8JOPdt3dw
	 JM7kTfU0bEUa6lCqizMhMU7uWDOu3JJRlJSnKrxiU2Oq+njkW1OmPADp8Bu0NJMpdK
	 UCZ/sUUelWlyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA284E91261;
	Thu,  5 Feb 2026 06:04:05 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 05 Feb 2026 06:04:02 +0000
Subject: [PATCH 1/3] dt-bindings: arm: amlogic: add A311Y3 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-a9-baisc-dts-v1-1-1212b46f95a7@amlogic.com>
References: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com>
In-Reply-To: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770271444; l=912;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=YqKkQKMdwWrvKEAOSja6X/Z+UdrbQ8sFtcO8Ce9oL3I=;
 b=t44pqp/4M5L4gAGj+JTodZvhV2jIt+7dz9SMNGrtRJc2H2Nh+Yw5T/GhK8Zo7sPh5niDd86Rh
 7dmN4TRwzgODz6OfWTPQK9clndrnTuuYvs8ANoGMZbEhul0DmHMAimk
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_220407_372707_3A43CAF6 
X-CRM114-Status: UNSURE (   8.10  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add bindings for the Amlogic BY401 board, using A311Y3 Soc from
Amlogic A9 family chip.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index a885278bc4e2..9f73a0054fb2 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -234,6 +234,12 @@ properties:
               - amlogic,av400
           - const: amlogic,a5
 
+      - description: Boards with the Amlogic A9 A311Y3 SoC
+        items:
+          - enum:
+              - amlogic,by401
+          - const: amlogic,a9
+
       - description: Boards with the Amlogic C3 C302X/C308L SoC
         items:
           - enum:

-- 
2.52.0



