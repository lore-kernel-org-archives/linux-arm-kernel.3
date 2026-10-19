Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ADB606C93A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DAkKWbze;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=VkSWg+Lc;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=V2bHezdU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RR3LS1EONX7dUI17D5hTIfqwrIjpxUdicCgjF5Rl/D8=; b=DAkKWbzeMyfVg5SVwOGSnvh+IO
	ZOtkgEpVl6n5HG069MVm5mBgqQdjuwM7rlS6CQ8m9zEZP/tC+Bc5Y/+IK61Pj39G1h1XvpXLPL3La
	OZFmryN5atZC9BIkpgsGepIWo9pvF2gDhD5KwttJn+0OvrEiGakm8jIvhQkaBs9VJK92eVRIHh0lH
	xlnCopyuKUEDayLtGry6eUBM4UBZyOI62oRf5hjDX76cilAwcBq1TOc3kRUDzurFMXuw9TmvNKUkT
	boo9/yhvBlXgQznOaFo/WVHjwY4zEixQuH50Mi/oubVmxgqdZg/lKrS/nhCnU5XjhEVAHbwZLpNku
	ZPnUY8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpna-00000007uwY-0vOh;
	Mon, 19 Oct 2026 16:01:18 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpnX-00000007uvk-08cT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:01:16 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFP9se081216;
	Mon, 19 Oct 2026 11:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=RR3LS1EONX7dU
	I17D5hTIfqwrIjpxUdicCgjF5Rl/D8=; b=VkSWg+LcDZpEN33dL3iyWTpvYTSzf
	pQq/8iNi5GYx0irJlC4lqj5XAm0aBTYzaUGoOq1JJM2k/btGdCahP4KBf9kc46Bq
	bHDYggbj2qx78zl5EbaCEn+ReMWP3hs9tGIxNM4EDLAVVVvVvhrYt2AS9F2X/AeK
	EqZ+Mf5X5wogqQnYKalRATsqS9Tjw4wOVyDs8zn2WjqhWasldjKRfZQ+pcOl7vtP
	ZODk3S3JXD9xDNmjPncqPHrtJVE8/fA9REbeI4s7a5w+ABA1xBf6TkwJ3cCi5oj1
	TdPYXAwAyoiygJ6YHI0VXmPHt8D0jFUuZbcvhAQMw57Q8VLnYpnQu5hnA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010040.outbound.protection.outlook.com [52.101.193.40])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hdjbksqan-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 11:01:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpPgx0wxCjmsHqrXHAJ55e2HDX1wka8GQVsCPrcchFYWsQUbQCkBIpe9BPIKFosMMlMjsioRE4Zh7UBrjdfRG04MFwMGfMHQGIj5Qd6D6ynnBnWeYSSXgjyxVpLwaT/YvZ7VoArTmw+WmOwk0reXi6sard3MB5HGiyAwlIc53JVnaU/HzmQfVW16eBjJ4sA3i1yYMawZOP7rX/yFD9EDDcwO2YW4yQKwEmiDnjOL4f6KhxyQXUrmSayzeJHEBjZg6GAERtzXUaFmJvGfS6WijfBk5yZjJX5cfd7xLOBSsnuG9annq9coG+z+aTXWzDUJ8EvWdo8EfDryFn13W4WSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RR3LS1EONX7dUI17D5hTIfqwrIjpxUdicCgjF5Rl/D8=;
 b=JRf7iZFtwiTH1LoQIdq5oxLKjKes5H1yq8Rf2cG3bCXOxyMmEr3VVa0k0mIiOnPriUATIk43U2Qmrr/WUzsB738sABl1KGNhbIojaaaUg9Wkk380SQ1mb2kYIkGirO/qlS9QjA9ZAZtCTQGaebsYOo9Fz8ZunTYX3E9xN8WCinkMpV5R2YNg/pI2G/mu82t4x3W5bAvNQZyH1GcRuYmNzhbLQY5rgKvmSa5+QNHnNiBcPxR0kxcCjeUrTJqhBcf2dWSXYlw4tATtVnkQD4A1TUFe3Qz/goPYn/5nfzgnOYil2yy+kK9s4R/2i3yD5RWJdP6M34OZL6rwirDmtULjyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR3LS1EONX7dUI17D5hTIfqwrIjpxUdicCgjF5Rl/D8=;
 b=V2bHezdUD9U0/XFN4lgAPqs9rPSPGJm6n/AAqNktDYdSf4RTMZairo0YfOWiWzAyU4rfT2llG7PxisRwd/E05KxxB247kq3Tj1WnXwXZ3inL1pPZiulHWDYAY27K19w133AZZrFS4X80XWNHCzdYnPHFzwj2hcS191kUdRQ4xPA=
Received: from SJ0PR03CA0344.namprd03.prod.outlook.com (2603:10b6:a03:39c::19)
 by IA5PR10MB998092.namprd10.prod.outlook.com (2603:10b6:208:603::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 16:01:00 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::65) by SJ0PR03CA0344.outlook.office365.com
 (2603:10b6:a03:39c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 16:00:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 16:00:58 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 11:00:10 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 11:00:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 11:00:10 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JG0AZN4044379;
	Mon, 19 Oct 2026 11:00:10 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nas.chung@chipsnmedia.com>, <jackson.lee@chipsnmedia.com>,
        <mchehab@kernel.org>, <hverkuil@kernel.org>, <heiko@sntech.de>,
        <nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <devarsht@ti.com>, <b-brnich@ti.com>, <stable@vger.kernel.org>
Subject: [PATCH] media: chips-media: wave5: Account for sizeimage 0 case
Date: Mon, 19 Oct 2026 11:00:03 -0500
Message-ID: <20261019160003.2375198-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|IA5PR10MB998092:EE_
X-MS-Office365-Filtering-Correlation-Id: 5599a1b7-a7a0-4167-ce85-08df2dfa2a8d
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|23010399003|18002099003|3023799007|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: lt+anbb6rUovHK67Cdxn4W5PqqISlruSjHQlYzINav/7uXDBvQpeEVc3FFzsq+sFCRJWGFdaqknpnMtF11qnK+ThMiMJ+GM/gw+8alDG+vPWEH0K9K3iN8AVAnF9lQVA3y1ip9ZRIk3z97s00B72C/8KdmWni9GydRMSnm65HFtooGLCOd8Kg4ft1lt9KTnQqMbICpJqxh6uTorjcc1GAbq+Ex9nkMrm7lYzdUkQNMq/N4xq9OQCW7sFtoDG5gPua3cnILDOHaOgNo6guR78feTj9bXhk4UTPjIjzK9fpjlcw3G4IsEFk3wkFLMKWWsUmepvR3iL+864UU2qlw45dLZ2YFpr+apuHGWQQfJDCqbclZBio1gTUiIxZnbU7N9l2rZVhxRUzSl3/9Y4+BRktnGhhMbxQNBcWfy4Lvw+CIR6yFI469BICLkLfEQXJwBKOVokLbsH0bGu5jxTq+I+wTZNmbUbEGKb4KGmRS79K0zxIhFQEGORdaySBilPV4V7EP7jiaqYO05NhziqE0LBOAKhr5hUkSCso0gxOi9N/WOIt34w3Xc9e8rU8sTqUNcx90lkV49ONP7TAYg1m9EHwZmK+MMTwzguqxu//HDEYDar8Lpvv6CilufHXZpgtBS/fcWQHFM6GqkmudZmUTEYxFLKnpXenenH/xOJEKzoMxKnjhkTarYgPyMlBAjhpihQnlXft4ngsJZVrFjWjWdkrQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(23010399003)(18002099003)(3023799007)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dKyrEQfi9BJSGeVQSfwTHEMbNUff/DEhCSqp+ErVz66ld8F8RYQ1Pbs1z7r10iBh2R6aHaE2G4zxGV/veTYZl9KQhwMSTNY+kmhusTh5ByCJQzC4ezX+TVWlpola4AGras9pMzusnsdOVreuaH7X1NtrxT54iCCZOOBxWu8BuP0VVcl6WF2B8fECZbKS+5zKMf6oymhWHof7JtazyAvRY6o9fZXQ+2MupxU/zdZ3jXxB4DM+8+DyXrESTyCkDMUGDum6anUsAWpsg3A+AKBFCfec4Cud28NYnbki7VDfT3L7z5CivzZJyYKJyLFhFn8AsEaibK7PRh6OpiCptTmuPQxnRdFeqXIqjH1uRQa0baDUmfw6rpq88WjLjecHjwaLrdMZpm72o9/gcDGzM8B5EyssSBkHuIVelD8NjEgsZ3J02OgpS0qc0toT31lV5oaL
X-Exchange-RoutingPolicyChecked: LBrdRoWyAHnWxTG78/jgPwIAQXR1FlkmZKtKVe1YHPceWA0E52tyZi5Lzg4NIrEesAvJ2pE0sTuUxI1EZAD2nP45qGMCKNaf1lKMJVY2XOgxov9nGw6iTuFMSXvEmTbK+rPCu1nheF67iZVx2T5K10NEQpCeUzW+71WR9QMuiZ5DlkUh7rDmM48tKrl5yzLC32bm7EEm53jbTm5FSCRNK3KPaJ75kpu2X4NNZa/ap1a/zYQSKx/hNK0Mwxz6Ull39Dyk8Q8+e5PGVLBj0v1+v8i82b/EXmkwty+tsz36+QK7a0zJ2TynwIPx7fjYqLCSvsw4HStZAAUQmDeftyGDzw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 16:00:58.7579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5599a1b7-a7a0-4167-ce85-08df2dfa2a8d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR10MB998092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2MyBTYWx0ZWRfX1cdYiBXRGhCc
 bT7RwlJHUKzUpj0L6DK4P1xKYA8nJ8Ks/QHRvLrpi8o86v2YMK90/V6IAycdeC8ujGP7cImVpST
 Fe1XHcnAxQd2xfK8VivWrBgR42r6BhftzBMLWA7aEJ8qnPZ6uV7HALzBwFm8S6/zX1uP4YQsAS1
 2mCJIbVt+hZw7Wnr0ZfV4lXMx72jg/Co1IUf6wpNhgDH2hF5vV5RVuKES+pf+B/rKElowxTLjCJ
 mKdA+6zyWYKvYNV0mkAAEZPUAhHAs9Ey2+E16/L7q2eyn71aCjNN6PQtSUd3bzDyedUpUCyz2Rz
 J6o2a4ddowF1jl/yDWD9mIsp7tpUACLTcsFmBjfA6Xobnns+C6lcFrxLcmYCCHRiyPNE2u83yMV
 OzKLvJ1XkvGO54jCO6Jdvrcfb8+WidT2P9+/OyanktKPdhmqeuzEYBmbY1zOVVvnWX3X7z9d4ic
 5n1dUflDI7pSDTsRJVw==
X-Proofpoint-ORIG-GUID: 7jh8f8vauuvXSGfYz2OOlv0y1P8eceXA
X-Proofpoint-GUID: 7jh8f8vauuvXSGfYz2OOlv0y1P8eceXA
X-Authority-Analysis: v=2.4 cv=Vsa2kO2n c=1 sm=1 tr=0 ts=6ad63ebe cx=c_pps
 a=2d9FbaPwie0YXhWIRYJR4A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=Gk16nDaxf-trY3xgl4wA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2MyBTYWx0ZWRfX3+Ej5YG+0OiL
 7FvpS2IRi7f3QEFiwYSDVr1DLPTY5K8G/msmVq3zxZxpxpQBRJ5cfb4eOcHPn2tjdFKRcbVTYCj
 5BjdkxtU7YYZ5/pojvO80mWGZRekLEE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_090115_287572_93B2A2C2 
X-CRM114-Status: GOOD (  13.45  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

V4L2 uAPI states that sizeimage can be set to 0 in struct
v4l2_pix_format_mplane if client wants the driver to configure a proper
sizeimage. If client leaves this field unset and configures an encode with
high bitrate, low QP, or any other parameters resulting in high quality
encode, then the driver-calculated bitstream buffer size (MIN_BS_SIZE) will
be too small resulting in undetermined behavior.

Cc: stable@vger.kernel.org
Fixes: 88ff31fd0181 ("media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.")
Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---

Current DEFAULT_BS_SIZE is just a placeholder value - I can lower if
required so memory consumption doesn't go up drastically if sizeimage is
set 0 by user. I saw this was the common equation in rockchip and hantro
driver.

Link to uAPI requirement: https://docs.kernel.org/userspace-api/media/v4l/pixfmt-v4l2-mplane.html

 .../media/platform/chips-media/wave5/wave5-helper.c  | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index c3d34be833ff0..384a0a9aac3ae 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -7,7 +7,10 @@
 
 #include "wave5-helper.h"
 
-#define DEFAULT_BS_SIZE(width, height) ((width) * (height) / 8 * 3)
+/* Smallest bitstream buffer accepted when the client provides a sizeimage */
+#define MIN_BS_SIZE(width, height) ((width) * (height) * 3 / 8)
+/* Worst case: Allocate bitstream buffer size based on resolution and max depth */
+#define DEFAULT_BS_SIZE(width, height) ((width) * (height) * 2)
 
 const char *state_to_str(enum vpu_instance_state state)
 {
@@ -261,8 +264,11 @@ void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
 		pix_mp->height = height;
 		pix_mp->num_planes = 1;
 		pix_mp->plane_fmt[0].bytesperline = 0;
-		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_BS_SIZE(width, height),
-						     pix_mp->plane_fmt[0].sizeimage);
+		if (!pix_mp->plane_fmt[0].sizeimage)
+			pix_mp->plane_fmt[0].sizeimage = DEFAULT_BS_SIZE(width, height);
+		else
+			pix_mp->plane_fmt[0].sizeimage = max(MIN_BS_SIZE(width, height),
+							     pix_mp->plane_fmt[0].sizeimage);
 	} else {
 		v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, width, height);
 	}
-- 
2.43.0


