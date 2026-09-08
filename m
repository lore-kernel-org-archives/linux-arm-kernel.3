Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5879C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUbDH/ZLw3gCQh8hLEflFD+nCbuDOKX0lc4242CRbGI=; b=lKz4Q19FglkUf+QNazbHq70Wuh
	dXRCfCCYjTqkfNnZMwX7DR2TqqA2WHgjZB34t1irHMNezeUXku111iN+XlxZhdQ6Cv0T3oi6Dguyn
	pfiHGeSKHHfR6ivqi8TRo/bRI9951v+RueaOeXhGBbJWSCi9JACPnBI6zrJVkhtSPkM0QJhmDivaS
	gS1OOrlA3kplfKC63X8ElYzwmK4ixk2lpO/Y/a64Wp5qzdFgI8mVfC+BhYLYpjoLSko5xhPM2scfN
	9MACOODUdc4jkjpT4ouVdb4AVf4TA7LLih3ULq23NbYJO46NEoE4kKZfOhum894m37mm3u/FKbMe5
	CZfbWlxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yvi-00000009iR7-2WmB;
	Tue, 08 Sep 2026 16:44:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yvg-00000009iPl-3Nl9
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 16:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hUbDH/ZLw3gCQh8hLEflFD+nCbuDOKX0lc4242CRbGI=; b=dMAZ69zz6rq8Crg88pBHA+jHDG
	/XaGRSPDyatmr1XPMZHWsiQIY4jRqh6rUZrZPsriDKSEjodmeKiN2CdiDueiDAgZ4OI/HZ3Jg8Nle
	crKZ5bM4C63HXcgSHQ+2AOaCwiARg82xwYMJFZJz8dzFl7L7YNnxJIR9LXyDtVAJtqIlSMwcKiVd4
	u86L7R/oftNxmDnb8pHOTrklclZ8c6//dOTr6/DEkm6UJuCKP9J4JMwfVOxYmuQEYWQVX7Zu71wsA
	UbX0hbJ3/UgvJ69+9J372tHRUYCpy+2eVjLyewdu2y8wO0WxS+0kP80EJdVfQr8A0FByxmLjTfeg/
	ACxt2JAA==;
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3yvc-000000006ql-27PR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:44:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWWCYgjm98cbUsMzzYMAMk1eF2AtF9BOc7bJvQdUALw2laiGavS0CHWwOkuSGCaFX6d99oXrlT0dwyttlNkYvK7vDyKRDuMbOILVUZVM0xPaJUwAo3+uuFtwFqUiDL/YTAKP6hoqVbOXnIQXaHu7yICO5iuShcztPp2OuSbsrPBfLQZNBLXT0xzlMrU8W8/RNhBJuNDJ+lLCZDyWqzYlUbI7KKA/W5z/3+8LxoHDp93a8ldsoEHA/xslcVUZ3H8x+FVGaxxlbe22H6Ho59gj1ZpeRu/zZD0wyFU57yadl09ZP8CkQIydvUbOfRl1/Xm5i9gLUnjv9n7qoM6p0+QW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUbDH/ZLw3gCQh8hLEflFD+nCbuDOKX0lc4242CRbGI=;
 b=et5iv8OnK3KdEPhmGKN61ypi7UFb8DA/LQ6gLihlLhGMFG37KRQ5hW6ZzqZsTAeq2b24i7cvw/NY/BtbIbvu02iYR/BE4IUEY/tw75R+anD2BXnnEmMk6PkiJCfOaQU4NfGBOxSGqh/PI5JWCJ5FsEcXCn4QznmcmWgyYvv2B6Qn6iv11NpqwzZP1dMmE1ATk31TRbZAcyo9+hkleC3oi6zgqfapuziQdWx2IN/PIPKcLmc+glsOHddA3pDBdZriFfZjn+KSPnW0YLiJ9JDyDZ+Z1SDH9l1o+f7lT1oHnhdBQ9Obyqe+6336DHbW2/WitnVeScJqrco+LvgXvrv+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUbDH/ZLw3gCQh8hLEflFD+nCbuDOKX0lc4242CRbGI=;
 b=fjJe3sdGd5QqqQPwcG1CrzK2chV6a2o4eiu94Jpw/5z7fUpG18D36mqSvagSruuPpbMXOp4nV3irtJEuxhJ8i5ELXQeOgGJj9sq0g26T6iUxI5fYZqSpM6oSYKmzNBBVE+WyelHuywQssfkzT28e1oI8x6COt5SuLJ916jWjnSM=
Received: from OS7PR01CA0002.jpnprd01.prod.outlook.com (2603:1096:604:251::11)
 by TYCPR01MB10651.jpnprd01.prod.outlook.com (2603:1096:400:293::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 16:43:51 +0000
Received: from OS1PEPF0000D210.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:251:cafe::8b) by OS7PR01CA0002.outlook.office365.com
 (2603:1096:604:251::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Tue, 8
 Sep 2026 16:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D210.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 16:43:50 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.55])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id F42213000450;
	Wed,  9 Sep 2026 01:43:44 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	recv.jo@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shuah@kernel.org,
	joabreu@synopsys.com,
	yi.fang.gan@intel.com,
	jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v4 2/7] net: stmmac: Stop toggling the EDVLP bit
Date: Tue,  8 Sep 2026 16:43:04 +0000
Message-ID: <20260908164309.59282-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D210:EE_|TYCPR01MB10651:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f47e976f-d4b0-4ff6-f7da-08df0dc85c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|921020|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qTrFH5faIrWlvmTi6OyoFvvu75BkqcxBoBAmWz4HlxnIVQcQ9JQ9EsrvTcBgBopqfDNukvIo6TQwwrIDsmsJaFIypP8lRorxQeTUtRKMwWGFFPEWWnUks3KVzSKLj1jM30x2R5+bUBQmtXy+9lkJ8Y0X4HL0xdr+0K55IOvMlGqlA/1mtDdY6wnmZbEXfNN1W+jDUkY49BxYY4dxLdtPP0lXXHruakN9L4PSJVfSYwN5fMG3xcNCASJNcu/CQnnRZ82ECvXWzjgX76a45JC7jQDBUcM6IpgCoV+UWfRHfhBxGGyf3iaj5AYqYICFLulGqjghwOulE7MYc/uqoXOVVr1he52J3r6eEJasgMtYTI4nJGi9rq7WOA27w1E8HlnRDY8t1OLYT83d1Jyaq4Pkzs1x/2OTnqnVbYajrSuhtxKXZHoNTcZgRBRFmyK4bKBsQS7VcY4mENMatGqEbJfCm0JroSympAwRkyAppkwRB07nvOO9hRl40b84MC+psuo82ME0IvQUBuiz7iGVGnIu87FvtFCvLPbKIxqKjomjLxl06nVqTJMCFRpx+GNMJfVXlL/xikMXM5SVIIG+Z9A05ldbBYKVaTPgYVrjmiEJybwouG89we/KY9MBh/x6wWAHGBPHEZ1KCED1RnV/OZF9puKUXZegoTjeK9pxYrHv0PJA7cP5ectgkQOIgt3OYbp+kyhUDdwYSqaOKu5tpVpLLsz6XlBBj5EdKOI/yU7ppQ8EnVJs98XRxEbU8RDZA6gd
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(921020)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zjTa/mfX5yC3aYO+/VqOfywA8KLT/++i3PttQSNhPbYOsvsIH1dNqurfnNabAWTtF7Kg11/vn9XtcK5naFNm94yAg9X+0VizgLSGXuYFCSikszCpMFncVihn18dJuPvAE8gpHOak9e5P8iH3A4ZlfSy6aqM87iXrlMg16tcEZsPFnkqaOM1ne2Rrm+j5jr5Uz7SFzTmQUPpGB9Kt5jck6RjvozODvc0a83b92Za7ll9hNx5/UjC1h0onD6zmeOyl7EbduqEbokdNi9oiM4pjwSTXCxX6JIIohhr7X4KCmznDn7OOrnkkkgRPDueu76R+pkezEAPBNskonZYBnWJh65JHgyuSpJGaj3gn7UI5om8568zzKLEpKG5e0f7J8SIY2voMKRQy18AFSYMkqt7sYIV1UXmMvpVLCiRftqrCyPYLCvKsA0Ewn+OCTRPXEBwE
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:43:50.7092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f47e976f-d4b0-4ff6-f7da-08df0dc85c93
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D210.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_174412_630049_B9BE6A08 
X-CRM114-Status: GOOD (  13.58  )
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

Currently, the EDVLP bit is toggled whenever an 802.1ad VLAN is
registered. This bit enables the double VLAN feature, which provides
a way to insert, extract and filter an additional inner VLAN tag, and
has nothing to do with S-Tag handling.

Move EDVLP handling into vlan_set_hw_mode() instead, and keep it always
enabled, so that COE can work for packets with an inner VLAN header.
Add a dedicated callback for dwxlgmac2, as it doesn't implement the
set_hw_vlan_mode callback, like the other cores.

Suggested-by: Joseph Steel <recv.jo@gmail.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v4 changes:
- New patch.

 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index 983a90cb9767..200b34588c7f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -174,19 +174,16 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
 	if (hash) {
 		value |= VLAN_VTHM | VLAN_ETV;
 		if (is_double) {
-			value |= VLAN_EDVLP;
 			value |= VLAN_ESVL;
 			value |= VLAN_DOVLTC;
 		} else {
-			value &= ~VLAN_EDVLP;
 			value &= ~VLAN_ESVL;
 			value &= ~VLAN_DOVLTC;
 		}
 
 		writel(value, ioaddr + VLAN_TAG);
 	} else {
-		value &= ~(VLAN_VTHM | VLAN_ETV);
-		value &= ~(VLAN_EDVLP | VLAN_ESVL);
+		value &= ~(VLAN_VTHM | VLAN_ETV | VLAN_ESVL);
 		value &= ~VLAN_DOVLTC;
 		value &= ~VLAN_VID;
 
@@ -222,6 +219,7 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + VLAN_TAG);
 
+	value |= VLAN_EDVLP;
 	value &= ~VLAN_TAG_CTRL_EVLS_MASK;
 
 	if (hw->hw_vlan_en)
@@ -254,11 +252,9 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 		value |= VLAN_VTHM | VLAN_ETV;
 		if (is_double) {
-			value |= VLAN_EDVLP;
 			value |= VLAN_ESVL;
 			value |= VLAN_DOVLTC;
 		} else {
-			value &= ~VLAN_EDVLP;
 			value &= ~VLAN_ESVL;
 			value &= ~VLAN_DOVLTC;
 		}
@@ -274,8 +270,7 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 		value = readl(ioaddr + VLAN_TAG);
 
-		value &= ~(VLAN_VTHM | VLAN_ETV);
-		value &= ~(VLAN_EDVLP | VLAN_ESVL);
+		value &= ~(VLAN_VTHM | VLAN_ETV | VLAN_ESVL);
 		value &= ~VLAN_DOVLTC;
 		value &= ~VLAN_VID;
 
@@ -283,6 +278,14 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 	}
 }
 
+static void dwxlgmac2_set_hw_vlan_mode(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 value = readl(ioaddr + VLAN_TAG);
+
+	writel(value | VLAN_EDVLP, ioaddr + VLAN_TAG);
+}
+
 const struct stmmac_vlan_ops dwmac_vlan_ops = {
 	.update_vlan_hash = vlan_update_hash,
 	.enable_vlan = vlan_enable,
@@ -296,6 +299,7 @@ const struct stmmac_vlan_ops dwmac_vlan_ops = {
 const struct stmmac_vlan_ops dwxlgmac2_vlan_ops = {
 	.update_vlan_hash = dwxgmac2_update_vlan_hash,
 	.enable_vlan = vlan_enable,
+	.set_hw_vlan_mode = dwxlgmac2_set_hw_vlan_mode,
 };
 
 const struct stmmac_vlan_ops dwxgmac210_vlan_ops = {
-- 
2.34.1


