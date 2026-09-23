Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FF6C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 03:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNR+4oUpM2ef7crQdqZnn7tD2cE4JCbgrDcLI7wG/7w=; b=p6fnbCp5cpdXbUGTmlcGLQ+JRC
	jbpskYOd7L9HD6S5GMIHKBYDUf02tIA2BQidq6MV3poZnnpZewaoIiRdzU3YNM7idj5OUm9PshE8l
	GXjC83pwum6+a5u4KZzBjymhZyjzKPzhHGbbZVUelvpgjGVzgE/ldN40g93YCP9ILxCRUE11OOAWy
	DFZx9ZRPUedYPmulw3nCyxnW3/wbfle1/mu0rZX44AaIBYFgX0F9HF+YDOkInJCYOvXKYGaq2Lro+
	oGm/6yBqtgLAGe6ye4iYTVeToI/8w5+sfnQtLf6kBeC/f/atdd1CLntVCTn9yNQVEHOLWQFXmKyY6
	rkLb8EKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Do6-000000073uI-3isA;
	Wed, 23 Sep 2026 03:38:06 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Do3-000000073tu-18ha
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 03:38:05 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N3QlqY1049683;
	Tue, 22 Sep 2026 22:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BNR+4oUpM2ef7crQdqZnn7tD2cE4JCbgrDcLI7wG/
	7w=; b=beL5LMArIpifSSiNY+CefI8ItNGUI/bkiIwNYuJPql4wFyZkItlyHg1m4
	Ri1TQqb0MzFXIRXmvTerMkLs7jASwdxqEHKdmQmlT7iV760/sY9Q4G6Ye1KKR64d
	n87OIbmFuSbho7wAeDPZge8YzaplU+s2prsKwiyPkEaPLNzGJzCtZmyiD1jUS23N
	Zvw/Q9sFG9Q+Z4fe0b3YGgLuSN8fP1FpYmzzdB/kWa3XR9e8X21sFDB6KsWp8Rqr
	zdNLh4nsCzy6vsZ5LYfsihqkCrF95h3IBPMp4TuuxuDE6/9bMwdUlgra+s0hw/a4
	sFxYHtTRlCBteebO+nMnZMvrMCRCA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	by m0384305.ppops.net (PPS) with ESMTPS id 4guwpm3jsb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 22:37:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWOxbdpZN7sIOURKAH3jZzaoPhvMssMLS8SMmdeJ/1fNyWwr/2t3Ma9ivhKyL1fFdoVqUVNcf+MT6bu0H6sT7hZHQm/8vqGe4JhIyWwVF9P1gK/mt1q1fM5+R7K8SJ/lc9ydMnAHa0NYkmXzLyXjOXvoA8c5RLC3Gwqiga3neDnWIvHiECj/no3k48qREx1Sp0za13E8rGOscii0PmnGgHfS8RYYbJ+gYo5sPLpldLFf83V9aNl8rB5svxw/I2V0LAzW5/5AGsMy2B2IYRHxrirgIRLEIA5zeMXknbE7O+kNmCS/e4n5W3w41wzDbyvYjtMmCveRUR2rjUhyI8Me0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNR+4oUpM2ef7crQdqZnn7tD2cE4JCbgrDcLI7wG/7w=;
 b=sY8XZSHAYRWyHXJlFFeO0r5/qRJO6gkQPEYUWy6TwTWWwkQeRRpgs7QbEL+jdPd8VryoJzPT33vlUAQnzeasG+77xfl1kGpSevOPNeEe2IaHdb+FMUCcQ2QJ41Kc/oTrR/lUgh4759PQCRCh3LbrfpQJS2ZH826RYGlvzBWKicKmLu78vd3msdLeSQGJe20yhKPWjxLc/xBfRgjinAQb0tDG8K7jnLqPstjOc7qAxNe51770P6JV5Npd51xh5NKQuWg3klOd1sWIBChOrGkXMWadO9KFd5VSyMpRfAUqIJtEufY9Ihh+24ptoe4RTQPrDNKYTJ4A/ZSYfDKVvM1BDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNR+4oUpM2ef7crQdqZnn7tD2cE4JCbgrDcLI7wG/7w=;
 b=SJfvLJaKjhXaoYx9iXkP0sKAs9aAAcGV2dY8ttfUHcaYLi2SIyothO0UHoDAo1REVW8Tt++d+i+fbrdCa9KJA7+XusdMl8yMMm6d0wtyAJOix9zf1DSAB/HqPosrnut7u9sPQrsDPN3o4gU8vyIOZmiJeXv60dF2bQ4Jy/M5hUQ=
Received: from SJ0PR13CA0088.namprd13.prod.outlook.com (2603:10b6:a03:2c4::33)
 by EAYPR10MB997805.namprd10.prod.outlook.com (2603:10b6:303:2c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Wed, 23 Sep
 2026 03:37:56 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::58) by SJ0PR13CA0088.outlook.office365.com
 (2603:10b6:a03:2c4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.12 via Frontend Transport; Wed,
 23 Sep 2026 03:37:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 03:37:56 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 22:37:40 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 22:37:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 22:37:40 -0500
Received: from [172.24.28.100] (lt5cg60819vj.dhcp.ti.com [172.24.28.100])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N3bbL02125114;
	Tue, 22 Sep 2026 22:37:38 -0500
Message-ID: <bd3b9ea9-2e3d-4d33-adbf-abfd25adde64@ti.com>
Date: Wed, 23 Sep 2026 09:07:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: ti: k3-ringacc: Fix DMA ring initialization
 kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
CC: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi
	<peter.ujfalusi@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20260919163721.89044-1-kmehltretter@gmail.com>
 <20260919163721.89044-2-kmehltretter@gmail.com>
 <6cf8cc99-c2d2-43cf-bcaa-bd9cfc8679d3@ti.com> <arLTj9qVIE0Yz4vH@gmail.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <arLTj9qVIE0Yz4vH@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|EAYPR10MB997805:EE_
X-MS-Office365-Filtering-Correlation-Id: b387c927-36e5-4ebc-f237-08df19240e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|10067099003|56012099006|22082099003|18002099003|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info: EsCAz1pwz4jmZlRGSDO0EBtjbPTPlSpm1WyhaovuNijxE1rVE5f/C3QS0deOt4bWJNtQNzlluIRlz28kU6+jArommkLWHg72N3bvueMXboEmT+DsDMF0SDN/ljJRlGi5GgnStSZgm+Mgy5KGL2yTDXXKAcFRRqi/fK/cCXHeeJvdv0Wn7zXsmfTcvGO+JYYQSsB8aED4cDg/uxHUMjlKx50aea4wzJeEHOzZXe+SLw8sPGW09Zarc8158Xp3eTnWlRKKBgw/XHWpADbxQx5zdgRTn5EiEuOYk3lCvEeRl+bWw+6lann1WGF0zujUboEvKAaC3AI6LZf3CyACnc95oD7hcVRaYTppH+c9imdQjsLRGVDWtLmoBqcPPLk4RYSojaKFGwXzA2af2JDtCpaHBwW5tDYSyBQGBdcoOVoHqyLVVKeBbJRUNvhWmEh5LLy7jNmy7X1OL/5f58wnHmc7eonLvVqGuZgnBuFt0LU2nolf0MNhQjWzRFWK1nPcPXvVyQLFBzjTI57KMVQGILNF/gBtafD0Eu4+0y6jcjdPq4FYuDlcUfPgdtOXOLD++nNocqQgU66JW4RP2X/vZK627FiDmBtwnSPewl9jVO5fm0H2+kH94nlViexduJCo2csjnC2ERGHRIVb6z+Imt6xlsA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bYknhLz1v5c1DNG/uYBwsx1ambZuSwwYjN7wf3jPVdssMjhmXlEq4pX85wWkh4gXSxAgac2oFy9A7FKe2zU70vJZw/fx7w+I4y8sgYJtdSjiCFVvfeyy/HjAd3Km+hyWBFvu/mM+5UXbpniPYMW9GVdbH/XnL6Bxz+rZhZJiDSwv6fnPAVeRY/LUsdJgpvq5/rA/1zOJyAbWtjPBqkxlWd21lDUYhoxkALlpzBglQcNt/EkPk//vmm7/oKp4LfANq5xqIjCN0q0hm4n8L+ev2g0tsI1fh5xnAPWe5Cbk9+vvzGmYk8YHEE3U2pyo2gH3W0Es5A+28Cir/qmHK2e7kBl+Rt1RIjhjUaqf3K8fnXcs6jkmRie+nuFDJgoeo74sHAUMfQ75SPA67JffgZ5sKLRj8j+1l9MNWsxT8wSUUPd2jfXYKWF+sBtrUOVT39cc
X-Exchange-RoutingPolicyChecked: XiTCMszmMG0mF7aSsppwcktgakzSi1AXtm3ekdGWOTPFnoxB9Li39/icjJlV/Kh5dWMP2Q8nKMxZaKYzHueCVHFjrACQTVioRwKf+cYAzJJ9ASls+Yh0ZlUP/jJxl6aGYLzE6E/QwTQ2kAAt8OCbRzLQ+LxjcBKUm11Xbeyl1gtHo9+afKZ/6JrKZKavhnTygMvq6gv745b3mNX4uOFqs4zKR/c6DaLMPZNeuwaVKzpZxp0QptnGIMlOx9iXCnZtYGz9RgKbjdx7RWYbCE976enTkFVFoOuSGEwNAZf9TjRAX/JS/4hROu+0/lB8iXN4bsuQabVHi2epIKLnza2M7Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 03:37:56.1431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b387c927-36e5-4ebc-f237-08df19240e82
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997805
X-Authority-Analysis: v=2.4 cv=apMnmiZV c=1 sm=1 tr=0 ts=6ab34997 cx=c_pps
 a=CTIJcRslT32CQvadRVAfuw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=P-IC7800AAAA:8
 a=SHJ-VEUTKF7AJU0Bz5EA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxNCBTYWx0ZWRfXxrGOWLtyWDSP
 0N5mhRuXLUhm8m39bonbPn90/oh2HYxAQfPQEDG8nvMMGTO2B6iopOHCvpJI/CmQ59pyI5v3lZa
 478UfjIwY/ePaycMzFlgjO6N2heYp6I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxNCBTYWx0ZWRfX7quJ/qvqhoGb
 8ZdG8SdE9xYv/e1fdKDpCp0Tnv0CZLlA6sxKhoPwE1UKBZ4qij2FUXBEHGBJnbSoTRnqUzCqK1R
 XxOUeqhux01w5P/XMgPyu4jTG0tpHFbJxxGRMKY79EUE9DrLhI/NMh2xEL3Eh1zT8+3BhVFurjN
 yXddlU1PckXBbRZz6aGg1yiBfvg0v27WPr4qw3SETDEgIYxgJBRiQKgHPTrPbTEBVGBTnnu4KtV
 2Zwz5T+bZ4DK+qVj4VyEKtjXp84JyXtMYfe5kHCQCK2rFVJu3sEjYdbphIRfFivpwQPKW5KmzXL
 g/l90aLO7acxHVC71ypjuJ8aknXy+oFl4s83+7XFB1/f2+/UQ5Iuati5MRbJr1UrbWC/5RiYXb9
 0IvmHrPP89brByYd7dy8gMjZQx8zjqeSw3cyef0JnZ0K6Utwq9hsA6rug7oGcdlcqHcHsgD8GoU
 ZFV0FVZIH5CDCwU3pnw==
X-Proofpoint-ORIG-GUID: 6RH8nHpyHUTnFLo_SrQ_U-F260eHxoJD
X-Proofpoint-GUID: 6RH8nHpyHUTnFLo_SrQ_U-F260eHxoJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_203803_497676_FEAD2A8D 
X-CRM114-Status: GOOD (  12.34  )
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

Hi Kari,

On 9/23/2026 12:47 AM, Karl Mehltretter wrote:
> On Tue, Sep 22, 2026 at 09:34:49PM +0100, Kumar, Udit wrote:
>>> + * @num_rings: Number of forward/completion ring pairs
>>
>> Sorry from where you got above definition of num_rings
> 
> Hi Udit,
> 
> It was inferred from the code. Is the description
> inaccurate? What wording would you suggest?
> 

This is just total number of available rings

you can refer
https://elixir.bootlin.com/linux/v7.2.6/source/drivers/dma/ti/k3-udma.c#L5492


https://elixir.bootlin.com/linux/v7.2.6/source/drivers/soc/ti/k3-ringacc.c#L1478

https://elixir.bootlin.com/linux/v7.2.6/source/drivers/soc/ti/k3-ringacc.c#L212


> Thanks,
> Karl


