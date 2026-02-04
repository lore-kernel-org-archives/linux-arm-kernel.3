Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78086E9D417
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtnPblNidasHdzF3fCc40f6SCufCocsQtBk3FA5AuTQ=; b=fNnzdGr0wfbSwGuCvO4Vv6NEQm
	6xGvOFZahMdRXC3YtqChdBDU80VyzKEesm5FkJFhWMqbjg0wCUhKb5Rbz9waVKJYSybikjRgLL9uz
	pna6l7/P5AOaOI83DL0ohc1YToldUyJ4zvYW/Kl8kKTO+MIuY14CQ1RUB3ti0ShNvdGGlsgygg/lR
	tGoNIa+qlKv1SbwKd317qhv2WWB35RkmgO+6moGjz0iMCT6yJbJJZfDLKKs9wZOHhwdvC4jcGOV7L
	cxYb0kWh1YejWNabN/zWCZmqs4nyKOZQSnoNjKvY6bkmjQNMuluvJCGjljNafHcGTREVktYm5Sz78
	1QsdaoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngJv-00000008p3C-09sk;
	Wed, 04 Feb 2026 17:05:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngJt-00000008p26-0xbq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Feb 2026 17:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vtnPblNidasHdzF3fCc40f6SCufCocsQtBk3FA5AuTQ=; b=cNtDziMibHJ/XYoXae04gQuota
	0b0fuUOmaO4bxO0uOLMSGOKb801GqxyikhpSs958/CARoJlKw3wWtwu2t5/M1p6atCOraHXT5MwMx
	B+tNbuWPFvwQsaTtLcURiE/I1o/S/Q4iLj8Ji+gDeicYdYayMniW9PSfRqSKs6bBWuvkYnEjKwlqI
	ToQquHhKpf0BU7xF+Sv/q7w0Dh+OEx7yulwoSv3EoEp4uJB85aJ01TrHFuT9kIaNG8wIa3lTWhjta
	kuyhIBfaR3WbW+1ucGuJ4XpENxGpnG0DzxfPIK55Lj7KoVRAvUAjlPQgOq/bKT5WggeMzSp09dit5
	yQapaoXg==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngJp-00000000x70-3Mgy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 17:05:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso193815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 09:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770224731; x=1770829531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtnPblNidasHdzF3fCc40f6SCufCocsQtBk3FA5AuTQ=;
        b=fBTkw1xUmAw2zXm5coyCvk4vk9kfwg8b8hruov3SQeYBqeUp0qZS5jNmP78f/wboQk
         0uDuyGgnlDUZp0lSangr4k7mUy9xP+HBuAj1Su1j+TlFgm8WQtHs1NFiF/wD3+ueZhfR
         ha/kgKSYQ2JRU76beK0klQ43Nk5BOnvcw+f+SpOAdvrtpZFFyMOlAlx5lxN8jJDLpXkD
         BPYWqTa0QNZKGyQlyflGUoajEFErHu1T9N3cZ7aV5zfVIZySxi80/TQ1rlttxaiuP87G
         fcBb76mM6xie3tdaJdpGwDuoDNjbPnleZBmxMuF6d2f+CjhfM3zwVAYX2dgqK2+bDiir
         5XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224731; x=1770829531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vtnPblNidasHdzF3fCc40f6SCufCocsQtBk3FA5AuTQ=;
        b=FBp1GzWhSk2kmPhqoiAb6jHcBwsul3+nDYQtZmOIpMHP+KduhmRst70cUEUVYkVHmH
         LGNknCdo7VQLu+1l8cTEf6YmoT6cpxQD0/Zs1n+aI3184MyUjHvCrOZSY+ZJRr1qACvE
         n0NthVuiqGUL4kL0NBunILcxrwCtP3nRplh1qmmJtTPXkieIwOsP1D4Dv8oMN4ridRI1
         2/xp3kmGMMyQeUWuba11lNuIJuj9phb9QFifBmw5VrZDtkWJr+UFU030sLNtn0Sr1hIU
         K18W5V6DGK9oy8u09OXgyFPrm/y3bCSWpVi5F/yDhFO849Axa2QATgI11wQv41iD6l9q
         2pAw==
X-Forwarded-Encrypted: i=1; AJvYcCUVYgZ48vsJhsv0EKbJOdzg6vOoctQwA68N2t7Ff9XZ71aZF20+ZbfcriERirE35b0pFPDeA7QEO8RBZ3+QA//Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwjzZbjY6kTTx6GpuVblpDw+Kk5t8E6d4EP54ENgzMLUGFv2dWK
	lM2/DxfWNKmtNutaZmp5nS/iDNPzp/w25F2eksELiXiKBMt9iHASqiCt
X-Gm-Gg: AZuq6aJIL8mlTDY/vMXmlmKME8exojBNu9UaRoUwjGH/erG5ktvnh2U76FHlQhpzoP8
	RY5I6QNGYShRs4PC3AB7dq3O4i0G9qdVuX71P5cfLnHYxwrNXfl3bZ1uArymGDiTx7QjJneytDy
	Ijpvt/3oScGVhTxlA3P5x7bXA5XeWZnZW++UlzMY5dwE9OCa2jJ9qcYPYz4ZJIqw4w8YOAEBLQA
	Z3j4rt1hZP+YpguGiBC9Dp7uY67UhGkQbT661E8P8Lr09oQ/HNzdOCzHMYES8oKxgtn0Ekm6KpK
	1VoeVh8jwI3zzjVemMRitRGVn80Q/eF7vEMbvEGjVvQNFXm5pKKL0Vf7gKodbwQ1hTv267Y9q6R
	o+s65fEi5nVOyrq7tLtZD74p9s5aaCyck8ti91X2oOhBQg2xWBtOhiMIUzbon/slVFZUSH2E72y
	mj67I5wdo339Ew4Of7iA20j6cQAkFPZT+XQ95RAwmO/txtTjnCP9Dkd3ZhMPKn2uL8sNbLtgF/j
	RpIKPUAZqmNO/+5Cw4C4ZBwDbYcuWXTNh94ZUo=
X-Received: by 2002:a05:600c:a088:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-4830e98388dmr42262415e9.34.1770224731449;
        Wed, 04 Feb 2026 09:05:31 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec10011sm38044465e9.0.2026.02.04.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:05:31 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	maudspierings@gocontroll.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
Date: Wed,  4 Feb 2026 18:03:54 +0100
Message-ID: <20260204170356.35169-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204170356.35169-1-stefano.r@variscite.com>
References: <20260204170356.35169-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_170534_111349_1D8D95EE 
X-CRM114-Status: UNSURE (   9.09  )
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

Add DT compatible strings for Variscite DART-MX91 SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 336669e16d7a..4c200a67600e 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1524,6 +1524,12 @@ properties:
           - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
           - const: fsl,imx93
 
+      - description: Variscite DART-MX91 based boards
+        items:
+          - const: variscite,var-dart-mx91-sonata # Variscite DART-MX91 on Sonata Development Board
+          - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
+          - const: fsl,imx91
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3


