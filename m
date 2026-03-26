Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF4810A88D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI0wt5Oy0ocRxFiQlKWRud+Cipg15jZsGIOFf8LRYNk=; b=m1dD5TMSWwvdojnyVHNcRbS1PZ
	y/uMyVIZbg7Bks/+2gkzz3umqWSncX33UOHR736lf7fZLHPCPf1ojR181Btj/ILRIoXW9TpFNCQMo
	myDzttjUwKJmawOaKo0f8fRYynayiisvoNcM1RaKLN5Hcv7g7TLvauFqg6OSmO/CvixiOEPQdAbTF
	FU2H9mrLpLAfu6D6YyCSn0Av9zWCx4YV13yu6jDbjSE0hBwYoYXPvmhoeRA+Wwts9UhOtPPc67qIq
	emjYZhP/eorJ4CnRIFkCElD8gd+O003CO1CTSTww2nTi69nOdDRl8Nsk4FbPY5C8Eh/yftEd5XUsb
	6Uxnbyvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mwi-00000005nMU-1KmU;
	Thu, 26 Mar 2026 15:48:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mwe-00000005nKs-12iq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:48:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso10436325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774540106; x=1775144906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dI0wt5Oy0ocRxFiQlKWRud+Cipg15jZsGIOFf8LRYNk=;
        b=hTkb48Ftk/EZzuWqv7Vyf1N3OlMgPxSA6pBUWxlU2XOZrUaXuvwXZtQzzE4jxO1iqU
         eUthcJIsJnRhBlFlPpokbYrl1xMl9FXnNR61ARsNCcuqx5ILSJh2uZGPDH4qLusHbtXS
         ntVy7Ew/d0xLA5kgnwVLsAGM03PR6qamb9j7U9ZfgOmUgUDhuPfTRn8fD1I8lzzP9Fri
         Z3OsR5vF/XvyLMu5edgZAy1Q9tvZZa23uGFgoTZ1J1hm7/BTEjCYd2o7BkFTWWkCQWW4
         Lhk5Kd6N69vB2VNkLks+1tyy5oYnm5zWowBPO6Hb+9hLuDWOU+lIne61BHi3H1mUufGO
         xREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540106; x=1775144906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dI0wt5Oy0ocRxFiQlKWRud+Cipg15jZsGIOFf8LRYNk=;
        b=jhFdsQkhc4VDGKhH8LHqxs6bsNOkHQkW0e2chRRLjZa15mTPbAchVnVqqT+ynN0Ps/
         D9yqphb0ERlwAbKVZOpXCTNyfNhKCgAj5KjUH/bHX+VWEJ7XCVMHZMnQcprFPk28Axso
         +ThgssJzLXsFpjxvJruNv9Y+9iCLWbMCLIEPDYNszhSDQyce+QBXFdPTxUNgDyMDkNQu
         nMw/vF2aav0bfDwL0sNtm/p3nNK3QE4Uc9fZ5zdIQre+s0JXe3oPPt76Il4g37KNl6D7
         hsNmWKjBQVrH1XIrQ1n3Ng4gvd4fr9Ph52shj+JPH8HunMb/ALVg6dhrPW54c7Scpxa4
         nt5g==
X-Forwarded-Encrypted: i=1; AJvYcCW3xvkDR+/Hu652/sOfhacBjmtrJDqSygKsnMPnbjLmSrf1wh+Mdng6woMtj1hbXShHzMSDX9sPYkqczDZZaHsF@lists.infradead.org
X-Gm-Message-State: AOJu0YxK0BoX4/jauwgwwdOzCTQHFJlsTOcAj0BQSJRh5ruW6hnyX5ox
	wTl4/dkKpRUXTX0pIeKTwlwRqdK2uew7x/tD+E0r382DWQ6SOrq+GgYg
X-Gm-Gg: ATEYQzw1lEfFhQPlA/0bKqOk2AZ8B/G+FJA1dauH8EZ+a4rAGEfnZ1FUwR2zUkJTq2k
	/7MgBDCN6C9wpp5cFxEE0TgaQ/Cy7WUWVTEqWuXhRQcIsxf1xIppYMVgx+Pdoqq74d1iVz+XucX
	giyQ3GtIWGVHth5Rn9PAlkegeIKoPXhkkCl3jI2M1igpbP5jxbGFG1oJDuDZJfpBO5tzcX1mGpH
	DR+fXeD6HJzitIJu06pki63MYapaCgdGnOw+KcuW6WZ+t1zyvKjd898HcozH8CgvLkpGtHXr0Oe
	eF2OQZUBlE8n36lzZwJAntryXfQZs3NzPlUzsXA+srAIGZHzf+xjtW32QLqUpPyHqaG0ClU6uVr
	ntzjsx0ALSYxjmYZA5gDczKU/UAstORHEfM1q177jLACnrS/01v+EsmuyMzb36eH8k0b97Li/hF
	i8zUD5aYbDyEUqt8q1wYrjPjm4M4xu/74IrdbvVD/JSitTLoLnU6z9rCG7KidkG4AqGQWUKA4JG
	yeeWDgAuOumCTgNK8J49+3op9Bnu/C51VaYHQ==
X-Received: by 2002:a05:600c:c0cd:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-48716031822mr86372605e9.21.1774540106277;
        Thu, 26 Mar 2026 08:48:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942e52sm8831016f8f.9.2026.03.26.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:48:25 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
Date: Thu, 26 Mar 2026 16:47:17 +0100
Message-ID: <b7b243c9c3931e8d7ddd984b654e7ef493e84690.1774539301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774539301.git.stefano.r@variscite.com>
References: <cover.1774539301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_084828_305353_A06314FF 
X-CRM114-Status: UNSURE (   9.10  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX93 SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index da2be7114f64..77497a261fd5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1587,6 +1587,12 @@ properties:
           - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
           - const: fsl,imx91
 
+      - description: Variscite DART-MX93 based boards
+        items:
+          - const: variscite,var-dart-mx93-sonata # Variscite DART-MX93 on Sonata Development Board
+          - const: variscite,var-dart-mx93 # Variscite DART-MX93 SOM
+          - const: fsl,imx93
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3


