Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA95FCD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 06:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0DuAy2mFUbOJaO+3inxvlB/DWrvEH4Q679Z+LZsKhg=; b=v959wfvdSUVwcTS3xIoxQyztQS
	ixA8lKkdmkKNCefjbauexH8kjADZyEMLNXhq/Jc855OF/oCusOxzHaMlVlIvvMuFAQWg5/N4KMrgF
	6EqIjAfYaOHHnJ3HR6iciBvpIDUIu6LtvZawxmJOUoRVmOrzSDsEZawsMCZuWv7TxfQZyV3ThuA7O
	FLKBlA3KuKux5lCBilhNQbIA7dcnJvJeVyDwWhjsWsuy0Egat6v3k7ziNh2eNqnA97DI7+Aisz1QL
	L3SerImLEHz1CXKvpuuWMhg8xNhXnimgYSL1L+5u53cEwC/MpOgjwK72E5uTTxasjoqTuApKimjE9
	giyO19MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waSiE-000000022x6-3Kai;
	Fri, 19 Jun 2026 06:28:22 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waSi9-000000022vD-3KQk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 06:28:19 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65J2u8J02133841;
	Fri, 19 Jun 2026 01:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=i0DuAy2mFUbOJaO+3inxvlB/DWrvEH4Q679Z+LZsK
	hg=; b=ORFpgLccOCwxxkJOTpzF7LdU9ftKvkFSdmpZbyVuPWESUO2o7LSJU8T2i
	kSBbmjj2WlPAfRJ6snTAMdv2B2nWq1EbeNGOOCCXdKU8Dm4HiWmTowFg9aRM9NNk
	w6HhoBLioheU/MtJd/Cu5l8WSL/E3kiQQlKv7isEHLrl1n8fvHfYZXcIz86jjKKt
	ydgUcBoWHrHsdNZkDkRy8CzuT8x1o4pVUVc2ZqYF01GLeUc1gzq4CWGFR/2JsiOL
	2+qzQ6EDK0IXgWSRunDgIG9mDOQezXmNrYy0Spkl5ql0nvFLvBwuzMkIJHRIAENr
	FIHdYwkgWR6dEUM5x7HqiQ5BN8QRg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011039.outbound.protection.outlook.com [52.101.57.39])
	by m0380145.ppops.net (PPS) with ESMTPS id 4evfm6x7ss-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 01:28:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TALzr27WtyY/lq5GFclVcP5L9oOu1Rd6HVfyzp2udOwZN23jq4yo16ejRQdHX95h/boGTxU0DeTpXMecFtSR5q6TOv3IOjDBjSWUcgGUz2X5Yq/rwAR3HEzHt77oswFyOwB02tF3ZoHAhur6edbDRq4v0yk4E5ChtOL1GElXyV/mdjzQKdTqNgl+6eakUEyYk0q+VmkgKNLLSqyQ53+v86mZSwR48TRF6WGXDyL4zvyIzqFcAmrbvoTRlOP72TCqOranYeFnem5Ghr+VLfNXOZLjvDCA13JnsvoSrSGQDzHllDDsP/MMPDQvDT/nPC1uFdmfhyeu5Ak/SH1Nn/2GJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0DuAy2mFUbOJaO+3inxvlB/DWrvEH4Q679Z+LZsKhg=;
 b=vRlqvfy7e/+IBmjlTQzBu3/KIl5EPiN2X132owPmXqQB+0FY95g3NIWz8trh5LlY1TqweMQexbXVc2Hzq9HS2/BUF8M9sUK0udvXG7P9dyPM1OKKjRdop8yCXSotktDWUcqSdg4gkzUaqbjqiUttOayELfIfUVuTELNHvVxUxUA10hH6idpyoh8u8eRsF48ElOJRXTJgnekDn+fHPHx8s8bS2hTVbBqw4mafMlWZwfl2vCkWilEfWyZHGI/bSP7UgPKPc0mGiivmszSMB+xdAva2WUL82oJGJlmoFPmP925hWCUTkTVQcmHMmFARruqSwMD4/wrYtuiZPhpZGNiqKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0DuAy2mFUbOJaO+3inxvlB/DWrvEH4Q679Z+LZsKhg=;
 b=C0dkk16fqDYmxzAqEaIqHam3ckTltHYyUXE9vGWVZ7QFxYMjFRG9MtghrH48NvBCkpsf8dT0+aUg6MYKxPdW/Rej2byF5If81wBuZDlEfOVP1m5XWJZP6c6FNCwqTA9JKAKAWk7x+lLa2EEmqzyVrA4tYBvlKw0NtnpHoQpcJEA=
Received: from DS7PR03CA0199.namprd03.prod.outlook.com (2603:10b6:5:3b6::24)
 by PH7PR10MB6082.namprd10.prod.outlook.com (2603:10b6:510:1fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 06:28:04 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::50) by DS7PR03CA0199.outlook.office365.com
 (2603:10b6:5:3b6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Fri,
 19 Jun 2026 06:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Fri, 19 Jun 2026 06:28:03 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 19 Jun
 2026 01:28:02 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 19 Jun
 2026 01:28:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 19 Jun 2026 01:28:02 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65J6RnDH2097702;
	Fri, 19 Jun 2026 01:27:58 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>
Subject: [PATCH v6 2/2] arm64: dts: ti: Add audio overlay for k3-j721s2-evm
Date: Fri, 19 Jun 2026 11:57:49 +0530
Message-ID: <20260619062749.1575066-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619062749.1575066-1-m-shah@ti.com>
References: <20260619062749.1575066-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|PH7PR10MB6082:EE_
X-MS-Office365-Filtering-Correlation-Id: d488c413-3b5b-41d3-d63f-08decdcbeaf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|13003099007|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: jr7USyEOLg4JPjbHvcj0+xDraTGX8UJYmGrHtMi2VCJQg79R4Aowwc6X5ucDfeaOvbmrVC139RXieCrvWxNzO14wZrcvMTkQza+RuvahbYAwgebPOxELxBvnL6v6Ym56tsGC6nazgCMckwkWTazYt00mFxMK4cXRfKD1W5WYe1JftVZG/npL52vuKFd0ocXpnlqhO/DFHPKgogfc/VHxgfgSC4MAR8zUkvEBJcbP50KJfu27EG4ewXVQ1DJmIO1Imyrvr7U4twM5IvqpXAQyMDGgUXFe6XIgS9f9Wvj7Ld57gVZABOxDcjmbADDtefj3oyylwPQ3yAam6tKGVkdN+br3pbsUtFCF0ymQPIYmnTTNIt7qaCRBfySqUkbB6giUlAU4Tsq/eSpgt1WwWrQtvSYFLY7qK3Iie8JaWe7G0J/wbSk/QY+YrMicM209gpSzUfWWdBuP7XQqA3tTcaq9LMRH/MUZhtEPbmkY9/oGAXegzehdFLX40w8x/CT3eOpeuvA/rkVWsfUh3t6Dh7PIph/M530ZzUuAw2UGXW3t8qmaOHFFpdKPSH81lcAwktE4j5CJopoSmQ3vr/bGOVu6h7e7/Z67jsgo/G+/zrrnUu1VzoroO3BTvexMqVjlj3cI6zfSE4PM+9XW+cYv/RvEuA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(13003099007)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pCLlW8/DMotXjnyDvxBBOw3qra7sniAiy13BUDrqHH/kV/de6oXjXxrZ0HUMubUOUWjHLlvDbvce+4T3HqN2B0AZu3NPh1DvvuZR91HzwFeUVNxUrgZMJqoPs8UIC0UW1kxU1lVGO2eoAxxm0mWhuvcl0Jx3BJaDpq5IRyb7Pgre27JwdE7qwcXTq4EIiwM6CCKE5vwZBvV2ixxsmGShmu5EKucb0l1Sx5eSgwiUiUcYeSHjsCT9hx2tU70G5esMKcGjzObAd5UDoZTMGzD+ziaECsI514bBKeHMNkjbol5/hUn3sBnXa0mnO6CHvxThcYRBcfvzEZevF2l6o3/YceTkKGT/wS9XnGOQt8xhGGHecyrfbE2Jf/Y3jgJeFyxpyhWAaRncjXjMvnlTkZfbl2Zp48ZT0814OYWYbBMI8KuAHMZ0qKSXOnP7rs8Qbl6K
X-Exchange-RoutingPolicyChecked: flCsKu1dy7rNGCPS96DbiANjjeskoDWN3vVwCFfDR7uAjo4/baezOuMNLAS6hCDi9wy6On8NaM7FzxfVKoTHu1oy6/elM8vVVn5O7LHcusgfj9Tt0GmiJz1t2rdx4xNpghPZPhCosLZBLnUzY6OYwuN/pqP4m58Xm5/CUZp28w1QCdslpGz1q1h3sDgEmFthQWi0v9vitrnvaDPyACCoF5CdSg5KVX0602kDzx7hWVw+a1YVJUOaiwrKP8tU9w/DRvo3aI0DhhT5ZbaoN+wNoJ60b2FtVZf6ntq8pHKQebLXVdUZ3H1qETwTuXddzFWEx0y7ywUqsXcrs/cLnfwLsw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 06:28:03.6405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d488c413-3b5b-41d3-d63f-08decdcbeaf7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6082
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA1NyBTYWx0ZWRfX1EUQlju1pogw
 +7WCUUDzT0ZiZOw/4gcaocl6Pq1tDYhHiltEZ4bDiZxrCD8UGpxa5Ntr5IqGgw55mdwpPqYI8cW
 Rf4Eg9y03a8plr/aNwy3NbpZvA10fUQ=
X-Proofpoint-GUID: bo5LNUoL1hQsS7ZOGI_yJp3LMEN5_sSt
X-Proofpoint-ORIG-GUID: bo5LNUoL1hQsS7ZOGI_yJp3LMEN5_sSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA1NyBTYWx0ZWRfX+svA2AbcALwQ
 dHDTvUi5aR54mxRNwrLGc0vl+LMnfHwoCjv+ov9CybT6O+zjNEQv6jyTog7Dmt8S6bksZhyQJe9
 yzCFTWqUb+sHB4A2zUEX48pNubeNFt6xS5SthO36koGqOAfkIgu8BG7gjQ9WHjaWglu2UhYlLOd
 q+iK2+4zWO/X9/wUY0hheXsjxceuCE+WqkZGVC61D/TQwMVibggt5G2Ok4vTZe+etBB2Vlzh4np
 TbPlRJf4KZiidKztJIE71v3FW/VeociSsXSPNSsaRYHjAp860Yb15Ix5T6hT+fXWJ5aRpugDIyJ
 aBO/Vx/aEvvsR+0m154ucJc9ELo5fSdB5GbzpEAa1tTlCU9wcpGChQbMaNk4tkc6uqUqGVtisEI
 7XRJHpeGKd273Jt6I0UU5iDa6RTgD2J4SUoyDl5/1l4mLP0OL9nSJFdll6f6M4UB71dAnHz2RgJ
 zk+SqXlrTz3XnFMrn2Q==
X-Authority-Analysis: v=2.4 cv=YqY/gYYX c=1 sm=1 tr=0 ts=6a34e17b cx=c_pps
 a=I1DPz4bLegk/AyvijR/I8w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=oFhqMRED-i6X9MmFsNUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 impostorscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_232817_841607_BD9F72BE 
X-CRM114-Status: GOOD (  16.48  )
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Add device tree overlay to enable analog audio support on J721S2-EVM
using PCM3168A codec connected to McASP4 serializers.

- Add audio_refclk1 clock node to k3-j721s2-main.dtsi
- Add nodes for sound-card, audio codec, I2C3 and McASP4
- Add pinmux for I2C3, McASP4, AUDIO_EXT_REFCLK1 and WKUP_GPIO_0
- Add GPIO expander (TCA6408) for codec control
- Add GPIO hogs to route I2C3 lines and McASP serializers
- Set idle-state to 0 in mux0 and mux1 for McASP signal routing

Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Co-developed-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 157 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |   9 +
 3 files changed, 170 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe52..d9824e17085f4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -180,6 +180,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-audio.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
@@ -320,6 +321,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721s2-evm-audio-dtbs := k3-j721s2-common-proc-board.dtb \
+	k3-j721s2-evm-audio.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -396,6 +399,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721s2-evm-audio.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
new file mode 100644
index 0000000000000..ac5a827e1b750
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree Overlay for J721S2 Audio Support
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "k3-pinctrl.h"
+
+&{/} {
+	codec_audio: sound {
+		compatible = "ti,j7200-cpb-audio";
+		model = "j721s2-cpb";
+
+		ti,cpb-mcasp = <&mcasp4>;
+		ti,cpb-codec = <&pcm3168a_1>;
+
+		clocks = <&k3_clks 213 0>, <&k3_clks 213 1>,
+			 <&k3_clks 157 299>, <&k3_clks 157 328>;
+		clock-names = "cpb-mcasp-auxclk", "cpb-mcasp-auxclk-48000",
+			      "cpb-codec-scki", "cpb-codec-scki-48000";
+	};
+
+	i2c_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&wkup_gpio0 54 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_i2c3_mux_pins_default>;
+	};
+};
+
+&main_pmx0 {
+	mcasp4_pins_default: mcasp4-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0c8, PIN_OUTPUT_PULLDOWN, 1) /* (AD28) MCASP4_ACLKX */
+			J721S2_IOPAD(0x06c, PIN_OUTPUT_PULLDOWN, 1) /* (V26) MCASP4_AFSX */
+			J721S2_IOPAD(0x068, PIN_INPUT_PULLDOWN, 1) /* (U28) MCASP4_AXR1 */
+			J721S2_IOPAD(0x0c4, PIN_OUTPUT_PULLDOWN, 1) /* (AB26) MCASP4_AXR2 */
+			J721S2_IOPAD(0x070, PIN_OUTPUT_PULLDOWN, 1) /* (R27) MCASP4_AXR3 */
+		>;
+	};
+
+	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x078, PIN_OUTPUT, 1) /* (Y25) MCAN2_RX.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+};
+
+&wkup_pmx2 {
+	main_i2c3_mux_pins_default: main-i2c3-mux-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x038, PIN_OUTPUT, 7) /* (B27) WKUP_GPIO0_54 */
+		>;
+	};
+};
+
+&exp2 {
+	p09-hog {
+		/* P09 - MCASP/TRACE_MUX_S0 */
+		gpio-hog;
+		gpios = <9 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "MCASP/TRACE_MUX_S0";
+	};
+
+	p10-hog {
+		/* P10 - MCASP/TRACE_MUX_S1 */
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "MCASP/TRACE_MUX_S1";
+	};
+};
+
+&mux0 {
+	idle-state = <0>;
+};
+
+&mux1 {
+	idle-state = <0>;
+};
+
+&main_mcan3 {
+	/* Conflicts with McASP4 signal routing via mux0 */
+	status = "disabled";
+};
+
+&main_mcan5 {
+	/* Conflicts with McASP4 signal routing via mux1 */
+	status = "disabled";
+};
+
+&k3_clks {
+	/* Configure AUDIO_EXT_REFCLK1 pin as output */
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
+};
+
+&main_i2c3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c3_pins_default>;
+	clock-frequency = <400000>;
+	mux-states = <&i2c_mux 1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	exp3: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "CODEC_RSTZ", "CODEC_SPARE1",
+				  "UB926_RESETN", "UB926_LOCK",
+				  "UB926_PWR_SW_CNTRL", "UB926_TUNER_RESET",
+				  "UB926_GPIO_SPARE";
+	};
+
+	pcm3168a_1: audio-codec@44 {
+		compatible = "ti,pcm3168a";
+		reg = <0x44>;
+		#sound-dai-cells = <1>;
+		reset-gpios = <&exp3 0 GPIO_ACTIVE_LOW>;
+		clocks = <&audio_refclk1>;
+		clock-names = "scki";
+		VDD1-supply = <&vsys_3v3>;
+		VDD2-supply = <&vsys_3v3>;
+		VCCAD1-supply = <&vsys_5v0>;
+		VCCAD2-supply = <&vsys_5v0>;
+		VCCDA1-supply = <&vsys_5v0>;
+		VCCDA2-supply = <&vsys_5v0>;
+	};
+};
+
+&mcasp4 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp4_pins_default>;
+	op-mode = <0>;          /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	auxclk-fs-ratio = <256>;
+	serial-dir = <	/* 0: INACTIVE, 1: TX, 2: RX */
+		0 2 1 1
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 1228ac5711bf0..36a01a06dd254 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -74,6 +74,15 @@ ehrpwm_tbclk: clock-controller@140 {
 			reg = <0x140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		audio_refclk1: clock-controller@42e4 {
+			compatible = "ti,j721s2-audio-refclk", "ti,am62-audio-refclk";
+			reg = <0x42e4 0x4>;
+			clocks = <&k3_clks 157 299>;
+			assigned-clocks = <&k3_clks 157 299>;
+			assigned-clock-parents = <&k3_clks 157 328>;
+			#clock-cells = <0>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
-- 
2.34.1


