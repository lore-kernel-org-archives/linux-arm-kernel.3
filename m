Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8166606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f/5Etl8W;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=Gwr6EYrr;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=YzYUdMaJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naKAeBJvQ1/Qhf7v0fVlFcdbVeEkh0nkcpzfC4zqHuM=; b=f/5Etl8WmufRcQvTpF8cpqh/TC
	JQ69A66FnvF5drfW90A8Lm4SPqKOte2WeQYIGKmyUQiO++l0JapfTpRjmWwAzrwwROtuJVMmUFLwz
	0LTmsRk50TtHj4KaC/KMW7C3OsG3z44TuQwyW3/fxUlS9idWxOUiEBzysiugYXShjUqHXc1MRwTA3
	Y63cxLdSGsxtF6WJeDt2XYg05m7XYKaq5Y8PkJwetLEXotDnt6XbzSBHWzWEDpAnsi76KGpzOT8Bt
	wsD0EJyhUe7W5dEsHcRBF4JOd7gFPC3yq+M9f6P7ANLelsBBYgDnsLJj+oxpc0C1rXyw1YWDDfMFl
	ynhKoN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuCi-00000008KNZ-35fD;
	Mon, 19 Oct 2026 20:43:32 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuCf-00000008KMU-0V1R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 20:43:31 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JKe2iq1252256;
	Mon, 19 Oct 2026 15:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=naKAeBJvQ1/Qhf7v0fVlFcdbVeEkh0nkcpzfC4zqH
	uM=; b=Gwr6EYrrihbBAkKJvR1+ybLBUhJ/a7AR00BZ7mck8eeGFvdNYQVUz53Uv
	Hb5PoNUvgBdoCrXomRE8s3alj0CVwOXRDHxj7h1p0AJcwTGn7e9RHfjMl62jL9GP
	AjWvdUgCjl3nGIto0R6qQPpMBeFREIi91MuWrmQHyExwj8IA+QklF9Woz86bmiYC
	hwmtymf+kpwfU63hZupLNJ6VLOK9NWD6PZg2RmBsfiCSzuEs+b/z1Bp2xBC9pShz
	mCR+CQg9oPAkvT6pak5a5WchAUGh+aunOehuC8kLvqtoE0r8oxpRX8Cif/+1nh7y
	lHWvS2+ojhMtzib7V95ZZ4kj4jw9w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013048.outbound.protection.outlook.com [40.107.201.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hcrd60w2f-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 15:43:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBVQzUrOKjAEekaIOYCX9H2R4hACNzw54EXPn44Z9oArjWR159j02PuW5WiO6XOHUinTVp+uEMA3KC6jb76WKpep5PBTlHlcGekDbaDeISUJRIpSs5bpqFjtPX3fHfcw6chGrT9aokzjVOdnvoUXdlHCvumbowZT/vNMG+gNgY07zRgnKGcvnLFQ5XnQl2kcw83rW4q23p212XQKagM3+ll27giMGVjWjFS4kTWrd9S/mmbvUCTIoFZaUD/S9AfhLh+mIwn+QxbQJoszk6AAAXWHE1XtFpxrrqN6SAEUTB1+w47xBlffD0LynVyeqyeC/d3e+moeun7LhHVjpWry6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naKAeBJvQ1/Qhf7v0fVlFcdbVeEkh0nkcpzfC4zqHuM=;
 b=nY+SOq0o8Jl7Qr+zW7pkUIsPUm9U5b6Vi5Te1PAEcihTk7nYuKHdg9bEI1tR1xcxc0yTLn3ilwY8ldPl28w7D+dP41UF/eGHG61ezfkhyayYkO8NchO2sJ0ffWL+uoLZm+X5rpoUsn60OIDmTFs81vOnf60w9uxP/6PXRuJoERyA3qxqvTP7cEvKFn97bDBU86Rgv2PAPk3FCMEq/SFCiKtzgs0K6P1Hl6I4mQDX5etX9SC4hNQD39I9M90yGyPt3cZyXO8aD6GJ+GRWcTqU2goxrIRcp9tiUh47UfnaT8TaLCAUGi1i6V81dlFSnl7T0fFi4XjtIRE4o3CzAx4cWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naKAeBJvQ1/Qhf7v0fVlFcdbVeEkh0nkcpzfC4zqHuM=;
 b=YzYUdMaJTl4qaC6ho4cniSc6A09qDBBE95Lg8Ar+UqvbjJmfA2XD547Xu19LwR8r+67yUjp3XEv2M/S71td8PIEHoFy65CaTTn68TbTaB6ru7PY2R9oqDQ6SO63OHTQ61etyDw4xPTnhQ6VlWmxpbL+ufUaDd6I9i2N9LFEJvE4=
Received: from SJ0PR03CA0250.namprd03.prod.outlook.com (2603:10b6:a03:3a0::15)
 by PH3PPF5EEF2B425.namprd10.prod.outlook.com (2603:10b6:518:1::7a5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 20:43:12 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::26) by SJ0PR03CA0250.outlook.office365.com
 (2603:10b6:a03:3a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 20:43:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 20:43:11 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 15:42:57 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 15:42:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 15:42:57 -0500
Received: from [128.247.75.1] (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JKgvpf3510357;
	Mon, 19 Oct 2026 15:42:57 -0500
Message-ID: <bb4262cf-3e43-43bd-8e51-b8ec376dfc3d@ti.com>
Date: Mon, 19 Oct 2026 15:42:57 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: chips-media: wave5: Account for sizeimage 0 case
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        <nas.chung@chipsnmedia.com>, <jackson.lee@chipsnmedia.com>,
        <mchehab@kernel.org>, <hverkuil@kernel.org>, <heiko@sntech.de>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <devarsht@ti.com>, <stable@vger.kernel.org>
References: <20261019160003.2375198-1-b-brnich@ti.com>
 <6242e4c3ecdc7e55a0e32a6cd73b776a0e86f4bd.camel@collabora.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <6242e4c3ecdc7e55a0e32a6cd73b776a0e86f4bd.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|PH3PPF5EEF2B425:EE_
X-MS-Office365-Filtering-Correlation-Id: f52a6cc3-bd4a-4140-c265-08df2e219779
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|56012099006|4143699003|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: pIHeUVKYl0unlhqAk6S8QXNSI2dEYIVnb+jsHcHkUQITUTzPEoHvODSqyIGWloKaeauWpWFlI+qpld3DhePvGfhI/ppJUyhGNFv7TMLVpuQmtMPmHDbtAe0oxob6XvwCtqJk3v9KXTHnNEhYg7vKOrIAV+iXGbyTi4kLAC/OgwswaExHR4M9XLWC2Advvzc7aFU1x5lrZ+g84P68jlfN1W4tcVB0SWqNtevbhWcKPsjNU5skWep9TLJ82/ouEI9+4oACOIOL0PTPmbC93H01srgi6xJDkq+9v8pT79iZDdmt3KHSWXXdBAZqGLSTx6UJFFrWkg9PdUx6vBVodwXXVq4TI2QotbepF8uH2mrTELlCI8s4KLeS8ni/ilWJZl6NHulIR+4vrrFPwrEedVQeDDIJFm/EUSjQRF9uaZfxDlsHDzav9QrGA+6BFhNxC6i6njM41OBB/2mDBfvEV0E3a6hSsDDSAckUFV5nu7aWOJSiaMKH39WTuLFat16nUcZwMSfDOlzlEwfDHJn2v8ANjR+fpW7pe8bQoP2oK3toj2SuIEluVnhUAc40Z2j5nqpqFiAeOKWovM7OfgcZPGH9HKAAdyUjE8xA1ZeQRBTRXDtr5La9EnPnh67/IJEehzfa9xsrztmOf6JCye4t1Z7RA34AHpuKNr2cP2iOEut0DEzMRsNh5rkIPn5fPH3w+qy3UsqigS6j0c9s0ePE/0Y2ng==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(56012099006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ignOuaEtwEfo089MFdmGtaCGf+Jcc3Y/tM3OCIi4FT8UcPLh2L3QDbdwrVmSIoWk0AqvPMSbAWFjgqkqczRolwy9aqxIW4aK0ks3gu+WyKgUDJ9qIG7au6tNOnTdxTDkEZaMT6M+vlt2ZPPMo+C1TGN9JgV5iiyVTjTsD2vwKHpzDFjW9SZRnxDrM0pX9cRY6TBLFbGKxGTFiz+X6IRfANrU7mGS5dspEhOW0q8NJoVRZfhX/zVCuZ7LzGNAAAxk6dlo5wkKbzw5BIO7Z/GnKRJmvSFQRG3D/jyuFc19ew9XYExvOTTodSyvkDgL3G1Rff00YYVHJGpMLCr7vjWFtrd5398es6U7x5ScGu8LlU0TDpsPmWSX+uSBSXRckzvrjNUll1YSV76pHJTMKLp5RNVJ5W8EeC/nDdjxCxR1zUYlYxrznebD2k5aSPvUzs0R
X-Exchange-RoutingPolicyChecked: ap4YfqsNLC8MXDPf7Sld8k8IkyibwI6y63Gicx84YLvFwsYmCToEABgfyuKjQiO2CnEpl+kokQtZx3VO3D7yDRKqwEQJzpoJKEjIupfoPb7aII1qALFxC8kzfZ1FZAoTx3R42yg3w2zMprkHEMthycMLxxIRdWIks6q+f57RR8gz3mjochfVcE81B0cuxmSac6O4O7iD9tKnMH7ZRQW2G0JMcPpZ32Y7cZlLK4SwqLbsYVFhI0aw9LUDlQtH5zjZgvzve/xOURvG13WVrO8lzUo7+yOHuXOKkGCMeJZJFWv5YkUqp4xfgqxAV3nGAPoCAlH0eWy5OW+esGZ/hdd6XQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 20:43:11.8765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f52a6cc3-bd4a-4140-c265-08df2e219779
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5EEF2B425
X-Proofpoint-ORIG-GUID: 8b73eCZwWoPZtFZVAQavBNi8PIkG1m0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX+Ygrf7Ama8RS
 isva4K7LKnl8YFZP3piY7i0E+IDRFCY4BSRFDv1QCqPygXcRfitqZFmSqKhHVwrXnaA1Mhcq7vq
 MW5eJZtS9j4bOqevnAaSqWVW9TRHGKnUYx2rAEWFvqeK9VyveZlbY4fPGNSj4eOUkXs30BJZYay
 vvFCYCPSXwZxkxGysuErfzWMGa7El3POMmUUucZLzmJwoqXm0IhY1S9HJnoYilppq/Zj3uA29If
 UaGNUry6Mr2wh0LJqXn0F1Kd7ryGCPhM4CbvEzd0tVRmWlIdiVoaa8Ns7EFraOkYXICmlJRKNiL
 CvlrExgoWthDqaFdOqiMva3Ww2INDtaqmSXM40rYbJa5f6n2yzTtGEwZvQvrnh1NCgYQ/2lN3OV
 Wsa3YAa4fYsK7vqdcRMgLC8MYoZDwfKPypaRfN/W9hka3EEuVm64Xu0MHfIEmiFiN0nstdoXwXn
 W5BnQfc6zZCLAm6p6pw==
X-Authority-Analysis: v=2.4 cv=ReYFmFtv c=1 sm=1 tr=0 ts=6ad680eb cx=c_pps
 a=LawZwnZ+dX5EiMlPDlYRuw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=QX4gbG5DAAAA:8 a=azgpF_u8SeIIs76JV1IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 8b73eCZwWoPZtFZVAQavBNi8PIkG1m0O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX2QYvw3dW5ZAm
 a1DQxz5YcTXinIXIluu6DgIsfTkcydSTD4ZgrDwYLs3VGcpqanshirdMkLCO/yUGyRzHz58e9lu
 ErMHI4fU+HL7iYmoEHJjBL9yZnTgE1Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_134329_344817_D1E06698 
X-CRM114-Status: GOOD (  27.56  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Nicolas,

Thanks for the quick review.

On 10/19/26 13:46, Nicolas Dufresne wrote:
> Hi,
> 
> Le lundi 19 octobre 2026 à 11:00 -0500, Brandon Brnich a écrit :
>> V4L2 uAPI states that sizeimage can be set to 0 in struct
>> v4l2_pix_format_mplane if client wants the driver to configure a proper
>> sizeimage. If client leaves this field unset and configures an encode with
>> high bitrate, low QP, or any other parameters resulting in high quality
>> encode, then the driver-calculated bitstream buffer size (MIN_BS_SIZE) will
>> be too small resulting in undetermined behavior.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 88ff31fd0181 ("media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.")
>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>> ---
>>
>> Current DEFAULT_BS_SIZE is just a placeholder value - I can lower if
>> required so memory consumption doesn't go up drastically if sizeimage is
>> set 0 by user. I saw this was the common equation in rockchip and hantro
>> driver.
>>
>> Link to uAPI requirement: https://docs.kernel.org/userspace-api/media/v4l/pixfmt-v4l2-mplane.html
>>
>>   .../media/platform/chips-media/wave5/wave5-helper.c  | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
>> index c3d34be833ff0..384a0a9aac3ae 100644
>> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
>> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
>> @@ -7,7 +7,10 @@
>>   
>>   #include "wave5-helper.h"
>>   
>> -#define DEFAULT_BS_SIZE(width, height) ((width) * (height) / 8 * 3)
>> +/* Smallest bitstream buffer accepted when the client provides a sizeimage */
>> +#define MIN_BS_SIZE(width, height) ((width) * (height) * 3 / 8)
> 
> Does that change put us at risk of integer overflow ? I just don't remember the
> max width/height, but please do that math to be sure.

 From wave5-vpuconfig.h:

Decoder supports 8192x4320
Encoder supports 8192x8192

So worst case is 8192x8192x3 = 201326592 before divide by 8.

No risk for integer overflow here.

> 
>> +/* Worst case: Allocate bitstream buffer size based on resolution and max depth */
>> +#define DEFAULT_BS_SIZE(width, height) ((width) * (height) * 2)
> 
> Should be adjust based on the sub-sampling and depth? We could use 12 and 15 bit
> for YUV420, and then 16 (what you do now) and 20 for YUV422. Though, as far I
> remember, 10bit has not been included as the TI hardware it was tested on didn't
> have it.

Looking at the driver, it looks like 10-bit is supported by the Wave515 
variant. But as you mentioned no TI product has Wave5 variant with 
10-bit so I can't validate :(.

I can update the function to account for worst case of 20bpp if you 
think that is more appropriate. Memory consumption will already increase 
if client leaves sizeimage 0 - might be worth allocating for actual 
worst case here.

> 
>>   
>>   const char *state_to_str(enum vpu_instance_state state)
>>   {
>> @@ -261,8 +264,11 @@ void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
>>   		pix_mp->height = height;
>>   		pix_mp->num_planes = 1;
>>   		pix_mp->plane_fmt[0].bytesperline = 0;
>> -		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_BS_SIZE(width, height),
>> -						     pix_mp->plane_fmt[0].sizeimage);
>> +		if (!pix_mp->plane_fmt[0].sizeimage)
>> +			pix_mp->plane_fmt[0].sizeimage = DEFAULT_BS_SIZE(width, height);
>> +		else
>> +			pix_mp->plane_fmt[0].sizeimage = max(MIN_BS_SIZE(width, height),
>> +							     pix_mp->plane_fmt[0].sizeimage);
>>   	} else {
>>   		v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, width, height);
>>   	}
> 
> This is overall an improvement for userspace that is not picking a size, so in
> any case:
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> regards,
> Nicolas

Best,
Brandon

