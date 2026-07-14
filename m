Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B89C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oio8Rk21t2sr547w6CaYUMtntBZZAvw+9viOORSTLco=; b=vrOVL8jMxXENICJYuW9Cyo4Val
	KEEqEnqA6Qf3RIV0AUb7bRHITbZyL/K6ZYVnjsuSaiB4uzqGnmVbQVNYPxMMRb3Z5ILmEFX8C7Azp
	KdNC1o5sjO4E0IZpFMHJE0v1sUOsvCDobCHREmZrClvCgIboK0ol2bysuQpVkQnlnDtzpK5eGmlD3
	jFGnlW1K1hBLTvSuzRKi3onUG5Pdpdt/lR551boWJzvwYWYa3gph+UYI8HrLuplw1PmydqAjEWS07
	2htUTWkwxykbJCBQFeYB5XP15cDo5DNKKxCCCfuCeBzm6oW+lvpXJgI05ar0eV4K1EhJaZtFeDz3r
	/6r7ZQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgn-0000000C1AU-04uQ;
	Tue, 14 Jul 2026 12:56:45 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgc-0000000C111-48lD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:56:37 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66EBPqFl695525;
	Tue, 14 Jul 2026 07:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Oio8Rk21t2sr5
	47w6CaYUMtntBZZAvw+9viOORSTLco=; b=S4gb4r77FnfAAPGGwWR6Nt3PS0xhP
	94yZu3FSJsaRIcwAr9t5fODbKy8pa8NvTTBXQs5ANmUUf5bM7VOkgghvrR4KjPfG
	oHKTZdwFaqOYGgQXbn7pn+ZwNnUl24Whx1S7MkYKjUBzVWPvFBQeyW11BI2GNqK0
	unafarismMzEyHR4jmOMgl9fnAKeZ8rtm5xbhjiRpCDNN7SDOPmIiXjVHTufDfOe
	AEqiqVVmlF2MWkSKFC41E4pM2Z2+iJOJfro47nY7EY/bSlkIQ94RfuVYg0UB10Bn
	qcNIQ5Hb3lNN9DHDluRfkkHodRv3HTPycnxyGyRo+tDzOl11so1YTTTsA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fdm2dge01-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:56:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9xFQV0WJbmsywpqdfDMOD6AHWv5P3xJ3P/u22gm/UUYPNDXJtK15rTNlhkaE319tLt2ox8y5HQIdQcWLCW39FKlsK4dCzAp9pOKNn5tH0O38dvOHmgBHbRX01ZMZa3g6KUw0EGFSf/c5C87zLirgHU3zCTc3Jqt15HhK5oP7KlWQH/C7TQrWE597rVFkI9Ur4dY90xxmFM6zaEX78rSStSr5NFUKJPbw5VrSiYQze1d0e5oC4tFpRFjWRzlGmCE0NUE9jxb92W2JdaL93a/l3tw2ZVN5XUEY/gyQuF1phi3aUCZl48PVRYvriK2EYvjIQyU+VXclGAYMoAI3uwWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oio8Rk21t2sr547w6CaYUMtntBZZAvw+9viOORSTLco=;
 b=b8Txgzg5CTDP6/vCVvRVO/7BTc669DGsL8Z+QukgLE7JlbRqPtzmwGc1RWirHBVgtc6u2+pf5MDVsY2FS/YD3gcGhAapCfkorf3pb/2N4YThfx5LJqPo0FqDZ+b9xZuRluZEQZYCXhALB8inY8Vv7PIPuSW6TBUud+StGWgCgfMLqwLbj2chpQPrt9ndJcbXY1aZ9/esEZSq2YA5EnM0MRa0RVUO7rNE6Lynos5gs74/zXzJFaZe59pzZRv7e8toN3Z1DeEfkXdK64Yu+qYh8VIzR2W561xboJiQFQz1WcgBZ+ElnyQ8RDkcQ2+uuEa31oIr0N6EmC02Kg4NydB/QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oio8Rk21t2sr547w6CaYUMtntBZZAvw+9viOORSTLco=;
 b=rWcPTewD7J7tN5z38Wd1a8b6lo9+Az+8HXDSd7Cusw1eWs/J85suANBmhYsFwHRAx5ZZls3JDmz1ZxCGH4LT1ESfo2oCMqHLdpbRFM76CqKb/czZQ7+mA/ON8YXmOCeXtSU/auadElPddAF2+KGn7gEi44tnH98+0HIYLd4PUi0=
Received: from PH8PR05CA0005.namprd05.prod.outlook.com (2603:10b6:510:2cc::14)
 by CY8PR10MB6635.namprd10.prod.outlook.com (2603:10b6:930:55::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 12:56:29 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::50) by PH8PR05CA0005.outlook.office365.com
 (2603:10b6:510:2cc::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 12:56:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:56:27 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:11 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:56:11 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECu8fU546300;
	Tue, 14 Jul 2026 07:56:08 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <n-francis@ti.com>, <s-k6@ti.com>, <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 09/22] arm64: dts: ti: k3-j7200: Add DDR node for j7200
Date: Tue, 14 Jul 2026 18:26:00 +0530
Message-ID: <20260714125607.3304375-1-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|CY8PR10MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: fffd53a8-02d9-469b-9893-08dee1a751ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: kSmApeSvYw0/YoKvDOPnl1TlJLVpbuMxvWq4pfg6sxEg1lZ8Yq20Tdn5uHjv0pDzYHZvHq+OgkiUCEztRLafyvwrkTthUN+o3hC+CXHlbV3MNnyx1g9QeTlILbfBlTNGNtwICmU90zzG27w8vR+lNj4V9V21vLByAEedqJQ+Y3PqLV7fDEmtduYjJPTPxAYgXiuR1GpgUDfUFLv/qO5d4+oowSymk/QOkrn7wnn7Q4RU2Huf6gQCdLC+mR98HQhW74+LgrXs4n9V8ugYUZyjcos8F2kaZpnLhE2dY+55m1lfbJD44GEXV0PUIMsKYNs9GZVXMv+4JlI4X21sb6+yqHRJL/sFZUmmni5dIlY+aw6lLckj1fnanOzhMtPLsEMFfSQxbZRKIMd8e7QOWUU8ncgY8/OshVeZBDLPPhnU4LT3lZ0M07Ge8+ZNh3cfAEPqfyoTpooF1doYHvePPBro4AEiqzKW2ifbOIYbX04eiPDC1UarxXZQveLbr5J7pQxNc9B83Q8iiCamIZB/+Go4UOiSPyGZcvD10F3sMphYqLfni26a6kXYl4JGoadMtIYaqgIiGMnkRi7Ip/+Wlf05Hl3Gyqi8S92KTXue4HlKZ6L2c67xl35Km/44YxasKMDzErb6Tbxf6GVDHjC8jyKfWgfM/w6hMrTzRWMnAial2illkLNhOrLoG/KCe2wqoqvi9c8gJge+/TWm56kFYULLSA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tCnNVQ/mrc34QzcDgO3q7UDd6CpQ5xxZP0kbduzxAR7/uBREviuUJCKrCeruz0iPwuQOQY1hYA/RlAqv4FoBsXLlRuVcTHGqSg9dRasfT5boL/+x2ItSITJu8Ix67GwbC9W4sDgOVU8gC/72eXHHjRrGWLxObdz6rsPDCsTWSS+aIdGXzYsh5LVp4E+Hb4JQxGsBjBFBGjxI0btzH9p2BBEVgxBaIIIKsiih09Ce0sgK3m/NK9EOz2VRijTpj/GWKL0u3KRobYPBWjKq9Yr2o6Uk2tPUJEBHPXtuKFxzr/5HO+DGbw2ZXonBiLSLK7rtmBxv2HkCgpjm+8dBgANkcgfMW5SZLRswlnO4bkK1GJ8fCjb/DzRSMfOOfBt/2+rRnvSOxLf+1gvOArfxPHycleRv1t+XioW9sIYHi+lM6nCcFLnMRiOsrCS4VwSsHCig
X-Exchange-RoutingPolicyChecked: oM/zPRX1rwJnxycE29Yzz5cURfDjaTPIiNtudyitpZGo3Qvz6q1q5bhMkB+IuLBYVOQXJrhM2R+TgbYIlSff+pZ2poQ7365r7xNlgIMtRnNxdExGQa00qvDChbxr9T8M3xo//kboNJ/z0l33IlZhsg+zUgNjwKu6X6tb0a0hPlTd2CMOdD15pHZYcJXN2FvCr78bTxek1MIW+YfkXuMnqq9oJQxtkaZlD0T4wgdm5ZwKF11bl5gbBk3jcA67KtXZ2zsWdOTHf+GomGMlHk3FlPFr3eLAWep4k03teXhxOCTfFXHYEbOVPxgeYTCujX6pslWJWjTTimxqlISH755YeA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:56:27.8483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fffd53a8-02d9-469b-9893-08dee1a751ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6635
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX8CZvsnN/Dt4c
 NO+kFN8EOojbGYZVtEGLCF7NL84N3NSbDNkXTfEHhR6XaUho+TL4mwzawyqrez1Suw3KT0Fz4PS
 sYkXfa2v97ZP4CIlAlhvX0d9/5G/Yr0=
X-Proofpoint-ORIG-GUID: j-f86YakdptIz2oJbIYPKwPYS3Nh4Hi0
X-Authority-Analysis: v=2.4 cv=f+N4wuyM c=1 sm=1 tr=0 ts=6a563201 cx=c_pps
 a=0dUMnQhOFwHl/g2jU5Tm3A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=rrn-1AkOBrcl2fV5P3sA:9
X-Proofpoint-GUID: j-f86YakdptIz2oJbIYPKwPYS3Nh4Hi0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX8+0pbKlWZNei
 YNlF2HRK2FJ7+xK8vagnez6AD/oFJGytKXmWdcXZ/k0PCSDPlD0frOZyC1EekHVrytmmGWKrmW7
 bokuS7AcmRTyitFhJROWs5RI89ugh8uWm5Ab3CIvB5mjdwkYvaqISdypbgyCaziy00DWgGaOzHJ
 xA0CfzMfCqL1BzaLVtgi3zSD3oKFF1S5qYlCxjkVdCveUpdd5BFV4A4KJ+dxuyszjU7mcYDe/NC
 miDCBi+YS+4rRqHgpQJoHJ0gOIFZcjuYtFi2z4lA56L1q9mt+eCEh90viOIZGvDXiLgSwVQJZAS
 uFK3u08IZUGqXSOnkIAD7hPH2CEuO8XdTeMRp1P+FngG6UHB5aIb4R/1K4j5tKKoo9537ihp1qi
 fVj6FMDPjsNKQiGGpd+m0RsDhsUFQKlNIIT9fVUP9SDsFA9XyNJLy4tq2MoxqJLGSBMC9KeeNdJ
 n4qzVeg+TygjAnIqcjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055635_031624_1D0695EB 
X-CRM114-Status: GOOD (  10.66  )
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

From: Gandhar Deshpande <g-deshpande@ti.com>

Add device tree node for the DDR controller on the j7200 device.
This defines the memory controller with its register regions, interrupts,
power domains, and clock requirements.

This enables proper DDR controller temperature monitoring.

Signed-off-by: Gandhar Deshpande <g-deshpande@ti.com>
Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
index 67fde5667b8d9..db519239129a0 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
@@ -1556,4 +1556,36 @@ main_esm: esm@700000 {
 		bootph-pre-ram;
 		ti,esm-pins = <656>, <657>;
 	};
+
+	memorycontroller: memorycontroller@2980000 {
+		compatible = "ti,j721e-ddrss";
+		reg = <0x0 0x02990000 0x0 0x4000>,
+		      <0x0 0x0114000 0x0 0x100>;
+		reg-names = "cfg", "ctrl_mmr_lp4";
+		power-domains = <&k3_pds 47 TI_SCI_PD_SHARED>,
+				<&k3_pds 90 TI_SCI_PD_SHARED>;
+		interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x0000 0x00 0x02990000 0x00 0x4000>;
+		ti,ddr-freq1   = <0>;
+		ti,ddr-freq2   = <0>;
+		ti,ddr-fhs-cnt = <0>;
+		clocks = <&k3_clks 47 2>, <&k3_clks 30 9>;
+		bootph-pre-ram;
+
+		ddr: ddr@0 {
+			compatible = "cdns,k3-ddr";
+			reg = <0x00 0x0000 0x00 0x72c>,
+			      <0x00 0x2000 0x00 0x4b0>,
+			      <0x00 0x4000 0x00 0x163c>;
+			reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+			bootph-pre-ram;
+		};
+
+		ddr_pmu0: ddr-pmu@100 {
+			compatible = "ti,k3-ddr-pmu";
+			reg = <0x00 0x100 0x00 0x14>;
+		};
+	};
 };
-- 
2.34.1


