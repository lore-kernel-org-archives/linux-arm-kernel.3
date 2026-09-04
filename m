Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEA6C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 06:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zc++yIXHqKNMbiXx+hALBD21DqYG95HAxZlQT8LxL8M=; b=FvBUTIUHCEJRvGMQV5F7pED839
	CkqEJ8MiqLiriq99ZQ+0nOde3RqnQuufgOZ0pN/+a0YbLUe+cgn/2lCROVheY8K+TPRtNb4ZWTJaZ
	bJPOnG9TlQ1w6SevtGjyZ8n9SARHCnnzokvR4dYHxxb8ZbY42/IG/s6i05XG1Xu0njXki0WFdJhqm
	WvNRBK0aOlHvO2PazGdyM7Bzwm+R2e9XxUnO7OPz0ngCFwXczoAkpxjGTIXDqNrZvxJQZ5/ye+prf
	caovsld/062/4VfATfZjPj8PPghh1F9zC8TjDTk/WSNLv5alwAE61JKj3IdyaBhXQ86SLOsNvItNa
	dhKnxh9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Na3-000000019Oi-0jzu;
	Fri, 04 Sep 2026 06:39:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NZz-000000019Kx-1Rcd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 06:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 667CC60A8A;
	Fri,  4 Sep 2026 06:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C7DEC4AF0F;
	Fri,  4 Sep 2026 06:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788503954;
	bh=YRtuINaeeg+H3XFSuIJVNYHLS6Z7t0vhSOvvVH0L3HQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MVjHyt5gDwOkBcnDzLO64lWK0+72jzhMlVHf+0UxjD9qwVRe99+eAi+8pZbVyY4xh
	 3+Se2nw5WEhlr0E14S2eSE8F3YWzSHqxqo951eHA9ysCZnHbi3yqe85NyiD70Qocpi
	 ogsztGaJ3WLEzF4zJnD+mloianH7rK2pvsrwP6W9KyFM4mXXBTnTm91qKs5w2Ch6DU
	 WhFCgY7AHQ/U0gxBe5vaRgAF6CeRsWrDyHQBmgCLNGDj7zShQt1zMvyx9S2Z980Dii
	 DYLwQ1iHB56iDe7BnTc74uY8fldtfvjZsB16mAnPpD/Plvpc2hNBFxb74kmXPDbaar
	 2AkbS7veKpUFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09237C61DD6;
	Fri,  4 Sep 2026 06:39:14 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 04 Sep 2026 14:38:13 +0800
Subject: [PATCH v6 06/13] dt-bindings: serial: snps-dw-apb-uart: add
 ambarella,cv75-uart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-cv75-v5-v6-6-e918514cb3b1@ambarella.com>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Long Zhao <zl020895@163.com>, Lee Jones <lee@kernel.org>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788503951; l=954;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=9H5T2CAaecrbxe1XZGmzDHUwCx/pDCa6CR6TyCM/1dU=;
 b=XXOx+PGosTen142j//farUwoWwOnOTOPuVxEH1dTawpqdUI2vhhMrMwC7T6z3DEC8TOxtPWgD
 vQdhQXPJndzBsxLC9NrgB+T4uhiJzGTj3DrWDeTgTjlQ/9JjeWRUE0k
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Add the Ambarella CV75 compatible string to the Synopsys DW APB UART
binding. The block is Ambarella IP with a DW-like register map, so it
is described as a DW APB UART variant.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 49f51b002879..cec5c679f1a9 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -51,6 +51,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - ambarella,cv75-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.34.1



