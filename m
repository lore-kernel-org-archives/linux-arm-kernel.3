Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0083C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 16:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+24WyezfpewXSucoiTJ+I0/8RvLIazrA6SXFC6gwRGA=; b=ploA5zhVwditSImMy8MJefaxpN
	BZuuPLrIuvnWQj4Ve3nTeDU3zdBoyQa4u5Kumqfv9ioagPvxV7Wchjoc0nUbX4+xMBysrTiGfQHiP
	bF31VeCo65mYQszW6rIR7UVB+jJEoEH43uvAAKG4H3Qpigf01Q0v6+ln9yPECq9lo8dSYG3PXs33z
	Ys5edcwxSjHGL99NFOe5j677g1egVhEffwK7LRl1yDSsdqOutATn87IBpE+SqyH7ZSUWrVZ6Cmktk
	98BBcKwwZNDc8J8ZDeGWeGex+exqP22fcCLaesbSbEY/D2nwaU4Jef4S6LFFm+fRR/PqtUmse5FaD
	w7CeYi6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Zd-00000006AFL-1mBu;
	Thu, 06 Aug 2026 16:04:01 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Za-00000006AEa-1yGG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 16:03:59 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676EoYOE529871;
	Thu, 6 Aug 2026 11:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=+24WyezfpewXSuc
	oiTJ+I0/8RvLIazrA6SXFC6gwRGA=; b=ldY/nnHyFr9xefnF4STBFD3P/vqV7uG
	WFgqjAmUV12vbvAPFRiost/o+U6C9dr/T+tnu7RPWwEP+WgYocx85bfg4jX+LuzO
	SdbxHlw0jDnZ/sZQ5o5OQq1p7S6A8EYfq6zlBKpRVPE4mjylc667/I5vS413OJSb
	SgLIWWKyodrhyrqJdXwEorJgFiS4DAJp76c6LSPhyvyJQ9neOZ1ewhwNgGbcQX5r
	G4MRjVFnnMY778SaODk2x8Kca9T4Z6vKyqPc2afqR8jYsCrpFPYaYnKqYShuCHGz
	ks8a7eOp22uie0/Il+arsb+bkwY6IRp13sW5VG5qsreaCk9nFdmB1lw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010008.outbound.protection.outlook.com [52.101.201.8])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvsrf25y1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 11:03:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAzjJM9YEtvZlW6WqK0lhcQPrHA17Mg4ZMpQNAaE6k8vEJgSDfgnXlGWFOwiXscMyGc/1jPyQxWHRdlYlgwIBGK3HYcAOwq71Dxax9CsDKfuGJCj3RcvvLsGdLlfmzIux8YpRCwXo8lMNH6OAUDXlF21VwyqF30IkvM5jczpKKVmPAI2vSCZ34ext7GOouD8IE0pfi5WP0bMWJugREA/Ea+pE+PJ44hGk+OPMelEdYCweGRijbVIZHv2RZu7xJqVpZxUNyKMfKkuHaKNw1SErZCYhWnHx5AIkFrihLSblW1kas9jpHtqs+pIzTF0Z4mJ1X/lVy5FhtpJDHtLVk88wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+24WyezfpewXSucoiTJ+I0/8RvLIazrA6SXFC6gwRGA=;
 b=wtg/K6edyvlGS4GY5A82Mz6dxZRhbTDaaRITb/1xTrzk0wvCJLahrepWvwzodR0SUfsrQY+OKOaFj5Rz5jrQZmaIqGL7fHSJpI0uYiY0rPb3YxcO9441/HYQC6qSVJiPjbvkdmvkTpQ1EX4cj2PyP06A3F0XrAtE+aAG4Az3gjtyR+EJVgpkUQMQgLC7oBHlTZXrIvd74ffeNhAHSRbVq3GT6VA3BwmS2XV01ivyaWJ4bYQeO2evprVzDHc/njGgwBrzm0Dkx8QWO7Dgp68XzjeJi+UJujbx3DJqsXO2fmS6fyMUbHRDpE/TE5RHNoZVedhSX9W4aAXzoRXEIVnUKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+24WyezfpewXSucoiTJ+I0/8RvLIazrA6SXFC6gwRGA=;
 b=EPU/0wgD10+YjUueoxjdCuy+ma/p0oC0MR2iZwQSjajks64tf35fzQAHfnL4GRZ08krPvIFSW7pCQeARHKi5Nm3eDpN+JWu2p8ei6Nt48KT3cNkeIBrwFXONdWQWqhqUPsAhIJSLpFPHQ2mlaPr1VK05ld8WYpkVlTNIVxsIVW4=
Received: from BN9PR03CA0512.namprd03.prod.outlook.com (2603:10b6:408:131::7)
 by CH3PR10MB7258.namprd10.prod.outlook.com (2603:10b6:610:124::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 16:03:33 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::46) by BN9PR03CA0512.outlook.office365.com
 (2603:10b6:408:131::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 16:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 16:03:30 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 11:03:29 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 11:03:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 11:03:29 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 676G3Qt3159930;
	Thu, 6 Aug 2026 11:03:27 -0500
Message-ID: <52a08376-9942-4d5b-b8d8-c59df30de543@ti.com>
Date: Thu, 6 Aug 2026 21:33:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [GIT PULL 2/2] arm64: defconfig: TI K3 defconfig updates for v7.3
To: arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        SoC list <soc@lists.linux.dev>
References: <42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------Sw1t3nqCdGV0UWRAeIUbVrQB"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|CH3PR10MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa94096-83d5-4a53-1164-08def3d442aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ePyGZbon7Db0NBkj0cNVdXCCc32B+AtT8UO2eKDTE2X29iCuF2Poo+NrrHcnW5Rlu7PK5JLM40vw8GLhGW1iybbMHTowIvhXxK9DXItHEiR+gH1sqHNT1wJv4rSE1LZ8hR9dcgEr2GavhkjqAJn/qznpKu/SoCuIRN/CH9xswEqrQ3pjFwEvUQ0GCXNmQoNPccahby99ApxVSOjO+8Vl734qPXZRM5OTErXBq5VsPGzNlSWeCPelcSgwLBdfX7saiJLmiCakDGXtFpqR5Zn8fz+rj6DpPJ2rPoNnxeHbz5rQPLdg375PjifAExujMVoCqg+M6MiF4p24OII7ZLH4850Xtz5u2RXIqdR7lKJIRbqURj5SresH3hI8plY9pUZqySMRvk5VpGtfznAm5F0pDGkROaHJnaFDm9HlZwij200p11gmMRRMNipaALh3t/11AY4H9b6pbAQs2xK9f6XKRwY3SUPlbQHYaFYNnuFVNOQUFn9+kuX57SbpMal996gE5Ur60nx243H6+9CWJtl/v3k6bb9QXf4tOFYlHUyIk9jGyTEs/AzOoAgff9ISEaQET8wW59Tvao3b2r9h36j28OtfJZIxFulVdgsdnE68TTX9SBAaYZrcoywSFXmXIph1VTU3LPBpIFk9D5NMUq8Xhmy+StPH33vwpv57SyniaZHU7Jg4PcLOHgad8Gf7pBTDMNcpcQ5N/8O9Ozbiv/Wo2g==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8rl00x2YsGxq01Vup5O5fa7sKWxU0IDe+/DrI+70LFp7QE7EsgvXEzBvp3f9+oyFfyj6JB5PO8555xtfUsa2quwYMzk8Jke54YxFED22KusWBytJ9My4h0IeXrgkpRS4r2dRI5ALbc62VogSwXpK03g88TtzcAnk4tqPIqPHxE6tEPFtTPmz3uIsrKiiZFiqiyAe1eL1Y760pIQV8tzeFClSufg1+/cQYM+IGo48FDhPSwgEEbyb0876r8QxaDbUD2WwVtvGpn4HtZL+5k7n8KBM6iJoXkoXrShpPCVKTo0aGGsPAtG7OyK9Ye3VfTCJgZutFAGvY8svD+OBIp45KPHWhOKH5EW8IwPA6M1ZI/b09kjsABRrN5HWiQCcoSNUfS8sztdHF2DhB2/g1fJqVz3oDeC7IjZuhkhdzl+F9euUJwIIYgyL6OZHyO06aguO
X-Exchange-RoutingPolicyChecked: IKRwue6OSg+4eBy24/meCjqLPu8WMc+d/Z9zQZzF3LuOsi05AFhIX+sK3WwUFf/I3l5TOW74PhwUQ+IGk0hsnu4qwqxqKPIqAnkj/cA3/fi9uj4JcxheZx2yNtgFdFKdGIgZz37Tutp5ZpowpJsem9cJJWHR0EAkoRM5yn3tPMpZsOKTw3gQD7zZosulVKBnIusTMU4hjc4SAS9N7uENcYZGTYI2gLRwz7I+3/hdVSrx8B1KaGTCd2rizNPGJhJWwRPSR4vPsZu1UyaxLoms2hp2wtTX5rbYgHo8qwecPSWb3KSbbwxmuoEiUBdW/rouZSyQY/owyWIrbBTf1raRAg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 16:03:30.9023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa94096-83d5-4a53-1164-08def3d442aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7258
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyNCBTYWx0ZWRfX9CWazbX3JAnZ
 HWpv1cnzccjTGR3SQ5JdD9+mPlJiUlOnqwaF0IRpyVVkY0TFGQpNOmX1r+AxpUq6Dfc3vmGQf/M
 8EjwCUkWT/x09a1un78PfiZUz2IhGDCv/tKvS290oe9kbR8I0KarSb8+FRUQS49isnllmyxhjGW
 j9WNs7GkeboBxeZ8GgJY6JuEVfx20GEBTvNbWCsT9cfzx0iLyUL+YbObuIqJdnSUkDH82dPmAYr
 IrR08Drpc+XtRP+bn1r7iD+NIu95NUUgVWp6RMMu3Opi+YdHbk2XvHs1gBUws2Gk3guq0CSgrJI
 hZztwPAE1DE5TlLn0g0WoMxCexW9SioZDci1exeI96hIr7DTrFk4OiooXax/gFIf11BuNfXy+kH
 jkJV1kVooRARIH1hLCu9pnPKmE7yIbJmaAdDn4xqIAkSa0fD3fKKjFibuFKWUztM6WViCa0fUl+
 vAQ3KhSviKNItI6JPhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyNCBTYWx0ZWRfX+IqDiU6RlrDA
 m0H/323+3XzmkdUGCC9I1YXJYZeLB01wTfYSvqgvBzNHLxv9Jn0xzA7R8RyIFyYUHAcTfgflbIk
 iXR4rJCGPRjEad6mwrScTRn3BYduUEE=
X-Proofpoint-GUID: xWzUq-YmMg3yzF6u7tNOi7nRqKWDP7vU
X-Proofpoint-ORIG-GUID: xWzUq-YmMg3yzF6u7tNOi7nRqKWDP7vU
X-Authority-Analysis: v=2.4 cv=C+rZDwP+ c=1 sm=1 tr=0 ts=6a74b06b cx=c_pps
 a=5av3elwsUCsOTZAZyay1PA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=fSSoMyVAtGRyaOupY5AA:9
 a=QEXdDO2ut3YA:10 a=XQ0j70BdvVVXJnDECIkA:9 a=FfaGCDsud1wA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_090358_625817_752E0313 
X-CRM114-Status: UNSURE (   8.64  )
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

--------------Sw1t3nqCdGV0UWRAeIUbVrQB
Content-Type: multipart/mixed; boundary="------------6QEZlRbOx4s9rX9lyW0pBik9";
 protected-headers="v1"; hp="clear"
Message-ID: <52a08376-9942-4d5b-b8d8-c59df30de543@ti.com>
Date: Thu, 6 Aug 2026 21:33:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [GIT PULL 2/2] arm64: defconfig: TI K3 defconfig updates for v7.3
To: arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, SoC list <soc@lists.linux.dev>
References: <42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com>

--------------6QEZlRbOx4s9rX9lyW0pBik9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-config-for-v7.3

for you to fetch changes up to ce17d88364bf0bf964eea2f99776896e10227454:

  arm64: defconfig: Enable drivers for BeagleBadge (2026-07-20 16:18:37 +=
0530)

----------------------------------------------------------------
TI K3 defconfig updates for v7.3

Board Specific Features
AM62L BeagleBadge:
- Enable drivers for components on BeagleBadge board

----------------------------------------------------------------
Judith Mendez (1):
      arm64: defconfig: Enable drivers for BeagleBadge

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

--------------6QEZlRbOx4s9rX9lyW0pBik9--

--------------Sw1t3nqCdGV0UWRAeIUbVrQB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRQBrqaOmQ441h4YbUDQj8NV+8d1wUCanSwTgUDAAAAAAAKCRADQj8NV+8d15m8
AP9y4qxbQ1m+vsWcs4pcqrAkzkKStaC5+qm7Vv/7kWeQDAEAj5tAMRoOgqo1Jhx6zE+fTZRYJ9T4
Y65R0efq8iYJNgA=
=GSPT
-----END PGP SIGNATURE-----

--------------Sw1t3nqCdGV0UWRAeIUbVrQB--

