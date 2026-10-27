Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5B1606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4kEGkOKm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CC6UOn1R;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LyaDovdU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r2L6E59qTdisc1FOreb2xY3EGbt5Y6r+FkrSD2mXuLI=; b=4kEGkOKmfiw4eLlEJ6ndgX4NYP
	HsTFq/grBPRqIweP0jV/Qljz6cQaRtd5j81x7Bz/IrJT0zbkKQ/x6DRogh4oDWT6TGz2AmWdXi9s2
	i4pGY3c9jC8hjMe1SQz1cPtQ95C6jV1SJmK4Ev8dY2M65SKrzMjC6QZE8o6RxlpePfnqNpl/wHdIk
	+7H20B+FEXSScHn2sU+daZwUXJgMabQoYjf+AJLSvxvPG0v6BzfToG9VwlhCwKt0IXp0wpzqXuL0e
	j2CT4qWlsY3ys0dKYInhNrU6W+Pjcpm0ts5QsCvsTDRQxwGej1xTNEbaTfQ1DdqXwhNej8Xj2d6I9
	RGz9nwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg3l-00000004aji-1qX3;
	Tue, 27 Oct 2026 12:13:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg3j-00000004ags-3V0D
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=r2L6E59qTdisc1FOreb2xY3EGbt5Y6r+FkrSD2mXuLI=; b=CC6UOn1Ro7YlcXDLaE60Zpdkji
	diHTlyH/MkwXKjuBDueVtqanN/f5b4aAO9J9+pSGgRrmDzTPydgVm6vWEUOS2a+4CgVLXC+UqMSVy
	lnxnJsQDu4GImFJLzZhxkXJhwdYVjOpTRFDPcYbPevY9sKk2uKzHGsA/EMoLMbXzPhBCRQQxJEGGF
	4z6zS0T8BKy/hz3tJ1I/9IhgmokBfSaX4Jq9LKDSUYSs92FHW8mpeCGcNwcTRMMTHoCVJ9ndWv2Zf
	J91z73kIIuCZwtoi+gufpJwx21aP/hjR+57awLsFlxg/T7AoQudUHO/ZLHioXELTxTtOpRed1Ae4J
	3dIt3b0g==;
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg3e-0000000Eui0-2jOe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:13:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sco05yAk+s+G3gRbDJ22pDWVDCQBdV273mIMW6plv4v5RMsKvm3TLYTTuVVeUpIUB2YXX1tmm5LhLcCj1I+se16M/trSil7IZmMPpqjZ4xBy59t2eo1oKbCneNo/D+mOXBNB3p/0w3btm6r8tj0ofFqHlnRvn6PUkamCCg5USdoi2guR2SPiHBvAigmbPwXpFXbes+ycmquBY1edvn8o4ZMgT0f9CZ/tA8PGFgG5NzEPgoRqu7gC7y4YZgpwWsgNBnrAObPOsc6eX4irUF8cjuBClM1gy+0yvgd0X5sWeAWsA+AO3royj3KCnfy8PT2fFThxZgbdjhbaCEn5rEA8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2L6E59qTdisc1FOreb2xY3EGbt5Y6r+FkrSD2mXuLI=;
 b=bryRokzxPWDkRgtBhWOYXULg1b7eBCKxo2KuRAhNkZx0WYESPUmKRbTHeQFcMxPJkBpgMDO59ZoG34fqyq8oo1RONdF6L3rlcAJ0o1b/Au7URcUVvJsQ1mT+oxNkU6LYRy8rl1cCxmtYBjz45KLPlELxlkHS1rKsRkkeZpXxANwL7+iCWPlOm3LlWUrG4XuceP/+TpbeB+LmenqI4ZcgjRFFUV7ffkjOUuNRdrPcbUzIRkyV3enOkCDjrSbU00kTWgonff2zI72NEXm5aFrJuuGMZkhQ95KwfAOByjMbgnNtSgSGps1lKVdHiBBl+TMPNziVWU4/KhqWN+stvSvMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2L6E59qTdisc1FOreb2xY3EGbt5Y6r+FkrSD2mXuLI=;
 b=LyaDovdUtg/cF7QS+hFcajafyp3PRfv8cc19ebuHpDkpSfmBbY2tuO2ol6tzi0nHXYm864Zr7vi0mawd5tyGacESIiDQ4dAKFU5Ca2JN6RLeqbBgEaY2uC/RrkH0Ba6fyb0dua98aPK+jwDhswZobSelfcuHmD6QnP4AL77GKcWCqNDzXrqR3UCqTCiiLn17SFE3GjaF16PE/PztQM7UNysdeDI7DwaF5AO+kNCdK/RCAA1M8eUa5bmv7JuLmKFjzsuALXsjt85O8hvtKxAExpaKK/0b9jd4YwGggaSTaj3zghh/wJ4kW2ZExeISBGZzSOcldUtfS+7+aCBh4Z2otA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:13:36 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:13:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:35 +0800
Subject: [PATCH v7 08/12] gpio: mxc: use devres functions to simplify probe
 code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-8-7b602d70c149@nxp.com>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 3efd7cc8-112a-4745-81bd-08df3423b9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|261026140227099003|11063799006|261026121527099003|261021123027099003|261021121427099003|261009221227099003|261009223027099003|56012099006|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: N2uJllSJmWkPOgMyYv6kIW2lQp2I2AcVJ1hv6SfHdD1YhJjECcIlrmLpMxk2dyKnd+71qpV8A8ipn9j6yEE5pj8WF/QJRYtMpmzeN9UrpqebiqgBLtiS4IzyiSLbyMZR2Jjiss0o/ce6NvurLCWrBhe/dP+lLVzbbfJzC6M1GiKqALD2qzxipSI7GDLf4LY6KFxesTpyuP/F0nVWU7lEdHMvcnL9J8GWPBOLEWoNPm5TE9L5vWIPOdLVQwiPsjscb0kVeaQ50GHW10oaXH9rXldB0tI2EgUBB8e0I0dkxhgQAR18PIBjXB0qkc2wBlKNALWlddxt5sos7ruDcnL5+qCjkyVNy+nStThAfGM2u6Wmcx4gbTsKcpAvsrndG3GIY+exDIEauPStbvIcztLb9YsFsOzD3U2RswR1S061ONkk+WGpMUgkBpGZBOUmA/+SUpN7Vfew1DS0G83yr/yo0kQISSL3PrbhytLxe27Kg49NKDe+8WyIafucsvd575ogBGzQE/x8I0gANf7B1eYL4jR8TYXB6gpujarEdv1/iuhPdHYOD2JihQnkUqLXAbHIID7HqIK/PEzy0OXli1pyLeewy/mC001XweTN88lb5s0LbS4jVHhN2ha9GvJQyDqGNGW+ItfTTVX+2Mk59nuF4vEbpETVeucaqD/mwjIrGS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(261026140227099003)(11063799006)(261026121527099003)(261021123027099003)(261021121427099003)(261009221227099003)(261009223027099003)(56012099006)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnNybjM4L1JYN3Y5Q1haYWlBQS9IWUtObmU2aGFpZTZnRyt2WTVUQWZhclJC?=
 =?utf-8?B?WkkwYlJUT0VJZmttUllKWEtwMjJ5c0syTWJQSXhKMVVHMVlORSsvMzNJMThS?=
 =?utf-8?B?eEhES3E5cGZ6c0RVcHBMbk5KbWNIN3dJZ1dnT1pCRjI2aVJ6L0xzVjlhdUVl?=
 =?utf-8?B?VTNoSnRnTzJEaWdSdlltc0hDMjRDbGh2ZXp0MlZEVXhlYk5MdzJ2aVJ5MW1U?=
 =?utf-8?B?dmk0Q0tBNm9WSndybXhIdW9ZcmdhY3NldGZyVTQ0OGcrUFRNSVRXTWpac1px?=
 =?utf-8?B?SjJmTjJCeTZLVjhBcW0yd0ZjdnBndUVjMExzekVHWHl0OW93UVRma1pEZUND?=
 =?utf-8?B?RWpBOHZ0Mmt0OFlzL0lWVWI4aGg2d0JYZmJMMmFOVnhxazcybjlnVmtHQmRL?=
 =?utf-8?B?MVcyN3F6YVEvTFYxTXYxRHMxMEFudVZKWmVvaElhcUYyMDc4VE04am5scmd1?=
 =?utf-8?B?TG0vd29LL1dHZEFRcSsrKy9uc1dUdngxNVIxcHV4V3BEWGR2VlphOWgvRmtw?=
 =?utf-8?B?SmV5M0ZmN1NDcVRqd0IxRDJXVVpsWGVMaGZGY0w4Q3FBcDU5bkVuMXBDc2ph?=
 =?utf-8?B?NGluazZYb205Z05IVHhQd0dkSnpFVFUyb0xuTlNlTm12aUV4cS94SnJWaFh5?=
 =?utf-8?B?YjBDL1NtbVQyd3BNSjhXYWlZMmhaK3BuUW1NZ0FqbjNTMjJKM0JpSjc3MHJp?=
 =?utf-8?B?dG13YndpMkFRRjFIenNDc3E4T3UzR2Nla0ZDVlBURGxzUnBLRE1mY1FLb0RS?=
 =?utf-8?B?Zk5NZnQ5bldDLzNmckhWeTd4MjBwSEMrUTBLczVIQm50MUFubGxLQkxKbGVq?=
 =?utf-8?B?L2tpR2tNVFNpOTVWaHBzeEtmNk1PbVIrb1JTQVlXQ3liKzIxS0NHdStrOHpj?=
 =?utf-8?B?MHc1LzNXQ3ZDTksxbU1HYXdMRXRRaVBxNEVxRXdvam1Da1JkamE3RDJpalJn?=
 =?utf-8?B?V0lUZVJaS1N2WUlORmdGRjBHdDZMSFFSajVoUmNzYzd2ellqSlF2enhTYTFv?=
 =?utf-8?B?dnhkeGlxQlByb3N2R01jbXBPWDFYU2d3ak5RbTdpcDNxMm5qTWxqWityTWht?=
 =?utf-8?B?MGFVUmxRK0RjMVBwV2lZYXorUEpOcncyVHlxTVFhWVM3WVV0N3hoUmR0cENh?=
 =?utf-8?B?TGhqekUyK3FLejQ0cms3elVqcEFnTU5ZMGZUelpOZ2t1VmoxWDJIR0hnZmxU?=
 =?utf-8?B?eXp5K01nZWhPbFMySXE5QURmUndLOHRYSkRnTHJmdmZ0Nkp6R3ZSTWc5VGFZ?=
 =?utf-8?B?QUFkd0JOdmZXZnE2NGhoTzgxYXBYZFE0cEJDTlM5UkpiWFpMeStrNGxzYVdV?=
 =?utf-8?B?d2JQaW9ZaTJkN2FmaUJxUGpJMElhNklYY2xZdHdIejF0cCtsMVllMC9jODNv?=
 =?utf-8?B?TW1iT28zMGFkc1hTeUJaTElwZmZtWGxHcVQ3c2J6Vnh6NzUvVWVUdkxuVExs?=
 =?utf-8?B?aDUxV2szZDZUNFltWmoxeE43Vk5BUWZYOTA2M1h2bXY3REFkVXRjZnZuSmdE?=
 =?utf-8?B?YjF0MHlPMGFjcXVYUXNBU0F2am51czdUcGZUdklYeGpja09UT0ZHd2FDYXYz?=
 =?utf-8?B?cTV6ZFFLdVlha04rMWFjSmt2bFdyaUZwek1idUp6bHIrendSTUQ3d29OeUo0?=
 =?utf-8?B?Q2FwdldVLzYvZ0p4SDBCeHUwTzcrVnUwc2hKajEvc3FsSTBHZ2VrQ3gyb2U3?=
 =?utf-8?B?VlJMTnJrUnlkdE14eTBKWElWSmFtb1pQQWdTU2lFVExXMUFDQkRJak1XeUJU?=
 =?utf-8?B?SldXQTFSWXhZNEtaWW4xK3JENHZsL2d2TjYwUmNnSEV6eUczN2Jib2YrTDhB?=
 =?utf-8?B?TGlaQTBOQnNjS0xjb1ducy82RFMyRm5zY1JFamtvUmdQUVlqbFRiemRRbU1F?=
 =?utf-8?B?Y3ZUckc1dnNrVytJOU9wZEt6MlZ4aW5ic3JsQmthR2RnTjhBUXd1Tlh3MmlS?=
 =?utf-8?B?ckh0UzFIdDQ5eWdESWQxNVo3R2J3cmdGMmRNakdnQllvcUVsRGd1amwxZER1?=
 =?utf-8?B?Yjl0OSt4UHkzNUVCTnpHb0JXbHlXSjJweWVnTEU1cFVlNjE5bithUVJjZWRx?=
 =?utf-8?B?RFppTkZrQURoQ1ppQWw4Q0JLSXg2UDRLclIvV1NRM2V4c3h6OVNlSU56Mk1D?=
 =?utf-8?B?NjgxS2twTnllY2l1NHpkcDhiOFY5SlRLeW0wdjZiaDdVQWNlSXdQdzBFSjlk?=
 =?utf-8?B?dUxXa2Z3MUc5US9qWjJRbHRqK0Y4TTJPa0pPTUlIaGJhMEQwYlVuSGlmUzRm?=
 =?utf-8?B?bEVYYzlUd3pHYlh5dFBRaGVjL3lUQU9ITEo5blR0dDROMy82bm5qeDNMZnlk?=
 =?utf-8?B?Z25iYVNacWVmR1ArekhPaEs0R3BaeUV6NzFmblFkQ3R3NVpyV092b0E0Yks3?=
 =?utf-8?Q?QNE2/JfyVDMZz49EjtmYgJ7OlYsEwTL1Yjd4E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efd7cc8-112a-4745-81bd-08df3423b9cd
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:13:35.6805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98X53H1Pahuo++nf49keAC3Qx4JD8qP5plvm/G6BOxrzqpxMkiWerlRygwcPjFnADfXsPExXvQchlphkpiemv/u9zIpKOozXrg+xSQhlQr3vlp9V9g1kBEP7lSgQgGPQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_121339_079426_CF4D23F0 
X-CRM114-Status: GOOD (  16.64  )
X-Spam-Score: 0.9 (/)
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

From: Peng Fan <peng.fan@nxp.com>

Replace irq_domain_create_legacy() with devm_irq_domain_instantiate()
and convert the remaining manually-unwound IRQ resources in probe to
devres management.

The runtime PM cleanup guard from the previous commit disables runtime PM
and drops the probe reference on these error returns.

With every allocation after the PM block now devm-managed, the
out_irqdomain_remove and out_bgio labels are no longer needed.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 68857730b5e3..eeb7d36e6b44 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -465,6 +465,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
+	struct irq_domain_info d_info;
 	struct mxc_gpio_port *port;
 	int irq_count;
 	int irq_base;
@@ -531,7 +532,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		goto out_bgio;
+		return err;
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -546,24 +547,28 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		port->gen_gc.gc.base = -1;
 
 	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
-	if (irq_base < 0) {
-		err = irq_base;
-		goto out_bgio;
-	}
+	if (irq_base < 0)
+		return irq_base;
+
+	d_info = (struct irq_domain_info) {
+		.fwnode		= dev_fwnode(dev),
+		.size		= 32,
+		.hwirq_max	= 32,
+		.virq_base	= irq_base,
+		.ops		= &irq_domain_simple_ops,
+		.dev		= dev,
+	};
 
-	port->domain = irq_domain_create_legacy(dev_fwnode(dev), 32, irq_base, 0,
-						&irq_domain_simple_ops, NULL);
-	if (!port->domain) {
-		err = -ENODEV;
-		goto out_bgio;
-	}
+	port->domain = devm_irq_domain_instantiate(dev, &d_info);
+	if (IS_ERR(port->domain))
+		return PTR_ERR(port->domain);
 
 	irq_domain_set_pm_device(port->domain, dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		goto out_irqdomain_remove;
+		return err;
 
 	/*
 	 * Register the GPIO chip last: devm_gpiochip_add_data() makes the
@@ -572,7 +577,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	 */
 	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
 	if (err)
-		goto out_irqdomain_remove;
+		return err;
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
@@ -584,12 +589,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
-
-out_irqdomain_remove:
-	irq_domain_remove(port->domain);
-out_bgio:
-	dev_info(dev, "%s failed with errno %d\n", __func__, err);
-	return err;
 }
 
 static void mxc_gpio_save_regs(struct mxc_gpio_port *port)

-- 
2.51.0


