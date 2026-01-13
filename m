Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A07D2F326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TBIjrv4Y8OCNFBCu4sCpO8dv9dAjBKgPmh8xrmvTw4k=; b=I/rBW7/sF2lQW7
	40a6HzZGFvCzdK7J5QgG7STsEquszY5hySdV7dZ9Er89ZqD0JpCB5diYLKZvpE4Yjkh6wh4BQrVa2
	bVmpmm8HekrR5whu3e5hIXCk+gBTbYzKJ3M0d2stt8EQJl+f3S+85UJ/0zOh51O8A1df5MuDYCATE
	QR46bkQIGuMR36rgNR/6zWuuw8c1PMBB+onryosdOEu28xPDigEXf7pUgsbR3FtyzRe+M8NYRDWQv
	gh1qY3IzNgHfxLChJSgEGA7hTKpmgJ3e4zqk0Ao/hYjYbAfTlMbI97Wvn2WGVKITbPlPw+OzMQZ0W
	FDF1tyVOsm6c0F6nmORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgOg-00000007OCt-3AXE;
	Tue, 13 Jan 2026 15:33:30 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgOb-00000007O9z-1pSQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=TBIjrv4Y8OCNFBCu4sCpO8dv9dAjBKgPmh8xrmvTw4k=; b=CqykJfQAMzzxW08XAMUVqzuQd/
	dXeHErJk8dedGFD3st4JDdDkPr0WhUw8QajWMph/fr+cElv98NIcffLsu9o8BD/ZR8hx6n8mAVrsk
	eJObhJaU6hIey5iDdBkG4hmPZb93FCNC0mgz2Sqyqox3phEdoAA7EQMm8orI4IOpTNVaIrQlj2rHB
	xYk3FavNqgyJwouerKTB9nvin2dS7ufexoiysNfz6y5tZdcuKAPstEf2OzIMLsMqe2UZc75QP8pL5
	JMhWAHzFXkyCrdMeBAn3qKdrzY/RGlRjwNRKrefO95ydJdNp91RmEhPV3EygYAr4Ka15qEQ325Kj5
	tQR9uZcQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/3] ARM: dts: imx: wire up the TPS65185 for various
 ereaders
Date: Tue, 13 Jan 2026 16:31:33 +0100
Message-Id: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVlZmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nj3ZKCYjNTQwtT3ZQS3dTUFHOTRAMLS1ODZCWgjoKi1LTMCrBp0bG
 1tQATdF29XQAAAA==
X-Change-ID: 20260113-tps65185-dt-eed74a08950c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>, Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=bBc+mfqKr3uL9dadx2ba1PgNMN8oNbSq2rlIFExQJKo=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJlpqU3yv37qTa68uEWQI5J7o1t1+m6W9NL1J+Vfp669e
 sD4peimjlIWBjEuBlkxRZZf1gpun1Se5QZPjbCHmcPKBDKEgYtTACayvoPhf0yRbOw8E+XEjM/M
 ucWtNkuyNcO+vSqwbtilJzz5iMkyCUaGz3vvsMvGbRaLOK5srxY8L49ZyFb607d/6kYPW3e99Fn
 LDwA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_073325_480025_784B8417 
X-CRM114-Status: UNSURE (   7.33  )
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

As the driver is now upstream, wire it up for various ebook readers
containing imx6sl/6sll/50 SoCs.

The driver for the EPD itself (not included) still needs polishing
which would be the consumer for these regulators.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (2):
      ARM: dts: imx: tolino-shine2: add tps65185
      ARM: dts: imx: e60k02: add tps65185

Josua Mayer (1):
      ARM: dts: imx50-kobo-aura: add epd pmic description

 arch/arm/boot/dts/nxp/imx/e60k02.dtsi              | 35 ++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts      | 60 +++++++++++++++++++++-
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    | 55 +++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts | 26 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts | 26 ++++++++++
 5 files changed, 199 insertions(+), 3 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260113-tps65185-dt-eed74a08950c

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


