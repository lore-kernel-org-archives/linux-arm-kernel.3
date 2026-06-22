Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BC7CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 03:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iyt1fMGGvvxFcPuX8UVo3DOAj8DfDoSTSzxy77g+l3o=; b=Unt1Ok+J7CaSp/gVaFRswqdnQZ
	appgDCGNm9Ij5JcBVmlQ/BEYaYmMD4fHKjp+jx/Q9Bd/zblA11hq7UvS74txOm9PgELaFkffQ6F7M
	mVyQI6be95G1QhCkyeNQ2NUTx4SPp0JkI9obfuqmnkcTxpTfA87Nlsddp+f5rquBAUM5v2PraxaAz
	jCXnjr9kYkV8i3VN42FxK+ifMlD+xoDLBKX6orz+LCaH1znFZxK12gauIwgzyhYtgPfcj4uW5ZqGL
	1MSpUwc3bgk+OQMMF7F2E1L3fw6qTrg6zpYSnrZWz6urrNHH3/lfeuskykL+9yl6iRufkPo/weX6b
	RfEp5RRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbVhv-00000004MBj-39z1;
	Mon, 22 Jun 2026 03:52:23 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbVht-00000004MB8-0knJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 03:52:22 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65M311Un3080541;
	Sun, 21 Jun 2026 22:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Iyt1fMGGvvxFcPuX8UVo3DOAj8DfDoSTSzxy77g+l
	3o=; b=QUZ6+hqikLxryOx7WPgCf3jlGJvuXjeurKLzTIVsnDBcsEyyYJRRigGJ9
	bT0CR3fGyb6+xpJ5tY+JlxN/6c8TGNJ0JJORltFNVu9P31sIzgvvZKH0oMUJ96ej
	fVU8K3yi6B8hjLAc0zwivZEi8e1aZOHeB3TlVxIY+JJJf3Q7oC6oQG00s6eUOqIP
	C5E8ncwbhtf6KexeKspIdPbknFClP82VR4aAw333piGzkdCbMPE8p9vUr593TXFQ
	kvr0+1+mDyhsE84jd+Z23aT3NuUG5Pmqzfd6H0Zx5Pm+4XKfeLhkI3vucXosMFlW
	cdxmc4k/ZLL3Rhmi7m9f5XxR4dKtQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013064.outbound.protection.outlook.com [40.93.196.64])
	by m0384305.ppops.net (PPS) with ESMTPS id 4exctn3c5w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 21 Jun 2026 22:52:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+RtpIgmmi81e9IUM9gMFR5I9dOzmyI2pBMh+pF7rOAIeTDUbgYZdWWRy7JAo5sTptbJB12H1DpkVYftDMlh3fTvURhx+5o+SOgpa1KxwS2cuXMBuQcbG32Y96Eh0lccubFlEyL8xdQSJpXioE43jqLoq2HYqMXCMrIes6apjpB6KNv0h9oCYvwkZw2gULLVzxpS0wOeKbUGuZocKBjRIMjT/EWtMKB3mtlnRHhv3l9ddCStdcl1+cua7Y8Zaa2DvMoZwitlTW7IbwSEVsWjiO4BsFSmGDd2NorD0VzoTaeoNF7woHXreP9oIVIHQh1VDGtep0HWslbeAzDH+iWkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iyt1fMGGvvxFcPuX8UVo3DOAj8DfDoSTSzxy77g+l3o=;
 b=IfSIJp2FjSuBlo89M04mXKnir68yDY/zfVbQ3GgChhuUMKFDlbzB8jXKqCJWIgkF6Q6keQDtXpzgsqw/6OhVgTMOOPYm+HnNXSo5dZdobXUNEzivFEvtr327n0YiCyl+zUuSrxNhlGncNPJiyv0ezswQdAs8jgymO+MKboUc36YDi8d0mUovSxztxOykMCg8KGyEwUZbzn3f8/WJiing7h0U/Opk3yjjCch2ehl9bqsw3fqnqZosXxR0DRMkqrbMl1bBHoOLZtqH1bIUgAqPBXddilY82qqLH5nG31pNAWh2cWafIFpZrkk7ppBPgx+6ABtIvllcVF0oP6JQOOb7Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iyt1fMGGvvxFcPuX8UVo3DOAj8DfDoSTSzxy77g+l3o=;
 b=P9wMznH8P9pxNA+FLCupCEXJKPgaZ+ffA4qTZNXUCkbhv6Apzkopc1NcQfrziVtZ8UB/BJS7ZSnZjx8KpiPbeCeAW7CCjWqsAaXaYioAhsi+bfiwoRMMytcgsG5ur34XuRECz4N/VNQcKuNvQWDWqWTrqpqAiCj/M+8/8t7JZ/A=
Received: from CY5P221CA0112.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:1f::32)
 by CH0PR10MB5018.namprd10.prod.outlook.com (2603:10b6:610:d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 03:52:07 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:930:1f:cafe::81) by CY5P221CA0112.outlook.office365.com
 (2603:10b6:930:1f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 03:52:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 03:52:06 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 21 Jun
 2026 22:52:06 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 21 Jun
 2026 22:52:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sun, 21 Jun 2026 22:52:06 -0500
Received: from [10.249.32.56] ([10.249.32.56])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65M3q5IX3847915;
	Sun, 21 Jun 2026 22:52:05 -0500
Message-ID: <62e07989-f0b2-4346-bee8-5d7a11f4ea44@ti.com>
Date: Sun, 21 Jun 2026 22:52:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: ti: Add audio overlay for
 k3-j721s2-evm
To: "Shah, Moteen" <m-shah@ti.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "Menon, Nishanth" <nm@ti.com>,
        "Raghavendra, Vignesh"
	<vigneshr@ti.com>,
        "kristo@kernel.org" <kristo@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Kumar, Udit" <u-kumar1@ti.com>,
        "Gujulan
 Elango, Hari Prasath" <gehariprasath@ti.com>,
        "Abhilash Chandra, Yemike"
	<y-abhilashchandra@ti.com>
References: <20260619062749.1575066-1-m-shah@ti.com>
 <20260619062749.1575066-3-m-shah@ti.com>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20260619062749.1575066-3-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|CH0PR10MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b769ea-71f7-4314-ce6b-08ded011a12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|22082099003|921020|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: xsQm/0Ouj5ybpswQaBvNedMiMPIezoZNwqCqqzQe6b/5g/iqXTJTUpmDlcMHu5fWgqzP7VWNEz8oOMGYnPm/Od1oqMnPJcNWPSJr5nJur8E13PbpbIUtRYdmjMRQ4BMX7YHza3wSorVnRXifMk5NTeCnrYf9uMX15LtjtkSW0I1Mg9ei2iJ62ktc5ZFykFeVfxNTPh6RNNZk4ZFKFVh+ARgGqFDdhYPlCPyofxQLDVq8/Q5Zj88T19p9ezF1vr7eHwjIU3mZ3qJAgGETQjAHubzW5ZGZEiNEXq9OJtWAI2ORGwsclpFaK5EHU9dkzYwE/s3hu32WXOIQZX/izB+ph4MP1M18b2bOTES/lqcJhEl/9mqvZkZEpeXorgtsq24rtGM54mb1H/8UM69h1nSd+muB8Dm10GRfEs5jJVzrb3I0t7QQdqAPfyaKrn2B2xI1+flzVUtpvMfYrCmGput6f7km/6Dc5A7nFVLO1lXTHXOkYiKlAiW/x/rI9DKv5fAan89IbRDj+9cKkh0c6Ann/F4F4gEa2rBZDQZFrzi1jTG7BLYUk9lsORd61iCHWqQvkjxjnX42f0K7yiTjttLusjwZJoqbBbsrxc9uTPJBx3zpAXc2xw/idRn3ovTcb8tWV+BZrpbAslorX+5MSimyUp2JH/e5Ib86/NG+OsAC0XU968MLw3CILI5syLb/ELYHhEkdKYD6RT8nEcZVZcOQ4ALcYY1JoYeRF8Kwym34aKeWzlqx7k6hvYLDLtqQTu9+
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(921020)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: H21GCFIXMrEx6xZYVBcmQCNrJtpUFX7kwQxGQPn4RVc9ECQhZFeJpJeOanRujg6zhTGCPdcuUOeK6LVjWnFOnDh8rBl1hq4PqktjeVhMjyJ216syL6/ST6ym1+CxBGfCk8tVzAEqvhGqtL/M8LGa6mn52Pp5MmljEeSLP3ONbahGaelLIIybCysxHBP7Dj2/Xncn9rpxE+8xZKA5kvyvwrqyUj1dEpO2LL3vcNhsZL2lctjxkCFucSyO26+Wv7irb/1iivwRur8P+5ZEHOZfuqwoeb+aIbasCXwkfBaUmZasQ42OTU5VobTluqi8wq1QNwKUbQJ0ca6sSGorJ4e5XkmWdC3MmByt9ZbnxaICZr/+fU2byA/dNdFA9iKiDWjadbjkKO8K2EiDmHfJcmXHWrReyDeVXtzHc/h5Z5KhXStTNi/kJvedm9em+XXdjOHM
X-Exchange-RoutingPolicyChecked: GmoL5RPYaZbURCcrjzFKpliAJYsAxTIOuTGfwwia37uRdZsjc03qQZ+252MHN7du8e2Q68FhC9LXCrEbklySgZc4awth3XUi7/KFdEV6+IJ7fgXJTd4Fcqjerq8MwZ9I2nOMBgeSPutte7cieHAVVTm+tfAPIokkjuKcnba2TCtbhiUJMRxlBBOe5c2kMVTpekVluBsYzjaWQZ/MUfoR29dR0trOmBqY0o0v3yIbSegHK884PHLed94DbYP7iQDPVm9h1gYKfdlzu1JtsKpAuzCoGbY3E7p28W+mfOMwGdj4OJmP8q4wqPH7St9Zf5VNuQ5Q7IIoSP7WkAZCuZBkyA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 03:52:06.9436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b769ea-71f7-4314-ce6b-08ded011a12e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5018
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDAzNCBTYWx0ZWRfX0oR8md4+zLT+
 UYUbtMgeIhV4H4KEKQnbDlWf/HLv5wDkd9YLAFxKCkMHCt6qM49QR3qUvepLw0gPG7Y0BZBIW2v
 gVXrSNJJsbUWJZWpJwEsN3/e4A8i5lWxcRfPK3sBKAj/gHZmXBNgfuaEkd48MuVp5nARbF3W9LD
 XIJPzMoVHNqAdCRi6g1Zu5+6DZzzU5/h4jNYfhtA+wY+eChHxESMvV0h91OTUNQe7DsKplO8VnW
 T6cCXRdAfNEVFzJtkU1FWgVqE8oaJeva2RzihmLzpJ/Glp3LkojikqJs8amr12GWMuWQNlT+Yk7
 vaquVKfxp3BY62A6Q2eGs1SD5lwr/f472vwXw+XEPzq5fyh7LxfqhuYOkhEr3L4ncOD3f2sx5a6
 5ASTGDa9ve14kQyyqMu1oRzBgCjuqbIpI6Oa1lGW+nKqSDgC3xL29HqKFtrrXbj8YJuV6zoiL7L
 I0BLH25MoJ4893IDmUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDAzNCBTYWx0ZWRfX5BuWHi1b3fYK
 q4apByR8ysz+FbmxVzBu7x3Ddn+Yos268sOqIgjAzsilvQohy4P9uDIg008HyfPYkP3bo085owI
 MVUVCEjTZ5BeRvTmvhxqPoNwIFbp3yA=
X-Authority-Analysis: v=2.4 cv=L4AtheT8 c=1 sm=1 tr=0 ts=6a38b16b cx=c_pps
 a=Kac4Oh/pgoirBk7HbaAweA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=fZY55xy56n34fwBU5VEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: 7H9xtfAE25KtenvHEFne0ZcWX7VOEYDF
X-Proofpoint-GUID: 7H9xtfAE25KtenvHEFne0ZcWX7VOEYDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_205221_376553_D80B4B45 
X-CRM114-Status: GOOD (  10.41  )
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

On 6/19/2026 1:27 AM, Shah, Moteen wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> Add device tree overlay to enable analog audio support on J721S2-EVM
> using PCM3168A codec connected to McASP4 serializers.
> 
> - Add audio_refclk1 clock node to k3-j721s2-main.dtsi
> - Add nodes for sound-card, audio codec, I2C3 and McASP4
> - Add pinmux for I2C3, McASP4, AUDIO_EXT_REFCLK1 and WKUP_GPIO_0
> - Add GPIO expander (TCA6408) for codec control
> - Add GPIO hogs to route I2C3 lines and McASP serializers
> - Set idle-state to 0 in mux0 and mux1 for McASP signal routing
> 
Hi Moteen, thanks for the patch.

Reviewed-by: Sen Wang <sen@ti.com>

