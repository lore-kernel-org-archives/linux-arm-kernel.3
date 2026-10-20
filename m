Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAE9606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZbHpzvu1;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=gC6CZ+x1;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=esbtHFaU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7F7Kq2Nhkfckbmtp7x4VQ8B9iQUhIerk80mLMGWhys=; b=ZbHpzvu1jdnxh5dNWHVOmPI1ti
	MB4AaJSjdM4o/YRd3If384CF52pjBjPmYT/iiYLDnfXhujH9vhlE3240Igcst0eBRrMt7qnKaGoxi
	LM3tYiozM1zPmNrNXyswwfjD80SHnniSpPORiLYLI7CzePD7AYMK4onNhPTEefC1P6YFjLKiJ+LX8
	VPGMsreVZvqafZRkoWM3gQLbffCsSqOMtgHwV4BLs1EVcSkH7xY6qgek0hkMlpg80T/Uhcga/czYY
	rGI8dEX70YaAUzcvl5u53y/ttKZdvLUSD7ppFFOw0HORoepGfWeDOgB5TDR0MnoCWInO/BLLY3zv8
	Z6Eix5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Kl-00000009aN4-24fa;
	Tue, 20 Oct 2026 11:48:47 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Ki-00000009aLx-2mIr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:48:46 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69K6OlCp1514885;
	Tue, 20 Oct 2026 06:48:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=i7F7Kq2Nhkfckbmtp7x4VQ8B9iQUhIerk80mLMGWh
	ys=; b=gC6CZ+x1aWAlO5afF5bv1JI/AHHDlDHrLePVoOEJKWqjJfwCB05e5jd9J
	Cv84yVWH6UhkZ1NJD/t59/9I/O8C76xXxE/PMZlO/iSN5meXxboqgFuYbt8Iehfp
	LsY24GzIdKS3LVt5AmwszYgx2bnRHInZ4SKGT1AZCv0U5TMAtAZL9zUdOFz1FjKD
	+7d3siGqoEqhh7QxRprtlwymVq1R5CksvJ1KCnoWtteM3L3vMsVBRUh5sL9w/Oeu
	Ow8SXsc61wYyoi5yuyK1FszgqSKkOkI92vCBdPEQhhWWTWcN4Ja6lWhW6DMzdrQn
	+d5YtipH8Z8fiGY99SGKDeH3oFRBg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hdw6xkd7k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 06:48:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYBL7NfMrtM0szVhWdcXtjoIUBzJ9NguMTNTYjta2nMEw46OYjwA40aBHZe7ULcuw286zDjfiubPnLWtuP2w+TRjTnTAMOhds92AJse7UyYgOopclJzMUKcv3+geLUXYhhE+YfjmPTtbJ8At+Il4Rsji/2yxxqMG8YFwf/kk6SCDwqun0oXVeZbmBwkLToZVIet8ZWUDoBAv6SbZgFpFRPml/0m1ZbEOwNR5efKomdhZUG6O5f75lFYluo2KyAoHfSHWyZUFAaOmavBPLdYQuFvdkf4z05FyrmaYvSdqVdjgC4N5WFGmbtXWML9vXQBinWYW4mHnvv/LhITEVIi51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7F7Kq2Nhkfckbmtp7x4VQ8B9iQUhIerk80mLMGWhys=;
 b=tzzXJlOgZZpxyJZlXxCGJgIYfL8VSuIHyyMnlHdazFwK/tE06wclXab5VBv39lo96WP3/d6UdGcZFlxU4OmG/efk0FhWyu0YDSNC6xQejjQ8GrHTuDSAgUvQ/3JErrvcw9L7GllzKgR6qs/4CsQWeCMpB2imTw7IKrZ+MMGchfmSJs03pj2OeWegB/zOdE1UdtsSh2jTqj0sBSFTfy2G5opU5UgsVcRjxzUZMfljQaN99n/BwhaZkWBY7z0scJLS9YYWWwX8XBun1EPg7A4sRtDY4mXneKk+vF7NxjipKz/4kqnrz4CtZWbvmNPc4hvVj+d1evB04eRkcvElTNTx9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7F7Kq2Nhkfckbmtp7x4VQ8B9iQUhIerk80mLMGWhys=;
 b=esbtHFaUXL4XSEA+V477mdHit0vPfSBwVMK+tsDp4l27zK02J/pQN6yBt9C1mq1GWfDSOLQ8IoaYJJZQIFmxIFnAil4QDVdnVd38gztyjJC/Xa6k7z7RIXaAegHgGefuP0oZqQ4CnjoiTtITbLKZ38piCJq9RQeLf8I5eLLOpkg=
Received: from BN9PR03CA0234.namprd03.prod.outlook.com (2603:10b6:408:f8::29)
 by PH7PR10MB5816.namprd10.prod.outlook.com (2603:10b6:510:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 11:48:36 +0000
Received: from BN3PEPF00022BBC.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::4a) by BN9PR03CA0234.outlook.office365.com
 (2603:10b6:408:f8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 11:48:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BBC.mail.protection.outlook.com (10.167.248.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 11:48:34 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 06:47:51 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 06:47:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 20 Oct 2026 06:47:50 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69KBlgln516673;
	Tue, 20 Oct 2026 06:47:47 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v7 1/2] arm64: dts: ti: k3-am62l-main: Add DSS & DSI related nodes
Date: Tue, 20 Oct 2026 17:17:41 +0530
Message-ID: <20261020114742.872536-2-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020114742.872536-1-s-jain1@ti.com>
References: <20261020114742.872536-1-s-jain1@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBC:EE_|PH7PR10MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: db06a259-1147-4b32-ba40-08df2ea01246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|261009223027099003|10067099003|18002099003|22082099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: QK1T2aP+Y0y7FomGBsBkYt6rbENmhLmnitMY52OHhlT6dV92tQXJ+799bVFGaTiKBr653QOZJJR8LFMQyXL1Th7WicIiFYqE/tdDRIi/dDm1mqzwRFbNWBGMXydKRSHUP2bVDTsztvCJdNXEySVJIUiOkJ0E3twNb3LVrvIP80g8ygLtrMMecvfOwJbuiXBfIcqCYMsKXD6uODzQKg9Nigv5YM5VDv3cHQ15A53ucf3er2zjkpebZtYVxm14DzqAQjxSOMJw37OiVFNgykX/MY9eLeq9kunFIkf/tY1XVyyBzXB5mmdrvFTD/0qoVOdDIzUV7FNQ8wGAogtdxX1+fy1N91mh1ebYALhILfctLm2tU73/nBLFnqBSPpSo/6W1MX+NAmvBb7Rlc4LxufDwhXHk7ZhXfv+1T+uiycFLC9zX1d6Go0AFjASIh7WnNOFBzRWXgJl7SgZDiVaM2Ohn3YsFy4K6vpvQVFMEevnxox8cwPHI9ORc3JLb0WJV2mv1IpAV736K+Br2YtUwaGH0ukPl0uPeoGnkj6dS4jKsD1T/V3KwOs8iitDPuHaULG8AyBLBQNVTxZMHlL7tz81tHHTWUFPTR3SjkBIF72Hlf+V2sGi4ERoP/O7OhzPjEzGVumGPMvzm5po3fSBRXAzmKo/UfGyqWcCLZngN2A+iMuG3v1SnDzyr06l11cZuUCbvtbQVJcNuI2Ut3SnDO7WXsQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: afKkqv2T+xpXPsu5K/2MIr0noqAPz1M5FTev6c+R3e9LSIKQPqcRGqRNPqKLV4fWsfMQSsi7QAnwdp8pQE9Zihk8dAQNv3dGQ089zRZMmM6oPzNCfSxIrP0PTxI2GMI2xSNv7HXW8C4nixNh8yJXNDbvtjRDpqDGaCM+49FNvVN8Itp0wSrlMuCH3AWXhWazZtN4BN89/Z83+55iLCDSiGHF8ZKzOlkMzC7n8yKfZssBOIdvP8s6xGbCrlpINw2COI0k+IdRCvq+mBM8GwC6fmym0q0it0SNa0QP+77DpwS1zrQXhaQly3NGHK7hd3xemWJpE4B7Upx8Y+NQ1P7zu6rOEsTdLi+bMbdfSjFU3sDPl9BuiAcgHk+T3ssfq5ZTvMiJVXxZFRhG4L6/QCLaofaWHS7a5n1wuJAkeZe5p53ZarfvBx9A+Q3BKq6wNQG3
X-Exchange-RoutingPolicyChecked: XntHL4JihfF1OjR4YAMlQY7PSs+0PqEaFSB8oZ8c8EYP5ZRApQ1u6Zj9OP9I4dJIHABrfxFRIUsnFXJRUx/rxKa99NsPe5Rkz9ThE3GHuP/SOTi64HchNwvyc4B9bfYL9MOtpuJwf5W/9mvDgleTOiFoLo1jXpP0x5j4EtmiFuRfRY93H4fdq+si1qZpesZunJp7XZiqwjPpjNwEXKFG9TnxyWFZRfu5rlPUCmveHvHDQzIPpR9msSwMn6+2QAa2OQQ3pLlEmCeyQQ94pkR0dTAaatCoZDdBF/OeW6BeWwMjKw42EP3KJYSCnuBILqlVYNY4XfxDMECuKKMo5R431w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:48:34.5064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db06a259-1147-4b32-ba40-08df2ea01246
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5816
X-Proofpoint-ORIG-GUID: QgdA_SucNH4B16aAC0L8KHd6XEXubrrn
X-Authority-Analysis: v=2.4 cv=ZLlCCn7b c=1 sm=1 tr=0 ts=6ad75518 cx=c_pps
 a=ggyiYYPOIDPuJa++h0h3+w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8 a=FLfJYUKuRQtBdiMmcTAA:9
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: QgdA_SucNH4B16aAC0L8KHd6XEXubrrn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX8YmK8IlCUke2
 7PkTEYdnuISZ2/7Y9KqHxHeBiyi3X0YGKBd/y/8bzQtH/+Qe6Pt6NILA+jm/OzyMaSGTc1ZSnl3
 YlCXojIQbV5Om0zrLM03mCRT+gRCmbD29oh1OV1j1qPYul2f99rAajdbPSIjFxj0au7QsxmGyBY
 un+ArF9BoKo5HG7VqFep9TE6+p2MRK76OkNwgdf0xcmpK4LZAacozhoERAZuu5rs1rrGRtB/tYQ
 SK1f6pbAvNFLabyTO2P1kp0bmcWzYDddARzK0HWMaKzYJhWev9Ho6gE4x9IP3W1PnsXzN6JsqpN
 EXv5hIX2sE2pU7fNBubhZ/GpObpxg1dgpyQw/Wp9H/yRhp48IFDknoQHKggrsxQqJ9Hw2Bqr8aO
 FSl/b3rLl3gkHyibVttErhHPamhwf2anrFnzsgK6G6pyCAOC2qn9vCkQYUisyTyS/1jPJlhiP1l
 h0s1zNE9DbcdrkRJ1AA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX1g6OdcDS4xar
 bSvhhmIu/T8SEKqRAwUqmBF5x35MY+Yqj9z6U+LGfl1BMpkGfwsq9fV12DjLIV1h/xelscbXoLQ
 YQR3O3liAUqRS/8/57zNnoFSPdyQ7fA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_044844_711018_D108A8B8 
X-CRM114-Status: GOOD (  10.43  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Devarsh Thakkar <devarsht@ti.com>

Add DSS, DSI and DPHY nodes to add base display support on AM62L[1].
AM62L shares a single video port for DPI and DSI output.

[1]: https://www.ti.com/product/AM62L

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 60 +++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
index 80615ca1e01a..a3199a2455c3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
@@ -544,6 +544,66 @@ elm0: ecc@25010000 {
 		status = "disabled";
 	};
 
+	dphy_tx0: phy@301c0000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x00 0x301c0000 0x00 0x1000>;
+		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&scmi_pds 86>;
+		assigned-clocks = <&scmi_clk 343>;
+		assigned-clock-parents = <&scmi_clk 341>;
+		assigned-clock-rates = <25000000>;
+		status = "disabled";
+	};
+
+	dss: dss@30200000 {
+		compatible = "ti,am62l-dss";
+		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+		      <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
+		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
+		reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
+		power-domains = <&scmi_pds 39>;
+		clocks = <&scmi_clk 162>,
+			 <&scmi_clk 161>;
+		clock-names = "fck", "vp1";
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+
+		dss_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	dsi0: dsi@30500000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x00 0x30500000 0x00 0x100000>,
+		      <0x00 0x30270000 0x00 0x100>;
+		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&scmi_pds 38>;
+		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	gpmc0: memory-controller@3b000000 {
 		compatible = "ti,am64-gpmc";
 		power-domains = <&scmi_pds 37>;

