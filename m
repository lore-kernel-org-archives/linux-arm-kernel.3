Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1973FD5CC91
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 23:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1dLRRt6Gpz+f3YNGF2cRhz0EDeBb4t+Te4s+RjcUeE=; b=0N3etazUKv0OgasRLK5e6Gxaq7
	DHfUzfgZHXODNbi9+zRbxr1IxP1RymoJ0V5aZ5CkffHweRX8LIbEC+n9nM+P1t0lNG+MZDHOnv+qg
	Crdnjfl7h1pBZ4OVNuDxr1XMi/GQtUxoKh2k9mGLqrNVonwJ3gQEfpED7pNfIiXVeNAYnkeg79eQQ
	FZokXfjebQLtH/v1fvpJSa41BaFELpYxZdPgiaYCtkX5J94PNg7UJOOHAGhg01ZP0jT0ckblPA4pC
	s0jbSu9igXx24Qh/93MOUjotduhSUv47kP7hoXIv/4AJFc9fdSVMDV7M7unYoTt2fJM5teZKK1Q14
	3TARlKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6IIk-000000024Qq-12n2;
	Wed, 30 Oct 2024 23:40:34 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6I6s-000000023SZ-2Thp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 23:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=A1dLRRt6Gpz+f3YNGF2cRhz0EDeBb4t+Te4s+RjcUeE=; b=MFOqAO6XqjGyvEm7AbuJN82usY
	sWvcCd1Q6neva+KTQ1AiEfgOtBadaU+TllYnrDqwmsK/nhylFD2DzvtTq1r2ImPIMKs3KOQshyNIh
	28ixTccW9GNKQ9PN5/Imb+fwC6Ct8mxF2136WwQtkRwR2hqOuUXsZ3gsFVibPO+xGcQpH2rte8AK5
	wLPf2UYlPvpI0RqQ94DeuSV6nh5V+M8GxZZ3z8mCykGcHwwpxTtolbCJ0coBHnjlz2NJmWRSPKf8s
	BfS32TcZKku51OVq4cpkYSd3zCi8kRSv1P46WHxKejRqlOnK1shgWMwu5bBRAzP+j0y1LchZFKouF
	6d1xJcvQ==;
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
Subject: [PATCH v3 3/3] ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E
Date: Thu, 31 Oct 2024 00:27:46 +0100
Message-Id: <20241030232746.2644502-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241030232746.2644502-1-andreas@kemnade.info>
References: <20241030232746.2644502-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_162818_649930_71F88258 
X-CRM114-Status: UNSURE (   8.03  )
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

Enable drivers used on Kobo Clara 2E

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/imx_v6_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 333ef55476a30..0beecdde55f58 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -68,6 +68,7 @@ CONFIG_BT=y
 CONFIG_BT_BNEP=m
 CONFIG_BT_HCIUART=y
 CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_NXPUART=m
 CONFIG_CFG80211=y
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=y
@@ -253,6 +254,7 @@ CONFIG_MFD_ROHM_BD71828=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_ANATOP=y
 CONFIG_REGULATOR_BD71815=y
+CONFIG_REGULATOR_BD71828=y
 CONFIG_REGULATOR_DA9052=y
 CONFIG_REGULATOR_DA9062=y
 CONFIG_REGULATOR_DA9063=y
-- 
2.39.5


