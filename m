Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4AEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 18:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sif/Fo5gCD9tGoiWOvTwRx5+B3npl9W4jRLWtQqM7DI=; b=A0FkhY66p/z5A1VEHBDr84Wtck
	avC4HdrXP1PuheKCYxVlI4o0ThH6w+OxLowbRMPTAU6fxI2haiHU4pMXYTQo01zILNuXSYu6m0gGU
	8cDN3vhNkWdOepw/P4MciBXVpzQ+UjD4hGERDiD3QO9VY5N1mfaT17aHUKmz1fUOyrfneHCDZagqj
	XegFRyllz5cqHV6vr10qEjxqDSzng4zZz/YEBUZeC3Zb79oLeePsceUal1NeXUvKegY5oQuG1QWMe
	WlenNYyOj+0c1vSBhaTSVIkyenRpYCJVdgMs4f9ulyztHafdbC1U/+lx1YP7VVoTe4YRmMPg7qiH+
	e5BCJovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wedbY-000000004EV-17nS;
	Tue, 30 Jun 2026 18:54:44 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wedbV-000000004E6-3098
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 18:54:43 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UGkvfk1345073;
	Tue, 30 Jun 2026 13:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=sif/Fo5gCD9tGoiWOvTwRx5+B3npl9W4jRLWtQqM7
	DI=; b=asXD6amfefOFEmxYsIMyV9QhicG7SSsFvJifP3HplLTf6d67aAeM/FUDT
	2cH8fcb345RZtBclgDV6m27AG1SrdSErItoCKcCUND2nOsFv9ztnMNbS+BU0oabi
	rVXtp8S6qRvoKkMjS82M7+49+3UqiDge0OiueGpeFwufxuZw8Skhxaf13JEfOwl6
	ETheO1JX+pNCogpC4x7qBmahd6D44gy2lPC4skT7UGqysQSsUwIcZBEV1gdxlU9c
	hN2JWfqR+R/kY2CpBuxLTzhDeJlg8Cbb1hTFaMXkB+ZzQuCD24JDeq9vnqvnWov+
	PepQ2PRqR92NQ9jYgea9gdlFoXbKA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f47k7cdnx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 13:54:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAfqItyq9vo45q/XuT8XicIrvq9AJwc/K8y/J37m2HAgjS6dPl3xgFRV68pXBi8PuQCjE0Tb+hfOymSOiFSmfhXFzBXBCTngX1bf+sxPo9anzWebtkrRrcLYZP9s5Bf2U6HOfLaGTH3TVYKycSryJLMLbVdyRlHyCL0D/r6K1YXJfBSIERGcTEuiyWQzxZFcYa0msJ7vmnG7B+Ge5gDAQEVT20vvdM0nzr6Oj3htWxUeM9vj84FG/Omv1Yc2JFK3tleEcXxF5oYwPsWqPH9j48lfPyN5sS2vQMc6WjK/3elZqsQR13/UxwngKsilZbD4su30c6Te+UhIR6H59t3JLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sif/Fo5gCD9tGoiWOvTwRx5+B3npl9W4jRLWtQqM7DI=;
 b=sYCZYw/IgUWE2Kn0Mg9Q0yysrfSrLq4zTyL1Kgfbwy7l+WpsVIan6E38hA+9+6cMYsJ3MAx2gy0eqPIEpKHJf7p4x95qd4NWF/hvYisTD+FOpLvsD2Pli946Mt27uvJyZvYbLFjT7sjYhSAU0FweEo4le+l+ONDE7cuvD2YqH4eY2RO+rMqX8rs3Kn/udvknRtkTiy1a/LVXYy4qKJ3p9JxYLHpgqLjVZbLL7V0KbQSZSJtuv5j1pG0A9GH1EuSXI0XiB+t4WQRLZne2GzysaQFBjiXuTCAcN06UsY865Uhc2XU0qDPaNudcJDusiBMOzw0rI4Dv/RLsU8tLsTzqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sif/Fo5gCD9tGoiWOvTwRx5+B3npl9W4jRLWtQqM7DI=;
 b=lrwmdGSqkC+rrFS50F99h1q32ed24pWgixYOCMyp8wbIUrLPKMUBhi8IRJSOvbU+GNQ6o8xDHVkHObtSZCgn5W+cShQb3ghpoufQBlMqstEhTni90LxDR8tigrxhj62l8Uq3NJlNWGxm0Oxr4Ql8vsDdWRq2CGp+p8zepgHZk34=
Received: from CH5P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::18)
 by SN4PR10MB5622.namprd10.prod.outlook.com (2603:10b6:806:209::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 18:54:29 +0000
Received: from DM2PEPF00003FC5.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::56) by CH5P223CA0007.outlook.office365.com
 (2603:10b6:610:1f3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 18:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DM2PEPF00003FC5.mail.protection.outlook.com (10.167.23.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 18:54:27 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:54:27 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:54:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 13:54:26 -0500
Received: from [172.24.231.164] (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.231.164])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UIsNo53733086;
	Tue, 30 Jun 2026 13:54:24 -0500
Message-ID: <0abbdb79-bb80-4f9e-aaab-0292043472a3@ti.com>
Date: Wed, 1 Jul 2026 00:24:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Add bootph-all property in
 cpsw_mac_syscon node
To: Andrew Davis <afd@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20260625113223.1711052-1-c-vankar@ti.com>
 <6eeecfb3-6d88-469c-b087-a4c87ade65a3@ti.com>
Content-Language: en-US
From: Chintan Vankar <c-vankar@ti.com>
In-Reply-To: <6eeecfb3-6d88-469c-b087-a4c87ade65a3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC5:EE_|SN4PR10MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 3163467b-0356-42d5-6c6f-08ded6d902b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|13003099007|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: rnc+auptGCMUM6bqeZC9+C6AgZVAqLYvpo+RsoAcU8VdvzJ2g9uGrxgEG67+9FehuAQMJofHjZzR4FGh5Qf/I7xUxRNUdZy2w5rI64Q9bH/qfDqAN3YT3k2HIhF96FpaJCMtNE4tyuI48Pvxag6bAbdsRpDW2d3pPBlxR4BbuL3bumVeLdFulHVO4a3j89DW6iZM51boaZN6cR1+U9ezZGze8Z3WaAMpkxoRfJJP0hGix/c/7QbXzyKr0BQYG6pDDmo0pbWmValBREyEnnKPcSLKHP0MspyE+5JiMHzHlEK0yQWa3G5Q1tPCM9jjW1Y0iHCLVhFrTBBC8RZ2gH3XETIUHTlx0TFh7KuVqNvfqepxr/0WHU/5uux/TBkRRgdfsnrxWEk2sKxmZSXctLKi63xlZOGP/ozJDLGJ01uLdTBBRW9estWkZ253pViAv1fN+u5pGNVVO9vKWkMyP3ZmSMrBNrwcSg9G0R5RIlIAbMtrSvN3xhAAQ/bF3E+QwRV6v/6/lQ31hNHy/huHFA8ykkEBNVMsr0dyC+dRI3KjTuaoJiAH9CAZYXxjch+gheIPc4tAUhvpYgHN70poYkeYrbFY8Y11b5lJ+Gk795eeeCPny/VQrjHkUC+uNdCM7H3UZzJYfcwdr/Vzsja2UxrEeA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(13003099007)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3uzi58Hg/wHeWxqkOWfwQ0BblDozfnG/O04LDEYFxUIZFN3GlIDsZDg8PjV5IUK4eBlthVAQQH9Lyf9v0EBKsBp7sbQ3cgKKq+xbzx8Io2suw0nDU0vQBgVjN9PenT0PV8Jksg5FCKeWjO7zYiTTT9NSaTmfUAiHuaOJM5LtFXPOeJGJc6ebQUDlk9gJIRGN7E6zaZsxmaGdHcAnX0JMtVnWNb6HFOFeo4DQ6gJCGKSHLoT/4JTNXxrlw0+hzx0xME0cI4TqT2tRYxZ8QbvmEqpLs2txU1dvM0HUzCLmWY1+C4qkcpyY0x019sxw4CoUfVaQnfmY7xCAhYkn1BQcQFhepKc3v1z+u3WUHNWpHjN8vnE5lRAEGjfnRhgLEx8iPUMUgJlJb01W3jZJqnaMCT87YPOiLM7DZLJVVVgxFWEJh5k41H4ss17RQgxvKZIM
X-Exchange-RoutingPolicyChecked: N6kVWTanNzwtKM5lQ7WqmrM4f4VI2CAg0mD2/KemrLss2F8Zd1di5LiSnL2E1IJR9xZggyAhuQMLD+mO0F78KLJkPvHDLydkTjp+PaVxkkY6vuT5+uX6+AjAWDMf6uEujUKl6RNAv5879nWlM7TMfkHzGMB0JdprdZMuH0jzGGi49+Pw7yie8xPf6+BbZ600qA5CLx19g+ZSs/diu3vnB5xAyljrt+47nSY3/gCv6L0qHQRGCCdGKsOq8FJpZoblfoQvC4FeVJm5BFEFGRGbarZCToDyrFk4peQSwu+s8y9W+U7WSXe68XUNVhpzF1GWyOqGhJXpYrR7GoXP5IuDrw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 18:54:27.4113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3163467b-0356-42d5-6c6f-08ded6d902b9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5622
X-Proofpoint-GUID: JUKSYUEBfkeFlfRqU74aWrd-SO0VXTtV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MSBTYWx0ZWRfXzJpmDMrVsvEy
 J5LC6JfvHw8m85FjCxZucjnMIWnZTZOScRXSf9Rbvm7ann+f7iLvd9Xs+OhBuBfDRmeL8LzD6JZ
 RRogmjoQThdBNhR4V5qfMNSbLhdZ35BA0VyvVuuogE6KnvMIsEKlX9LhSiK2YMoeUPZ5D6YwEly
 ukgAP6besCj7e8+JsCOU7Xt9vJtsFWqf+/DViNV+uTz7diMzl5bpoBfoNc0oxPJsm/TNCqW4hfq
 1vSi5x2akUqQyAEDZxBz01PJQ+TRYGf69j0T33AMvp7NBASwRrRGnb0sK3N+eVseoJ0APjVWs9y
 ti1d5J720WsLNVszTr3ShNOFmm/tHe8Qe4hgCLkAADkH5y0yDfFYcL+DaXik2XLkXDosf5Xky70
 3X6duRgb1FBiK8oTEYfzYeH92etVb6uCRG3l1G17ciOrimytf/tq0IsUJhd7eH9CUi2lUY2yBuz
 0okZ9YlO4VULg0gryWg==
X-Authority-Analysis: v=2.4 cv=UshT8ewB c=1 sm=1 tr=0 ts=6a4410eb cx=c_pps
 a=xAd66yR1laZozgwquCAwlw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=apn0q0EWAAAA:20 a=sozttTNsAAAA:8
 a=3_Wlc0CuSeB_AHwY_owA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MSBTYWx0ZWRfX2EOc9BALlu8w
 CnKNfnbW7Y6HQZCMdF2PVgLr0jRP3cBtN+ssJPLZ6vd7GJ6zpYudb5Kz/yHa9eAqFO4Kau2XphZ
 GgQvFrQvd8PWIM/zb/h+4L+SQYCra10=
X-Proofpoint-ORIG-GUID: JUKSYUEBfkeFlfRqU74aWrd-SO0VXTtV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_115441_892790_0A9E5487 
X-CRM114-Status: GOOD (  16.31  )
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

Hello Andrew,

On 26/06/26 02:18, Andrew Davis wrote:
> On 6/25/26 6:32 AM, Chintan Vankar wrote:
>> Ethernet boot requires CPSW node to be present starting from R5 SPL 
>> stage.
>> Add "bootph-all" property in CPSW MAC's eFuse node "cpsw_mac_syscon" to
>> enable this node during SPL stage along with later boot stage so that 
>> CPSW
>> port will get static MAC address.
>>
>> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>> ---
>>
>> Hello All,
>>
>> This patch is based on linux-next tagged next-20260623.
>>
>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/ 
>> boot/dts/ti/k3-am62a7-sk.dts
>> index 821a9705bb7d..d3b3675e7a8f 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -230,6 +230,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) 
>> WKUP_UART0_RTSn */
>>       };
>>   };
>> +&cpsw_mac_syscon {
>> +    bootph-all;
> 
> Seems you need this because cpsw_port1 uses it though a phandle reference.
> cpsw_port1 has bootph-all, why is this property not transitive though
> phandles? Would not having that cause missing references when the phandles
> are resolved to nodes that get dropped for some given boot stage?
> 

Yes, the bootph-all property is not automatically transitive through 
phandle references in the U-Boot SPL DT. Nodes that are only referenced 
by phandle from a bootph-annotated node are not themselves retained
unless they also carry a bootph-* property. This is because the way
fdtgrep works[1], it only keeps node with the tags present and implies
that property to the parent nodes and not the nodes referenced by
"phandle".

Without bootph-all in cpsw_mac_syscon, the SPL device tree will drop
that node, leaving the phandle in cpsw_port1 unresolved. And the above
claim can be validated with the current conifguration where "bootph-all"
tag is not present in cpsw_mac_syscon, causing CPSW to fail retrieve MAC
address.

[1]: https://github.com/u-boot/u-boot/blob/master/scripts/Makefile.lib#L688

Regards,
Chintan.

> Andrew
> 
>> +};
>> +
>>   /* WKUP UART0 is used for DM firmware logs */
>>   &wkup_uart0 {
>>       pinctrl-names = "default";
> 


