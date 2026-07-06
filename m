Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7C6C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8G6pGuOuOyYcWebHVgbsnO4yO7+jMa9pCvWAaZf6rmM=; b=GRdFpIw7uXbEo0OagHHDHiLI6y
	lT0WHo3oSX73PVEHIf5jKw3J6bNGEpvR1bo0KKXSMcRa3adOEjZDuvKWbMbRG+huWuuhXl+jj3NIv
	3hCTojr8xB/2QD5kAXTJsjvm8WeDrLHE9gYioMLbWjy66dBdykEq/iyp8Y/SljyWXdFHiVNERTbWQ
	zw7vL0gTEpaDQ6If6J0PDT2bnM45FYHX54ihWhMaxp/w6ovE1dNSQO3N25snpAFo66t9bHhR9RJP0
	4sgg69WTw0gxYdtLFDXIfP8sKKStVgU6oiT+Ua5BCHxpyTpTXTTFdShWCvWGD6LSuSz+URpVpjwY0
	lvN+AfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTi-0000000DVgy-3hHN;
	Mon, 06 Jul 2026 19:59:42 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTX-0000000DVOV-24KN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:59:34 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso1416379a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367970; x=1783972770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8G6pGuOuOyYcWebHVgbsnO4yO7+jMa9pCvWAaZf6rmM=;
        b=lq/UAcTyzNC6JJaiAI+bl8qA8zZBMZ1MKJkpzY/TEN05v6fpnTx6W6BWBDnGGLtNpT
         bBW0x2zUl4p1wLb+Gh12jyTqZ86mtFA/Rk0+ZYP94IAR5TiA2qSoi8D/LDc29BxngoBa
         XN57t1lSW3cv1UfQSx0amqnhcez5sx9kiQwJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367970; x=1783972770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8G6pGuOuOyYcWebHVgbsnO4yO7+jMa9pCvWAaZf6rmM=;
        b=Ube6mYo+KgJb7kvd7tugU1kgk5UFQZS22sgF2V4U5ELpYGdvWYKwgDca375mUQuO9H
         M8Uj+zwO5YzBJw9R0LUVdzm+EcJ7W5z9S5cNXI/XmBS2+z0iXR/x8J/6FEMlOqHhFlJy
         fO0gqRddm+HmxsiLAx3kULDR0GwJ1J763mhki1utc4YaNoznZKUvj+/nhAscSd6nvQfB
         nvowmL1NtMcEXaDEyDeTfcDMe3LTgN4+hDBJz0TS6hfOTr+JeBHTVA+OV9rJ3DubIghB
         uWGKjaDaK2Dp9O4uRdDI9HnqsnwmQIv0jNZ6chNsV223dKQogMg69vElLzjrt9A5Cbp+
         h9RQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nN+X7jSHn5CczN8fs7+9LFuA/FdyMPbSX4cQEKIoGwKbsnHlpzRFb9hOsvRPpJtjgKWNkyxpetdKhx+pnUNzH@lists.infradead.org
X-Gm-Message-State: AOJu0YyaKt4U1CbPpIBiyHyxT8NXB+SwV99bVkEmQa1lE4qRHkksAgW8
	za4Xr68N0ZiwcUHcbeJFJDR/ilVU53odJ/U2BeXJF9tDfjv2IKzchyM3NyRwItORpA==
X-Gm-Gg: AfdE7cknTIHZpcQLJkO/8VYjDlTqLepajgUytuFcmoIAN1LeYjidmnAs0kZcryHYLOv
	3gbpXUB6bmsjRgjN4gy8mQCsxxTTVljz2NL2Qv5N2XZQ06121eRHeyu6mtv1genrD4jnytNBI6s
	qIU+3lajWOOYCcMxz1A/bIMzVbT+TV+efiFMu+mPMetiNKW4IgYfY5ip8wFpqND7LcbEmlk8nEy
	VcQUBw/mSOmVayylbQG0DuvhMC1iDcEUC/6icKPaKraXIYLzGZZ1OZKUDpWHkOaKvfs2gda9759
	MRh1lktKlq2lllU9HWPxgepwyEiMwNFHsp+IbB6l2xOsr9WJpCRd/572iJDN9lyd6eUUUolyMAe
	XqdFk0MFxo5QXuioeL5SMW/4L15a4XUGA7iX1S1qjWmmkwUIF5fgpPUb9haDlPHZL583II7miWQ
	61qosO3gU=
X-Received: by 2002:a05:6830:82fc:b0:7e9:dbbe:5af4 with SMTP id 46e09a7af769-7ebb23b0a45mr1303771a34.32.1783367970287;
        Mon, 06 Jul 2026 12:59:30 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:29 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jamie Iles <jamie@jamieiles.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 08/12] dt-bindings: watchdog: snps,dw-wdt: Add RV1106 compatible
Date: Mon,  6 Jul 2026 13:58:04 -0600
Message-ID: <20260706195818.3906949-9-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125932_553559_69E6E01E 
X-CRM114-Status: GOOD (  10.67  )
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

Add the compatible for the watchdog of the Rockchip RV1106, which is
compatible with the Synopsys DesignWare watchdog.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 9d25f5e497e2..2b16b7c2787b 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -35,6 +35,7 @@ properties:
               - rockchip,rk3576-wdt
               - rockchip,rk3588-wdt
               - rockchip,rv1103b-wdt
+              - rockchip,rv1106-wdt
               - rockchip,rv1108-wdt
               - rockchip,rv1126-wdt
           - const: snps,dw-wdt
-- 
2.43.0


