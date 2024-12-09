Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F12BE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pidFoaRCFLNCXxMi5OStRFsvI+2wukij/plJgYo5QZk=; b=VU0l5xBL04jBQ//13BH8Iici18
	zA3NY8EJE7Xm6ptXlxvt2CZ/gXz5tCLHbdu8R02/f2rG9J+NlW/i42iGItv5uzXXpP/bgM5cgU6bW
	4JFeQjg9FVemc5J1UO8rkL8EN4mqjvoINOCCSKnrzwJstV7UuaHA4u8YN+hgxmUgQYHETg1Dcjmr2
	FLx1Xz1pIgIR9FGV3iZPq6oYlO3SO9gz5UaHNQau0jd0vGxRZ7d5bfMGCv0t4LRYEBZIHUsIQNPMv
	CVUGShYcCmThHk+VMZzHShnAp8y7fjFzlXPrA5Yu0fybHzzRCMLqjL1v2U0aD+YW/KXvVF9B6eimd
	WnXKs8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYpB-00000006qU0-41Mh;
	Mon, 09 Dec 2024 08:09:01 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYiY-00000006oi6-2HwG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:02:11 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=EhZY/I7GA/HHyqXbJkfc0YlaLFMF5FikenFIcoZatxtR/t4RT/I9pXJJSiXNG528ixo3Xbmq5+gRdAuIowkKGTskbYLEBCNQCvm1RE1e2iDr8oBQAyD6weyhAYkQrSSM4nQdfbvYJKrKyZKasRuwxLJbPtqwuJqrFVQ7xKij+GLIG9ovLB5/tpg5zlV8JKboirUzsmLwyEMXqNZEbtm6iRBWsUwAf5P6oupciGWLn2I34x3lQT+Um+ACWNZjma2MGbb975AMvHuknre+knvd1vu5k3Ubzfz4qSCqmC5HTDgtF8JtjgzwtASeL6pFHZcgdIUOR3wC7Vu036tKqH5dZQ==; s=purelymail2; d=purelymail.com; v=1; bh=dv0IEtlj/sb10b0r+vjTZHiEAwycDAr94Z3JrfrRY0g=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1477585645;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 09 Dec 2024 08:01:16 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v7 3/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
Date: Mon,  9 Dec 2024 08:00:58 +0000
Message-ID: <20241209080059.11891-4-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209080059.11891-1-umer.uddin@mentallysanemainliners.org>
References: <20241209080059.11891-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_000210_659399_7DA2D39A 
X-CRM114-Status: GOOD (  12.90  )
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

Add initial support for the Samsung Galaxy S20 5G (x1s/SM-G981B)
phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
has only one configuration with 12GB of RAM and 128GB of UFS 3.0 storage.

This device tree adds support for the following:

- SimpleFB
- 12GB RAM
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile          |  1 +
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts | 28 ++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exyn=
os/Makefile
index 948a2c6cb..fe47aafcd 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -10,5 +10,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
 =09exynos8895-dreamlte.dtb=09=09\
 =09exynos990-c1s.dtb=09=09\
 =09exynos990-r8s.dtb               \
+=09exynos990-x1s.dtb=09=09\
 =09exynosautov9-sadk.dtb=09=09\
 =09exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s.dts b/arch/arm64/boot=
/dts/exynos/exynos990-x1s.dts
new file mode 100644
index 000000000..1ae881015
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 5G (x1s/SM-G981B) device tree source
+ *
+ * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos990-x1s-common.dtsi"
+
+/ {
+=09#address-cells =3D <2>;
+=09#size-cells =3D <2>;
+
+=09model =3D "Samsung Galaxy S20 5G";
+=09compatible =3D "samsung,x1s", "samsung,exynos990";
+
+=09memory@80000000 {
+=09=09device_type =3D "memory";
+=09=09reg =3D <0x0 0x80000000 0x0 0x3ab00000>,
+=09=09      /* Memory hole */
+=09=09      <0x0 0xc1200000 0x0 0x1ee00000>,
+=09=09      /* Memory hole */
+=09=09      <0x0 0xe1900000 0x0 0x1e700000>,
+=09=09      /* Memory hole */
+=09=09      <0x8 0x80000000 0x2 0x7e800000>;
+=09};
+};
--=20
2.43.0


