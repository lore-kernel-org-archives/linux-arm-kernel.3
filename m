Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B54EC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RHMO/eCzB/kSURYv3k4un+1agIbSNh2OWYRi7oJVZw=; b=uOkiOhL5z6LcTTyeKuOCMtOU5y
	Wc3zoO/dWtV0FGwsFbu14ETNOgsXplqx71h8nfHcIbhY+BqxsUEtGGhuZUXNlDzL+KQY4TY7LFzCU
	SJPO8IRPPCaQ7E4OAac8bBwhSKpjk7Z4r49vAgxX+4MQa3H/wXCsea+7kvTSyf9Z3mNsxmXCDqd6C
	FhbTeTWwUBhVuwDQHWbFtLXHOMloTA3hvxJyfFy+IXNCO5GNYLfq6cYhWvAhGZvZphyIfdV7XGuad
	VhYRC745pBirXWY/OETQgVwrfqrznEfchgx6xM6Nxv9qPh4Zq3YBNV90PdPTpZ2cMcFV+ensz5Yno
	+tBFex+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyw-0000000CrGW-1PpW;
	Mon, 10 Aug 2026 20:52:26 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyt-0000000CrBs-056I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:52:24 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AJjL48029182;
	Mon, 10 Aug 2026 15:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2RHMO/eCzB/kSURYv3k4un+1agIbSNh2OWYRi7oJV
	Zw=; b=WhgtRarybdJjUEmd5REk1VAGkVMgd7N+Ub37x3gcak70QRJHgJA03IIVE
	0nDVyrx3n1OIh9cP0wj11GKBoXNCQQbjpZfyYKcvblPH45axV3u+x1l13cSTFSGz
	lzz6u9NwtIeIaundme5eLMcGpuBbcAU11nKek9PxSs1c5uUA9UK9rdIF11In3zIa
	NIVAvrjAYQ7IvVd1O+rt9iYuqxAwT6XEj3LPW4R78EibajK0tc7QPXTL1vAEVd06
	J9vvNIF3ZO9CfuZOzIN6VF6fQfm7ACGrqZg2CXapFOnrWUNxNbezpK7gS21WsVby
	iU0zIah97+pBFrAs4ZNfVJD05Jxzg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt7byfr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 15:52:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7FgryBYkTrmFP7feYmHEUP9cJWrYQII8qeUMD2NngmEupRDCyXROv2q5vmfeHXAeTVrwpP8XG5DCCQuitOmsd8Wba7uIFSPKpif8g3oZTwPE6WWVUZ0DQz/wu8NQnnffKgY7gdRmEUPA1gUp1GuBNDXUJ73AL7irdzujPhCmGS4SiC00gmAJYnYyW1d8jUDEYiRmIhsXhPvsJvhqRGPTWq6hXcHE4o6PQahCJh14Bek4cwWeY6+KDePO4CEtDqMFlSICcFd7ecx9Ylyg3iD5LGr7QOIuajr6yJLaLQuA1VXRqEaXkR9UPm5vX1IDXy3gMyCCkIIEdBg+OV4dtU7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RHMO/eCzB/kSURYv3k4un+1agIbSNh2OWYRi7oJVZw=;
 b=KtGVHogpYki7WaJwA5zBB2ksOL6y39w9dZ2BrkuTHDiLTiF8rlKy2bLkNq/XEPva7a2u2zgTPMMs+3J/CfXG/cFIHa+XILTam8KtFP7+T8I2NUDCDXeuaUhwRdVNt2C+5oflhsQ9sSH+zMjy0uvxv8cWZJWSPbfMsW6mmDaXdZMLRzzuzjRQbbAf53hsOx95Lq8LXpVmRcq9L99LRCgxHVFHUpCAY996nmLskmIU1Vc9u65cm6fJlFhctaj3u+gQblqnQdf0ZOW6HASbMhls/Y+8ofSjp8PESf28C/aHZnu5d9aAp3zD7lugciejfNlKTNfrJYs0Ccd9G91VwP2wDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RHMO/eCzB/kSURYv3k4un+1agIbSNh2OWYRi7oJVZw=;
 b=CudcWB8U1FJUPSqFXSxEI/HhUQZyJwYLtrG1D98XMidxLG2GMq8N5ApZy2HhdwC/6eIEyN/OLlMdGO5RBSkhlkKUIGGmUFAe2p5ooRAGhmqeO7JS+CmFAJ0ptuRELLQARhfGxIj6w0GXE0k5AeUqoxagmL6DhGPokqLsgCzaR9w=
Received: from MN0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::10)
 by DS7PR10MB7324.namprd10.prod.outlook.com (2603:10b6:8:ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 20:52:16 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::51) by MN0P220CA0017.outlook.office365.com
 (2603:10b6:208:52e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 20:52:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 20:52:13 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:13 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 15:52:13 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AKq8Sh3838072;
	Mon, 10 Aug 2026 15:52:13 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v2 4/6] arm64: dts: ti: k3-j784s4-j742s2-main-common: Assign SRAM to VPU nodes
Date: Mon, 10 Aug 2026 15:52:04 -0500
Message-ID: <20260810205206.685971-5-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810205206.685971-1-b-brnich@ti.com>
References: <20260810205206.685971-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|DS7PR10MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab45f52-5847-40fc-9eca-08def72141ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: O9ri4mcUP6Vequl3/7r8k7X3uYZfeRBZhRunkVp9GwHMDimbzPra2wVfZDwU5tMLWtcGoetkPzRks+nbjpxoqCq8oOYuwy1gXsrenqU2iEDEobjQRQIG8iBXzoDc9m/5P+i7XiKmX23xF93IVCeSqqsV6nXDSWoW2BaHnUbOq4Ql4RJflWZNa9m31glLWhmyh5fHeKc5O6WwxnmPYDBIWs4j1a+fEsD5wS+IfJ1evZYfyBpF4Wx8sTWp0sCRsEcGLNIviorm0/q+rGrqFkQjo8/k2KFoJQRWT1XgowNJzWg55ItnNO/ZORC1GOSPuZ3V7i92HpLn1GHAa6tyv7msPAeYEVdlqr3WFPsiTA2GftI4ibhtTsm4axzmRFdS2gbOpx2MIqhtx2+V+qzP9R5JDgsj60hsou54CC6dg9/NS+jJGowgE+z/S3KJm7zSKMDb2LipkctWPFLLVNv3WJYLAloauX+aey1DFpoOzWfPjuVSzYALiSsj4flLixe6HqJIWOkyKUmXOGxvnoFXXJkq5W7na95zEOdJPazFpkHLnUgPiv8MeC4T/SN4uFlbqerC3pzVQcijGHrgNsq6mdRqh05z2JbbfcqjfNS5MCZ0rotmI1ZUoyxM7JFi9oVe+yr+1vqwivZ0Y8vwKFzky759XN64MuEBEmefJmYwGGIyYSppr9mqH1VbfRnaSHcVMPZKYeIYJPPSFGAxB9C/aZK11w==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: goNm2/EpG2alBT+yDUJKobxYQw5y0i/dr9RNBlgwhqJRR+PdnQLE07XVkIkP0ocjFUSjn4LVWS71f4M9uQPY+MQVZdzx+OsZgGLtdcwykwI/MgjYQF4T9kwYB+sHMTvUeAlRyc2bUnydNEf2mMuiwhx+Z+E7++8whjv5bTkGzwsZv6ANfI2SgnMgKLDVDPlhMk0HrSNgU1h/TuTbjQFA7fnx+dfApC9x6oHB50X/4VoOBEIgTRfrTGsuD5dEvZpj6tRskweX/0QAwE7YmiapBjStxC6qPA/uTYyMMztCJJVJrZJWigeHqHCRj/RIV1o+64JrwbJgy6bqSor+bUesEm9oNcfKQjal1lItp+5T5ZapfyzDYwtqM7psWW3kZXj1s2UEnF6vV9sTqyu8IXTQEWZHS66KvotZqr6a0wpscisJqQvnP37gJgWtAgOSWdPQ
X-Exchange-RoutingPolicyChecked: KK4yO6s18rV9WNDBbYHUui8NRqFJr2x1sFURs76GzvPxVYl+QEmuJpargfQmS0RbikdUodVqq5o057azYygzMGxN6wU3Uy/zShhDcsLTGe1n2YCC8O88nGsGhUTa53lA19Q9uQquzSyma/nn0u7rf1xxJ+jSvYQUwt3X8sXu0eYFVYIK5J+nWz5JjU0CzLBFLVBCJxZJVsfpQgqpzwAN35F6WBEin07JqXfYnQKGawsdAWfHLS12InTw9QMYk825Z0n97ICrnzorHKGI3jy/MMkC36uG9Oc0cbqqwY7Rm1k9C4GlpTq3h1fwNvIRjxf2BzupFTzTLxr4k9Zw9/TIkg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 20:52:13.9869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab45f52-5847-40fc-9eca-08def72141ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7324
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfXxizTAs0ESZqf
 Y6eRVVEtU/1ogsCfv0ral4f9KFy1huPBWpewWZcQcmc3mwMDbyULmvWCJRBS4KH/UT5sJWfT+A6
 wW/ERddnYuNT2+7JK0pOrdbxUD4GVe1hOFgjhFo7hdlMlNfkXG7RcNWArIjlJle6fcntLVO5JDl
 5tLkobkmwKtqIXbfu8idqvRsmJ9nj8Hn2Lex65gDkZSnsNwPD33hzAsOmDhXLC8YHAcNRqEeTE2
 5ffttwOjDzD1hTSrfbiKls9XyoxFH6QhsqgYinvTtCRHsh68ZSGEyp3s4p7/H3QkRDTappL7zZt
 0sGqvgSmnJ0xBzbTk1uTVZqsF7+GS224sWz91ATzp75kmYhfh3Eo+Vj2DQ6bVaovSzXF2Y7gKfU
 HSdxGLcZomt+KDNYXQmTtVfcTeeRbjBR2wf04LMi/IGQXKZ+12BAhzzkNMz7k/Obh0kuPzrLvVo
 9ZYAOUjlVw0p45TIPYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfX50CE29GG0mVu
 mWUf/wrZVC+qglNGpALxzPeZYBJnQmn1dBAsEbyVlobvlXSr4FeYCNmp1iXjju9kTERr1Ks3km7
 9zixrRyXTDAPSAU5K36Vr8kEp4iq8xE=
X-Proofpoint-GUID: rDI_wU7wVmbaHtRSjGPyLJJ3LKpKJPdY
X-Proofpoint-ORIG-GUID: rDI_wU7wVmbaHtRSjGPyLJJ3LKpKJPdY
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a7a3a05 cx=c_pps
 a=Y7Q6ByIND0QZLGHO7LoGYQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=wxS1McjUFTrq-ohyWZIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_135223_079765_8903FCAC 
X-CRM114-Status: GOOD (  10.15  )
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
Reviewed-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index e836f0f42e30d..21ec9f207ff63 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -1002,6 +1002,7 @@ vpu0: video-codec@4210000 {
 		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 241 2>;
 		power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
+		sram = <&main_navss_sram>;
 	};
 
 	vpu1: video-codec@4220000 {
@@ -1010,6 +1011,7 @@ vpu1: video-codec@4220000 {
 		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 242 2>;
 		power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
+		sram = <&main_navss_sram>;
 	};
 
 	main_sdhci0: mmc@4f80000 {
-- 
2.43.0


