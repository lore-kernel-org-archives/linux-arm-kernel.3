Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E285C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjqHsW+CVS3K66cXp0sSPpp7NetGIiJKSSktrWtvRXo=; b=F51cWNaftH2jBp85t80xE46u3I
	vlWQHL9hqiJDWdYp3HKNWILliDzn03H6RXK/Mk3B3mrDANDvDxm8nR5xgKeM4Y6rd+RHodfJf8XPe
	etgpbTfTeZcl5reLRwAsORooPTVLIBgeTODBzGA3q9vRhUwlCDwFHMYl04xmvnXHUYHnmXkqkEBWy
	akfCQvrVUX0vigQTvui8y/5vo9WkvUNAJkA2Nwe0hMYbbvMjLqMe2XrDmQpRUQ92REIoxRq3mmZlf
	oXsnlzsfHGpl3Ydc6jomLbBy9OeBkijgnzI4xxfrh1u9kBHg1tjdJiYGVUIIFgvdMFOSP4jNhf1EY
	ADU1dmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje8X-0000000CNwS-3ZX7;
	Tue, 14 Jul 2026 14:29:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje8U-0000000CNvh-0qLP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 14:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LjqHsW+CVS3K66cXp0sSPpp7NetGIiJKSSktrWtvRXo=; b=EbCssVKL/Mud1a8OtwJNQngz9p
	fZqFMo/Ye93V7Km4YVExPbm9SotIWygAKiLUeHcJP0YhBeyA449eib5V26lDnNkOTeB2AkND+aW+2
	hnD4I4FmQOZFdHZFxVw+gKeXJuFVKKHgmHTKgcw+WMGKx3pU/Gnu13IZm2sgjpVdVtKL80zV5s5W1
	xX/uPDWYkRHtSW1K5OuYta92yhCKwj0w9n6GMxyURkGtxO4FvB7UlrFqWfoliVgejYiRI2eD7kKvl
	zJRVj4W5b+SpR/pgd74MGejmaUJLJxgAQtMlNdEmzmvwVtyimWSzq5quvCmHZlnY7adFaHoRzayI8
	Yr9smXXQ==;
Received: from mail-francecentralazon11013048.outbound.protection.outlook.com ([40.107.162.48] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wje8Q-0000000CaxN-39CE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 14:29:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQ/JkD6M142LoBxnGKlZAJns+7pHEQnpPhF3rjmhnKxfRwdkQ0zC1BAqWHa5beyB6YQEPccz5g6HmqCujuQto7efMnlt+B4S11ziolMbvSZsLOm5nRRli88JQ5pO4QArbg7cxnzhVTRqBaTM4ttfgPki21DjOAY18P6fL/YpDTSFylLgLAoWOUEW2ciLE6Y/bPOM6ScKg9c6B23xToVhkDi4C4C6ghio7iRBAHxnZj9lG8bO8D7cipz6onmj2Vsf8qirelnouVf3I7IiCpWutBJNSzvRomrf0nA6buolKHTitRDHUykAWtfbrSO8CJLEnbCtbbdlC7nqVAViFkSR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjqHsW+CVS3K66cXp0sSPpp7NetGIiJKSSktrWtvRXo=;
 b=LyGJ6uR2RnKI2LEOh+erTCAy9qcTFG7lEzQwxFAo5haC6DcTf7jfI7GdYZQ7xmrHpaESIksd/Zl61uv9MFuZ6bCFuBXsozXaFO+K/TnaG8W6E/QgRJkXIBGbvN65L4k0t88M9Y2P3wqiUp/Fnd14pzHzUIfQiB6Ng7bg9HqTb7Vq0g4Lq2ljrk+WcVmcrUB+9o7Hck3TelQVbBjuD2/83xQOvQwln4xUmY5gX/mizf+jxvUp24V2qv7jbdl+S9NxERrfVZZuH3Cr0inxz8DyVO8Orqe0HNm1pylJx4ilO+h7fFzMU6flOQNSlU2UdVlT/MAHsfXNYLU3b92cys3RSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjqHsW+CVS3K66cXp0sSPpp7NetGIiJKSSktrWtvRXo=;
 b=EW/egSEuH/C8kaOJ7R9tvdkKn/rFH4QT8y/ZFD8fpG1n+QXFYvNLjH+qsz9J9CJQI665dU9G79Z+ZJo146r3WuOoCcNSabdp6tm4RBvnHot8l2LreN2CB7icPVmvZIMycmM7O0gzQv8uo2YnpOACT7ltmo1n5BrL7ltRrYnxHjx8POj7GZUwHdUS+4T2P8F9cKSnt+hwE2EI7qL217pK7OLpjGIalVws7zLrYdhpzCay60NC2rbRZdFEPr3fUbR4cn0yFOpf2UbWZPlMmUbC6LH+W50X9dRfa+sQtBJEoCS9vLR6ZYt3E5sfXo2YP+9jWLqeuVGjK4ZCCzi/sppZxw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB7863.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 14:29:13 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%5]) with mapi id 15.21.0181.016; Tue, 14 Jul 2026
 14:29:12 +0000
From: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Shenwei Wang (OSS)"
	<shenwei.wang@oss.nxp.com>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com"
	<b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Topic: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Index: AQHdE50j7LLGaX510EmKvp6m+f7/aA==
Date: Tue, 14 Jul 2026 14:29:12 +0000
Message-ID: <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com> <alUdg9iTysXCFUa5@p14s>
In-Reply-To: <alUdg9iTysXCFUa5@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS8PR04MB7863:EE_
x-ms-office365-filtering-correlation-id: dceebb36-d7e2-4cca-48a2-08dee1b4464f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|22082099003|18002099003|11063799006|4143699003|3023799007|38070700021|56012099006|6133799003;
x-microsoft-antispam-message-info: 9ILGyy/O76ATxleKo7CGe58xZ00drTRr6te01+5yklHwL/vElfi5a6UwThmVqzPr0+AN6HAaHE4V7Uc68lNM5neDcuE4Qogyw52fUIXpHIzayOPHfYJo65IzCHQg6YAsOFi4EB6chTLtMVng/myw9oekOyoPZ09xuGI2l5Kp0f5Q8Ty8r9MPzSdZP4WkBuuaW/tayzLXh8Hdnt2/5mydW2vA6Yju/sacCeBvezN8twg5CggxXAXFhBUD7Nuhv72sVpjTf0KI1qtXaYojcIG8s2RDG8uyoz4jGt1FqXXS8MLiCetBPKmAH6d44ZIwMKSxOAIatnlYGtQvf1KDT6BageGTZLOVicr7bvXQDsqEvSuNRGkb/pCaVpbP4UqEbVOPEuDD1NkY8b6fT5WXiSu86Ckfr3nQevTYLkGfUQcpW66je9F9NQOw8AqApPl8B5LkUrtKYVlFWPvTaQxpw55w5f2SnsYHV3NawAFyqXDRk6iOhionRw8w+lR0rDEB3KVr1CRS2NyFWP/qBhEv42BkFUgZCCbMCnBpG1rCImmDQQwR9J5mvqXoOJ0xVAl7fBxcqToL9HMfbIkX7TZ5WWUq1JzdKqmVXWqA/QXEeIbXpbzWtzLSqH6k1M8maZRVYvOfZzzprAvtnPiJY8Zo7XLnd/DRMkiiuCT1KaOvCHpKw59o/pk3zL9LB2QJAL53qGCnC2WWXelpzC5Dncz6vklWp/KQHSgGEBoVsCG7KM+lgRI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(3023799007)(38070700021)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AHGFrX7cSabtvLulIBpsEtXYc4MtuSa9M2+KEwbN3o4n7L24Or8cQyS4xb5B?=
 =?us-ascii?Q?DOauYcrevySS9k/Lh4KgHBh0Y+eouvn3dzpepwKOcz1tIrje+rLZDs2JEPCL?=
 =?us-ascii?Q?fs5CSWYwi5GHokaPKUEvYJoayfT1zXQ51BaaKEatxcCV4lWidNokroxnJrPH?=
 =?us-ascii?Q?SX5LQpUi1oyfxhy9RB4a2J58WR7vVMGwbwx5pQv4vKkWL/WrF1aV8uZFe473?=
 =?us-ascii?Q?eT/Eu/bWakDwdymp4e+mZqiBZf2v++Vu5mITuzKeBe3DnDKOci2Aste4Bc4B?=
 =?us-ascii?Q?eekHmbAIHOx5EclL4KPM5/F3LlzOjach+axhHyrakqEmITUhyhRPG7+ikYYz?=
 =?us-ascii?Q?YSoDiI1yrtwzwS3fgw8FvKm5nhSXUa+zm3edZwjNb6C4ZhT4gfhUOR1xmpq/?=
 =?us-ascii?Q?ZEpe7gQmrVnTMwG7EpoVpm2LhQe6Uagttj6eNTXWmd0K6HITeWph4u44OcQ5?=
 =?us-ascii?Q?VYGnSaaq8QAgO2kwsO3LXLgiKYmuwVVcuB7ZNkWBGi2a3sZRqIC5piU7idfk?=
 =?us-ascii?Q?FFP2W67kOdSPTFIdX7gB7MGUUsdmvwBYJMt6vEU0V27vNGL/Fcf2hA9bWE8M?=
 =?us-ascii?Q?5uPcGXlbprFLyXy4QCqXpWjrQbJEWVJYtU3wcRI+EHXf2XfGkhi8W/pFDpUE?=
 =?us-ascii?Q?1E0HUlEVMcuuTI2AeCpvW6tloFVpENAbHCmRXLquwAoOfw7jw3orvbej6hDX?=
 =?us-ascii?Q?Q93fSKz+8TRqv71XdrEKar6xmqalQb6cg6Zh9/86Hps3Tl95VJXrY684tWQt?=
 =?us-ascii?Q?2pYtmfUNTduZI6XkVzPzyM7bQFwy4/iLbNP08XavWCL6+bLKicN/00EQnEdK?=
 =?us-ascii?Q?aoo0xEta57I0K9Qga6lWbqiONSHw9bLmMsmUB3r/U3ag3ib+w8wuf4jcQiZn?=
 =?us-ascii?Q?mJe7x53cddCu1b4i1w31wdjjkIINlT7cIz0uS0oEY56qbvsW9aXkH8WfV2MY?=
 =?us-ascii?Q?C8HKI9YZcSZBvfTmol2CB1Ve4gYsCzJmj/gMREJyFDfbaJ/0SLk7UfG7klzh?=
 =?us-ascii?Q?XFXMpUSYqwzm/xauCDtDgZa69rFLhrZYqF3yzkletjVMcaviB6opk1reApml?=
 =?us-ascii?Q?c1Pal1TTvskV9HThAPC4BtByfQmNP8r1gooe/8QuA5voMonLF6QxElWHko4b?=
 =?us-ascii?Q?Cv4dGGAFUa1aUlw68ojmjCrNBaGC/QTHZbR37IvPnUxLdf/hu9L78BSvV6WH?=
 =?us-ascii?Q?CLXeTjRmhGSfTzFF7nCoXN02NrGQ3EiTmrrVpz3tGHqdQ0qUYGv0Ut1F4y/x?=
 =?us-ascii?Q?nf4o/mdNOFnbQomDNi5UdneJLvuvtOLvT1x+wCL+yhrhHvg0W4P5ZP5K1Npw?=
 =?us-ascii?Q?VqTILN1d1hn0M/vuk0ZFRMKlzT+gU+ZDwn9zVr7epYCIys/DchaykOW955Vm?=
 =?us-ascii?Q?Clg9+u5tNnA0i8iTKvHOdBrXSWo9a/nob3SDxRw39QoslzD9MT9YrwPQsGHr?=
 =?us-ascii?Q?K4dwoxLt28cE8Q+EJej2BsZB3Vz5fvXM+c7e1E3Dvg+s2K1so/Gh0bwSf9YO?=
 =?us-ascii?Q?Q/0YiNWinTxAhnHiKyg2Ahf6CLbMuaahp85w3b8mT0s7sOtBbZ/ImFHwkxny?=
 =?us-ascii?Q?dC68sPcVW3AurrMnHVCAnZPI9CVLVZoqPeZGKMdZ10J7Vr6R/Qz4koWFW1rb?=
 =?us-ascii?Q?TEILbQH60Ytg4f3IqpXtgrkbVh5/2Nj1N/xAS7z2aJow6Lni+BMEcbgJXGi+?=
 =?us-ascii?Q?gmjgHBZxSuVXarR1eT65jBMMEuWKwxZd0uGtmXyz83xpCZfuINqVTHHoc7iJ?=
 =?us-ascii?Q?/IYuAeHH+Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dceebb36-d7e2-4cca-48a2-08dee1b4464f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 14:29:12.3018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MAtlC4+Zl3WzxkGc/fTiBfeJghCgUU63BVnz9EJthUBJ/w/hQQGwORzYPTI7cZjwDfZF3KLLI29WkcbbUtrwRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_152922_938155_9E08EB8A 
X-CRM114-Status: GOOD (  27.33  )
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



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Monday, July 13, 2026 12:17 PM
> To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzyszto=
f
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hau=
er
> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> <andrew@lunn.ch>
> Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver ov=
er rpmsg
> bus
>=20
> On Thu, Jun 25, 2026 at 10:54:26AM -0500, Shenwei Wang wrote:
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Describes the gpio rpmsg transport protocol over the rpmsg bus between
> > the remote system and Linux.
> >
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  Documentation/driver-api/gpio/gpio-rpmsg.rst | 271 +++++++++++++++++++
> >  Documentation/driver-api/gpio/index.rst      |   1 +
> >  2 files changed, 272 insertions(+)
> >  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> >
> > diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > new file mode 100644
> > index 000000000000..7d351ff0adb0
> > --- /dev/null
> > +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > @@ -0,0 +1,271 @@
> > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +GPIO RPMSG (Remote Processor Messaging) Protocol
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The GPIO RPMSG transport protocol is used for communication and
> > +interaction with GPIO controllers on remote processors via the RPMSG b=
us.
> > +
> > +Message Format
> > +--------------
> > +
> > +The RPMSG message consists of a 8-byte packet with the following layou=
t:
> > +
> > +.. code-block:: none
> > +
> > +   +------+------+------+------+------+------+------+------+
> > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > +   |     cmd     |    line     |           value           |
> > +   +------+------+------+------+------+------+------+------+
> > +
> > +- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
> > +
> > +- **line**: The GPIO line (pin) index of the port.
>=20
> Here and throughout, please remove any mention of 'port'.  This is handle=
d by the
> endpoint device, i.e one GPIO controller (port) per endpoint.
>=20
> > +
> > +- **value**: See details in the command description below.
> > +
> > +
> > +GPIO Commands
> > +-------------
> > +
> > +Commands are specified in the **Cmd** field.
> > +
> > +The SEND message is always sent from Linux to the remote firmware.
> > +Each SEND corresponds to a single REPLY message. The GPIO driver
> > +should serialize messages and determine whether a REPLY message is
> > +required. If a REPLY message is expected but not received within the
> > +specified timeout period (currently 1 second in the Linux driver),
> > +the driver should return -ETIMEOUT.
> > +
> > +GET_DIRECTION (Cmd=3D2)
> > +~~~~~~~~~~~~~~~~~~~~~
> > +
> > +**Request:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+------+------+------+------+------+------+------+
> > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > +   |      2      |    line     |             0             |
> > +   +------+------+------+------+------+------+------+------+
> > +
> > +**Reply:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+--------+--------+
> > +   | 0x00 |  0x01  |  0x02  |
> > +   |   1  | status | value  |
> > +   +------+--------+--------+
> > +
> > +- **status**:
> > +
> > +  - 0: Ok
> > +  - 1: Error
> > +
> > +- **value**: Direction.
> > +
> > +  - 0: None
> > +  - 1: Output
> > +  - 2: Input
> > +
> > +
> > +SET_DIRECTION (Cmd=3D3)
> > +~~~~~~~~~~~~~~~~~~~~~
> > +
> > +**Request:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+------+------+------+------+------+------+------+
> > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > +   |      3      |    line     |           value           |
> > +   +------+------+------+------+------+------+------+------+
> > +
> > +- **value**: Direction.
> > +
> > +  - 0: None
> > +  - 1: Output
> > +  - 2: Input
> > +
> > +**Reply:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+--------+--------+
> > +   | 0x00 |  0x01  |  0x02  |
> > +   |   1  | status |    0   |
> > +   +------+--------+--------+
> > +
> > +- **status**:
> > +
> > +  - 0: Ok
> > +  - 1: Error
> > +
> > +
> > +GET_VALUE (Cmd=3D4)
> > +~~~~~~~~~~~~~~~~~
> > +
> > +**Request:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+------+------+------+------+------+------+------+
> > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > +   |      4      |    line     |             0             |
> > +   +------+------+------+------+------+------+------+------+
> > +
> > +**Reply:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+--------+--------+
> > +   | 0x00 |  0x01  |  0x02  |
> > +   |   1  | status | value  |
> > +   +------+--------+--------+
> > +
> > +- **status**:
> > +
> > +  - 0: Ok
> > +  - 1: Error
> > +
> > +- **value**: Level.
> > +
> > +  - 0: Low
> > +  - 1: High
> > +
> > +
> > +SET_VALUE (Cmd=3D5)
> > +~~~~~~~~~~~~~~~~~
> > +
> > +**Request:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+------+------+------+------+------+------+------+
> > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > +   |      5      |    line     |           value           |
> > +   +------+------+------+------+------+------+------+------+
> > +
> > +- **value**: Output level.
> > +
> > +  - 0: Low
> > +  - 1: High
> > +
> > +**Reply:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+--------+--------+
> > +   | 0x00 |  0x01  |  0x02  |
> > +   |   1  | status |    0   |
> > +   +------+--------+--------+
> > +
> > +- **status**:
> > +
> > +  - 0: Ok
> > +  - 1: Error
> > +
> > +
> > +SET_IRQ_TYPE (Cmd=3D6)
> > +~~~~~~~~~~~~~~~~~~~~
> > +
> > +**Request:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+------+------+------+------+------+------+------+
> > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > +   |      6      |    line     |           value           |
> > +   +------+------+------+------+------+------+------+------+
> > +
> > +- **value**: IRQ types.
> > +
> > +  - 0: Interrupt disabled
> > +  - 1: Rising edge trigger
> > +  - 2: Falling edge trigger
> > +  - 3: Both edge trigger
> > +  - 4: High level trigger
> > +  - 8: Low level trigger
>=20
> I'm in agreement with cmd 3, 4, 5 and 6.
>=20

How about cmd 2?

> > +
> > +**Reply:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+--------+--------+
> > +   | 0x00 |  0x01  |  0x02  |
> > +   |   1  | status |    0   |
> > +   +------+--------+--------+
> > +
> > +- **status**:
> > +
> > +  - 0: Ok
> > +  - 1: Error
> > +
> > +SET_WAKEUP (Cmd=3D16)
> > +~~~~~~~~~~~~~~~~~~~
>=20
> I already commented on messages that are not part of the virtio-gpio
> specification.
>=20

I don't believe virtio-gpio needs a SET_WAKEUP command.

In the RPMSG case, SET_WAKEUP is required because it performs an operation =
on the=20
remote processor, so the remote side must be explicitly notified.

For virtio-gpio, however, everything is handled locally. The other side doe=
s not need to=20
perform any action, so sending a SET_WAKEUP command appears unnecessary.


> > +
> > +**Request:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+------+------+------+------+------+------+------+
> > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > +   |      1      |    line     |           value           |
> > +   +------+------+------+------+------+------+------+------+
> > +
> > +- **value**: Wakeup enable.
> > +
> > +  The remote system should always aim to stay in a power-efficient
> > + state by  shutting down or clock-gating the GPIO blocks that aren't
> > + in use. Since  the remoteproc driver is responsible for managing the
> > + power states of the  remote firmware, the GPIO driver does not
> > + require to know the firmware's  running states.
> > +
> > +  When the wakeup bit is set, the remote firmware should configure
> > + the line  as a wakeup source. The firmware should send the
> > + notification message to  Linux after it is woken from the GPIO line.
> > +
> > +  - 0: Disable wakeup from GPIO
> > +  - 1: Enable wakeup from GPIO
> > +
> > +**Reply:**
> > +
> > +.. code-block:: none
> > +
> > +   +------+--------+--------+
> > +   | 0x00 |  0x01  |  0x02  |
> > +   |   1  | status |    0   |
> > +   +------+--------+--------+
> > +
> > +- **status**:
> > +
> > +  - 0: Ok
> > +  - 1: Error
> > +
> > +Notification Message
> > +--------------------
>=20
> "Interrupt Messages"
>=20
> > +
> > +Notifications are sent by the remote core and they have
> > +**Type=3D2 (GPIO_RPMSG_NOTIFY)**:
> > +
> > +When a GPIO line asserts an interrupt on the remote processor, the
> > +firmware should immediately mask the corresponding interrupt source
> > +and send a notification message to the Linux. Upon completion of the
> > +interrupt handling on the Linux side, the driver should issue a
> > +command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
> > +
> > +A Notification message can arrive between a SEND and its REPLY
> > +message, and the driver is expected to handle this scenario.
> > +
> > +.. code-block:: none
> > +
> > +   +------+------+--------+
> > +   | 0x00 | 0x01 |  0x02  |
> > +   |   2  | line | trigger|
> > +   +------+------+--------+
>=20
> 2 things here:
>=20
> 1) You did not include messages that mask and unmask interrupts at the dr=
iver
> side.

Interrupt masking and unmasking are handled entirely on the local processor=
.

When an interrupt occurs, the remote system masks the interrupt and then se=
nds a notification=20
to Linux. After Linux processes the notification, it sends a SET_IRQ_TYPE m=
essage back to the=20
remote system, which then unmasks the interrupt.

Thanks,
Shenwei

>=20
> 2) We are carrying virtio-gpio messages on top of RPMSG and as such, this=
 whole
> protocol should be about thar:
>=20
> +------+------+--------+--------
> | 0x00 |       payload         |
> |  Q   |                       |
> +------+------+--------+--------
>=20
> Q =3D 0 requestq
> Q =3D 1 eventq
>=20
> The "payload" part is simply the format of the messages as found in the v=
irtio-
> gpio specification.  From there, the only thing left to mention is which =
messages
> are not supported, i.e get line names.
>=20
> > +
> > +- **line**: The GPIO line (pin) index of the port.
> > +
> > +- **trigger**: Optional parameter to indicate the trigger event type.
>=20
> Not part of the spec - remove.
>=20
> Given the refactoring work that is still needed, I will not look at the
> implementation.
>=20
> Thanks,
> Mathieu
>=20
> > +
> > diff --git a/Documentation/driver-api/gpio/index.rst
> > b/Documentation/driver-api/gpio/index.rst
> > index bee58f709b9a..e5eb1f82f01f 100644
> > --- a/Documentation/driver-api/gpio/index.rst
> > +++ b/Documentation/driver-api/gpio/index.rst
> > @@ -16,6 +16,7 @@ Contents:
> >     drivers-on-gpio
> >     bt8xxgpio
> >     pca953x
> > +   gpio-rpmsg
> >
> >  Core
> >  =3D=3D=3D=3D
> > --
> > 2.43.0
> >

