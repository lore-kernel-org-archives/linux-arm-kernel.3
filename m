Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A104C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 00:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXPp1VL7imfBgXdqZoWg78JDaW08QCMka2aPoKYmM/s=; b=QuazoSad37JjM0PHYVV5GI72yY
	bBJJ5MemjLzGRImbIR/majJwMUAV2tvNs6Z/gaEd8Isz216KtePxQyEzYv3EjYsi8flYRpmaEHA39
	QSsuaO37SxJFzHg0/LIGzwuWj5q+/V6JN3rvG+LbCPnn4wuV+w3d/czirshoqRgmPppSavtIDEm/+
	4+uX0EBeCzME9zQb3nTo3n3lHz1puFHkWk5DZcyQ6leOpFLlEia7dcdpYpNPDJoZsttDFucI7xPv0
	vkUpbVvzUw1GdpFZ1XQXtAPmkKyRIOnKh2MKK37TeCtfAVuStUzUqDD7LlfKi4ES6fai0XaEOmE/v
	4lwyme0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugBNU-0000000DMqy-1up3;
	Mon, 28 Jul 2025 00:06:04 +0000
Received: from chumsalmon.baetis.net ([2001:19f0:5:5b58:5400:5ff:fe17:97e8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugBKx-0000000DMbj-2Xum;
	Mon, 28 Jul 2025 00:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753661002;
	bh=oODfbwD2M9LRfRSx+G6gwNJz5Pq3D3zQJ6ch91Hwclo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gGpvm/7LrQ8RaFTeyu9E95mixZcVTrVDUye1AvXNwWR3cJ/S/ezgI/Yri0OsJDbZf
	 gpvafuZKzfHNqq4q9pjSachzleCa6rygOr+k+fIXj/T7WNrM3veFKyw6S/zz6YVVqR
	 r/jvQWlv5aiu6l+JdSSG5/m57/MwOFeq2vJ246t0Mc5DoFLzldKKJKmarOUvowDkLc
	 GXrhfogXk8xb8jkSIPukK7pS53LNqqGVu2dIeTyhb545HRV4FwsUIOGfasLbwaqjNj
	 biJivnQAv3UuQfnS0tJvkLwQTICVrs/uI1g6eJ7zPZ5YV1NoyxCncPzUNwkqAo+EvP
	 nRfrCQLfWtQew==
Received: from localhost (unknown [IPv6:2600:4040:50b7:b604:6c1:3a28:af02:372c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id B7CB627E83A;
	Mon, 28 Jul 2025 00:03:22 +0000 (UTC)
From: Erik Beck <xunil@tahomasoft.com>
Date: Sun, 27 Jul 2025 20:03:19 -0400
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: add
 LinkStar-H68k-1432v1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-linkstarpatch_v4_6-16-rc1-v4-1-0dfa7aa06ec9@tahomasoft.com>
References: <20250727-linkstarpatch_v4_6-16-rc1-v4-0-0dfa7aa06ec9@tahomasoft.com>
In-Reply-To: <20250727-linkstarpatch_v4_6-16-rc1-v4-0-0dfa7aa06ec9@tahomasoft.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Erik Beck <xunil@tahomasoft.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753661001; l=1378;
 i=xunil@tahomasoft.com; s=20250724; h=from:subject:message-id;
 bh=oODfbwD2M9LRfRSx+G6gwNJz5Pq3D3zQJ6ch91Hwclo=;
 b=NYgTz1WgCDVt8YO6RJjV7v/Sk8tQAajRAXFx9G5Z4PduehuDyW+obAO12lzrsx9CKYEvTziqf
 mTXlKnwdQxfAGLEOOjqKsmx/m1wuPP7neewknIfeFdKIGL5g2GY7RCc
X-Developer-Key: i=xunil@tahomasoft.com; a=ed25519;
 pk=FTZVGUexvkWb4j8v0wbtm7CtJLijIAaa5x0XV72WWC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_170327_852845_7A8A8BCC 
X-CRM114-Status: UNSURE (   9.56  )
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

Add device tree bindings.

This device:
  - Has not been supported previously in the mainline Linux kernel;
  - Is a single board travel router made by Seeed, using an rk3568;
  - Has four ethernet ports;
  - Has four USB ports;
  - Has WiFi (MediaTek MT7921e);
  - Has a real-time clock (rk809)

Base commit:
  - commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494 ("tag: v6.16-rc1");

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Erik Beck <xunil@tahomasoft.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5772d905f390e53b44f9093d32b869a7e0655db6..7f3904b69293f31fdd4f6080fab5ce054c1abee2 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1109,6 +1109,11 @@ properties:
           - const: rockchip,rk3588-toybrick-x0
           - const: rockchip,rk3588
 
+      - description: Seeed LinkStar H68K-1432v1 RK3568
+        items:
+          - const: seeed,rk3568-linkstar-h68k-1432v1
+          - const: rockchip,rk3568
+
       - description: Sinovoip RK3308 Banana Pi P2 Pro
         items:
           - const: sinovoip,rk3308-bpi-p2pro

-- 
2.43.0


