Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F8606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RcBvIbdj;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LYunSeGP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0Qnqa4TW2yY93kZXXwuP777dX1+9xeMp+rJ0ySko++w=; b=RcBvIbdjkCEPVLpW6kkKLkLumc
	qRWePPfLWWIwYkm2X5zFC8Z0pr0K1uwuPBw65Gjrlextda44uvmNOsaVJVtyFaslfq08oH6s/oWGb
	dMAsfvupD43d4CXGU3hx/43e8OBHi/SqauBZ3WU1jKM+dF33nDHQcmImQOEoBsIZj49BWsyuFJ3H/
	ll+Vh+CZlojronkCBDHUt/KUOYjGtd+HcyQ5fVEjrhnxX35wRKnsRSiL9710lzIM+ST+ZDllxs4es
	V88gLgnDZ7HT4B8mQLFQH56fWLbIRQ5x+6A0/F1P9RnBKAXi1u4DZN7GyMzPjIkQieaCbK9/72q/5
	b7AdArFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKapR-00000000Abr-1zMw;
	Sat, 24 Oct 2026 12:26:29 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKap5-00000000ALt-25wz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 12:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csEAaw9RkjH4jxULe9y4kR34Qx8RGwk3s5Mayrug5lZ+4x6o2HLGlE4UQ6lVRvxnG3Wh6gHZxLYJZzUDtKX56qSwW79IZ2+7CVZLxFilebj9vhYvNLr2BDGpGOPTUMEv/GqVv2mZu5sf6nQgUrUYgB1s3hXzbTP4ZquB4zYEg6hWfNJT4KcPFo5rnee2MvhM26kx0qEnJ6hJhIrmf0ZFBYsotevMsiSZnR44TlDWLxHbXnW+j/4WQeV6QAdJ+Y4HAuaclZN6JD5UNpKN9j6egHUOjWHKqiPkCB1I+hblmd0WDM0UMDUWDUHKUpLSBlh5C24Vqc9wSPEee2jj+vxYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Qnqa4TW2yY93kZXXwuP777dX1+9xeMp+rJ0ySko++w=;
 b=nYZaKCxeZLh0qZYX1sOrt/ZKAoMpXIGCZvD6D77EQu/SHN7bQelKzhe0OzoiX2UTxQ/vq+hzZcPlqyCrT6j0pybZvKDxun0I2aJqwwaC8VbSBVDlL+b6keO1okH0I6e9cvLRM6h1ikgd0Z+px13k1P0oScKAsZDGAGbRAd5EslkxzjZqyyRHuIWeIuFTLKkhWPcSzXE65xlIJiaW2UoMIUd3uPpOaUjdRUrfkYV3JbIQ1OiYuxDo5Nbfx7iJ8+bxoeLWnyzFZNOG9Tl7gduzsLHhotuENrm5cmqOY/23K4T3ZxtEvMlgtxnM+++srDH3a8OWXOgNx/vBj7qH6TEcWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Qnqa4TW2yY93kZXXwuP777dX1+9xeMp+rJ0ySko++w=;
 b=LYunSeGPn5SJGX9jUnWbh8PMkaJjXa/ydpxuDHjUifOj/dBfRTwZflWcHNCsP4kLEeK1cCmYGZyxALBoKZLE0m1/UzWC3Z3/AmnBj16hdhKFyrfiIvX5Lr+7gNv1YWvVxhG91Jw+0Z9Quc9UvRbWl8l2BmpnWJ+spk5tG76ZsvzPjY1BwmbYuJbyTpzwNJGsbVP+esYpTO0dCJYI6+EOTC9sdyU09Tkkl1am3n1JrmoshwgADhWDFiUsQ96TvF/OxMsTjnxQz7ivTUZSeJJrQZNR0SElIe6QW5PJaWVqxuwuf1swncyWYmueAahGbH1rtCt/IJoC2sFLyunFjYQRkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by GV1PR04MB10582.eurprd04.prod.outlook.com
 (2603:10a6:150:211::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Sat, 24 Oct
 2026 12:26:00 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0546.019; Sat, 24 Oct 2026
 12:26:00 +0000
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
	echanude@redhat.com
Subject: [PATCH 10/10] MAINTAINERS: Add NXP S32N7 UFS host controller entry
Date: Sat, 24 Oct 2026 14:25:33 +0200
Message-ID: <20261024122533.3609180-11-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024122533.3609180-1-larisa.grigore@oss.nxp.com>
References: <20261024122533.3609180-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0038.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::7) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|GV1PR04MB10582:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f94a560-1f21-492e-4146-08df31c9f691
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|23010399003|921020|11063799006|56012099006|261009223027099003|261021121427099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yiTYGYnaZCPT+ATu00IKkuPIROKEGR+wc98M4/n6i6DaDAFljZDh9H6aVbJqtcfY567/sWRY64vA1uO3gfnArvmudNk2sgMkhN4lnSJrsu4EZiPq6m/xn57SBTSa+c7Fnv7+JqxCpiH5PcFdMnSwxSff7bjuvrxLt8I9JStWbEjDn/fiScmU+loa017XU4DLfnmEP+K/n6ypk+Q9fjzY3insTI34gXnF8uKpECfNzWSykzmSAZBtPDwt7M2r7HEIkE1B4b5jVxoWk2tmuk6dOL9fwvEy9ALT1G+KtGRQeUxlJrUQj1DypNwlfUToyDtjwvYT+hIMbj81ciyyGhIrQgGbi91nH+kQdOxfFn4S60DMLt0KEPl5r/76/cgSFhtAhDjUwadp8Q9O8ZYQI3rFdyafxxz09zXqqVng6+nO2jLXpzmnqU7ZocGSC+2dchAjMiQywSLW9x3U1/80ta+A0m2gC6fD89J08ouYqLNQmzGTzXSwennZlSCV3PrXZYWJ86qYhwo/IvvgwvaQHnI9QoexLVjH7iUi/uPpThE0YI5OeGnnAs4iOrk78mDGHS8Ww6TuBxV5NkiteYKbNs/aikzqrpFE7kW/NalYPYyyABtnKCXKoh686FLPNK72v3o7/cJUOeIuy/IhlLiguDFbcYo51uEmbjtQj/b+l1lL/k6mJR7lLYCZpen/wOaj/HE2ZZ5miAr4klHF5Vi2yKDB5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(23010399003)(921020)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SytERVdrMTNUNnM2Q3dBcllRQ2tUZGN3MmRtWjcrKzkzMFFZSU00NDJPZXJi?=
 =?utf-8?B?b20rdGp2akZpQlp5K1Y3MHcxMWtWVndNZzlZemFaZVkwVFpsaFh3SHYyb3VT?=
 =?utf-8?B?OGlVZFJGT1BsSVorRVNIeXJ1dEFpSXZScUVsSGRld3U3dTBQcGx6Vy9sLzNt?=
 =?utf-8?B?N0FXYW5GUnNVV1M1a2JncEVQeGswaCtpdXZaS2Roeno0eGcxRDhRRGRaTmU2?=
 =?utf-8?B?c2JRYzU0cVE3MFFWOXNqaHIvQnVsblAwMktoRlljdDdzQjRmOVZ6Zm1QN1JV?=
 =?utf-8?B?R3NuajY2c0tnWGhJUS80eW9IeTkvY25yQkowQzFZblluS1JrRDMzTFZtSWpu?=
 =?utf-8?B?cGdtVmtHMzBDY2VGaG9uN3Q2M1Nucm9NanRNeGhyNnl6em9xZld2Q28wcjlC?=
 =?utf-8?B?MlprMVJYcDF6K1NLb09iTSsvd1V5TGRjVXBIbkExRUE2R1F5R1lmY3NVMWpF?=
 =?utf-8?B?VjI3ZlFKanZtczlrdkY5RWkwYUpIeEllbDN0aVNKeElWNG5jM2dDTjhZUVZ5?=
 =?utf-8?B?cGZXcDBlTzBMT2hMT2t2MGRXS3hkMUZGK2k1Ymc1QXZHSElxUGNTODVrd1h0?=
 =?utf-8?B?OXRYbmNzbTFSOGhhK2NXak5kMGtkb3JvOUNTUUUzTXdUNnM1VHU1cHVTSjV6?=
 =?utf-8?B?Q3NMVHc3WVR4Ylg0YWpHaExUdHR3amZsUDZiNFNObmJtcVdRQlQ1di9HRkhp?=
 =?utf-8?B?QXlZbW00d1RhRkk5NndraDJPNDRGb0NKTWRtWG9FQ1VuY1J0TlhYbFIzN2Fo?=
 =?utf-8?B?ZmxZN2QzVkh1d1FaQVNQVnNtODRzZ25HUXh0bmxCMzFZQ0VndWRnVGFLdnZu?=
 =?utf-8?B?SGhoMERlK0c1Q29tVzBrZGFROWwybmUxeVFhc0xwb29ZaVcvU3hSTk9hdzkv?=
 =?utf-8?B?clBpU1pCQS95RExnSkwrRzFOOHlURE9hb0lUbUlTL2lsQ1kySjk0amxwSXll?=
 =?utf-8?B?b29YYmVua0hPNjBVVGx5SHIwSncvaFF1VitsQUYzRUFhNlh3TkJwcmxuWHdX?=
 =?utf-8?B?VDdYcUg2NzhubW9KcGc1cnlMNGxHSmZLUmF1TzdmSW5hbTdEdkVaKzNNS2Zl?=
 =?utf-8?B?cmgrc2x5Qyt3aVp5Z1hJZnpaVEJrN0Ixd2tOTktxVWV3a3o2SHlSZHJHeThL?=
 =?utf-8?B?S3pKekFCeisyYklnUzdPSWJ5bG9ObnFwbUdIYitHY0tIZnVHazM0M3JLNFBv?=
 =?utf-8?B?d0NWZ2o5OW5DTnpkOEd0NzZwYi9IUm1SWE1aaDRLVS9vOEp2SDBEMjJmRUNJ?=
 =?utf-8?B?QzE3T2ZVQW1jWitpbkdseXNueXArN01vcUc5OHZONGEvNldkYWkxODZ6WHJI?=
 =?utf-8?B?STNPOGJ1ZUlpNVhxNXR3WUZSUTZMWURneEZGOGhMTVN1cWRKelhSK1BHS2FX?=
 =?utf-8?B?U0lrc3hDeTNNU3JqZjNHLzUyR09RYXJyeDduS3RyWnVVV2Y5OTN0YmRlS1do?=
 =?utf-8?B?dk93N3VIS0tpd09RMENvaHYyMlRTcVRnWk9YNDlzUWJqczFsNW1oZ0Jmd1JW?=
 =?utf-8?B?SWhLZ3NkeUYrRmY3ZExPSi9PcnF1N1hIVE9OVGlPSktGT25qWHN6Z1VtNHF2?=
 =?utf-8?B?eGxmTGVIZlFFeXZ2dVFudGQ5K1kyWksrMGNza2R5SFkxelB5VW1Fb3Vza29i?=
 =?utf-8?B?T1hSdzZxcFBBeXVjbC91Nys4TktpOTl5UHRXSEFROTBCbkptek5Gd3V5ZkFF?=
 =?utf-8?B?cVREd09pUEd1U0lsbFJpdnNHdTJVN3E2aWVleHMzSmlUQTByaExiaWZxdTha?=
 =?utf-8?B?eCt5WXZ0STBEc3ZaQ2M5eTRxR2x3S2czSnQxcnNJK0ZuTmxHWEJ5cHlYRUpV?=
 =?utf-8?B?bVJ3NithRVN3MXc2dDk0RlJ3MkNaeW5GdFExQlA5RTBHcEZWTHE0MVF3Z3dG?=
 =?utf-8?B?SjJzR0JKbWt4VUlTaVozNFgrMUhkcmxLdUozMWk3SFU0RnRPeTVKV1k3Qmgy?=
 =?utf-8?B?WE10ck9Uc3dlTisyVlk0N3RMMEVnaXI2ZDVTZlg4MWc2Vm5rQ3dmTTljT3Zw?=
 =?utf-8?B?WDBFOUNyODhBWnlCdTFwZXNpODNrUzRibW5OMGd0QWpFQmhWUG51RVRuN1NG?=
 =?utf-8?B?b3Z2ZnFRVitxakpNMTM5MXVTaG95Zy9vbWcrZ2hKL25BeXJseWJEQS8xOGJ0?=
 =?utf-8?B?SmJCWXdkR0wrYmJtMk1WaXJ2NFFPVkVZWEJmUkN2bFNEenBlL1l6SDlqN1hK?=
 =?utf-8?B?MWpnWmVsL0xBdXFRK2JTbVNEL1BNR1ppQ2FMSzJzUkhwVzc0QzEvSytlTk5G?=
 =?utf-8?B?WWY1UlFIaTBoaEVlUWF0Mis3Mm1udzFNMThIbWxNRjRWM2swaG5WczVwVWhC?=
 =?utf-8?B?S05rUU1TYnNxTHVrWThkVisrQ3BGRjAvM3JxRys1dzB6RW96MGpmZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f94a560-1f21-492e-4146-08df31c9f691
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 12:26:00.5472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPkmQaCj5mMMsgaNQr6Q+YK3CyH4G1a85v5pcLQRU2RDHEMTWe5snyeWnLNPcF1J/K7c7bdjWyWFgrgmPbYx7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_052607_548807_C4E8927F 
X-CRM114-Status: UNSURE (   8.58  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add maintainer for S32N7 UFS host controller driver.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b9424b630ac3..64c1873e9ff8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28363,6 +28363,15 @@ L:	linux-scsi@vger.kernel.org
 S:	Maintained
 F:	drivers/ufs/host/ufs-renesas.c
 
+UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER S32N7 HOOKS
+M:	Larisa Grigore <larisa.grigore@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-scsi@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/ufs/nxp,s32n79-ufshc.yaml
+F:	drivers/ufs/host/ufs-nxp-s32n7.c
+
 UNIWILL LAPTOP DRIVER
 M:	Armin Wolf <W_Armin@gmx.de>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0


