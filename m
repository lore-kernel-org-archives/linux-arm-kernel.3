Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73249C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ThZOkQF7EKMDN9U91uAZSkSXfkFatj2pe1MtlL2KtYA=; b=jI2yg3gvcDfVuy6NjD2S8RT+Ri
	B81XJrHG9kdJMO8tLFrN6Z4g44VltVuXK8LDY9b3kecxRnqk+3I7HUF5LeLUQtfd05j82yIOM87zE
	aqk75Q3VxNGJXgsKRoYZaAX1aVvUJKPDytJYMrbSBLd6k7Ou8YRIoPsrnwjdeua/48+I1ae061odf
	vJgf4Ewr7rt4VHydw9BtY4D5cnZV6v7mEyAKDyWNlwneuLMJCl8mF7nxx8XXcgOVz/AcKL4SKr4ln
	YUHHLq/oILDYrvDhMTjM7cTfm3cCjgM1iZ7dz4zKIsOwVAzv6ipaktFmwobDjc5lDAK1vV0rW6DLQ
	d1iyLa3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDI-0000000GAYD-3XiR;
	Tue, 30 Jun 2026 07:49:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDC-0000000GANN-3bJk;
	Tue, 30 Jun 2026 07:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=ThZOkQF7EKMDN9U91uAZSkSXfkFatj2pe1MtlL2KtYA=; b=cJQQRsSZbekiU7SSXMcdJh+oKe
	8eHvU37ytbgDjIdyG/yTuQMrFKJef5LJGBJzGdceoKSe2bs9Llq8RPIF+Rrygd7YPZroar/wJBDu3
	BCQVBetaEl5+CjDUJeoHM5W7BfV9dVJoyi5GPVl6AkK5PAD/oec8wZsnMdpHsCCWWXJJvtsaCxg8Z
	Sg2YQBdgbJMoW5qznqKMQRyxUf3Wb/ILXXDyhaFGgcUemUsZkchq5kNV4jJ84G9LsKa4KjZjU/CXK
	iuW0rSsLkniGWFfdjz86IumNg3ibOeZ8/U1u+YaoSJJshzsqEbJKVoD5MFME3ebZLS57KJyj0RE8U
	aAPj8mcQ==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTD7-00000004XZ0-3cUF;
	Tue, 30 Jun 2026 07:48:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tc8mhZ7imuSdHSZ5O4PmTSP1VF99YP2ABRq2kK7pS/8QZW6XoQygHnQ+YU1y8I3N/QT9JwX8DZeiGYQ3MhXbOT3vuCbVCYU1jyrs+8RtJreMi5ejULIrIVTlxU/sd/dyv5BAYVjzBE6zcVoI516Pk1TSokJxIJqZP1lgAqzmjD09rzWDQe6jP3L4afLIFHDexz8/eZHlyXlxj0sbGT6B0PzqfOOFQ+RcPo3Q2ZIu6uRVg0QbYZGw5TJ/Bp4zESVjuF/yWzYrnxLFgKkL6gNdV4aJxoeJXFD9DdlS7pE7k4lta9ztb3JQhDZ0bRUS2FfripNunPpY+1LHFmWfWf80tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThZOkQF7EKMDN9U91uAZSkSXfkFatj2pe1MtlL2KtYA=;
 b=imm0fp6OADbSCEX0VF+J4nTk6opC26xU7L1cGdbMF8c8r9v5177Sj/8r6CUPa2ADudXG2DsXQTkjomkUFolyUzlKiPui+x92bVQAmG/gTJDYvxVieH3isFPRvTifUug2tMtuwwl4x5f3V4Np5uSHHliY8JI4A97EkJkHk94tWp+dpSfLjHwMau8QminmwfR8cDn5EiINMC+/m6yf65AdUxeDJCmVZ1THQbLNoYNJzA/8PBAufDceYJdiGF+8uE1Wus2r1dtQcvIueZGW/0SI+QZJpU6fiOZZFlfNBjSlbLc9KUDk2bJrzMKoptF5oOD0JbFJtP4cCegWQmF1eQ5udQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThZOkQF7EKMDN9U91uAZSkSXfkFatj2pe1MtlL2KtYA=;
 b=JYI/58xY0LkU9YwVgVnIHgmNP+A+1n63OkfaYh/lj85Zvi9n1H0wBcWOXUYgqktSqLdbH8DUqMvR318MMskpM6pJHqqwRCwtO/DqNX5/s4As/Pq2Xv+n3Pyq/R5s3rPKF4rm/MYnk53HRKSnBuTxj56rV2RguxBBNKcXjFq3TN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by GV1PR08MB10535.eurprd08.prod.outlook.com
 (2603:10a6:150:161::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:48:37 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 07:48:36 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: [PATCH v3 0/3] phy: rockchip: inno-csidphy: fix 2500 Mbps support
 and add clock lane phase tuning
Date: Tue, 30 Jun 2026 09:48:23 +0200
Message-Id: <20260630-feature-mipi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMd0Q2oC/43OzQ6CMBAE4FchPbumP1jEk+9hPEDZlfUHSAuoM
 by7RS8mJsbjJJNv5iECesYgNslDeBw5cNvEYBaJcHXRHBC4illoqa20KgPCoh88woU7BhcYqq6
 +Q3qyEvJ1ljtTKcKURAQ6j8S3F77bv3MYyiO6fhbnRs2hb/39tT6quffX0KhAQmqVIpKylETba
 3um9/llg72Y10b96eU/PR09o41ZWaed0/jlTdP0BA/+YkArAQAA
X-Change-ID: 20260617-feature-mipi-csi-dphy-4k60-9879c3d1fe4f
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805715; l=2061;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=QaA3jmsxgey4QBq6vILlSq87KjAwyhLMpNVUxSFmn5E=;
 b=wLOLzp1rWB3G6p09it6DPYd3gxEY54RdsMEvDcN3vwwdz1byYIAMivZsdsEBuMzvFU/5eWrsf
 LH066Ekz3AEDmkw8KKbDdaQ+lubTRrkTZ59lmNc0Ao3RyJjoBkaCZL9
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::20) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|GV1PR08MB10535:EE_
X-MS-Office365-Filtering-Correlation-Id: 732550be-4068-4904-1e2f-08ded67bfe43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|7416014|18002099003|38350700014|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: l3xZeFzfXNYhwua6yLvrRonGpv4EdyknEi6by3HGRJI7OZNGadTkI6oLJDLSsJ6WINdV80r+6hPMvHZN21B6ZEsfFSbiYVYOiO/ipGhuN3umkHHTc2AhU9b4O0vk3OkhXuz9s6eaGvfaUMzblZaIKxY1+yvLv8XYpR1Y1J3R2wHbfvJAFrBHoISkPMOy7h1STPb0c6ldTOTV2tkO69XKWTJ548+Uk+4TVBWiQE6gYfKollQNd06kziR9TnoQuQ169rsR9RJTz5bZtmUhq1uqayQn+EdVW2heAXm07A/Zzo5cIw8HukADY8cNXplY0xeiOoVgXDFf31gNFdnSsrIxsWm++GOZUQoku6ixgRt342gn4dS5dsw2hvYWMBAwU8zJXTY0gpHCtFDgewHsdXpZuothNLYc778tstIjVHNEeZC2RB/y2HEIw6xVb9p5+p9FH78V8yg3RCkMN2057ra79Ag/FRATxHm8PYj8znYIdLVRX96NOPp8XZ6QoKsjqmZgMtDv3Xkt42O3aQbbzoAfHCIzr9+jhkf4IMUQeov7NIkd2BU9uf/kZiK2+DzooIVlq93N8snS63giP43Y7iNPhwQ4r9mj8UXNyP4n3FSQ6gAl85zU9SEJtYwGzeLw5sDzCwYtS1oubFHZZEuqbNcnxVTVSw2oEg135OJoa7q+tpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(7416014)(18002099003)(38350700014)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akZtVGxuSjB4REdCWmZ6MHoraFE5WFhIdHpweE92eFBtTUhTRUNCWEtSZlFP?=
 =?utf-8?B?bVVBd0tYQlg3aFBGUlZnOE4wL3dmcWFnMjQ5RzEyRE5ZbWwrYm9vMXJPMGZF?=
 =?utf-8?B?VC9Uc0lxZXhCQmx4VzVaT1VCUXBsTHRUdk5CV3ROQWxHVHhuVGZId1ZSaE1j?=
 =?utf-8?B?dnRFdSt3ZjY4bE5GM0drckZFVXlhbEE4ZnRCaUpwMGo5eklvV0gzWGtwTWhC?=
 =?utf-8?B?Ykp1ZEgyTkNmU3QxY3pKUnhyRmEyWGtXclQybmsyQlhpaDFOWG1RVVlsb215?=
 =?utf-8?B?OVkrTTJZU0U1YS9EMk5xTC8zMkxyVjBKeE1QY3RpY2pHN2pNV1p2NnhkVXJ2?=
 =?utf-8?B?ci9KcDI2eFpJQWJLMjY0b29yZXI2QWVqSmJQKzJ2Y2FsampkRWwyV0l1MTZr?=
 =?utf-8?B?eVlsQkFvV3hMcmxyaWZXdkgxOGk2NlVndUszSk1abHpGOWtRMkpBZUh6STRP?=
 =?utf-8?B?MkwyVlN0cnpycnRpZUdieC91L1puUWdLSDJBN09QMkFEMmo2dkFrbWM3dzIv?=
 =?utf-8?B?MFhMTGwzSzgvQWpCV2JxUWp5NThtQmJqK3pJQjU2MCtUYmpGOUd0RW85a0ds?=
 =?utf-8?B?SmJ2eXBRbnluakxCZTR1Ly9Sa1ZPei9RUlVpOWlRL05veGdxYVBnZjdKOWhN?=
 =?utf-8?B?Tk1laUsvL2FIcGlGUnhENk9ySnp4ZzM3TEF5d0U2WHRRQ3c5TlhIbHJDY0Ev?=
 =?utf-8?B?ZWlBNVJsOWlNY1o2L0dXR21OMVRoVlV6cjN0bGdkbHF3RS9yc2FjZHdmZ0RE?=
 =?utf-8?B?OVYxYmlOZ002MXFYWS80RHhObCsvNG10SGwxV2FmV2orM3llNExTcTlUUVlv?=
 =?utf-8?B?QTEyZ3oxMVhzV3cxTEJqemhmVEpTV3BBTUlrUzNscWlyMm51NmowKzRJbHN1?=
 =?utf-8?B?MWZUbTVROTRSYjEwTEtCYndwd2NsK3o0Z0FMSVRzcjFWTGNpS21IOUlQaHF4?=
 =?utf-8?B?YVpwMWNnYUZKSi94YXd1UkZud3ZqSm9wMkRDVlZBWFNvYmtnb1luU1F6RnpG?=
 =?utf-8?B?MmI4WFFjVEtZblNqZ253UzVjZm9Za3lBS202aTlEOWRaeFRuSDZNazNlSnJY?=
 =?utf-8?B?eUJPRm5HZDNZejJnT1BXZ2dicDNiWDVjeXNSeXZvRFFpL0NvYUdQcGdhdThC?=
 =?utf-8?B?NmJJNnc1WjAvMHRuMWlnUGJiLzl6dEhhTGcyNG5Pa2xFcFlLMmhFNkwzZW00?=
 =?utf-8?B?aTdZU291UGtSSWZuRElOcUxHUDczamIvajVHVFA4elNQQkt4SzdCdGFXZHhY?=
 =?utf-8?B?WTFKZW1CVzNCMkx6ZGZGenV6TEtpL3c1eHdJUFFMYUlNYXJnYWhBYkVMdkVF?=
 =?utf-8?B?SmZ5MkVvbDMwVWEralo1aHIvSXJQOHFRYmxSUC8wN3dtRkRzZzRWU1I4NVRD?=
 =?utf-8?B?bUNENDFhZDVVcjVKTHRHT3VUVDhnWGZaOHRXL0lJZzBhQkRLUFJkd2MyRXNC?=
 =?utf-8?B?dmlnUk9VL1dHTlUybU5HaFREMTJjUHRMVWFoellGN0t1WEhzMCtUWDJGTmRN?=
 =?utf-8?B?YW1kQXRBbTB1NDhyaGZxTHN2eW5uMDlqa1hTQ0tHTGk0K2tick5jbFNUMEpO?=
 =?utf-8?B?U1hhR0F2MVUrQzc4S05QclVLS2ttZVBBRGF6c1FVcHZPQ0wxQlpzdmZ3NTFj?=
 =?utf-8?B?Wmt3KzVKWTFGY3RwbC9aVnlhTWFGMk5pZHlLR000M3hLQ1hvVnl3c3ZqZ3Yx?=
 =?utf-8?B?RnFuWXlqeFBIMmdIYURTMVB1Y1pxa0dEdDJvQUxwcjQwNU9WbXhuYWtpQTFq?=
 =?utf-8?B?dGlhNzQ4VFN3Z0IwTkdRNTdqdEw2S0JMSEtRSkRRR3ZmUDdPZEtZNldGRHZl?=
 =?utf-8?B?aXhiWUtxY3hzMnFCWkpGN1AzRlltNE1FZFBmbUVucmJabno5ZFdVUHVtbmwx?=
 =?utf-8?B?eWhEREhjZU9XMW1oYUgybUhHTWx0RWh2NnNvZDJLRkpoYk5VVDBLZVlIdzBz?=
 =?utf-8?B?YlMxeXEwK0NwbFdYNDF3ejdDcVFWNmJHem9penAzWDRVenNIbDNrY1dIRElz?=
 =?utf-8?B?Z2RYaEJ1L2x0cXErcWdQRWlPS1g4dDNNbk5idG01c3p4eTBzazdBMURPd0s1?=
 =?utf-8?B?VnNvT2FCN2JaNm53ZHJINi90ZXNMNklhRENxTVlYdEZuYkxwbDdaOHlMY2g4?=
 =?utf-8?B?V0lGMkRVampZdDI4RHhLTU95dmF0emFHbVk0NDBWQU93MnptQThzZkU3SUsv?=
 =?utf-8?B?T0FEeU55bEZTZmMyR2UzMndYZ0F4Mk5mNCtDTUVWblkyQkxkZ3h1aWs2aGRE?=
 =?utf-8?B?QWxzd2ZlTHRTbVl4cG9CemwxdnJKN0NxQmdXL3Y0YnlyRjVwNXVxTWw0dVFX?=
 =?utf-8?B?UG5QNUV6aDlQV2NGLzYrdmE5UE9sYS9vZ05pUUNxY1BTU3pmN04zM1Q4T1Bl?=
 =?utf-8?Q?nLQ6SC4TpTorwRBg=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 732550be-4068-4904-1e2f-08ded67bfe43
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:48:36.9229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Yg7hI0gdQaCmTu15rNdqOQS1WICqkFMvkZInHjVhQIKMA6mXwoNwXgYmORR0WEJZxhpjU62XMLP/I8Japo2Ppn1PeHbhWG9r15OZg6mA+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084850_081806_7772080E 
X-CRM114-Status: UNSURE (   9.17  )
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

This series fixes and extends the Rockchip Innosilicon CSI D-PHY driver
to support data rates up to 2500 Mbps and adds optional board-specific
clock lane phase tuning for signal integrity.

Patch 1 fixes an off-by-one error in the rk1808 hsfreq range table:
the final entry was capped at 2499 Mbps, causing a rejection of the
maximum supported rate of 2500 Mbps.

Patches 2 and 3 add an optional rockchip,clk-lane-phase device tree
property that allows tuning the clock lane sampling phase in ~40 ps
steps to compensate for board-level signal integrity variations.

---
Changes in v3:
- dt-bindings: add default for rockchip,clk-lane-phase
- Link to v2: https://patch.msgid.link/20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net

Changes in v2:
- dt-bindings: improve rockchip,clk-lane-phase description wording
  (Conor Dooley)
- Link to v1: https://patch.msgid.link/20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Gerald Loacker (3):
      phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808 hsfreq table
      dt-bindings: phy: rockchip-inno-csi-dphy: add rockchip,clk-lane-phase property
      phy: rockchip: phy-rockchip-inno-csidphy: add clock lane phase tuning

 .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 10 ++++++++
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 27 +++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260617-feature-mipi-csi-dphy-4k60-9879c3d1fe4f

Best regards,
--  
Gerald Loacker <gerald.loacker@wolfvision.net>


