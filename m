Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38C060A261A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CFuQwFrf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y3PJ7rxv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=; b=CFuQwFrfc9rDJb4x/HAajH2PpW
	p5/S+6Wo84E5PjYqhOmGM/9IFisZH2aYp6BefiNUAMoSyDAHblUoymXEEwZbt6ROrFAYnezPYMIOO
	kp8O/61TMY0E92vjKOYkkyajuPE8Y+wJaiGkomFr4apkfS6rvS/G5YyDpZIhWmblMiQvS4f9juqPb
	+WuanwaG1m+/I2KOoRW/fMnAcX1MWt+algtDhlBL3SbXoQdBZsAnE+6W2VqtxFfY4bRZa6Kvxh0nM
	Bat33HQb9BsA2Ea5KoP1WqskpR1j2TSYjssN/hauXt6S/OwCjxlyI5v8McJZOPiATESTDF5tT512Z
	VcIfu7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRxd-0000000BPVb-3jBr;
	Wed, 21 Oct 2026 08:46:14 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRxb-0000000BPV4-0VRM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:46:12 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8a06b436dffso206542b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 01:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792572370; x=1793177170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=;
        b=Y3PJ7rxvnEkfV0HwqNd0LMex0hIoFIgVUXjEVoCr9FimCQQv08ekmp5TMo1SVrbBhY
         HlC7rsdDfdo6ngpY2KVAQ9PXFOa7uLxepwNNTNM/r2mu00/MoAZbx45LADw8rWbN5Juy
         Y3p2HltFRbFteNfqk4+wKTSyqerXGiRugNefm21vaOiT3Doo93SlmX+1Kqvkyx3DOBUf
         n1hJ/JqowPZXnBlv8XE8NXL3QGJI2JI9awbYqgv7Hmj9IZOg1mge+eSV2pgqGh4hLLrr
         K84gqIvjZFcmmG9yZH/u4EVfM2XMacBoyMYfp/jyXu/DqazR17tMYGvCEokmWztzk+Wi
         /aJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572370; x=1793177170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=;
        b=e0hTjRxUu6kxIXmo9LkfObfSd8b0+MDcasLbBH7HtYg/3s6OXYJgZTvbPzbzzPGZZQ
         RjX+2+uYwhKVq8S8eLcWqG2F0sQpQXC1htzk0hGQi9Idv8qsjOcUy3nt19eMXO3Zgcsy
         9ug34eNnPyjA7tfRIUuIlgYpeMuQ1dX4q4gO6iA8c05yN9z4YgH8hJSolFrzdpU4bZJI
         BdOEfY4bLAKx291u8u9MkZ7hYwNc8/ih65PuSKKzPnJBxDSzVF9bVvWgE4DmKoaVhUx8
         4um4Ef5APNNoOCZJrGJwJXoS4FGEhTYt+MAijn2fzePvyaxP9DXn0tt1R7X/kfyHbe+2
         zshg==
X-Forwarded-Encrypted: i=1; AKwUvByrKJ69bWtTa0D0ahjalxRW9ZE2s1UKvGa9ivP0U3Ts0nsFsUwC9yO3i/LdE9qg7s1ZfKPPY7brCNlzgi16YspR@lists.infradead.org
X-Gm-Message-State: AFq9FYL0U4tX/GQViBG6JE8FoDiDdVjiQCkUAAItuSz2Un1En87nb66U
	wV7IRkfP48wp/a+GzFJt0yr1VnonCRvQRyG44507/F4W1LNPWGf398bm
X-Gm-Gg: AYBFou1RyT0L1PUPKpejZCWQqFtb7QnZEX+eN+5frcendOU+QcVg+5Ag0d14pxHiLZ6
	xofQ5yA8xjI+pJEnkj8k2wydWHV703EuAlZOcJJR8Z7NanJjTslbEzUkGRAKuRGeJYUH6brrp9V
	2WKyxIZak8sqSyKMGqGVpmOusPcKfKEgZJjBEOplH0vYh+prK369ekmbQ63X+c8ccC/g/Ytfwkb
	dtT3CLSFXl0KEEPch9Nr2QOz72+FjL7zrvgJb3u68PyU31CAbAhtXMnfCfp5vzt1u/93OAGsVCJ
	EHv3Ww+mjKjVbuxV8AwrFp7ThYhM13kbJm5cWUPettkhBbr0UjHPXSm9c5iXS6HV+M5HkzrsHgr
	0MrCBpN2EAPNZuQ6BCLMB8H7FO3vEIsbIO8/W80jUmVP3VGcQpeUEw9SYSV+/onQIwy28CsJ/n3
	k7P6vyuq8/29zo8uZii+5TUUslsrc+X85FXGuFA9M0GkdG1mY9sdONF6LAFlS478tKqroOs/Y8L
	nUqHJEEXQuea5PWQgsiJrm0vrl9k8DHOGnMG0isUWcwn1PyfZalp9zFzUJqM2CYNhXQagRoKKLL
	Mvm5280=
X-Received: by 2002:aa7:8887:0:b0:89f:129a:9590 with SMTP id d2e1a72fcca58-8a089ebacf3mr1029844b3a.48.1792572369847;
        Wed, 21 Oct 2026 01:46:09 -0700 (PDT)
Received: from FLK-B04Q314.global.tektronix.net ([87.58.102.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895c08c8sm604998b3a.25.2026.10.21.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:46:09 -0700 (PDT)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kaszubski <simpthicode@gmail.com>
Subject: [PATCH] ARM: dts: imx7ulp: add "tpm6" pwm node to i.MX7ULP
Date: Wed, 21 Oct 2026 10:45:59 +0200
Message-ID: <20261021084602.121087-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_014611_162885_86FE00DA 
X-CRM114-Status: GOOD (  10.90  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Krzysztof Kaszubski <simpthicode@gmail.com>

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <simpthicode@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..f5ec5e9d65de 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -216,6 +216,16 @@ tpm5: tpm@40260000 {
 			clock-names = "ipg", "per";
 		};
 
+		tpm6: pwm@40a10000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40a10000 0x1000>;
+			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		usbotg1: usb@40330000 {
 			compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb", "fsl,imx27-usb";
 			reg = <0x40330000 0x200>;
-- 
2.43.0


