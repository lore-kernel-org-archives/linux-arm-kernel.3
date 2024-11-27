Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD2CD6ACC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3bheMto3E1kl1HdoApxqJvOhczEZkMy970AMWo89Pc=; b=pBuj1ioBwd/PEni4xb59kHEC1f
	ztuzGbkxtKBQtOCyEJNwLOpNHjcNly/YfyruHVSZacPPaV1bVRAKF21VbOWjmlwTIx6ImDhtR04/U
	NIYHe5QAxvkGyfAe+98R+Grd9UVGeGwCeiTUUUQ5j48oz0VqP8u5btaE1AU2EWe07Y/MRKrMTNBOn
	SWQerr+TpurVMWUAp+wnk0b034+mznLo7aROmLbmp1sC9nXsYrUCzidVmtgCT2XDWowINV6Sgm/IS
	mMozOseKUfqVvfmYLe8KNWgp6YI/kvKdR+taUVW4PMOMsCBm070K7ayU4kYhwMeSEu5y0zsyspc+g
	4vTgU61Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGon-0000000D5fy-26XC;
	Wed, 27 Nov 2024 12:06:53 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFkM-0000000CvBZ-2wKi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:58:17 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5cfbeed072dso8571436a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705093; x=1733309893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3bheMto3E1kl1HdoApxqJvOhczEZkMy970AMWo89Pc=;
        b=d1lOrIlrHjfhHFp223Vk3vpcJ7x7uuH0++IwKL4nLSUPVT2tLqioiipKzw1UrWCqyo
         y+jJqoClsacTmDOECW10KfCBKpY0KCn5zT1jpV4mr8cO5cg6dH5SOytZ2dEvHqRT8brj
         NjmlFq6Mb5Png/Z6Om18oz0QzHUI6XJvVJEjauviK/l7G0QvOKAWTcbb0JCY9gGbMym4
         +guzUgOc04PN0CdgmWL/Z5vqIhMPuIn+bgdamhHhcPObjPvEMUhaj6tier89/hu5Q38w
         VP4ji9MRkILqDGOfbdRM75k+flNARtCSAAcTEF6AMkdn3ol//LUeLYGzgCcf0DddzW6Y
         yMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705093; x=1733309893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3bheMto3E1kl1HdoApxqJvOhczEZkMy970AMWo89Pc=;
        b=DbSw/n0mOY0EXdOmAax/Sue5Eoa4Feu6pO+7O7J8dRDzg5BSsqEdGOyFL9VcaMJ+23
         KuqXtoSq2S4c2zjhbKWswpTCpMmELiBKze2FDOxszkiUoqzvUdNsEz27T/qOg4Qgcq/D
         I+Ay60Ekq6WlntnqiJyGg7te9WVopDs17EgVJlWXrdxAAE9w/g6IWcvPMDW+1phWXJXm
         Kd568OqG3qIECAStzYtFVB9uDOswXwFpI2NvQDAoK1SfBYykyr0oRyC8VHQpazck0Cys
         W0LEIkTrfXdxZ/juO9cTxwfLl53JeGPr2aGzQZSHuAnlzJWv3LD21hd8IM3bHX97dooy
         hTkw==
X-Forwarded-Encrypted: i=1; AJvYcCXxE9AZHK821AFVcWC0/jKpJoZBxo5L0f3eREwU4i/Y+r6yvjmOoeQlfeCdR8X9QJwIGiRYKQGrJf+nAhr0yz4I@lists.infradead.org
X-Gm-Message-State: AOJu0YyS5g3LnW+E+LzKOJUInxW4HjaILgPYhRsMBQgeH5QY6Z3AGQ7A
	NTSsz4CdzDuh7tz7LbUc321b1ED1OGravFXvndIyuqA5VBvvyk4H6PmUdim13cM=
X-Gm-Gg: ASbGncsXnlqlFAaE+KdLXAnpGGR2lb3mSHe7v5CYM4M4ys6rVJf2hfFikFWmafqiEvS
	hRvaxC1DohtnX/fz4CIfy762ccvJu7v8NMUsI5oRfXs3OLZNjbgD2/nvsrzhoSpT/cEMfPDi7ZP
	yydW4D/oAO1xycpSeUxg6d82Jh2LH4VvLSR5ZecCxcf7YcIQNtb/BUlNRCAB9gOQUJWpfWd8E/A
	vvb0CerBwrMY38enEsraAzRbkbUs9dZc/5fyAKbWqjEv1LeUpQ0P18kcDx7+o8BQEUXBmjoX2ne
	zJnRpR7QeFp6LDeaHR/eLw/Q3AezT7H9dA==
X-Google-Smtp-Source: AGHT+IFtopTo1T9muj6iS22tvZolqFiyxg9o/3wQpSGJ1mFMEg0qDXnVqCgHodOTVAcp8106njbuHQ==
X-Received: by 2002:a17:906:3d29:b0:aa5:63a1:17cf with SMTP id a640c23a62f3a-aa580f23e33mr198057666b.20.1732705092771;
        Wed, 27 Nov 2024 02:58:12 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:12 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:11 +0000
Subject: [PATCH 1/9] dt-bindings: phy: samsung,usb3-drd-phy: align to
 universal style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-1-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_025814_730471_E52491A3 
X-CRM114-Status: UNSURE (   9.39  )
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

In [1], Rob pointed out that we should really be separating properties
with blank lines in between, which is universal style. Only where
properties are booleans, empty lines are not required.

Do so.

Link: https://lore.kernel.org/all/20240711212359.GA3023490-robh@kernel.org/ [1]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 16321cdd4919..1f8b35917b11 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -83,14 +83,19 @@ properties:
 
   pll-supply:
     description: Power supply for the USB PLL.
+
   dvdd-usb20-supply:
     description: DVDD power supply for the USB 2.0 phy.
+
   vddh-usb20-supply:
     description: VDDh power supply for the USB 2.0 phy.
+
   vdd33-usb20-supply:
     description: 3.3V power supply for the USB 2.0 phy.
+
   vdda-usbdp-supply:
     description: VDDa power supply for the USB DP phy.
+
   vddh-usbdp-supply:
     description: VDDh power supply for the USB DP phy.
 
@@ -117,6 +122,7 @@ allOf:
             - description: Gate of control interface AXI clock
             - description: Gate of control interface APB clock
             - description: Gate of SCL APB clock
+
         clock-names:
           items:
             - const: phy
@@ -124,10 +130,13 @@ allOf:
             - const: ctrl_aclk
             - const: ctrl_pclk
             - const: scl_pclk
+
         reg:
           minItems: 3
+
         reg-names:
           minItems: 3
+
       required:
         - reg-names
         - pll-supply
@@ -149,6 +158,7 @@ allOf:
         clocks:
           minItems: 5
           maxItems: 5
+
         clock-names:
           items:
             - const: phy
@@ -156,8 +166,10 @@ allOf:
             - const: phy_utmi
             - const: phy_pipe
             - const: itp
+
         reg:
           maxItems: 1
+
         reg-names:
           maxItems: 1
 
@@ -174,12 +186,15 @@ allOf:
         clocks:
           minItems: 2
           maxItems: 2
+
         clock-names:
           items:
             - const: phy
             - const: ref
+
         reg:
           maxItems: 1
+
         reg-names:
           maxItems: 1
 

-- 
2.47.0.338.g60cca15819-goog


