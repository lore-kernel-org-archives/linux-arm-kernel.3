Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFACC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 19:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Y2QlaZa3xovwbDUIfemkauHlF56Q4dVJ52SeO4c0C4=; b=z2jJxs4KZgT5S3GBjUQXX9gFJb
	P279EYpBD+VWcUg0L8op78DcoXPzhiOkxUF1IT2UV9tOwTiwRHZjnX/vws6y5+G7zlXgIlbc/fy//
	Kfa+WzLMAln3z4LAelyhkTShcBBvjYNT7C3FCPbWKdxprlHhG9eWw+8/+/yZwCMsBN2/p6xMZf3GO
	BEdtZlPXglPp1B/j7GJ5nZ5DLsnOQlNihP7NdYn3TAfz96wZchUPPpERPeHxAu1sg48sEcDWj8lKr
	6OnM9hxD9nOVLiM25Obp45wdepifGBElH7ZYLq8PpWRQlUdFTvp3FcjDI9FtkrP+F+Hqiv4qVlINq
	9uo5rbQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x573F-0000000Ha0q-0FQF;
	Fri, 11 Sep 2026 19:36:45 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x573C-0000000Ha0T-2EBS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 19:36:44 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHV0852544560;
	Fri, 11 Sep 2026 14:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=4Y2QlaZa3xovwbD
	UIfemkauHlF56Q4dVJ52SeO4c0C4=; b=j2qStvySJqZ0NmSQgloCb+92by0Fbdg
	zr8Wf/FZmJbJdvAbx12kyeHMEkm/d3Nqsy5CWpdxxCTDwmpBpNt2/6ldYqWpamRl
	3+8HGR3jb4yqUK9WAPNMEeHR2Nrj6dyRjlkPblTcIgC/pNx2fmrH8TvuDdZIxYza
	AvWkf+vGgDcbXeKuI/4fizep7xHmlTEsJ2qkhuccNzeJKfPGzbuFwphgtrHYc4uV
	PcVZjFCmJYRaHyIQcadm0Wi5ruUK3xwDtU157ng8Re/aezngvoOXMuFlGa9eXAQo
	wahHfTPrEVlHe+66md7sY0nu2JtbXteK1wALgQ+gtSAqUycquAL0LAA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkyw9rmf9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 14:36:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy4IuVRBQDXYFees9UN1tDnPrHZfFFbAcIbObNU4lpANg5LsyCNROl7q9ptfQ5BL611yNKR09SuNgBMl4D07z4jY/IeGmTs0k/SewtPYe2wD0kXy9yD4ikXfEDpFT9U4flXRmWGNU40mLYhgfUR6Fdeb9MJyTvgv87oa0tjQYLmCgjrMRYQrqEtqqB77KWjRYMjuBSQSSKBNVnxVE5zHnqZdzjNUQY50zMcPvb62+49NemAaslETqBm7KYDE5SW+jEr49BYBBle0MwUhU560CUOkcnxfKgmM77dbCkTtyaYCa2auGCwUiuvJgmYEbUggYUnv8oiKr0i+g7BO9TMmHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Y2QlaZa3xovwbDUIfemkauHlF56Q4dVJ52SeO4c0C4=;
 b=bfO7wKUlejCqdQaGlkDri9ouJZ3/YXdae6y5qkmQ8b1tN6Bsz8o0IVH1Y561Z018DgMzHH3PGs/SguBxkoXCujsJQpln7XTkYNUN2MCllPL8x5eJTrepwPbvvcCylxX31XCcEqoy6+H6osBF62XuHrHx0AVCjqhq5Pava+3h38Gj2JTWAt5dJC6sE9skOFoYwryZQYaYK9p/NwV/7L7TBbT3PfuANeqJblF4XJqmbgydE1C2BS7wu+bUkO+o03RA6OYHHt2aQaiwszBE9pTk+XynuvGLVd0QVlQmHTaDxWZYI9zSqn01OImJkVz6w6m+VzOJbPaPT0LSCKKoUuBmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Y2QlaZa3xovwbDUIfemkauHlF56Q4dVJ52SeO4c0C4=;
 b=tMdtHvB/+Sm6Xkglvbk2hWbE2hYSjZ8GdxD5F4ucUU+WIvZkbq8gD0yG88NSqLshT4X7PJbmEI1rvev89v+SDhDQqeCyo+0jv+s4S8fJKCGskwQvCQLmJ9inkyBmzog6jGFDfXYIXfocZ1+G4fVgwESRw6bwpxXzEo7dqJNkUys=
Received: from CH0PR03CA0330.namprd03.prod.outlook.com (2603:10b6:610:118::22)
 by PH7PR10MB5676.namprd10.prod.outlook.com (2603:10b6:510:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Fri, 11 Sep
 2026 19:36:34 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::90) by CH0PR03CA0330.outlook.office365.com
 (2603:10b6:610:118::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 19:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 19:36:34 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:36:16 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:36:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 14:36:16 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BJaG1G1679771;
	Fri, 11 Sep 2026 14:36:16 -0500
Date: Fri, 11 Sep 2026 14:36:16 -0500
From: Nishanth Menon <nm@ti.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
CC: <kristo@kernel.org>, <ssantosh@kernel.org>, <sboyd@kernel.org>,
        <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH RFC] clk: keystone: sci-clk: check the growing discovery
 array
Message-ID: <20260911193616.oy7uezwjbky2jgki@spinster>
References: <20260911060906.94179-1-bolin.liu@seu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911060906.94179-1-bolin.liu@seu.edu.cn>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|PH7PR10MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: e46c15ee-69be-402c-3b67-08df103bfd0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|10067099003|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: opDoEW9ViVONij5hTA2b9U1fMqW6//ng+DPIyclsWkyw6qnCxuwPKEkZDX+LMBEgHKb+JGfDDWe7x8nuiSdq4c+fWiSzRdi59qO9NzA8Er1k8dKJ8fin8uZ6WgabILchdkQy6BCpakx+6rLEAGn4FHohyFGwQXoBCpvjYOcEMB5iitG6BwlOqkoYtBZe8d9XI0OCT61Q8cS3GL60LwpZN/SeOlg+AHt6HOxdDYi9EdZU+oZGkhrKdB7Lh8YFitKBCko5H2+eV0/FU6wyD1HO5srh2d+UhEDNIia5Xt3hTcTtFRoSDmjVsECvIRV5q0s1zD7IwoPjT2J7P7sMWRwOTVK7hZGDLhoeL/VwChdxu9oPZYrhulEzVqimCtK3pz5UWPXKDxJrrjaQnQhwe0b07hyFwPpCmUhTwjNalwccD6QU8R3wXbXDoNqZt+Zw7eQ2ooXxbYD7Le0IHJvmN7pn9mdyu1LAJxJs9yYEeo7ddVn7sxEdoGiow4whKNuHVDZoxWBGRgu4Nr+ODNERkMOXgtMGY9/Ti8NyUy+8KQV4UgxN8UrUWsgqmtWijROF9RsAMRf5eVWzxIqwC6N8WRHiea9Wn6Dqp0bpswDYDC9b4QMfRqywJV2XBwj8/5YVJIlNmH8rzXwU4qCrmTKYOoi0L70Ur7IWv/+PwQjjTpTWLey+RpATzWFmHDrLlFO7THuMK4TC5+pqXVIrQbaVl8uGjA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6H7Redor66ruzhTJ1D4QrvWsBvuCSz0iyXYlDZ5ebe4O1ULuU8gyK1zIeBkUQ0JXpsI2HoPMlDUowsMrV/epuxPMMmqvDPBUw9wMUR1UABHeiquPT5FfjeRiDOUJzGJG3r53t3Rk4JaDJQJW6emA/Ltz+0dkm6cvspIm4Y7I488l22ISnMW2ZSjZ/a8ERnyw/yQlirztQb0Hz1tUHyLHjYJwc1KD3LAnLu8Czs1XGZEI1cL42esyTK/kqj99++tk4CqGrGAbYissmcd4sx8tIOQIyvkPynJTkmhlJ3GB9EV6CtvznubW6Ak57cC8ZdfMla0fGRsEiVWjb73p1wmG0P4fmdYj6L2rGszeNcm3XOJQH/lrTr5Jd5AGYQ2KDG534V/3bYRkwtUp93H4ZhUkf7U7Y7gDJpDYFHaNOVEEyVSScMgLCqjVVDfUoiOGiaaf
X-Exchange-RoutingPolicyChecked: 4C6j6TAbtz0+XfDm44QB2jtP2mt7OhwX7VAGVPXEbLL0RrKtzDPwFvWz10cuC2kXCczcvtBWYHs5qe9sUU6V8sE8wBKAZfYWd9wwEJri5P8LVIIcSr0mu/hXlKLZsEV6O+P3pAozQJGQDKZNm2uv4VFwzj8GqUrgp4TZ4Hieq6uuTXbfP8uxjLBR0IKjMfEwTzLRrexA7+mKyJbge4iOOQtYOmOsXnjziogyoE6zOLoV7JIf9h8X4Ve0MzyvTsWKW8FypBuUU0UdUZfQE9FkT3aF3meDTc62r4BZjBzLTL/xkczst4vv4pG6BdHaWrB3Bo72w4x39aHuPKcnetCUTg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:36:34.3296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e46c15ee-69be-402c-3b67-08df103bfd0e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5676
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3NiBTYWx0ZWRfXwR7D+/0PeeY9
 9mKdAJkwTUa0OmQPvriBOmxud+K32Sr7U+hUX9xf/c22w+Fmhq01bQAbpbqqHuwvIraLfdwmTlQ
 mI3jGyyLcaOLcxhi12SIyuU+3FGHXQk=
X-Authority-Analysis: v=2.4 cv=ON6yTiaB c=1 sm=1 tr=0 ts=6aa45846 cx=c_pps
 a=ut66qxPycOxoCiL0Gbz/2w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=VG_VmdWzrdohmPUTye8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: YmqevCpmYDZixaI3v3dJWnXLKBbsZWvG
X-Proofpoint-ORIG-GUID: YmqevCpmYDZixaI3v3dJWnXLKBbsZWvG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3NiBTYWx0ZWRfX/B/AXICUMtN+
 kAOXDloriaOqYwa8lAg0NVDwZvxi1vdMnURG5O4yx5XddEukJzTfYJCUQ/rMK81LQyMzjWE4aG8
 x0i8CBV1wP9qRYt8TZe39o9lnV2MOV8+QL2+q5zPzmgkC26gO2v6EtrYoIqglq3mXKgsJuiVzxb
 5try2R3O5m3Vsb3hW6TP5oTxW2v7Xj55zAfIagXPp6aft2v0Uy8nuP+U2WYl+Izzq7Ht59uuVEG
 IHuAwBwnO44Ugw6S+c3GuslV1mjjrMPpesnkqdq3OlVBlZ4rIb6VRbksrYk/vdHAtZoTC4/zwZZ
 nhqrXqMPo6q1Or8waWCqS5EjaxWsm/EQPnW2SQ4rX4lupqfZZznJUUkDqsviC2bbnCWKvZY70PR
 6ZjtaqZzgU/ogHmWQrVwegdbJybSkUKGS2Te7nXk08d2K5k/R4CWU87NuBGyGSlkPnUACOSnimR
 LkMLm9/3HCzcHqa7ZEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1011 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_123642_707899_1E9E93D3 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
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

On 14:09-20260911, Slavin Liu wrote:
> Check each newly allocated discovery array before copying existing
> entries or publishing its first element. Devres releases prior storage
> when the probe fails.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.

Why RFC?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

