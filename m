Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89718606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kxKTYlAf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KKEOh0OC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=; b=kxKTYlAfSGoJyq/df46oUHoxbR
	TNdCelANVmySHoz92LScmmp+7W17FJ4Rw+0Ea/HDxXvWm7tYOYr9aNwXvUbW4dy3MLdtU2RmF7i0d
	Ln3tmnAqcvS18+Ogerr2rN5vGvrS8hyF/e6gEgUDtBVlLosAA5cgOM+1mKXwXNQx7m9oZAF7dnBpD
	pU/XwhfyGPGQEG7YYM1EhdyqxkHiS7ZNyee07ykx5fPHZGxAFtseEeKbT9vwcfFAH0cMksLq6KbeP
	B7uM/mccskbI+gpIuaHcqa29dP0OodNOVeHb66u4TizP7/CjBbi5dWUFOcLtUIJls6LTuveoUhkgO
	+89M0Gkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiLX-000000053La-0NVb;
	Tue, 27 Oct 2026 14:40:15 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiLU-000000053K6-3Qzd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:40:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2997401f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112010; x=1793716810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=;
        b=KKEOh0OCCiSQHf9eC9Ywxkm0kTo2udI2YJ6Tw0cQaZUAFTwmj/p9fClkyyZOJ6kGft
         fkybD2DuK2urSMCjv9pSJ7IWxUJwBcbTK9jJ8p6drSep3tGEO2FqxIsUsc7eLT/b+rp9
         wn2yq4LhKo7mpRItZZ7AW9WRNEAcmHXa0zNC2lSovbrwNl/FRqi2CjhjJo719m306min
         l39B0IqWNuQ2du/ICU/QM9X9ZmTw2xEYgYfouWk/IbXNzXIZ8l581TXYT8T12H3zihm+
         /0sYY68WKLC/7V6Qc9cq4wZc7y+i1S0E5D3hc7wrgaABl/NmNWsCocizYgm1ADRoj5yO
         ryvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112010; x=1793716810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=;
        b=G/Y4KyVlA34RrK/RWkl9roOuJDkpX413+oer0Uq4V7katWP0nEBMypjKHZKq4KDdFo
         5oOvV1agD8Zwu5oO29fR2S5ePNrJvFO654bYrgtb79AylvL3dbP9oefeO+PHvsXmyIzI
         MWuAJFNJZvM1W7P3YcaWDo7hbtxNCbnQ0yThXgnxQslj/2zmyrEsjsjhVKXceSu2yDN9
         cDrR+iWGWW/iMSOoNDMMg/u2ozE9PPeb/xv6Fdti41H5LMX1iKBi5hvCyXOJFuISXfxR
         jvvLFuBTAUoUeHquRQu23jOunF6nNolDbfNWNYf3M+eyhOLrX0dKtQiTkIhL5zD+GF3u
         o4xg==
X-Forwarded-Encrypted: i=1; AKwUvBxKQqws7VLfrvYeyEZMxGS7koIc6cS7r3LueubX+6brMiq3vNN9hf8jwRhmA7i1b6SBTLW1mDIwutQR28QaPzS1@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5S2qNGMTtqoD8IoE5TWnTcS/CKqEQ2IECmSTxXxv+EVcjATLR
	JkaCtmSqHxyUbXSX0tXhre3wRvUdkYWum6uUyqZ7MDAyYyuZxaN5jLfG
X-Gm-Gg: AYBFou31cY+PbM2AzTLRHJvP6cMmbco57hIakhZAvpfhETjHrZycnxv2vm+fR+3npYl
	mlyHzVSJW4VfxZycKgCSgz0wk0bC8TXOAI6AHBzhMldL9HMAuzWAtKBmaiXwcLoVduAYNTo3s56
	viTHfmeErBm6zZoTVt8EmBjXNJuac3h+MHBupcEu8vDOI76vvhQ8WraAsN0utxhZFLiTxMoqBCP
	fQ5pV50shNC2KYp/CuaPJtqk2TxjCTrBkAXQk9PJkCKhzME+gju2oJaU50HIfGqZucDtESPESDL
	MI5QEDNdu2bi6aMxbSmVdozNJB8+JpoY33V+Qb+H3C4mT8LMI9p0D+8mpAsv3UtiYo2Wd9rA27d
	q6qu7IsaK8E32xzjVSaGoICT62wgMnDLkePPWmct1qn6yL75L42qjnpI4HQtg+WubkD/Iuh50gS
	ZKdPbf7vKXiDdC4W0RUsLxaqu0SSdTkGQKvOgbeR5yM+bXIPCDH7dJBpabMQUOn7PCDarJWurb3
	RaACYuwpYH/XNrLb9B80l3cSLnnPUQ42YhMFjupaFVbQHVUNT07H80BUNu4HdWsXI38ZWzb8Hvg
	yM1hF9uhHR+vtNWDo/7v4C66aTzhMDJaUDf1+kiy6uMSfc5MMoveGegFcsdS
X-Received: by 2002:a05:6000:24c6:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-48e3ebb0fcdmr20256092f8f.40.1793112010059;
        Tue, 27 Oct 2026 07:40:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23354151f8f.25.2026.10.27.07.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:40:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for Airoha AN7581 SoC
Date: Tue, 27 Oct 2026 15:40:00 +0100
Message-ID: <20261027144002.10606-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_074012_872236_E7FC7175 
X-CRM114-Status: GOOD (  11.88  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
The MMC controller is based on the MT7988 with the difference that it does
have a single clock controlling it.

Add the dedicated compatible to describe the 2 register requirement and
permit to define only 2 clock (the main one and a fixed clock for HS)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Also add compatible to restrict clock-names for source and hclk
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index a4d032224dce..704d59360bcb 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - airoha,an7581-mmc
           - mediatek,mt2701-mmc
           - mediatek,mt2712-mmc
           - mediatek,mt6779-mmc
@@ -182,6 +183,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - airoha,an7581-mmc
             - mediatek,mt2701-mmc
             - mediatek,mt6779-mmc
             - mediatek,mt6795-mmc
@@ -238,6 +240,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - airoha,an7581-mmc
               - mediatek,mt7986-mmc
               - mediatek,mt7988-mmc
               - mediatek,mt8183-mmc
-- 
2.55.0


