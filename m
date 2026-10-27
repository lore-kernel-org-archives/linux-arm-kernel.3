Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6353F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eVWXamwX;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=D/bXZk0X;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=JbeLYaJC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4KwgRakvRh3l9suWyVgYXdDdim7Cr9YE45BWwTgHW9s=; b=eVWXamwXEtJ1QHh0cR6y4Lv/c0
	PO+cdUdsru5iOe9M2FNbKsrp6agLlnO84piPq7WVf8xVxZjDtxdlcnrUjr62UAtzgrZXz421u4GjP
	X23y130d6woDmfH2xRMQ2SkdcL0BiSO94CxN/XNoOtnIbF0t2bElboNZME4cvq0ue/7thFTlVfDhU
	ir/iS3vICetVIoMymAutmgN/YrCclwzixB3dwwV3Yl8yaMj/znaYMJkcmawD2JovCIf/nGsP8DhIm
	7Y0YtRurcA4s5bGlFqNWEZwGuB4syZ5SJEjt5xtnT8zU75gkTnaJcRmVsQ49YO6jK23lfcUYajjHl
	o/jujstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLh4J-00000004mLW-2ZJi;
	Tue, 27 Oct 2026 13:18:23 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLh4G-00000004mKK-3eJh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:18:22 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69RBD2183385689;
	Tue, 27 Oct 2026 08:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=4KwgRakvRh3l9
	suWyVgYXdDdim7Cr9YE45BWwTgHW9s=; b=D/bXZk0XaJ2bTKKA5AEzkxcjE7xTp
	U400PRIpPy4EL583el2CN5ffSKsxYTFUkIT1ZAJGpqP+EgVrByyr5O9WdXyDH4rY
	8yZzR+KT+hKjxfpiLSX6bSplJK/oBDOzpzjlmc+l6bPcfE9VHW4Smf2I2afrNdNw
	03q7SIoZrIT+sv0SpGWvsSXrDTS0tTfsfXEJ1hlLci/ekl1/jYFK/6uRacbgaJKx
	pUQ1IoaDN2bZz0hApu9vaLiIlP/lTHvTqnNPnAepn8c3+erd80gdjMs5SWQMMfY4
	hsPwdn0gf0bDJsmThRdlWe1XyP2LyHIFuqvcZUY2Keyoo9bpZjkQkOogA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012052.outbound.protection.outlook.com [52.101.48.52])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hjtvxgkrg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 08:18:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGacBdV55fiOEj6GNzi5agTN1/a1BLOS16aBi0ueF7iBA7fu1AXgStWY63EhAPvvn1E3zaNJuErI/sK4qfP+rth1tjRl3/EiDr5RUYOQzh+4Jim40075P7DW3KDAzO38EpYFC/pDc2N1gTmIszos8OtUQsK0Te7Wg1mz3aJXdVvjNIJpO9jjI5c81vUH6TcYj2KECa6d5SnRnWVcMfP0dGT0/tXHNSN3n4HJJbojqYOb0KmRyYGsEhjrntz5hWug6Qbi9uWCPSZ8gSzwUU1I3hvtJkMCpJg+MdqZRNlidG1SJWsmfVG4VP+zao5Ezz29J6sv8ioasQFSn4EpItyYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KwgRakvRh3l9suWyVgYXdDdim7Cr9YE45BWwTgHW9s=;
 b=oal8sQU5Up6WuLgoW7zijGcjKRIUp/+4IGHk34RIlpopM3o9T35dGtrsUpAvsK/z8GZfSAh7MbsDMHIlvYAlxR15tcGW+6YUobANlnjgyKtkot3ihHqZ31VdR1GoVDAHjsYGxgwYMexw4QWWvqvHqZ46xg9AK4/593RjVlPI7kdSd6xlI431n7SwN/WS4SI62v5slDDfVhheSXgpeq8ssAH8qUSjNVUqaNbVPDgzMouP1y+dNkcXKkyWgLOzws0q9y90JVuOQiwMpHXbMvikdI7dEpzE8oE1OopzsTi0vvwn1bYrDGAdZpiz6Wl8PtWtqg8aMjt9rXpBJKa84Ktpag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KwgRakvRh3l9suWyVgYXdDdim7Cr9YE45BWwTgHW9s=;
 b=JbeLYaJCiwplrKQYrx4tNZfnd2zjDnmnDV+5frItgajQGylN4yFn9z2g+C6EFOyMFVKCBlKHWxtUeetk/LHa3jXlrRLED0qze/hCSjQGW4CX6d4AoaCLKlBHWddASxWZ0pf9dET4XuReveqNDVN0emeNfKroyIemYikRVXyFoqE=
Received: from BN9PR03CA0356.namprd03.prod.outlook.com (2603:10b6:408:f6::31)
 by CH2PR10MB4214.namprd10.prod.outlook.com (2603:10b6:610:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 13:18:11 +0000
Received: from BN6PEPF00000070.namprd03.prod.outlook.com
 (2603:10b6:408:f6:cafe::a1) by BN9PR03CA0356.outlook.office365.com
 (2603:10b6:408:f6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 27 Oct 2026 13:18:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN6PEPF00000070.mail.protection.outlook.com (10.167.248.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 13:18:11 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 08:17:37 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 08:17:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 08:17:36 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69RDHaZw1971086;
	Tue, 27 Oct 2026 08:17:36 -0500
Received: from localhost (meghana.dhcp.ti.com [172.24.231.93] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 69RDHZQt020361;
	Tue, 27 Oct 2026 08:17:36 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <haokexin@gmail.com>, <jacob.e.keller@intel.com>, <m-malladi@ti.com>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>, <danishanwar@ti.com>
Subject: [PATCH net v2 0/2] Fix switch mode for offload and non-offload cases
Date: Tue, 27 Oct 2026 18:47:30 +0530
Message-ID: <20261027131732.3411403-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000070:EE_|CH2PR10MB4214:EE_
X-MS-Office365-Filtering-Correlation-Id: 3274c596-1843-4915-421b-08df342cbff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|1800799024|36860700016|376014|82310400026|261026140227099003|56012099006|261009223027099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: F8gu56tDTNhnpDh/TA5QIeAqXZxY/xQz6Vy0c7j4z58VacDxdmE0Sc6fhHHKGDzmeq9/An8Qc4iV17lWBT2rFtKEv0Grbf7sQz6HYBwBSIxRVZjJPCLjbwd6e0MnX/C+t/Aa+Z85j/d5ZAfgosB6pSGp28YTdh2EJXewUe/wspduvjVSkyqNQo/nbmnLk1PFMusuTtOFIHYmVsTgUtlnrwUBvuR761Qvpbtj6ywVPCoQSBGIN0uTDprOQW1p+puzxn0ggATAUmDSZEQfjAKR3Y9JbNuy3qcvfwxvbDOguRz+nKmlSytergYoWBtgf5UGsNrTXy69brH6MZkb+fiwGZcFxQ6+LyL313OHwvSg4fR3uj+r3S+QjBZ1wEy2NpnqwSNacNDiY1kj7yRR9/7SIQbsB+hrFuowlBQ5kGtW/2IbcdFAtInLozldvuIJgo2MIz6gxSQHzGFmQZPHpLVHsoYHBRj7f+YqFW7rxch+svY4nfCeIKHKO6bjLpu4wrcI7A9GXhqagFkz1LJvrnQGreLMgzfqwX7scLHLWMNQQxNS/y9YorhMeS/+Ug4aX+b0rbBkc7G8/8ALBkV05RKvmBJuz5ytOfbF7aQaQ1/rfHI8npmLZEXrrnO8QazuTFZV7ghlcIfWT1rMoEZJdX2h1oxCbvMsybGWcUHSsgOaK0c=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(36860700016)(376014)(82310400026)(261026140227099003)(56012099006)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NT4vPMNZFMm/03V8HnttGYntgoOxYwDfgeNgWe6W9b4Jicb+BM5seVoj4EbF0TN767frTOCBeFnEKlTQOlT9xlJEFpc3TiaZnRNc7S23Aw0k8qo2ycCBVObutLhqfuzLo2MSSsfJcm281cCJzJK6x2FWCj7Ys5t7Fm/vOukIsll+n46OAMl5uf9x105WQ3WCfbzXDfnEy4GlPxsL3WGZ8I68x0JrXOONyBWGF8izs/ebGJICetUbN2tjogwVuUdcXSIA7lcBcEzkgIz6qRXmr7znH/nvroMz5xB8Tj1d1ZG114+n1r19xYA6tfqborJnURWpdjgZB1CSGwTi+Fc2LCwn+eM8zHQu+wMCEJSqumjGh9FPm8KAuQN17SPpATIJSkmaheBNhEBFWeha7IUaSjKjfIgKWB9IpsmqJxQI2nWupFqtGHdD3DxZ/zepqGaW
X-Exchange-RoutingPolicyChecked: OOfmK1EhuIY4RtdqfPFb8yErpCZyF8BogbV7ydX1hxd7j1CiFimkenPm4IVU9wdOwQtr+C7V+tGb2brIdZsj7597/DcKScjTW2oCzTCshQs2+RXrV37QXFie2oK8JB19gT2NoqsxK1GZ4EsN8MKLMpUiMb8FK6K1bKxDlpTGLYaZou9jV1sod/MnUUk/eib9b4d9F21G+5b1DkQGUoE7jL9JDdsVv+P6FqMHhp9iPyzFtvgmSZXSWhRj51wqoDP95dBQfRK/ga7VfGnloygDSk9POvGZskz/n5oHFO0grD2ruax5WlINj6DF5jwOVh7j5CaM5yZClOZSFoV4GQHjeA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 13:18:11.2481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3274c596-1843-4915-421b-08df342cbff6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN6PEPF00000070.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4214
X-Proofpoint-ORIG-GUID: g3T57jS-2VYD-MTBJD4Y1U7-YDB5SJpX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfXw+lVHrqBnBiO
 aApOvgsCnSHhUMAOUhj8Gqj/CNSiU9mGprTIBeW3+6EJ+jYeuB91ZKBFJs9SmusiCJzQAlcsC3i
 X0q3dNMM2t4UBMAvDF3NGs/NMZlmBms=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX04gPkAhF7Ple
 1/bC7tP0xaPDsr5A7s+J5AjT/Jf4q7RroRg8Dizsb6CykW497y7sSsyip1Byy7c5+6t+/I6c/5O
 iZy8ojZW7yBHUfkohD8xrWriFQgyGy0YgbKVIGwgziuNci5Z3TTOORTqExG/CsDUjK4QiyioT6b
 bf3BgxuI5D3giaON0zzMLGxIFA0lEFXtxC5QzEHQ9mjzbzaz/+a0GldGocBPvd/a0Y/eLvzwOW/
 YBxCQCeB0kNOhxIpEBWN/gcbJv6+ZNzDGLz2NIt1gmIDLJjdQEhUeYNfoj9zmIxK8UVbxYbapTV
 XkJg2SmWrupW1Aou1m6vxoi8HeGpLftlUib2OqescDI5S26Ll7IVywmIOMF8jXkbvpkG0KXxqdK
 Pbgc802ZkFn3ue7/yvUeAznTMGZ2f+a18TdbrrLg+QixDRI97pBW4DFQ7D0olLvtiQ7RhCP9Z69
 baSG18SeVGsYBAkb5cg==
X-Proofpoint-GUID: g3T57jS-2VYD-MTBJD4Y1U7-YDB5SJpX
X-Authority-Analysis: v=2.4 cv=dOwzC+Zb c=1 sm=1 tr=0 ts=6ae0a497 cx=c_pps
 a=NkapyFR+xBWi1egQVwNhyQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=_U-UHtv6-JK0Jd6O62gA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_061820_991752_8FBAC7AB 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Non-offloaded switch mode is failing to forward packets. This patch series
introduces fixes to ensure smooth operation of switch mode in both offload
and non-offload cases.

patch(1/2): Fixes port_vlan for both the ports in bridge mode and adds
            non-volatile uc/mc flooding flags
patch(2/2): Fixes R30 command timing and a NULL emac dereference

v1: https://lore.kernel.org/all/20260930124356.3083743-1-m-malladi@ti.com/
logs: https://gist.github.com/MeghanaMalladiTI/7841307d5222ae11192d86e7a0c42535

Changes(v2-v1):
- Split the patch into two separate fixes patch with appropriate commit
  messages as suggested by Andrew Lunn <andrew@lunn.ch>

Meghana Malladi (2):
  net: ti: icssg-prueth: Fix bridge port_vlan and flooding state
  net: ti: icssg-prueth: Fix R30 command timing and NULL emac
    dereference

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 47 +++++++++++++++-----
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  4 ++
 2 files changed, 40 insertions(+), 11 deletions(-)


base-commit: 4dca97647a3e70eb6446966db8aff4e099775833
-- 
2.43.0


