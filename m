Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2005CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/wcOHMEVWVR3p6oq6xv8OGP6miSv6dtFwXxohtxDzw=; b=NJ6+YpUvZyfa/w8qTgL6sBW7Ya
	FdTCwf45VewIX3QOWwEch8CqP1c/G+bnHsK5en8Z2LcnV8BQRR5sHWtYzCNB6Ct0ihDBwuNe0CtHZ
	os0UXcSCCSdkpRKIDuubr+6+9TgqnqGQMv2o9tLHc8+6FmQ0rGpA7AfYPRAxRViynMR8yUeaB8vtd
	2NObAiO7pms5Aw3QNlzsuVJC+Q171sPR/z3Mp2mTaDiO4g4HB3b0ZzY2k8xsTk+BVqbK4y85zbDhN
	X7wkz7ouNoo3AkVeAAqRLEBhCYmYKF73yfpPibV1S8BvqS+egTVXMyxju5u6NA4FOILDgSrvxKNbA
	B7UzFe8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZah-00000003uyz-0Ikf;
	Tue, 29 Sep 2026 15:17:59 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZaZ-00000003uvi-3tv3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:17:53 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so19958755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695070; x=1791299870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/wcOHMEVWVR3p6oq6xv8OGP6miSv6dtFwXxohtxDzw=;
        b=WfyIUtZvf1AaLtoy2uWJ+meN9oxbWJXKYPtcur6/naZPPKWOxYgQvHRhmloBIJKMuA
         QPfWipEuby9AcZdzAbG9XSqvfjUMcU/iGcQsaz7Rwq01zTpiTUCmVd1Dfuz2LRSYIave
         BuR2dV9+EAmzqumVzKL8slKI+LSSxI9IlkLTn0t36pNlV6lPuGBkyDp/4me1Wo0tyUJU
         IP5FrvLQz2sGb7uvqUWopM4e5C7o90eqKGbgtNPLQOkkHKV6hiSGlGYgWdHCsjxBmu/C
         +L8uj2cZR2SEeoadV0vRbNFuc9heVfJ08nwemJpPecGLlmjwKAXVwpm498c+OqazUKyY
         7VhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695070; x=1791299870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/wcOHMEVWVR3p6oq6xv8OGP6miSv6dtFwXxohtxDzw=;
        b=hokjzU6fdvs86bDQwMVaWxIonZOSkgr9EgY5CEU4h2wOyWxnN0oOKzn5bvQq745lLG
         ir5mE51v11vGfLSs2ctKZr/NC0YtzXqAkjoyWRk+qclbWjVfvX4Ww5W9U7SDkJ2yxkHu
         +FjVKznB8rkzoFhEcjKEzXNV6TR0J6+h2HbrFu7vBcmC0PMQgPfS96FWw7JFuZrNHwMI
         pDNh65iw+m2Nh7IK7aQRj7RMOQGvHjBP0kgyh2D79sdtMOYA+ztCTGrcgSbxOrGWXERJ
         lY/4ZjYqZHGJk+tNpiizOo3NHsje5rU7SqneZT2uJsAdv2oGNO6+OHc8iNJm0Yc7mBRw
         fQVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgjls5TAMGOQLQVeYGLOQyzA9nmpKdv6WX65LqF1LRBO1+7kB5sLRzIG6aTsKcM2wpT3QPNGNpTePzXtn0sksW@lists.infradead.org
X-Gm-Message-State: AFuF++l96P7j9ex9h9MIYIKFwxbd37HCRrusN4XQt7M9nDVadP48K+FD
	Lq4ZZRNoKSI27c+0OZNgbI/L9iUnI0MGbteUUnM0g8AbqZTzazxF79UC
X-Gm-Gg: AYBFou0GwbsEuFVw3s4R/n5dDDXjtuq5ImnCsLnHsxmnUBeAkb5LGE2NIfC61x0H6fT
	tvSlvc42Z5TcbutFAfzhghVlSc3MHSrfhFpbIeQG16Sk3oWaiU6Zd5Tx06n7L7mxnDoqX6Mf9yp
	+yuH1ATDKaDjFpGmD55qyOqg4SNK8MBimNapFWyK3C42UrQxva8Ftz26DbF/tchVPUEy09XVbAU
	jUQS0MrbWv3PMj/Nou1RRk945y7rFTZPvnT6ruURkxPrWNW3lwpFztZYdhQAe1AjYmTzYY0HQGc
	RgvZy5gQ0w8TrOrrNGWjrczwyFNKDiyjrFTg5Ykx/sMAYxzGVs8HQh5WhzWiYG2MahMVRdMj6Wk
	OfKildYlOQzKD6zuR2CBBeLTT8MVqN07CMfnuQbz8WCULNUgwH6jzFujKTRamuTHyBYlRwhyUzD
	qyWj1SIykdeHwF1GxJ0qXoXDSuVOr7QJN+zGQyxAbfge9/7Ywz3Shb/Wl1vttEvuaNLu1+qGIRd
	oSdEl+daMv3KvRf1YbZPmUgnP08B80uRvIcHdG7hHfisEkPMnQpk42TF2dRYZ8FolH8vRzluExx
	3Fovpk8Mt+INhRJlPqeDBGIm7hfmTgi1
X-Received: by 2002:a05:600c:8518:b0:49f:d325:9912 with SMTP id 5b1f17b1804b1-49ff06bcd79mr215836965e9.10.1790695069866;
        Tue, 29 Sep 2026 08:17:49 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:49 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ board variants
Date: Tue, 29 Sep 2026 17:17:30 +0200
Message-ID: <1e6f9e01bd9e0e0801b18ddc9eb44bde200ea984.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_081752_000234_218B577C 
X-CRM114-Status: GOOD (  11.56  )
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

Document VAR-SOM-6UL configurations on the Concerto and Symphony
carriers and DART-6UL configurations on VAR-6ULCustomBoard with
i.MX6ULZ.

The compatibles identify the SoM storage, wireless and audio options
followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Split the board binding by SoC and add separate VAR-SOM-6UL and
   DART-6UL entries for i.MX6ULZ.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 9b1224091e01..42d12624c1db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -944,6 +944,50 @@ properties:
           - const: fsl,imx6ull # This seems odd. Should be last?
           - const: fsl,imx6ulz
 
+      - description: i.MX6ULZ Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ulz
+          - const: fsl,imx6ull
+          - const: fsl,imx6ulz
+
+      - description: i.MX6ULZ Variscite VAR-SOM-6UL board variants
+        items:
+          - enum:
+              - variscite,var-som-imx6ulz-emmc-sd-card-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-symphony
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-symphony
+          - const: variscite,var-som-imx6ulz
+          - const: fsl,imx6ull
+          - const: fsl,imx6ulz
+
       - description: i.MX7S based Boards
         items:
           - enum:
-- 
2.47.3

