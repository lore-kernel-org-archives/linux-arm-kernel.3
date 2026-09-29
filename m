Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB99CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlqrS58w7/rx4vgYHukMM6wuQABrJXq7ONc4aHKO7E4=; b=RIxP9DBsc0dNbWwmBjuLVcl7tr
	acYB2RSHtC6XiuTSTSPlQ3B6wFD742WeXjNZVl4u/LS/HeoSJTZkrUCAYbOMyBd7oUEihB8ZK7Hbl
	6pBkCDCwdLZ22k5ntsqGpUY2R2PSBJm4CR7c3jSsoXpBGzc6Msb1yTEAucRUrW+j4I/255nkDRtbQ
	+ge5JIkFHuzQDfr0633DzLkuvE6aSWk0mm70YcUW0O8e4US9314LGNe6AgtU8X9g4L0w0qIrgmcTE
	1pskF5Pv51PoLbv5muYCe8JkblDwaCRcmIIuPGwLoivWHiuJN9+Kb82G8MTyMVN3j82Zca4ZqPICS
	+J3TLvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeK2-00000004Tgv-0ffq;
	Tue, 29 Sep 2026 20:21:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeIl-00000004T9s-2RAd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 20:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LlqrS58w7/rx4vgYHukMM6wuQABrJXq7ONc4aHKO7E4=; b=XhF+emheElVYwV8rJEHHVfKFWP
	JRkTEMurFkzI8jzz0ElwDfiT/y2exMSHZSaemn7Rp75h9pMBevaF2sD5su9GK49J8vk6k7HWj6rfU
	Rbyv9tKikUTeqiqI4MpQazXKrbxOofzg2bLsnI+fHSuVCP2cyjl4PQRFjW+e4B9X+IZYFVa/TRoMH
	lSATQ1rPKOqSLzpXBFN7+qVurTVyHC1uYAQ1YlamwgGsw/fxHeSYn66E/Kpugl25t3B+YIkkIwqyX
	pLvl5naSOEGhFry/008FmzDhKGZmT1OeLctWzM0g0Mm+3zND6DKAuk4j7+TsoA2xAYs+HyogJ58Rq
	cvK9HOhA==;
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBeIh-000000033NU-2M2P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 20:19:46 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFjP7w807535;
	Tue, 29 Sep 2026 15:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=LlqrS58w7/rx4vgYHukMM6wuQABrJXq7ONc4aHKO7
	E4=; b=kPOMRCzCig3s5brcu8/3yt+bMSkfTPubYbl/d8nNsORmch6EyGWFLhOQP
	709Jciagbwrqoh4WEdsSu2WbaobeRoLJJ9hWb21VCXCnOPuT4yzxcaNMXGQVOzbl
	bhtiiflLnN5YUUlrNcsmTIrjsrBXRkNSB1UQ5fhxIB4h0NGlQrMqCX6hKvIO2wsA
	n1YbkbSnJ+PaoF1W6gGZHxuU7RVJvYLv/zYS3azK0J4GV+/3C6kukAAdF7t+Xtnn
	M3ZLXFcvN/txTd43s04y6S1ufPkpdk2Lm8qf5x56UqNcdX9qMOqtqws8bX/pUHEL
	sdnlqOpltBZf9bF+hLJyWgMDwcrZA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011062.outbound.protection.outlook.com [40.93.194.62])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j6ej48-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:19:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU4uUiV9xPZgc8HelFttjsxT662mu8iDZaDquiWLf6T8tyoADN4VI5XS84kYQPj/owHPsSHIEdnjdghc3N/MgVb91E2kZpIJhoOwh3enftvUIsgj+pt77SWoEiFfp0omMprVKvrV0wTfqRX+qM8hoFFyanwFBWEVHaH19Dds/QiW0MkkfTQwBah8fusU/7oPKOpff9B8SzvwDjyJcLOsuaIwRDqxeRbNHt7NyAZRv/nJ6GUJb7AW6WioX4SX5Uf5Y+y3Z0VFf2gb4hI+tQGATuXQCJqlXp7zh01DD7mJCzod7HsB6YDyAUew5f2FgTGUJMDEP14aSBNL5BsmBWALFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlqrS58w7/rx4vgYHukMM6wuQABrJXq7ONc4aHKO7E4=;
 b=Cmvhkk8bRM4akIsMNITj/TKzlklE12FiSHrj4mGfn2+l+PXZ8+j9Mni51bj0m/EqMatzyiyrIJEJ9Fq2MkzHh1UCxQcVTM+I+3KtgMtFeSYizGfsNHklacZm6WXEHlpLhjNvazrFsAZ4409RQlnJ1L/GIwbDLxwtNmd6CykMkb1D9zF+y/8tRWLMsnTHbEJBVVld9E4JVvyLYYz8fLOfRsWRyB8T/xOYiJuOsANXyqIuHWKHGtg2orJjTYmv8VYPHZ405ZNfRkVmtSpcXk6OaxKCsXeZ5kZfv4RJmsqr0MeNOUWN0dLs5eA8VgBNj91x8PzS89Rl1Yh7ICCNonk3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlqrS58w7/rx4vgYHukMM6wuQABrJXq7ONc4aHKO7E4=;
 b=eg+Mlg/sb8E+3/HgyX9AIPWVaflz/QlxGVJ6M7HdeivGgLi5Q08na9VNZ2dpnbxEIWKdN524WPSvvwihe2h6/rFlrBVe7TRFzbKSfDL1/t/aJUcj+hj8vw/JJalNQ6SVKoOcqINWzPWM4DMxJYCpXnGQW6UwVGG/CI/v8ChK08Y=
Received: from DS1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::8) by
 EAYPR10MB998117.namprd10.prod.outlook.com (2603:10b6:303:2cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 29 Sep
 2026 20:19:25 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:8:455:cafe::1f) by DS1P220CA0013.outlook.office365.com
 (2603:10b6:8:455::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 20:19:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:19:24 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:58 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:58 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMu1688208;
	Tue, 29 Sep 2026 15:18:55 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 22/22] firmware: ti: ti_sci_proc: Move processor ops into its own file
Date: Wed, 30 Sep 2026 01:47:46 +0530
Message-ID: <20260929201746.4078803-23-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929201746.4078803-1-b-padhi@ti.com>
References: <20260929201746.4078803-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|EAYPR10MB998117:EE_
X-MS-Office365-Filtering-Correlation-Id: 296f58ae-8d47-4351-a900-08df1e66f450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|3023799007|10067099003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8C3OQI0V4huLOpFAiRr4iaftgBFhoET9HvyQfEcmUynk8VHS4in4WMgnjuTdjZ4zG+orqaK4xu8WmAfjoA7hTm9/snZxjRPgeG4dkvHqA9sZh69epXr5Dd3zjCXmlsru+LgcQSiNi7Kikiu8s0O7qT8zZkOwkzxJrYcTgrNUu3dXYGk0K92mfpwy9dUBC/4eU+U3QUR7H5oDHBbjjCupO19ES0y2Yfmo3Q02CG6H+7qS9wLCDrmCuZT287I/jOqZl8Fo78V+yR54FlBz0p+iCgjh/7rNxf2F/okXne5k8MTq76JLP3mNOJVKSIOH5AbSYpblyFaP/bauPJwjN66SonrvGNhxVvxFnnwG2tnl7xwYwNk4hc4kifWi2cUpI20NIs0QyjIGTu4hBbFyolx2DGI78dpk32FmLEh8KurYCPuCKU2cHeng9gtwxerwtZ7GCeWMzjQTpwvzQ6Yt/Z/NpwySdvojyiuqvke2PqqYuSBtdrH4EsVeQZ9/0lom4UQgqBY1H3b0CycWoZnfBiHqOMywEWePW+G+xxjgbEC64RwhKw07I18UafqwATDSQ2kGEwDFmP0iMBsu+9gOH2X/y290XwMUq4eiFmiENNR/sar9SH9nDbg8UC3KLhw0V9rqW2vo9NtKvXLTCj6Hwjth/Q==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(3023799007)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y3rBYJr8k3OBoGl5igfo6JsstsiS496TrHX8Z4O+yuXD95EFvP8ySY0ZxSyu/nVmud7XcDKsAFs7+MtYKrH4OQo3FVS8jtdsCJ+e0C1hWOnGxE3axgjPonCgK6ExfiuBsdbMgUG+bKQYSSfqApADbxaitTb2T2/AjncWzkiholqyQELWi1QwTepteYzSU+pk60TLmpHYYyG2SeTdBU52s+nUhBhmTNxytc7LIBp8Wh9ZMRGEhib0h+SnyucWxKqpoSv+BYj4pIiseDgjmJ4p13h3xxPNHjrBc20QDamjYnRUvCr/RhwQCoHXfkb4iiWbW+D+BXv0Hk3GuABDL/T7+QJ/00Nk9Ufnl0VdPrudAzx3B6ZcaTTjwx4EmYP/1mFertbizukSuZi/SLu5t/sAc/CgkjLWzo/GsvP0UGTrZ/iUXJ2bbb0RwMFNnDIaAdvI
X-Exchange-RoutingPolicyChecked: fb9hMlLSMrEIYYNHbuF4/XVQl0oUQVhFX2ja4Q2J+/focEHn5t9GoGwkvKHqYZNifFyT52hdfmexhF9fh+Ap5rdNR7xDZyYG1PevtBurbgDzn+ZEwyVO8mcXsMZC2VivHEBgB2wPuhCNO+cMKlDPKmHiUHv/UkuhHE3wX+qf9jeXq0zUZbDb/gKEmUH0fe6SKk5hbGJlYqfEeLroYcrCSLVXOaCimEm9KP+JeU4SGaMX5li+CY4pr8VsE9Fpq1vEUhw8FhEZLxlGe6jC8EqGHlQWXSZKYxQSmghd9d7lvvpItHqBo7Dusb/CpGOP36e2EziQWkU010Nd1NCXxgDF8A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:19:24.3394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 296f58ae-8d47-4351-a900-08df1e66f450
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB998117
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX5RonZpW95eGh
 nkm8wjp8TdAOfQK1kIxQtVFQmkzMnw+5JajIZjaJ+ljwAyHTIklgW7fEQM8fg3H7ktPdqvFDEnQ
 gF9YU5SuK9lp0CJuortibHTCEVjgiBE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX07AHtedAgUgV
 3PURDj6rXWeP1p9Vr3430MykzwUBfRmrO5FDCoThr23ziLNVOtda2imcnEYayccm9lUaCRFvdd0
 MG/j4KbcUBhNSmwIBPvOW7Hpp52qeMy5u8BM/AUW8HOcK2JxzxXjDooOdx9ONOEAZ9P8z+CE6M9
 lG+xZK/en1o9aM+ZbRyLLro9YJ1l/TvoDNrc4L4OGbUldXzZQmSOUfFjCLdvtJ2n6jkD/VtzvZ8
 FeybT2XFocWX+w09Y/9OGxxjwG1s4IbFWtWZe/dHp3IEjPkLRPvtTBm/hP9YrcMlmO4XRUR39wx
 rn8keOWSge7cRoVNO2yl4RAoFToDVGhHjUN6ik6mW85J9E+RN8Gmk0ZwAOVk+cQI07r+AK2933b
 3+25D6zjfm8glP3L0lMMa0u70Os0rFLk9sa/zP65A8dD5iM2Y0l4KxmmT4MjHezEOBUiTAe1ms2
 jo/j8TLsb22WAIrhd/Q==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abc1d50 cx=c_pps
 a=MAgfROEylrrND5Jw8NuT2A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=DwFzR0z2sfOMQUobDtkA:9
X-Proofpoint-GUID: 7HOzJa1WslmYjQciVc6P3EAgYkuLtJd7
X-Proofpoint-ORIG-GUID: 7HOzJa1WslmYjQciVc6P3EAgYkuLtJd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_211944_243305_762A8A30 
X-CRM114-Status: GOOD (  17.93  )
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

Extract the processor operations related functions and services from
ti_sci_core.c into its own file. This breaks down the single large
file into smaller logical files for better readability and maintenance.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti/Makefile      |   1 +
 drivers/firmware/ti/ti_sci.h      |   1 +
 drivers/firmware/ti/ti_sci_core.c | 197 +--------------------------
 drivers/firmware/ti/ti_sci_proc.c | 214 ++++++++++++++++++++++++++++++
 4 files changed, 217 insertions(+), 196 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_proc.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index 7d9c2a73bf5a6..8a32cb65b6fa5 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -4,5 +4,6 @@ ti_sci-y			:= ti_sci_core.o
 ti_sci-y			+= ti_sci_clock.o
 ti_sci-y			+= ti_sci_device.o
 ti_sci-y			+= ti_sci_pm.o
+ti_sci-y			+= ti_sci_proc.o
 ti_sci-y			+= ti_sci_rm.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index e8d6589eec0e9..8f9f0b1aa767d 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -1687,5 +1687,6 @@ int ti_sci_manage_irq(const struct ti_sci_handle *handle, u32 valid_params,
 		      u16 src_id, u16 src_index, u16 dst_id, u16 dst_host_irq,
 		      u16 ia_id, u16 vint, u16 global_event, u8 vint_status_bit,
 		      u8 s_host, u16 type);
+void ti_sci_setup_proc_ops(struct ti_sci_proc_ops *pops);
 
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index b1345e06341db..1f7484b118375 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -620,195 +620,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	return 0;
 }
 
-/**
- * ti_sci_cmd_proc_request() - Command to request a physical processor control
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
-				   u8 proc_id)
-{
-	struct ti_sci_msg_req_proc_request req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_REQUEST,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_release() - Command to release a physical processor control
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
-				   u8 proc_id)
-{
-	struct ti_sci_msg_req_proc_release req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_RELEASE,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_handover() - Command to handover a physical processor
- *				control to a host in the processor's access
- *				control list.
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- * @host_id:	Host ID to get the control of the processor
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
-				    u8 proc_id, u8 host_id)
-{
-	struct ti_sci_msg_req_proc_handover req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-	req.host_id = host_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_HANDOVER,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_set_config() - Command to set the processor boot
- *				    configuration flags
- * @handle:		Pointer to TI SCI handle
- * @proc_id:		Processor ID this request is for
- * @bootvector:		Processor Boot vector (start address)
- * @config_flags_set:	Configuration flags to be set
- * @config_flags_clear:	Configuration flags to be cleared.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
-				      u8 proc_id, u64 bootvector,
-				      u32 config_flags_set,
-				      u32 config_flags_clear)
-{
-	struct ti_sci_msg_req_set_config req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
-	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
-				TI_SCI_ADDR_HIGH_SHIFT;
-	req.config_flags_set = config_flags_set;
-	req.config_flags_clear = config_flags_clear;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CONFIG,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_set_control() - Command to set the processor boot
- *				     control flags
- * @handle:			Pointer to TI SCI handle
- * @proc_id:			Processor ID this request is for
- * @control_flags_set:		Control flags to be set
- * @control_flags_clear:	Control flags to be cleared
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
-				       u8 proc_id, u32 control_flags_set,
-				       u32 control_flags_clear)
-{
-	struct ti_sci_msg_req_set_ctrl req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-	req.control_flags_set = control_flags_set;
-	req.control_flags_clear = control_flags_clear;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CTRL,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_get_status() - Command to get the processor boot status
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- * @bv:		Processor Boot vector (start address)
- * @cfg_flags:	Processor specific configuration flags
- * @ctrl_flags:	Processor specific control flags
- * @sts_flags:	Processor specific status flags
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
-				      u8 proc_id, u64 *bv, u32 *cfg_flags,
-				      u32 *ctrl_flags, u32 *sts_flags)
-{
-	struct ti_sci_msg_resp_get_status resp;
-	struct ti_sci_msg_req_get_status req;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_STATUS,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	*bv = (resp.bootvector_low & TI_SCI_ADDR_LOW_MASK) |
-	      (((u64)resp.bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
-	       TI_SCI_ADDR_HIGH_MASK);
-	*cfg_flags = resp.config_flags;
-	*ctrl_flags = resp.control_flags;
-	*sts_flags = resp.status_flags;
-
-	return 0;
-}
-
 /*
  * ti_sci_setup_ops() - Setup the operations structures
  * @info:	pointer to TISCI pointer
@@ -839,13 +650,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	ti_sci_setup_rm_ringacc_ops(rops);
 	ti_sci_setup_rm_psil_ops(psilops);
 	ti_sci_setup_rm_udmap_ops(udmap_ops);
-
-	pops->request = ti_sci_cmd_proc_request;
-	pops->release = ti_sci_cmd_proc_release;
-	pops->handover = ti_sci_cmd_proc_handover;
-	pops->set_config = ti_sci_cmd_proc_set_config;
-	pops->set_control = ti_sci_cmd_proc_set_control;
-	pops->get_status = ti_sci_cmd_proc_get_status;
+	ti_sci_setup_proc_ops(pops);
 }
 
 /**
diff --git a/drivers/firmware/ti/ti_sci_proc.c b/drivers/firmware/ti/ti_sci_proc.c
new file mode 100644
index 0000000000000..6c0430f7b444a
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_proc.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_cmd_proc_request() - Command to request a physical processor control
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
+				   u8 proc_id)
+{
+	struct ti_sci_msg_req_proc_request req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_REQUEST,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_release() - Command to release a physical processor control
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
+				   u8 proc_id)
+{
+	struct ti_sci_msg_req_proc_release req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_RELEASE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_handover() - Command to handover a physical processor
+ *				control to a host in the processor's access
+ *				control list.
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ * @host_id:	Host ID to get the control of the processor
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
+				    u8 proc_id, u8 host_id)
+{
+	struct ti_sci_msg_req_proc_handover req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+	req.host_id = host_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_HANDOVER,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_set_config() - Command to set the processor boot
+ *				    configuration flags
+ * @handle:		Pointer to TI SCI handle
+ * @proc_id:		Processor ID this request is for
+ * @bootvector:		Processor Boot vector (start address)
+ * @config_flags_set:	Configuration flags to be set
+ * @config_flags_clear:	Configuration flags to be cleared.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
+				      u8 proc_id, u64 bootvector,
+				      u32 config_flags_set,
+				      u32 config_flags_clear)
+{
+	struct ti_sci_msg_req_set_config req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
+	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
+				TI_SCI_ADDR_HIGH_SHIFT;
+	req.config_flags_set = config_flags_set;
+	req.config_flags_clear = config_flags_clear;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CONFIG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_set_control() - Command to set the processor boot
+ *				     control flags
+ * @handle:			Pointer to TI SCI handle
+ * @proc_id:			Processor ID this request is for
+ * @control_flags_set:		Control flags to be set
+ * @control_flags_clear:	Control flags to be cleared
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
+				       u8 proc_id, u32 control_flags_set,
+				       u32 control_flags_clear)
+{
+	struct ti_sci_msg_req_set_ctrl req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+	req.control_flags_set = control_flags_set;
+	req.control_flags_clear = control_flags_clear;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CTRL,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_get_status() - Command to get the processor boot status
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ * @bv:		Processor Boot vector (start address)
+ * @cfg_flags:	Processor specific configuration flags
+ * @ctrl_flags:	Processor specific control flags
+ * @sts_flags:	Processor specific status flags
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
+				      u8 proc_id, u64 *bv, u32 *cfg_flags,
+				      u32 *ctrl_flags, u32 *sts_flags)
+{
+	struct ti_sci_msg_resp_get_status resp;
+	struct ti_sci_msg_req_get_status req;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_STATUS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*bv = (resp.bootvector_low & TI_SCI_ADDR_LOW_MASK) |
+	      (((u64)resp.bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
+	       TI_SCI_ADDR_HIGH_MASK);
+	*cfg_flags = resp.config_flags;
+	*ctrl_flags = resp.control_flags;
+	*sts_flags = resp.status_flags;
+
+	return 0;
+}
+
+/*
+ * ti_sci_setup_proc_ops() - Setup the processor operations structures
+ * @pops:	pointer to TISCI processor ops structure
+ */
+void ti_sci_setup_proc_ops(struct ti_sci_proc_ops *pops)
+{
+	pops->request = ti_sci_cmd_proc_request;
+	pops->release = ti_sci_cmd_proc_release;
+	pops->handover = ti_sci_cmd_proc_handover;
+	pops->set_config = ti_sci_cmd_proc_set_config;
+	pops->set_control = ti_sci_cmd_proc_set_control;
+	pops->get_status = ti_sci_cmd_proc_get_status;
+}
-- 
2.34.1


