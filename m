Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB01C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 19:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4E3K5R5I;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=EXRruy2X;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Hhn77zjh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MnJdTbYBjVuGD9CuxBouJrqV3M79l1I72Wl+NZTR4po=; b=4E3K5R5IZqwBRRl6LG0o2PYp9P
	ImBlzzSk5aHPEatxgxZ90tuz4ckrHQTfYVBQ9rxdtg8llYZp2PiATNMB/NgoRLcErVS0ebA74upgc
	OgONqmzHui4+pm+M5GRSGvA6gxGBRGBMUZS3CiRvgxdQgzKmYdj7Coh2Exb38r2h6ii5bO1sXaFS/
	JUFYLJIOaY6z13K/KuG4YrbhexTAHas9kgSH4teVQhASRlfpH5a+OGJVI5nCwPeIA1zhjTyXHHENi
	Se7hQqq15zAC1ygRbbUmEYglLjP4JCpr78BHHDs3PI2WTyrmHnVXl+Ym7NL3vaBvntpebVwuyFKlF
	+WY+WTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUcu-0000000A4ZZ-0F2T;
	Thu, 29 Oct 2026 18:13:24 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUcm-0000000A4Rp-30fq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:13:18 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDiUM2604289;
	Thu, 29 Oct 2026 13:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MnJdTbYBjVuGD9CuxBouJrqV3M79l1I72Wl+NZTR4
	po=; b=EXRruy2Xp1XERocKY8Ade76IAF9zoouNe4xAjUzhe24UMu+0ZOs7rXXa9
	ePoz0dle4IjzeXc5sCPHxGITcQotMCk/NXoT6y4l9PZUi+6/KjrPKgrfbfjQaEWJ
	nqazQf+wBv+nGdv+G2L610JHlIvr5fPc/mSTj2Go6RSskIEvdg8esCkv3q+I2pRK
	ZgsbNqS5pWikuAi4iORLyAnebUluA4GAaA5IgGCp1jC8AWQlxEQ/LlYhBkzotaFE
	WqXGvwTh310eaMUranQe2pDPN2gHPoHyYQGi1bT2Kl4X7i9J8HG9wPUjmFzP6xPK
	SZMnIwfJzc9oW9mbJGzkIFJQZaSZw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011017.outbound.protection.outlook.com [40.93.194.17])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm55ak3qs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1djFQYsoPWnrgUbjVWKaOUCKDIJPt2DF/dLEHjlkTYisMvWa/7hJnTujVNFN/FDvbYdTqhb3s0Xh6K3jbeUCdGX+9cKW4qnCs7WIwAvM5S2Ianxm8gv2rcsOfl+dT6a0J23cleFTcd9+Kp6pULuJi2X3CRNMl/lVakWYodpejMWAj/VCerLn0fGlhR2Sb6WQLWXH6yUGgq58ulM3MoDfdKsUr7FPWrUnfH9YUHGAuNXFB1+n8lzCosqk7HsvKIolkFwHffBUs7kbKdXGOb1LgqbV5Yi54rJYQ8sJi0JjPloPqMXekyLpI10iaJoeTPgEEPUqJoKqRrzBzaX0N26MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnJdTbYBjVuGD9CuxBouJrqV3M79l1I72Wl+NZTR4po=;
 b=DK1R+9TjfcQ4E4SDd7rf18QINQJ7LegunvrxpplSNJ+64eXGJ92tLTQ+Giynx6Q4pY3lAO4cqpFw8Z9m/GkQmmYYtzyxwZbk3MKQZTwkhQnIzi6/Glwu+YMoCQaO+IEx8EOB/MhVBIFcJPygXmeYHzPYqTlnsdyWbKT+RinbPIoQLd2NRaVZzH3L5KvrnTEsxBZdhQxRAe8fyn2EGyNoF5NKQ7oX2CNKnPn5UzSy68mwbYIKcMbtfJCBZv6wBu/BXsDdg5x/91uAu2xgvYFKnjXC2ndxNkGnMK/4nnDghAE9fuLXdTvKks3HwXDR2RoMygAQZIHWlu9Tbcz5sNVWKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnJdTbYBjVuGD9CuxBouJrqV3M79l1I72Wl+NZTR4po=;
 b=Hhn77zjhaMYbRjYBCiKBVAhrreTS9wexmkCmjc5DDbZA/xLfyo7mUGSwkUupGWcGquRtRNFnGLwjKBehm3aSrJjHWRiv06X7kYPXA7M8vPfAZ7Souky/H2fG8DYanaAF8wSIpJfGgzBAclOVHPfTbRj3Jkw7tJPKdcfw/ztjdfI=
Received: from BY3PR10CA0016.namprd10.prod.outlook.com (2603:10b6:a03:255::21)
 by IA1PR10MB8212.namprd10.prod.outlook.com (2603:10b6:208:463::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:13:11 +0000
Received: from BY1PEPF0002695D.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::6a) by BY3PR10CA0016.outlook.office365.com
 (2603:10b6:a03:255::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Thu, 29
 Oct 2026 18:13:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0002695D.mail.protection.outlook.com (10.167.244.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:13:10 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:22 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:22 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmMA3408718;
	Thu, 29 Oct 2026 13:12:19 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 10/22] firmware: ti_sci: Use tx_message as message buffer directly
Date: Thu, 29 Oct 2026 23:41:35 +0530
Message-ID: <20261029181147.266771-11-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029181147.266771-1-b-padhi@ti.com>
References: <20261029181147.266771-1-b-padhi@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695D:EE_|IA1PR10MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: 284bdea3-cadd-4821-db68-08df35e84a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|5023799004|56012099006|261009223027099003|261026135527099003|261026140227099003|261026121527099003|261028144727099003|261026130827099003|261021130227099003|10067099003|261022113327099003|261022115727099003|261022105027099003|261022075727099003|261021133027099003|261021135927099003|261021123027099003|261021121427099003|18002099003|22082099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: K5lW+55MiMFTvFe+ckbb01sRYMAtfutoMsonQaH6DyGsZit9+Nsq4mrBCuvBm76SUaLlLJeXFTnSCQH7UK/mZ5Xxdx7tXfNSR5ZtXUUl1dQKt43j4WYfcxu6Fh6Lf9DUSDaAzcDBrtITxQKnX3GOpOvpNi+xNzhgI6iNjt63NAAM++B3bUGO/bIql8O+gUQ/+nwrD1A2EjzKFuT3whlp1gjnxh4UIrKvKlRS50vLBVGtznCLDNFHLhCVa+wej0N41b+QO3O2gq7jczpO5bu3cbKXbxB9J0yzH9oACMv5eULL5FxqM05GqILVKCm+d7bZUcmby29Al3/b+0xziuSU7pJepA2B6oGP44YX2qEF44ES7DQOrcqxRTCwnhqEVPl5VXWMrMEsjkNSql9Z3od7EJHswSuNWtYfYefTisQp405ks3y3gG0R9Wj8/rJ+KfaqMWpUr0DE1zf3dDO+J3daZPObGr5UCBuLEl4jJu+rHOm3tz86WQHB1PcdNAxTWcfWxvC40GygHOLOWpfswIymS6dLK5OunlrHcKe84zYQAh0O4qiNFm39OQOefFhrE4rUx2ZjGXh22lnPuAbruWnT4JEStHgoGt072WE8z23MgrZBPskR3B3e5pjCjKvUYlbQsTGB5k0uV2Oo58pGQgpWb8+5Y/GFQZOLjsi+msNKdKE=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(5023799004)(56012099006)(261009223027099003)(261026135527099003)(261026140227099003)(261026121527099003)(261028144727099003)(261026130827099003)(261021130227099003)(10067099003)(261022113327099003)(261022115727099003)(261022105027099003)(261022075727099003)(261021133027099003)(261021135927099003)(261021123027099003)(261021121427099003)(18002099003)(22082099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ijrh7DfYOKAjbuK1jF1sA4xvvKo2PfJsRG/ez446/5YnmtxroWRkEwT9AQwuFwWtOFJCzQbDVBcwTy64Q5ID3fl51PrFDITxASFRpeo/j2ARhF05yLLJLhq8oSxvPSiixwWkTKDMl3cIwy4JyvFl8TRjNofaJp81SGnq2TGQf4Zyr5oQzcFo02Z9rTrYsftazXTEWEtGTBAy4kjzTIFFXqfeFTb/ordAEKCZBpJKy2QmEBFlp+3dguasNl54JZJTfm3Uv4j0lniex2/lryEsSOo3Nk0vZzFCRzCffZYRZcNS6ZYe4/OTIXjP+EKTbsYLeLS3Uddh2YIVhGtpsOQJsyZv0yHKlohnGc43mVaQyjKBIE3OXeoamv4WykIeLKUOL8L07WwG47XuhBmgFm/+VNolIo/qz2BKqH8HgKdrmyL4259pCRb1N85wismBSJAz
X-Exchange-RoutingPolicyChecked: J0vdcySOvdc5aDzQhqdtk+E2EIYGKftERQvIW8BaSv6MZpbANu8eep8kpSvQR4lYUdkTv5a/gLx0JZS3VxQSwugniokaSD7R2w27BsBiOTymoOWgK1WQ+3pq5lRi9ySLmj+8fLjFeJuBd8zIYGtNxLcRSsMbn6lN0S9jNvQNuoS84g3ct7uAivl9aynkX2tVWn1udZPB+BQqEMRTnQgf1HmDYHULKR8J5iV+qWMwZ7yvQWKUPPvQnyhO5afIp5tlhPjMkAPEuFpqDOHmG7EfBeh3jLinNWh4pS9pvh60Nc1JkUBgKjvqavaczlvdJweJ+rYel5CRp2iP3yALfTAk9w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:13:10.1655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 284bdea3-cadd-4821-db68-08df35e84a2b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0002695D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB8212
X-Proofpoint-ORIG-GUID: xy-sJb9VstK-obmkXbYjnuxz2B4BsYZk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX69PB0iX1rzg9
 Au8xDh0N8NsDpKOQJTt7Qog/vQyirDZKaS5MQKBrmCFjTXGcQn1kFcCYKlCatlBDbnMuhEzgFaf
 fu+mb7m7J7RMhY2Af7/WLuLDaa3/r+t2qxxVodc+v3q8rW2o9iDFtTlOzwBUZBeap1MuouY9qxE
 cVBxcObjrwfvCjmJ1J89Wvzq1ekFiQjT8XrMew78e1IS268maMrg+MctWw9dAZNRNGqL9tP9oqg
 xM6n3CnXIYZ0W9fdym8N06zPAGZaUNZ/iGYZFu82Jjxzc9aseUhV5QYRnkDeli9jgKqOCcIx8fe
 oQujCQlRE7lxXN0lRUunU9LnEuEEJQYGaGMHrfhf9v0tbVlVPJeLGuTFEMFRWTRuqTQJDH7Td6P
 eurPCW7ey2hf6BiFubRcG0TlygYGfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX5OpAU0F1JmQQ
 jPXFe9LiPmNYntNeoZr1fnFAWlRoaItJFXgaw53s/uAbQ2jTSNnOEQE5lIcv+ttZ7grBYeIB7fl
 IKgczP/WFc+lMHLkTB8opzpbSofP+Ds=
X-Proofpoint-GUID: xy-sJb9VstK-obmkXbYjnuxz2B4BsYZk
X-Authority-Analysis: v=2.4 cv=eM2GH3p1 c=1 sm=1 tr=0 ts=6ae38cba cx=c_pps
 a=c3jrQKbOTv/wLHXjXXsPQg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=JzeuRgn41EPwZvIwv6EA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_111316_888820_0DB18C23 
X-CRM114-Status: GOOD (  16.59  )
X-Spam-Score: -2.1 (--)
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

From: Andrew Davis <afd@ti.com>

As we now have the tx_message during the whole xfer process we can use
that as our message buffer to be sent. This removes an extra copy.

Note: the mailbox framework keeps only a pointer to tx_message and may
submit it after ti_sci_do_xfer() returns if it was queued behind
other messages. But, this cannot happen in practice: messages expecting
a response are always submitted before their callers return, and the
only no-response message (PREPARE_SLEEP for Partial-IO) is sent from the
power-off handler with other CPUs stopped, after which nothing else uses
the TX channel.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-11-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-11-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index dbe192142bf17..6ed67160c6a7f 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -43,18 +43,13 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
 /**
  * struct ti_sci_xfer - Structure representing a message flow
  * @tx_message:	Transmit message
- * @tx_buf:	Pointer to the message to send
  * @rx_buf:	Pointer to store received message
  * @rx_len:	Receive message length
  * @xfer_buf:	Preallocated buffer to store receive message
- *		Since we work with request-ACK protocol, we can
- *		reuse the same buffer for the rx path as we
- *		use for the tx path.
  * @done:	completion event
  */
 struct ti_sci_xfer {
 	struct ti_msgmgr_message tx_message;
-	void *tx_buf;
 	void *rx_buf;
 	u8 rx_len;
 	u8 *xfer_buf;
@@ -372,16 +367,16 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 
 	xfer = &minfo->xfer_block[xfer_id];
 
-	hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 	xfer->tx_message.len = tx_message_size;
 	xfer->tx_message.chan_rx = info->chan_rx;
 	xfer->tx_message.timeout_rx_ms = info->desc->max_rx_timeout_ms;
-	xfer->tx_buf = tx_message;
+	xfer->tx_message.buf = tx_message;
 	xfer->rx_buf = rx_message;
 	xfer->rx_len = (u8)rx_message_size;
 
 	reinit_completion(&xfer->done);
 
+	hdr = (struct ti_sci_msg_hdr *)tx_message;
 	hdr->seq = xfer_id;
 	hdr->type = msg_type;
 	hdr->host = info->host_id;
@@ -487,10 +482,6 @@ static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	memcpy(xfer->xfer_buf + sizeof(struct ti_sci_msg_hdr),
-	       xfer->tx_buf + sizeof(struct ti_sci_msg_hdr),
-	       xfer->tx_message.len - sizeof(struct ti_sci_msg_hdr));
-
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
 	if (ret < 0) {
 		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, caller);
@@ -3396,7 +3387,6 @@ static int ti_sci_probe(struct platform_device *pdev)
 		if (!xfer->xfer_buf)
 			return -ENOMEM;
 
-		xfer->tx_message.buf = xfer->xfer_buf;
 		init_completion(&xfer->done);
 	}
 
-- 
2.34.1


