Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DCBC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wLgxA5/2tJuXBPbexFme3147r6JPX31T1YsRIZ3TZXA=; b=Wd9qgooz3Yrd/HXNAWVCZRRcWP
	KXcPaW5WFOQAw02guqnpbcwTxLCwFsYHUObBmHSORUaL5mAcMUl5/bkzgAe0qDoyr2yluy3RMaTFe
	ANZPo+DpC3UApqxa2+wNMmHhLc2+NNmbWhJIwtWdxtgRvOeoC3nGsvNXYxZR7teXjruW9heutqHq3
	lAdvbrTPk5/sDh69pnQh4sZ7SJvcAdTEkci+o9GqMuQuitCX5VwXr0ELRNd1ZX417pNC6x7SxqdF5
	WNxKrmPGsz+uHNbq5iRrCPMAM221gFnjdwhgXsjD6ty4nOvcQDXL34lFF3GCSrwmBHXLTr1sJqtNf
	9vNY3AGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuAM-0000000E39Y-3NLm;
	Wed, 15 Jul 2026 07:36:26 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuAJ-0000000E38O-18Pz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:36:25 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F4MFQS4102163;
	Wed, 15 Jul 2026 02:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=wLgxA5/2tJuXB
	PbexFme3147r6JPX31T1YsRIZ3TZXA=; b=Y73b+bGQHubcG9L4WTlsREeLNHzqf
	UfYnw4NWzCivWhnmsauQhcjD2wB3HoUoPLW8Z1z7H97qvofYo6d+xZDjEQRe9Rye
	aOyutiynU4FCpnCPK75amPXtB4PUF1Fxvw08Z2GAXTCh+99BQcb5+5LA/aTXjbcz
	F9fKhKkdJeEfmgX2uuGS3DjsNbKzBxtpNqiUAy4Y3Rd/HqfIrtbZeMi8TgK8/lDm
	IR4d70j8GqPY0XamoLFsAOJ+EFqTKKLCJCOm5m/y1hyafx59Cmn2JKOZpaPsQCYv
	Bc2R4uHG9F0BdoExyySzHU0CPZYSsJ18sEMRVghyXzlXNzcVo1Z0VVkmg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fe34d0t14-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 02:36:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mn6gETecmvP/Wqm5Tq5JPf1lVdtUVOlxkRUKNdb69C1IwmATU5rSVKsj0stm7gPina4WTR/mhz5Z7LrlB4AEb5E3ep0EeM5cKVtzlXHtxurWschhdotZrR6634tTb4V14GwH51EMAk70xh0AtO1hwH4taygzrGP1luHb1+hDqgHpoMnBo4vdHFtOC0ArmFKXiHvFdONImoadq4QbNQ1VU1hdVNJYTQJPwBBwWQ5P28qhiI3COpAfIFf1+bFyA8IJ4ru2ucrW2H3Do0m26z61X6SyWYkG1D0n0gY6niQib0hck+eBjfEJMVXG/6gvjg1sV+7CvHfXuwMWSr+v7e2PjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLgxA5/2tJuXBPbexFme3147r6JPX31T1YsRIZ3TZXA=;
 b=OlBd6KQfNteLPw4GwUt6M7S0pH3k3sAC8Xlkh2+QP3U8whzdtIyBka9ogpf9oQSwi2p4uBM4thjrMMsHd6Klv9t3Hqi5gwvDQEF0zMJX47cIPOA0H4JAj5h0QLjzs0xeSfYRFzImiEWCcKHu9usVZoH4nXVCb5XgvjhGw/OLM8wcjHGpxianOmZv80Y8q9nnomH5CnSCKZUwHuT3kk3Z9gYsMRrhPijztZxDIkcMJFNKW6sf9U04nBvnoM10nlhcV0jyPBECxBRi6dd1JI2/gxfgIM+jGafZBQAV+nRMw54YHKlicyuQTJeFcRyotJRIRayaj4fzbymdpc49DP0P6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLgxA5/2tJuXBPbexFme3147r6JPX31T1YsRIZ3TZXA=;
 b=BggjHKuJVPq6U76adfPQoBKPxHWmUqXeLiXYEsK46uxoYoEy8SXKS8EzC2QS4s66NskXel/zDZevttuxcDjxnKIsnFnaWql3nnoANsTg0rv17Vjhh+WJeC5zm9gi8szVtkFX58Z3aJfk61sw5VQTs/QDbkHSQl5T9OJnVv4XYtw=
Received: from SJ0PR05CA0077.namprd05.prod.outlook.com (2603:10b6:a03:332::22)
 by PH3PPF57C8E5D36.namprd10.prod.outlook.com (2603:10b6:518:1::7a4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 15 Jul
 2026 07:36:11 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::2d) by SJ0PR05CA0077.outlook.office365.com
 (2603:10b6:a03:332::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Wed,
 15 Jul 2026 07:36:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 07:36:07 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 02:35:36 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 02:35:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 15 Jul 2026 02:35:36 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66F7ZW1E2524418;
	Wed, 15 Jul 2026 02:35:32 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v4] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay
Date: Wed, 15 Jul 2026 13:05:31 +0530
Message-ID: <20260715073531.2346803-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|PH3PPF57C8E5D36:EE_
X-MS-Office365-Filtering-Correlation-Id: bed30147-328f-4026-097f-08dee243bbf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|3023799007|56012099006|6133799003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: flmemnVjrqAD8ZCw2qIw4o2PiLByl8c4BjM571BZJH0wleBmEzAHalyoh+iv91G+YN65m7d7J3L4/78ttThVfjWIJsUhc/bjl8D3VOgWK3mNSF8moyHdn2RtiwkOvR52hHF1QwXXy0bATRiSKnBFAy9T6kW2r+2ywXxPhYS0y6Yhng8NItoXCm/pkHsUpmilco4vKs2BWjb2IxZ+nh9bSGGaT/QmpluHqoOYQLUi4xHc8dlZGMyXnRJZkuxb3PyBDR/Ps8Yc39jeWr/hwoXah4lYPh4xpK7MPHM9ZK68UyGdtfl6fvoqJJwQBwGSS9rEOm2DfnpC9PRWS1/60WTIrY+irXyCK8XhwZVHNXT1knlu0dsO2W0eWUQiyUm6+ZBav9eIR2w9XnPTUy0fkm1LjWVJe+Tk1s87bb4yu609g6HTSlOLmsCU3QnFPH7ZpGUMsrGtbMLMn/QY+eY8hjBlvhhr2wUaUzbstY1tj6klgBjM3uJtX8aCA2cSxp421GaJLsmBAK7OchrsH+c16p7WvDaCworkGjvNZeuqhx+jzSwzOGYT1RxMC6PHwaeg1TIR73ua2VHgGp/eOkxKslyxiTVkw3Txs9Hh/PaYSmyEG8SUDoFecq1+5OKsj22zhv8VxIwqF2fmlRrRJAeR1JXxNg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(3023799007)(56012099006)(6133799003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9BtW0f68cupLDdRWxUmkFPeeshNvvmmsAnkqJ6LVKoX2UNcaivV+sjKlntRKGtakfikY1YFmhtyL4HlM0Ua+wfS+Sc2D75u9WzscQDc1aCdTTfrHwxmTfTkfryHVFLI1ROJfV3Z6V8PzxYqVEoP1DLUZw0WXImE/zkMxNIeTzrzw/CS8GzOQOk0JkHJEpsLPkRZ6LpVFfjBYLhX5QizFZO0LWZV7BvOTiJXSeJOJuh8tLnRv88P2hcQTyZoKhB0APq/WOMOkIzkJD0lzBwoKtpvdVDlmvwu8MW+ZqIo4mS21+EE5Pq3LuDxtgTffxPvbg0vhjqtBhkliU5g+YE867ZFF1K3ZAdNIQeOX4oaMQyVJaezj0yVsTV9I6Baqr77gmFehmThfDuO7f4kTW2nuU6eyx4RKOoQgw4fY1hoN/QjWHYiS/fGhMaMDpz8nh8hA
X-Exchange-RoutingPolicyChecked: T99x/Lm1f2qw/LnVG1fShhOk0KdbXY3o4U7RcoY4h+6dtskYIZdwWFxUTSmKMujYALmq2/qS1cZJjyJSKqxdD7LJEXLsPTuaiI7+qdBPdTCyNrzgXl93Pg7sok2FQONMu5KLSGHnVE8rEPddGi49pQ0P0M3LYtXZgUj+ZZZV7myxA4wr1ubHcb3nrUJOH+fxdnN3vnVowt3sWSMh6jEaRo/RB7cQejVs3fd7dkl2p0ipgd54b8mxq62Rg5Mf9wAomml5I8KyX08SXzkQqgv1VfX8RLeMyiMTNdpQV7qzajgMtsWkzbEJ8oTMT9T0xMITiedFIxueFvrjH6r8dguoZQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:36:07.5592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bed30147-328f-4026-097f-08dee243bbf0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF57C8E5D36
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfXzx7jTMm0ItP9
 s8shJ/gyJPD5S978T2DhMXxRok5TxGDhSDAvqLZ/nNb3BHF32hCuq+/sMRD60X1jgaGzRsh0EY7
 /uVmFwan3yUqIinwzFkEXnmmkCbISd4=
X-Proofpoint-GUID: Ugi8nE7enpy3-Ma_LOYiQBa8Nfl7JAtg
X-Authority-Analysis: v=2.4 cv=NbXWEWD4 c=1 sm=1 tr=0 ts=6a573870 cx=c_pps
 a=AKd2An130fSphkJyqL6rzg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=KOmJlRZdAAAA:8 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=ClvzzUG-uOCFfQbTchsA:9
 a=lqcHg5cX4UMA:10 a=z2U-W3hJrleVIN9YIjzO:22 a=Y9KJ9d7ijktqh0zzt3yb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX8OSKVazT2ljH
 0in6avDXsda9BUSmyhhp8PxBSAgibh+dzFJgbUfgzTtO2NjnqYUO1R9nKuwuXXIs9kDoJsDYiUs
 9I7Wejm/JXBJ8ORkLvDI906iBZjJWx1sVdPOdKxsZBrS4pXUtmV8uf9eQs/HwDcSO/49N8DzG1X
 z5LTn75NyWqa1IfHRk7eI4b6pMbNXaJYTHiF/aos45PUfRoMvdovgkZU06wjjFGRhpMWfUewvMv
 VLvIiHn9SUBPHM4ENvch8ALHRlavOuSNcDSKc3EBN4cfUTdpHE5b1Ron0fMt2I+Un+zvmPzTMOp
 xbXQbyp/LNvODR6Wy6x2to0hYD1TVXW+W/BleRYm/iKVBW4s3j6KF+zl57G6NQgx5i5BwoS9eDj
 JprNXAqS4L54LJu1dv/VoL6KiV+GcGiEU95w/dRMC1y5mKXSESoRGItgLqyNTqPrUxQerWZPO8V
 1xgAaYptVwBjrBpnUDg==
X-Proofpoint-ORIG-GUID: Ugi8nE7enpy3-Ma_LOYiQBa8Nfl7JAtg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_003623_564594_2B0A0F57 
X-CRM114-Status: GOOD (  18.74  )
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

The panel is Lincoln Technology Solutions LCD185-101CT[0]. It is a
Dual-Link LVDS panel and supports WUXGA resolution (1920x1200).
Furthermore, it has an i2c based touch controller: Goodix-GT928.

Add DT overlay for the OLDI panel to connect with BeaglePlay platform.

[0]: https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
Changelog:
v3->v4:
- Use https:// instead of http:// for URL
- Dropped redundant details from the header as suggested by the
  maintainers

link to v3: https://lore.kernel.org/all/20260528111319.3262698-1-s-jain1@ti.com/

v2->v3:
Use tab inplace of spaces for indentation.

link to v2: https://lore.kernel.org/all/20260521020630.816220-1-s-jain1@ti.com/

v1->v2:
Move overlay-specific pinmux configurations from base device tree to
k3-am625-beagleplay-lincolntech-lcd185-panel.dtso file.

link to v1: https://lore.kernel.org/all/20260514225502.2327771-1-s-jain1@ti.com/
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 ...5-beagleplay-lincolntech-lcd185-panel.dtso | 162 ++++++++++++++++++
 2 files changed, 166 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..f46e64a7164f 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -26,6 +26,7 @@ k3-am625-verdin-wifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dev.dtb \
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
@@ -208,6 +209,8 @@ k3-am625-beagleplay-csi2-ov5640-dtbs := k3-am625-beagleplay.dtb \
 	k3-am625-beagleplay-csi2-ov5640.dtbo
 k3-am625-beagleplay-csi2-tevi-ov5640-dtbs := k3-am625-beagleplay.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
+k3-am625-beagleplay-lincolntech-lcd185-panel-dtbs := k3-am625-beagleplay.dtb \
+	k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo
 k3-am625-phyboard-lyra-disable-eth-phy-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
 	k3-am6xx-phycore-disable-eth-phy.dtbo
 k3-am625-phyboard-lyra-disable-rtc-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
@@ -340,6 +343,7 @@ k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
+	k3-am625-beagleplay-lincolntech-lcd185-panel.dtb \
 	k3-am625-phyboard-lyra-disable-eth-phy.dtb \
 	k3-am625-phyboard-lyra-disable-rtc.dtb \
 	k3-am625-phyboard-lyra-disable-spi-nor.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
new file mode 100644
index 000000000000..ac621c32de9b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/**
+ * Lincoln tech Solutions OLDI panel (LCD185-101CT) and touch DT overlay for AM625-BeaglePlay
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins_default>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+		enable-gpios = <&main_gpio0 0 GPIO_ACTIVE_HIGH>;
+		pwms = <&epwm0 1 20000 0>;
+	};
+
+	lcd {
+		compatible = "lincolntech,lcd185-101ct";
+		backlight = <&backlight>;
+		/*
+		* Note that the OLDI TX 0 transmits the odd set of pixels
+		* while the OLDI TX 1 transmits the even set. This is a
+		* fixed configuration in the IP integration and is not
+		* changeable. The properties, "dual-lvds-odd-pixels" and
+		* "dual-lvds-even-pixels" have been used to merely
+		* identify if a Dual Link configuration is required.
+		* Swapping them will cause an error in the dss oldi driver.
+		*/
+		power-supply = <&vsys_5v0>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				lcd_in0: endpoint {
+					remote-endpoint = <&oldi_0_out>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				lcd_in1: endpoint {
+					remote-endpoint = <&oldi_1_out>;
+				};
+			};
+		};
+	};
+};
+
+&main_pmx0 {
+	touchscreen_pins_default: touchscreen-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01b4, PIN_OUTPUT, 7) /* (A13) SPI0_CS0.GPIO1_15 */
+			AM62X_IOPAD(0x00a0, PIN_INPUT, 7) /* (K25) GPMC0_WPn.GPIO0_39 */
+		>;
+	};
+
+	backlight_pins_default: bl-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0000, PIN_OUTPUT, 7) /* (H24) OSPI0_CLK.GPIO0_0 */
+			AM62X_IOPAD(0x01b8, PIN_OUTPUT, 2) /* (C13) SPI0_CS1.EHRPWM0_B */
+		>;
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&oldi0 {
+	status = "okay";
+	ti,companion-oldi = <&oldi1>;
+};
+
+&oldi1 {
+	status = "okay";
+	ti,secondary-oldi;
+	ti,companion-oldi = <&oldi0>;
+};
+
+&oldi0_port0 {
+	oldi_0_in: endpoint {
+		remote-endpoint = <&dpi0_out0>;
+	};
+};
+
+&oldi0_port1 {
+	oldi_0_out: endpoint {
+		remote-endpoint = <&lcd_in0>;
+	};
+};
+
+&oldi1_port0 {
+	oldi_1_in: endpoint {
+		remote-endpoint = <&dpi0_out1>;
+	};
+};
+
+&oldi1_port1 {
+	oldi_1_out: endpoint {
+		remote-endpoint = <&lcd_in1>;
+	};
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* VP1: Output to OLDI */
+	port@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpi0_out0: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&oldi_0_in>;
+		};
+		dpi0_out1: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&oldi_1_in>;
+		};
+	};
+};
+
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@57 {
+		compatible = "atmel,24c256";
+		reg = <0x57>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt928";
+		reg = <0x5d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins_default>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <39 IRQ_TYPE_EDGE_FALLING>;
+		irq-gpios = <&main_gpio0 39 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&main_gpio1 15 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <1920>;
+		touchscreen-size-y = <1200>;
+	};
+};
+
+&epwm0 {
+	status = "okay";
+};

