Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCF5C5479B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 06:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeoSQl2FLdGTN2XQXHvy2Yf+6ASS0TB+E/t2YCPe3wg=; b=HEMAWhF1/GYFT5zFXJpJ5C8bt2
	9f+Hog2/0QFi0hN3b5wCdMB4o/w0kJ8RVPvmcRu0vvd3f1e/Lzu9bND4BnvUlrcEy7N60KZE/2Px1
	J3vTFYYdYC3OXUhyBBiJDSzzG9Zg7xqBHxJJ1jT9IKtaxKh2cWEMfbifd3X8VziQPyG51Mr6ESk42
	r0UFTKlb7WkdMexxYXkU+MK4nUMFsWjPA+dcjbCjjZuu81gjsl9doq3JgRl5Lz9KhRSXjhfQF0NEQ
	q8cfXQLHClY5n1dTes9rEXwkLx51GaPcJLlxzlz0XycobR80j/BZ2tgOnMpx6v2Y+Xoyw6ogQlfOa
	58Xo8fPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHGjT-0000000Bl2e-0qfw;
	Tue, 20 May 2025 06:45:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHGYx-0000000BiUm-2AkY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 06:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2336E4ABD0;
	Tue, 20 May 2025 06:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9B10C4CEFB;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747722893;
	bh=hrPSQeENU4uIDE2eHQ2o1WCsLDaulSSH1VdJmPvBaVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KYrlOubLTtWEKp3nK4GvBlLlpKSvaRb4kEyXhAiyIhnItmSizBr5PJSUNT/ja7Ftc
	 Pf3JG+ahEnUfvAPunaJbK3vuy002SyM3b0YVZ0FWRtxztyMzfFZ3p/5tX6RhFQGYe3
	 JjGkoi//m72QB7QrmBvjPSpEZJkVicSJWrKLbNyYX6uhmQT5cJrhQYhu9biuHPIVH0
	 bPjxyte78hKxToOSBylLOqOHgTJLucZfhOJ3NJDdMHYBaut4Q9pz/QzJ02FCQooppe
	 c9GT9xGhqJAqWQF/r6Qz7ABFKGFCE2gLopnD68+U+LJP7A8omnRvJGP9LI/Prok3Xz
	 WmLHJx/EGo5nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA63C54795;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 20 May 2025 08:34:53 +0200
Subject: [PATCH v7 4/8] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-initial_display-v7-4-a8f0195420aa@gocontroll.com>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
In-Reply-To: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747722892; l=777;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=U+cI301uttTYTg6gAR1QRerlXekISKPf4H+SFf8T4EI=;
 b=D4YE+tIA9ZZ295A2GbcFzNfA3FSfuW5DeNokNapeQ19ChCsTyMr7pDhFqJsa8wlsJrrmIHxJX
 m2z8fLN9QIfCCWgDghBhUEsFs+z8lQrihxWVIx7NTpOCAFjU4+J6nsm
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_233456_114615_4B765F82 
X-CRM114-Status: UNSURE (   9.17  )
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

Add a maintainer for the GOcontroll Moduline series of controllers.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ca022081bcf564c8ec91fb6431570045495ec23..3c94e530d0784d90b50109d4f9e7e6ced40f08b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10060,6 +10060,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
 
+GOCONTROLL MODULINE CONTROLLERS
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/*moduline*.dts*
+
 GOCONTROLL MODULINE MODULE SLOT
 M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained

-- 
2.49.0



