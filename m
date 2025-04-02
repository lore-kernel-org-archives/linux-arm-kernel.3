Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B56C36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TB0v5oTPXq5mVQhsUWEN/m3b5HGCKuNc/ZDqX0OG1o=; b=qvfqQgz75iJBwsZMl4NgFA8d2L
	efp52pRS5Sm2k9RIfYn9TWaf4GgAHLy0TeLcK52LuosO7Nu6Bs4uYCBxs1EoEF91kgBzXjPu1XnHF
	VaIT4X21ORPd0WgPDc1eaxbI+SpMI7U9eaOXnoux9ocBoqgmW1fyF5qIPJCvViKUl5ksY/uDh/NO5
	Ni5cVDjVjAeORGr6adQ4xjZbgpktiznkvLVJWfFzHMthH0H5va3ABAdWSyH/dJxwmcPvpyw2uk7r6
	6T9SwBh4f41b0TKQH+un1GRzb9w1/OjewpYOrZfdCFp7zWF55Dx0zARXGLvAmhZPyljP+nNoBL7cQ
	/DbDcCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsTj-00000005Mjj-2MgV;
	Wed, 02 Apr 2025 07:25:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsC3-00000005JUS-2mKg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:07:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 336D2445E3;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CD24C4CEED;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577642;
	bh=4IGWq8kONdx8Xhp5mZ3r2W3pZwmJWa0C5jGrABb7mW4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e/O3E6mhp8oO/Whi3xEfGWjfINj0VVWR6e4dyBthDZK8g1xxzbzn1ArffFD95wqBz
	 Lh7oZJV6JMFmgwitevdLz6W9es9LYg3xhHJaJ9Hx7e/is7mvv1lVaBWWP82vqTvpTP
	 JO0YlhwXeQRq8aEnCOHxBJsE+oJXXc1B9OEDprJ1vMZ8TlPJ6vvYPQnCgzIIvkLDeX
	 8soBim5zvmzKE/1Y6N9jeJ3lU1y5p9NaZnfTsROIh7ZnsWuv/FyvCvPIdSaISbNnL+
	 zmbCDGmBElyUEDLGBISTuERqixX4taQ0BmbEiJrIdi2bK+jtnyukzTNjp7E4nyKryF
	 a9HqhzRTVEzrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85145C28B20;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 02 Apr 2025 09:07:12 +0200
Subject: [PATCH v4 9/9] arm64: dts: Add Moduline Display boards to Makefile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-initial_display-v4-9-9f898838a864@gocontroll.com>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
In-Reply-To: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743577640; l=1452;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=DJFfIfqgbp2F9LatQLx7SmTKtl83KZxKW6du5QHFG4A=;
 b=cbWzSnDPRBr6SF0lOfGsuCU7LN31OqgF6hAzRq2l87Li8zvGVzMru0KBDKDLoTk6lJ6pcKcKy
 KcRSnLuEavVDtTFtFBq9aZTwAtJr18VtCPlBa3VhTsduAw3FFmLjfD2
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_000723_877434_D604E968 
X-CRM114-Status: UNSURE (   8.25  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Add the new Moduline Display boards to the Makefile to allow building
them.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d621234ab84353165d20af9d2536f839..fea25c7f997cda9aef73cd643f0f0279ee0bfffe 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -214,6 +214,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
+imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
+	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
+imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
+	imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb

-- 
2.49.0



