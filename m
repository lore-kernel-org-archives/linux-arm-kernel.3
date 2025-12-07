Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B1ED2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 13:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AqaDcIYopqJymCH+v/yQlWHflEEWC7+MbeKDTzONOW8=; b=0C5F1tIOPs9BJ2
	QaG/8f5Rf1dYJBw01ERULRGmTikCKpe21ETOMd+3UmUXegVdLk06wqZN62nvivh9mQV8oFL0nf7Hp
	OOK+FdRLTeI5ijejngGght2Zs62Ii739TNRjaLSHC1j9RgsnRRWpA4jkaHPK9HGqs+5mcO9jcVIz/
	CY9+GRtaXWT0OufLMJCpu85WjIEgoJu+BjnCrQnJz5ZIhDCxT5MxO5RbWXG5wXUlIaz8j24UBhozS
	fumLx+Deu0yA9ZXi1yR+APPTXqutvrNMC1xroL4udg5za0uVVFD3rGcPx+oZ7JxvIZ/jT3k6iXA0L
	qUJ55rOvCelnLTOyf3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSEmF-0000000Bxb6-39k8;
	Sun, 07 Dec 2025 13:26:15 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSEmC-0000000Bxa2-0gfZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Dec 2025 13:26:13 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7719A1A028C;
	Sun,  7 Dec 2025 14:26:08 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 471D21A02A5;
	Sun,  7 Dec 2025 14:26:08 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id 345181800321;
	Sun,  7 Dec 2025 05:26:07 -0800 (PST)
From: Lei Xu <lei.xu@nxp.com>
Subject: [PATCH 0/2] Add device tree support for NXP i.MX95 15x15 FRDM
 board
Date: Sun, 07 Dec 2025 05:26:04 -0800
Message-Id: <20251207-127-v1-0-5a2eeb69f150@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGyANWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwNzXUMjc12TVAtTU8NUi6SUxDQloMqCotS0zAqwKdGxtbUAtTz3FFU
 AAAA=
X-Change-ID: 20251207-127-4e8551e8bdaf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 justin.jiang@nxp.com, qijian.guo@nxp.com, lei.xu@nxp.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765113967; l=891;
 i=lei.xu@nxp.com; s=20251205; h=from:subject:message-id;
 bh=mAQMidlfAh7acQminBmYENG65UBBRhmk24mxnH67v8U=;
 b=6gOCQeJM99J4LOUxJfK/WHWpuJgWl5KrEnrG8KG2ytJv+Vsnt9J6SZm5G3loir4nnEKSJ/sHe
 DwEb19bhrZeDcxUzH6t09tdZ2cF9Q7sKnFt2S21bipXrhk2umNoVZD2
X-Developer-Key: i=lei.xu@nxp.com; a=ed25519;
 pk=faUN/3jfazJOPNYhE9pN+nzvk+lrEm64ZRf42Yeum6U=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_052612_344967_8F0D62F0 
X-CRM114-Status: UNSURE (   7.31  )
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

The NXP i.MX95 15x15 FRDM board is a compact and cost-effective
development board based on the i.MX95 applications processor.

This patch set adds device tree support for the board:
 - Patch 1 introduces the DT compatible string.
 - Patch 2 provides the complete device tree description.

Signed-off-by: Lei Xu <lei.xu@nxp.com>
---
Lei Xu (2):
      dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 FRDM board
      arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 955 +++++++++++++++++++++
 3 files changed, 957 insertions(+)
---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251207-127-4e8551e8bdaf

Best regards,
-- 
Lei Xu <lei.xu@nxp.com>


