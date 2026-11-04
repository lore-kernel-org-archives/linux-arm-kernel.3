Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DD8606D813
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ueyvjkop;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yF2mpxId
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uytXwB7KXlLG6PtwwbswAmpgu8OKhREYcm/igIHgECo=; b=ueyvjkop5GNx1qk8/1st+jS8V3
	UBoJrMD30CBhszprvj0wxsSZllfHeBdSZXzOnXAb5Rh1iqTV304aZgQNj9SDRvnXb9bGefYa+EPHn
	F/fWwjzXeQ3y2ij9Z9jsaxM69liLtYKGzuL9MTW3ICVS6jKfYGWM/vTMRTt1DQvgpYP6AqcuNWVw5
	fhyfLoFACVEDgEJhftW06+ptZ6tCGGetQUMxQ9wZkilK+cMCqJg1RTCG/Vvzaa0fbkiTMxtttVA/A
	TFyRHZpza9lj6ZQu/T/JkQbHUlggAhaf8cje2yzgefxacyaFO5lWjPZonQye/dh84D8X0srcwhqsm
	quh21oZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVZb-00000004YZh-0Fu3;
	Wed, 04 Nov 2026 07:38:19 +0000
Received: from mail-francecentralazon11013047.outbound.protection.outlook.com ([40.107.162.47] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVZX-00000004YQ4-1qcq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:38:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdjIcEU84GF8xtzaF/oui89DmI6h8v0cUHoWU+JPEaqrTye38NBPSmY0O7YTixxyWRFZZx52K9rvxY1VYzoGFUdipNyaVT3I/vcPOlR8Slh9h/+Pp9V2fro36Az4+wPs3AboU6ctU33lsd4oAPBzuxxWmyUF8bzx6FAa/anfHBzGbn47l4xZZ6MelbFmWE/agl+TB3wGWx0DGzOBzHfPmyhnd2i5IZTJQZvzhG/diD46UoGvwj2VHgRcKLNR88y8m5RUwHSc2llXTkVCoh7yZUWmTNu06pNWc0s1DYBNnca/AV+IQ+8reyXcr7XVeZsquyHiOT521OBsMsUsekciaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uytXwB7KXlLG6PtwwbswAmpgu8OKhREYcm/igIHgECo=;
 b=xsFLqn4nVc23brO4kRPe3qtw3D0zbLQ4SkGSFkvyYzVy/3vX/1w2v4bKddrAnX2zNLQgSbRqIG+/X3GgzseG9TYLEvrmYpGeLheiu1iVqsahw4dpwXl7EYbdE6p8cP/M0rtw/TDDUmfT3KYRABrVyOxXMg0BlltwYLXPK56W2k68l5oTQ9A3pIBSc+k2i0dB5zQP4VuoJJEGUMyWU/xBSOpHntJwco6R+yZVhQKsFV6zHelXSm6gnTeEyJu1wfT0xq5d2zIhg3ddHS3q6qRzbyTMKOwv9QLbgUnTK+Bzk07+eClzZiWNYrTf0VlFBIDrQQmzbu/556kRsrA4jGTezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uytXwB7KXlLG6PtwwbswAmpgu8OKhREYcm/igIHgECo=;
 b=yF2mpxIdj7yAxmXWyrGE7TO8f4nMuhdpBPaABnNtFcmVQPZSX8Z3kC7sF932GiPIMYppk2tEV3CFMooRyeVbbDA0c4zf5Gvm1HCHAFpb9m60HnnvIU5IlrEfd0afxKQErv0SdTF2T629TFCn3wNnDNEjhVhAlISQVtKGl0H4nEl+dpLRNTlObE6fDFpI4nd9gCn04qlTAnwXYldeZuiz5OH7hTLT0fVfy13MHM5rfw51VynBj0fRobSW/lfbnEFXC2yAjGULZQTayLbzQifyru2ofE/zJx15btTbjHShShwHEeN82U1M/Dn2/n6P8MpIGIG4uq29GNfSflRr8eRCCA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:38:08 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:38:08 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabio Estevam <festevam@nabladev.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 00/10] irqchip/imx-irqsteer: Allow building as module
Date: Wed,  4 Nov 2026 16:37:48 +0900
Message-Id: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To AM0PR04MB6849.eurprd04.prod.outlook.com
 (2603:10a6:208:181::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6849:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e4b225-07bf-4f0e-3488-08df3a4691d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|10067099003|18002099003|261102123227099003|11063799006|261026121527099003|261022075727099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|56012099006|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: UAwyu9PO4iS3u4SUzwiChQ0zZ5lc70hRgWibC3hj+PlqEKmfSuKYSG0CbUcyVN8IZKl60IZoX+qzPXkPdtNHYHsRb0TGDLbc9La9Q7ZG21sbjA2jXDNjtA4gikgFd8yczRTKlF/vrBs4YNr3M/ZDdRv+i/EeOuFav6akTBYMPoBH3uYLHecmQ0V5onVpLgZxWJ+t9+W4ylW6QYsH4MghJF81f8CkrpK8sbmv1tUKIVLzjflaXKxRPNQjpiq9u1Rjh3PpQ/8ocEbMQv49+F6zl1a42qXgL5wwdAlfIp+6zKIXKSq/iYhYTZVb/5syyNX8ZHjaZc5KPd5AbimqMSWJZMWJteOAdKRxqjxOzaKWeF8c4bYAARFHBVSjmXOhFwTL1LGaPR34C5udCdGC40HxhK3W7KXQDRUuv48SaQOX2WGOUeQWy/9iXFhfIU/piP7WhlFtAey6Fj7gzzpeNE3AcjgV5uEIMLzwNjXkb81Ki5ug6tA0OqVfkGALHAt01gmPmevZpHr4OHQRhze61LTBFzaqGZ5MG8HCL9GJXgK2XM0LrYozbbnayoeqIBd/SGB0NTNjHbfWU3j1oFf4L6jZdY4vlhz6Z3supCJreQ/kwhc+4k1bwNxdDuE3OnUUoU+H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(10067099003)(18002099003)(261102123227099003)(11063799006)(261026121527099003)(261022075727099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J6UhJmX9oG91sDzhqYJwyioF1k8nCcejoQXvh5Ld5+vo13x/B0aedRNJSPRJ?=
 =?us-ascii?Q?vlpaWixOsN/piG6TsFa7RqpZ4A83H1+FIDHvnMuAyCUPAVLSEiuQp/G+piyE?=
 =?us-ascii?Q?KKRb3100bvizvTG7y0ly+no9HB+iv0JNpUa2x7CGPLYDx5o9EN4MiRFCmxIZ?=
 =?us-ascii?Q?diXmeQtFoOXmp0MHbgcoQYxkGOkfcHPybh+YJw0GmGn4boCk62nkB+UTqRs3?=
 =?us-ascii?Q?zzuetjB4/ruaZDJte9M82HVBrql3unyIMtsxEYqxTnCFEteoHdHACGpuZUR5?=
 =?us-ascii?Q?KhCjFO/C5RUUbV5imDcd7UMcmQHNxjW6A5mYWT3I5GJX9w4FAJRSkS0qobLc?=
 =?us-ascii?Q?Ntu3niSgybCRhpTShndauDWGAMNsZv8BZLAYAY4pNu4fnIk1VanuaRsBQi6Y?=
 =?us-ascii?Q?bk/yd+gdn3uTK9bpP2qVZTRx+wFjSKWYXgH0D2FzSQwqEoLiGSyspi4GPgat?=
 =?us-ascii?Q?gSqxSmGtxA9J+sdHisxRLQJBf+oqADbKXv/laCOZy3a6YUSJhUHv3mWmIeSn?=
 =?us-ascii?Q?cJxFgpYz6OPwxD+g7tmWf2Y06VnzaPU2on8OQ2QlO3hsn8N4/hJ0/wOHe9Vz?=
 =?us-ascii?Q?UI9/HComlGudpeDahA5RfCfZ2E40idMvOeArcxH1muNTqNZS6CnQdqCCUdwh?=
 =?us-ascii?Q?dHmx1DXuYDceRflbA8MRqH3km06tciTsmsQbQEfM2r6kNv9PArjgrLOxtvmi?=
 =?us-ascii?Q?rtRxJ8dUxjmvVQMwDdxK4Sefls1CuFrntUe3BatdalcLtRMLII0mhxnZva+U?=
 =?us-ascii?Q?k63BXCJEBqDtkS71kvkKiJWgRE92un8FsQYzcKE5FK6Aj5j7HZbf7PLPW/57?=
 =?us-ascii?Q?PEkKwnNQwlkgWkqjB7OSeH8k4vsxUsD43w6AnqqBXfv/DIUH3nHIi+DqNlWj?=
 =?us-ascii?Q?rZ+jLWOdhC6FNEXq4S7p6omONtXeikixOnglBZiVJ/UpSYxAugDC18GNuhy+?=
 =?us-ascii?Q?+CMuBlHe/QznFlV90FQX8Zg2Ywqvnn/zWrAdMrzribdWaL1rmsVeF1Psxkua?=
 =?us-ascii?Q?g9FrcKXD4PJ3/LdzcU8HxvhzI/0dxKBJvT7WnMEjen45DhTinN05mFrJchIG?=
 =?us-ascii?Q?tdXusVFfw2ekwmDUBxQUTXUtlOi2x7d32R8hlyYV/+1f1hlLtaVknkPTxRWr?=
 =?us-ascii?Q?CAciTfKm3CQ2+Ap37wbsV4vVIE05cRBO/9kauth7zBJv3sQz5wtgJ+iFjpFY?=
 =?us-ascii?Q?nIlKU9oVh/yHJyykMp8YRXqGQpdgQ9jd9QZhHlJY9ob9+IqbPaP0gVIQQYDa?=
 =?us-ascii?Q?iNmpltiCTvNxWbrph5ijSVqULjDZ7M4SEtHQSsPLsNLOTPN9GXFVAAjlyPUi?=
 =?us-ascii?Q?CY4QxcyZgPFNPwxwLqDFhwMjraumBiYgWea0CkLhHZN2c+rziXfR1HozMETq?=
 =?us-ascii?Q?tM1jdmtzOmoWY9fJglDV8Ssy8soNy5S+rabxjcTa9PvVURW/pGB3oesUV7iJ?=
 =?us-ascii?Q?n1PiHfGJK7M4Q6COmUNTAq7pLTG6YlLX1wb7vCjo9C837+c9LyAw8XCLhCVi?=
 =?us-ascii?Q?AIQz+i/a4/YtTYL2Rh14l0Sxi6jlCPoZ1+gZxxliN52OaTgPOdtgHSTsqBB6?=
 =?us-ascii?Q?mH3YZyPsJlqdu0IIqzL/16mWXmf4wQw/rDSN9EvESabZzfCabsxl9Zz76j1g?=
 =?us-ascii?Q?CoCwIarSFLnhCXiTogv6Ytke3RAd1g/EoqnmVgX9lbMUZL6zBIhFt993EToT?=
 =?us-ascii?Q?P7Es80yQCkfAdHywIfm942mx+6pkZcQhhO8p2kSPG362PX4YTgXQwEj8nyPK?=
 =?us-ascii?Q?uHtjx/Ibt/AzKOuhbNWKpV1DTABfxEY/hZjEEEIYug8qbD613h1LZdgaH5Uw?=
X-MS-Exchange-AntiSpam-MessageData-1: 7Y8GCTjQOVJXKg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e4b225-07bf-4f0e-3488-08df3a4691d3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:08.3819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oN8Q6/SvOzNMP2MUAuBe2oSmHrgBtudB0dXXxcp0Pmq2+HARuQ7ITUPrEtwwohLHRUpC+l3JMpcrOAmK5DtizSkKGUKOhsrvoEtrpOiy8X2VTJDqfSjSvz4+/z+WmJSC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_233815_503072_DD97E436 
X-CRM114-Status: GOOD (  12.71  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

This series makes the i.MX IRQSTEER driver buildable as a module, along
with the pre-existing bug fixes that become reachable once the driver
can be unbound and reloaded.

The fixes come first so they can be picked up (and backported) on their
own, followed by the runtime-PM/clock rework, the module conversion and
the irqdomain helper cleanup:

 1. Call chained_irq_exit() on the handler error path.
 2. Validate IRQ count before creating the domain (Fabio).
 3. Dispose of the parent IRQ mappings in remove().
 4. Convert to devm_pm_runtime_set_active_enabled() - fixes the
    "Unbalanced pm_runtime_enable!" on unbind, with a Fixes tag so it can
    be backported to stable (e.g. 6.18).
 5. Let devres own the clock.
 6. Mask all interrupts in probe().
 7. Allow building as module.
 8. Dispose of child IRQ mappings in remove()
 9. genirq/irqdomain: add devm_irq_domain_create_linear().
 10. Use devm_irq_domain_create_linear() in the driver.

Changes in v7:
 - Call platform_set_drvdata() before enabling runtime PM, so the runtime
   suspend callback always sees valid drvdata (Sashiko AI, Frank Li).
 - Fix the patch 9 commit message to describe the actual change
   (irq_domain_create_linear() -> devm_irq_domain_create_linear(),
   dropping irq_domain_remove() in remove()) (Frank Li).
 - Dispose of child IRQ mappings in remove() (Sashiko AI, Radu Rendec).

Changes in v6:
 - Split the runtime-PM fix out of the devres rework into its own patch
   (patch 4) with Fixes: 4730d2233311, so the "Unbalanced
   pm_runtime_enable!" fix can be backported to stable independently of
   the clock rework (Fabio Estevam). devm_pm_runtime_set_active_enabled()
   is set up before the IRQ domain is created, so its error path just
   bails out and no err_irq unwind is needed.
 - Drop the err_irq and out labels in probe(); each failure path now
   returns directly (Radu Rendec).
 - In remove(), drop the runtime-PM reference taken by
   pm_runtime_resume_and_get() with pm_runtime_put_noidle() (guarded by
   the return value), so the usage count is not leaked and autosuspend
   keeps working across module reload (Sashiko AI).
 - Reorder so the Fixes-tagged patches come before the rework/cleanup.
 - Rebased onto the current irq/core.

Changes in v5:
 - Consolidate the three previously-scattered series/patches into one
   coherent series (Thomas Gleixner).

v6: https://lore.kernel.org/r/20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com
v5: https://lore.kernel.org/r/20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com
v4: https://lore.kernel.org/r/20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com
v3: https://lore.kernel.org/r/20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com
v2: https://lore.kernel.org/r/20260728092219.525449-1-Zhipeng.wang_1@oss.nxp.com
v1: https://lore.kernel.org/r/20260724090136.3595894-1-Zhipeng.wang_1@oss.nxp.com

Fabio Estevam (1):
  irqchip/imx-irqsteer: Validate IRQ count before creating domain

Jindong Yue (1):
  irqchip/imx-irqsteer: Allow building as module

Zhipeng Wang (8):
  irqchip/imx-irqsteer: Call chained_irq_exit() on the handler error
    path
  irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()
  irqchip/imx-irqsteer: Convert to devm_pm_runtime_set_active_enabled()
  irqchip/imx-irqsteer: Mask all interrupts in probe()
  irqchip/imx-irqsteer: Let devres own the clock
  irqchip/imx-irqsteer: Dispose of child IRQ mappings in remove()
  genirq/irqdomain: Add devm_irq_domain_create_linear()
  irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()

 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 80 ++++++++++++++++++------------
 include/linux/irqdomain.h          | 30 +++++++++++
 3 files changed, 80 insertions(+), 32 deletions(-)


base-commit: e74798f2f8e1562f2bbd2fed8d81929eeef39ffc
-- 
2.34.1


