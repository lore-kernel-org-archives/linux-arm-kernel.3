Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD811606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qR9dtRnQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DME0dOI6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=; b=qR9dtRnQwGpffS
	laqyT7ETtlno9cUa6v5HS3Con5stNIymt31EclsnkD8Y+bWmigfzKkpMoAIZL8eYIoOXLRSobM1nh
	CXb0/WYtgKALxyL0YrTCGVxuizj+0+SOxScsWSk37gEdHqFQv8lHN6wNJwm0HrV6/sPBHPFhKmF39
	juMzjHgb9W8Sh6iN+oYN0XSUfB1yT9+cI+8bU/01EgyWzvdtRXt1iC5phtBjBUHQ4/WwABsk9B7M0
	dxp9hnKPb9sIlDH9l1gc57+eFjE/oLHzAtvYi2YueJxqoMr4vCpMbnVaYKvk/WEZpjmxDGE1zjhru
	O6li1wYntRpfzeeqZMlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGh-0000000E6BA-2qxE;
	Thu, 22 Oct 2026 12:51:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGd-0000000E68f-2Zkg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:51:36 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so10652795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673494; x=1793278294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=;
        b=DME0dOI6d6x8KShj7cqROSWmYoouf5BgwAyI9/z0hizm+wHqqTfWAFd3Ji2MVEjYfq
         vbQjQyKn/7RwmE/FAqGUO14ffKWjV6w8RZg8H6BLA7wOrdGd0cO6QUNV4ZUDXHT1wliW
         QWb77uPH0o2WhvNuHhtXS2MokGMY+ywPC5r1kxs4wleOc6wfV91eBFVZCWHGccg71bT8
         YwpMGdHJqzXFMgYk0DMiOSFZvBtKjakDhO3HisZeIL+Z0frYAssdC7KKk8SEJfRZ65ex
         4N0wdSXljqtQ1xe2sqRg2Xyqwzs7itklyq39LgxdfH+VtTCDnZzbzd2RwPyPTjiaUdth
         sMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673494; x=1793278294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=;
        b=RHOQZlCIXAI74OYIeVTmqlK7E2koPj4nT32kKS3+2ynpWLecvoskx43ZJY7y8y4mhO
         5Opf3VN8lD2Ree8zLuyLvCQEdBmZUUIvHau+o9Xrfh9S7XuhQ65B8CDY8f+1Oimehio+
         8yk8W7abce8GCHvUuhHGlqoZ7eu3bFGTojzoBqiDOaucGnpcm+QebvoQbNTkqvezRDSM
         Oj6kVdJ39vQjULqx0+KnAUdJC3hA21X9f9LCLTgvHxdHYNmpKT0cjgdnYh2JRDUgF2kZ
         qr6DpcnL5qut8rXo0hG2VwTdSZ2GQlCELfEhzFWQSMAp+TZTjvu+y+k1AxcBmuUScvFJ
         7jog==
X-Forwarded-Encrypted: i=1; AKwUvBwSAfXWXtCtnoQDhOi1F8K+epcngAxs5LM4ahd+dsPp6mG5gmyk0O20xw8t/ywqz9vOSEIpUNnFfhMuB2EuZMWx@lists.infradead.org
X-Gm-Message-State: AFq9FYJAOj1Ifm2DQBwDY30JWIe+XLReIzUEyLFxF1NQbLgtC7S3gJXu
	LbK6Q8Sl9Xh9X3tNn9wOs701IHt3D6Q2baZlRqcVZqNhiPgTqpq4FxeH
X-Gm-Gg: AYBFou1OmON3vNA35/dvQdua2P3DHPzjpPvxHkzKcMyJShkYYZDOc6/sxlyKtv943mc
	JBVCDLf3Y//eBGY0si2WiaGKDoSGkyV11eMa9kEYU9OFz8Jsgdd2zQsbNh/tvWCTw6QUxGtx9Vf
	Dft9IHqpDcOoUUAjfh6fa7KS1LKRogzKVYUO8OZU3kc+JVYc/yByS31lQW7St1xWMbO4D0hxtx+
	WyfP7n2tCVb25xFAF+0LOuuj6e8bm0jZ392DPHDeFvAiBH1Ef1uMjURl/ZeoVppff1XvHm6yrqT
	V+JkE6MDG2fhVh4icLVkOICoWLDKE5shanNImqlQvMMN1SSX5NEPh/icPuBkrxp8VcIiRRpnfD3
	HCSIPBMTEvbyqhfHl8mAFbu2S6kjsPyddu1JweeLC9jNzor9v0cMvM2NSUYDeNAEUOkz94ZGfwL
	PKgwmqr8p8fTzwqudcwKnLF8Cv7CqsS45Uo41Nydd1FfxigkEIwhK+qN3bKLZcATTwP7U+COwcF
	0QOo4zSExtsmWlL7TQhqAsHf2LrnspITZJEi+CY+EnIiVBG3+Ez2KSFLxE5pTt5LPn+WqOyuFat
	pjmFtCvasIuiaXUpza7KaUCPJr/XqOnTZdg9MoGxUkW/A3zjM/Anl8w=
X-Received: by 2002:a05:600c:a110:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a204bb5994mr34273245e9.15.1792673493483;
        Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:09 +0200
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx9{1,3}-lino: Add NAU8822
 Bridge Tied Load
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-imx-nau8822-btl-v2-5-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055135_690929_290A0E6E 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the Lino
iMX91 and Lino iMX93 Development Board device trees to provide
ready-to-use DTBs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 18d4ed73eba0..ece4fbd2a904 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -859,10 +859,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
 imx91-11x11-evk-mqs-dtbs += imx91-11x11-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 
 imx91-9x9-qsb-can1-dtbs += imx91-9x9-qsb.dtb imx91-9x9-qsb-can1.dtbo
+imx91-lino-verdin-dev-nau8822-btl-dtbs += imx91-lino-verdin-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx91-phyboard-segin-peb-av-18-dtbs += imx91-phyboard-segin.dtb imx91-phyboard-segin-peb-av-18.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb-can1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin-peb-av-18.dtb
@@ -907,10 +909,12 @@ imx93-14x14-evk-mqs-dtbs += imx93-14x14-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
+imx93-lino-verdin-dev-nau8822-btl-dtbs += imx93-lino-verdin-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
 imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo

-- 
2.43.0


