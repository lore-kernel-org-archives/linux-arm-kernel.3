Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E76AC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJE+G/P71BwT4pEgzbE4CW2maQ5/jJJBBZls/qXSfV4=; b=3SZJhupX2YViIeDVjf46WhvHxO
	0HrM4JXG/41EKrY2546jVvih0kGVqT2jkioTECh1qS3+QJ+A+0CGmoqrCiESDs65+ykVYOW4EOYmv
	3OBUhHLZZh8GvuGaogV3XFyJ/VstDNC2fI72N54XT5V/32U/KtHxPVBqKWOvGdJPE9llKarFU+whg
	neukKboTLzy8YM0MPfl/qh7RA1yQjQsscZS6xnKunQpgGNgSa/Dv37g2opuy+viMQvJom3OYIF4Qy
	Bbll/kQ5E5cVWPG9BVlwR2nhTqiDi4xlv33fH3E57/1NYcNrGzw0P6Q+00UGM0VwBYSNvsPLZEwKz
	YO/sXjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfho-0000000DOKV-0s8M;
	Tue, 11 Aug 2026 06:11:20 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfhj-0000000DOJ4-1xND
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:11:19 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67B50D0x378227;
	Tue, 11 Aug 2026 01:11:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lJE+G/P71BwT4pEgzbE4CW2maQ5/jJJBBZls/qXSf
	V4=; b=jH3haVHU9Uivw93yCtU3u73jW/RBHSr0pUiojZH8vbm5AQTxu8u2kaKec
	J3TswsJia6z408UGFF5PLqhj2RGpNDguFOyeIsuQ0UYlumF8asCMGKQJbTlEI8R4
	v6LC9OaKQ/jwGrTAgUbwcoBAYGVrPL4qKwK9LcoDKsuNymCH8370pYlGUMT8bsIp
	pboMbphuCAagrPKmGceDxYSDcESvLselNpDhOlidZfYGyv17m7A6iSWNjZIsfTdz
	dILQlM/k4nC1ntbCleL1w+e7rBECyFMUZYH5kNNUTp0IqUIfqiV9Zwz83OcG8Lpr
	K6C6wCBRxkPfrb7pFL1H13KL0+pbQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt7eqa7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 01:11:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMN6PKGE2jmbvVkekfrtA/I5jRZ60lXkqsy4qV1Fzea/Qy7CTvawUEPI647+M5SMy//lNxYkf1YWtbP0f9upg+6mNRATvC2Rfw40KvDA159d+fH5B9vHZbauh7YJHyNbEAixtVkBILLpIbHjaNjdwyRqWHNcpldbrgweOT5Ku48QhOQ2wor0A2rmwSONxADb2ZnQiqC5cMi6jr7uSsm7UC9vWFzWNJTwBlcRyflNMBXaVq7mHtEx6ieGrit/e8us69FIXzFYazVZ7dplbKDBGo2Td7tkzFdJXBK+/TrzINn+eMBwng72X6DCe1ErUF24h69gqfC5cgp9XpDWMyRY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJE+G/P71BwT4pEgzbE4CW2maQ5/jJJBBZls/qXSfV4=;
 b=H6HwRChQr450dCgcFDg0Dx1D+ULfJedXQRf9YEoSDWWz5Zm5pER0sSUdZQ/vAob31nvveHB4JtqeYFQ1ndO2qBO89sLAnWcxao2kk6GvM8d/i/6XRZ4LWT1vh4LK/K4NLoqA+Nzd/VDcxHXfBtpgLbeEPhZkcntnf2YVSyZC5iWAE/s4+0Tw9Aswb9Wy/BeaFCH8yGFIW3SZfwmw9ryN/11/dADyH9ry0o0RhlP1oqsh6L7oAPb1o05qer0hKIJpDuFMSDS2JMDbUMvG92JULwI/bA0oI+yVBm44mLH3/vj0WpV89dqTtCf4nYl+fmkOZFaD5xq71EeQ7VzKJuIjLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJE+G/P71BwT4pEgzbE4CW2maQ5/jJJBBZls/qXSfV4=;
 b=dc/0NBO5x1tBDegmwkGF4oXbNKXobO2LNG0YCfYJyYWd0WMBiZRIiLRhyEn+G/annG81nuDvA3t4uNIONlZsYdUVarvl/pWZtv5u/K8OCf9OzsEJ30JtF9sz1p5JiG0aqmGQnIe3m3v/ktIRjL3cvK7Uq9nVkpup0DqQGxl1mJE=
Received: from PH7PR17CA0008.namprd17.prod.outlook.com (2603:10b6:510:324::8)
 by IA4PR10MB8302.namprd10.prod.outlook.com (2603:10b6:208:55c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:11:10 +0000
Received: from MW1PEPF0001615A.namprd21.prod.outlook.com
 (2603:10b6:510:324:cafe::46) by PH7PR17CA0008.outlook.office365.com
 (2603:10b6:510:324::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 06:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001615A.mail.protection.outlook.com (10.167.249.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Tue, 11 Aug 2026 06:11:07 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 01:10:35 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 01:10:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 01:10:35 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67B6AHI7580944;
	Tue, 11 Aug 2026 01:10:32 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 4/4] arm64: dts: ti: k3-j722s-evm: Add ethernet alias
Date: Tue, 11 Aug 2026 11:43:43 +0530
Message-ID: <20260811061351.2538688-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260811061351.2538688-1-s-vadapalli@ti.com>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615A:EE_|IA4PR10MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 239cd0a8-f315-4854-348d-08def76f5580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: gPsa8QF7kjEZ4uKcP/+iG5FrxtFYr9Vx1Qww4A1oUoo5x4izBO4AdHPAIgFDtdUKUS2X375h5Pmfbu3C9M/+2AmZ0GmJ66qNhnWLbVVgQGZGczme2GG1SCwADe1ZOc3iHD8a4U6rVI1xUYoyNIGmt3C6VvESB4UWTT8zJwZdIh8fhu3cpXX3dvWmpui+8o0i6VH6Cnn9MgZ6zeEo2PqYOb8cTbBcPyyMAD99btjvtnE6t/0dy9z/YBw+m8nqDYT+E4bpgbALorgyhGNN8QC8CkS6D8+cEz5tgoIzZFV6BC4NEkn+Wq9IQok2I/kVNAUap6X2Cfd6c103GuzTkzqIosFej9jBUnY5oo2uGTQCTF9YpKlxsjWRRummMDnN21N1BsshLw8Uj5PuF47QtQqaqMKWkRAiPeTTOhMGO0ounLAAFaEdrcLbML1Noxmm/eUHTP7EHp9YUIa9hg4upx2IadVQfcM68RtmIFtumFQN8jodZwdJk4N3Wak0kaWko3UhuY+tHrBo6dP4O3eDCpZBNMPHS4X8x/cD5MWan25eLpqHwGWxaXNO+1iW0MyYpib98sfiJChgOtf68m1cYw8XYAUCGXp8vobvdJDZJpzWZRc0sxcNtVTHk0aC8wk8togLtaN2Zp1DkzmwWUf8sug5cJ8Pjf8RduTud6UNZ33Zz63jmFZVEG0kI1KWXySEdUPliRCqJq0Q+CEqOnMjArMKHw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0xE5oTKyp9BFsOMKsWd+sDEl3Cpnemd59P16cjd0NP4dbkw8hFwrmOXWFwhySHeDbVpwvVXr+vs91XZDB4/ulgpUanFZst5J4NCr1I0xq/lbqHiDzSz5duhbc3gWpFx85P20OEf2g00RD0mwEglcSRNGCOM35zx5SfYodOayDgpyJmhRTvf388CRoAeEpBGVVuWQ4RjRc7VuE8+nKQWG399UJk5gdmhYq1LNlNw5ydTWxMjYnDogFwUNMa5SPdnFcK7XlbgfzczBrnjhA+kQ9Xg+1mU4KFTuErrPUi18uohQn2Wx710tYZFamJ1ENLL+Q123RB4zy0Q4s/v8L8RyXMS9R3K3BBmxOLU2e2cO5iVa1yQX+hdk+h/5KyREOs02eUWTVfJ2opgLUHMd/MaD1yWn/jEykudGD782Qc3evr5bZ7JdzcxDMXm59CxLAy8G
X-Exchange-RoutingPolicyChecked: oCIJ4NaLKXEp6ysE7EhIZfYXhqGeP0dxaZAarTXl09+fljrsYHXLo3Nm5khRUeBCQHzEPC1JxnpvUpzAjla+zzBnQ6EaBIrL9unDX3holS3Eu+tbi0K6TAGyuxImKvliQty6xyN/YAANlypXBuFvSs5YJX1O/ct0VtRmLrozst8x1+tvc+jwQ3O0FBKpQ3HhfMLQouyajKyBtzAplYclOx1oV8Iec8Wph7OovSRVqqpIzbOPQ0VHuseWlYgQQzD3xmcZIKJWIgCgvigBZuBgTD5fm1SVtVudu5WTPCSQD1S1mefd3LVek0CI+CnZiy9iLJI52Ouj0tXwR2Jxgp+VaA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:11:07.9768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 239cd0a8-f315-4854-348d-08def76f5580
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8302
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA1MCBTYWx0ZWRfXze/XsyL5j9xt
 /YRa0x/KAjAa+G4eFUw2PDA5h3hWbKXMdw0264GUjGE64aRs0sd5EHWbbieC+mfZoNZS0NAbp+z
 Y0GFH3r6oSR3v1nlm1h/bxhvpb+fEjoDZa+gFvfDz9eNuXgot4/25S8hK96nUBrjCjjXLFIYJY5
 dLvQUR5UGh8RPH83uXG/vrYP/l06/lIKso3QUtsMtA+k34tUZgMLd1g408kyDonDx7qAhrzEqCh
 YEFeX5zTXv58fzx+2GcxQHG++8rJK5glPLL4D2iJBMD3nZgghWoz6l5Cg8TTzNpnXxS+58mCS3l
 tx1o5VcR52ufVeAVZo6zOX7elPm70PI27jq5Fyg8XVKuO7/BTMgLMBsTVvbr7Vsh4/UUMqwC6pD
 ASBGDQbEknroe/LqC/j/URhuX2PURXburKYHtKRVAgQ6Lnny1Q+RsMhlrx1h/ThqX4DB4UjYR+t
 A6xHaLHyAkvuESyANqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA1MCBTYWx0ZWRfXwjwZIyt7eMTK
 /5sW7snda+xt+QrIU8pr5lb7c0+AC96Nv8Wy8fqvmLM8ity+5uM6l7Kpj59QjW3HfQOdCqi2tdA
 M8IIpVlDiH7IuMIj0QJgawLQwsn24Es=
X-Proofpoint-GUID: ag6yB5oteZ6BCpkg9X5U8lOlZEEMu_62
X-Proofpoint-ORIG-GUID: ag6yB5oteZ6BCpkg9X5U8lOlZEEMu_62
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a7abd01 cx=c_pps
 a=VB8Rg5rwfRosJW56o453OA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=R1RnWXuzQcguIhTFKrgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_231116_532611_85043953 
X-CRM114-Status: GOOD (  10.89  )
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

Add the 'ethernet0' alias for the Ethernet interface corresponding to the
CPSW3G instance of the CPSW Ethernet Switch on the J722S EVM.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e66330c71593..e875c047d52c 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -23,6 +23,7 @@ aliases {
 		serial3 = &main_uart5;
 		mmc0 = &sdhci0;
 		mmc1 = &sdhci1;
+		ethernet0 = &cpsw_port1;
 	};
 
 	chosen {
-- 
2.51.1


