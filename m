Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B04C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 06:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmhW1Fm3+iHJPGf1IIT8HBxj98nomqHbWz2xIa4Xm40=; b=em6JylO4bjjZMWalh5IBithwiV
	Lj3vRtx1i953qpX0jH/SrfLTy+Xgllgj4v3x/zJu5eDQxuwZJprQ/kMdKt91JJHA9zo5lW+6J1glE
	6kSykzbnElvXtKWdWonaQga54KnsyTj3GDAb8cjtJxN3i3Z5GspL8hVpZ72T6gtBbs2RWfCWFH4SK
	nV3JSiJUbJyS+eWGAI+OkFmwjJD8bUS2x5eXwqg6wO78k/GQN4BAsrD3JeLlRh/s5H6NN02dEyLpM
	w1wf++gFFT2CK3Rm+PZ1ssFzWOR/mE7vzhY3BFBZDeyM2yQ8vmqRWXgKWRCNSiYKDDWUZ1vsukXH5
	8iUQ03bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHGhM-0000000BkCL-1wsO;
	Tue, 20 May 2025 06:43:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHGYx-0000000BiV3-2emh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 06:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1ACAB5C4905;
	Tue, 20 May 2025 06:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3F40C4CEF6;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747722893;
	bh=gJf5CbBqH0C0nOOWFRC8Iyrhov631LfP4YHpR5pnMYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RkxY8uhPOQ8J1ybOy9dBN+MHzE8rX/A7vKvyvK29HB1X10MxVhvS/X8qvYYwRhe7v
	 RUhgyK3LGm2g4fxsYDHu3erbmUYXDmUK5tJPfMjTFHQETWkuK0KsgziImuf+C3Es2l
	 5cNQhzW7mBDiZvLusaFKVYtev5zPulSWH3gz41sh+gxQEbWIym5zzsYwCkIUxr1E7x
	 jJ60Vm/hksx+jRcP1L/wUGAmM4GSeXV3eyLoE4jiL2OT6EH8e8uP6vnFwQS+EtWXOj
	 ZWGKZEz4Bp38K7CRJNXc10Fgr9gYBbYykaCyjowogm+q7DWQ5b9JovdGcHaRYCjOtQ
	 8LkAt+TVF4hHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8985C54756;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 20 May 2025 08:34:52 +0200
Subject: [PATCH v7 3/8] MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81
 COM module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-initial_display-v7-3-a8f0195420aa@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747722892; l=931;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=45G3DurvF3CmLAxUTF3brxzwuPgV1THWsW5gIgc1doQ=;
 b=CQH12wu7IqT+OKtWWRDVwFeTbRfEnnoXottrYZk5jZy4PUIBsZMNrbe/XQMCICNMe358xVFaA
 vC9touukr82CtBc37Fo3d6fIqXnwgQxTkF/mSduGMTEgR46wxfYDt7a
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_233456_882148_D6F44697 
X-CRM114-Status: UNSURE (   9.92  )
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

Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
module bindings.

This support is not officially done by Ka-Ro electronics, if they at
some point will supporting mainline, this should be changed to them.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b5acf50fc6af4322dec0dad2169b46c6a1903e3c..1ca022081bcf564c8ec91fb6431570045495ec23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12779,6 +12779,12 @@ S:	Maintained
 F:	Documentation/hwmon/k8temp.rst
 F:	drivers/hwmon/k8temp.c
 
+KA-RO TX8P COM MODULE
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+
 KASAN
 M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 R:	Alexander Potapenko <glider@google.com>

-- 
2.49.0



