Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8356AFC9EFB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 13:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6wzaShk9EeMNa1XUsBArJvrMzEpjudqxehsDLFg0Ul8=; b=HqqmYqEC3eqpSmyN7AGDrYUT1C
	kRDC0ODgdF4SxnJu7aSm/RzIieWTKmd5jupygtN5BeSquhXATwnahDIlAogzgBbxu3+Lbf3Xtes2+
	7FSgoPnh0i/vjYXO8ve40F0VZzBQPN/WN/P//ECPGQFVfDZvkIL3E8IuyQriX4Z73MTZJ/AjNyO4Q
	eAb6iHPzLz/QQikIpoBUITgD3Jpf9o2nGRKtQ2osWBnJEHZC6kAAwHQ89xE8gY2nLHpz7UbVkh5fX
	FFy44mKdsbs58dHHo5Ok8k56x0ASte5w08epMof/7Ow/BQRbXOn0v30++sO03bZ4adhXOUqwFrUmq
	4SLl5N+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyrn7-00000005EQu-0Cz6;
	Sat, 07 Mar 2026 13:34:01 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyrn4-00000005EQ2-16Uq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 13:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6wzaShk9EeMNa1XUsBArJvrMzEpjudqxehsDLFg0Ul8=; b=QD7TN6/Kr1lA0jVILsKiMXXyVA
	wTya+6yK8NsRcVp+QOYzhfBxLMQnIZMKbNN8EZTyI2u2H1aFYndnIND+1V3+MKwmrgTqABbecy3gA
	DAVhhzraJ66fWGr5MfgtOANoOlb/S0q4ru8kIDZyXYDs81V1rcWJKsiWXRRfczn+Q+I/hDy6Yo+em
	fdIgXnmc1AykkuPLyyADHnoPIK4uNzLGaegSAeUtIrNzkKrGTvzrz3OLN33JwkRKdimfftIPdbnU3
	gk0ExEgL/82OKMGXddjevmScNELdcDZ5YqhDSUx+atzZtw5dx+kl0Ol0aZVf2lCH9jenVa2bTqWuI
	j4kZ+RSA==;
Received: from [122.175.9.182] (port=35204 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vyrmI-00000000qlU-3glV;
	Sat, 07 Mar 2026 08:33:11 -0500
From: Parvathi Pudi <parvathi@couthit.com>
To: nm@ti.com,
	vigneshr@ti.com,
	linux@armlinux.org.uk,
	ebiggers@kernel.org,
	ardb@kernel.org,
	khilman@baylibre.com,
	arnd@arndb.de,
	krzysztof.kozlowski@oss.qualcomm.com,
	kory.maincent@bootlin.com,
	parvathi@couthit.com,
	tiwai@suse.de,
	andreas@kemnade.info,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	twoerner@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	pratheesh@ti.com,
	j-rameshbabu@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	danishanwar@ti.com,
	m-malladi@ti.com,
	krishna@couthit.com,
	mohan@couthit.com,
	pmohan@couthit.com,
	basharath@couthit.com
Subject: [PATCH v2] arm: multi_v7_defconfig: Enable BRIDGE and DP83848_PHY for TI AM57xx, AM437x and AM335x
Date: Sat,  7 Mar 2026 19:02:13 +0530
Message-ID: <20260307133237.743059-1-parvathi@couthit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.couthit.com: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_053358_326903_6D045295 
X-CRM114-Status: UNSURE (   4.33  )
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

This patch enables BRIDGE and DP83848_PHY as kernel modules for AM57xx,
AM437x and AM335x SoCs. BRIDGE is to support STP/RSTP Switch mode using
PRU-ICSS which got recently merged and DP83848 PHY driver to support
TI TLK10X PHY.

Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c102c4acdd8f..037df0c9eb5e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -149,6 +149,7 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_MIP6=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_BRIDGE=m
 CONFIG_NET_DSA=m
 CONFIG_QRTR=m
 CONFIG_QRTR_SMD=m
@@ -289,6 +290,7 @@ CONFIG_ICPLUS_PHY=y
 CONFIG_MARVELL_PHY=y
 CONFIG_AT803X_PHY=y
 CONFIG_ROCKCHIP_PHY=y
+CONFIG_DP83848_PHY=m
 CONFIG_DP83867_PHY=y
 CONFIG_CAN_AT91=m
 CONFIG_CAN_FLEXCAN=m
-- 
2.43.0


