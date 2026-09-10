Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F05C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbGSa/4hqWj3LoF72Rr1NUg1mINAicXoFPIIJC5fCTA=; b=fwaP4dskhVb+zF8YFzdSWlIuLR
	KQ/hoLFmA37aqsULQLu3F5cqIPgSmRhnwtUIYmhBNkhAh3B/ZeMZPQwSk9XQmo3qzq2OTTk4AcEZM
	QRnPegkxb4duZ/kYABBxB3nIUn52nvpRsQLBdfT5NUl3bFQPJtH9wLFlTMdvMMs2/xNZOrz6asOb8
	oue4U1hiyMpJNFw5U7931QUfIjctyIYwHD+ewl/zqWOcX1C0O29ErPqDzCO8l/+yHYXhRFZNmZRvk
	COjtno8S4Myfr7mdAAw7eXAH1akZCErUDOR7bi280BpHJsxDJ1F4y+dgI87LnjaRlvWGaqflJCbJ2
	EUYtyFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gUE-0000000EkVE-15wG;
	Thu, 10 Sep 2026 15:14:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gU4-0000000EkLe-3glI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mbGSa/4hqWj3LoF72Rr1NUg1mINAicXoFPIIJC5fCTA=; b=Yl2chqSs1HLu/tX5Fxw1LSlsEO
	mTl1+yv67i0LjnY7BkdmDfvnQQ6sbySWjfu8v8vDvYUq7NiIsAD5IXnzUzoxDRZ9HYkiNgldUnxcA
	P1zjfqtDRyxDlXVcXGI+FT7dYHcLUgMRyWrI4ay0OfOllYp6SBUOKpWZ0OKVEtLYxoBAV69y4KWAd
	m5gqIdWxfkXKVy6Zh+nPv54yHa7GyDQB0usyOqSrIDkpkPLrVn9G3Hg8rqmWwxIG+chWLx9v5A2Dh
	0ZyLZKo30gyTB8L00WYkYDrz0kZaFqKsMBDaIMDbawkqg97dgkVyk49NkyUtEY+xuG+vk6yYSeoCd
	E1YXQMxg==;
Received: from mail-norwayeastazon11013018.outbound.protection.outlook.com ([40.107.159.18] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4gU0-00000002ewa-1fkg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:14:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8M4M1ltiLT5g+Cc3UAZR5fyVyfsKCR6u6m+6X2802xNRPNm2SpAwUL5O0jC34+aTc6r4A4FSsHBL4F8n16+x4QlSC4ZqXF0LEl/ebYisEMRty6gOLe02QiQi2NwNMbOZoxNtfXYFFmisKG6au2UNPs4AerYrEcEeY1d2uoD+OaDu84kLzXLA39sveN6hY9ihejqiZmty/E4jmVU5BXMaL+QKdT1CPf3t0Fqd23x/Ttk8QyMLVhVXchzPUUqKJzJTHTsATxEXKe7W23UqedgKdc9OIbh+lTPkBunqfJUwb+RKeXwrx9pjUFG+peitaDRH1yqaNMdgpreTRPitnQbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbGSa/4hqWj3LoF72Rr1NUg1mINAicXoFPIIJC5fCTA=;
 b=FwKRFwGuIalyqJLEBNmbb9CG6Wv12jY3qw7LNhp14ul7ArcLtXfY76DQ+egnOo1omKk8nCb5/ECfzT5I5jb/pCAqM4DAAvBEDemn5MuVLw+cbhzbjdKDZQLgowyC1XQDHog5jcMKWQiQSlnctX1hVP1t4rjVEt2abv4UXIrqIhMNqVfZ0OT/NvBwGuM5wkTboEBYLJ34Yf702oxx2cejPYj8xiZBcVpFPhUlIhBn/9+l/dDt9r5SAPzIBA4RwWp/iKPhxUDxlYSC64OYSBMU+ld7PCZEi1ZSdhXKmgFP1nOxgxyjLoVNrTWZfv8edlWgtz50tgmS8CZKjvH7/Id0bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbGSa/4hqWj3LoF72Rr1NUg1mINAicXoFPIIJC5fCTA=;
 b=VgHfzLY/UYjE7WlVNY/Kwb6ECZW0R9yxU8AsTMijkcputtSB4rI7qrrsivyEhSonI+Ue4UjsCsqD/soJWqYfcDKyx54JWgaqLC53BvDmwgjDlJDDN0kYaI/CV/1GypExwR80odcCjs443s5esXPK+qoGJsBkGbNkX5El6cSQC5+0ScYnpPZBd7QpnWxjB2JvBwzNzNKxi8bsLK0UA6QlF+MRBP0U8sUGaaLheye9jPQOfqcnCkco24fAnmqGXEu0p8qHYOiteXwb2kIczP3fySp9Q9tsXpVFIxEJra+AAte9uWLFSqVduPcvGC2m6aa/mL5Ez3mIakHcdXDljP9gdA==
Received: from DU2PR04CA0195.eurprd04.prod.outlook.com (2603:10a6:10:28d::20)
 by DU0PR10MB7240.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:448::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 15:14:31 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::79) by DU2PR04CA0195.outlook.office365.com
 (2603:10a6:10:28d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 15:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 10 Sep 2026 15:14:31 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:19:58 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:14:30 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Sep 2026 17:14:28 +0200
Subject: [PATCH 5/5] arm64: dts: st: add TAMP backup register in
 stm32mp251.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-upstream_tamp_nvram_dts_part-v1-5-e2bca58a65f4@foss.st.com>
References: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
In-Reply-To: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Simeon Marijon
	<simeon.marijon@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|DU0PR10MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: 569a22ef-a78c-4cca-bd57-08df0f4e3719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|10067099003|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: yrxqlmtKkLxdDhLMaVnpCPPrbaf+9vX/aeL/1zqWDcfYlQO0FjEWvOM0T6XpNOOyZN/NqD1FkXCNeFd7YtLG0J2lTUko6/3n/t+c9fjcuri+kJTD4dcQ13VAPJ5bDmLemh4Ciftupgg2R7EPo9aIzRRtzYbzEKAtj9zDv+qgMR0hcwJhAo9ysYUQiQ53GtwI8/LFTtlmt996099zJZy2GvlwFQ1ZLD/DnanbJ+JsfRVt5hFhyXbZ+n2GMh+t0/U7bPGHgxZwj5S96LVLk5S2rAomtoTOX+L0AoBlGRtv19edi/X50Gjcnj9aTe2kWUCHVomLG6lImJkgUhIOgf2YR9n1SpUwvdiEFGUnih7IShSTqpAtQbSdRT+XXN7pGUEC6wE3oJFSLha1BbMWcDEycLoxK9VY8fVyvTBI6JFfEvBYU7yP4rDpDGon+wf73ohv+Bd+ikprHmyYc22Wi6AGY1PDmByc9/hxd9qFiFkRhxw64h1POZ2uqr6KCW5y/mMBeyY1M5oaz2W9dbWvQ+srTVgJ4kXc5ugWgZxOHQhmXP5cXuIpoG937zjrcydFtOyNKOsyfBImoSyQ/vr+Z/V/dJt6crO8WY2yBIKVfn0LvFf4Ly1bXUNyjRZySJQqPQd/eJsgks+hjhvh1DuGCTPVUNO78c8HhixfuNNZfpMVpZqiMGZO9uJBbaHvhkMIqytb
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2Ki0UDheZU5I/A6g55al96RAWe+HuhVM0P1czQZZv38Ced4vjs3aKe9JNiRyG4daCw0R1c4bKIg/LWKeEmTpGbT7sWpJawKLOvLwuJ19fCBZ2EXDDcDdahAKfy5uKxDj9WwQKpa/oSSOUEdTlpvz87LLUh1agDYjhw6KXBfW/AglB09aIhoS+SkL4HdFXGM/oBEUhj8LS7ZYj7Yc654XoG+OzBDoKg+YbfjvVtonT99EJENro/6RT+9UV9L7m4Xnd0bUVVftPqdL1g7IDS9nx84aG9f0veKja8Sxwv9TN/PWQKOEJ00/a37ftSsSGzNXPTvl4GKEWOiSFnEuZn0Dq1HA2nZrOUnWAVxjsui0aZiHgcov5z6DFaGAlHa3wrdazkvSAOlvhOzhoK6mdBF0aM9LRejB2kXlanEKQJF3rp4cQ1zbI2QuCQvKgiD1/Lj3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:14:31.5105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 569a22ef-a78c-4cca-bd57-08df0f4e3719
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7240
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_161436_662196_0A433EB6 
X-CRM114-Status: UNSURE (   7.71  )
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

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..aa7ae8b6fd21 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -2118,6 +2118,36 @@ rtc: rtc@46000000 {
 			status = "disabled";
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x46010000 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x200>;
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					boot_mode: tamp-bkp@180 {
+						reg = <0x180 0x4>;
+					};
+
+					rsc_tbl_addr: tamp-bkp@184 {
+						reg = <0x184 0x4>;
+					};
+
+					rsc_tbl_size: tamp-bkp@188 {
+						reg = <0x188 0x4>;
+					};
+				};
+			};
+		};
+
 		pinctrl_z: pinctrl@46200000 {
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.43.0


