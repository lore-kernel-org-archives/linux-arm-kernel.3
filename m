Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7AAC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:CC:To:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UdA+fUBfEwoqKUwTiXueYDLXo82hc8YgxcJZ2LUrjpQ=; b=1WAE0O3JR4Lx/9kBI31qAQdPVz
	05ErukgJLbJhRyPLHbE8z1TTRrGDr/VmC+wnaqFrsgD5Tnp6RMqsPaP49OswZDWbSTP/RJ+so8qvP
	I58dzlJ+KklaH67ROpzit6FsT0PhHQ1flQIK+d4h73kT0vaxGJYC5IJhVlENn8DYYEGcgLKCtbu+t
	Zde8I5ArpIsSToatqNuYkrv26I4klKCpLm+SPBAR2H2nXrg+O0fR6hzxEHpO5uD3OtjI3uIK0NsP8
	mrGNcttk2PGu+FF8DJccesxKgAHpQqDgHAlfmbm8FY3a+L8+UJpfI+kEQCKpfjSu54FPgVIpGSyDF
	/a2vggTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Xc-00000006A2u-0LYj;
	Thu, 06 Aug 2026 16:01:56 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0XZ-00000006A2a-04WR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 16:01:54 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 676EnwDi1202889;
	Thu, 6 Aug 2026 11:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	proofpoint-05-2026; bh=UdA+fUBfEwoqKUwTiXueYDLXo82hc8YgxcJZ2LUrj
	pQ=; b=XkA7ITT70JMQN677250tfG34ccOmCZFwsZyr0Yf0DKYvx0bkotP1Wahrl
	d2NgYYu3KT6h6OLmZ0YeBGca4wPprhIGgSWgQ3kF/PXZ4nArYYVg1SZTj0gfhKZ5
	0c6zM+4waA03PIs0tsFxz7+869S63rC88RAJo+E8QEb/rsrZh4HPj1u9mfktG7pw
	XsUaY7w5ML0oiD9xOexc/z8yar3EEARB4odQuKjbpbo5bcfC4N4fiBgjh0xGZXDs
	UMor3Ar+UFSShXAHi6+JhocFcfmdxaPdJ13CYUM3C4koFQ7aW1TOZ9kqEYGKJaZ4
	Fffk5AATY79y9B1+PiJcNJh+aHYTQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fvqjgaw42-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 11:01:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMugzJrfzSb0PrWvinUmcG6ojPVMYP3iAryF9h5GOLXV+mLG5ZQGrb09jqHDfAckUrUWF5LRxfFlv6BJ7OhWE5vYQLHOlJUTBv1wyqNJvo3gZDySoOoJHwEykDofBZGWmihu47jHtIuQvlHdflyr4Ueqy03OTnZ9wC6xrtk571s59Y/CupQbLDh+rk/UxbcsyJ4tjt6ocO6fmMBu/5vDQzjJCXA4oyo1PgMCgTTlvrZZwJULFwDmRxyGrJqL5IadbB1XgxtqLAJ1QA6VzCl7+x78YnP1QOMhTBYfx4kUHCNhuneZuteApNBUfXmYrSYrrexj0mlJ8c1A7sjX43zhbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdA+fUBfEwoqKUwTiXueYDLXo82hc8YgxcJZ2LUrjpQ=;
 b=sqW2XIMgLIOqkTkEvbkhyuOzlI6Z6P1PWK9sSHzkzLEHTRWRpWHL4yA9o4qhdTmtSiWvm7+JmvnCbI3Tl7LzhQh0T5UzQl2sqS6/GX1fgZ3wGasudmyZWCblsuunKpJDGrbTJWuNmLgAgryTqocOkFl72x8DIcRZROndhv5eIR/LG86rvwMZeRIxXV2vW6oOdHOhhq0jtTTEQTNZyCwaTHyHdCpvphQmEHBScD97Ci1FsrPvV2x116vy0t3zR4nmDjswPqBDzukBgyy1nu3NrukbKwEqyXAzjhp3LVGFlGVDo5vV0x2wlM2L48PC2qjxU84eCQ21jVhonNJ5UwJqNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdA+fUBfEwoqKUwTiXueYDLXo82hc8YgxcJZ2LUrjpQ=;
 b=RWDIY8l3iSbKHsAEe3Z1GypF+GHObZ2Pe7OyG9DP5nsEvaU/YMpfzHtvbwARg1Ly1/JVpxvL0qMb4fQIcfru4pQyNGvmd+7cYyFwCpRG9MQck7sfNCpNYhJZrJbJAIjng05CVfGEnFxAUtQZk5dJWFG9CoSz3VVldCMIfd43Mfk=
Received: from BN0PR04CA0161.namprd04.prod.outlook.com (2603:10b6:408:eb::16)
 by BY5PR10MB4356.namprd10.prod.outlook.com (2603:10b6:a03:210::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 16:01:42 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::ac) by BN0PR04CA0161.outlook.office365.com
 (2603:10b6:408:eb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 16:01:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Thu, 6 Aug 2026 16:01:42 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 11:01:38 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 11:01:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 11:01:38 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 676G1ZYx157211;
	Thu, 6 Aug 2026 11:01:35 -0500
Message-ID: <42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com>
Date: Thu, 6 Aug 2026 21:31:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>, SoC list <soc@lists.linux.dev>
Subject: [GIT PULL 1/2] arm64: dts: ti: k3: DT updates for v7.3
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------Mf6XILKE7aDZrCSuytqj67eJ"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|BY5PR10MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f27e72c-262f-41e5-37d6-08def3d401e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|30052699003|82310400026|1800799024|13003099007|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: i7YIjXez6+k30LSIf+9bX4t/EbQ9sU7W3NSEKnm4RnDIFms1A9r2rTK5XkOuj4flJaKoN7fcMGsstN8PNwpF7NQaCfVbK8oyt0A5eNdaAm1mE1YqxxET/6WretssOcqVzE3so9x7X76cf0RCq6onaONm1ChRY2x8fZCTTNC3PIDaLBqXlyBeFlV4IHqa5v4Yddy1tJY0ceLjRIOrQzZnazkaVE1ePJ0RqpHeMe7bhdIq935xdqyqcuPXJXzCYyBlWong0WUTNqWNRr7I5ch4J2mzSIEhRAV8ewhihQaHF6xLu/JGOM3I/PlvO0qp3W4AtLVVyzf+ICDkHw6/6f/i+Q4M7aCsjcbWAoceQwYAk4lnuo0afCdXdXwWpDbuADeAUMbPyJta0EbXKSboYGtrNjpdEjdmPLbdyEvXccsq6zcmUZbBF2qesJ17js4xgJBHQFGXHMMZ/eV4YjBpAh5yF4VJeNHBm6WPGdnzxDobBx14u/iebicenoeeYXfft0ZqcsXsdKLhkHVXsn04vZyvZtbrWhs+o8z7DpDVBlhjBs9SXPxr+74576B0xm6RIRNr0vusVxpi4mCABbvhpweHn9OmLePhCqp0uyWvoeWc0XGrXgLoRhNltM98SO8OtIRXL2COo/Z+1M5tyaPACFI/ajpd3eYXuoMeFsvbJ52o0IUWGlpHayrsO/0iNjSbdTUUbj9pp0QLf+y9nrm++ln3GQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(30052699003)(82310400026)(1800799024)(13003099007)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m2G2ckMcBM5wPhdrpiZn6Yk2yzyvFMygqgIUayM4793op5yDCj7+5Q27D3sb17lYvrKK/VMPB2BFunmhZGTjAacEGSJamRF/CXhr+W4p7WzuG8g3GP3NkAY9QgcAvG2Pu+dBePCehEoDmZyniPoZoYtPDgZUharMqGrQYaK2vACErWbDgBWLHyYGUkMPyUxFEYxIrnV//nIc8HQCR01lkdPGwPxfYwaS1MKgMRJzl0EqPatlnOwNp/Lh5rDpaDUxbJipypzDmZgG3uCx4mrWlC2lRiX/R4pt0RUk2FdzYrX2f11Ar6MLLZUO7m9U6Z0II2IWDFIGZFSl2XSwIn2Qr2+o8l0Sw2hQgKa2mxKh/0GCHB499zb1HPqFqCCapwCms8WocQnkZRb2XiyNewuTVJPxUInZrcisJLvRjPB7Ah8j1UK+aB5Td2wDDlbfWx8F
X-Exchange-RoutingPolicyChecked: fi3pclL1AWuK5pvF/08cIer5jGAc8GmZJUsgF4bcFvK/LhJF13Y62Tn7lCEhJyuQKiiVyiKjhAaR6s3gPz5Qxn/83ggheZiQo+1qAw8GviNwLh6zvghGRDgp3WdyOnWCjngrKIIVXqY8CC7a393gjU9pKgv6Mg/aNCm5iovSS/IFV4nlgfC6jrAjacmrOj8BV3txEc7fVaOB2OoAm6X/529B79l79OX0Y2ADWTPuTEUkML2Xtw7L5LyVapjmp7Zlt34tmmZfprD7gPt2GPvTCqZZOEQRpG96HFEwiU87YL7j9457Ut1UBCgz72P/09xsMKQuuJ572lpAXFmOHDpPAQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 16:01:42.2207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f27e72c-262f-41e5-37d6-08def3d401e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4356
X-Proofpoint-ORIG-GUID: hR1XvP2aOM1Ifb6CH5D9H-yb2fxsuE3N
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a74afee cx=c_pps
 a=SAua1AGvvEPKktuR1BOyGQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=cVqFhCkfw84jE4i1NlQA:9
 a=QEXdDO2ut3YA:10 a=xIwhUkhlNzaB89QA7Q0A:9 a=FfaGCDsud1wA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyNCBTYWx0ZWRfX3u6QhPbJlZ1A
 tIcDtT4RlZkRQCWMbqOE9UB7a1ugR7uPNmmYXaSTB+3LKN79bnpcY32OUg+aKI89FZvjHVSaKKO
 XMhdbq8TDYNOlLz3dATwNbE4mvJvsBc=
X-Proofpoint-GUID: hR1XvP2aOM1Ifb6CH5D9H-yb2fxsuE3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyNCBTYWx0ZWRfX5wQw2It7sQHO
 QJIlO2OfDI1W30y+RBWk3UeCdYJS+QUToAuUDSDKRZ06DxeqLNttO6TCta1XkcEpeogqefwGL+e
 zSz2zJLRUblN2jGPYj5JFj2c/X3ZOyMPN1dor7uxvWRrQRJjaRtZE0AURgLWrID1BZa1IB5jDSp
 WsRwk+CPCyg8ik6RucMKM/yHCc89qACOCi5KuRkOW6f43WbHoeKCYG9nc/1cnRz+JZUr7ME/DYr
 MDn0G781ThPC6RJozM9L1qxtUXN+iaLTZm1srmeo/Tf6HCZ3FTkH9tiYulTmnmf+zpAINZ9CIE5
 PRw6o7faxzylJMCF71ejv4bki+rLGaxoNrzZ33f1wjuJRTUQFa3XSVgsAcjluF0NHGXeXqD4g20
 P4gsW2GoKtjIYjbN0MtV6UhJMOnNOOWh6L7/nq5aqyAMBhuWSnaeDjBljAiIf8LS1AKB2o4duNa
 P3TgFvSbr6m74naOIiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_090153_065399_10E2B86C 
X-CRM114-Status: UNSURE (   9.49  )
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

--------------Mf6XILKE7aDZrCSuytqj67eJ
Content-Type: multipart/mixed; boundary="------------w0BFCK0i9V8Vhenh0taPUl6Q";
 protected-headers="v1"; hp="clear"
Message-ID: <42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com>
Date: Thu, 6 Aug 2026 21:31:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, SoC list <soc@lists.linux.dev>
Subject: [GIT PULL 1/2] arm64: dts: ti: k3: DT updates for v7.3

--------------w0BFCK0i9V8Vhenh0taPUl6Q
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC Maintainers,

Below is the pull request for v7.3. There is one non-critical fix around
MDIO clock which missed my eyes as it was tagged to different  tree in
the $subject. Interface just runs slower w/o the fix, so no harm done.=20


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-dts-for-v7.3

for you to fetch changes up to c8c3575e3952c85cfd47f6b8080de6f4edc1462d:

  arm64: dts: ti: Correct white-space style (2026-08-06 21:12:39 +0530)

----------------------------------------------------------------
TI K3 device tree updates for v7.3

SoC Specific Changes:

AM64:
- Non critical clock ID update for ICSSG MDIO

Board Specific Changes:

AM62L BeagleBadge:
- New AM62L based BeagleBadge board

Variscite VAR-SOM-AM62(P):
- Add support for Variscite VAR-SOM-AM62 and Symphony carrier board
- var-som-am62p: Fix Ethernet PHY configuration and update audio codec
  configuration
- am62p5-var-som-symphony: Add touchscreen and TPM support

AM69 Aquila (Toradex):
- DSI adapters and Display addon board overlays
- OV5640 CSI camera overlays

AM62x (Toradex Verdin):
- DSI adapters and Display addon board overlays

AM62P-Verdin:
- Add Toradex OV5640 CSI camera overlay
- Add NAU8822 Bridge Tied Load audio support

AM642 TQMa64xxl:
- Misc non-urgent fixes

AM67A BeagleY-AI:
- Setup I2C for CSI/DSI connectors and add DSI0/CSI1 mux
- Add IMX219 CSI0/CSI1 camera overlays
- Add gpio line names

AM68 phyBOARD-Izar:
- Add pwm fan support

AM625-BeaglePlay:
- Add LincolnTech OLDI LCD-185 overlay

AM625-SK:
- Add Microtips OLDI SK-LCD1 overlay

AM62L:
- Add bootph-all property to usb0

AM62A7-SK:
- Add bootph-all property in cpsw_mac_syscon node

----------------------------------------------------------------
Alexander Feilke (2):
      arm64: dts: ti: k3-am642-tqma64xxl: add ospi0 vcc-supply
      arm64: dts: ti: k3-am642-tqma64xxl-mbax4xxl: add icssg1 ti,pa-stats=


Anshul Dalal (1):
      arm64: dts: ti: k3-am62l: Add bootph to usb0

Aradhya Bhatia (2):
      arm64: dts: ti: Add Microtips OLDI SK-LCD1 Overlay for AM625-SK
      arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-Beag=
lePlay

Chintan Vankar (1):
      arm64: dts: ti: k3-am62a7-sk: Add bootph-all property in cpsw_mac_s=
yscon node

David Lechner (TI) (1):
      arm64: dts: ti: k3-am67a-beagley-ai: Add gpio line names

Dominik Haller (1):
      arm64: dts: ti: k3-am68-phyboard-izar: Add pwm fan

Francesco Dolcini (1):
      arm64: dts: ti: k3-am62-verdin: Add RPi Touch Display 2 7-inch

Jai Luthra (4):
      arm64: dts: ti: k3-am67a-beagley-ai: Setup I2C for CSI/DSI connecto=
rs
      arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1 mux
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0=

      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI1=


Judith Mendez (2):
      dt-bindings: arm: ti: Add am62l3-beaglebadge
      arm64: dts: ti: Add k3-am62l3-beaglebadge

Krzysztof Kozlowski (1):
      arm64: dts: ti: Correct white-space style

Leonardo Costa (3):
      arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Displa=
y 10.1" LVDS V2
      arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter wit=
h the 10.1" V2 display
      arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display =
10.1" LVDS

Meghana Malladi (1):
      arm64: dts: ti: k3-am64: Fix MDIO clock reference for ICSSG0 node

Stefano Radaelli (7):
      dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
      arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
      arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Bo=
ard
      arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration
      arm64: dts: ti: var-som-am62p: update audio codec configuration
      arm64: dts: am62p5-var-som-symphony: add touchscreen support
      arm64: dts: am62p5-var-som-symphony: add TPM support

Vitor Soares (10):
      arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to HDMI Adapter
      arm64: dts: ti: k3-am69-aquila: Add DSI to LVDS adapter with 10.1" =
display
      arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Displa=
y 10.1" DSI with adapter
      arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Displa=
y 7" DSI with adapter
      arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Displa=
y 10.1" DSI
      arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Displa=
y 7" DSI
      arm64: dts: ti: k3-am69-aquila: Add Toradex OV5640 CSI cameras
      arm64: dts: ti: k3-am62p-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: ti: k3-am62p-verdin: Add Toradex OV5640 CSI Cameras
      arm64: dts: ti: k3-am62x-verdin: Share UART_4 MCU reservation overl=
ay

 Documentation/devicetree/bindings/arm/ti/k3.yaml              |   7 +
 arch/arm64/boot/dts/ti/Makefile                               | 108 +-
 .../dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso  | 162 +++
 .../boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtso     | 121 ++
 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts          | 555 ++++=
++++
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi                  | 483 ++++=
+++
 ...5-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso | 109 ++
 ...k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 143 ++
 .../ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso    | 129 ++
 arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso | 101 ++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts                       |   4 +
 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts              | 657 ++++=
++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts                      |   1 +
 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts         |  43 +
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi                 |  35 +-
 arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso  |  14 +
 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso     |  17 +
 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi           |  72 +
 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso           |  18 +
 ...5-verdin-uart4-mcu.dtso =3D> k3-am62x-verdin-uart4-mcu.dtso} |   2 +-=

 arch/arm64/boot/dts/ti/k3-am64-main.dtsi                      |   2 +-
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts        |   1 +
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi                |   1 +
 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts      |   2 +-
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso   | 118 ++
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso   | 118 ++
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts                |  68 +
 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-pwm-fan.dtso     |  74 ++
 .../ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso | 155 +++
 .../ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso  | 155 +++
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts              |   2 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso  |  18 +
 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi        |  76 ++
 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso        |  19 +
 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso  |  18 +
 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi        |  76 ++
 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso        |  19 +
 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso        | 115 ++
 .../ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso | 142 ++
 .../dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso     | 158 +++
 .../boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso | 158 +++
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                        |   2 +-
 42 files changed, 4266 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntec=
h-lcd185-panel.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie=
-panel.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-=
panel-cap-touch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-v2=
-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touc=
h-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-=
7in.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-b=
tl.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.=
dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-uart4-mcu.dtso =3D> k3-am=
62x-verdin-uart4-mcu.dtso} (69%)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx21=
9.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx21=
9.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-pwm-fan.=
dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-c=
ap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-c=
ap-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24m=
hz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dts=
i
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dts=
o
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24m=
hz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dts=
i
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dts=
o
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dts=
o
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-pan=
el-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch=
-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch=
-7inch-dsi.dtso

--------------w0BFCK0i9V8Vhenh0taPUl6Q--

--------------Mf6XILKE7aDZrCSuytqj67eJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRQBrqaOmQ441h4YbUDQj8NV+8d1wUCanSv3gUDAAAAAAAKCRADQj8NV+8d14Up
AQCOHQGwMmc37lqh75B6ZYf3OkfbcHTAyPWQ9ZCfeVuK1gD/c0OVM0ULTLCFN4z8s5Yd+oNIGb/I
1pEoxxTvYHJKnAA=
=x6dA
-----END PGP SIGNATURE-----

--------------Mf6XILKE7aDZrCSuytqj67eJ--

