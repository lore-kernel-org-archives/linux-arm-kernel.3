Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665B5C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMXF+e6dz6AQNMTpMZjafjUojKkWdq8R1RecLLKSSqQ=; b=tsw9g9Qg5SEWOE4n1RR87iqGlh
	Tui+u0dOppmTKmOti/1KU3NkZbyNM9GbN8HJiN6nIEWC6W6g/+vc2KlsszcMHy9MOf5K0Llzy8fRa
	SREWwBPHsPv33pwVGLH+u+5s/bFsOYVC4hHljObqThhQbb/HOvuir7pNBZd04rwHTkZgpF9B15EF3
	pi3y4hhYmclDCzkUljhXXQa/hfdXSkkUZrZbdQqwH/e0bI1dVnAvJxjRlACDqC6bJJalJ+3idCuRP
	eBopFMdg7p8+4oVORYhw4u69JrvE/I+wqoYmdOhe8lBUvQe/qOoB86MGUXtXicEuc8Xuujev9Nbbf
	rC+GpcTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0xS-00000007R5X-3GuH;
	Wed, 29 Jul 2026 09:52:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0xE-00000007Qy7-46zK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 09:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PMXF+e6dz6AQNMTpMZjafjUojKkWdq8R1RecLLKSSqQ=; b=WOovuxka2P1e2BdVQTUrsdEi97
	WAse2wK2u0sZu7R8cimyBlrv6Eq87JT5JOxCbMTbu2anXt1OVA/KwzvFi2RgS0tpRUFXjP+ZO/nkm
	9XU3R9mi7V0HgsZeCjnEKUFO63EYxWknyIJW1KIeePJoR2+QOnYaZIcPdt5Ux+DsE9gea71XfZmWv
	dEYizTu/wp6PzgL2qiA+SffdEJ6s7lkTegfgC+ysZpujiQsDNbmnBBbLCdYlhkcKLgkkYuAzq5r58
	+kC0qcuYSPJV0g3z9i8I59RHTxLIurAS4e1qOhx0nM0JQ2rW+UJCxd38JL+TY3rPZwhQdwvZSUp3S
	iszbeLoA==;
Received: from mail-japanwestazhn15010019.outbound.protection.outlook.com ([52.102.194.19] helo=OS0P286CU011.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp0xA-00000005dyw-20Ll
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 09:51:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RH/RSyADi4Gtk1x8zbNle79A5j+o/RF5WHpF1d/cuNaPNcuXlcChaZ8jTiBia/hniblaMN4LxBLhrpaqMFCGAcooozG0VGwS2D9gkyLWhZ7iFrYcIk10nuuAG3/YziZrQJNKV5qs8C7cwUpmKsK+vgZHivbO4+pbb4oPfz5eMLlFnJpWcR51HNM65SBLFLziDNHOeFM1sRW5mh//Q9bJa1OsC/hVa78WRNd+48F72FWtdwdlgiBtLOA+XwpMWB5rTKLg0EPQGztvnT5NmdHjjZCGHc1wPRsQ/j52nHV7UCHfsvn71qG1Nuu/qx25opTpU7nxiPUFHhYRlqH77sWvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMXF+e6dz6AQNMTpMZjafjUojKkWdq8R1RecLLKSSqQ=;
 b=Aau+71GTqovFlY5JIG+s9f60dU2RH+ydKNWr3zFKOfUDSgMJseoXNrIimMegLRR74nDwHZHAoI5tr6MsAAKUUqjz0kdGvJLHD8XoVo8dU4EqIWNCVK7xr3NPstlsZYXPNvIHfje/B0csSSc0I5U3PVAmUlBuJLK1WG7ZbxJRY4njw3Gd4PlDm85g9ljwpTRfVKjAHl6DScpQIJGOJuG6x+vKQc6M5rnYkM0pjGwoUz2QlScJGkuRwsTZ7pNwDSwTb/FjsOQ05LVxa+ue4ydbstY2IJ9TUbsw7UZtLnE0YxKVvpMB6yOFPforMZSt0933KqUeQOWKIuZh08q7DRng3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=altera.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMXF+e6dz6AQNMTpMZjafjUojKkWdq8R1RecLLKSSqQ=;
 b=mY+cK71mBbd7BNBDXpgai924UU1ftPZfKyqo7IDcB3TkZ+vQI/MrXdz0PdIiViFZm4JMLAhX6L2mcpcBK41cQRjRhzW0FUDmAjqO8KgTts0krj4B/UStmsmeF3pbrmw4Q8xB4j9L2iRcSQmH5Z8KIDPJbPf84VD5M2Fp+pEYGz0=
Received: from TY6P286CA0040.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:3b7::9)
 by OS3PR01MB8116.jpnprd01.prod.outlook.com (2603:1096:604:172::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 09:51:38 +0000
Received: from TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7:cafe::60) by TY6P286CA0040.outlook.office365.com
 (2603:1096:405:3b7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 09:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD9.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Wed, 29 Jul 2026 09:51:38 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.40])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id A7980300041D;
	Wed, 29 Jul 2026 18:51:30 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	jun.ann.lai@intel.com,
	yi.fang.gan@intel.com,
	boon.khai.ng@altera.com,
	matthew.gerlach@altera.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net 2/5] net: stmmac: Enable double VLAN processing only when supported
Date: Wed, 29 Jul 2026 09:51:06 +0000
Message-ID: <20260729095110.164157-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729095110.164157-1-ovidiu.panait.rb@renesas.com>
References: <20260729095110.164157-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD9:EE_|OS3PR01MB8116:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e92bf1e7-3481-4d93-8b86-08deed56fbf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|23010399003|36860700016|376014|7416014|82310400026|1800799024|921020|56012099006|11063799006|10067099003|22082099003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info: QomMmHFqxxbYy8vmsSCDPgKMW7wq3PP/MTHIFCW+y67YGVxhhAaAWsFhA1RZWXUYtHgqvI3uloGv8c687Y0ElJAbLTsSaQ6mDxl8lW3dnl0C3oEUK17hbeSv8zwhUMoYh76W2q65qBOxe0HJ+wTgon5GYDXsRgu9N5iRzrK7zqpgWEbdzD9NHlACfwV+yhL3weJdebaCcl+sGg/2s0zd0Nr/73s1aoEu06LGxzPGAclZTvQm3ZTxzMnPfhjjFc4jWX5gRX+EKzliLEYB0NawTWYJi5Djw4aULaDaJek00lsyNeCj/tm9v6tbIth53S3j8AE9R86LriUKVgI0eR0LyOsqNQXoDh0OsHjZBQOnN1Mt1tQMxvKY9b06B+mZsSbX891sYovjUEQoKNIxtcSgo+A03JplNxZzdjgJu6Y5G6IvyAyLmxUqzVO7jyA0A2gIQHUblhraNU2OcDfav0tipZkGN0aFx/bJ1bZJ+f1zkWxodH7wTGBFTka93g3Lb+NAYOIGGp+wIdk9iIYIikp0VPd8w/EawYl526QUfZJ9COenFDua/fC82qgtt87PlHched19kl9V1Hn1NPpOizAT9+MJGLCGMmUZd0g3Sw4UGaC7FU1Sf3biqQORCZUYdwooyvKVx4a+HAj2Ti6mPS6jcxJ1iULdA9j5/sIzps8xylxyl20rCtoDghTFAR0RDs96iUNX3kloTnUO8puVfEGXyfm+QWm8p1OkjawwPALZ1jVDA8MjNit6npGqAbKLgL31
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(23010399003)(36860700016)(376014)(7416014)(82310400026)(1800799024)(921020)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6QswS14GIPnMQ3RK1nV/EAGuusHsAAOg2TLZ91JikhJFPmm1dcywrYitRBp4xBV0OuyOPZsv9Vyp/i3aLfimvmoKlxnbrpSVRXqlDCTdNbrqPFrSzCoeXJ+vaU3HsSAqKktTICTVxfSz9tbWDE3IHP8eMkpQsZWo9mG3zMTsGsy8Zkt/X/SrExatz3Z9d/IhcXJVniV1OB2+yRjKzt17YLk8D2bJeYr+MScWbgqae/kBcjrXstpRI7Y559kYEmM6hElGvFwm+LLh/YuZsBT9NQTZGHA0uBBRnurQ6Om30pip/O51QXawwQMMZXOea9urH9OcDqBCXgy5TvUJqayS6xkIcelxGHkGo+6LluIrcKZ36g+5cPWIMAOcPAqqNrsO850XadztIBtmIkQPuPXsqBdpB3zVOUwOY7GUiUHEqF3UdJz0S+N1kYasMsQOKSAD
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:51:38.2762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e92bf1e7-3481-4d93-8b86-08deed56fbf4
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105156_659924_B662CA64 
X-CRM114-Status: GOOD (  10.54  )
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

stmmac_vlan_update() turns on double/S-VLAN processing whenever an
802.1ad VLAN is registered, without checking whether the MAC actually
supports double VLAN processing. That capability is reported in
dma_cap.dvlan.

This was found while investigating a separate bug in the double VLAN RX
stripping path. The outer 802.1ad tags were unexpectedly stripped by the
MAC (because the ESVL bit was set).

Check dma_cap.dvlan before enabling EDVLP/ESVL/DOVLTC bits, so that double
VLAN processing is enabled only on supported hardware.

Fixes: 3cd1cfcba26e ("net: stmmac: Implement VLAN Hash Filtering in XGMAC")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fc9f1342ea45..ecb8eb7e29ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6802,6 +6802,9 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 	if (!netif_running(priv->dev))
 		return 0;
 
+	if (!priv->dma_cap.dvlan)
+		is_double = false;
+
 	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
 }
 
-- 
2.34.1


