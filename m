Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BBDFEE4CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=no4yh81J61nKpytXh0CHQHn/SWnDxgeTNbDCvnmJlsA=; b=Fplm868UaJ/7JBs9YkAmg7I/xy
	3MXXWfC2RPawYNcna3TfmrxVhn6uo+o8x4gAgdMajxfnq48YQesKbXG5SjoK+HLpNYFXuoH06JFQ9
	YF3dfFkW17+zjy2RIVeSuBy0SjiU1kIzq2zQh37Pm2nmD5KyFk/+sbGuzhaxDtc6bjtWHPDkU1fAr
	Yp0HLfWSRh58aRO1DvjWpaJFDjc5i56SaczKRO/KxU5M7iOk/ai2x1xGzcDxyb10taNBDOVE2jHQQ
	bsB7f11jglBqOiGPmxMndbo8tNRH6NxzwWYT7zrcrbrou9bVl7sh3Wo0e3mKaCP3L5zDJvGRJHV7s
	dX85bUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwFCE-00000009dNI-1W8w;
	Sat, 28 Feb 2026 07:57:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwFC1-00000009dGg-0qQo;
	Sat, 28 Feb 2026 07:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B665E44558;
	Sat, 28 Feb 2026 07:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B6ABC4AF09;
	Sat, 28 Feb 2026 07:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772265411;
	bh=1sDzeoes75xwXJ7VUGZIFhW7VWqP9FhBjTm8+3+hMtI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ty0EuTiuKuqBzCk7UooM0bEhZi9vQm6n+Ipb52bnkGlYc+m/8FXUf4fiWhDGpQm9C
	 I1zCM0t32fyaBkgabNeHE5MMfZ0o2tHSCcJtrhpdOdX1jHMrHbr7CW8fsCKCFL8fe/
	 nYWk3VcUkcJStT8t2Qjs/Y8qrGM5xML2rjoMYw+1HyUC27aRf5/izrb1adLrLNHVs3
	 +eXQwJHBM1KHxBnAmpqyiU01+otwhwx7RMmkYJMMXvJVZ6JE6O8eRvlNcVaRfTZz6x
	 /e6QAs62fAR0eB/qPkPzhIqNL2zQ3vBKIukDhBfzUAWsMbYnGy6tGiO7w+PlzPV1Ab
	 y0Eb2PK5tFL/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7D3FEE4CA;
	Sat, 28 Feb 2026 07:56:51 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Sat, 28 Feb 2026 07:56:15 +0000
Subject: [PATCH v2 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for A9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-a9-baisc-dts-v2-2-47489d5cc1a8@amlogic.com>
References: <20260228-a9-baisc-dts-v2-0-47489d5cc1a8@amlogic.com>
In-Reply-To: <20260228-a9-baisc-dts-v2-0-47489d5cc1a8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772265409; l=1065;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=GG2+tqcGh5gPHmuDgyTzLzwkbN2gsDbUKOMY7yAnDbc=;
 b=SdE8J/H9E6GHbGZm3hRNHAiA920OOqHG2MVxfERGdlqZ3fenopSCmEzxuw9oSbCnD+angO5Lb
 R+igIGF/be0DIriKSjtzT+WsJ7jsJrwrC3GW7+5FOzgq1y5LZ1vuXyQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_235653_295546_9321C5EF 
X-CRM114-Status: UNSURE (   7.46  )
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

Amlogic A9 SoCs uses the same UART controller as S4 SoCs.
There is no need for an extra compatible line in the driver,
but add A9 compatible line for documentation.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index d8ad1bb6172d..a2702319685d 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -56,6 +56,7 @@ properties:
         items:
           - enum:
               - amlogic,a4-uart
+              - amlogic,a9-uart
               - amlogic,s6-uart
               - amlogic,s7-uart
               - amlogic,s7d-uart

-- 
2.52.0



