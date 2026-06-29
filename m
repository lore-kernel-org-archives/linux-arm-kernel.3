Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBC7C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKT4C0sIhcwaYUaqfRrRjyJteT7k01TdfXk5KlDnW1Q=; b=mTsMPbbqzgxWqzQ0K1ySLbbifH
	8XQk9HJJYqrcEluMHqhmE3DtuTw21T7HHliymkHOtd3l5DIT0oPvD8ztqMlQjrbEmmTiMaqHUwXbW
	Fb6IA6kdd9wDMY/siOglPnLQVvUirxAXJKPr/IEuoTV1BLPUqmP/n9eP96PWIAE74XMhSB63xezBL
	MSbLgHbZ1f0XEolTR35jvboPQ0Xe8XXp3b1ETF7es+8gFYDVtVoWTHpgYSkJ4hiDK5cAlC0NKBg5C
	VxKs31seNzS3tsu07uMct46aD38Iad5Tj/S73+IFVdQg2meg84iqB0yhH+d4jKxN5EQeONdBdexnv
	cnrgmfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFFu-0000000FGNZ-07Ob;
	Mon, 29 Jun 2026 16:54:46 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFFr-0000000FGML-0RLj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:54:44 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65TGURV82370335;
	Mon, 29 Jun 2026 11:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=TKT4C0sIhcwaYUa
	qfRrRjyJteT7k01TdfXk5KlDnW1Q=; b=iS1DI28czfDnGUBCbLfQs8bpO+FObWk
	eaeaA+VS+OvqKZqPVEUXkmnFJNQRWG8fLyoyic7nMVM8Q02ehYwpUlfNp292scJ5
	Y/m97ElL3Asd/xso8K24I3uqhlNgNZsptJkEr22NAZ4RNE86p1wWccfeQabQ5Ta6
	/IhxoysEJBF/ZAxqEDTpHYVVVIgTwQ1eNYmQMTOC5cJsGE+xd6cPTrnRIbzHn3uU
	55UaVUiK5AMjj3FneeQ2a+WlmcXeZQjEkEP5Smn9h2o9O21LCUBfMcUWRvzMHff0
	V3NAPCoMqlO3810fBYFaxwwPH3ACaU0D0NOzlQehcZP37UWu7DfW4Jw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f30fshhnx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 11:54:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JosTz9IkydEG6yz1CQK2+YomlplzxY22FajNSjFM6owQeXYYBl/mXtqmAwdmoCsVXjojDTIaEx61YS3lDvHWP2N4db1lf1s1OviuuUC8K9xe75Y7rXI8SCt7zANVlOxbNSmPt2F0zUubEE+hGnowlC2DVufBm9alEg8oS92rQe9aAw+2WiF5IFYT7SfNvp5sIfK0jlUtXD0EJkDYMqMsUEL09j5rROiiujsvB1tqreSHT7RREkd8ykamwgZyfqMidtV2ZG6mprmSvbKp7bEzMYRdma9iaSLC91UAnZTa18ye+g+2VxkeiFuEmk8YWWpJZMx77UwuoefOcnbES/jgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKT4C0sIhcwaYUaqfRrRjyJteT7k01TdfXk5KlDnW1Q=;
 b=nz4RoL8vOoSgyep2N0S8s4A6O7mnorg/PUibj6mYUnsXy3nx6TKEWh0b6Rr9uPQ9T6M48/QTkmHzzGvG7YL1TCMy9wUYolQDyswIr3eTxh+jXTJ4gaqDGZIPEvYcuW6TAP4LYunFaO4qNsYcNz0Jr1LzXYEqck4WWwsjjQg3l0zMOgGNI3FCkr6Aypry+Wa1PSOT9F6bPIX2qGd1TSUoHWorCYyCUrah3CIwP00OWPxd+4WedK8y0wgrrjhGog3tx/38VCZwef3j9Tj49J8/jU9HuNElnnB2z2n9XpaWU1JIVJSKSQ1vkp/tC3fvZhSRjnaiNPhGOK0P76+vqPPiUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKT4C0sIhcwaYUaqfRrRjyJteT7k01TdfXk5KlDnW1Q=;
 b=DNZUAwC24f7k52iS2jbGaYv/OKycin+cXV1xhuI3LV1JXjQz9tS0Gjq/3xEsQY+4cX2kq/aJP+HtDgmVVhpDzSDRGlvqEuwWHv0yxLK6wjgVgI1dBHk24vgQfemYUI0Fr2v/WdiYDEXC4Lpqs4ioRqN2piZ5t1i5+4dxSFTvbnU=
Received: from MW3PR06CA0002.namprd06.prod.outlook.com (2603:10b6:303:2a::7)
 by BLAPR10MB5122.namprd10.prod.outlook.com (2603:10b6:208:328::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:54:34 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::8e) by MW3PR06CA0002.outlook.office365.com
 (2603:10b6:303:2a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 16:54:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 16:54:34 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 11:54:33 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 11:54:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 11:54:33 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TGsXSs450220;
	Mon, 29 Jun 2026 11:54:33 -0500
Date: Mon, 29 Jun 2026 11:54:33 -0500
From: Nishanth Menon <nm@ti.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
CC: Santosh Shilimkar <ssantosh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: ti: knav_dma: remove debugfs file on teardown
Message-ID: <20260629165433.jjmnjqeyort6i2ic@jackknife>
References: <20260615091200.2373-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260615091200.2373-1-pengpeng@iscas.ac.cn>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|BLAPR10MB5122:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c943e12-9967-44c4-2614-08ded5ff18c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|13003099007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 05gvNj1DnKnlLEk2HBYSrvfDEz2j8o/MlKodBbn8/+DOAtSkT1OaXr83xGehNGDd1UDYMbPIHt705JgcSPF1CbQVe9g9R5O+AHywcNULsD0iGhhCO/b7vC6s0ffRmgVgqzliGm2AYcDSThfgY5byliXHmkv3fcONXcrD8bkki0AATcUENlizc/PwAfsfdB+APFe50k2sfk4vr5ZTkB+/3QGADNWT9+uZnUI1V6ca8OK9S2BnusB1icfiTM4K1LAfG/HUF6AX5SvvKbk5ewfZaWyARrHA2iVkCPaSFgyYED/XqaHu95+LdYxEtIGuhUw6a/4uCMOZhTp7/glds/tdLnSN78jg+FLCO1pkqKUcG3Afrc7Slcf2XmwWmm3pOJaCixpdtat+k8enxHS8c1KD1C+cPyYBIFiyKO32l1YnjXfFAAYP4FvRZveGtyAfaNSGQJLNpghbYSGZ85jo5hx8teLeHwxF0p2XL/oONOcPcjEaY5Umub+pDRbS5NRV+MfgGpQOfxB/dT0elaaVahagxhESVb8pPKWdjXwyd/o/sE2TAa4kUyv8hhJyuBMG5oVcgc7/EFAF66wh255ULfv6dhMhASOJv65Br1ng8JtwOnvbrfIsFhtIyXp3DvfLw8jcziQuh8ksCcAxqf9JBCHScB77gFWvhek6dc00cgbQJf1lMQTGg/kEvQA2dyEnXw6s5NCNe8t6V2e+9hIJB+0npQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(13003099007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oyxYdu7pOg6BMi0IK2ttNs96kOBhLu6QU9bANt51QX2d4Qt86zOxCh2q/bzhsDFoBGdnXPTfI//3kFqdtqfhvRJAgRWpZaSsaDCVtrGB2gyJO43bvipdFjrwG+c3Vxx6lS5n/AgfEyvpt30jKvvRqqDxMJjY6JZ42nFMpsGcT6jBkqQ4jSX5XrlosqagK97JhSqvOqpT+WDfA+7gpKczejz7vUTg25NCGPLVylDp5/zx1jLI2A8EpzjIx9DL1grJdRJzWueeeNkkGliVSkpWOh1E1A6RPSXiR+2j3zqvB0PLGZ3JtSfggdj9pL1XwYWgj3xTDpHPeoYg2WR5W4MSnHgiiwLmIlDBDXcCzw4YWjFtLOkvL1ERxki4lTFREd5dQ0PAk3KQGqG6ew7IaE5xGiD/dHfBV8MSgzhwdBFNmg3j4G1YK1a7yydjc+kPjw7x
X-Exchange-RoutingPolicyChecked: SkPIddIy5SPWceV1rw1QlMGyyQqIQNeo/qwrhdGlohmGidkFh2VOvHudssPr4LgcYEv6zjuboMNJrfQFkh3aeOZi0HGkhCPN6lpmuEAdGClKn1WlcHHoIdugisCrdrbmMXj6ceCNLsQzaBYLZD7jvBxc9FjeODkqZIkQlSgnFb8+PnlYntcYupKGS77/9lYqoUYevyzNnyv0kpktH+M37OvJplVxCOEHT9ZCYJUsuFhfD4LUnyu5jKHVpHP0hMxbv9fsJBmd1JWAnRmFuiQfe9lL0Hmf9Zv5TKhxoAcLigkQKpYEQ7JfE6AoUYfW8qFJp8j5JdbDgCVc7as8zUTP5A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:54:34.0691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c943e12-9967-44c4-2614-08ded5ff18c4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5122
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE0MSBTYWx0ZWRfX7Umxb6V5kOlL
 zvoM7jZyuHaxx/RJMq74dvUEVFQZ0JrqxVpjLIcnGNfcPxWqhwPXRP8aKz9sWiYSiU3kU8iGXGl
 iW0jd7IW6UcnxhzNE+Ew8aKZlRw/Rw5u5KtMioDZsrDuEhrNdq3adHQELKYErT59avSutCxnXMJ
 d2xDfO2v8wzRsfxGocB8ydF/m0KKMPNSQ5Osv2o3DNFxwKREO6b6wj+yPtS/st581sd5VOx8DKq
 nqDF65i3U/CplJlAa9UB4Cu7lQ6AZyC5fVG5f+FtKzVm/6sS79LDmBl/2er4GO4YVSIp5lz2R7f
 0Kl3Qtj+daKIUIjsZpmKdN837r5ttLKQW6YZAACYMgStM/4sxQAZTDGqNrv6/bSWy8WUfIQTQKN
 9CEWbz3odpdfIqF1OjTSWLPAvKD1Hvb7M6Rq+IcoZnhQkZ2ts07GIhApmy6tSR5VKrO6XZ5elwC
 Q6A69EAjY/YywENUmrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE0MSBTYWx0ZWRfX+4QSy10CZuUD
 S8+a0qeo9jZNhQppXQlqchbPjJJe/EkA5izZ4OHVoi/ZBPaJTv0BRBNMLnd4kcbzEJiGedo/nEi
 Fs3+kIasy2dmb6OaCbtvKDBijjwTEaU=
X-Proofpoint-GUID: uqbXIbCvZkbsAUM8hQ-YbBsNv0P2i_k6
X-Authority-Analysis: v=2.4 cv=dcmwG3Xe c=1 sm=1 tr=0 ts=6a42a34e cx=c_pps
 a=xBk5Uq5DOFf1FlsSGvIvFQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=s9E4ftKeMElimxgAmasA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: uqbXIbCvZkbsAUM8hQ-YbBsNv0P2i_k6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_095443_295100_DD1FA967 
X-CRM114-Status: GOOD (  20.50  )
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

On 17:12-20260615, Pengpeng Hou wrote:
> knav_dma_probe() creates the global knav_dma debugfs file whose show
> callback walks the global kdev list. knav_dma_remove() tears down the DMA
> instances and runtime PM but leaves that debugfs file and global ready
> state behind.
> 
> Save the debugfs dentry, remove it before destroying the DMA state, and
> clear the global ready pointer state during remove.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/soc/ti/knav_dma.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
> index e5f5e3142fc4..9277c525ac21 100644
> --- a/drivers/soc/ti/knav_dma.c
> +++ b/drivers/soc/ti/knav_dma.c
> @@ -125,6 +125,7 @@ struct knav_dma_chan {
>  			ch->channel : ch->flow)
>  
>  static struct knav_dma_pool_device *kdev;
> +static struct dentry *knav_dma_debugfs;

Similar comment as previous patch to consider moving this to
knav_dma_pool_device.

>  
>  static bool device_ready;
>  bool knav_dma_device_ready(void)
> @@ -740,8 +741,9 @@ static int knav_dma_probe(struct platform_device *pdev)
>  		goto err_put_sync;
>  	}
>  
> -	debugfs_create_file("knav_dma", S_IFREG | S_IRUGO, NULL, NULL,
> -			    &knav_dma_debug_fops);
> +	knav_dma_debugfs = debugfs_create_file("knav_dma", 0444,

0444 is worth mentioning in the commit message.

> +					       NULL, NULL,
> +					       &knav_dma_debug_fops);
>  
>  	device_ready = true;
>  	return ret;
> @@ -758,6 +760,10 @@ static void knav_dma_remove(struct platform_device *pdev)
>  {
>  	struct knav_dma_device *dma;
>  
> +	device_ready = false;
> +	debugfs_remove(knav_dma_debugfs);
> +	knav_dma_debugfs = NULL;
> +
>  	list_for_each_entry(dma, &kdev->list, list) {
>  		if (atomic_dec_return(&dma->ref_count) == 0)
>  			knav_dma_hw_destroy(dma);
> @@ -765,6 +771,7 @@ static void knav_dma_remove(struct platform_device *pdev)
>  
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	kdev = NULL;

Also worth stating in the commit message.

>  }
>  
>  static struct of_device_id of_match[] = {
> -- 
> 2.50.1 (Apple Git-155)
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

