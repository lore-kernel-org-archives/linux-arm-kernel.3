Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC40606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VrbK+0LM;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QLOwrLbH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mt4MM2b+kEda7XeWiXcjklx11vtEoBsUUQ1dFr4um50=; b=VrbK+0LMBlWCORVyFsAkK3xUXu
	wbT3frTRYfc8zmFf7tumzKQ6keUl6LFb0MGabS6s6jb47EcBwxnbBgvQ0uaAy8RJu8m1kv0f/3dR5
	boY+Z1/ileBzovFrrG5u/KIk2ru/5rOSl3y70UFSEbi5lOPmEmuNGZFPdsIHRpHuX49Oo5sdxGJIS
	+2iKXLoqxC7PsyGHb/8O30f6xWOvX2aocCkWPt9PL0OteyNqYDr9xD/lCpPQinxRDow5vZnS7kzsE
	A89Ewo5A0WWaImevQwT7i7vRk5HdOBq6ZuW9AP8hPSlYhP6beHtoul9MqzAfQlSFhRZHBIxGQq1Gp
	a+YCQ3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKaos-00000000ADS-3Psq;
	Sat, 24 Oct 2026 12:25:54 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKaoq-00000000ACO-1FTS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 12:25:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/lMBHTzcZdHLCZ3oedHyie2/daZHCkVj8ns9Xh1VvtoF810e/YlaBv4+AtP4e5b5t7RhHEjWmmBh8dDZzjZnKW7nRXbW+P3aa/aGJm+vdlpdr4dWkYX+lsdr3MyDLI+6svUtig+xSg9jJXuoclimciiAHBjcJ/etqL5mPUPGzjCDH5hRc+V+ljvTAcQlzMA+EFRU+IrVeLIF4Wm+0MlbubLKU2jAXx4iHhLqRHJHR3t/gh+iBvDkU6hMERsVPmbysMRHLkPH5pCDB0HJJ48dLbJg98OBzneS/zkUZru7WwLymQ2rudusudqcH6EwNicRc5octNWS6/8E3bz2dNVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mt4MM2b+kEda7XeWiXcjklx11vtEoBsUUQ1dFr4um50=;
 b=cPMkl0oMzg1cI+8/buGkbpq2/d0L+4ciZqZIE2e2fMyaxD26979xQ0b8KL+ny2D599KuuKG95fr9HLayw1eYebPKX3dkfBb4Lru24z3BzTIjBtc+pcpSGvRkLxAhXnq8zyk1BH2u/oZb3zRisu0XwMjj2DvImDrkwZNrarBUWL0CkGAPFXuyLPErkXWjJ91AZ7i8TxlXD/UJH8QnnQsku1G8s2cXHLPbcrop1GbY6pvrkprl59W23uJRFCaXrtAUdF1J3Ri0TB311BjJdL551YddrLPtpyH9e5+LNXMPNaVLEEIqhQeqjMsUmPyqrcVm1KqnheTOkkSbTKTkwDrBlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mt4MM2b+kEda7XeWiXcjklx11vtEoBsUUQ1dFr4um50=;
 b=QLOwrLbHbjL8r+b3XsTuPiQdtrl59GwnCpfdMeebKV7eBZ4pD/d01LQdn90TWKQiXBSBGtoCi6kJs7gh6H+kdkGSBGE/OzE1ErlS5frZuiWulO8JpB9gvLY2m8N5EJbuoQfENRuI+v60j9Edna4aLmRy4uwAZRVqyE6KEhDOcxhHfASBs8ewZDq7NSgWdprfAtnOE1+4/IKt3vgRzQXr8pR2KKlus0LY4UmvT4W0ECHL5Yu/S7/Xp6kTi9bZL6u9qN49733BBeqkpfB5/Mhnks0Zuoa7MMMu9n5ToSKL7lzxRUxFzFgcYU2AgnibtzmO7jo+hOQzj8O4TkkbyZrEmQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by FRRPR04MB12572.eurprd04.prod.outlook.com
 (2603:10a6:d10:1d0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Sat, 24 Oct
 2026 12:25:45 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0546.019; Sat, 24 Oct 2026
 12:25:44 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Hannes Reinicke <hare@suse.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 01/10] scsi: ufs: dwc: Return a negative error if the link is down
Date: Sat, 24 Oct 2026 14:25:24 +0200
Message-ID: <20261024122533.3609180-2-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024122533.3609180-1-larisa.grigore@oss.nxp.com>
References: <20261024122533.3609180-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::18) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|FRRPR04MB12572:EE_
X-MS-Office365-Filtering-Correlation-Id: 75215b4c-8c39-451b-11ce-08df31c9ed1a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|10067099003|18002099003|22082099003|921020|11063799006|56012099006|261009223027099003|261022105027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: KCK5cSYsH3M0+py63DyTEL9wTysJFXaLjnmymvXIgBFEwguzAgalUgpbmlCLUkEycPulSheLkGKYYMxvyBlAfKFtpSImYSJ9TKJzLo6AXxz1dvmpEgFOhnFsp1p4o3ioewSQfeJswkd0dJ1iPNjDEtiQN9R3yc12/8vB1eyYL4LrfSgSzyTWv4tKmiKp5o88b7sGXh5MlNQUvpANHie8jDLw5hczvE9YF/eCuu/IV2Q6aPo4LIDo6OoSpSC/y4twzGnCkTMlRqjWuGSMkeXRuxItAZKu1qJzre0XbKu5DfF0LK1PrICUJkj9arpTLVaNJ1HeCEBSTz79b2NQ2UgOZvNT8XQvIyrt48aAT4JfB00YsOzmEKMDxfpX+8Hr8Ie3I2jcUO9LjgGMBQj9ElZvD9+MwHxmqsLSnGGU/OpuPYN0qyP6V68U/p4nAcDAPkI4HfxNQNpneSJaM6qKJIruFjPfpZDwLfhaeUmc/7BDIEuaIQ3TPDHNYHs9XdA5ShFVpIAPJtkXtkeDC+d046M1lovsT4OGs1fhJrvuof/hX6KVoHbKALakyrdefSD5KnJ9xEc3qvQmrGS3RWsgBbS8WCsgy81/oyNoRyXcBPlwNkhpGql4cd0ZGDO5k2cFwBtOGlKjV2AkDyf7nPFWflsY2fv6Ge4cogjCP9RrPm5Gddv+OF3DzgzipydMZ2Ai+YaTALuMmsaqU2sCgzJ3ANscZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(921020)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW05cDBtd0dFUEtVbEtZS09hb1FlbEpMcisvLzczZU81eFN2bE11VENUTFF4?=
 =?utf-8?B?SXU2dE11U2JJM2JPRElGUDRxaERXM1UwY2VJOUF2NUVKeFlFUEUvQXR6TUdN?=
 =?utf-8?B?WW5GYm16emdsSGNQVm94ZU5lNDgwWXJJR0ROQUlzRWRTejNWcDZjdU9hRTUv?=
 =?utf-8?B?aEF3RDEwbm14ZVc2dkZPb0FzUFVHcW02Z3NjZEFlZ2oweUdyU1FFU0xuRWY3?=
 =?utf-8?B?OEp3eUhndWVYT2s3NlRhTHlvTUUyZzF4ZGl0SGpaOHpCWVlWR2FDL2QvcWFy?=
 =?utf-8?B?L1RodFVLZUpKOWoxbWNuOXNjN2ZyNzFJSysySVlSRXcza3RpVmFDaDROSWJZ?=
 =?utf-8?B?a3VLTTlYcU5vd1VUZ2tOdnhyRWtMMndUUExmbkFmNE9neTB0azJRSkxXU25Q?=
 =?utf-8?B?NkM0K0Z5d2ZlN0RVaDBGVWRJL2hjcHRJY3BPT0ZNTE9IOHpFeEJyNC9FZHU2?=
 =?utf-8?B?eTZNSnJCMVdvZnpidEVSY0EzMFUzNGorRnB2aXcvR1ZQU1BVeVNFR2E5UTdn?=
 =?utf-8?B?c0RQUHUvOEMwYjdrM3dybHhBRlVWQk5STG9HZkMra0hqZ216clZBdlA2d1R2?=
 =?utf-8?B?YVArWFhjY3Zjdzd6VnUvNEJwb3dPaWVLcVg4eFA2U203S3R3Y1VBaTZBNjdD?=
 =?utf-8?B?VHZZM1ZDSHZEMTFlVzBCTFZjNlBEU3NkU0Z1T2FrZVUzTEV6K0dDZXhGclNW?=
 =?utf-8?B?eDYwWHJjSTl5d21DSnlpdGRKaEIwWUlXMU9xQ3BRTmpyeGpyM3FseWZOMENL?=
 =?utf-8?B?K2U1MFNXRzBqa1QrUzN5M0xYSW5LL01xaTJGV3JPYmFNZUxCNzVTaDRqdWZW?=
 =?utf-8?B?K2krMVZ2VDFwQlFSMWdkTWlTV3JNclVzZkd5UiswbTluSFZubDhEcGJXUG5a?=
 =?utf-8?B?ZjZNNjdCcVhKWDM2RTA1NEtLNkZRd2ZOMGxCNXcwWmJUemVWMm4vTEd2bGVu?=
 =?utf-8?B?dDhwR1ZBZ1RQVmxRZGh1akpxUkRRcld4MjIzZE91cyt5OGoxQ3RKNUpUTEtJ?=
 =?utf-8?B?eXYzNXdwcTZLVGE2NjRHOEkzMnF3Ky9MVXBjWjFMVXlvNy9SWFJ2WWVlQWxF?=
 =?utf-8?B?ZUFqQnNMbWV5blpTR1g5VmwxUUZHaTNOSkVLcGNYUXlIU2ZpQ3N2bTFHMDk4?=
 =?utf-8?B?SEtoSUhBczAydHlWK0hUUm1nZ3Y0TkwwRWkzeXZvOWdVSWNZMXYzRi9IRkN5?=
 =?utf-8?B?cDZoaVNOOGpXMSttWXlQSlBFc0hJbVF6WEhwWE9kalZvdkxhWmkrcGtJdCtx?=
 =?utf-8?B?Ykp2R3B0eDJGaVllR2xCZE5KOWJ3eUV6Q0g3ZjNBbFp2TElYa3VEYjZxWjRH?=
 =?utf-8?B?ZEQvM0JTODV2WTBNZFBHemt2Yk9PL0FpRkJ4aEtVTUJRVjV5K3RMeTB4R0FG?=
 =?utf-8?B?Mis4YWQ1SmJQN2dPdG5FWEY4S3JRZ0x6TzZBSzUwUjZPRGM1c3dtK1VXY3JL?=
 =?utf-8?B?MmRzRjVkcDZIUnNhdzU5N0JISlh6TWJnR2k2bmdNUzMxekdtdUZZdFMzQmI1?=
 =?utf-8?B?VVR0WkRuU2FCU1JRckZOa3dIQWRIeFpzaXc3eFd3ajZ5ZWxHSDZBRGQ4Tm9V?=
 =?utf-8?B?S25uWG9GMXNjeFl4WXBGb0dqaG51VHgzQWtnNUorMEtoT3R3RzRGN0UrdHEz?=
 =?utf-8?B?eHNSL2R5b1ltR2JWMmpKM2t6QXNFYkw3N0pjVU5INTFUcmxCSUZBRis5ZFBr?=
 =?utf-8?B?SUxBeUVOTmk2Q3M3TTlXK0pXdFJkVWtFRlp5MS9BcllscEM0b3hJenAxb3l6?=
 =?utf-8?B?UXBPbnJ6OGFVRTdISGpxaVQwUERYU2J1ZXVnUDU1MlNmZng1R01uU2tYWGx5?=
 =?utf-8?B?VVBzSmRyc0s3a2VOdGxzQ1ZMQytMejRudStCR3VwOXRiS21HdmErY0ZXUXo0?=
 =?utf-8?B?WXhIL0tCdkh0d2UrZGFkblVJQ1J1YTJOYXZyUDhWSE5IdlBudHN0blp6c2hu?=
 =?utf-8?B?b1RqSmQzMTN1K0NkT3JoSjAzbTk4REpCL0lUMmlqSllicGFORFYxV2crbUhX?=
 =?utf-8?B?QUI2OTVDNVc4SjFDWTVuZk1WZ2ZnQTlFVUpvMmlqRVdaa1dRUFdRMjgwMEZt?=
 =?utf-8?B?NEs5Q0s3bWFnckcyQ25ROGk2OHluWnkrcXJZc0pUOHl1d1JZTGZ2ZDVBSXNF?=
 =?utf-8?B?aVROa2ZjUXpPa091blUvSWIxTXJYTW5hR1pnakNWVFlkRThXTDJ2VE9yK2V1?=
 =?utf-8?B?Vjduc3ZwRmZwSkhNbVZ3VmdxNE5kNEhpUnZ2aWpieVdGWU5QL1RMK0ZKaENr?=
 =?utf-8?B?ck81UE9pWlBiRmVJeGxJQVh2cWxLME92dkJnRWdOcVVTMWJYZGxESXBwZ01G?=
 =?utf-8?B?bThoNHVwcWFpWEJJWlVBRHlvckFHbEhGSzRreFFqbUFBa0kyY1JqQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75215b4c-8c39-451b-11ce-08df31c9ed1a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 12:25:44.6700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6GwfuPxkJTDfK53ciBQ1GiHnyZtSOlucZr0OIFsmNE5hon1GBlzXF0FgFno0KcBkMTn/4eiQCEiqtj9auAXfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12572
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_052552_346760_9A3455D3 
X-CRM114-Status: GOOD (  14.00  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ufshcd_dwc_link_is_up() returns 1 when the UniPro link is not up. The
value may propagate through callers that expect failures to be reported as
negative errno values.

Return -ENOLINK when the link is down, and report a failed
ufshcd_dme_get() as a negative errno instead of its positive UIC result.
Declare dme_result as u32 to match the ufshcd_dme_get() parameter type.

Fixes: 4b9ffb5a353b ("ufs: add support for DesignWare Controller")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/ufs/host/ufshcd-dwc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/host/ufshcd-dwc.c b/drivers/ufs/host/ufshcd-dwc.c
index 21b1cf912dcc..71433b4d04aa 100644
--- a/drivers/ufs/host/ufshcd-dwc.c
+++ b/drivers/ufs/host/ufshcd-dwc.c
@@ -48,20 +48,23 @@ static void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
  * ufshcd_dwc_link_is_up() - check if link is up.
  * @hba: private structure pointer
  *
- * Return: 0 on success, non-zero value on failure.
+ * Return: 0 on success, a negative errno value on failure.
  */
 static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
 {
-	int dme_result = 0;
+	u32 dme_result = 0;
+	int ret;
 
-	ufshcd_dme_get(hba, UIC_ARG_MIB(VS_POWERSTATE), &dme_result);
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(VS_POWERSTATE), &dme_result);
+	if (ret)
+		return ret > 0 ? -EIO : ret;
 
 	if (dme_result == UFSHCD_LINK_IS_UP) {
 		ufshcd_set_link_active(hba);
 		return 0;
 	}
 
-	return 1;
+	return -ENOLINK;
 }
 
 /**
-- 
2.43.0


