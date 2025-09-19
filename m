Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AE5CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=np/7WU5e2j1BL65xNnwVK6KiVE+9WCkFusUzzVkSm24=; b=eo8gB0eAfay/nN/gV1wfYHnyGR
	sIDBOOHjxtK6Sv6fbc+GXtv35S/TIdLNybiTx1tkvI69u0CzFi6UIaG5cPfg94pelCOSx1UMkj9ud
	RVOGp1nPSspmLsFGxgdWTxWgeCD5YmWupki+C+CbvXIHUJyhvXzqyiJHp9EdfxniPdmwDIjB1SgxW
	i+ClXstGE0TP3wIsDDzSPFP6MciRor65t/BWv5oz5/4MLvWs4HnXgI3lRlNNzy1Ph+Uz1QdA0yosY
	C49C4WMStwi1J9JE6CHcn8Q0I98aG6o34YQXEfZ3SQRhMVXXAOwNuJ/DMQWDlIk/lK1NweW8IbIqw
	fwafCQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVul-0000000299R-1nhO;
	Fri, 19 Sep 2025 07:52:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVuk-0000000298N-0zeG;
	Fri, 19 Sep 2025 07:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=np/7WU5e2j1BL65xNnwVK6KiVE+9WCkFusUzzVkSm24=; b=ZNx/y5Y52RkYni8BAroLnEGXtm
	6YdVdTLuIL4arZ2JoWaFmpi90bcewGbF4U+uFO7RwIc7izwSKVizjevVGawS0YyVrD+NzOoLci3nF
	wo+39QJAFfRKGoXtSzePnC3BM3BkxP1FBiTiifh2aheVvCJ9YsUE8jasFV+on/+gaNhhTkOca7r/b
	rK2TaOacVAEvomd/Bi5Scs3fdKnkCSPfciiPzOZR82Qy7wqUYUeZZgd5gp57nd31gNEBmVcw1VCvD
	5c70QeSoUl3R6v6LLCAt53wg4uCg43eHQxOvQp+fY9/cnQRqVKy1elGa5SxhWbY1qx4U23GV97sc3
	gWOMWHwg==;
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVug-00000007mMp-3VRt;
	Fri, 19 Sep 2025 07:52:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6EKn13gY5SBvlORoI8wbVi2FDIRld7Kdj0Q9zU5vxyBj3iZ2ZqIsjbWMXhmmjb/tcX6vbv9HT7Xh9Eg+35JES2OjrmtRwwD+fzfvYvqb8htPnzCsz2gUd0ezGcJCzCWEYXyaPT+K+6hKFqoQcIO+vogm3XcKh3YU3PUgwuaLxE5G+ocfvqJjr68Lv4ayGLNtb+Slo8/S0qd5s8r+U3Hqgr0Q/dZoafFOpLqONNUzIztqjWGZbzcFQwfi/yNYYEqtoEw+b25+jCyMt1tMXsqmm10mqqiVFvbZpCMG6R5OzXOZgc5bBq8AH8tZjU5OyMFa+atFld+1m9zWYCNsQdskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np/7WU5e2j1BL65xNnwVK6KiVE+9WCkFusUzzVkSm24=;
 b=Gqk0chX3utlf2IFvnNoKnzDw7YzcHxRQ9/Vu7lLvnRMnm2t44dYs3EJmIBJozK5JaQXwbHB8/81xezmoK6lxMQW8TN/6P4K1fZ3i6DUN3tEktzlgxmXI6mfy6d4TCpi93sRx/VyI9MQkLZIz4zXVWCqCA89yQVL64AC4Ik3ZKuC8uZus9LsaiNwijrCi8BI13FFCzfJCfvDeNcIZuzOMXGwaVfEWmTFbjTDTfY0LwRqflerKyHjCdR4IK5jcf6t3a0F7/3O4ZGbkKjbJrp4sUX22xEg7Iwbjwfhyc6Pkh/jNQbUxjY/7UuMMcgnG3lnjJC54KLL7BjPe4WySw+QXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=np/7WU5e2j1BL65xNnwVK6KiVE+9WCkFusUzzVkSm24=;
 b=G99wo6G84nndrgrbdkC/2HiGkVz1JW9IL7dZF5/lSKazl9j8H/aS6QedKJ/7MM8q8F5n81k517MbSgBZ3c6sSDz2zbJ4YkkJp519cX0LV1Ay5IkLmbUBcHG8ooTXCktRXFy5hfdSsFjKIQKFxXYHqziNKa+nN+dlg2m19pqVlxo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com (2603:10a6:20b:512::15)
 by PAWPR08MB9029.eurprd08.prod.outlook.com (2603:10a6:102:341::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 07:52:07 +0000
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726]) by AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726%4]) with mapi id 15.20.9115.018; Fri, 19 Sep 2025
 07:52:07 +0000
Message-ID: <09a71be4-0380-4b12-9a96-0f1d5d32cd7c@wolfvision.net>
Date: Fri, 19 Sep 2025 09:52:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 11/17] media: rockchip: rkcif: add support for rk3568
 vicap dvp capture
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-11-af0eada54e5d@collabora.com>
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240220-rk3568-vicap-v11-11-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0154.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::47) To AS4PR08MB7735.eurprd08.prod.outlook.com
 (2603:10a6:20b:512::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7735:EE_|PAWPR08MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: aedf4548-f4a3-4a8e-3970-08ddf7516e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2lDWWl0aS9WWkF6eHRBUW8ya3c1cHhoZ3p6UnEvY1podS90cU9uQittWkRk?=
 =?utf-8?B?RCsySFBNRXhPY2ViK1kxSjlyUlJsYmREWk1EeGVJcHloZnVEZldOT2xQWGRJ?=
 =?utf-8?B?RFgwV0JIdUhTYTZxTHBlekVDVTZaTFlWVkdpTWxHd0NWK0kyMUhnYklUb2s1?=
 =?utf-8?B?U0ZGSHdIcHNQQU53ekRwNGhPdk9JMXJESnRMR1htYnhpMGVYR3lML1dSSXNM?=
 =?utf-8?B?NVJsTGg4Yk9MTFF1ekV4a3ZCa2hSZWV4U0hYT0t1RERiWG4zK2VZMjBndEJF?=
 =?utf-8?B?NWJiWHo0VVl0N3c0Z3RST08wb2dFblY3Nm94ZWlBQTA4QnplcHFRTGQ5ZVNG?=
 =?utf-8?B?VnJQTzUycG9VY0xZeWQyS0tkOS9sdmptVGc5N3lmZkRVbXF5bW5BMlFLb2tS?=
 =?utf-8?B?djBKb0lkRTYzN2piY2hSaFU1YmlDUHBrdnlIRVp2WURsR0s2UDBSYkhKVFZP?=
 =?utf-8?B?bzhBRDdNc2dCeTRGUVlkL1BXaEI4d3o2cjNCNWdiYWF5ZTV1NFVQWWROUWpt?=
 =?utf-8?B?bkpwOCtEc3NrbkpKQ1NuV0lMNlY4ZXdiTGtYczlFTkE3MjVIMmY5Y20zbFNG?=
 =?utf-8?B?WmY3V3ZiVlJMUjNvTkNUREdLN0FkUkRVS29QcHQ0KzIrYVc1OFV1UG91NXhJ?=
 =?utf-8?B?eXJTV1VVVVVkNHR4RGI5aHJRc29aQkJhNEJrUjlGZ3RLalRPZFMxK1lIWUlM?=
 =?utf-8?B?SngvSHpld0FKdGFpRklFYWVkYmNadTFtZmsvRHR4RWhDYjM0aXp1bllvSm9H?=
 =?utf-8?B?YUhMd2ExbURuRzRLem9STFNmb3lkbUJGNjF3eEJpMkxMcEtuZ1RzVTh4aTdE?=
 =?utf-8?B?MDRYa05LZktvNUpGaGlrakVOblM3blF3bzhadEZRUGQ0S3NvOXZsQ3lYdGdI?=
 =?utf-8?B?aUsyc1FWVTRXaUpJQit0T2VJbEVocWRtUG12NXAwdVNvQjBST1NNSm05dTdG?=
 =?utf-8?B?YTUrZEI1aWwrZjlyWVFFNGsreVJydG9aZldYS2o2VDJNSy9PUC9ibDNuYnA5?=
 =?utf-8?B?dDRqc2h0SFUyU0F6UlIwSER2TmVZUjBRSzU0ZUR0OTdJYVY2dlpiV2VNVGRP?=
 =?utf-8?B?elBkcUsvT0VjK1p5eGNwRU05MVNOMHlaOFk3REFmTkFMYUVRYStGNHY4RFM0?=
 =?utf-8?B?MnRwY0o5czNpM2J3UURRa01sZDBsTXpiNFJvcXh3S2RacUVETTJOMHBtOThX?=
 =?utf-8?B?TEg5dEduWDRyNUdCOEVkL3JBTjMwdHR0VmY5cDMraUZVb3BwYUhGU3FpVHU2?=
 =?utf-8?B?blF0ODRyWUsvc0s3T2I5T1l1TG03aEpXTEVKdVJEaTdZazljVUk0NDZaL3RE?=
 =?utf-8?B?NTVwOWlvL1k2SjRLNktHVXFNUTRIdXd0V0RZS0ZsMDdYNzBRTFF5TGpwOXJO?=
 =?utf-8?B?eEVoeHRnRVBncUY0cGpRLzJ0ZWw2cUhxS0Fnd3A2aER0MTViZHU3MXFPaXY3?=
 =?utf-8?B?TG9nWENEWGgyM01ObDR2SFRzRzliMzVWYXczTWtuY3ZNVVZrbHJES28xUWZ3?=
 =?utf-8?B?RHM3bDJyMTJZQUUrUndhZUdzYnRvVHVtYmNVYkZqMjI3bnhESlhiV0tVUmZm?=
 =?utf-8?B?TlFwVWZJc29GRW9WUk81ZEhtamVmeHFBQjF0QVBBd0psWjJwTlVRM0sxZ1lL?=
 =?utf-8?B?TGlYRlk4aEdpY0x1NzgzSlB4aUlSNmJpZ2ZpcnJSaTZhYm1SVUJjaXRrRUxU?=
 =?utf-8?B?UG83Z1ovS05qamhxMWpxZXd6dDBUeFZGMzlmL1owTWRqSjZWaytMWVlSYnNI?=
 =?utf-8?B?QnRkYkNrNjV5b0xYWDB3ay8rUmpGZFl2WndNZGpVdnVlSEJ0SlNNeHRWVzF6?=
 =?utf-8?B?QUlocHV1Z04ydmFoMTgvQ2NTalBuVGdqbG02OHp6UElJcXJlQkRqVUdSNlVr?=
 =?utf-8?B?Q0VXK3FRYVR5VFY0U3RKYmtlNS9sdWVWdHVxMXZSWi9aQXduR3gxbkZnWTEx?=
 =?utf-8?B?THJ1TVk5TWlBZis5ajNCcTVTTjFJdUZ6RFRNK0NsMHQ4WmRoUlB1dEwrRlVB?=
 =?utf-8?B?NEhBaUZoYkp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZThSeUVwTkRzU1FnQUxnQzhCTmM4RnYxVVZ4VENGL0tTVktwWndzV1lta3k2?=
 =?utf-8?B?aE9uYnloOGVMeWxNcmxaZmlIVXMwNVk5NjE3Tmc1Z1lxRW45a2o4TnNUQjkx?=
 =?utf-8?B?bHI5cXUxempCRDZselFYREZmak5NZWlwQXNPUE9TcWtRVVQxbldyNXVCWks3?=
 =?utf-8?B?Ri9WZUdRUmM0aVBVSkRMQUlQZVdLTVVsSGxmTWhYQVlUODAyUDRadDA3Vi9z?=
 =?utf-8?B?aHA5MVVVQVhna0xXL2x2a2ZScTZwSSt4RTB5VTNTQ0t6Y2diVUVEWnR6SWgy?=
 =?utf-8?B?MU1VeE92VWhSWkpOcitxK3JVVDlnRkE0SmE4OGFhcHdVWVd2Y2I3Z2dDeE5P?=
 =?utf-8?B?QmEzR3haQjA1UXBiem1tbnJtc0h2cm1XTU9wTS9YWVIzYlJnVkd1TmdzNC9J?=
 =?utf-8?B?eHlIRmE5WUFLOEdaSUhkMzZFQ2dFY3QzbWJZMkFObFpmZCtTRDY4YzlZdjhD?=
 =?utf-8?B?aUFJNnNuWEtIa2t4QUxsYWUxc1JUY3MyVzBtcCtaQ3NsRXBMcUV6bVhKRVow?=
 =?utf-8?B?MFE2aGZqNUlvSlBpRm5pVXdsQ3laVE4xeW5CWU4vSzlicTVUMEU5TUNtTExs?=
 =?utf-8?B?Z2RnS2RnRnp2UW1MaWUyd0cvSVVoTVlQSHBNUFluS1RnOVZsKzFTU3JMNXd4?=
 =?utf-8?B?Y2crUE1FUHNpODFyVDdEVTJXaWtyWVk4dkp6NUZZSHZzUVZmeUFTY1ZmdW96?=
 =?utf-8?B?OW9icEFCZC9EZk9pOENqaU52RytVMUgvYWh3L3NnYXUwSDc4N1FZS3BZS21F?=
 =?utf-8?B?ZmpXNUxjVFhJc3dpamFUaC9Jc3ZYdjhoR1B1VFU1VG9LWTBoMzRBOHJRaDdB?=
 =?utf-8?B?Q1M3RDBrWFdjV21ZWFlPeUhKbVpNS1dVakI5N2oxVXVuVFBJdDFQdVhkOTEx?=
 =?utf-8?B?N3BockJnWTlVZGc1QVpzOUMvd3kzQTF1d0xadW1EZ3h0aS91TGdkZmVQTi9r?=
 =?utf-8?B?Z28zZm1aeHZwcnFqazlsaUw3amtDS3FkQ3k3MXNYeHdVSW1UWnNUUVFVaTNN?=
 =?utf-8?B?aVA0ODJnVm5Sa1dQcnE2VDk4bWJWUmhHb1pndzJHeURCamxEYUNPVzB4YVIx?=
 =?utf-8?B?aGYwNEJhTnJpajBDcEp0REExemF6K2JlYStJdHgwWXBlWUR1SnhSOE5RYU9l?=
 =?utf-8?B?M2JOZEJlYlNOSWlvdStuRFFiM2Q0cGlrWDZSeHFUSWpSbDJOdXBqMnYxREMv?=
 =?utf-8?B?THc2bWlMazNDdmY0Qk5YYnc0QkV1b2hLYVRtU3VwTmpDTVVtWUc0QlV5eXE0?=
 =?utf-8?B?TTJCRityaFBzTElTOWM2N1JiaFpPUmNJd2YrbEh0YmMwUm53V0NjMEFvOTBL?=
 =?utf-8?B?eXFSUXhKSERTSC9vd0xERmMyakZiZVp0TE1nUmdRSTNZNi81aGtXZkFYV0Zi?=
 =?utf-8?B?azY1MnlRazdaeDM0T3B5Q2NHdUJKU1l3K2VhRFhiNkc4emtKZytnVVU2bWRk?=
 =?utf-8?B?RzVzdk52THd0S2JuMk1KZzNvVlc3UTdjcm5FenlBbzF2WlpoeHVESVE4cTZF?=
 =?utf-8?B?dkVlWUx2ZkRQNWlEckxuL3VKN2tCRnN3RjNTNG9TZ1NNa3RrWE9PQTE0UUdn?=
 =?utf-8?B?R1NLMEFmdWVGeXhqVUdmZ3pDMExmM2ZGVkJOczlDdStiQVBzYTZJS3BZdmZC?=
 =?utf-8?B?TWxxRlBPU1d0dEN0SkdkZzMwQXE2TjVtcS9DcWN1Vlh2N2VjYzdxWlZMWXBl?=
 =?utf-8?B?eDlVTkhxeFlKWlhOSWNxeS8xaldhQXFUZCs3NHlpQ0FlU2dHR20raGJ2YlpO?=
 =?utf-8?B?ZWN5blF0WXF0SHJIbktWbWtYVkU2NHRJTDhMNWpWdmI2MHNPNG5RbldCc2lE?=
 =?utf-8?B?RTM1VlNCd3lJRmMrQnlKUk9sWUJPazd0SEJRWU1PQ0tSZE1rWFh4VXlmazk4?=
 =?utf-8?B?QU5hVCtOV25vUTEwV1pJbXZ3SUdKNWlnRnVpeUt3bW5NbytZSUVqVzVqZXpK?=
 =?utf-8?B?QkZQcGE2aExCRDRxWVN0ZnJiVUxRTnJTbUMrUEtJYk9CSFpseThEUXhabkZK?=
 =?utf-8?B?dkZNQkUwa2t5aSs1Q0h0MEN2V3BieHRVWXUzU2RyNm1va1plc3h4TTJzV0lM?=
 =?utf-8?B?TUtVemt1WDduSHp3Z3E1bTNCTmdiOVRTcUt1SEtUZklqQWU0MVROMDJrZ2N5?=
 =?utf-8?B?ci82S1JGOHQvY09QYW5nVU5qVmVaYzhka2lPcW81UTIvdHk5cCtEUmZpb2hU?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: aedf4548-f4a3-4a8e-3970-08ddf7516e46
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 07:52:07.2455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Frc0pWvAUiE19onDFBoONZbuhgdIplhs2MqHaoiHCGpb4x1vrdfh0b0p4Sc3pBGhzH+QgmhIm6sgfVU8GPV87FFteHRNTLGPKBGCuLJuWjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085215_302345_BF691BB5 
X-CRM114-Status: GOOD (  15.34  )
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

Hi Michael,

Am 17.09.2025 um 17:38 schrieb Michael Riesch via B4 Relay:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3568 Video Capture (VICAP) unit features a Digital Video Port
> (DVP). Add support for it.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 276 +++++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |   1 +
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |   1 +
>  3 files changed, 278 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> index 35e2b685a4d8..6b463d232283 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> @@ -331,6 +331,282 @@ const struct rkcif_dvp_match_data rkcif_px30_vip_dvp_match_data = {
>  	},
>  };
>  
> +static const struct rkcif_input_fmt rk3568_dvp_in_fmts[] = {
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +};
> +
> +static void rk3568_dvp_grf_setup(struct rkcif_device *rkcif)
> +{
> +	u32 con1 = RK3568_GRF_WRITE_ENABLE(RK3568_GRF_VI_CON1_CIF_DATAPATH |
> +					   RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM);
> +
> +	if (!rkcif->grf)
> +		return;
> +
> +	con1 |= rkcif->interfaces[RKCIF_DVP].dvp.dvp_clk_delay &
> +		RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM;
> +
> +	if (rkcif->interfaces[RKCIF_DVP].vep.bus.parallel.flags &
> +	    V4L2_MBUS_PCLK_SAMPLE_DUALEDGE)
> +		con1 |= RK3568_GRF_VI_CON1_CIF_DATAPATH;
> +
> +	regmap_write(rkcif->grf, RK3568_GRF_VI_CON1, con1);
> +}
> +
> +const struct rkcif_dvp_match_data rkcif_rk3568_vicap_dvp_match_data = {
> +	.in_fmts = rk3568_dvp_in_fmts,
> +	.in_fmts_num = ARRAY_SIZE(rk3568_dvp_in_fmts),
> +	.out_fmts = dvp_out_fmts,
> +	.out_fmts_num = ARRAY_SIZE(dvp_out_fmts),
> +	.setup = rk3568_dvp_grf_setup,
> +	.has_scaler = false,
> +	.regs = {
> +		[RKCIF_DVP_CTRL] = 0x00,
> +		[RKCIF_DVP_INTEN] = 0x04,
> +		[RKCIF_DVP_INTSTAT] = 0x08,
> +		[RKCIF_DVP_FOR] = 0x0c,
> +		[RKCIF_DVP_LINE_NUM_ADDR] = 0x2c,
> +		[RKCIF_DVP_FRM0_ADDR_Y] = 0x14,
> +		[RKCIF_DVP_FRM0_ADDR_UV] = 0x18,
> +		[RKCIF_DVP_FRM1_ADDR_Y] = 0x1c,
> +		[RKCIF_DVP_FRM1_ADDR_UV] = 0x20,
> +		[RKCIF_DVP_VIR_LINE_WIDTH] = 0x24,
> +		[RKCIF_DVP_SET_SIZE] = 0x28,
> +		[RKCIF_DVP_CROP] = 0x34,
> +		[RKCIF_DVP_FRAME_STATUS] = 0x3c,
> +		[RKCIF_DVP_LAST_LINE] = 0x44,
> +		[RKCIF_DVP_LAST_PIX] = 0x48,
> +	},
> +};
> +
>  static inline unsigned int rkcif_dvp_get_addr(struct rkcif_device *rkcif,
>  					      unsigned int index)
>  {
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
> index 5c58088dd348..4bd72d41ec2f 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
> @@ -13,6 +13,7 @@
>  #include "rkcif-common.h"
>  
>  extern const struct rkcif_dvp_match_data rkcif_px30_vip_dvp_match_data;
> +extern const struct rkcif_dvp_match_data rkcif_rk3568_vicap_dvp_match_data;
>  
>  int rkcif_dvp_register(struct rkcif_device *rkcif);
>  
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> index 285676445e44..44566d7e58d7 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> @@ -47,6 +47,7 @@ static const char *const rk3568_vicap_clks[] = {
>  static const struct rkcif_match_data rk3568_vicap_match_data = {
>  	.clks = rk3568_vicap_clks,
>  	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
> +	.dvp = &rkcif_rk3568_vicap_dvp_match_data,
>  };
>  
>  static const struct of_device_id rkcif_plat_of_match[] = {
> 

Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>

Tested on Wolfvision PF5 (with Wolfvision PF5 IO Expander).

Regards,
Gerald

