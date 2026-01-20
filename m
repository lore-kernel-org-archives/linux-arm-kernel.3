Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BD6D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3yyfePM0/CQv833aBogJQmImup6fwS32DcUSYXriMGQ=; b=xRccWiaoGqGHZbK3ZBH63tHGo3
	YvRBuJ6K8esUrspq6Rf6FwLsfH9+DQnSUVfhBv8aJ2vuN35eODXfZKZ5hID44pbzOtRDvK9/kgKuz
	bNdMmMwIjWHLrKujkTPfvLxaizyUPqTIWw0BVp6eI9ODWwkuC6vtxERDe/lFRyF1SAbO68iVJPBOW
	zUNl9pZx67cmRIW7+HTjLFN0gI784oJzQjslu58+l/NCEmXl4mBGOqSGC6r44sIzAed3+3DKuxxnN
	L4+IT1T9i2/HES0B7MzFpdDtBdn6LOcLWsIsWdVWXqU8/fsGQy+zNDOfdHpdarPQ7izP98Kqydvc6
	6Lt/m0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7HS-00000003TQ9-0RBB;
	Tue, 20 Jan 2026 08:40:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7HO-00000003TPh-3HoJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 08:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:Subject:Date:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3yyfePM0/CQv833aBogJQmImup6fwS32DcUSYXriMGQ=; b=cNZLAiC9laHG9h40wGu/8rgRaC
	I5BF9URbnM7QDJInh8Tsa6oDkYlk3zNhszfzzxUXjPZT7ReQ6zhYmlcnjUL8Sg+ZvhLxowvdM8y3K
	j0UZGLYbETjbjAvcz+E1PJs4pCR09OdLPvau2AVuRvPQL/24hLTQ+sCJ2SCBGUf1tBf+KKDKKn8dM
	VZsAHF0GLVJ1Wqfk5qfq8lvPTN0FWikAu+Rccl7tQbfOPKertCx1ZGsBPr7SeEf9fdnr90+RkE0F2
	jkpE9TO8uc657/FuezNPPZw+lnFGVdVA6jUItt8Ks6CftVGl8c/ak2QU2k+iX1ieE36e2WDqViHaO
	OsO3LJ/A==;
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7HL-0000000Dc3v-3HEj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 08:40:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrhyG3kcw80tjvx9xI9oi+slip9eVETVRMN9cXaV66uavQoAWGhrpgRWbj85biuFqAobH9fPB0iglVWgarr0YE1G/evSaCcOJLpQKnsXY9G1H0+NbLaHkuhyWE7GzNr0474FFfQTBFiv1hufYdHxTau1VeL8eqMFbucVnNhTCnmGm+UN14zj5eaOmM/eG0gjPpf56gJZnuH9dShRc/gk3s+4oKTOpFhx8y4UjzQiwkEpKYYitgEL0jwwpvHVWr9WRrq9/G5WHBAlTV+JQ8U/Q5SELux6wnJ7DB9O/r6nLmhLFLguFhfa4FxIFzN/wBAYUgmikJ4QYpUt5wJ76a3Ejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yyfePM0/CQv833aBogJQmImup6fwS32DcUSYXriMGQ=;
 b=lTqdO2Qum7E5worHj8s8w7QQHC7O450AAeoSiqiBTMZQdaf0FKj6QeS4FbguAllPM7dSxCrXK0I3O26bLydFxNBwONVbJW4RVw18ZOGpHra1cejhM4eA/TMQ7CFH67/PAXqZDkO1qYCChoxsDgXljMs0eCDPzuuRAYkAFwJsjKRqlw8elO+mXZ78Y++ZItMX4d+Tdn+UTQZVF0ijQvl8EgnaLUi1LAgYfvEMJnATKqBrLd9TkCnl7QHGYtPswI/l371htFL6pKz4mN0HeGrqt1xQ1tUlpOi/F63a6KDbC03+I4RKwDHdtwqQugwjEo4rLm47ijDclweAYXobVIKB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yyfePM0/CQv833aBogJQmImup6fwS32DcUSYXriMGQ=;
 b=iddE2A9M/8olh7iAmrdH0X8J+J3swMq4FBqmst+B9LgcbeNh8ri5zAP5yr10LJ4cvB53QA4Cq2JrX4SY3VLGmdfdwbMEGBoBo3dJNFc9y0un7LX9DzsCtWOIenWEgi7zHI6RGk2GGGzc1I8j++JcZgsnfRakh37+Ys2SIlA2IryNy/LqImrwhlvllv1xDkKL8CwnCH10Cuc+8nJcn4OA98e8hK3wO2wdk2L+EwuVoYYwJvpZafZHbVrBSgQSE765DqMTBcd6w2XG9VjQaoX2W8s7VC+Cy6aszm0ZvSNNubo/RuE8whBCyDBdd2TlOKsTRxNbUIVjxlIHIBj4xypEsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by AM0PR04MB7170.eurprd04.prod.outlook.com (2603:10a6:208:191::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:39:55 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9499.003; Tue, 20 Jan 2026
 08:39:55 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Tue, 20 Jan 2026 16:35:50 +0800
Subject: [PATCH] arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com>
X-B4-Tracking: v=1; b=H4sIAGU+b2kC/32MOw7CMBAFrxJtjdHuBoeEinsgitgxZIt8ZCPLK
 MrdcdJRgF41T5pZIDgvLsClWMC7KEGmMQMdCrB9Oz6dki4zMHKFxKjMScmQGq0iJ1U6JHs2tqp
 rgqzM3j0k7bnbPXMv4TX5916PtL0/QpFUXlVTp8lYIr6OaT7aaYAtE/mfylltdWmxQdRf6rquH
 8+62LbhAAAA
X-Change-ID: 20260120-b4-imx95-v2x-3e01c7bc6881
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|AM0PR04MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 799b8c4b-8787-46d1-7785-08de57ff7cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|376014|7416014|366016|1800799024|38350700014|921020|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QllHSlh6VGhOMlpPN0hzWVlSTVdpc283N0VRK3Z3anBmVTNpbXNCc2JBY2k0?=
 =?utf-8?B?Z3JIUjR3THhtdEwzK3dVVzNKQUFxWFFaMFNVRHdFQ25nNVdDNTJaWEZnMmNI?=
 =?utf-8?B?QTl5dVdVcmN6d2s3MWtPU04zUXZXY21oMDN2cDkzZnlHTnF3VHBXbXFuTmZ2?=
 =?utf-8?B?VVBManA3KzZYMjUzRlZOclM1b1RFbUVWMmhYbkFrYzBkN2lrbC9maEh5YWNj?=
 =?utf-8?B?dVNYRWJqMWxaWkluV0JuTktSUVRGRE93aDlUODZSZFFGSGNVR2Fjejhmc29O?=
 =?utf-8?B?SWJvOTBCZGdETmVHYW9Ia2JNMXN3ZXg4ZlF3Rkd1VUo2VVVtcFRGUGROOGVu?=
 =?utf-8?B?K2c5QzVCVnlubzl6d21CSldCZHAvbFJ5RGp6QVhHVnlLdlZBeHo5bXpDSy9W?=
 =?utf-8?B?NWtXelRORlh5UHBmYjFCZnhVNmRZNU5IeXZXSHVFdzh0T1N2VUU3Y2tpUUNq?=
 =?utf-8?B?T2VUc1pObVlHSTIyZURmWnVURm9naUEvOEdsRStmdU5Nbm42eG1aWjRGenZ1?=
 =?utf-8?B?cUFEVDBLWThhRHlaMlhhZklXYXp4aFV0MXdjQTlab2ZTWHArM3lOOE5menVa?=
 =?utf-8?B?SldEdGFLNllRZVZ0cVRlSGFQc0Ezd1R5ZVVJcHpOWFRjMDlLK0hDMHhvNDlw?=
 =?utf-8?B?aWlrZE1vZ1I4SDIxMkMrd2E3Ym1zN0NnSzVPU293RHVqZmhPZk81SER1RzQ3?=
 =?utf-8?B?MGd1Y29VVUs4U3B5MHQ3bGoramZUeVZlYnQ3OWppOWdMUFFONy9SR2hrY0lR?=
 =?utf-8?B?VlBKUEp1L2lITVphTTVyUnRLM3RIZDZVckVtTkM1OEo2dlFNWURONnpXQTBR?=
 =?utf-8?B?YzhrLzhWWURqRUMxenk1T0RkcldpZFQyS1BSbXExdEx6bDgrVUxYY3ZPVEQy?=
 =?utf-8?B?MnFLMlRGV1FWV2N5OVI2ZC9rbjU0UlFacHQ5ZFoxNHhPb05oVWRqN2QycWdL?=
 =?utf-8?B?dDE1K0xueGwrRzBOd3dFT3pYd0hoc1QzS0FKM3NhVGFTck1jTm9BZEVrSnFS?=
 =?utf-8?B?L2k3UXdoeG82eWVxRURHcndtRUlTeEVHRE9tVmJkN051Y0UwYWhiV3JyL0Nr?=
 =?utf-8?B?VGdqamlUK0lnZ1JYNzNUYmxZcHUwWmFvWUdyVFVvZXBmZXNJZXdXbHZWM0da?=
 =?utf-8?B?UFNSK2VqNnhWaVZLd29EUGJOTjUweTk3NzNGTnE1Um5sdDZjTDJ2UEI2RG5y?=
 =?utf-8?B?amRqRlNXNnpMOTRVRUFPYnhvZ1hYR2dYSDVXM1JBcXVBWmI4dUhLR08yd01z?=
 =?utf-8?B?Vi9mc1RTRUNIMFJISHpjZHVndE1lWStKd0l2dW1YSkx6aXJaRWxXWFB1M1Nm?=
 =?utf-8?B?c1liK3hWdmd5NTBSRmc1SWlUMEFDM3FBNkNvS3pTMW10UlhCaEgyQjdGNWJl?=
 =?utf-8?B?RXBEZ20vWXJQTHJhSzZiUmlHdXhtNkZxYjBmTTlCOW9FTUJzQUw2TnBiaEMx?=
 =?utf-8?B?cVRzRjB5Wlp3eHRCWE5ETEd4bGk2WDlpVE0wZStpQkxUYnBtS0hZWVFGbnIx?=
 =?utf-8?B?ajVkb0QvV3o3ZWw1L0ZhWnd2a0tDTExYZC9oNkh3SHNTMFlmbld5Qis3OFRS?=
 =?utf-8?B?SlczcDlxQ25EdEZETm9rWGx2cHRwTlRkejRZTy9NMnNWUkxwb3pDaEtFMnRx?=
 =?utf-8?B?d1c3a0JPT1RDZUFIQXVrSXJpc2VKQWJhZWY3YS9CV2IvaXNTbjg3YzBiZjIr?=
 =?utf-8?B?bUREVkNiaGNQNTB0aEUxeW8rVU5yb2xSdDZsWmk0eVBCWkYzdll3OVR1L0JD?=
 =?utf-8?B?ZWcvWCtsb0hwb3F3SSs2c1ZsR1FRRzBZK0NLb2lXNTdFZHdKNnV2NW50b1Zo?=
 =?utf-8?B?VEl3WDVKQ0hXNTlVVHkrV0F3K0RVak9lN2paRng3YlVvQnpCVzdqQnl1cEZp?=
 =?utf-8?B?OEcrd1ZZaVNweXpXWHpzcGdvOWlva3J3WXZCcXFQcEx0Zy8vd2VtcEJhdVdt?=
 =?utf-8?B?LzFaUi9rS1JSOGJxTGs2R09mRmQ4VFhYdjd4bjArV2g4TUwzNkNqVjFCaHlt?=
 =?utf-8?B?Sm80emswaG9rQjl1SFRhSlhLcml3Z2w4OHNoQUhsVVJWWXFFOU9TSjljdXg1?=
 =?utf-8?B?RXZuWnJGWjZhUFg0OGt4Tm14YnhjUzNKWVZTTTQzZm1VYU9FdWdXTC9oOGto?=
 =?utf-8?B?c1VITVlacG9PS0xuM290RXFCR2paUU4yN2Fka2ZGbkdJQk10UkhtQzRvVjZS?=
 =?utf-8?Q?JgFckeJwvyIRF/UbVJiPYCVfFa1zKCuT6Bl+Xrw2ihFb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(7416014)(366016)(1800799024)(38350700014)(921020)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnpPNkMrR2hRN1Jyd0VhZWJTWVEzVmxERzVSTzZrSEYwYmY0LzRscVFob2w4?=
 =?utf-8?B?aUdVQzY5UGZGQjNMRHh0azNBYnBaTGp1cHpUdWRUQno4REV5NU5SR0pWdGJ2?=
 =?utf-8?B?T1NVN1NNbGRaL1ZUeGNaM0xQOHU2a1lxelFKWkxYMDFiK2hvTGtBdlZmNGRZ?=
 =?utf-8?B?ZEhSc1g2UUNUeGtxRDBUeXZua2pzbDBORFB6WUxMdGw4ZTl1TUhXbk9NTlAr?=
 =?utf-8?B?c3ByZHB3V3lKOWY5ZW90dy84SHQ1eE14NFBwRlhoT2M5Z0V3L1VpcWhsUjR2?=
 =?utf-8?B?NDQ4UmZoL3R1OGZuK211VzhlcXR0NWlxYTd6Y2s1REFNWEFTN3l1QWxrQ25S?=
 =?utf-8?B?b1ZvbGhyWTVlWUVzcUU3dUNFOHg5eVNjM21oOHF2RnRGWjN2cjlTSFVoN1Ux?=
 =?utf-8?B?QVg1OWNNSEdRZms3empuS3NlMVpGT2tnUmpEbG9DYisyY0J5TEJYYS9YOGFP?=
 =?utf-8?B?MW43c2J3TGtjQlg1ckZTbzlWM0RjMEhaOTBrc2JZR05lMlVUZlVrQ3hPbGhP?=
 =?utf-8?B?bzZnVzZUSmdrMVNFaCtad1RDVWdscExxRTFPMldxOVRFQXF1UnVTUldubVFR?=
 =?utf-8?B?ZE1ZTS9abCt1MVJ2eWg2cVNjY1kwVW4yRXpiRXlid052Z1d2NnEvM1l1d3Bx?=
 =?utf-8?B?UnQ4U2V1Q1JFMk8va2lQZVJ5TS9Zd0JOVWxqV2pWL2VuSDBlTlNGUjEwRTkv?=
 =?utf-8?B?MEJQc0JxQWk1OFdSOUptc1RMcnJNbTJSbzVOcjYyNFdva2llSEVvNW5VNGdG?=
 =?utf-8?B?b3Jnb2Qyd1Z1dThrNUNROVVKbDJHaS9ld3AwMlB5STFWUW85WDkzUDk2VHd1?=
 =?utf-8?B?MlR6Y0VBTjZnanZWSHQyRlNOUWJFdGlQeURkVnE1RC9uMSs3WXV3UjI0NGFm?=
 =?utf-8?B?QTVsWkdyd3F3NEdSdFZuQVhDQWRsU2hpWVpiVlZldWNXcXppYzlnT3ZyUzc2?=
 =?utf-8?B?allZK3NjRzk0UE1LdWE2cmQrdFJsWHp5MTlNR2RKMUlEdXpiSldyVlg5NzJD?=
 =?utf-8?B?MEtTekdmNzZpdllSTlU0QXFHbldVMDJtWjlvcTRyUTNtTVliVkwzQi9ZN21H?=
 =?utf-8?B?MG1EbDBxUHhBOW52dVZQS01XdE9naGxCUVVhVlZSQmtDb0ZGUlBtaUZtVThl?=
 =?utf-8?B?dnk2aTVtSkFjSHNITE9oWUNCVXBRbDlTbUNWZlhNdUdoR1liRWcxSitKa3Vp?=
 =?utf-8?B?L3NVRDEyakdZbCs3R3ROTDd2NFArSnhQWFlPQTAyMDBXbVg3NEpkQzc3ZWJk?=
 =?utf-8?B?ajBRZ3BNdDMwZE1kZmlPWEd2SlRjbUR2UkM4MTJuOFpmR1BpZXRtMHFJcjEz?=
 =?utf-8?B?azNUb0hseVNhZXJUZVFuMFR0aG9PditwUFpLZEtlbkIvWk5QMlc2Nk1uSWs5?=
 =?utf-8?B?UWhHYXgyZHJRRFoxT0Zsd0o1c1UvMXE4TWEwTnFtSW1XUnlpcVpIMjNWODRJ?=
 =?utf-8?B?cUZpa0NRSDJLYTdPYVFvVGxMTnJNZ1BVaFVLT2JwT3FWSUttWlBPZWtLS0Mz?=
 =?utf-8?B?UThWZlI2TUcxU1RBTlRWK2VkemRzRytqK1pzL1NKdGUvYThQd04wRXdkTm5P?=
 =?utf-8?B?bTE1d015amFPR3grcGZ2UUhlYnBRbnlyN2NWZjdXOTJ4VFBnSEpaWFlmVEt3?=
 =?utf-8?B?Q0NVRGlVcEJHM2pzRlI4ZXlwMzBMS1YvU295RGprNFRGMFMwQjFTa0loR1Z6?=
 =?utf-8?B?QzN6VTZRcUVjdjRUTXBVeXRPQXpaZitIakdLeXV5OXZoS2JlcytxZ3ZFR2p5?=
 =?utf-8?B?Y2tZU2I0K2ZwNlBySCtGNWRRNGkwM1UxV1dOb0FqNjRhclVjMHNlZTQwdG5h?=
 =?utf-8?B?a3FVZFBjOG1meTVpK2NvV2ZyblV2ZjI0a1pTN1RLWU5xU3BrMlFNYWlLUUZD?=
 =?utf-8?B?N1Z6RjB5L3ZkbHlEK1JhVlZENnBtMDd1THZzWW1vajd3OUJCK0tONGc1TG5L?=
 =?utf-8?B?eElVL2doS0VJdjBkQnF5NDJKUTFkVHF6bUpLZHNFbmFnSHJKS2lBWWpWYlE1?=
 =?utf-8?B?VjhKZEFzSTRIbG54R3FhbVBrQjBEYkVEd0xWZDJnbmFuSmZKZWhOUXo5MFgy?=
 =?utf-8?B?QTgzb1VFcnBVQ0t0SXVZUnluZTNCZ0JueVN5dTQrVlZkREtWcmQvWER5K01j?=
 =?utf-8?B?UmZ2SUl6VjhJTTF6ZVk2VkxjclVBM2dkcmlyMGdqT2QzQXVYL3BkYnc0Nmxm?=
 =?utf-8?B?eGdMazBCY0dNUU9SUDFWa20weCs3WXdTTjIvYkdTUnE2d0s0cGdaM1htVllV?=
 =?utf-8?B?QnFoUGdIOThDRkNPUmZlZWVvWko2TEQ3NFYxdW5tWC9qN2E4TjdmWEgrSFlK?=
 =?utf-8?Q?HHejqt7+YkWWCI0IGK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799b8c4b-8787-46d1-7785-08de57ff7cd4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:39:55.6564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zaj8NJY3HnCtAlLlUBZBe0EfqV/ZyUqvN/wLcx7fjnqFuqNyd19j5SIyqXUY5GRd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_083959_922301_6CAEBDAF 
X-CRM114-Status: UNSURE (   9.28  )
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

Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
use by V2X (Vehicle-to-Everything) fast hash operations.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c889fc7c1096d0e36f31ae118d2a982..24d02aa18b2f480bbffdc30bc41c658fb3aaf67a 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -631,6 +631,7 @@ edma2: dma-controller@42000000 {
 				reg = <0x42000000 0x210000>;
 				#dma-cells = <3>;
 				dma-channels = <64>;
+				dma-channel-mask = <0x3>;
 				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,

---
base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
change-id: 20260120-b4-imx95-v2x-3e01c7bc6881

Best regards,
-- 
Joy Zou <joy.zou@nxp.com>


