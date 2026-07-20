Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25452C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pABA4BQkZcQGub98w1pyg2kTx/BA72ZzRDun2Q0kWAE=; b=wfqbkVTijYgnG1nPI0WyrXQguG
	hWG7OT4H/Fyw01lFFjHL0NPCondMJnhciEbS3gkpB4zLoFaO+2qysetRjWc0Q4JYniSDuT4s64uQ1
	YFUFdMYzuKzhXRYdnFaL98q+9lOzDbHqIJFNSTuREAV7vLmWw7xVCPNuoiG1cBFdOLO3lLpkE12OY
	A9N7ayFuEtC+jOJaj4LMoVhkNg6L8D37hRmEFcd3gMJlat+NvWjj18vfORQHwjqXBJnBQh+6KncEa
	+/pRFUcTM8ZFWv0R0hnK4nlbtqgrsMv4po1bRX7rY2dlK3IJygu1GHwttdwXS0th5IG41uxiALlZb
	UUDWvnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlopD-00000006wVw-451M;
	Mon, 20 Jul 2026 14:18:31 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlopB-00000006wVK-3ExU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:18:31 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDpc3T2324851;
	Mon, 20 Jul 2026 09:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=pABA4BQkZcQGub98w1pyg2kTx/BA72ZzRDun2Q0kW
	AE=; b=KGs7Wfyb6XPlZ1zx3pJbpmdgy/etzfKDUtpJribPDEk+zM5ObzFEKsGXl
	AwtibWwkPxYVYjZx1cfNagce1IRa2lIiF879MrVRVnoBxa+HcwJnNp22bcGabMAl
	+TKYTlBtJp/m0eGaqbOdyIUvZfrd1E4QN2kLoouQj7laRRkvtf7HVdQK4riWrvUe
	tcSL5+66myMfdd9TvMKffz05d3dRAFAgFgSfSN6UgwlofWkyBT8jOAfz3CMoba/w
	EoEJ2ge/pVkoi1d2m7CvXL8hM1Rw23ixpf9E/gBKSYT1UAEwoYnlYjVygD/CwRq1
	/QxKTLdlXvqaetrbBHZCjV/VTNRBQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fhk198x3f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 09:18:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0LZDEDNhPz/N2FNYpi18kQCvIspH3e+nM9n39MUDShuAdMhQcoU1H9a+HxXoLJZa+BnMRfK4+m1rlna4J3dCJZ6JZpvIdR8PuS7zgixdtG2HRLE3SXlXDM5Xg/X+CuvgKz+sfXAxR+sn/Ku8V1bjfSdVMPKYPaIt/93Ls/d5lVqL6AxQo8mCG/ezup/QjItPE3mdGaeGfn8hlKRfqjm14Y6ZDKU9/nsB+fcnQSNAnm6rfCF0zmlCUGKPOCef5uS+r7NcE7XGdO6QRA+relgbX64kPt+bLcmK9DpLe6hOVUDewSbzcneaZWRIIegxlEhZPwwZFGnmhTmDDJwIyafyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pABA4BQkZcQGub98w1pyg2kTx/BA72ZzRDun2Q0kWAE=;
 b=DtnPgGZGgASDv1rsNMrAdkIKz1/eVW49BzdFCcmrdjkySDOLnn/HHRbUB636l2h+aR2K/sJQdEg174cQ7Ak+tg6M/1d2NaxBFlvl5rTnVXxmpeqDUKSgOGWxfV0whPhnz4F5rK/h9bx+19cwoc3vLMyuic6RKDLn6E91AgDPpWeYBaZjgJPjD1fbxRsizlsuZUAWy2W5rmun6ndwuarmtnQmV1DJcaMIbpegTCoFWc3CJO+gBIgb+HRAgr6RM7BzeKnWZSrjOtWA2dBO8HQwa9Q/oEx4w6F7iPZY5Hn8z6pLMZFuoZPB2k3wBiSjrO8r6brd/Eyg8zvjif7BYx8VlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pABA4BQkZcQGub98w1pyg2kTx/BA72ZzRDun2Q0kWAE=;
 b=n3kX6ZhfwL5Ydzwvo4J5rlTQ4w44hNEjaz3SSsd6QS8YvwEnnGE+XZ0SgVa0/vY86uuOT7rIkkKboXo5CuqhpyyIF5OdS2k/OrMLuQoBy5mcIyESqdBqhkg6/vqOU4pb8bewTB9SPX+RBonvgWgYjAL7twLRIwOTAv0ngcsOAGo=
Received: from SJ0PR13CA0062.namprd13.prod.outlook.com (2603:10b6:a03:2c4::7)
 by SA1PR10MB6391.namprd10.prod.outlook.com (2603:10b6:806:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:18:12 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::bf) by SJ0PR13CA0062.outlook.office365.com
 (2603:10b6:a03:2c4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Mon,
 20 Jul 2026 14:18:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 14:18:09 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 09:17:50 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 09:17:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 20 Jul 2026 09:17:50 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66KEHlXW2546128;
	Mon, 20 Jul 2026 09:17:48 -0500
Message-ID: <098cd973-3773-4ba1-b2ed-22545acc22bb@ti.com>
Date: Mon, 20 Jul 2026 19:47:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] soc: ti: wkup_m3_ipc: Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>, Nishanth Menon <nm@ti.com>,
        "Santosh
 Shilimkar" <ssantosh@kernel.org>,
        "open list:TI KEYSTONE MULTICORE NAVIGATOR
 DRIVERS" <linux-kernel@vger.kernel.org>,
        "moderated list:TI KEYSTONE
 MULTICORE NAVIGATOR DRIVERS" <linux-arm-kernel@lists.infradead.org>
References: <20260720095920.542801-1-panchuang@vivo.com>
 <20260720095920.542801-7-panchuang@vivo.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <20260720095920.542801-7-panchuang@vivo.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|SA1PR10MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 9438e1ad-e7bb-40ca-e506-08dee669b9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|56012099006|4143699003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: hSakyGuMmOt3iupK/tbleCgGJcCMt66TYeTdjxP8O9lxcPJZwwtv/fqo8TnhUH275zzp8HrBZKf/gBs09iQavl3P5wra6KC0KxzrcB95hKmUnysVjge5TvbQV3q05nGbKlnK8BIHl92j6t9kwWgaxPa//su3YNUEgy0tO5HTqUP+qfpxK01ceGLmsYie+qP5LxOYYHFzJ961xoxvOSrW4xFzhxxtrgcxCYr/w4oQCkR2VjHIrJqhI5RSaSCJ5YU3Nipgf8u0xK8m6/1BkhwPE4uhz9sorHB0O2CHvhVfrainNrX/ymBrnyLl2XyOdwt+lqHqAFhVZ2adkYaN6SjOrmDT2vZCMu/PKocPDAcFMmjIrLiuQzk5s/Ej+E1YOEtXRE1+dbWvUyQ2hwgf10aaQUl+ndHy4/TXhnR6R9XeKhqHiCRS2eufmkSccwucANXnosvDUHwUK2LDVaC4iY4d2Ldwrc2W0S6Ry22gbAVXKz9h4o/aHTGZYr6kpEKIOQ2KeHL/CNehBhplrfOtJvqzKbUntoqwP9imDBibhT4ez091IKpuhiNh3oEW6JPofKdu5s/+q4qNJTqFG/7hDjfmUnKikHzAHkduKwD05bkBVPGVBYaz4MxJYyN0I5qPxaAU7kwAvrfiiGLl7vwNeyu1c58O1n3+GOmYYY/z5xDlI48bpOVuYsDaTcfbhBb88WkJaPag/18Gb0ewJmVzNs5m0A==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LxANkx9rDTY6PKxiNIGAv+f0t/DS2x4q//YPbuJgcUvIFUdsBbwdgTrk9uhptQQuR15Yb62LfBiU0cKBL0dk+m4KfRrNyr61Li6Y55nYBmgzOIoZk3o4ijR5Znas5mZL7QlbLnkMLrHH51W/4C03NDmkUB+EsZ4oFz09M7GgJfwR9AgdvzmZJXvQk00nXucGQ6j1wtnkcLN6vrt+IZsUtYxLHWuV5yp3oVYubKttwoBy0nB+fLIIMdQrrEWB1bsjyXi+pvpwzllij8C0AjjGmwwBone2cFRdcNEK2cwNNFnHPXwMn5WTQ7mO0yz4LtXTOhkzflIQ5+Ie2x3LWI9bqcRw9qqBMs4zbOodmKhSNLZK8CNPlmdRPQm26BKNwGPk9xCVj/5uBa2R/LN2CgKgibYZgFMenRGtiV2nKcHevuY5hEMdbR57LPmuUh7O0Rzq
X-Exchange-RoutingPolicyChecked: JVDjrLFavNaHR8bWZ/oOWATRl374+ea6DGFf3ql4nHT4SobNaty1IQNWefkltk1sUcZKcS6UZDJLHgWoDDkdwHPyGvNizWh4vlFU+v49UZS3assDq9w7l0v625V4ZciP9KZ1u5bFT9zrKKLwQqd24expj8JTRoQfOpYlwuMEDTFL1kirV8M5ZnHLY1fdaLANodgpxyMUbms+WdlKtDVJEX4Ccc/uQahjMgmy3SrS6NqTjGbwhIioSvedUWV6VjAvigjs5ulzIm+J4xPGWTg7wTl5JyQsN/HrARalVqTHMwexUV8rKBv+cdZv4KKaHthgyZjKw8ToGAX/EJswhfNl/Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:18:09.6826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9438e1ad-e7bb-40ca-e506-08dee669b9ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6391
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1OCBTYWx0ZWRfX7Bap2chKiBOK
 2ktymZT9O6UJSnNI1PhcurH5cYjtD7xQ2Fcfd5G1UgNvDMX2OFWAZ5GYSZnrWDUqZE1Yaqh4Uyt
 8QtXak/nO3iXONQA8wmAWjSRRawfAlQ5Mnp9g9ia4WAilGw7W2AkMJWj/u0EaM3QmBzeZOjrrqB
 l8A5v05Pa3TYIq3ziyw05sNapAcF3YqfobTRWGC0th5TD+sZ7taUuKpWEpBqOEcJT69WAutTTnC
 POgi7iRsh7ypIjYvvX0vsdqLc4JrQ500nOrb+JS3fHCLb6us/ha1dEuXh6rmgBnQRK/T5VVuOEI
 MkrXyAuRilG1JwQOrNhCuwNbrswa+QbbkLS7QKjiZYIM3EOMZgw3WKokzkjjZwMyNFzkUtYJcRB
 6KW0X/Z0+WRzIyJSWhiRIPx1KKuJUmAUPH/fD3HGStIcQ2JCx6WSLbZZvofpJl8pN+5q2JML8J8
 /HgwCTlZqKPzzfhvhMQ==
X-Authority-Analysis: v=2.4 cv=I4pVgtgg c=1 sm=1 tr=0 ts=6a5e2e31 cx=c_pps
 a=NooIwpZNnZK4GOBrdp331w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=1WtWmnkvAAAA:8
 a=lDW-DkWJaRYD1cjfT9oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4J7c4xIXr5EB_zDG-0y8nw821Ovjoj22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1OCBTYWx0ZWRfXy8X9AxKD3HuN
 a6zRb6wNhYMBb0SXicI8MxCo42ZwO9dUi+UPu5vDPQcp0lOBfAlWEmHGfyYhZhE1W54gKs1LyX5
 atZu5SDE8REgHDVc9lyA5CQwKBXnRDA=
X-Proofpoint-GUID: 4J7c4xIXr5EB_zDG-0y8nw821Ovjoj22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_071830_030251_E0D8CB12 
X-CRM114-Status: GOOD (  14.57  )
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

On 7/20/2026 3:29 PM, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 

Thanks for the patch

Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>

> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>   drivers/soc/ti/wkup_m3_ipc.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
> index 5845fc652adc..f8640cdc2a21 100644
> --- a/drivers/soc/ti/wkup_m3_ipc.c
> +++ b/drivers/soc/ti/wkup_m3_ipc.c
> @@ -630,10 +630,8 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
>   
>   	ret = devm_request_irq(dev, irq, wkup_m3_txev_handler,
>   			       0, "wkup_m3_txev", m3_ipc);
> -	if (ret) {
> -		dev_err(dev, "request_irq failed\n");
> +	if (ret)
>   		return ret;
> -	}
>   
>   	m3_ipc->mbox_client.dev = dev;
>   	m3_ipc->mbox_client.tx_done = NULL;


