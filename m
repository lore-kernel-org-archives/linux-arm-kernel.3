Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B0DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OZJo7JxtuVRO3FQhxvQbz5Ty5Vlxhhv6woMS/LoUf8w=; b=D1mcm1m9uy4406Nat8S2U/OSaF
	ZWUUH0y1VuqF5oHKO+S9U9Dk2Ph1OOaC6eitZOqyBHUcRHSynnIKtPQml/Co0Ea4CrRjFsUhMCBeb
	fiwnmXFA2Wpk7OkerQ+astd4ObGYzhuv4rcJoXUytj/MYujLyvQtY9Qspe9lbrxj3JbMsX0oXNbJG
	6xQoAKO0LQTLjgvhGLZ2pabiegl9nJLw7Yc+/1w93FvUTa5so47bPy0FIhS77tdRwGt/JhE63zMMG
	J/pTgHhYSi5OXniNLbkcsqdFCHoiFywYQWbFy9CfH3UzL16fWD6VnVg4gPTxEtFGIpeu0EFVgzcKz
	E0Of92uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgL-0000000C0mn-3x2D;
	Tue, 14 Jul 2026 12:56:17 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgI-0000000C0jl-1dmX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:56:15 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBhCns2126478;
	Tue, 14 Jul 2026 07:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=OZJo7JxtuVRO3
	FQhxvQbz5Ty5Vlxhhv6woMS/LoUf8w=; b=fcsPsCcRG6q/xCEvrGpkcpVdRQtKV
	ds/bIT63akz62SIwa1m3xrFz2LAYaIgT1SAOsgwZtR23v56tPsvzmdv+siwJX3Rv
	sSoX/kdbx27ZCCrFZhjwA1bL2jI/TX4eAT79smf4HgPk75TaOt7y3HQsvvbm4wV4
	RlG8wOkVXq67h/vyOeSUbCiQTmQP+8LS0PGql5yF4NGTqFAOXiIaC9GGEgseqseU
	+JTfT9Edo4E80vv0ZYRvcWuhXdeVuDIEUzk0PXCQaS4Lg1A4H6GLWf+FPFc63faa
	qt+1lMPjjg32RLmJWYjmmYtb84fAC/EWZA65IZQWlGIu15s6Nt3QciOGQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdmg30bqt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:56:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHMLDfh8/4efdk5zWVRj8iSAvWOq/O9Iwv6BUUNYMeg1E6GkoIA0N52wBM8XAMI//paA3No+vhbwOJ+83a+6/CUf6eXHmSGRkk8KsEVaK8x83rdaRuUlqeBTIUG+9arf3UrvU1ivn2X9ME4FgtBbiLL+FJbX59EXY03/bAf7WsaMnemEh738HbDKCgmjLltYRc21E1aN3ysuA4VUN9hP09OIs8MRaUBz6bMjlAtK4l+JegYcnuvYJKjCXxiBVSAHDqE/pftiLKwtapRR8JGhy2jp2ZfA3GYo7j8sV2lWup9JKQe+V7j3/+UKstBR6v0HAN4kHevWtZoodHAeNX4xVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZJo7JxtuVRO3FQhxvQbz5Ty5Vlxhhv6woMS/LoUf8w=;
 b=svfk2nJbABBLRGLO4KFIfAdpSFaZo4ofX7Xsor2jUfDIFtvvxP6e8f3kUMwUkSV/9eu5ZVuA8o63onGezY4CxpT0X1i4Fd0C+2zOj7MadcuZeML7tOQw7rZ8LUOoXMRk3gyd9UgIZfrLRAgo/Wtpf+8AEkWf8crB1bZRoPMvwMo9LYZdahfdQqJCYdyrwjBXz7w5s8+c5mxzUbVMBTgtHVDoIp2aLqulljT7jWVbp1/cFiyX1NpHJQrIYn1dJkH+QqIA9wMbx6QEo6/i8pSdg2MSjHl57nuDV2Wc/SZDCqJfDvJCA6U7PWBxSp2lgcOVgY6r7Idz77TYgQs6dZpq2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZJo7JxtuVRO3FQhxvQbz5Ty5Vlxhhv6woMS/LoUf8w=;
 b=ppxXlY1eRRfUs9fWmsWEo2TNYDeqtbOEKZdmto3uvGSa49JUZ70dqqjUrXXwYCduqujnkFZlpaD/nDe+VBp6GodyEHlsWdUk9QdGDBOH0x7SMw7nL28xQgbAulqNS0IqEgcfteI11OA51DzD+JP6J4MasxMJKjC0oLP3kUJaoEg=
Received: from DSSP221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::12) by
 SN7PR10MB7047.namprd10.prod.outlook.com (2603:10b6:806:349::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Tue, 14 Jul 2026 12:56:02 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:8:3d5:cafe::10) by DSSP221CA0012.outlook.office365.com
 (2603:10b6:8:3d5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 12:56:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:56:00 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:00 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:56:00 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECtvVv4164681;
	Tue, 14 Jul 2026 07:55:58 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <krzk@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <n-francis@ti.com>, <s-k6@ti.com>, <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 06/22] memory: ti-ddrss: Add MR4 temperature-driven refresh rate driver
Date: Tue, 14 Jul 2026 18:25:57 +0530
Message-ID: <20260714125557.3304305-1-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|SN7PR10MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: f60b6669-65d1-4d06-a070-08dee1a74197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|30052699003|376014|23010399003|1800799024|36860700016|56012099006|3023799007|13003099007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: vPnSA20AEbuFv8BaQEjkNhE0yUMED0izZ6qqlZTkie0f9X6QxC5U7c341J73v+R+bunOnGg4SMXgCkpLoBWjRdTDSlGLKBP/YeJdZzTCk5y70ltq9vzt6JmwUHu5PvJA6W5pRv/9mCCnPqXESmcijvDOpAv/It+eJw+T3zONauephv8xuWzlyBkhpdVkBmUnHIHCfch+D1gPPx2Q9vBYoe3T4VM86yb0wl9kvAbsaiUYCDeDx0X3BcPqy7pH+2gPYUVbXJtGj2e/XABZwB8inPE4MBlK4CIGTIGRjjBHv7UQR61MyFL8lI35CAMAeTGBd1boZkvLmiZ7W4Ukg1Q9VuN1I+5kvOANNvsyyVPVt6NmmRBLBi0QIszMMIS4QaP/uu8ebVD/ewVFtY18igy8JfkdrPnjVljw1zbkO4vtXXVxw5/c8MLrqATM17K/dDEOlMLliiT5RGAYTut1uxFmfkOth6cMDscy4cmEhwUlEa3tU+jgMhOk6Wk21e0YI91zHqwaN0dJQRoVOPurhIKCJ6T8Xfizy/QiraNgjmLe22WaFZw3zrJ0GJhsEGnL9v05COPwmoUHIS/xUk7JGydLpJ88CKM+8qp/YbaABusLOSMvQOGSISjZQPX4gu4vzbRbuntriY858P540tbwhkLSpWxdO4ip6MhzU1BRiq1axKA=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(30052699003)(376014)(23010399003)(1800799024)(36860700016)(56012099006)(3023799007)(13003099007)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QMuSj/LLdmRHwzB/GfT+ArIDBQQthelCsDqg34NotACwGoSbfgXw+z/0lcYqOHiJYI6GfgNakWKkyO7qs3fE+oDXlD++2WRh/XU4lAUK7i5Q3znIoRLnLBnRhvLYqzSkf7Ky0F9cgz0FPsB9r5x9I/NWHYWEjQSy+kFjgRFmyhncABwazSd7S/k8Vi1llgyV+Mo8SuLy0VS2mbWzCuiM1DnRNUT9++t4pB/1VGZq3S78nxOrm8hJeBcCsjLEFuMec64V/MF+dnlPa995m9x3It40UaAONlBGEMIDVMlx17zFgR4pxaXr0g6GgGQO0B8d3VHGIzFEkqFWkbG7AolupuZyycBmMw54pZV1B9iYZeto2qXMX8d0CH+qWAd0pd/kltNSWDPbdwqGozPB/OuO8v7c9HKKkylRj9fM4fikQiv1bAbSKLKeCbVwTd3dm+be
X-Exchange-RoutingPolicyChecked: IAKk5ehPG9wS5Js/0Nc0sGIkeRVrqBDOdXXPftcBEiRwVbiC4q8NpiFviCDmFC/6SNKbjKiRUwWaBE3BmvkHBuJPSI7Dl00sg5ZFbLCMZeFhFgRVyu/oSx1OLmZm8LoKPZ3p8+foyI2pooi8LTWxePhxpHc+w8txGkjTKtSyHoTL4fLpIbeG1On+HpCh2b9ZuQ744A9zAED+yUM+gw375LdFDF4W05qAfYXjCufAT4SY9ZOsoO2qYaJL6k6edzNM6g12DxZMi4McRoia3cPWdijOzDr1bhPSuHRePOAWoJ2M4WyBQfJEk4GZ6ETVaS5JynMqJXtfRbOq75hu7143HA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:56:00.8365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f60b6669-65d1-4d06-a070-08dee1a74197
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7047
X-Proofpoint-GUID: z8rjqhMJaeGELPgtRpx4TcmY7scK9lhQ
X-Proofpoint-ORIG-GUID: z8rjqhMJaeGELPgtRpx4TcmY7scK9lhQ
X-Authority-Analysis: v=2.4 cv=EMg2FVZC c=1 sm=1 tr=0 ts=6a5631eb cx=c_pps
 a=kRgXGWC4h8N5Zk8PQP6WEw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=dxl_MiQ9FTZ4yJBhB7AA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX6D0ITEwl3ksE
 0JUDTylss9Homslaf0JP7O8Dsj41GUdvg+IRk19PicrFxgqnvKigVuliipos+d+E01FAuwAX8jl
 n0G3nr7cRIHCd7yPTFMha7aHjCphjPY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX3A6bQs54FAd7
 D/+pudHd5UY7HZjDzggQRZmDP6Oe4jvlj3Lij8JrSMdP5hYFTsppXiTG6fmEI3Pg/wna2KY2uf3
 ooGwE3FBR6vwFCVKgaT57mGU/8Ef5m9UYXbfQ13YcfXfluSUQeUKw/T1kT1hcQLZMyVl2/KJkXU
 e2zyQWqAmnGyOlolm+zrgHDl4hdVanSWCJEOEBBrgX6nIb1HUcghf+eoFjHAfo2H5SlEwN4IUqw
 iFI3ulNY0G1IGgmBuXQEzvzMfU02U5ICXsfRBDw6ETsHplC0XF/QskqmDo3KNav7As6zxSaLwlu
 Ddsf/sU4fzi/9PyXzyauLRhLY6u2Z9A3VxX/n4W+02taDaRY9fPNF1rigUqV1+hEl1QPMdVWfRI
 BPnwzGcMWRTEGCMPxh8jgRtOlUECL4TuAPAevkJVioNxp3V7t61Em1tntf4rLpIciMNa2ZB/p4S
 gynEHUrOn4JAeqeARaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055614_563768_6F58E0BA 
X-CRM114-Status: GOOD (  21.56  )
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

From: Santhosh Kumar K <s-k6@ti.com>

Add a driver to monitor LPDDR4 temperature via the MR4 register
and adjust DDR refresh timing (tRAS_MAX, tREF) in the kernel on
every TUF interrupt following JEDEC recommendations. Exposes
refresh_status (RO) and auto_adjust (RW) sysfs attributes.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
Signed-off-by: Gandhar Deshpande <g-deshpande@ti.com>
Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 drivers/memory/Kconfig        |  19 ++
 drivers/memory/Makefile       |   1 +
 drivers/memory/ti-ddrss-mr4.c | 322 ++++++++++++++++++++++++++++++++++
 3 files changed, 342 insertions(+)
 create mode 100644 drivers/memory/ti-ddrss-mr4.c

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index e5527020ff337..259654a12650a 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -231,6 +231,25 @@ config STM32_OMM
 	    - chip select selection override.
 	    - the time between 2 transactions in multiplexed mode.
 
+config K3_DDR_MR4
+	tristate "Texas Instruments K3 DDR MR4 refresh rate driver"
+	depends on ARCH_K3 || COMPILE_TEST
+	depends on MFD_TI_DDRSS
+	help
+	  Say Y here to enable automatic DDR refresh rate adjustment for TI K3
+	  SoCs (AM62x, AM62Ax, AM62Px, AM64x, J721E, J7200, J721S2, J784S4).
+
+	  On every TUF interrupt the driver reads the MR4 temperature sensor,
+	  takes the maximum across all channels, and updates tRAS_MAX and tREF
+	  for all three Frequency Set Points.  The auto_adjust sysfs attribute
+	  allows userspace to disable kernel adjustment and observe the MR4
+	  state via refresh_status.
+
+	  This extends the LPDDR MR4 derating pattern from drivers/memory/emif.c
+	  (LPDDR2) to LPDDR4 on Cadence controllers.
+
+	  To compile as a module: the module will be called ti-ddrss-mr4.
+
 source "drivers/memory/samsung/Kconfig"
 source "drivers/memory/tegra/Kconfig"
 
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index 3ee883c8759a9..18556ba8bb2a9 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
 obj-$(CONFIG_TEGRA_MC)		+= tegra/
 obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
 obj-$(CONFIG_FPGA_DFL_EMIF)	+= dfl-emif.o
+obj-$(CONFIG_K3_DDR_MR4)	+= ti-ddrss-mr4.o
 
 ti-emif-sram-objs		:= ti-emif-pm.o ti-emif-sram-pm.o
 
diff --git a/drivers/memory/ti-ddrss-mr4.c b/drivers/memory/ti-ddrss-mr4.c
new file mode 100644
index 0000000000000..e37b791694987
--- /dev/null
+++ b/drivers/memory/ti-ddrss-mr4.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ti-ddrss-mr4.c -- TI K3 DDR MR4 temperature-driven refresh rate driver
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://ti.com
+ */
+
+#include <linux/devm-helpers.h>
+#include <linux/interrupt.h>
+#include <linux/kstrtox.h>
+#include <linux/mfd/ti-ddrss.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/sysfs.h>
+#include <linux/workqueue.h>
+
+#define K3_DDR_NUM_FSP        3
+
+/*
+ * MR4 OP[2:0] -> left-shift mapping (JEDEC).
+ * Boot programs base = 0.25x interval.  Shifting left relaxes
+ * the interval; shifting right tightens it toward the boot-safe value.
+ */
+static const u8 k3_ddr_mr4_shift[8] = {
+	[0] = 2,    /* cold:     1x nominal  */
+	[1] = 2,    /* cold:     1x nominal  */
+	[2] = 2,    /* cool:     1x nominal  */
+	[3] = 2,    /* normal:   1x nominal  */
+	[4] = 1,    /* warm:     0.5x        */
+	[5] = 0,    /* hot:      0.25x (boot)*/
+	[6] = 0,    /* very hot: 0.25x (boot)*/
+	[7] = 0,    /* critical: 0.25x (JEDEC high-temp limit exceeded ) */
+};
+
+static const char * const k3_ddr_mr4_status[] = {
+	[0] = "low temperature",
+	[1] = "4x refresh interval",
+	[2] = "2x refresh interval",
+	[3] = "1x refresh interval",
+	[4] = "0.5x refresh interval",
+	[5] = "0.25x refresh interval",
+	[6] = "0.25x refresh interval with derating",
+	[7] = "high temperature",
+};
+
+/**
+ * struct k3_ddr_mr4 - per-instance private data
+ * @fields:      regmap_field pointers for all register fields
+ * @dev:         device pointer
+ * @mr4_cached:  last MR4 reading, updated by the IRQ thread
+ * @auto_adjust: when true, IRQ thread writes tRAS_MAX/tREF on every TUF
+ * @tras_nom:    boot-time tRAS_MAX base values for FSP 0, 1, 2
+ * @tref_nom:    boot-time tREF base values for FSP 0, 1, 2
+ * @cfg:         SoC-specific register configuration from the MFD parent
+ * @notify_work: deferred work to push sysfs uevent after each TUF
+ */
+struct k3_ddr_mr4 {
+	struct regmap_field		*fields[K3_DDR_MAX_FIELDS];
+	struct device			*dev;
+	u8				mr4_cached;
+	bool				auto_adjust;
+	u32				tras_nom[K3_DDR_NUM_FSP];
+	u32				tref_nom[K3_DDR_NUM_FSP];
+	const struct k3_ddr_cfg		*cfg;
+	struct work_struct		notify_work;
+};
+
+static ssize_t refresh_status_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct k3_ddr_mr4 *priv = dev_get_drvdata(dev);
+	u8 mr4 = READ_ONCE(priv->mr4_cached);
+
+	if (mr4 >= ARRAY_SIZE(k3_ddr_mr4_status))
+		return sysfs_emit(buf, "unknown\n");
+
+	return sysfs_emit(buf, "%s\n", k3_ddr_mr4_status[mr4]);
+}
+static DEVICE_ATTR_RO(refresh_status);
+
+static ssize_t auto_adjust_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct k3_ddr_mr4 *priv = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", READ_ONCE(priv->auto_adjust) ? 1 : 0);
+}
+
+static ssize_t auto_adjust_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct k3_ddr_mr4 *priv = dev_get_drvdata(dev);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
+	WRITE_ONCE(priv->auto_adjust, val);
+	return count;
+}
+static DEVICE_ATTR_RW(auto_adjust);
+
+static struct attribute *k3_ddr_mr4_attrs[] = {
+	&dev_attr_refresh_status.attr,
+	&dev_attr_auto_adjust.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(k3_ddr_mr4);
+
+static void k3_ddr_mr4_notify_work(struct work_struct *work)
+{
+	struct k3_ddr_mr4 *priv =
+		container_of(work, struct k3_ddr_mr4, notify_work);
+
+	sysfs_notify(&priv->dev->kobj, NULL, "refresh_status");
+	kobject_uevent(&priv->dev->kobj, KOBJ_CHANGE);
+}
+
+static irqreturn_t k3_ddr_mr4_irq_thread(int irq, void *data)
+{
+	struct k3_ddr_mr4 *priv = data;
+	unsigned int reg0_fld0, reg0_fld1, reg1_fld0, reg1_fld1;
+	unsigned int stat_group = 0, stat_tuf = 0;
+	u8 temp0, temp1, max_mr4;
+	int i;
+
+	/* AM62/AM62A: check group interrupt status before anything else */
+	if (priv->cfg->has_intr_group) {
+		if (regmap_field_read(priv->fields[K3_DDR_INT_STAT_MASTER],
+				      &stat_group))
+			return IRQ_NONE;
+		if (!stat_group)
+			return IRQ_NONE;
+	}
+
+	/* Verify TUF is the source before reading MR4 */
+	if (regmap_field_read(priv->fields[K3_DDR_INT_STAT_TUF], &stat_tuf))
+		return IRQ_NONE;
+	if (!stat_tuf)
+		return IRQ_NONE;
+
+	if (regmap_field_read(priv->fields[K3_DDR_TEMP_REG0_FIELD0],
+			      &reg0_fld0) ||
+	    regmap_field_read(priv->fields[K3_DDR_TEMP_REG0_FIELD1],
+			      &reg0_fld1) ||
+	    regmap_field_read(priv->fields[K3_DDR_TEMP_REG1_FIELD0],
+			      &reg1_fld0) ||
+	    regmap_field_read(priv->fields[K3_DDR_TEMP_REG1_FIELD1],
+			      &reg1_fld1))
+		return IRQ_NONE;
+
+	temp0 = max(reg0_fld0, reg0_fld1);
+	temp1 = max(reg1_fld0, reg1_fld1);
+	max_mr4 = max(temp0, temp1);
+
+	WRITE_ONCE(priv->mr4_cached, max_mr4);
+
+	dev_dbg(priv->dev, "TUF: MR4=%u (%s)\n", max_mr4,
+		max_mr4 < ARRAY_SIZE(k3_ddr_mr4_status) ?
+		k3_ddr_mr4_status[max_mr4] : "unknown");
+
+/* ACK unconditionally - even when auto_adjust is off - to prevent IRQ storm. */
+	regmap_field_write(priv->fields[K3_DDR_INT_ACK_TUF], 1);
+
+	schedule_work(&priv->notify_work);
+
+	if (!READ_ONCE(priv->auto_adjust))
+		return IRQ_HANDLED;
+
+	for (i = 0; i < K3_DDR_NUM_FSP; i++) {
+		regmap_field_write(priv->fields[K3_DDR_TRAS_MAX_F0 + i],
+				   priv->tras_nom[i] <<
+				   k3_ddr_mr4_shift[max_mr4]);
+		regmap_field_write(priv->fields[K3_DDR_TREF_F0 + i],
+				   priv->tref_nom[i] <<
+				   k3_ddr_mr4_shift[max_mr4]);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int k3_ddr_mr4_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ti_ddrss_dev *ddrss;
+	struct k3_ddr_mr4 *priv;
+	unsigned int v;
+	int i, ret;
+
+	ddrss = dev_get_drvdata(dev->parent);
+	if (!ddrss)
+		return dev_err_probe(dev, -ENODEV,
+				     "Failed to get parent drvdata\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->cfg = ddrss->cfg;
+	priv->auto_adjust = true;
+
+	for (i = 0; i < K3_DDR_MAX_FIELDS; i++) {
+		priv->fields[i] = devm_regmap_field_alloc(dev, ddrss->regmap,
+							  ddrss->cfg->cfg_fields[i]);
+		if (IS_ERR(priv->fields[i]))
+			return dev_err_probe(dev, PTR_ERR(priv->fields[i]),
+					     "Failed to alloc regmap field %d\n",
+					     i);
+	}
+
+	/*
+	 * Save boot-time tRAS_MAX and tREF (boot programs 0.25x interval).
+	 * All run-time adjustments shift from these base values.
+	 */
+	for (i = 0; i < K3_DDR_NUM_FSP; i++) {
+		ret = regmap_field_read(priv->fields[K3_DDR_TRAS_MAX_F0 + i],
+					&v);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to read tRAS_MAX FSP%d\n",
+					     i);
+		priv->tras_nom[i] = v;
+
+		ret = regmap_field_read(priv->fields[K3_DDR_TREF_F0 + i], &v);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to read tREF FSP%d\n", i);
+		priv->tref_nom[i] = v;
+	}
+
+	/* Read initial MR4 so refresh_status is valid before first TUF. */
+	{
+		unsigned int r0f0, r0f1, r1f0, r1f1;
+		u8 t0, t1, init_mr4;
+
+		if (regmap_field_read(priv->fields[K3_DDR_TEMP_REG0_FIELD0],
+				      &r0f0) ||
+		    regmap_field_read(priv->fields[K3_DDR_TEMP_REG0_FIELD1],
+				      &r0f1) ||
+		    regmap_field_read(priv->fields[K3_DDR_TEMP_REG1_FIELD0],
+				      &r1f0) ||
+		    regmap_field_read(priv->fields[K3_DDR_TEMP_REG1_FIELD1],
+				      &r1f1)) {
+			init_mr4 = 3;
+		} else {
+			t0 = max(r0f0, r0f1);
+			t1 = max(r1f0, r1f1);
+			init_mr4 = max(t0, t1);
+			if (!init_mr4)
+				init_mr4 = 3; /* MR4=0 is invalid; fall back to nominal */
+		}
+		priv->mr4_cached = init_mr4;
+	}
+
+	ret = devm_work_autocancel(dev, &priv->notify_work,
+				   k3_ddr_mr4_notify_work);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init notify work\n");
+
+	ret = devm_request_threaded_irq(dev, ddrss->irq,
+					NULL, k3_ddr_mr4_irq_thread,
+					IRQF_ONESHOT | IRQF_NO_SUSPEND,
+					dev_name(dev), priv);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to request threaded IRQ\n");
+
+	/*
+	 * Unmask after IRQ handler is registered to avoid losing early events.
+	 * J7: single bit.  AM62/AM62A: three levels (MISC group, global, TUF).
+	 */
+	ret = regmap_field_write(priv->fields[K3_DDR_INT_MASK_MASTER_MISC],
+				 0U);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to unmask interrupt\n");
+
+	if (priv->cfg->has_mask_misc) {
+		ret = regmap_field_write(priv->fields[K3_DDR_INT_MASK_MASTER_GLOBAL],
+					 0U);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to unmask global interrupt\n");
+
+		ret = regmap_field_write(priv->fields[K3_DDR_INT_MASK_TUF],
+					 0U);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to unmask TUF interrupt\n");
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static const struct platform_device_id k3_ddr_mr4_id[] = {
+	{ "ti-ddrss-mr4", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, k3_ddr_mr4_id);
+
+static struct platform_driver k3_ddr_mr4_driver = {
+	.driver = {
+		.name		= "ti-ddrss-mr4",
+		.dev_groups	= k3_ddr_mr4_groups,
+	},
+	.probe		= k3_ddr_mr4_probe,
+	.id_table	= k3_ddr_mr4_id,
+};
+module_platform_driver(k3_ddr_mr4_driver);
+
+MODULE_DESCRIPTION("TI K3 DDR MR4 temperature-driven refresh rate driver");
+MODULE_AUTHOR("Texas Instruments Inc");
+MODULE_LICENSE("GPL");
-- 
2.34.1


