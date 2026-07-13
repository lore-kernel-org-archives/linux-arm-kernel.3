Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E341C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuYqnjGvjAJYuyjZ9OVmFaDbX4rPx5qmpDbY+CqmkIw=; b=sdxFqTpb8ZGaa3yP7p3g09A9Kf
	RiW10+fnA44NxeBDZ3zEHGBosFcozTZQC79hcJAXzPVp8hwzV2i2gCVpPGcMft6xEYVc4PT2zORvJ
	b1XVYdISnWj7DlecFkWUfU/V+pc1XRKPq6YlKI0mrRwsm78V+zoJaA5LVVEMjfqbUuj2mwoKMHYjm
	/dDe4XYoB8WrDcjN+UH5SV3c6bAMFFSNVcd+T4D6avnCwau7ESCZNb0jVVWxCacThREE47Olqb614
	Y+yS80xdIwk6OUS5kLL/SrulfSBkkmTH6uKGAe+Yyta5fX0RRSkv2J3Q34XoiggjVfdRIncwenNFF
	1cnkOQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI93-00000009hoe-1MT8;
	Mon, 13 Jul 2026 15:00:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI91-00000009hoI-0AeA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OuYqnjGvjAJYuyjZ9OVmFaDbX4rPx5qmpDbY+CqmkIw=; b=Zjhi2WfqD1GpY2G1oQv68VrbxM
	NMNyd7Lfw8/XDUaWUVKRIIGSitotnSqt6QCCDPD8TmHhcJFU+l9ie9bjw7xorbnvE6pjPA0icb9PT
	sp3JdzfgK3H0V2ew+ertswkB+mvo5dfGt1WWxNi/TjeiGcZKhH1VXkL7y85gfnw3vnMkLebipskUE
	rw3pHvxMGHNu1d/jICBqE0RwQWJ0bD15fAWFGIPMuAHb6WWyMMvGN0b3x9iGyyPIQI/gJhOEdhEEz
	f7/lnsByImY9HMcay5yjJtgIbBYI6vEdtppYwIiFu4oF2HI9blTXvX8oEx7013dldbPG9Au2McUEN
	EGXvP6WA==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI8y-0000000BkPi-00M6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:00:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fS3cNvoD2pe5WNZ0uIdlDw1sADruEGV9V8+9TzBGST0Rz8/NWdRRKoHqH9NnX52WlNTQJera1nlSh7O/zly+NOB1LGXvKZ5S0FDCOOzVwM9kNwsvXV6a1ymLVjt3krlWTr5ebRYk5ujuJP6rMUqS33M1nM/46cpeDCCnmivVnqJx7i8x7NDqAeU03sSjpHwTQn6AmUkXVkofR5ndMlWM4ZdlOwxL7TVFD0Dbf/aKlD0tFk8goZxNu7DhgLOTPPEf2jfloOGNb1NNLfpsYcM/jTFKx86t4aW7kFtv0IQKofznWH6FsloZ68ibxkrTWrT+DHyJDF81RX+hPVEdJWmTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuYqnjGvjAJYuyjZ9OVmFaDbX4rPx5qmpDbY+CqmkIw=;
 b=By0v9MRs6KU8GggSNt/txSRM2MyBSG2qsZx44zeTlKmRGTBrvzKnJXd8g+bBARzh6Y/tyN3v3kh8fVU3Sm9iLiwpKuD6ICdyp2hJ/SPYuQM/H6adX7DkTYUPMfcTUrH9dESpd3j7aF/Gc4oNm4aoQzbb+QlsCt5bCpITgguhbg5e7vKNnjs9sPiXtDwvK7JoRfdxr+pposf5JJGJ66nh0OEPzUJHJ9JRtqwHKM845nr8B6uakHj5yecVJ54cUF1xZqgoSsVVkuW4SDrPSo0hhSIgrx9EeSJ89NzhnOotg3sjEDEU3RK3RbC9mzyjkVe/G0BWHHmXf9uLt9FjL3HI8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuYqnjGvjAJYuyjZ9OVmFaDbX4rPx5qmpDbY+CqmkIw=;
 b=vXBY4vVre8h//zvwfRHpCCFhLwwCZ5F3ct+pkyawJAupxWFSoPWowQt43Lzy68tenu/IXO0ok0m8VGmnbomGOSUBTDOWECNes/X4hU49zRss5IKkkYoByFdP55Ub2BPh8nsVpG2Ar2bMIfra3WKd4gMUtu8n6tdXdNytz/apHTKVUJ+2LacJaZIb/qtcTpCvYQxTcP7OknjuP9+LxxaSe0CODLjWJeK15gbYQzU2jmXJCX+7V7M+wwNPucN4t3u62lRzBrQgNYwb/Wr2NOASqQnJjtDjk6JJLp8eC3lBoCL24mO2RH5q/6uup2nF9/49WFO91DUY5k0369ySP+PsQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9669.eurprd04.prod.outlook.com (2603:10a6:10:316::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 15:00:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 15:00:22 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6qdl-tqma6: add nvmem-layout
Date: Mon, 13 Jul 2026 11:00:14 -0400
Message-ID: <178395481137.388036.13714583782929342061.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701094520.1482697-1-Max.Merchel@ew.tq-group.com>
References: <20260701094520.1482697-1-Max.Merchel@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH3PEPF000040AB.namprd05.prod.outlook.com
 (2603:10b6:518:1::4d) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2c3c59-a1a9-4de2-4d38-08dee0ef7667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|23010399003|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ncvJ3k7ifuivBNmiF0EPE/Usv/sKztvIUFw1+o5wJc1hH5ry0hambz4daebwrovZ3yDQAoiGZGstcjDH2YlXXV5/FQuJzJa7GgRELy8+4+j/KPH030XqjzC0Gm/HtHM2itNLuzp9wRUdtzJiBBdVcPIwSxZRVKAylQMn/0COt7mQ1ABQEJF4Z1pR0oLesgyKQubMGBLUpHppTBN+yXYfdFWiXvsCGRh0UhIPqWYIXjGQHpHfStLIyTH8nO5iMZr7Z1ijsXNv946Kpc3y1C+lJVftElJbrx60HocE83SHTasFgkClVgpZTbKU0Vho8RjZPqRnFjcZKqqH2p08EByN57hELjShk23QMPfmLchHRS+CuWxq5lQdKETvrb1+2yYrwzjMXIVtfsEnL9TOqW1oivFaby1Rhy+p0ngRVlUNN/diC28zTN7yse+WZPS4OeBIdXuVh1Z0mKk9KAIZBsySq+6OtzgBJeorselTDdjH4R4Mq7J8zCB/qHIaTyy9LuQ23lr0VmaIAHqttCT3vP3XBcOazC2bwZlTKIN7xGX8mn1+GufoQc2VJhCxjQcAowrafggVQJJg+Eemr65QS3AUUPH0EAWnADxgs/zVa7j88WXF4Wb6kqwiB8+WiHDq93vcy1F10AocHYBBAH7nkZeBSaAI+gd3EVEWDLdDYj3IiZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkkrUU9TK3ZtTzdkMHEzTWNVcEQxc1F3YlY3R0x0bmhqdXRFOE1iQmVVSVk5?=
 =?utf-8?B?aGpPTjlrcWN0dU0yb05nUlMwY09ieTJSemR6TDlQa1U4dEdtWkdhS1c5cWl6?=
 =?utf-8?B?d1FjbUY5ck1ZaDNxd3lVMWRjS0tkVmN1eHh0ZDVvRnJaWEJ5Q3VhZ05rc3Az?=
 =?utf-8?B?blJtUmQ3bjc1OGFiWVhNMm11UENVL0ZGMndnVndES2xjb01WVVZWRXBlcW9L?=
 =?utf-8?B?dDA5SE5KMUdxZSsvTXNtcjMyTW5OdEM5ZDFkS3huWmF6MExSUmdua3dlSkFO?=
 =?utf-8?B?cXova281YWtEYzkyS0pxTlJvUU1raEY0VVpVbmI0Yy9PVm1PV2IxOUxsaDdl?=
 =?utf-8?B?WmdqbWc0UDJKMmJWa2VmVkVoYTJXMUdwUW9ZVWhTdTVYNCtpTjdHby9jNEJY?=
 =?utf-8?B?b3BNdHVNSGdHbzFKR2JEQ0ZDWExzZjFzUjh6eVNMTlVrMHZ6dDZHV0ROMVFh?=
 =?utf-8?B?M2pwVzljS2xvVUFtVlNXOE5TTlhFcDIzSGh2dFdRcjRCb2lYdm1ud2VvenJq?=
 =?utf-8?B?Zm9HWXViKzdUT2pZODErMitKOXZwbkg5MElhWXBYOVNYYXpCbmZZaVlmd3k3?=
 =?utf-8?B?SHBwRTNpUnUrS3Rnd0p2SXpuZUVrZ0RyS1pRWW9ZTEU5bzAxbXByRzVaZ0g2?=
 =?utf-8?B?QzBOeDBrUS96c0RBVjBMK0xHRXBDQnRLN3RIRUUwdUpCNGdOdVNmaXNEV2RL?=
 =?utf-8?B?b1gzS0p3V3pjTCtOMXBPVGoydVo4VHNOS0xmNGtkeUR4ZzdvaUx3dUJKaVZF?=
 =?utf-8?B?Q2ZESHY0Nmx5K0RXQmR2RndvSmFCMURBamdIditxb2owZ2J3dHE0bTdKNGZQ?=
 =?utf-8?B?R25MNVJIQjBJeTZVUTByRkFpNFQyNHhtOEt4SkNEcWJ2SDJFRDhzMkdEQ3c0?=
 =?utf-8?B?aXAyMlZIODkvajJDU0lYclRBbjhMQ1NzdEdRWHA2c2pSMGczOUd0UUEvaGor?=
 =?utf-8?B?ZUcraXdpampUbkd0aEVMYjBOUENNeks4MWtSMnZhUWdmbVVZampQUnRQdU1s?=
 =?utf-8?B?MDdEeERQZDJOZm9sV1VQY1JwczY1ek1QaGJaQ09TUXYxZU9pRm9VR2w2UWo0?=
 =?utf-8?B?bS9iTkJiZnp1eUNtSy95UjBsZWxJM0Zrd1dJN3FrWEpuMmpwU0F2TGZsYWFB?=
 =?utf-8?B?dXJxbllkWWxVbGtpTEkzLzVSdlZicEdhUytRcytKS3ZkdzVxY3FCTVdUL0lY?=
 =?utf-8?B?WWZqcUdRdzdqSnZ1MldoTE4wYTgwOHp1SThYTHF6blFxazV0TFlhZ1pGWmRS?=
 =?utf-8?B?RXhBcFlzSWIvcHFTbXFmaUQwVG1qZE5qenRTNW5VMVZKeUVJRWl3eHU4THZN?=
 =?utf-8?B?dnkvZTFDZW5vU0pVOWFmQkxXU0Y1eVhBT1gvakh0cVdNRi9GbXdETTB0TUJX?=
 =?utf-8?B?dE9TQ1J0YTN2YllwM1d5RW9RUk5Fa01iUjV0MWFscXpqUCt5a2JPb1ZMYnJV?=
 =?utf-8?B?SGVXbS9WT1QzVlNuSVNnQVd2NXQrSXlWM0J1MVBoK0xSampHWXN6SWN0SVZU?=
 =?utf-8?B?V2x2Y2EzRytmM0ZhTFpQV3RnUzdMUjlwQWtEL2lnRXJiVHhYdmlPNW5DME9V?=
 =?utf-8?B?MG5jL3dnZTYwUnBPM0V5TnVjRkQxa0xiNGFkQVdsNkowK0VLZzhXRTA4c25u?=
 =?utf-8?B?ODNoMmJ4d1h5a0xUYjMwWEVaU2d3cnpNOTI2SEJ0UXBCYUd6S3JKdGd4VHVD?=
 =?utf-8?B?R1NaN0dib0M2aVY3dkdMYisrSWloS09JT1RlZC9sSXpoSUdMWEI1UWZwYmpq?=
 =?utf-8?B?cmVnWjc0WEtpQkdpN2poL3lWVnAyZ1VBdWRDNFQvdUovamx4WUJ4NVpSUnZt?=
 =?utf-8?B?MlFrMldDdjlYckFmN0xMVDQyeW4yaks2blVKbUNjYWJRZnBxOUc1MmtreVgr?=
 =?utf-8?B?cWlBVXRWbGJMczNNVVVhWTlvTXhzWWhXMTdFeUV5UTFxTGllM1dmVWVBbEVS?=
 =?utf-8?B?cmREZXoyWGFpaUJ6WXc3UFFoMGc5Y1FMbXBLSGl5VXpiOEEyVDh4TzhsZlhl?=
 =?utf-8?B?MTd4bW96blZoakZKQ2VqSmdYdTNPRzZ0Z2xuZkxBMnpIMmNLNWh6cFBRM2wz?=
 =?utf-8?B?UGVSQVVIQndoZXpjWk5ZS3krb1JLaEkxSUFaK09CY3Ewbml2dzltbExPV0pC?=
 =?utf-8?B?YWJKbk1PRFpiQ2YvWWtHOCtCWTdKZ1Z6a2lHeEZENmpHdkZGRWdlTHV4Yjgr?=
 =?utf-8?B?SFZnMzZsWjdDS2F0Q2g5b2FFWGpOVkJycThJeUkrdnhlMVBuMmlqM1E3NGk3?=
 =?utf-8?B?WFdValpyYmFFc3hnbnZUdWc5WE1kNU95K2dCZTMwc0RTNkJESUVsU0JNTVN0?=
 =?utf-8?B?WjNvNE0zMk85WWo3UEE5Yzl1bDhZajk2NFBRb3BYeWZyRTZlajVSSDU3emVP?=
 =?utf-8?Q?Fe91Tdp384B0H3cA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2c3c59-a1a9-4de2-4d38-08dee0ef7667
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:00:22.4427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKNa2KGXnz1i5ZGWD41Ljl7uqZumGaV/H/UU85AXlO2VOX2t0TDlDJbe0IAE3YPRIc0CRb9Qjl4MjRjKKrXUtQlKc7v6rtB/X4nrw4dGTYECmlAB8xez1VKdVJzOhoUn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9669
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_160028_178157_8A4EA8AD 
X-CRM114-Status: UNSURE (   7.39  )
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

From: Frank Li <Frank.Li@nxp.com>


On Wed, 01 Jul 2026 11:45:18 +0200, Max Merchel wrote:
> TQMa6x has board-information located in EEPROM at offset 0x20.
> Add necessary nodes and properties for nvmem cell.

Applied, thanks!

[1/1] ARM: dts: imx6qdl-tqma6: add nvmem-layout
      commit: aec8004c5478371d49e9be238d4d87abebb4c1b6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

