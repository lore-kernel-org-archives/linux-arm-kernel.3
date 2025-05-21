Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403C1C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 03:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LU/QwjGMBeWR7e4u8qSa1ijknawHIQmur/XJwgQZ9B0=; b=WRF/JeZqPfN9e4DXSgZsoZZbWu
	owES1dgvthcUrn7aVG5BhxPCMLXRVE1VtWnUva1V1S5lRyAX1YZFzJZ3hf9Q1MsYbSZzdY5In9jDe
	pUmN51QbahNhagOiYvqe0Py6wVEjcuoYTcBquaEqvHrGZC6kgUJlrAhkxzhwctb30duyY3lwIecym
	JxS/Bp5RR5cgJ/pcBYkddgu6aY0j/Q1YanvQSju0Tw9zTgNXKkCM2r+Kgf8TZhUb8kR77lIkQmIJZ
	pgCboUSae3hncAKkO9aqGfIV0IFbdNNYZSoVijeBtuAqUiX+vnJTFKeCkRzbQ1MVBNc76SBTsrN/a
	DMaeEScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHa1w-0000000Efnt-2y4e;
	Wed, 21 May 2025 03:22:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHZzr-0000000EfKM-07BU;
	Wed, 21 May 2025 03:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 007E74A389;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB36EC4CEEB;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797597;
	bh=byLh/bsiv/fh1hzyDOXgi4uR68X6jhJgLI5muBJNEqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m7eMC5vmN1Vmf3n5thadvgyR6KUoa9sRoXHXFv+hySadnmPl4+/HU5w3W/UVIsxNV
	 B1gVT3+Pqp2v0xPDhNIQhmKbuJc0cFJQLfjt/5dDqkvoLcNXfZ4HtJURLJ0+azFo2W
	 3gIiNtmXmn5PMpgriFh8jGsJkvd7EXPpyQtuSIsecUVSRR47p9cF4HRdRixOkuGQex
	 okDu2IQRxqQjCXLKV6uONIyLKrDo+6CX2Z3VSuN8ySIacuCFvyG9YGSuWrC13CbZgW
	 v2YmZYCKFXOwvvXBagM2yi4Pfl+tR1Msehmsz47w4jc8Nc/yc12X180GzKC6F1HsYq
	 B2cRQJvrp885w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89CCC3ABC9;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 21 May 2025 11:19:55 +0800
Subject: [PATCH v2 1/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-s6-s7-pinctrl-v2-1-0ce5e3728404@amlogic.com>
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
In-Reply-To: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747797595; l=857;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=GTxtiAQGmCYOsgbEQ6EOKgzNKF5l16qDKM+F3b/U1zI=;
 b=5AEbk6W4rLldJjUDa5G1M6bOgcp0jNU95UuGFwcssijnUcagojYY7KsK0iDWewtysBHF+wIt3
 RKOGBvOvBYWCmHTJRxbxt2FfTMb4njhfWQER3YvzACtEVLrwj6EEUs8
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_201959_091416_C868EDED 
X-CRM114-Status: UNSURE (   9.17  )
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

Update dt-binding document for pinctrl of Amlogic S7.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index c36b6fe377ad..8a6981e9f873 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -15,7 +15,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: amlogic,pinctrl-a4
+      - enum:
+          - amlogic,pinctrl-a4
+          - amlogic,pinctrl-s7
       - items:
           - enum:
               - amlogic,pinctrl-a5

-- 
2.37.1



