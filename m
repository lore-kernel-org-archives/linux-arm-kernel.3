Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38CFC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SP0CoFYLBN5VRqKJNSAXmRgxfUkjC4LEO3+j1lWwlQg=; b=f0QN5SCdC5Kwlpbz4DPYqrc7eY
	o0yKecmoAAmGDAa5WBPpl7BNQFZo3ebwUmfZH0Tem2AjO435/wPEhhwwTh+TZ2mmQseFOWdcabwjv
	4kqQ3HwM/JKbSsHcsQI39CaiF5nYlTqLnyPHjoLcDMaGzQAvlhd6ZXfTvTEbzr80v5eUPXgzPmKbU
	UYkcuVK8/6zHMEB61hyZDqvAT9gaUwIYy7JXf9HR+KHiN0H5rZDoeMZ1ktGzw/0YzYzBN95mmFpqL
	jPSVyu8dBNVXB4F42gfqgUUKal/Bzx4RCClNrh6j47jHU3ZzWqM5SaZmpvCkq+sPXOsfhSqawctuo
	ikflFVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkknH-00000002eUq-2jN0;
	Fri, 17 Jul 2026 15:48:07 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkknE-00000002eTu-1Mhc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:48:06 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66HE7giw1038439;
	Fri, 17 Jul 2026 10:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=SP0CoFYLBN5VRqKJNSAXmRgxfUkjC4LEO3+j1lWwl
	Qg=; b=o5/416/di4BP/ypdVhIXBqI+wmsw8ymtZ/bB+Q0viUJk47srRsrvE44yf
	HPjkyZxKE2AxSh5qoo85NwK9vD3l7oxpmYegOTA1qgTVHxQ9jSvqQwaVkyzEUEp6
	+/NoVpJ76PwXUXb/nwTr5M7uNF4W6urgmI5qeYbyn5Jw1fUUsIdTQ+zPTJq4UCi0
	96YHh09Gy9e49GB3DN0LljFO1g4guMMBiPPwsPloZlIoAFDSdclggovZVoybWY0Y
	QlKDmrR/puWu5jYi07hMt5yo2Fc8Qoem9vtJ1x4asfsehNypAa7Xqmil42kpn8OP
	XDyojzXyOXO65yjLRyZXZseQupfBA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ffgsmaa4f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 10:47:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUAPekHYk1+94CfnBruppV8A1tlsKpdfSJyPLEi6a7CqY19XLFeJs1dRn01ILgl8fr9HEqr4Fz+CdgaKnEoZBDMdmEU2GCD2i06Hysifb87PMs3H1YT5oymPL8yT4V7vXW251jBR6DqszetkjS/8BOEDfuymB8EIW6Vm59kK3ItD0eBEKwQZ8Xi0of4H7355FLO8ngVE28NPldBct5BPGBN1oss0djQ4ps1p4HCIoRJlfgvAvJlpjrCJIkrfvdXzcVCAsgVuBRS+J6MUb6rjH/ckt7nL0iFW3LikLSvgQElzjwuB8JgWsTIRBxkeyE2twFXVKJase+fDVIiRVewkDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SP0CoFYLBN5VRqKJNSAXmRgxfUkjC4LEO3+j1lWwlQg=;
 b=O2KqnWXJL+GJ7SN3ZTamJCd16tWgMapY18cOQOwOXixcdRlWZ+igINQwGHP4JjT5QlMpLP0sFutRE/ziu/4JRZld0alZjD8iyfoug863E/8A8yjBFjP0swaWhrWXA/Vxuu27Kl0TD7RdHexA8OVkJVEH1/FZJIoqUwlfoCp5edIOdbObyxCZYCrWWYpBB3xVzxaY5PoImPh7OHCPI/RCkrCHbvOSrdvM1sBzpZcCHXBE3X1xxic2vKX1wBTF+qJVFhgDNX6ypN67aPhj+ye2iY8hiyZG/DsD/9yLl34ATH1bZ8jC+ZuKhAUkZQ3kHT+LTsO5KVkcKv97YxSp1o5OtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP0CoFYLBN5VRqKJNSAXmRgxfUkjC4LEO3+j1lWwlQg=;
 b=rNO7j82qSs0RCnEQF7vs85OLj3N6I9dUoYKyHaHuZVCxGcB1KkVnazU+ubXgPgWuSpyE2HEs/SSD1aTD7rvVb3e4sZ+XIQhwtpWLRoLyL2VOyDKcbtyBikazupqXJ/0BoL7+dYqWA5Kci83kfIpvQtbOXXjqCu0q/OrQ216pYK4=
Received: from BN9PR03CA0493.namprd03.prod.outlook.com (2603:10b6:408:130::18)
 by SJ2PR10MB7618.namprd10.prod.outlook.com (2603:10b6:a03:548::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 15:47:48 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:408:130:cafe::46) by BN9PR03CA0493.outlook.office365.com
 (2603:10b6:408:130::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 15:47:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 15:47:47 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 10:47:16 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 10:47:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 10:47:16 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HFlGUV3519714;
	Fri, 17 Jul 2026 10:47:16 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
        Pengpeng Hou
	<pengpeng@iscas.ac.cn>
CC: Nishanth Menon <nm@ti.com>, Sandeep Nair <sandeep_n@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] soc: ti: knav_qmss: remove debugfs file on teardown
Date: Fri, 17 Jul 2026 10:47:13 -0500
Message-ID: <178430320974.1873330.2397078428553746505.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260706144706.96313-1-pengpeng@iscas.ac.cn>
References: <20260706144706.96313-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|SJ2PR10MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b6c665-f2fa-4767-73f7-08dee41abfd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|22082099003|56012099006|18002099003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: PgnDD+YD33q0+vMKXLPV8/ZcdEOIuG6qU2eDKCc5+zzWKWzsak8k8HCkQ5QjpnVAJz1SNhEFdw7y2uVk+6tP0Te+ktPEA+lMzN+4ib96mPqnK2RMI0gM/W4UFCMC025fr4JMysin22+UFw1CxocSkLyThQHjMt1RNXHlurn6XcEYCifLkwDXKVj7aRQ1QKFSU6hzWOi+KONvJTrRkBweCl9OChWKnYyaaiUh6gV6zEZIVLQaOQceY5YLcjUFXpQZz8ErOzCnJqophwsi+9F7ggbYt9paIAl7X6bRzMSZOTxUyqu/wVx8DkjZyU/G9f4orL2q/cBHkOZOeiFHXbsDh6QAVfhoO8wGIo9b25fVXaQevLPkcm3Biumbv+B9aL6b17mRwC+hkb+KESLuu3MbyQtiN76Oddw3kcGc5fyAD9SMAe5jsiI+5VpnepXvtpsoRzAoMSu5B3tP7Un9eEpihhs1wq68G8k2hjOplWZ5qv3rxDApQ1KpuoLzK0PJkOH2rIWTcOemoNal5Ga/LJjJAd+TIbFJKKppg8HjMHDJPWBnGXHXEdWHc3FZRnh0DTgSurU7m/xhvqPME1qQxKTpXK5uULGHPILSwUbXZdiYtqWRwqNn1KyNQsrriJCnkggPO22NcJwQthn1/q1a8gFjvcN0JrZX3YdDY4pvAqHhY2uzZq6MMb0Lzq6cA7J5xhsv0o5fpJtxHsnT1wuYJrbrGA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(22082099003)(56012099006)(18002099003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iWfZZJWCkbhqpM++3lCpCS63pXO4PKbMLiRIrjL6J0xmYRyrMIGr3MiVBiciVJafE8B3Kij3BpHEedKxtFdM51ZU6JHVLjPq1yjbgxvH42/gQ0GPHKdprRH4H1pZgcL3eiT9xVcmiLCaYVCjB0dcBmrzHFOFoSigyX2/j2gPy4yWj6NUYrRwgl96JElOhh3kSewNBU3iuCtH7/3yx6/IWdpiK3uZkklvqZupcRO8KZJNvo5kk9D2TXdhzMhRdKYfvjPGO5IJtmSo4RdEib0CDuFZqMcg3Uh665/IwxobbYqSWKKn/mZ/qOfnCpujNee/LSwiLbRBn/LBtPfXk1y39/9qP3hRC6WFb4sBDcWYzjwUNzLSLYxoCZudc5LN+K6muczUtPXpLm5GqCP5aOIFgUVTnb1h/jHWVdoOBbS9/druieKREe5ENr6YXfhwZC1N
X-Exchange-RoutingPolicyChecked: tB6A+LZjGlj8SCmlv23ybumNA5bDHUWgET76uNjYJohoQbzrU7d9bKhPOz50b5MoN5A2gvXgKzrv6JfpdNzhnmQ4VJFv8rvotuWwASQH/g0X4AWJLHvxGtilZsdYBGQXGjD9zHZV61nSn7p90iPLrGB6DckdktkvByHIhkUCclayjB17uWGfLZqLNjwqWWUX0CbDtwkyB2huwdjtk5Eq1E2PQKOgKxi/4vKfEWY6z0sV8KEhrKYI0Juw5VHno/FU0Isub7TGZqOJZD/Azjf6JuoSISnw1H2o+wT2DMxq//xZ07fHirOtlGT70z9mGMPOw297+5RQ1PT6chZ0Ry2gmw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 15:47:47.0425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b6c665-f2fa-4767-73f7-08dee41abfd0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7618
X-Proofpoint-GUID: C6oFxuQ8t0s3r1CU00Bn5yFaA5qeAl0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE2MSBTYWx0ZWRfX238tvd3Ewyzu
 WWFGYO7rxVhCR6CHeRAXywymmPZnoCI24tEolXCTrhgF6NS4sVzWHBznuTJXquf99Ea0GL+XCMs
 ObpvnD1Y5O4k4OnKnga4BwHkGRyoQB1oRfN3xAw+xR0qxAIRJd7LhvsPUD31Nj5SzAEYo+O41jE
 x4gphyoqSoYY5ZjspsKCFjVweFollpHDVP7mFh+/xNTYODsSJp99NUfHOYQi4jZDg6eTXH17t+3
 Q1AwYkHS6uASf4eQuTLvwJHJPhv4eLonixyw08PVqgd5WJSOQ1UEH76W6+BoXjtSPGxOh5nJAxc
 WKVmz8Yvz2gDpOr2jSf0vnQfsfa4vY1dxB+9jLNvOpotuPOs/+A46gc5/M6RA2NDlDkk7Y/72Li
 XPCBv5xHhbbasdWdh6ArU9u6hVLqqQ0eMqPPtNsqaRrcUEfpV/yc+PoatnrGi75FkUgK3NZ6JQD
 +o81G6N8o75EVhJwb4w==
X-Authority-Analysis: v=2.4 cv=GJ841ONK c=1 sm=1 tr=0 ts=6a5a4ea8 cx=c_pps
 a=sujALEMa9QlLHAoAbbwPUw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: C6oFxuQ8t0s3r1CU00Bn5yFaA5qeAl0G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE2MSBTYWx0ZWRfX7KumYbopUqA+
 pvhVuUjjKdwxRu84SfpgNQfzKgyhWQWpJQfXCmDjQjTSqcCSYs3xw8ms2yJVbOTY4Oa4IH5rGBR
 J1eDyAlBpF5KMNABgELRFEgzfWsEJ74=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_084804_584545_F6C1E80F 
X-CRM114-Status: GOOD (  14.81  )
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

Hi Pengpeng Hou,

On Mon, 06 Jul 2026 22:47:06 +0800, Pengpeng Hou wrote:
> knav_queue_probe() creates the global qmss debugfs file whose show
> callback reads the global knav_qdev state. knav_queue_remove() tears
> down the queue manager resources but leaves the debugfs file published.
> 
> Save the debugfs dentry in struct knav_device and remove it during
> teardown before the resources used by the show callback are released.
> While touching the debugfs_create_file() call, spell the unchanged read-
> only file mode as 0444.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: knav_qmss: remove debugfs file on teardown
      commit: 3c817862759913097f11467ed4ed2bbf974dabaf

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


