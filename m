Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB06105F781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpK/7gAydfr91Prnv9s4l0pBpjIN4z4bMzbmgBzMg4M=; b=ZQWCcEn4UnePO9My14niKqmYM3
	xdsv4qD8+JFOag9ua/XqSg2GN0YBL6ZHmkIpz3ogF1aS7yvxd1pQcwaLz7JxL/iwzatHJ16eT3sRw
	v4aKy4pHnK8Q4NhzRirBgI7HerjwMv8s2aLti95qgNcZtkr/TV6MjPijZ6J/Y++Y689nh0y72dq00
	yb3GMaiulEWhvIlyHwCURhwc8892ght6/CFIwsJbhxaXI+zZtZdbtxf9s5GRpYr9uObmAhGrepFbH
	4AhrJTlwIiOWEnp5ctNHone/ua4PvOO/Qb7WWDOYlf++G4wc7vEUMPzqAmCCe/CFDbOo+39TIeufc
	SUFoKbLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yLW-0000000HKH3-2Spe;
	Fri, 13 Mar 2026 08:58:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yLS-0000000HKEc-1Wwn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 08:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NpK/7gAydfr91Prnv9s4l0pBpjIN4z4bMzbmgBzMg4M=; b=VIaw5bAUu4BQzQZNIMXCTiUyNr
	HIKC45Ofchy2TTZPSaL6OxNgiUAk8ZlSem2yzrzjx7ZZrFGgJ2Ayumce60Cs0N02WFBbZWCPtVEyQ
	nvZrxd3DRVxuq4EDzauGXRovmmYrH3rlAB6wgSXyoe3RM3ySqK6q3oAItl1y5qnZPv0s/ZDKNaO+l
	gm5sFXXDItLunmAe7xskoq5F5NANfOm8PUCJbSGYnn6pyDayy87ZmKXGYbnn0YFhD/vEZ/80nIZQn
	TZRGlMfKwl/Py1u1+TXzT7H6HO/XPFtAUXqgqkAIg0+hw4JoxIMp5l4xbSF00cbeeqpo+Eoq3XMnS
	+77SDrMA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yLO-00000002uKl-3Jk2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 08:58:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48532925a4bso10111335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773392284; x=1773997084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpK/7gAydfr91Prnv9s4l0pBpjIN4z4bMzbmgBzMg4M=;
        b=mj8mKC8pr9C1B19swAiN4VNuLCMLNX3Rl8gy4Gv67WsQo8+Zp5BCasy+Zvw+OBdAds
         PDWk4wmaPvla6ahao06KqMcPeLqCCBheOh+x7Fp21ltrbvgWq9dm9WC1dXLrqIozAX3r
         UHKPViLF+WEM2jSS3XTPYaDFts1USIDkOO73nPGeHhh1lPn071da7e71F2MLXPMHBboJ
         zvdIYRtUs4JAX8MV78dR1L6Naz/wC5FW8lYtAVebzBlXLTqidHjFastEFwsis/3lopaL
         mqbgDwjVyg/f/aJ95AxxgcjLBxfLuXvQZU/hj7xRhyXgykwbMzycsAVZEKHkOsAzsUKp
         eOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392284; x=1773997084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NpK/7gAydfr91Prnv9s4l0pBpjIN4z4bMzbmgBzMg4M=;
        b=CSfP4fPyS5bvBHbGGFyzxeBCz4ek9HrBI6h3Tzap5YLHMdaaqj0NuP/EKnanczy5zH
         G5SWSkoTNP4+5ufTP4dQEkmPDAQv+RycAA8e23pR0qhHeWdbbOnWfHKY3nSPs6/9gDuz
         jjEMMz4WXdZ9DQ9lwT04W1tNRemXf90OWqi0qhhzY5PMItaA3F26K0GmqrzkI9G/Ln+k
         GtwW/OwhyzR/xvjPj8TxGxT5bCdxMwQdLr6TPnPo09iVoCeoxIvnL+sDRJV7W33jI2cS
         D1phkpmQ628aZFcXORBLsdVRqG6LNn+32lu6CfzEwYVzTWbl6fCFl2maIoOJg5Qvawck
         Z+fA==
X-Forwarded-Encrypted: i=1; AJvYcCUCkQah47j8JFuhsKcYq3Veu18I2TazDjzOLCOYglj9STZAWUqijKnYTxEBW28MCxCKx9XI24ZRrcBgevws2neO@lists.infradead.org
X-Gm-Message-State: AOJu0YxhhUR7j17rv4+8PxTpVP9CIEGtSS8qgnBJQ8p2nB0eXdQ0GfGJ
	eULEfcphgCEshz8y35XjvQwRP1rJB0K9WsyZyYO+8i6ZTGToFUJqptAM
X-Gm-Gg: ATEYQzx13dKvGnUZXXELDPEnQHTAlgnLZ8lbTZXyXGuh9HwhGNVPzxJF3iffQbyHbeL
	fOjWRj1QPr/txTSPBhpB2iK4P6pOcZvDrOO5VxxjQaoh5JOfAzkxHlLL7iAvZseG8AYml+N/Xa/
	pfi+Oo4xImoM39YNZ6+w/Ja3rXf7jqva2wCmmgeGLCRJ3SuAveowyNRIA3k0aaYLNJjBcXyq/6F
	TWfF0/sJ/1y4oTROC9RB1uDqwh0QIiskFmG4deusrxm7ELNSGVFYctLL0R7aeFN5eFqIAh9mvda
	7SGsQksmdQT+IQD2d0jqnMKTghUtIWBP30xt7IMoM/TdDxmU3hB4HIJQRaTRglNhLJjd3PWcnWA
	TcVK68S+p/CO82bH0IVaUc8X06cpc5h3BJENsfmW9qqpSqPhKdtdBkied6/NMqclPFHB8mpH/an
	S1GNXVc5/kHxMLhwzh98s7gGBikIGMfYKSd01yGGtI+2k29hi8nn6u4fyd7b140p+6yXVQ3j2zz
	WAo5Q0XSqQ+3pqqz7aOPk63ZL4=
X-Received: by 2002:a05:600c:628c:b0:485:3b34:2f51 with SMTP id 5b1f17b1804b1-485566c9440mr34176885e9.4.1773392284100;
        Fri, 13 Mar 2026 01:58:04 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm7663718f8f.36.2026.03.13.01.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:58:03 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 13 Mar 2026 09:57:42 +0100
Subject: [PATCH v2 1/6] dt-bindings: arm: fsl: add Verdin iMX95
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-verdin-imx95-upstream-frank-li-base-v2-1-bd488be7c699@toradex.com>
References: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
In-Reply-To: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_085807_117893_66E02BAB 
X-CRM114-Status: UNSURE (   7.54  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add DT compatible strings for the Verdin i.MX95 SoM and its supported
carrier boards: the Verdin Development Board, and the Dahlia, Ivy,
Mallow and Yavia carrier boards.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v2: Added Krzysztof's reviewed-by
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..f0701143b237 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1477,6 +1477,30 @@ properties:
           - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
           - const: fsl,imx95
 
+      - description: Toradex Boards with Verdin iMX95 Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-nonwifi-dahlia # Verdin iMX95 Module on Dahlia
+              - toradex,verdin-imx95-nonwifi-dev    # Verdin iMX95 Module on Verdin Development Board
+              - toradex,verdin-imx95-nonwifi-ivy    # Verdin iMX95 Module on Ivy
+              - toradex,verdin-imx95-nonwifi-mallow # Verdin iMX95 Module on Mallow
+              - toradex,verdin-imx95-nonwifi-yavia  # Verdin iMX95 Module on Yavia
+          - const: toradex,verdin-imx95-nonwifi     # Verdin iMX95 Module without Wi-Fi / BT
+          - const: toradex,verdin-imx95             # Verdin iMX95 Module
+          - const: fsl,imx95
+
+      - description: Toradex Boards with Verdin iMX95 Wi-Fi / BT Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-wifi-dahlia  # Verdin iMX95 Wi-Fi / BT Module on Dahlia
+              - toradex,verdin-imx95-wifi-dev     # Verdin iMX95 Wi-Fi / BT Module on Verdin Development B.
+              - toradex,verdin-imx95-wifi-ivy     # Verdin iMX95 Wi-Fi / BT Module on Ivy
+              - toradex,verdin-imx95-wifi-mallow  # Verdin iMX95 Wi-Fi / BT Module on Mallow
+              - toradex,verdin-imx95-wifi-yavia   # Verdin iMX95 Wi-Fi / BT Module on Yavia
+          - const: toradex,verdin-imx95-wifi      # Verdin iMX95 Wi-Fi / BT Module
+          - const: toradex,verdin-imx95           # Verdin iMX95 Module
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:

-- 
2.43.0


