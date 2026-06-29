Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54C0C43638
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2UzWf2lb1vD4JgEyToUqUc/laMQTlYLjWFohvFUVNo=; b=L94NHmnwZuZnFfV7C/F8UGn4BI
	9FTYEztOSMOkBN4qWKL6uaX7MmAOscUBgnKmx3n6rBA55J6/RJlk/3aXDvOB8nJbKqXJA4Ee8nG42
	0Mt5MJH36RtRX2fqTfyvrXEb6iOEKrYeu9UBU3MJuZu10Fz0OudFEqLoFsjiUh12l3P4A+cNz391E
	0218c5ck7qITjsD/vpIYJv98MfVRaKh3KxLL+Tvm/rlEogZ8Rpgnx5lQIMBB89n0QrRbRFglyHZEW
	wCwWTv+nV0HEtV+G3YFsG4ipUr5vijqYmeqOWS7oWaEU+oiOEeilHMwVMkkJjmyb/rJMuJFEK2QhH
	da/9vg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBnC-0000000EiCf-1tSH;
	Mon, 29 Jun 2026 13:12:54 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBn8-0000000EiBF-3fyb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 13:12:52 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3q31834486;
	Mon, 29 Jun 2026 08:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=p2UzWf2lb1vD4Jg
	EyToUqUc/laMQTlYLjWFohvFUVNo=; b=aoGJTUAXc5UaoQ8Ap7HJ/VtjlaU9W5D
	+lpKct6kPRsVcd4mpj/fw6wOryOSnd2WdqnulpLyar62p+LUx6Zwa8kYnH8YLsnq
	4/qUuIfBb4POnjCRQflR6+0apxDhU1ZVSd9rnbWZwEDPXx6EAXB/My9AgF2L0u+b
	r1TC06/3FAIpF6LURpeZdyvaB2EMnMLqfuBNzcXv4EUc16EAeViAmVaPVR3y4c0a
	6TtFpCVAQq5KyqItjgBw9seLkf+vGb4k3T9xHNNv0l1xOMzVNOMRjgH3lwmd/Jho
	zv3CXIDTLee2YsxcYaae21fpR3Vlo8gcIBFTHns4iDGCupkMTPMsUYA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010015.outbound.protection.outlook.com [40.93.198.15])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f3p9usab0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 08:12:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKUVcn8wyFapGp9gXmA4MNZvsimqzQ9OZVKNaPXrhi62xVPAsmSUAb/vc7xKocCAi/T3eaMYbjEIsAM6bRHukG13P1Cb8yKhBWCdbYP9z082LX/xdDFmzrY0wpXvcmM3x7yYgJbnI4kJoIxGbuJMHM75HamwUnNRcX15UQvpvZ6D3ICtzJ0trT04hpmzXlzt7Lz3sJ/3fOVC4Un2bW5HYkib2hlt+QF/nBR2RQTbMv+B+9UFLZSGB86Qm+p1IU2lwHZnwTKl3cEyKnyRLkRct307zo7MoDKbDJ+gpsvFZzCw+y6bNldPBb6NccIy1OwHXSe3X+qFT+dbmH93tnL2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2UzWf2lb1vD4JgEyToUqUc/laMQTlYLjWFohvFUVNo=;
 b=QqbMXDa52qnh9ySlvjZg1rzytXMo9YN2k0Px7T3rQrwBGaFl7vCRW3g2pEexLHnhmafgNQBqdJ7ejmYuX6QR8s7wOPryYbLIiOTxCgidHJhaBWiaWSmJyMwVSBXo/ZUaaqWd5Qe4YRewFeBYW+Z4f4VhXEpXD3rNVrtnFUQOuV9O0ZwfQcp10x0gADn9U1rcicEdwKKQ8K7cbNzrWqtKoFLXTVYoSHi/K+iQZmKrEqnFj82OESilOXys9dBPCBVxcD27Sp9zDbgjfy293hvZWDUq6jzxzvI0EsB2zCtYBPclYBa/lbBgQg2U8buoWTHWOrcuqZcmMQfqHVaFoqnGIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2UzWf2lb1vD4JgEyToUqUc/laMQTlYLjWFohvFUVNo=;
 b=Gt7KbkSBEU4H5mfHs2VWND4hoTrQq86x4xevMuV9YmaWQ+SHy4LQ7hiHqI+K4axtFr4NCElbEDCP3CfJMxXuAvtn8+U9kv+Viy0w0BN7xq/hzep4G1nm09e+0pjEA5h1ytywy1Ibok+heK/sAdmgrdzd2zznjZVz3yGdkvxLjVY=
Received: from BN9PR03CA0357.namprd03.prod.outlook.com (2603:10b6:408:f6::32)
 by EAYPR10MB997951.namprd10.prod.outlook.com (2603:10b6:303:2da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 13:12:42 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:f6:cafe::7a) by BN9PR03CA0357.outlook.office365.com
 (2603:10b6:408:f6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 13:12:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 13:12:41 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 08:12:40 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 08:12:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 08:12:40 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TDCeKa4168245;
	Mon, 29 Jun 2026 08:12:40 -0500
Date: Mon, 29 Jun 2026 08:12:40 -0500
From: Nishanth Menon <nm@ti.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
CC: Santosh Shilimkar <ssantosh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: ti: knav_qmss: remove debugfs file on teardown
Message-ID: <20260629131240.bkesmillqykrzrac@harddisk>
References: <20260615091251.7129-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260615091251.7129-1-pengpeng@iscas.ac.cn>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|EAYPR10MB997951:EE_
X-MS-Office365-Filtering-Correlation-Id: eb4b5bee-f492-43e3-fd0f-08ded5e019bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|56012099006|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3o2ZJDJ6fKfYG1OdzQdw8JzjAJ7dKiJxLAfl/JRApvhZsjOfQEC4WHTU6MwsX6VoKjc/hAixeLyp3A/DLtOzpKPole1WH2CWsyUKVrFOxa5xhK4GqyBr9rLEEWTcraUcpgZfdxLhZMuNJsQ7zpuRuEiXox4rjBkj+bGn3r8Hq7VwRLbniJ72B3/sMK84dTkndfl/wEDXULVunMr+ILJv12i29DOruNHm4w0MIvOdwnbdEmDbvOsj5uyQ2WY/w7EgBAepylh6Pb8qylNWOXFk4gLvSNvrQqIfE54PdwXVxr3AwDfway180411bEyCcU46HFjT4OMkEuvrbtt0damPwlgVhWBxbghaDDPpHoclIxJMyqztemxbyfonD/zU12lspmfsly8whMVold4FhhnFTBj1jc60t+YUQpJLaPqzdpDVcQ486Gx5YxzDwpMEaLP1lxFtZmhV6mNpwxLc4+qXOodFAzWsQXi3OrfnAgrle3Tw/h8lRUwpxHEEhda4PbhUjdqhFD/HR4QzauaeIUd7TonMLK/Ct/cwuxv/yvkDyjW8dJirNZuDeyzwQFWIdb8YdxjQYDq/Fhh6xjvK2cA+dzm/DaxGdMae/Bk/30R7c34MkTJvkYL5ZAlrOaGqPG46mc7TFsXeVW5YMP6LJ98woA2yvf63kojhONG9Gl2ZtSgljMUidTNHuHDqcIvGde9rZZdNpwdqMREgAGgDcGm84w==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(56012099006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bE3aij9NI98vFeOImzjW7UvLf/B2LQh+cIxWjXgk77DSE0cmE3GhzOymQNzsGqBfYRU+mZ8lS5aYSBBFs/PWsaQcG/G+n7AG99ngcOjC4bsmc10nNEsx3yloGbPpAoJVhjSbXobTTszxSMVc6ATHK8bwbSrcUpJjGdzBOfeD6hI44RYVPidltHikZoT983mJP6Ovlpz6vsjgwCyAi+YDdILwDJwkqtWFGCAnHuL1rakEfl3XmauBpCe3jmGlAZ5D4QKXeU7pqw+9DoetjhxJHrxa+5k+X9RYSIQv9+hx4s0WlFGwoB3sjVH7PuGKhaUGzPJjFTHtIGkfQ/0vfYtSn1/Sb5Xoyp3koyaGhpNHANXDFKKAWleX3kfLq2EI+2z9odfYPrjjqYubU4JV9Q96PyfGCRz5izUCryILQUjSfFBnQPZQA7kLIYc2wZnJQeKQ
X-Exchange-RoutingPolicyChecked: PSFlnwN+EyplYMkMLQT8rpO0n9N0uoz81wSDBOpilQwbBD8OxaqDYHJy1eBnuh5PBoyk4l+KK2eDTF6xUJHg2Pv4x+pRsIk4jABdtH27lAX+2+LOt+8s6EUZHpEsXlng2UUqrpW4isTP9vpcfymiUTD2P8wE95cfIcHiz7pnYBOdIbFmpRBDEgywIR9jyt2ZC4lDw6bRtF35FJPLjloJqyhgP1V9Ygir92mwkix0KeiKo1XSh7wXreVVjk/6LPfzjhUlPl89UyqWtLTMu82Eq2xpzdzY5TuOptIKhcIrzHlKmFHc+EJSSerwMDUQtlM2HQ4klNEl2wv8i4u7L9HDyg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 13:12:41.3296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4b5bee-f492-43e3-fd0f-08ded5e019bd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997951
X-Authority-Analysis: v=2.4 cv=L7ktheT8 c=1 sm=1 tr=0 ts=6a426f4c cx=c_pps
 a=41oIdeUvPxzefjUhlJkc5Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=KO9Rx5j7LzP_9oi94CgA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: MBoVssuXtjXYmE4wGhNNFsee5ffRPjaN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX05s6lrMRxFnv
 ZfwejuCrKkbg+C2uNfAqDOte2ca+wrwWze8rA46SZRm893AwxqzVg/JvdQIrYs63FW5pEbnYb/i
 DiKMwrEwLZ8TREkbH1Rhc3ytB00DiSAzP2j18XGFk64xu7N3jzE1bwL6+LbHDyPGhZ6K8wzM7xp
 8QHJ7qTPxBx3O7daLTRNiLEa0peMuL1f3LnACL7Ft09IrNd4MVSQ846iGAcJIvdWK8UOoer87rj
 NvwBX4SYSeE7hmD4Vi5P0NkqsAmrxSonNyYiEHeFPwxUcIiBcwR2r7D51P0jd4B9PNi5EpMXSLJ
 fd1peS0fOhtd8eDRc8em07ebya/fSoxa9uJLTxJZ2O3Jgr56ZoY1y/XajKbPMSYpwatArTMcXyu
 C4+pIU7oW6nWZZn6gsGRbpZXHljCieRPdJFaSGdIodFrzjd5J8Rd2RkoBO8l7JwKnFBfGgDXuoG
 5Isq0elT/+ed1zebNCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX9BBp9WJ1sRb0
 Og16i836KBx8HlX3MXojcLdEYFSH42+4BPhog/MEsLU+D6tPlMnXARDfkQpRUcWsRzynpdMbTCf
 AdQwwUub3RwyqWzvE1uVlc8r8yyhCj0=
X-Proofpoint-ORIG-GUID: MBoVssuXtjXYmE4wGhNNFsee5ffRPjaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_061251_064701_CE9909B7 
X-CRM114-Status: GOOD (  22.69  )
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
> knav_queue_probe() creates the global qmss debugfs file whose show
> callback reads the global kdev state. knav_queue_remove() disables
> runtime PM but leaves the debugfs file and ready state published.
> 
> Save the debugfs dentry, remove it during teardown, and clear the global
> ready pointer state.

Please update the commit message once you have rebased.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/soc/ti/knav_qmss_queue.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Please rebase to v7.2-rc1 or the latest linux-next please. The patch no
longer applies.

> 
> diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
> index 86d7a9c9ae01..1cc2e4a90c0d 100644
> --- a/drivers/soc/ti/knav_qmss_queue.c
> +++ b/drivers/soc/ti/knav_qmss_queue.c
> @@ -26,6 +26,7 @@
>  #include "knav_qmss.h"
>  
>  static struct knav_device *kdev;
> +static struct dentry *knav_queue_debugfs;

Does this belong to knav_device?

>  static DEFINE_MUTEX(knav_dev_lock);
>  #define knav_dev_lock_held() \
>  	lockdep_is_held(&knav_dev_lock)
> @@ -1857,8 +1858,9 @@ static int knav_queue_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  
> -	debugfs_create_file("qmss", S_IFREG | S_IRUGO, NULL, NULL,
> -			    &knav_queue_debug_fops);
> +	knav_queue_debugfs = debugfs_create_file("qmss", 0444,

I think the 0444 change was triggered by checkpatch.pl? Lets document
the change in commit message?


> +						 NULL, NULL,
> +						 &knav_queue_debug_fops);
>  	device_ready = true;
>  	return 0;
>  
> @@ -1873,9 +1875,14 @@ static int knav_queue_probe(struct platform_device *pdev)
>  
>  static void knav_queue_remove(struct platform_device *pdev)
>  {
> +	device_ready = false;

This should already be present.

> +	debugfs_remove(knav_queue_debugfs);
> +	knav_queue_debugfs = NULL;
> +
>  	/* TODO: Free resources */
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	kdev = NULL;

I think we renamed this in recent patches. knav_qdev = NULL and should
get the memory released once the remove function returns back?

>  }
>  
>  static struct platform_driver keystone_qmss_driver = {
> -- 
> 2.50.1 (Apple Git-155)
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

