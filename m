Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37971C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xRF09fuW7Dfme80VJvwkeXXyqGvdeYWBizCXKcvTIA=; b=4eQ/6/dRdrJUDw
	3eXPpHLdmJDqwQsPL894UTslJuCWh1zfS5qWoHuBKAD7VOqzohq7QknC3ZkpNbQhbM+2we4uzqPAY
	1uVEiXJMen5sHkjFQTapGHFI3LbVDl26iqKQN5uKE5uCYouCscazYC7gLbj8CqQx4OVLnTkiPdEBW
	Q11rjARqJ9Yz1DmeDVBm3pG+ILt6BDIliHVf77OQut6cwQKAtvXNRz4c6bPUuPOzZhkhUfCFrGkPh
	RImYnBftcE/SBq7A9g2Pplq13ccX2XrxK2Lpcq6JiMoTBdO4O39jufauLQoJQmspoMFYOkOrvLgK/
	72i/u3Skp1gWnF2wDwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjv58-0000000EAko-0oMQ;
	Wed, 15 Jul 2026 08:35:06 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjv55-0000000EAkM-0yIO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:35:04 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F7Mif4279009;
	Wed, 15 Jul 2026 03:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8xRF09fuW7Dfme80VJvwkeXXyqGvdeYWBizCXKcvT
	IA=; b=FeoGck4hQk3t7jBBiwxR+Gm1nC81JE1o2YAHG/iXVpm7imBSbi8pBUNNT
	O8fXYRwyq6LONgd5cHlQ9q5+42nkePlznsEdivQjZSKQRmu0qcXqgemN5LEPQ8nH
	6I+WrhEO5yERkI+JvItihSJeUtyKGI/ghNLUlCw4QFDLmZtjb16PeL/DKmeEXV1i
	70ksHlScpNj9GP86aL/QU70OZdEGWu+KJ5PAUMN7U1sjXgPl+2FBBOir5sRj1itG
	pxpe8Fy4fFJasUuONmM8MAh55Pb/LEeSKKA5gRfA2PuorqQJpguDnKKy5MNCsWCi
	YGyOMyS/XCX5meompU6matE/RXXWw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fe5s0ga8n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 03:34:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaUFte/O60LWHo/VH1eLQyDo9tcGbaQnigWQmm84hS1SQy71mrNPhUuDH2YSOn+H5j+2gi7MdUE+Jikxty569h5MvSBnlM+4Nnb4D2rzlISNxG3pLaQRnGSSOTdbLFc+NvggMmonnewEAz5MNHOVo86ByL6BgDq417UOjmX0ruuAMcqcx0lmLfGlTscVwV+sylyAbV4jwnIvWJ2YZvc7FFi29g6pEUafz5gWGv5n118SQ3QJ7ftF3WcZf5IBvbuk3EIjEBhE8Bx/sBVWvKv5tcj/Ihry4r53sTeeMvOE6qVWx1++JiBfkhcXgJ8OGFhvLZ1/vPIL9MkhPKmaeVDrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kylU4U+PQSWAUvVWm3YWcuogUiOATMGWJ3pbogV5LMs=;
 b=RVCVBITzy8JLwt39xHJQmS/D/fwD31Roy0OqE65eqDi4jGxFHgtqdu/ZgjASLIEkazky/EyRPR6yJLdCDhiWRRo9YACb5mxK2cKQIGp/F6NVQATzPJnzcHUfseT6pzbzvhgdhzKgrmY1JOcmvED3D2xxGlGzKz6UQ4f+ajTsT9dOjDzc5Bpxbb+UJ61MErU9jc4BNxudyOS4C160OuEpbawYBTMwL33TZFAboDVwZgDApf8FLsu6RPMDSXslzp0ngXeoVDjJ5M0xqiZQm8dBpx2BxDRPkWKa5hJp8AlrGxLF9J9sSpHuX4JZw1EytdvjmLVssd6rYigGVjbBYI2+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kylU4U+PQSWAUvVWm3YWcuogUiOATMGWJ3pbogV5LMs=;
 b=ltO+7br5R6LDjGyiN876wp6y48Aisnv8FwLQ4DFd9expMD1RrFXl0zV2bIcaZS1LeQzLglw4bjLRNNsnpQkl4KJc0PEFXJp+lw7a2O1p+p6t9OtsGhrP3J/q9iKvjBxrK/UeseVRykuNlC91Lf0IU9e0Bh7D/ozzw5T9cQdXd6c=
Received: from MN2PR20CA0045.namprd20.prod.outlook.com (2603:10b6:208:235::14)
 by DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.22; Wed, 15 Jul
 2026 08:34:49 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::6a) by MN2PR20CA0045.outlook.office365.com
 (2603:10b6:208:235::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 08:34:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 08:34:47 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 03:34:36 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 03:34:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 15 Jul 2026 03:34:36 -0500
Received: from [10.24.53.161] (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66F8YWNa2048429;
	Wed, 15 Jul 2026 03:34:33 -0500
Message-ID: <e871de9d-b578-459d-99e9-0c556f1de904@ti.com>
Date: Wed, 15 Jul 2026 14:04:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <n-francis@ti.com>, <s-k6@ti.com>,
        <bb@ti.com>, MANNURU VENKATESWARLU <v-mannuru@ti.com>
References: <20260714125537.3304217-1-v-mannuru@ti.com>
 <20260714125537.3304217-3-v-mannuru@ti.com>
 <f45a8496-b003-4cc0-bb4d-a94c9ac6b911@kernel.org>
Content-Language: en-US
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
In-Reply-To: <f45a8496-b003-4cc0-bb4d-a94c9ac6b911@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|DS0PR10MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: fa97d532-6896-4a85-168d-08dee24bedf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|6133799003|56012099006|4143699003|5023799004|4133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: myi/kvIzKF/RgP8hlFVvRi7zvV2neGASqPOiuMFo3dUwqBysbmdpNyvKhEfC+HcoUNmQk5vks2tSEB2kYhR+tfjp07M1C+Fmt4tiUfd6a0TgZW7srF6JQJeUzHvmUot65x7ROAH+JcqKgCe7fq1KEoBNg2qL5NwcWdX4g/9Trm9b4/C1jzvinoiwpA/GIEg6feqGpNuzcYBpJcaTIypjkwF7wJ6vYM8RAcUck/NNxOcvIAiHMfHIsVABPmSD42t4G8i6iCAWhBGH6ZDWKw6ef19zp0/hTFm3SFQYSk3n0pZHE2rPd6ls7nmWa9enqTswJQWjm2/v74ZkkSL+bgf8PkNE26AnGYroS7019lcFqA1JrdARYe2Z4pONFjN2HOAMiNf6D553DeMwwDbw6ure2VkkKqriXpBY/FV6VCa2+bexTkN5DuZIzpUOtSNm16OMMAIM1uw3bOTUavZ0ogICLzp8M6anD7fb/6WYzn/1p4Or3AeHeCG7tQm6SsiNGYgBOEbZsS5QUDo1jnHMbRdmy++4AlALECM0NWIOluTmMLZHipGlCfQqNrRM7jbrOjYJT9qDKAbGDXAejSF0mkW2AYq0ooeBQO2RHxs4k8To5gwewaN0hYyjAeg6zyt9rILmg9A2F7cTa6oP9Kuf/AUcZicsmKI4jaUsgTFZNo7gu+thsC9GtX5SO2VK8GVQW8h3KpMldufttFOl314TODh2QA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(6133799003)(56012099006)(4143699003)(5023799004)(4133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HpV7YiorQhhv7ssXvjWistikjJCrYqBpdKDUMR1Oz5JEsNCQv1DJW+5DuhQFEenQpHGs9Y5/qM2IWOdLqRBSe5YwWdNg6lithcBIa3bB6dh01CAV1fcpINi9vST8DuPRLI6iEC4qXlTNKbyStqnw7fA1l2SkynsJdLp/00VEpic6lFumT24YXw7vQlTe8+9rnpxJ9w1vDvUHMZhDy3IxoYUgLIMlmapOUyNkDBAajG5NCmi6HJGax44Uble1LiIZ4hACKJvnArECt+ToFecQ/qpdDqAfzC7OY46heIJAlcjNTdh0ndJoNvwoChij42sLOpVM9LN6knnocsAGkj3KI0Lafdb3u+tj3lmHPlRI1IBNSG6bHJKM4fbgGtUsuxWAgbFP9q5kNtbcdeG96L7m7IOAC7qDHsZTGtSxXaSXbfUAbPopc3sMb67EiY+zBXxq
X-Exchange-RoutingPolicyChecked: G9GdCJIhA+Z9EUJ5um8uLqOq12viZiXoYMM5I0umk2vxJNxsgGO6m9Iz00DlhWS8p9clJzO/QAiHDI2cKIUBacPH58UIhR8ylom9UUsDDMk1stxLfpbLOzxBc+76v+XMOnbcaRfic/Gg6ZMACJ84rddvxqDbJSASvGfRJSd36NSmMWLG69FogjEpmCs4BgEQWEvmyWvYnEawPaAI95SOoHfq29wOj9vj7FAyL1F7VbaSNCi7/PoSfh2i1Eg0WVAZxzbfHc+VK2sebTKs7ARXRMQnn7zeQzKj0kPQ4FPuWqDVsMNTMFsKX2DY3aM6l1mIi/nhm+mcvuksG5OZWJ/HQQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 08:34:47.4507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa97d532-6896-4a85-168d-08dee24bedf3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6798
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA4MiBTYWx0ZWRfX+8LmFCnHkkPh
 UQHBMUzEzmcESr7PapAc24UlQPVwgnChTzWYaU78E+TbdFao2wDXgYbFw256Mey2QXBd4d9rtE0
 TXqYTIsAT8u2pZMJghQqqK1J7M5ir0c=
X-Proofpoint-ORIG-GUID: TLNcjbhYzTAcWLcJqaTPRNCEGQfgLzOI
X-Authority-Analysis: v=2.4 cv=G9Is1dk5 c=1 sm=1 tr=0 ts=6a57462d cx=c_pps
 a=+JqGDqswvm8kVNJxtWojiw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=RpNjiQI2AAAA:8 a=u8IjVz-LIQahPIIY_DIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: TLNcjbhYzTAcWLcJqaTPRNCEGQfgLzOI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA4MiBTYWx0ZWRfXxAJ++EC7t6Pn
 NybHNIk4cb3a4LRcJWYT1HcHLb2jKo9VrhVuDWvtqGfcP6MNg/Wtz1HVJ6NcKr4KCmfhFKTZxUd
 QyLrSOC04mbFNBqnLpyOdjpV4S2yMBI5uyrQV3B4GoOMnvJFaEOrYCmPfx5KgYDQLbghRZI2pPg
 ZkrfvzKpYiETanD4miJ7b4RZAMoMP0WYzDLOQQLDm6+/h3r1/OXBYXwhBNwNviA6oNjURa57Mp9
 8G221mDGxACfTuqhPH+OveLJ2c/oPSKVoC7OCSenOdsmMo/XZI8JZfNJ2yO6+CBzz27YzqVgEM+
 2yVH/gixFZ4+yLwO19SCZcd7G6O78sJfds+wMCSakMy4SsTIVbqifDeO3SDaaFoLZxNSurkjbxV
 gYrCN2pX3m/lPPkhCzp+jCuzjLYBi6sxBJ56XweDoDvFUexAjTfVF4DHcaTbzSNRtCENb2BScKf
 08JIof2nxOzpmDB2EFw==
Subject: Re:  Re: [RFC PATCH 03/22] dt-bindings: memory: ti,j721s2-msmc: Add
 TI K3 MSMC binding
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_013503_477994_7D34852E 
X-CRM114-Status: GOOD (  12.75  )
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


On 15/07/26 10:27, Krzysztof Kozlowski wrote:
> On 14/07/2026 14:=E2=80=8A55, MANNURU VENKATESWARLU wrote: > +required: >=
 + -=20
> compatible > + - '#address-cells' > + - '#size-cells' > + - ranges > +=20
> > +additionalProperties: false > + > +examples: > + - | > + #include
>=20
> On 14/07/2026 14:55, MANNURU VENKATESWARLU wrote:
> > +required:
> > +  - compatible
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
> > +
> > +    msmc0: msmc {
> > +        compatible =3D "ti,j721s2-msmc", "simple-bus";
>
> NAK
Understood. The MSMC module has internal interleaving and ECC logic,
so it does not behave as simple-bus. I will drop the "simple-bus"=20
fallback property
and create a new platform driver to wake up the inside child nodes.
>
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +        ranges;
> > +        intrlv-gran =3D <0>;
> > +        intrlv-size =3D <0>;
> > +        ecc-enable  =3D <0>;
> > +        emif-config =3D <0>;
> > +        emif-active =3D <0>;
>
> I do not accept downstream code sent to review.
>
> Start doing proper internal reviews. This binding and DTS is absolutely
> unacceptable, you just repeat all known mistakes ignoring any guidelines.
>
> Best regards,
> Krzysztof
Thank you,
VENKEY

