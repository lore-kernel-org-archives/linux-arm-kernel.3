Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01000D6B6B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 23:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SbWlkHet4fXP9lFl2lD6ycOmmj0PFUZzrw6kS0LFEug=; b=BCwugY4KiuTp9IHsc3AyDdaHcy
	UTY9r0YhaLyc19hZbpjL0iLGsOWU1w3RQ30RWwPYWxQJIb54uUNB5ntPmvsKgTiNBGSCU2h7xq9lH
	/k23ZvElNDS2lbOiEhqAisa3L+dezy/439WODrWYcjjvzkCKyLlLLNlI4pil6VrzFeSTbmsUg0vkH
	qPgWbxHwV+lTMqCzvc/LorxEjyohdAKaDtOgDHbcWUd8dNX1KPJ/F3U/OGEAPns/uvgbFYCdXHGZ5
	79kLLtule1FeOSTX28Dx70uE37ZLPouZeV+kBlx9o1nK2VcgF8H46FvcTQP9uS9e9AV1fp8jPwoKf
	nt7zKivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6IIl-000000024RO-1mlH;
	Wed, 30 Oct 2024 23:40:35 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6I6s-000000023Sd-2qaJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 23:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=SbWlkHet4fXP9lFl2lD6ycOmmj0PFUZzrw6kS0LFEug=; b=KVOmoll6AHbqhfSE/mpmM8HuHO
	+bLk3wedBks3wno9lzrogh/rOE3gStbXHDb6n+SkZYtD+j95xT/vXBydgOzCkoJUq04YqJSTGU1SV
	jDntm8wWs9URx4XZML4+FFxhovaePaLAQppdKPxzVObVpCcd6f359sB7J21xZHeM9jP817OsoBgEj
	l6XNHxDxRg4N945zf1yllwO4RiRKX5ixoJLS62kFFhG9WWA/Fasrta8ESAi9SAOHWdmu+PjhvtAfQ
	eFTAlGFgLKCo3Gri/9n5cGL5vzIuJDmRP1qp0ZfIodv6HYjmB0m9WTNK8xrj8QNGw8dQz3/1/1E0j
	a0DS8wAQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/3] ARM: dts: add Kobo Clara 2E
Date: Thu, 31 Oct 2024 00:27:43 +0100
Message-Id: <20241030232746.2644502-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_162818_771055_AAAF8F57 
X-CRM114-Status: UNSURE (   8.76  )
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

Add a basic device tree for the Kobo Clara 2E Ebook reader.
It is equipped with an i.MX6SLL SoC. EPDC PMIC drivers
are not ready for mainline yet.

Changes in V3:
- removed 30MegaOhm current sense resistor nonsense

Changes in V2:
- improved commit message about devices without binding

Andreas Kemnade (3):
  dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
  ARM: dts: imx: Add devicetree for Kobo Clara 2E
  ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E

 .../devicetree/bindings/arm/fsl.yaml          |   8 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../dts/nxp/imx/imx6sll-kobo-clara2e-a.dts    |  23 +
 .../dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    |  23 +
 .../nxp/imx/imx6sll-kobo-clara2e-common.dtsi  | 514 ++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig          |   2 +
 6 files changed, 572 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-common.dtsi

-- 
2.39.5


