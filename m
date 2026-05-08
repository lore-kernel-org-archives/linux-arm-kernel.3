Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFF5CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVDqSYfPSB4i8IsuYkEc8NZ4nMHnsvHXNYfVJR65Vpo=; b=ETzaj1rJbjwmFGzYIrpEleJvih
	eswBm4y0v1K9HyfTbcAoQvVWPCTceFKtxqGyCfWEiHhpCWOlG4syJXAtmh++m1D3JjAValnNG9bLq
	9NDEkn6lEK1LLU+UJmI8GOC7CaVmOFJYVafXtg/xBfTB+FdRyiXAL/HPRo7dLaad/Dw8BHAscQN5e
	xbD57BwzDG2pxE/Frl5YBqD0WDYW0MVQETlfFiNUZylOrTyTa9+6zbnht+dQ7/2sMcEyccK8m+jp/
	Q803m+4+U/GpDsDUK/QQwzqgrPOGpRJHXxxmhDj5+FJqoOD8v91UiIOtLLGGNqVToJ3zcX2253Ub0
	Wec1jHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCB-00000006qUy-33uY;
	Fri, 08 May 2026 15:32:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNC9-00000006qSD-3s7V
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mVDqSYfPSB4i8IsuYkEc8NZ4nMHnsvHXNYfVJR65Vpo=; b=UhxjxjRxUUgH43F88OWEFJWYVm
	TQtj/92J6yN/ghd+/oUY9kR0OEkcVuUIB3aXL1SecLLcke9miEXHMcsA/l0KgW2/UFyxKB23DRMXx
	XWu4B1BqNLOOPL2GlqN1E6WYgqMUbyNmeteU42pgkJP5ioQLwuUEpkLXc6yv2uVvLqilJS+TXySWi
	44x0dUQyQESvzOtJS8U5oeUOOFg0Mw5GVIqz+9GO8kLEsAuQIRrO3cW8gTf5mOBcHcpmtDZCO1sfn
	v+grw5bCF77mMLL+/Lt68Yg7PP6bpWVQSQQCuNicNByW8xJn+HbeV5AupAAbKij0Ctv0YYyUSeMPt
	+Ti1w2pw==;
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNC6-00000006i5r-12UJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:32:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lsn6LdEw3VKG5FTaHqn3I+jFS39M2F3HDlChhoOXzPmCqtaY0NCaPTwusTR3PmbQ1hI7CnaXH1B3K31PAOyXgvf3Ufq+KrSbpzLNNTuVNVwSwmG25fEAgj21JVmGj4Ul2zGWG6++zKAzMTyNNazRDv70hBRucSU4UgJrYyKEV+Ks0LB2fNfLss0h+bWhpgWQgz9+Oj3BDDR3j7ziXh503ZUunosYS2rZIGpfnrTXeC6r0cdTmk3QOD5kXdEhK6Nc3SvumNzem6Wsz7JyDu1yOjqXS6+/W+/HVUG5bqoBb6pySexR0OMlXW6VEJkPLo7ZmInrK/REBKTYpI+KSAanrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVDqSYfPSB4i8IsuYkEc8NZ4nMHnsvHXNYfVJR65Vpo=;
 b=pVXtlFKaCc9jqKIcCFBEpuaa1u9J8h3/rHQX/Le8ZxelWTlWcH3l+vVpA2XI3dCmbO1GalPaGvl6Ys++HIbxyWeDriJgGPST0EBRbBTAPILUui1Xb2ahNQ/0KAEP3kTVefmnQcW9F+/JAP00neny+8ptV2i9NYpt/VEFAh7SWIbtx0QPBFKooZEZSS8XpNmYY+IV0v9TCEZYtNymWDqQpIc3+URZKVdJopFM/Nf9QMEhPJsEKEIXqtq4MXwGdSkMd4nwsorEeMOreLUPSwLp5kEna8MqcOfuWZRAgoustlyhiWoPq5sRUDdltoY3RMJNhEE3n4REtlVn+5UPrWOJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVDqSYfPSB4i8IsuYkEc8NZ4nMHnsvHXNYfVJR65Vpo=;
 b=PJSQX4D+Ga/L2R9wDxINBGT29W7yrcT/N+ezYNYSPioynsn0t4eJJNTv8NKEDgcBZHEFNAVccaRI+0t0qqMzdFUP5PjEor/7uhg38NW7lvM8Hw2kMUNIlX5BLs5GqvvjuIUNQKepMa4Rr7FrV33hH742/gP+fpU6GXt2qz3rCX8=
Received: from BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::17)
 by MW4PR10MB6297.namprd10.prod.outlook.com (2603:10b6:303:1e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 15:32:42 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::ce) by BY1P220CA0013.outlook.office365.com
 (2603:10b6:a03:59d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 15:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:32:40 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWEkL1961981;
	Fri, 8 May 2026 10:32:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 04/11] soc: ti: knav_qmss: Fix kernel-doc Return: tags
Date: Fri, 8 May 2026 10:32:04 -0500
Message-ID: <20260508153211.3688277-5-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508153211.3688277-1-nm@ti.com>
References: <20260508153211.3688277-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|MW4PR10MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d71c908-4ab3-4931-7135-08dead170aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: YaDJV2PSv1nJhXBl2tfUDOjUpYOPLw/43fqSWzz24CToiimkey+s4xUcRl4UmYcnrxZNTcyf8jr6RwC5elyxUhhlxQSDJ+tgMMq1PfxAlg4ZbJJ/UofYdibjqSJvg09fc33WO+Jmgc4jOKNPoUR6w3CtqTInS3y5oG2BrjBvhTEA6BPbUjhC3bSFyoXrtNFRrIP9z3vGcTGi8DEnQY8B9RhF+SJ4+GVum1m6XqmdYYOR+WDEcmSTF+51mbKBi9WeA/S4sTkv+Yp3sYlJ+uk6xjYkYrLFmBORl3/ksxrdFeinaVrp5+0YOdKcUyQKii65tTTzPh4H5r0S8D19tTwofTyRHjmd3kwLmYM+/BEyU0RF9qMWjGjAs6W+2Q9ACjDQtPfnZ7h+F+kLu+IMmEX3IgQcWc97/oiBLIbr/KR5RncLLYIHyoscSLPeobyBIi3MAyErJFQUzpA5nm4PSsUB0XcZjXtXG8JxLgSTs57h7WfekRyRzPvBQe/T7Du2ffHYqDIVuJw4Vs3/J1gfuOCZCNDza2heZ0FP5BaJ8oRrn3WLX66aDWtWR7NDL/zj44JDA1xJp3jYZHGlwd2Spfzo/cu0U/B5mZ+C/pDxoLn9/yUeV+emWRoE6yVAhBl8o0x0+KOj48xD/BvT2j8AW5QI1TpOKeObWzn5DM4EljmY+dPF5jl84MbkhrQwlEow+9Jz59Mo4B1c9utaWPGHjVzcs0dlpN162q8AlO6mzrxf07I=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sFCOcJOIjXlUDiaR3CNoVlgIl+g5yE2MYeoMMSuRj+AGdhzCu1euDWtneIb0yHgt0wcBnKu1hhcRODvVspFQnVfuXPGFyYZ1SpC52n/byYUmeMn2DwobmcWpHMdnhG7soNJHvFDUw8RecyCF070gihAis40Y6kCQ1OnDrYJddIWXKBO/B4nMvl4pGQWIPc35PdllB92ah762PgcnSkUfnZbgu5tmkemWGO3EKR5LZ6R8BF8pt2qrMrMZYJZXSb3YqUxL7LTgGwrSIrg/AF3TPp0LuD1H02MbDbnfzTDn1fzy/MJPf1yYAfUujR8UyVEgal14YcOyP4NXDK+wpwRMiKXCsRKwxLVH94ju2NJUwlyFvpXpMGMqWsQQn8aWvzZ+6aSMZmRv8ELLmS+R5dJF7+sYS/SnL2pZEyWoGgZRdE9w8NyQbEITIxGqe7odZz3i
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:40.6928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d71c908-4ab3-4931-7135-08dead170aad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_163250_701309_F2D744D8 
X-CRM114-Status: GOOD (  13.79  )
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

Fix functions that use inline 'Returns ...' instead of 'Return:'
kernel-doc comments, producing warnings with W=2:

  knav_qmss_queue.c:524: No description found for return value
  of 'knav_queue_open'

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Cc: Randy Dunlap <rdunlap@infradead.org>

 drivers/soc/ti/knav_qmss_queue.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index f65658014b05..c3f85052002b 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -517,7 +517,7 @@ static int knav_queue_flush(struct knav_queue *qh)
  *			     Subsequent attempts to open a shared queue should
  *			     also have this flag.
  *
- * Returns a handle to the open hardware queue if successful. Use IS_ERR()
+ * Return: handle to the open hardware queue on success. Use IS_ERR()
  * to check the returned value for error codes.
  */
 void *knav_queue_open(const char *name, unsigned id,
@@ -573,7 +573,7 @@ EXPORT_SYMBOL_GPL(knav_queue_close);
  * @cmd:			- control commands
  * @arg:			- command argument
  *
- * Returns 0 on success, errno otherwise.
+ * Return: 0 on success, errno otherwise.
  */
 int knav_queue_device_control(void *qhandle, enum knav_queue_ctrl_cmd cmd,
 				unsigned long arg)
@@ -625,7 +625,7 @@ EXPORT_SYMBOL_GPL(knav_queue_device_control);
  * @size:		- size of data to push
  * @flags:		- can be used to pass additional information
  *
- * Returns 0 on success, errno otherwise.
+ * Return: 0 on success, errno otherwise.
  */
 int knav_queue_push(void *qhandle, dma_addr_t dma,
 					unsigned size, unsigned flags)
@@ -646,7 +646,7 @@ EXPORT_SYMBOL_GPL(knav_queue_push);
  * @qhandle:		- hardware queue handle
  * @size:		- (optional) size of the data pop'ed.
  *
- * Returns a DMA address on success, 0 on failure.
+ * Return: DMA address on success, 0 on failure.
  */
 dma_addr_t knav_queue_pop(void *qhandle, unsigned *size)
 {
@@ -747,8 +747,8 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_dma_to_virt);
  * @region_id:		- QMSS region id from which the descriptors are to be
  *			  allocated.
  *
- * Returns a pool handle on success.
- * Use IS_ERR_OR_NULL() to identify error values on return.
+ * Return: pool handle on success. Use IS_ERR_OR_NULL() to identify
+ * error values on return.
  */
 void *knav_pool_create(const char *name,
 					int num_desc, int region_id)
@@ -878,7 +878,7 @@ EXPORT_SYMBOL_GPL(knav_pool_destroy);
  * knav_pool_desc_get()	- Get a descriptor from the pool
  * @ph:		- pool handle
  *
- * Returns descriptor from the pool.
+ * Return: descriptor from the pool on success, error pointer otherwise.
  */
 void *knav_pool_desc_get(void *ph)
 {
@@ -917,7 +917,7 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_put);
  * @dma:			- DMA address return pointer
  * @dma_sz:			- adjusted return pointer
  *
- * Returns 0 on success, errno otherwise.
+ * Return: 0 on success, errno otherwise.
  */
 int knav_pool_desc_map(void *ph, void *desc, unsigned size,
 					dma_addr_t *dma, unsigned *dma_sz)
@@ -942,7 +942,7 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_map);
  * @dma:			- DMA address of descriptor to unmap
  * @dma_sz:			- size of descriptor to unmap
  *
- * Returns descriptor address on success, Use IS_ERR_OR_NULL() to identify
+ * Return: descriptor address on success. Use IS_ERR_OR_NULL() to identify
  * error values on return.
  */
 void *knav_pool_desc_unmap(void *ph, dma_addr_t dma, unsigned dma_sz)
@@ -962,7 +962,8 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_unmap);
 /**
  * knav_pool_count()	- Get the number of descriptors in pool.
  * @ph:			- pool handle
- * Returns number of elements in the pool.
+ *
+ * Return: number of elements in the pool.
  */
 int knav_pool_count(void *ph)
 {
-- 
2.47.0


