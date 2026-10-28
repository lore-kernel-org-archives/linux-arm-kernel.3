Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD2A606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HP2ZG8i2;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XQ8VE8Bi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wQC69tHW2ebHrN5t+L0bbZwYFEvRaf7gD+4+TQfEUjg=; b=HP2ZG8i2cb1TzFODeKrMnl3RcN
	N4EJjERxV5YFOvyJjUSL2buBDUd8dVMGY6ecQ5QsyVld7Gdpr18Sp6QpnTYYFI5twho587V2YpOB8
	C/iP1q1qB2id2Y0UPxz9EQFOCtI+UkMHusAS8Fx4gay9SHUKhF+NOsr0p6J2zRz2wPBMgMa1R23K5
	NTFwooSMsB0op2HDyWgLuIvQh9zfhN1My18PKu7pCYFo+eupMRqP1sxytStArg8hsU95zd5rcNa87
	H7F698gabdWCx+mAZx742mEOMDM5HzousC9Ppu6pzh7b0IyTuRIxGYS7JKTXri5d74E7hDurZebDm
	cui96XmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8jM-00000007m8I-0oJ1;
	Wed, 28 Oct 2026 18:50:36 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8jI-00000007m7X-0D2o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 18:50:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vppkETLkd8QMs0XGk6KYJUOSFB6s5PurZPy69lYFybMLIBsJExt+Pm2tUnPcQgqT+XWMYyKWI/LxA6Id4jameCCt3FtndB9/Tyr1dgGbsRyxIPgkrPzf6xp70MjuUbwIviroROX4ahsR/yiXN+T5RSxfvwbudcGxeH4VlS7K9hhKmmUiitxSwSZhRr8VDvdcRk6nr+C7K0rQqGRlw98nyfe0MgMkis/nZ8nCufyT9FWyLemC8H/+sMw9ppnydR3H0QxOf/cLzc25rN6wg5cIrcBL90sN+fw4rP/zTKuEQyE+B174xl2ktWQED08v58ZrIi4jOAIJaSya9MnZvl/Njw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQC69tHW2ebHrN5t+L0bbZwYFEvRaf7gD+4+TQfEUjg=;
 b=IggvYJEaBTSu1L7O4yYq/FgGZjhsDzTz+DBIO0PqD2FBvPZg7n6tYvaKIuGxc9HE/uUTUm5rkJYzw2YAn24U3+ByLvQWtpDX48cG6pVUEeayOTT6IrXUrJgQjaOBj1OgcNrgA1xnd6izo4REFbZGlmWwGzV+XJcjyfnmDcCDvYFyvSqIEjt/gAZsxKDTllB+hNtWfLbqR3VzcA4E3Zr3oTe2MN4oIVfHApieNfnznvIIeNcijuQkdNDVYHKD3tYQITvbH1pGgBqXMD4y2T/7zq/g9NgVzPRoAf60Ra5ggKUUFQ7sA7QVHtJEMq0pRxfqpFIU8WHswfQGNxBS18McqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQC69tHW2ebHrN5t+L0bbZwYFEvRaf7gD+4+TQfEUjg=;
 b=XQ8VE8BiPOfLP4VjjzfXdUk4EyBRqOv5cRJW57Oy1hU5GWl8cHqOMKxdVAbsVmGgumMG9O1EzWJ/ZdMejVw+XnwKYaUEYKX2f5ze7UUFHM4xOqfjfsGTteKgBrfOmNSZFvUths32tf0/57ywMhrxLboTYv1Al98Yl2Z0q7O7myOCLdtmONhzRbEbaKVAAttQUzjzU1K4wASxhxZH8ZSz5K9LlNJlg18hkP9yDWXWdEQi8SS2ayWOw5teVWpI20EAWqZPz9Z3rXVViDeOAyqCL2h75U1tgeMSQx3hnAPyqsbRQqEFbCDfc/oPwu2IDyHZCvFJnTqKVcoffHoBHwhNPg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8134.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 18:50:26 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 18:50:26 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joseph Guo <qijian.guo@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx95-19x19-frdm-pro: add boot phase properties
Date: Wed, 28 Oct 2026 14:50:17 -0400
Message-ID: <179321338729.1646969.1488310290125309307.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012-bootph-frdm-imx95-pro-v1-1-6757c5f04a17@nxp.com>
References: <20261012-bootph-frdm-imx95-pro-v1-1-6757c5f04a17@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba9202e-5d50-4a0f-79d1-08df35245496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|19092799006|56012099006|11063799006|261009223027099003|261022075727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: h8T8HgrVKamtqvO2sqw+IGh+P7X7otlHBvu2Dk34s8F89Zps6UxbKfsIbGh4gXsruBae6npVj8sTdGl8GfhUePSu9yYrX5Kz0B5A6mp2Mqg3gObKjQ8HxqUidJtBdgK7MolmM2x8pnxp87B4Aps9b9tgMRycRJnY+Kyfv1Uzr0OiV+x9HubrXCh+uIiFc1aybT1K9U7uXRySKOuQUYaPY+F6TccKNIZko1qb27/1IsXh8eyQ4vHQHaPXqQKI25cl2aSihwC7H1Uf5aevdp0lKUmsts/M04MGnupsF2YrI3aFRMK6RiykJs9SeQgZYALe3/7lIxgDuB0sAi4V3E1EwUJl6+PG1+2qkzYRhm9WxBwJzsBy1mz6+hFpVKD9owBVvw3tAPx82ubA8MdIuruHb6imBRezr/lRzzII3z1ZG1QpbgKbRNA/aF4NDWr57CH5+S/tmDpq6rL5Z6NAvDgQBxFCUm60q7bwyAy3vUngF8yCyPQ0njmNA+zbGrThyoR0WT5YUdfNr7jGWDg1e7DaYPZTJYKD0Wz4gwKcLf1z8rmXgJXjoe7IE+U0UU54etBAe5lW7EdXaKQIKWUtE6CZvEZmF2QtycNe7AjLsrGTxsBnHEyqVilweyR4EfBPTQ4hsBfjybyb4TDau8LWgui/Z9htBzyEAFH6Okn3KD6aadQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(19092799006)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djl6dHNvcU1MSXNveG1GbHpIMk01aXVqSUdiMkMzRXd2Nnl4ZXBpT3VveVNM?=
 =?utf-8?B?cHpKMUpDZlR0TmZjdDQzMnNZdE9IVTIrS3pXd2M0U1h2MCtOZGNEMXc3UWhV?=
 =?utf-8?B?d1R5ZXhpSkpvbmlpSU0wdjNwYlpXcjlNRFBGU2NXLzhxWDVYNEE5bWJTbUFM?=
 =?utf-8?B?QmpiU1NtVmpKWXhKejBhRHZNQ25WOUlHTTYxQ00zMkRpZGREOXc2cmdlYnVk?=
 =?utf-8?B?ZXEwMGhzd2gxdFRPbG9OMVF2YkppcjhQbUhNcFA0M244cmVtTi8vZzMrZm9S?=
 =?utf-8?B?dFMzSGg5M2RNYlJ3SnduS2crM3R0SXhtN05MZ29JSXFoRHNHdlJINW9WRW9K?=
 =?utf-8?B?MGpPZENKU2lDZ1VBUkZOQWJoVSs5SGRFcjFlRzI3eGFvdFdNOTJWTGl2aDBU?=
 =?utf-8?B?QXlLSEZjWEg0YXNSdGQ2dURmK21lb25vckN5RFBWRWZtamY4S2ZRZFNIdk93?=
 =?utf-8?B?Q2cxMGVhU25hQ2ZtdDE2NS9HTUpYamJHY0pOb1hrNGpHZnpxVmVBRStJd0Fs?=
 =?utf-8?B?TThxUGZqaDZUdk1nT1R1UUhvZlhhSlhFV1ljbHhGUnlVZjB3Z0NSUG5MRWRh?=
 =?utf-8?B?Y3NTS05WUGhXRk1MZjNCQ2RkUllmaGU3akw3eDdpYlZveEVEaVoxbmZEUFpq?=
 =?utf-8?B?OFJXc0FWU1R4cVc5a3RpOXZWU2RNemVzVUtCWVV1b2l2S0lkNnBJUEZTTDBP?=
 =?utf-8?B?NWhHa0RmM0QzZUhzemhwaE4yWmUwYkVoYVgrcGFrci9PeEF4alVSWFVyYmlm?=
 =?utf-8?B?NWwyWjFVRm9wRmQyU2JmK0dlbXlQc1hGM1JwaGhva3haeVBvNXRjNE5pMFpH?=
 =?utf-8?B?clNkZnJxRDNnR2pENmRxV3d4Wkh5bksvQ2Z2TVpJSU5TRU4rcmxHWFpVQ3JQ?=
 =?utf-8?B?YXQ5RjJjUWUzVFBLTVZEeDJPQmF1THN3bGc0U2QrUWI4Qks2NlJ1ck5Fb2NS?=
 =?utf-8?B?SVBnYU11TU1rajJzdjhrQ1BDS2tmQ21aQjZjbHBBN3R4OXh3bEwzL3Y2Q0Nq?=
 =?utf-8?B?OVcyUHkvTURTZ0FJa2dmUndVT2JBaWVQZnl0bVB1TWUwV1BHa2prWjVySDd4?=
 =?utf-8?B?OUwwMVRFcFgvMyt0V1BvMlN1QXU5K0U5MUhpekpKSS91cm9Yd3pyZzhUZTJ1?=
 =?utf-8?B?aVJJdWNhRVBZY1BxTnA2NkRGSThEK0JUQ0NJNnlYSUN2QXJOTGJTVG9IeUhF?=
 =?utf-8?B?eW1xcUczZlptUFNWZ242dXhuaUsrS2JiMEdYV2tzSFVBUWU2aWFFd0UrN1ds?=
 =?utf-8?B?N0dPa043ZUtEZHAxa3hwak16eVJTVWNjS2ltQ2k3MjF2eTlKdHpJUzFxeUI1?=
 =?utf-8?B?YVdVclJsdEg2dWlWTGtMb1ZscWYwbGU5N3VhcnY2N1M2V3N1VEVhVGdkR3RZ?=
 =?utf-8?B?d2lqWHBMa1lVUTVYdVJvS1RLRUlsWllRcmlmTHJsWmdoYlVHNjAvMHJVTFdZ?=
 =?utf-8?B?d3pIM2owY0dvTDJRaUZiaVh1aHlVN0pZQ2pOM3Njc1FXT0lRekRDUWd2WTFx?=
 =?utf-8?B?d01kaFJsNUVlL2xPNC9wSlR2K2ZGUnViU0ZsS0l6WFk1Zzd2QU5nNWV0WG1O?=
 =?utf-8?B?ZGM1bHVuTkxoUXRMcjRpbU5tYTNwcVM2NnN3cXhqUFhGYnRVNmtkN2pzQTd0?=
 =?utf-8?B?dHRObFBxYTZNQkNPaUZEOEFHSmM5UjFRV2tJd0grd3F1UlZMU3VacFY2VzB1?=
 =?utf-8?B?V21vQVd1aEVmRkhLNHhxL3pMKzlJOEZXNExjNVMraHJlY0xsQm1SY3VNNHdJ?=
 =?utf-8?B?blJSWnpJcElHUW5vT1JHR2loa1c1R1d2V1RQeXNiWEJYZXZsTGRzLzNvZHBh?=
 =?utf-8?B?dWN2N0FEdkVSYUphQ0JTUC9jM0hsaGszSCtMTldTbk9JdGVKcHM3Rm41cnFi?=
 =?utf-8?B?Ti8yaVViWTBHeGxnVm9IMnFTMVp5b1BjN2RCdENPdTE5dE5WRW9tN1pObHhE?=
 =?utf-8?B?RmdGMDl3UGFLL0VZc3UyNVcwRGFpZitTb2FnUllvYi9VR3N0aERwTWxiYm93?=
 =?utf-8?B?Q01OZHhSWnlTTUsxS1lPeXJDanlYWnliRzcwSjVDVGJSNlNBdXptVG41c1ZE?=
 =?utf-8?B?enQ0ZUJ6ZzFuOER6azV3RmQvZW9IZW00VDBnVHNuU1piMEJpa0lodk80QnBC?=
 =?utf-8?B?R3g1dnI0OXJhdmx1ZjRtRWhWU2JVM2VzY1U4Z1Y3TVhEOW13ZmFYbUtJVTRJ?=
 =?utf-8?B?TjZDRjJueW92a29EbUxOWnFoQUR2cVllMExDcCtWL1VMTjNnTFlLSXptVXZu?=
 =?utf-8?B?bWdNakRRa3loK1hGTTJsMHNHekRIVVF1MWRKQitTbU1CT3JhRDdZTFZKUWVY?=
 =?utf-8?B?cXVROXFEdXUrU3lxdHhFazFheFFhdGcwaWRuYnFGb29hdnNtZ1BlY252M0lD?=
 =?utf-8?Q?XNWgRs81zTsrwZy4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba9202e-5d50-4a0f-79d1-08df35245496
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 18:50:26.5372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ow3ZyPzxKom9HTn2+z7J3FftkXrg1pL+4Ag3QL6Sodv7OkDRXvFpuDGHf+KY1zjV6MDB4ubCDs2k/YFpnUClx6qY6aJaSsw2Tbjty6DnkbDgXbArLYeCN4KnvN3yWbR2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_115032_097204_4B201C05 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Mon, 12 Oct 2026 15:54:06 +0900, Joseph Guo (OSS) wrote:
> Add boot phase properties to essential resources during boot phase.
>
> FRDM-IMX95-PRO need UART, SD-Card, eMMC access during boot process.

Applied to imx/dt64-intend, will see in linux-next after v7.4-rc1,
thanks

[1/1] arm64: dts: imx95-19x19-frdm-pro: add boot phase properties
      commit: 68bc12a7621c32359d9085a271a8d078aeec89e0

Best regards,
--
Frank Li <Frank.Li@nxp.com>

