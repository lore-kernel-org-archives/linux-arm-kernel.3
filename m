Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ADEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3aRxbsmAMhhtHfnyYCSWaedMhAaZQHSeUHcyuadpOE=; b=2gcvKz5kjOSEayAvMPC49MMGHv
	SJmg2y6iKHkCUwlMPt8eO5YzL7ovUrQ9S9BQYhLEBrXGp83epFvvu91JK/ILXuF0/C1B7MIZkAngD
	STJKys27i/LN+t2pS3KTOJL/qMhs97ngebD32U69E41Y43n9rTXuoJXfBk4t9+xIy1VhMHJ18Alat
	74kXsTZpGp77PPSQ0tNNcAnk9rsS9xIPP66mDT0HOqBtLmgiHfHCc874w669afdiFRZIfjR7JfWgI
	6THDIjHNHpr8bLRSSiqraDzEmFxfRuExqzqowh5YCCn35b5l+n3n0id9FSjSGzbvwe0tRxqrh1Utd
	TVx9ErXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDa1-00000008pgG-2ND7;
	Mon, 13 Jul 2026 10:08:05 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDZy-00000008pfg-1dnF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 10:08:03 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66D6PY1F1486469;
	Mon, 13 Jul 2026 05:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Z3aRxbsmAMhhtHfnyYCSWaedMhAaZQHSeUHcyuadp
	OE=; b=TfltmVNz6gz6S4OqbPsXgcQR6t0K3Q1ePDM1CafafkCwq4tXDSzhiLlro
	Ar2hRqsMfctkXUd6F6kc+tphjSohBz8SZltMUencLzJygq04x8YsiGC8dkI+5tNa
	+CAtGhkOD2Kl7z9FCkNtvYfU0QqBapxZtb4Mhl2JQF7lOmE97yfa2WcM9kc2VQfs
	H46oohaVFAcr9ktKtdem5+HXYiotefdm2rQXyvgOU1Gev4wC97/2d36h+uIfQu24
	XO386VidDVPkjEcvw+g5vFaF6Ag2+V2xR1CupRmpAzeUzOz+oScT14L8SDvD0WXg
	d47M7Zn4CPrBrB20/OVzUDhqcCxlg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012050.outbound.protection.outlook.com [40.107.200.50])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fc7snd0ec-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 05:07:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgDeGe67aLshPzzcETEO11uSSmDYpf+Eddvr8sPxaTta+4b4zOOLElNwl7vlYFV8i/0vuO0HwNNfbYlgTrNjvy8M+NidLATpuTYKZc+Clt9Tn1EG1n16bTGePvuINt6yI4Uy221Sg4i5Uotc+cvGAdMzGowuHY7dWL80KckTzmNZ9x3+YBq3JvF02di5HKLw9PgSQkSDv7c+dDHIQkKhdn+lZOopUEoE/IWFoPLJTbt8aBk6X25GaRpDRe/rxKdNPMG7JsLVuNU2LVkcBV2kfi48G+KRJBBIotOXBRcJhftqi6Uj8n+k4rRiSLCaQqDygAHqDDDBoTB45Or6LVOADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3aRxbsmAMhhtHfnyYCSWaedMhAaZQHSeUHcyuadpOE=;
 b=G3DL8uBVOt/DiCEtn/Nx0Avm2O9QrI7QIiXkh9GL/4GgIOHd1rhr3fzca5+B1klxwdrv6irfWYw60cARF0h2QCV6DCtTQaxvtd0O2oIESSl8ZhhjXJdDxBwHlDidE/Go4UfwdVJayzuF88DQ9J7qJs7ULSkGR4FPcYEjD1CfgB/EYkvJ9X9gEkoYx6Q9rbXzjS9OjyYsw36uiD0GgXRzDmvAL3Ln40D8w9bZ4JeEWttJdr/8kTFORABOZ92AY2FW2Ku3oE7xLtuoPXjeRoewVvOC/no8dIfpNReo+6eGkJuiiV36/A7ioe3a8+fYvGgZ2V7tmXKMr849OkZufAPLcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3aRxbsmAMhhtHfnyYCSWaedMhAaZQHSeUHcyuadpOE=;
 b=GfF3hFWlP3EG/Ln8OuA3UGh4kybGqFdYOn0AGTRWj7RF4OrDWn69YzIm7h8clBdS2st3lW+Ga5NigQKd7sogUWA2ircriPq4fZ387jttvIiK061AZPelU8SLuaoWodQb67KMNF09LLgXJj2G3kTY6KWeXuYMQ1rMRcM07I6wAT4=
Received: from MW4PR03CA0119.namprd03.prod.outlook.com (2603:10b6:303:b7::34)
 by IA3PR10MB8760.namprd10.prod.outlook.com (2603:10b6:208:581::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 10:07:56 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:303:b7:cafe::2c) by MW4PR03CA0119.outlook.office365.com
 (2603:10b6:303:b7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 10:07:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 10:07:56 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 05:07:54 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 05:07:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 05:07:54 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DA7oKA1895607;
	Mon, 13 Jul 2026 05:07:50 -0500
Message-ID: <8355d900-8938-45bd-89ca-8511507ae0d9@ti.com>
Date: Mon, 13 Jul 2026 15:37:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: ti: Update audio-refclk binding and
 j721e system controller
To: Moteen Shah <m-shah@ti.com>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <sen@ti.com>
References: <20260619062749.1575066-1-m-shah@ti.com>
 <20260619062749.1575066-2-m-shah@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260619062749.1575066-2-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|IA3PR10MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: d44a3d1a-f075-4f19-55f8-08dee0c69c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|3023799007|6133799003|18002099003|22082099003|56012099006|4143699003|5023799004|13003099007;
X-Microsoft-Antispam-Message-Info: VJ5SyByl7FIn6CLXNmiVk/GYsClmI80uzym5DennZsbQYvxew6JGm+jRyOVVJdI6yvm+YYyOPbjmiszZNsuwYAyynZm2lSg56Vych88RkesBqSv0umwmz7zfG0nThtl+U8W3/ypU3t5c6C+F5Jed98GmIqEAOoS8fmlx1Nd2zLrs/ITtPOtG3rxvJQhTKWlfllKAz0dBVmUNmc24rEuy8kPrn1LsB8W+H/KHEuB2urMNFKIbnBXcx9Z/D8mS5C5i+kQ9a+u8SQOrLXMXBksiES/ElBpYvmeqvXjqRVpeJl39DYjhV12UlDWJVPtgryWQl+frFeoUPcufhg5g3tXDUgPYw6B1kmhqOF5WAEFsdHFmIyMDYH3OSUZa7AdqKJWxhu07BZh74XMh0bNAbtsL+7F0az6R6rJSxyYRs46LuAt+R+S3sLftDJohnpYK0nZ0jg0GS8yQ4NSrJw3Ti3TUKZwGBwI//+ZYH+vEjxFSL+MutiKu1azJQ1GUFDFtuZDEskC+saNAkjaDBiJcnoNDQlKTVFl1kBVyYZndd+Un7ZVvnn6AxHrzwgQ3gxx4RyAf1BfqEZLK9rhHv9a/v0zIwG2DWnKLTlFI1TMab9Ys8x9kT/PVcZ536MUN2y/xk8oAWtorg3zfhXo1OOCVr8Qtnh5jeT/ZKEv10u5T7mYX7mSGWCj+cX7YBHet5BQnWsACELYzFAylQBIXD3zAh5bfjw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(5023799004)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F5ebkp2neNG9DsLug/fvgl1t5McwkKxxnnPRk9BXCQm5EyhzSMwuqfOG7Oyj8MMCoYm+5XBuJXMpaOriA0qxNXWvuA5PL89SGvjjSifrCNImpWwzenuxvajZ6kzJDIroFoVhIOAVbIsnGCyUVtydLG1qXAiuTwwLZLJ/7Sq7U8NbmFioWCXdjo7Frvi2CWaRGdUYY20U7i1O8+T+th1jCJ7cHmbR5nL9cvTr/xv9Kj/sm1HjrQZ9bHLyQa+AjAzRMtJ/wxDMipyVvEol2Djtu1RTr3KXLzBfU0R72zfuzZt3e0/7p65EKMmhLjY7ctbhYxpbTRreZI+o00JZ0cIwpOuLieqSRexW98jxuliCSPnwfagM/BRgI5jA7krgysMDSc57zp1xAPE/hkXCv+n+gqjV8lewCxIrCj6yh40AHe42M6w+E3fXJ8PPw0k7ngWy
X-Exchange-RoutingPolicyChecked: eQrPOJZ/5fefg1zI9ybMb8UcYuI7M/4tY3uCvq6EoQ1m/r2upwhtJCRBlw9gfXLZD+EHms/brekWlteVIRi+hzDIB28lEEodBgkK9E9eO8JUu36lCc4fc0omKlsZXspBLvQOu/mKyNoHwCHV4t0ixfUgQZnwJQnKvJSeC03G0K2OBusz6IXGroMTznrljWKRUIk4nqDcP3FvT1FyoZnalgQ6UG5KEXbiMhsDRnYtIXKGCC02flBuA3gU25mXcpKjcCl/EM1Stuq0mdm5eSy4J4oMZbv77aMgmOcgPVBLOQApIaZPtYTTLnYTnxGxdK8Ztb3+TgU/lyZR0HaI82CtUw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 10:07:56.4682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d44a3d1a-f075-4f19-55f8-08dee0c69c70
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8760
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwNSBTYWx0ZWRfX4osc7s/z3Ohj
 7BieDAKcny2WUu41J5GRzsj2VEAVAiZ61C8C3uRiXYZH4MEliGdObjQz4bpDskrPYqP/7GGPsJ1
 DWFlm95uzUzATXXgPSMbfuByDXW7Dhaz1kVms61FboEtaiK0TFbZsmVA6xc1cczcJb/LCCbLum6
 FbomM6p4W++MQHl1VTspy8eiDgPGAo5sBZh9zGqy3wVNut8LprMT/qx3Rx7cfGJggWYnVGqzaMH
 2xc4lmbLvbpEvsOZ7EpntcQu6H7x6dsk2wFh0AvYRov8i42r5gV7B47JzutbXJdHd6+9WoUNlfP
 0VHV6XHNahFY0v0ZpZj0DJoJeWujxX0IsT8GGQgC2XVA9E1JQS9tqOfPe+HfssBrXtXfCpDiy8E
 UPmSE4hDSFDmH5qunyBYr20vRbn6hx0g3MwvisqIXWJ82g7gU9My5Bt/FozX6RoUDb7qXKe5Cb9
 k+8eaVNsR5fVqPmZPNw==
X-Authority-Analysis: v=2.4 cv=G+ks1dk5 c=1 sm=1 tr=0 ts=6a54b8ff cx=c_pps
 a=ZVLNonFp53krOPJecICuKg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=20KFwNOVAAAA:8 a=yPVGkpx-bGFPD1hCy28A:9
 a=QEXdDO2ut3YA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: C9XRKkCILVlyQ4jrL87WO2Er65SdyPjP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwNSBTYWx0ZWRfX7e1gPvi3dm0x
 NTiWGJxoEoq+7rYGjYnuragtg6Ff6+YGyzNms7QxhW3qF0VCy86JBM2yFCBGbtQcy2qcSfk1E8A
 dsNygeFU/TBsAM07io9rU269d5cj9d0=
X-Proofpoint-GUID: C9XRKkCILVlyQ4jrL87WO2Er65SdyPjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_030802_513351_ED5E18F5 
X-CRM114-Status: GOOD (  11.65  )
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

Moteen,

On 19/06/26 11:57, Moteen Shah wrote:
> Add ti,j721s2-audio-refclk as a supported compatible string in the
> ti,am62-audio-refclk binding. J721S2 uses the same audio reference
> clock IP block first introduced on AM62. Per writing-bindings
> guidelines, the J721S2-specific compatible is added as the primary
> string with ti,am62-audio-refclk as the fallback.
> 
> Also extend the ti,j721e-system-controller clock-controller@ child
> pattern to accept audio-refclk schemas alongside ehrpwm-tbclk via a
> oneOf constraint, fixing the alphanumerical ordering of $refs.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  .../devicetree/bindings/clock/ti,am62-audio-refclk.yaml   | 8 ++++++--
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml       | 6 ++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml


You don't have any CCF maintainers in To/CC. This patch will go nowhere.

./scripts/get_maintainer.pl -f Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml 
Michael Turquette <mturquette@baylibre.com> (maintainer:COMMON CLK FRAMEWORK)
Stephen Boyd <sboyd@kernel.org> (maintainer:COMMON CLK FRAMEWORK)
Brian Masney <bmasney@redhat.com> (reviewer:COMMON CLK FRAMEWORK)
linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)

[...]

-- 
Regards
Vignesh
https://ti.com/opensource


