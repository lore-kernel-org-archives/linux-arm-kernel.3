Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F6CC021A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KF+9ks1TpPtfh5Io14neNqsw2uCopTQ35irpmxxnSU=; b=jCsdBnMqXG/yJ6IrQ8Q5HPeX++
	zHzy3es2gPZuRAEyjpW3psJ1/v6BXSVm2xscFiRro+iygWxhrE9m+5vRWemdeZsuK4MNw90cgO7sJ
	/5IqFFoioz3xMD3/I1ri1rN/TUY2axKmmy19762TcBWWUZjQnvUNawsQojw8rJ2GlRdBwZZe1FnJO
	DH2MX/MnX9uP3fSbeRS64mOgbuJSVYmwPmh9KCxRMl4YDWUZJ7q9sB4c7C/Lsy7vDTZ/buN/esZhR
	o4RiCmWrE/shEOBTjz1L2TD69WEDEhMYMYp8jsaHRsdKhb6ArmYJhIe3/EYuXH6Xx+PeYETuyFTqQ
	b7bgimfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thd9y-00000001pxX-3Mtl;
	Mon, 10 Feb 2025 23:25:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thata-00000001Qgo-07tc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 21:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7KF+9ks1TpPtfh5Io14neNqsw2uCopTQ35irpmxxnSU=; b=iYLKcSsnCdMEE4s9sOg5Q+ERcS
	AZkOy4DPlg7FwZMXhbHGdsC+EBu/OaCmw/37KssTsWypb/Zz6BWzbP0WbzrkxGqOE2I5T7fXNmI32
	jYvDoeF7YcUjufZaGjfsKW57hCEhKD/GPJgYvOfQanUa4daM5hJ9k6ywF98KeYABFI/yBLHbPty3O
	xHxDAqXdm0tQvSZNuQTQY1+RPxXAhNR1P2cYugmTMh+jZKg/EENdTOMHefRWCS0byfX4xoNMwtgD+
	VOItCL8KpFSJgnuDCLa2ofWbicbs4sg9NMH04vP791H2f68lZkTjq4ghiM7yKr+U9CsUj4zvoGdMn
	CE2wWZ/Q==;
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thatW-00000000GSU-3zGU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:00:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ry6LXJdtZWocc6hpdm6kTvmWVu7zzeqDSjhWhQfDwOj4RJHz39Wt9UwukP++LamhkpfnzQ5s9rBXnyZce9Kklts785Qa4fJqslB6j8t39NR7GghfIvweSTF3x6r8Q/xJ9ZBkNdwD7Ah/rJBHu1O2sQow3iQzxLzaNXg2lxICVrXOVkGGGOCVWQ2Yn9nEGa2ZGIzXWjiH+QtcDBIT3RmyR7T+An8hXU3rRCVi69nVpUF2JpzC3ojShzDg4Cum3FYUAMMxwSbncV9sscatwAPlXiv3D/PtkE/5IcKrwD15ZpHuuvobQh/Tnnv0oZ9GxOypL1cZbmnVZwFxobjcmR4yoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KF+9ks1TpPtfh5Io14neNqsw2uCopTQ35irpmxxnSU=;
 b=ofqHhATOHzHLvb6mD8VHM/eRTGD46++A1jhEaytudgiE11ovVG1P9gcwj6Ps+6yoqnBw+haw3j98/qk+ItuOoJMVtO+V1XrBgSAEui5SDjxvfz2MaZPriI2ODl7xb6+mCfCWD0aESmsBWjjUYJK/EmT8Ylzb36gqV/A4A8pPqMdoUdyNXDyNVN84GPFoXxtiUWZiCx6DJFpgwgtgjCguJqPJQI9FaLdM4yXtrdf9VlPF7jGvlkeLVl0QyPIfTgPRVMn5F17YcP6TUZUBhVxNciaykV6KJ966MjmRc5rhQkenVqnEZUkNgLg3LBmiDjfQWK/8wg2TgHc12nF2qXM2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KF+9ks1TpPtfh5Io14neNqsw2uCopTQ35irpmxxnSU=;
 b=kF1ynyFkv3pgUfiNFWSCJsAmJjRZCY/P0v7WOtXcQfHJPKIf2JheqR7AWtCFYcWLBPL/lv6ATwsxDxKQoMpPGF3hD2QL3GyNFKLhWvQQnY6Wbvj5dA2cjufMAT4YZMz0W1WIOfOmE/CS4zIwpa48iGr1Wd+U76wl6zt1AePcsZDSqay7vVp8cqQC2QyTybY4lGSvv0PLAWyntPLQwhnI050ILv1uZtEgTIUjWFibLlErxafJ1lb2i6dbpz5uWL9xc98GjpIZ+quZ1FvPDIhBQ7apz7yJ8FswqKKrkGdKuf9YoLjzFi690nruojzZOL2yVDF7oSG4tvGhp95qZtVkQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10238.eurprd04.prod.outlook.com (2603:10a6:102:404::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 21:00:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:40 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:29 -0500
Subject: [PATCH v3 10/12] arm64: dts: imx8qm: add 24MHz clock-xtal24m
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-10-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=890;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=V/jMpa/7SRBpANG3WwS/YHmbt91+dHAfNmrPG9mZKaU=;
 b=eK+cKFPOOxDiRVcuKw/KWv5aBt/0EVqOe4kCIlJxXUjmUAiu6bVLYmH0Jzgr6AMyZ7OUzWM0t
 7jgwhPdTkGQCi5IAr5P8ZJ8lmXAzsDhnNhFiBSjAbj9Tc74fYIwVUTv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10238:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d95ded5-f978-46d1-875c-08dd4a15f9a4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFl3K3VnVU5PNmQzK0VrdjdqNS9jajcrM2d4S0JQUVZMNG40aXZBUktRWWNM?=
 =?utf-8?B?MkFqdHJZSGdFMlk1a0pWSkk4SGwydXY2NTljMXVCbUVsWmxNLzBQbVZvQmw2?=
 =?utf-8?B?SUwwY1cvanUzQWZ2Q2tMQ1ozM01tU3AzaHpBdXZxYTRFdSsxdHY4cnY5M3Vr?=
 =?utf-8?B?OXdxNkZrMUtlQ1BXaEVIYTl3N3MzSlg5K0NZNStDUktMbXhSWkQveFNERVIz?=
 =?utf-8?B?WENHOHIxWmozMmQrU1dnTXo5K0h5RGEwcWtpejExbWx6ajFUTlV4UzNOZEgx?=
 =?utf-8?B?UHR1ZnRGc1R4TWpERUIvZWJMd0x4MmY3cG1xRHFwUWpibm1ycmNFVHY5V2JQ?=
 =?utf-8?B?V1Zac1dlOXdVdEc3cmh3M091SmE0Mk9EeksrUDBYa0ZqUVRkSXpwbzNaVTJt?=
 =?utf-8?B?eWpYVkxkYmlpSVZIcXpZdDJGOTBHTGpnb253L2FmMS9RSkRuamlVV2N2bHdJ?=
 =?utf-8?B?NW1BT3F2Umx5dlpnYW56YlE1NWtKTUt3Y1FxcnljRGE3bDVZZXhCSFFUSVNH?=
 =?utf-8?B?T1FYYlUreTg0eFR4T1FIU3ZhK1NNUGE1SzJsNjlIb09CYU9EUnFRUm1PZTlK?=
 =?utf-8?B?ZjNydkx6RGQ2WW5pU09aNmtTWk45eE4reXRGV3pNcXJlaktXL1g5WVlFTWFZ?=
 =?utf-8?B?RUFhR2NtUFNFS084T0IyUmhqVlF3UUR2TWE0NjJIZENqRkpnSXpsQ3Q0aFp3?=
 =?utf-8?B?NHFSeGRSWEtRaURnQjRzSHBJZ01wa3hYcXpVQUF5WkpxbHlSRlQ1blk5WWRy?=
 =?utf-8?B?K0w5WWN4UWc1STUwVFBTU2tqYU9qOU5UQi90UlZuZGJSWDhZYWM3cms3YSti?=
 =?utf-8?B?NWx3Rzl6VCtnSmYzeXVKT0ZGQVVRZ0I4aDFCSXFxUm9zYUJlNFJPUU5vblNq?=
 =?utf-8?B?OUJqdGp4cVpZOG42Uzd4eGsvZDFLRytVQy9GOEJWdE4xSkF3M3NwdnFzZExU?=
 =?utf-8?B?aTFuLys1VDh3WXRNM1ErREQ5eFAxZVpZRk5BaXpvYWFBZFdHWUNENDNuMzEx?=
 =?utf-8?B?b3VpT1hYZFFIbmJBclNIYVVqTm5xbWUvaTh4SmpjY0dZa1UzakNSb1ozYTRs?=
 =?utf-8?B?UVQ0aC9SRmdFQmM3enZnWmdWcTF2aDRmajdtaUpsMWNYaE80OGUxTzF6dWpO?=
 =?utf-8?B?aU9pMkozdmFYbVU3MjkwWXdCOWJKcE91MDF3ZWh1ZU5NMzFLaWZxSU1DRWs1?=
 =?utf-8?B?Y1gyd3RhWDZDN2NCbmtqMkJnb0dEV2REUjAvSUN0a0V2TXpyYXhiK0JyeXpW?=
 =?utf-8?B?MTdYWGtDcStxQ0dJU0NNOWFOWlhNWjdEM3NVUThXK1ZtUy95azlRL0w1a1k4?=
 =?utf-8?B?ektDeUlLbVBDTXQ0V2F0VTR1bzhJY1BYN1FhZXVXTFhHcklEVWhQY244UEZs?=
 =?utf-8?B?Q1NJZkNQaGsvQ0pTc0hFNGlVSmlFUXcyQ1ZMSkJlVFBNejlVU3VhS1dCSzFL?=
 =?utf-8?B?M1lQT3Z5Q3VhWExqU0ltWVg5M29yNmJBOC9oYWtzOG9MeTJGUzN1N1V4Y2RP?=
 =?utf-8?B?bFJacHZsem9yazl2Ly9jdFNyWTU1SUZFZUJRSldnb0ZVU1I0c0JBK2NZN1ZW?=
 =?utf-8?B?cmc4d0tQRWNmQlo0ZmsyY2Z6ZTI3dUpvN3lIa0FpT2NlSXJYNGNmTWlTVUp6?=
 =?utf-8?B?aE9ncUdxVmUycnBVQVBMeUlqYW9ycmdXTUF5aEZqOW1qQnZ2THJSSFhxTnZa?=
 =?utf-8?B?djNMbVdMMHk1VWhrRHQrWXhpR21rbmVCdFgyN3F5SG82dE84MTdjZGNnTEtr?=
 =?utf-8?B?N25hSkdBWTcxNjJwS3VBcGRhQndBS1Bock1SWk5LWFpSMnFhQ2F5ZFBHL3VV?=
 =?utf-8?B?bHk4RVhpZXZadU5FWHI5WWlDTnNEZDljemxRNytFN2oxRXRsNWdNZU1EV1RR?=
 =?utf-8?B?amtpdTlEam5BNnBBeFcrVWVTZE5oY3p3TUdEQWdSZVM1cUtGTFUzR0owWHRq?=
 =?utf-8?B?VXZWU1paVS9pTXNRQ2ZDUzlLQUFoa0RJSVhDdmFYODlQMXIxd1I0b1NkV08w?=
 =?utf-8?B?bUx1aTN1ZlNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVJpUVg1MUd4dm1BVjNxRnhuSktXUkxhMUMyN3BLdUpRZC9ERW5iaVlQek44?=
 =?utf-8?B?a3Y3YmlXeHpsd084dnIwTmZMcUZkVitMVUtrSU5PMk9uNGxmRlFiSVZtaUNR?=
 =?utf-8?B?NVQ1NmZ0ZmZiY1VyZ3cxaFgxVm5ZaTNaWXNOSzBMeXJMS0FqNEd0RTFNcUJm?=
 =?utf-8?B?bnhTazdNdTRBeHJoSGZQdXRFOEtXOUF6QURUUnZ0NG1VUEJDNFk5UHFNZ0RU?=
 =?utf-8?B?RHFhbVQwWTM0Zm54djA3eklSRWtFYzBEMzZBMzB3bCtSak4xSWZnNFllRGJr?=
 =?utf-8?B?Z2VEb1lOa0FFVlV1My83cElzS3plZ05DQWVvbFlZNWxGVWhFZmpuMkdNUGlX?=
 =?utf-8?B?ZmhBZFowUTFHM2s2SEF1cGI2VzdNeVR6NnBhbEdhOGwwa3V5cDcybmdDV1FY?=
 =?utf-8?B?dCtqNHkySlRYbmF4bU95TVY1UWcvU1h2VHhNNHJPT2t1cFh5cjVqTnJTdFRw?=
 =?utf-8?B?a2cvbEhtZkpmQUs1WGJnQkNtNlZuTEhxdllmbm1rR0ZVK3dqZjZjUWZFU3p2?=
 =?utf-8?B?c1ZGSW1ZN1pNbUh1d2U0cWttRm9kQ3lrV1Z4L0hxZ3NQTFFmRnVLVVRRS3lO?=
 =?utf-8?B?N3NPc1AzWjNSK3lNT2NyYmJKcis4ZEw3eUVFcGFBWUZPekdFYlJpeXZnKzI3?=
 =?utf-8?B?MmsyRlBvZ21uNXYvTHBmSmc0UWlNb0pOa0dRVk81U0c3SmJQV1p1a3lyT2NJ?=
 =?utf-8?B?dU44YVRFWlliaVB6Y0lVOEhvRkFTY3ZUakl1YXlsaW9nWVdmemwveEs5dkNG?=
 =?utf-8?B?SFZyeDA0cEYxY09UQjdUK0puZ1hmUTlsazBtTVVtMzI2QU9zWCs2c2VXR1Rm?=
 =?utf-8?B?aUZkWVh0TzV2OGR1cDBlWWdzT2s2VjArQVNKUEdQajdwN2h1ZlZ1d212NTNk?=
 =?utf-8?B?dXVocUxlUkc2bG1vdDQ3L0hDS1NmbzYyd3N1blZsbFNkNEt3M3VBbEhTSnBV?=
 =?utf-8?B?ZjlrMUhRbDVkUnMvclVoV1pKa3MxR0hTbzc2WERIejM3T2tLNEZFWWQ0a3lW?=
 =?utf-8?B?UGNVeXVBZ2ZnazIwQkd4c0VFWFVRaTEvZmZ5eS9OeURYYWRqZDZmYXNoeFBZ?=
 =?utf-8?B?cUFvN1JPdFZsUk45VWI3OEYvUWtGcUZOZ01JM0pMQmJTbmZQRjJwKy9KRTEx?=
 =?utf-8?B?Q09VOHJkY1dwUEs0ZVpZZDhsRERDdnRkSG5qblhzc3RiRWlkUnIwRS9nUkNT?=
 =?utf-8?B?NlZhUVBDTmxKV2M4VXIvRytRUDJ4UHg1d1I4TCs5YXJ3emg1Tkh5Q0dobTdu?=
 =?utf-8?B?WW9ZejVXZCtQZkhnSW44blhGUGlwa2VCdzV6dVVqQ2RsRHVjN1lSVUZXb1V1?=
 =?utf-8?B?ZG5xSXZKMFZRbWd6WkVhbVk0ZzN0WUZlUE5yWFBiYXNydjNpSUFkMG84R0Zx?=
 =?utf-8?B?dlRNTXI4bWxBeEc5SkxTdUliNHBtM241enBoVldmRzhIaElYc2l0NlByeVRa?=
 =?utf-8?B?a3RFUU5mR2RHM2lnaXFieXgyQVJZQ1ZGakRyczR1cmhPeHVkWlJVamtRKzlx?=
 =?utf-8?B?NEprVWpvVkczZXRJc0Y4ckVJMTRPQmhzWW1YRUZjdXNpMzNJV3Y1RzJqRVRu?=
 =?utf-8?B?enp0NU5uZnZmWW1OVS9yMm1YeUpKeGV1NVJ0YVJQc0tnNmNTNjBKQmt4bnlT?=
 =?utf-8?B?U3VmRTREN3ltYlMzY1l1WXl2R0pYL1pjNFBDM2NXYjlGUFRRMVg4dVFmSmdC?=
 =?utf-8?B?NjFDQkt5cVVFZmh6NDJWcUp0YXpDa0NUSUJERHlaNTlNRlFCaWYxZHBHWldM?=
 =?utf-8?B?TmpmbDR6MVh2ZzJsdW9IWll6UG02dEdqdVpOcktQeXRCZFovZ2pORzRJWmVW?=
 =?utf-8?B?OEwvaEl4UlBWZythZGVFdkRXZHRWdUppU2hhc0QwL24xL2ZUQnpNTGVOZXV6?=
 =?utf-8?B?My9DYVFJbGpLTUk2VDhYV1k5dUc3eVB3eDlENURpWFoyUHN3V1J1UGRpemxs?=
 =?utf-8?B?ZWtIY1dXWDZSTDhGY2M3Sk1JbHQyV0wzKzRmcXZiMWtoNm9KRXg5ZEljZGk2?=
 =?utf-8?B?NWtxSG1qY3dmKzFMdmtDcFhpMUc2Y1ZQSmdrRzJrczd0SDYrWUFaK2VqcXB4?=
 =?utf-8?B?ZDc4cnRnOTE3S3UxOGdOVmMwR2hhZ1VmcmRRY0laUDhxc2hoWGlSVTc4N0c3?=
 =?utf-8?Q?uHkE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d95ded5-f978-46d1-875c-08dd4a15f9a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:40.0768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsyF+9S7zZelhZlPgcPPlR5cxYRSxMXyCRgaOzJ2kxRz3jUHFgjwxFGtzfr2km3iiVIgOC1NnHOG690criDnWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10238
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_210043_176321_CFBEF948 
X-CRM114-Status: UNSURE (   9.76  )
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

Add fixed clock node clock-xtal24m to prepare to add camera support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v3
- none
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index c6a17a0d739c5..40cd45cd9f88f 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -590,6 +590,13 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
 		clock-output-names = "mipi_pll_div2_clk";
 	};
 
+	xtal24m: clock-xtal24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal_24MHz";
+	};
+
 	vpu_subsys_dsp: bus@55000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.34.1


