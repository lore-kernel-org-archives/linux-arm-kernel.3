Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9534C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nb+uumKIAlcQT03N8XP/zmijiZ83zsuKYhUq6ru23a8=; b=BEsS1qFhJwqLOHq4rTcAC7jP7l
	taDgaxeC4fTLpQOXNZvNI1+G8AEqTEArKrny193H5VAVkns4tx1fWmanaKM4O1RdGVOUB7G5VjBAi
	Fn5ydahzH66DrGMGVEjDbRFsP/87rox9q/oJKXa8GH7GNl8RzDAVOCi/VYOqt/lPdMnBAq+ISb0IS
	vDjr1jUoJri95+DD47zDxKoF3yAV+j6YYZzofJpb/BcxpuE70+l0o6tgLo39ObZaoAPYBgR201IN1
	OPkPEoHId7gmroO+AfYFRKkFVrR35fIoMtE6LUNbeuvwvpwiwEwOZlj6ju/nneTcK9VKOWXzBlsr8
	mMz/2bTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx41C-00000005zGK-3TUT;
	Tue, 25 Mar 2025 13:08:34 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2vD-00000005iDY-3X4I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:58:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97F9D102EBA43;
	Tue, 25 Mar 2025 12:58:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742903897; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Nb+uumKIAlcQT03N8XP/zmijiZ83zsuKYhUq6ru23a8=;
	b=hE9L4sZcZzz9FzHmEBdosqshpQdnTj6W+zRWPlaT00yc64jvRwPQ/olH5eIdJ8kR6wUrcC
	LWNxVQGxsOs2ba95HFP2LKKWf9vcYHbYp6IWi8HTOw6eKAlpsySTTQaV000hiPzZMdiskr
	jVyKTtAIuU8JfmsZL5Jf46JJ0y7aRXuSdxhniMd+3mI6DmDRb9AH8UdmZwXToI4b10wsPp
	wbp4bU1ejZmpw7pG1l/Pb+n1iR9M8XPm+Cin3OTPj9gbE3i4ugBN3UU2AmFpLZhZwE2qCt
	J7i3VWbs308Sl3qPCSXdJcIA0sJjCYmYZmcj8THMaTbnC8K1UHduDCQKWBfucA==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	davem@davemloft.net,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH 1/5] MAINTAINERS: Add myself as the MTIP L2 switch maintainer (IMX SoCs: imx287)
Date: Tue, 25 Mar 2025 12:57:32 +0100
Message-Id: <20250325115736.1732721-2-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325115736.1732721-1-lukma@denx.de>
References: <20250325115736.1732721-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_045820_020883_D9791F78 
X-CRM114-Status: UNSURE (   8.73  )
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

Add myself as a maintainer for this particular network driver.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5959513a7359..255edd825fa1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9270,6 +9270,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
 F:	drivers/i2c/busses/i2c-mpc.c
 
+FREESCALE MTIP ETHERNET SWITCH DRIVER
+M:	Lukasz Majewski <lukma@denx.de>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/fec,mtip-switch.yaml
+F:	drivers/net/ethernet/freescale/mtipsw/*
+
 FREESCALE QORIQ DPAA ETHERNET DRIVER
 M:	Madalin Bucur <madalin.bucur@nxp.com>
 L:	netdev@vger.kernel.org
-- 
2.39.5


