Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EA6C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 03:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xsbyx99fBNMgU9ktlPU+V9QGJHk36OFXFrXA1xWOpDk=; b=aZuK8t6JDoYvlsd/yrgwpQ2QTa
	8dzZopLB0ArLnQ8LDi11kutJtT5I5HQjvIh8jUZs2Ac2VZ146iL2zj4wHzsh1F4Itv302Oe99hwlP
	KyuUh92fsGg1qdk0d3zf2Xa8O3na6KQ4J8w9LJWofTLg7rHYxR9XuQtOUMsmE793FPAG3qcuOGq6v
	8Kxb3jBr7TreHYG5yVj05PyHWHxZ3M0tVeljdcW+R8GYKLTOy68Xk3U7NpfWafYVbQifq1vZ3Xwd8
	w4P4gnPkea1f+RS7dvA1kJRhjwoyKJbzI1vIf8ymgo99cycLBAG7Hb2NaH4Ns/QxrVzC7Iah1VvLW
	KQ2mENBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHa62-0000000EgCT-3omt;
	Wed, 21 May 2025 03:26:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHZzs-0000000EfLR-1Xuk;
	Wed, 21 May 2025 03:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A151629D5;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3855C4CEED;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797597;
	bh=SqXI1uvoCkhyqkrY5xjtQtfDKxNrvjB2D2HwRduTNGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cSopkJvE0Kf9CTQCl+3k4tYWtdBkGRQCb9G6WmSgt1ZFsgrO/9PAl21runoubb0A9
	 9lBVWXSZBVFLLlvKHISL5XA2lvvDCqB4NIDN+JnjuWpvpjZ8NWllUFQR8yWi52JslA
	 RU+wd62HTK65zSQ5C60CO1dsx8ojDkZ+QeBI7zHSMZXMfDN6ajRCHByw6/pEGBRND6
	 5B94q1az7YCSDzkbKFOdIuWR6BCdHsXtmXqGKeTap3KcCUKd50bS0ohWy7Saor/a4p
	 3iLFRth50SnEA2a0lHs+1vZekLRd8MPFklZcMr7NBUZnXiaf4sk9w9y1qyes9UHPzJ
	 avyJc5SJoYd9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D08C54E92;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 21 May 2025 11:19:56 +0800
Subject: [PATCH v2 2/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7D
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-s6-s7-pinctrl-v2-2-0ce5e3728404@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747797595; l=1044;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SRGfN0xHu7rPLyCZFtaZT28fxmetKbOy0Gk6C4ftPKQ=;
 b=xDc0h5Vw1oMx3S0SYBU1t9FdC5hI5owrChjc8tPYukG5Ui+agERsWO8ognjRHA8PZym76ynxy
 ieA1CvowSUVA6a1WC89YoBskbjrVOPY/oKmnWnNIP7k7mmi+w2gOcZu
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Update dt-binding document for pinctrl of Amlogic S7D SoC.

Amlogic S7D SoCs uses the same pintrl controller as S7 SoCs. There is
no need for an extra compatible line in the driver, but add S7D
compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8a6981e9f873..96a7c5646c13 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -22,6 +22,10 @@ properties:
           - enum:
               - amlogic,pinctrl-a5
           - const: amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-s7d
+          - const: amlogic,pinctrl-s7
 
   "#address-cells":
     const: 2

-- 
2.37.1



