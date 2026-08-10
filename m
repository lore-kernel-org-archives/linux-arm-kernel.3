Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69827C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eerAxm6X89otF8CzfPuE4wPlAN3J8AEBFNqdCFnlxrg=; b=gsGxj53e7YyQpiK4Zs3RDe5prl
	hezcG6xkxWl7PHSu5qGAIS1XuECSOQwlKz6chLyZShnoHJHyHLVkkhWNPHZoENwxQdWd9WBwdTP8d
	d2P2M/Z3phqtwPoCnwNlyxfRbYNAmwD/B3r6B0d7eeZGU+CcFFhQMExvtaYEnZc8tZdISccFOBr2J
	tgilv8HwygFmSHv9pVPTE6p02SMBaPwcigS++vk/BSefebadZlhA3lXwKEGsDqM5S34nlCz30f8Gu
	IgcLcAZGGkXJ+hNakXZ6sWEy41QhRVi7i9woa5yZlI0Q8z4Jd6fZm48dWbO3UZt9dZnVrpTpQnw3b
	HR0pfCcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWz4-0000000CrNu-0Tjo;
	Mon, 10 Aug 2026 20:52:34 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyu-0000000CrEO-3HYd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:52:26 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AJj90n3700729;
	Mon, 10 Aug 2026 15:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eerAxm6X89otF8CzfPuE4wPlAN3J8AEBFNqdCFnlx
	rg=; b=WR4HOe/ig4TyVwaaiaMYVes+MDeAcIzt+KjFahhifFuybl2SH98jtl2fI
	HEE4YAa34oPhLxJGOse9Kk9mwyRL/lnafqiAZEv6i5Ooov/rGAJH2CY+wtW6AS0I
	pk/xwkzTiafBFOpz5gYIVkCGmTV1tN/KOpbGI9PqyW4kZHIbo41wm8jzmqT5PFDk
	fNLbsYBcPl9IgZ5+IB470esclFT+NkAFwrG7iUgP9yxeSvFZUaapt8Rd4gOG8ecu
	AL5lFXjQi8u5AYQAKrgwxarllBCSpK7yEpeJRM7fZiVV66nddObilo5GoqG94jas
	g7aKFfmu121GKNB+4AfZ+78+xGJrg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fydkwv09d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 15:52:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWpclznjNBpylDIxMBJJN1sL8ZNXrVlsQ1b/s7nzdc6DrCknrfANWj1zW2u/DCc6fgPzWvKbPoJVZz0EdKvVGoyDFxeaPLH/7FSKL3A/f+hfRP96pc7OiW8HdIUpMDxbFyq1T43lXoD6WGF23shrnCHfKC9HOvPee+eu6dIoSl2zerce5xDzWJ+qXrqLvBa7Rv9X3mt2N21liFgk4hsyRjJz+OPCRdaX8cvHKUi5xFF2iXN2SYy6YrZg5TRz9EEx6eDDc5ZBISMcqpUAXp3gqnCTerjgCTtM0A0WMcHcF68GSBEzEE56KB9utkVckyvxSz1sc1GcmOac0AQrozpuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eerAxm6X89otF8CzfPuE4wPlAN3J8AEBFNqdCFnlxrg=;
 b=dLwaucrnnJBKQZCTUrFU6u9VSLw+s5ghJiOPG6INvhzKEjWpt+Wb/DCetnl8NGVeCGbFjam4Nzx2yb90Yy31rOfU09KAoMwx2qf/K65JjhgBWmD0l7cJF8jfsyVlCG5C7hPaEk6W8jYxjqK4/XD8JdPQrzr9i6E1dd1/9EARRqauaRzCwggiKHFweFKiMi2Da5uzeNxhsBkmRXpV0N/GiVsh4tjZkxU4uSBAR1xHIk5FlVXZbbMin2D/TAKfkINnx6oVRpLqQHwiXKeUmxmZr27VTRlGaH4348fk9e0A69m2gX1IO6hXcyf0neqPmzCuBUb4QoHth3PWN1T2SoUzNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eerAxm6X89otF8CzfPuE4wPlAN3J8AEBFNqdCFnlxrg=;
 b=glnAlmAGstp1WYDzi4/ukLKNgrfOm+MbVU9DGIeYvWxFXtT3gYWU2AZdycp9Zhe+R2FPt52k5GBwRNYCwewM7GSPeoUEtowb3CYZXiJ30u+THzsjTpfOlqKnqPSmIR3HE74fO5EphHtgViggb3O6PDCJczpgOF6qVcKIcAKY7Xc=
Received: from BN0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:408:e6::31)
 by DS0PR10MB7521.namprd10.prod.outlook.com (2603:10b6:8:157::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Mon, 10 Aug
 2026 20:52:18 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:e6:cafe::9b) by BN0PR03CA0026.outlook.office365.com
 (2603:10b6:408:e6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 20:52:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 20:52:18 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:16 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 15:52:16 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AKq8Si3838072;
	Mon, 10 Aug 2026 15:52:16 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v2 5/6] arm64: dts: ti: k3-am62a-main: Assign SRAM to VPU node
Date: Mon, 10 Aug 2026 15:52:05 -0500
Message-ID: <20260810205206.685971-6-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810205206.685971-1-b-brnich@ti.com>
References: <20260810205206.685971-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|DS0PR10MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e386df1-606d-47df-c4b0-08def7214465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 9C8fvt2uNZA+qS6AuX7m1SS0lYoV230j3kl58xja4K8OKXpzztTeP+nb+5B2Hx2RrA2sZiWetAv7eBHMSYGbNdrykSSpyUQwLa85S2OpRafUDMSToxV3BB9hznHUVeSaKKmpDTp9o3PleRhjw2gtyC7WTuFmNIMjAj7lk1/tnay6IZh96hd87wiTFa3kVE7RYeMjwj/mXw8EgFK/FN+R5tDixnPL4r2sWvzlsd6CZMOhIflIhyWC5jlIpv4MbZIllkca5BsN0DaUWN+NUfetXMfDcJMxctnQDiWB7xpFU5S0kUHiZP6H7SJLX8WoqdjISd8nlJD0YNERcq3zwwnPY5+e0WFVo0K2DmPMQjlpUJsJf3wLBKJOnZtqkZMnCxI/x0MKgqt0veW48Zb7FY9uGokxBKQz+imkNtTeT1CJuuL/4W3EBysNXaT0K9Xm9CzRo5Y7QOzpUaiFLjeKYes+vcYjFWLLuWLPGGOJnsHznh7WYDIUvWYwbQkVtoeNVUCDe/Fyk034sSktDA06erZXNxOmZrY0riOmv701xxEctiLcaKbOOFhHmc8MTQCc5iOuyIbhD6fES6HMdHZsGAjCcKbLxxwzkQJCHZn38wmns1Z6xbnZQetW2gBBQeMkTM3sfp1zz14CvwEsvKNfVKoLDhhRAo4OTAsNN+nyDVwI9oVMkiH4Tk8q5QAlrIaFZS4FXxs3J+lyI9lsAsVEeyWZHw==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rjNW+E1S/xJ0uy5lgE+iyUX7iF5db3vpxKMIHzs+LxHd5rU5tIEKdRpZ/2BOtNJBYp3efzh54M23DnV2B3L1i0/uhRAQKtEixsBGqJ6JUDsIKQZD3Mzb8wu6f02rNkghQFIkH/+mJbCLwLcS9M9SmplBzTiMokjbOOKwcSTcEiUq5apZ1uXIllI9+35Icc4Tm7wjLQsuhohgo2/RWTF8PpwP6x/nVTDdfs7I1cpwf2L2x7NfVSoDpIpkGs9CP3NMIC5yPyyh+KrFvQYXr1OP9CnEm2I8WGcLnmIdNpXOqiqE3V2upeogRb5agyVD+ix3A95lOK5Uz0QeNbbxBypaUryt8i3Yp0dChU1kejK9K171+jwaOxkz3wFk0GAQmOwkJTdTZasFh53D0Kzs6z4nkfD/ChbJgnHV1LSeWHiPVvkHpsFvT/QuiySYOSP6qYMi
X-Exchange-RoutingPolicyChecked: D5nllryCls0PcIa/Sl+YsYDOANV/ThkcV1xwlqAcsp3P5LWopvq8RVrw5OZZo9yE7wyRvG3kVTMm/3DrEsVJV8PtPnLpZlrXsIBnUcFSSQ9pn5ulTqou6rdUZjvKKKGO2E9c2qdPUCl9JKBMzZoI2oZ09osiU9jVkmO+mIxPZUzmnIyJmttc0bCXwTcVEJTvtTAtWfc6kgF58BaNCTWirhqa5YPoWy0QAreH7AOa+Eso1+6EHNd/rJB/jAm5roZEaQYkOuiY5kLh6Tc2i4f4PO0yYXprm5mg2r2C76wOKt2FAbJ6cDelI1GCwpZi7rOiYtqkQD5/Zh5EC4quifMopQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 20:52:18.5550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e386df1-606d-47df-c4b0-08def7214465
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7521
X-Proofpoint-GUID: YtDoZt_F3QG9u8GRp1aB8DbVs2pGjQ7v
X-Proofpoint-ORIG-GUID: YtDoZt_F3QG9u8GRp1aB8DbVs2pGjQ7v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfX+sO5sxZUrW/4
 H5Q7+Y13xGLMRckGuSixrxOkNmQIHIfRM3lydl5dirWrpCXGNqXIQhq5wDEiXHE8f5Y/D34+b/J
 SQEVnOvpbbRbbb4hdp+/Jj/lCazodZolFhCzo1uu/X2i4VE5Li5vEMFIuqGdu+79rtEN8SUCL2L
 wKfq+qklrH3IvT8i9JmRYeHGwbPxpj4uAOvgMgdbUUDQbcyw+bNC0vmPy3mCiKlypRPKZ5dgABL
 tpwUguP+QApl3ci7R22Y25cqGKuWh5DhYi5WxyLt93bG43jsdBOSJYL6Vkn1XjGLM7nv28fWIP8
 43MdmCw/d7ZRPbt60zeoLljO8fHwyCZJyf6lgmZQM5cy9ChYqRM1c+l6jkUE66t+eJwoxlOD9b7
 nlZzgfG/FAb5cMLenYOzT4pRoI4pW2Vdf+QsKtHU716H8GENx99D1Wl+kqHZ1Pe/9oDSo0LCQIu
 IlSwqi+dSwSfv+L1nvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfX+Dr9g8yIAc27
 gflnT1bgyRIEHifMpbHcpOnXDmwuOcIuPCpvPbq4yjiGCLI70DIpLmF79Z6jUV+2UvfcjRDLpgV
 iP5tvQJ4yobMh35Faz5RGEam7u/gLOE=
X-Authority-Analysis: v=2.4 cv=F8FnsKhN c=1 sm=1 tr=0 ts=6a7a3a07 cx=c_pps
 a=33ZETTsaPBFHggYVnTYjDg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=s826d0Vf4ljoQKYSzyQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_135225_252621_424E6C35 
X-CRM114-Status: GOOD (  10.32  )
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

The Wave5 VPU supports connecting to on-chip SRAM through its secondary
AXI interface. This allows temporal buffers to be stored on a per-stream
basis, reducing DDR memory traffic.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 9e5b75a4e88e2..92dd1b96cef4d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -1149,6 +1149,7 @@ vpu: video-codec@30210000 {
 		reg = <0x00 0x30210000 0x00 0x10000>;
 		clocks = <&k3_clks 204 2>;
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
+		sram = <&oc_sram>;
 	};
 
 	c7x_0: dsp@7e000000 {
-- 
2.43.0


