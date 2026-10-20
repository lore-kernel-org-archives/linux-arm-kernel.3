Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A076B606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NoUziZKN;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=e8nRwj8S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6U4Swq5GEhiU5q+G5oxOslUMuHirc9NywOHwPpZEQQ=; b=NoUziZKNa1jVbapdN1gjFs5Zmy
	UKBCwTsYHYnDQU8dcYUWoRKShbHWiCwVuepln1y9A/w0Zh7BRY3j4srMlcnI1Y/KPZH45bWbgTaL5
	BbjYmvNc7YHfYWG8zCV2uGW74ED54opP2ZHzOau2IrljmOFqBG3XBwbK3nYz2Y9SuCLEvDkGvCwyu
	f5gA1iS7diyJzplhzsfxq7dMqtj9vD7AHkPNmrooFM6r8KeK/489qR+tC7bE9iqbXtCca5TTkVnLN
	I8xb2leSiTsrczFWkoF6Rj9lMCW32p3B79TH30X60FGAnMskObH+VVFlDi7vK/RkHYBOc5GKN5Phy
	NmD5eCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6T1-00000009Mfs-0pLi;
	Tue, 20 Oct 2026 09:49:11 +0000
Received: from mail-westeuropeazon11010020.outbound.protection.outlook.com ([52.101.69.20] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Sz-00000009Mdu-0TLF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:49:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edKO0xbJ3j1FATaiKBCunMnPVoPL4e391PyguoMM/yiP4kbD2rTM6O1Ly7KjMlanajbDU06MwUzuaZ9t5bs63MVw4mBg2JXL0Bjy1Pf/EEREN9qtUTi5ABuCgiV5TvO0kYnEY64y+9ljJn6Y51f/uL74/MW6hllTyAIcNluhmecwXo86wir3WwUHln1jSeckFeSe9+iUla9ZEARbw3m0ZmNiuC4JyEimy6M4hjs46eSyJ8+jOw3Bwtht7whXDWUYvO/14GoPDRExdQv9s/hrefNxMzwF7enkqyxWXKinFiA5HUmh1geyMsQOQeU2/0MGqx6VmVspXp6oZgh7HJ54QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6U4Swq5GEhiU5q+G5oxOslUMuHirc9NywOHwPpZEQQ=;
 b=b16bgNFShHRnqkhc6sp4ENsBesExla3y5n948+wnYnfqZ6cr+T/GOXjqzLPuyd2dwvYUY0JI57+EMJJL8MC9AsZdeBi3rg/HrShcq2ukayebQC+SscnGCGxzYglpjaJa1Ua8YgBAHI5nZZokWw0JbLvWK/ZQUZZHcBJbw/LKGPHslECoa5HVFpgIneys1Hzc1h9M7s8yEucj3EK0aI9/1GfXEgVCG5J/4+zi6XLPM7Gs8n71461alRKMz5NUsaBH50fJ4X1vtDnGhCzu8lu5FrYbqzm9KFrC9NqQ5mnZdDixC1umBZfC/KiwU8NgH3qqygzcSJoBW71pxPmV/Kwt7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=redhat.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6U4Swq5GEhiU5q+G5oxOslUMuHirc9NywOHwPpZEQQ=;
 b=e8nRwj8SXBC7mqaJaE9lZexnsicHzH+ZH4oXxG+3ReqPidkXo2ZhdSS1+zD/rHKKqKT6bB/77nJzyStryAoPQ0WYpzagC1dJEipExjG7uWCJzilOs2ZlVWQ6huNT9/enP13nrvv6GK3o2MScAYnvB/BrPv2T241oulgpRJamfBiO9rZ+lsW7cEV3IQl1Z0cXDZ1/mcQEE4/B2xe6bsjrTC7YzZtsY4lrY/6yU40ozMcuxSn19RlRJHIM7vpRZza5BUkhRHM8uaRBRtXZD9KyKa1XHQn6eXZS0i8/xKVzpboSnJV7g/FMgbnllMBaXaiKEQDesQFRxW/jB2JmhIEhUw==
Received: from GV2PEPF0001A334.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::699) by DU0PR10MB5946.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3b5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 09:49:02 +0000
Received: from CPH1EPF0000052D.eurprd05.prod.outlook.com (2603:10a6:388::188)
 by GV2PEPF0001A334.outlook.office365.com (2603:10a6:158:401::699) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.406.12 via Frontend Transport; Tue, 20 Oct 2026 09:49:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF0000052D.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 09:49:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:49:15 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:48:56 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 20 Oct 2026 11:48:54 +0200
Subject: [PATCH 2/3] clk: stm32mp1: don't disable a PLL while its P/Q/R
 outputs are enabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-ups_mp15_clk_update-v1-2-67da20111b08@foss.st.com>
References: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
In-Reply-To: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792489734; l=1680;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=R7VOgzIg4KquqoH0XDJQLxAtzdq9bKzy3R9NdqsUzqw=;
 b=3GawrILh19BUQ1Rj5KhnBfmnusNNZ39t+mBLrZ87pCcKe1QZ4tQKHNP0K76WTy8N2qKywVjDf
 rcz3W3Ghb5yDb7QyLlinNU/8rJTeeIja3FsEyJr+me1o+dyQNrJnVDQ
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000052D:EE_|DU0PR10MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc811c0-f5ec-4537-80be-08df2e8f5e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|5023799004|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: Bx0MZ9Cqjqm/LzaiNu/jla6wt9YWAlcl6CH0gKjbVjbRKXYqLkyN+mpUwWFasIPCTu90ZyUEUrp0Z8CU6+oVSqT/Fa1U7pXWAfxp97KWTHoFXO3mHCBE2YpqyftF0OMucZ0oiRGsaYvCkgRssFhLiaOWDmkZNAYqswqk1SxwRrfCSgB8slwzcaGSq634qcoXO5oxv2X17coa/oANI9bdlOTiQpeDMN7NT0MONIUItPh/Fb+sCHf5kfrMzWhZksjVBdOFkObztp6Fje28hCikChqK0WxOk5+nV/ERcn+fgk2c8jljebrDJNg1jMRljNj5z9Xs60LGdn5UQYaELwEcYa/M0SP6j7sieUy5yloAGCxJv0hQ3d6CfzrZ4hugf0gsrCDF5ukIRm0SshDhGAGIyQmj8+uTf9IhQEtquMmZHt2KZ98NCYAEPHbTuHHuMjsVcqJr9K5CID41kMzFCzqlecHt4WjX8ErwPArVQDuIP14LZW8Crh0iIuuCxKuwegpoRGpYzWgI2e8/k06G3TQEQg4X1gA5SroE9D5bBYVPtWYKPUS9Zq72mUgBlrT4fd0Bate0pNO2ZtgccWQwGPizmDZ83m8c7ocbX7mLcJTm5JIfzl/yVHT/YIx/Kkjh8BhAtQW91oWXERYYtvoFBbVirNkPWF7w21TgqToAmbJ9yzsFi0bmhsrLalCkUMzmO1BX8Opk3+ISnwO1Ic7ugManLw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZEW1zpxZFtb1mh1DgSWMhZa9bdtim2Qh+UI57VtheD7OQ5G3CoePz1hrMkgIdqq6BDbMHDQJzGjh10YtAUZHr2fvUnZOkCqJ9EasTJol/Xqs8x8zuwyF9Cqyy6Gzv47Yr1kO3Znwd04yWsy6frVcCHvOCBPxPHpt2mhazqUiRRzZS+6tA+d7vWbZU7FeeRw1cNScm6SfJ0pc3L+0Vc+llKz+Cb3hjfDtyS6oTvDOnagYHzGEsi5gt3MKPN+V2b7uI/hjX28VZrXzoEWGah7z49sj3bMzlrM6IkKu7oi3EgzeM81+DvPKMazV9Kgdm2bpASLdvxPPb0pCP7wZi5EYvbg2Whv3ebd7a49qkgzogJvBq8xu/QZjn9lbieyMpNYzHaEXgseL4yEwahm+WXgp9lg4KB9icsLGhcTO+3h4KZWpa08oiOqc/5W3ckkPeFlU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:49:00.9312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc811c0-f5ec-4537-80be-08df2e8f5e8e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000052D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5946
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_024909_159813_4232378C 
X-CRM114-Status: GOOD (  12.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The clock framework only accounts for the users that enabled a PLL
output through it. An output that is already enabled in hardware, for
instance by an earlier boot stage, and not (yet) claimed by its consumer
is unknown to the framework. If another output of the same PLL is then
enabled and disabled by Linux, the PLL enable count drops to zero and
pll_disable() unconditionally clears PLLON, which silently cuts the
clock of the output that is still running.

Don't clear PLLON while at least one of the DIVPEN, DIVQEN or DIVREN
bits is set. The PLL is then switched off by a later disable, once all
its outputs are off.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp1.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 8f7bb2c31809..077dd3342911 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -755,6 +755,7 @@ struct stm32_pll_obj {
 
 #define PLL_ON		BIT(0)
 #define PLL_RDY		BIT(1)
+#define PLL_DIV_PQR_EN	GENMASK(6, 4)
 #define DIVN_MASK	0x1FF
 #define DIVM_MASK	0x3F
 #define DIVM_SHIFT	16
@@ -820,8 +821,12 @@ static void pll_disable(struct clk_hw *hw)
 	spin_lock_irqsave(clk_elem->lock, flags);
 
 	reg = readl_relaxed(clk_elem->reg);
-	reg &= ~PLL_ON;
-	writel_relaxed(reg, clk_elem->reg);
+
+	/* Keep the PLL on as long as one of its P/Q/R outputs is enabled */
+	if (!(reg & PLL_DIV_PQR_EN)) {
+		reg &= ~PLL_ON;
+		writel_relaxed(reg, clk_elem->reg);
+	}
 
 	spin_unlock_irqrestore(clk_elem->lock, flags);
 }

-- 
2.43.0


