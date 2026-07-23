Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058CCC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 20:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bsRp+ajnq60cOIr9z3y3rvK7i49Z/Q7M7NmV1U7G5E=; b=YLqoxR2h04iPNQ3RYwpXXlla4+
	XutlrjembLpnhjVu6VGg0Lzj+5STz6+eNPhtY3ZDv+LmHu9amKfTnXtNxXXKp0qfYhD4/gjLOQKJY
	7h59IxJvHYCFZ3bkjt7uFK3IpBlbjDilDriYdCJKjwFBGg66NTiARql5uiod3fgFwxyONHb9TBdwA
	vCUfq5ccmH4hVF+pi1AqyHPrZPTF9jwb8MKvk/khCYyAWYXUqBfwqLQodBEaw/+Fr8oZUQy4xtz3e
	SPd/PjpEAj6bBpxL7xCWEDLXwEnfweNHS772XMIBgdHXNxliOGdDj7JKLspr2eh6xzcd5slag8D6Q
	Obp5aBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzxU-0000000F1wC-1fkb;
	Thu, 23 Jul 2026 20:23:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzxL-0000000F1tf-3ZXq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 20:23:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-476a130c138so1064328f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784838226; x=1785443026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bsRp+ajnq60cOIr9z3y3rvK7i49Z/Q7M7NmV1U7G5E=;
        b=HX/ngC1DBh0YHTVICkfC6iPswYzI2uKfck2q60tq7tfHhwT8YeMqMjVEo67z/uYuhU
         wa2EETGQvthBlKej7Pic/JjfwbqnZgSD9OMPHWEkgqSc8OF7Idtt49LX6V4oI52GflSl
         FtJAW3BeLf+8pd6tdhXKXUaw6FebDnwLCkPEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784838226; x=1785443026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bsRp+ajnq60cOIr9z3y3rvK7i49Z/Q7M7NmV1U7G5E=;
        b=tMirA/0t+7nNZhxN02aGVhbPcKYnFZnYsk0LZbfPdxBCX+c/i62WTooaQXPyk0Rl77
         zLXvWaNLY+4BwkvwdGqrwDYdDVwumMWNLI8zcP1hslKWTEz6PvWhOU0ZkIE/2ExRu3H2
         4jJyqYB+/w6cJQGYIeO7lwnP/3pEdu8OMzQ9aRwLrRaTDWnlRw7T9krU22DFVCC7hQre
         Pf+vo/mQO3OugnyAU/a6APXPh9wFvPtrtvRUqJ8jsEAAULICCPWH6yxoLC0XJex9ckju
         NoUIM8aqmo7Fe4Zvs4IDSzoxqr1tXXXzi9CDrayWiN9TRvVkgRxeUW1omOD+lh99MQkb
         dx/g==
X-Forwarded-Encrypted: i=1; AHgh+RqI8c7cqwJMlKmg2eDQqkVfEAxZEN4lkQK5dX3DqgOxmt8sYKXo6cbEbQ0KDCyinA+Uy0kdOa3rGaU6NunGFxkO@lists.infradead.org
X-Gm-Message-State: AOJu0YyBYEwmFh+QUG5uKYHAYvYP7OsCX01UEMhd9E74UgTd1CPhjFBb
	8yvuC3FfWtQlCurg1ODuauTYQ/QrfOUHdGYmi+h3X++DR91hkTl7cXCEmaV3Z+UWxEs=
X-Gm-Gg: AR+sD126Gtj+bZ5TDun4+UtVG+2TuA2AOXXNycPN/gM5NKDX30kNUgT89f7+zu2A0zq
	4BhWbJ+oMRqJ8BNBKgH23naB0lwrV6GEow2/zfMz4psdlRoF+LGMPQ4Nebbl0EWe5cReQuM+yVE
	2AEeXX25AT3VlDP5SyglRWaeWP+B01e7BI6e5ordecPaGyWkA3wr+uKzuNcPKiehX3dWyf74VIh
	sjF6GjHSUXodoMjE1ZQc+moy+eNL7vXdl8sJaisPRy3BAfOCbNb2BpBWVzhWKcAkenS26V33Xvb
	AzMS6ODkndPOMrgvvIlhk4AbNli+ei/53PFAGhNzTSpx8i2Jm3Qg3SRYVNq3il8xC/CebGSBz2X
	jHVnWvAzO5TJcWUaTI+DQkBRt0jNZQS/OIJyGGVqrmYuUBovUZRFMqxMX/NiVDNkS6tonEJMaPb
	6w0RGcNVD+T0WndXrNpR2PwR9KZi2ucGU144dxQecC4Y79X1Ak4IAa7Y6qFnCIyhFKg3R4NLO6o
	dqsEAit5Rx558DI+6u4DjA6po3z1bQB1/5LVhOKrzsklXxPmou15xNfcmX3ZRL90/BWwfsNG3eq
X-Received: by 2002:a05:6000:4a06:b0:47f:5289:d5e2 with SMTP id ffacd0b85a97d-47f8dc9c774mr5891425f8f.40.1784838225881;
        Thu, 23 Jul 2026 13:23:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm17516051f8f.28.2026.07.23.13.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:23:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f746
Date: Thu, 23 Jul 2026 22:23:34 +0200
Message-ID: <20260723202339.974529-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723202339.974529-1-dario.binacchi@amarulasolutions.com>
References: <20260723202339.974529-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_132347_895082_8C062857 
X-CRM114-Status: GOOD (  10.14  )
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

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32f746-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f746.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 208f8c6dfc9d..82912cf9c4e2 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -721,6 +721,10 @@ usbotg_fs: usb@50000000 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clocks = <&rcc 1 0>;
 	status = "okay";
---
base-commit: d326f83e819c53aa05c40d64f5805d6237b6aa1b
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0


