Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CEAC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mygCqG52MOTZCDbS1iPdG/pHdBU8ZwL7YdSu1sO2Bok=; b=r6xDyiAVofvJiWmsDOw7XsyATd
	a3dMI8+RihpFgZ8kkOaFk4E8ggu++vLC4V+EJPCr+N1iNCXI9Xa9YERm5pyjoTDEJu8+nuOk4aGHP
	vryil4J0Mh5oOnugAh09UpysAmvkxfxxRgtM7ghUCZRF9NwxmIo4nEtJy1j7eIjL21ElIkCR3peve
	3eichfLgwrfPChJzxjV2ujqpWuJSuWqI+bkOTfFHP0UArhMRRC8dUh8F7kDCQNrD2ii+6FOc472hN
	yVgxetSfYVuQRAM1QNRwIgHjv6RHwuy5Wcxn5CfanljJZjMh1V99Lu07Q6+0fq6kwOllkoz8Xq6hZ
	Om9pKTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsQI-00000005MMq-00Xf;
	Wed, 02 Apr 2025 07:22:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsC3-00000005JUU-26TU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:07:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAA7A5C659A;
	Wed,  2 Apr 2025 07:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38557C4CEEF;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577642;
	bh=3tZjvhGaCLGf/bfrh4i6DClZf6aQTuwis+UL4UaKZdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cpWgwRj+sL7vHXbJLHsQxegZVLSTRlXvj18n64tu8DQf58uzt2N0SnXe0n3bM/soO
	 eM59KL4TjK7JHt7LSew0j6ytRWv86X/YOBmF7p/6B4YuWhngMmsS+ledi+zz5OkdKF
	 IsZHLTBxrQv8qnVdfNjx/c+GBwLi/O8S48KImbBHNiwTmwSzJURCi4IEftt3tNrdqw
	 Fbs85T2LW2426H+2eo/N451adMrSdKvA0QoIfB8p9BLoie6D7k9tQ1GA9jK1kAS9BO
	 34SwmV1jjuDZ1RaGttSCxM+fj6LtwFchMBui+3gaQRs2B4CTuQDAQ/1Q/k1KvVoe2S
	 cg7ZEvyihz6UA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D680C36014;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 02 Apr 2025 09:07:07 +0200
Subject: [PATCH v4 4/9] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-initial_display-v4-4-9f898838a864@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743577640; l=784;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=Kodl+8kPIGsleRbs7jxCH5LW1v9NBKtCtLsNy8vvbV0=;
 b=COnYDITO8KLBM330+KlG1z4sWgqvpLjhbp6rySeWf1NXyACYSbRmrN+MS0nti86mEaSBaCFZQ
 rWus+T1FYIuCZ9h9Q4sLbSkC7jDIhAGDE/Wla6MLpa3+xXnBQUv/R3h
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_000723_887175_F1C71210 
X-CRM114-Status: UNSURE (   9.06  )
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
index 4b3864a9852f9fca2be48987d383c0671e668336..7d4fbfdaaac1776fc7c4a569f7ab667f0a485eab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10043,6 +10043,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
 
+GOCONTROLL MODULINE CONTROLLERS
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/*moduline*.dts*
+
 GOCONTROLL MODULINE MODULE SLOT
 M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained

-- 
2.49.0



