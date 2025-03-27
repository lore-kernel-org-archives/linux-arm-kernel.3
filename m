Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1D6C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJJ/xOiKOsAfM23bG3je3fBqNrbCc/xMCDBl0aHmxqI=; b=FA2CUsC8hKjx/sv7Lyuc1C/iRX
	p3GDmKO2x1MUU6p205G558Gk2Uh4NEVbbD43I1SV8wO+0cHITQWoiMZamKrJDuhYZXJJ577SM3V5F
	/MLQKTG9np7T0rpGx2teXfcO67k4MD6qOyUnjZK4GlX2um1asitShDgMC5GSmVWkuov/5Br93LSqO
	Fkh0K4v1jpJNS/qtN0gXubg5uSqO9JNQbHIuGf1ky2Yy9V/xNi8jRRshSZUUVbgDtv9CvWtenuWUy
	2QeZ4rRJH97AZmCP4mGIJ5YjIlRj6Qj5+p3b4EeKvrQMmlfUUr0A/38Vmx+nI/guE1CJdvAk6dc2a
	dOEGnDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpcE-0000000BR93-2KYd;
	Thu, 27 Mar 2025 15:57:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpX6-0000000BQD5-1SDo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 15:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EC7E614C5;
	Thu, 27 Mar 2025 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26219C4CEEE;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743090759;
	bh=92utogQMcwhyWlhaiUB3hy+r80GTGj6Hs9VRyEAjh0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XCpSSHb3NdcgaiFzTSYONFfwnr4wvcqNw2EgU5/lLW1d8sMWo8LFjHQq+j5mTklcT
	 eGqFy+02XgezExvtefCnk42WN5NS0XzAh9L3wOanBTgQRvXPM7s3BflyxHsuQ1Vj8P
	 V4C2ucDMbMfFjls4+AksTu/0loCn4MLlT6jJYK1eoIM24ZRRzvs9GB0pBPR3o2XjHz
	 fWAj02nz3Vrp7QPLBka3jIC4n/R7kjiFxYYXna+0YgoOCVk5lSJP+hl4hS6bCeoi2n
	 8ty5Jm29454FbypCwoeh1jv2632c/wSnKahd+DbZMOnWy2Nm2/dizAondPyjaqdPHH
	 6WapKyQZ4IBjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F32C36011;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 27 Mar 2025 16:52:38 +0100
Subject: [PATCH v3 3/8] MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81
 COM module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-initial_display-v3-3-4e89ea1676ab@gocontroll.com>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
In-Reply-To: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743090757; l=938;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=KWBmWJYZAEU0seHj0jSXyh4vIhNFeNg5DppjC874JB8=;
 b=q/UBBL+LYJA5pcGDSuTQs40AloieOXHbAumcVf25yCzVjg/H2s2t+1xoMynKT5f2gRuEDJ5Xy
 n1+YUlByj8yCbS1MwzsKrs77zpdgVDBOHmJgkbaqCwiUoY7+lAGBD7+
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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

Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
module bindings.

This support is not officially done by Ka-Ro electronics, if they at
some point will supporting mainline, this should be changed to them.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..f8ad2c1023016d7f72cccff880e3753d71d635b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12752,6 +12752,12 @@ S:	Maintained
 F:	Documentation/hwmon/k8temp.rst
 F:	drivers/hwmon/k8temp.c
 
+KA-RO TX8P COM MODULE
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+
 KASAN
 M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 R:	Alexander Potapenko <glider@google.com>

-- 
2.49.0



