Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA0606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kCnaTPAW;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fvRQDk3K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b/YdeIe3S04OQ4ZYTvPmBVIB4mwiU+hwwue6q+M2uuQ=; b=kCnaTPAW+rVB5ISkssfDBYfOJS
	zLsk9Npo7IkKZPa/MkEiZ1aUYV8zv5Jvm5cgVTIQrHv94SfuIOslBM8rSzgYFe3Gy7Ic96sndGIye
	H9nYWn+zN1DS7MzPxI0UldLtETYCB4w/2Lle/HjlohEoUkZHkdQi4q94Cz+EAk7wo/RkPyRTTmV8X
	c2/wKP3FX9QcpGAd6w+GPczhIclw4zIGsce3+qKe2VCsf9fIOe68p2e2zWCnZIAtbC2mz/bIio+Di
	mm9v+F2BrR6ljXlG49WkuWtF6DAU4hslgdPkjW9YWE2FRmxyjacNeVZh9/Hj9VCNtCXRKFqoPcSGv
	QaO/ILwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3VE-0000000AQow-2IZP;
	Thu, 05 Nov 2026 19:52:04 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Tr-0000000AQIE-2S8F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TO9qcs+Ry1BoLoTNmRULHuJZ9W7TC4DlgOvMgcUZT87z5kLdJeSI4zDk3NO+a4Z1cNPFjlGXyOMoqoRGnpwSwhbQjLlCB/aYj9MmxIK+YRXla5GZtwrHkv5h9J/HgY8zNQhtRI8Ssr8Fw9083eeg1OrrfIss8LilOrhx9BWPwCaA33U6IgIl4hV69tpJBtKjPoY5PGERZUyhDAyJ+nMDInhfmzspyV4DY+CrU1y48hVaae+l/w50Bk2yfMIPv+HS75NULpYKwhNvhJI48sQ7aYBgxkshPak/wXtFZ9yNC3mvuYw36f7K8GJ+3/DaNnJ93nlakvDT1MakEAKed4WMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/YdeIe3S04OQ4ZYTvPmBVIB4mwiU+hwwue6q+M2uuQ=;
 b=MOkf9kl5n6DGR1nuvnOstNuzWaNk6WD3jtXC8CxJITWkgSbUBn3Z/wAc1Alk//CO/Zzp+ZubJdAl2NeZ+IKAbiiHR7ZEkw18H0LjWR5AokdSHrLD+pAWGLyUeQ/lEZa3RITwEA350tqGAozB0vLy83vAHbCDCvhlzrntXxoCsF/qoe+2zHgpEbG414lg6thG9xcGr4yvIijzsSG6b985YF9PfzaRdGCstLxEeNCFknCaoc4/VP/Khb243ntzDvF0fvLsHkPd2k9XnNQ4LRQCelHUx5pGgHH7ep/tC4zmbVuBtqZmN1T+X8sw2TO3ui6+LpeoQtGhRUINXXPGWpCdZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/YdeIe3S04OQ4ZYTvPmBVIB4mwiU+hwwue6q+M2uuQ=;
 b=fvRQDk3K3IP44KX/xBOeEqm1+w/rY3fTQnua6Vjr95KmjcCWoefy8HJ1tJOCMzl3LLlUabnXbEpklGUOUmaaLAOYnsu3VvujYzrxS29T8Bk8sgJBK8Pn3gUDEVse0fTclzsUMAy0fnjRleBNZTAHUX7aXIjZzeB6uR3/dgBw+yPHRNd1ypa/0BMEewgdTQRMaDtTbTwt6w7TtAvrhY+RKhX/q0osVd03eebJequosUIJK5S6RCAaQcnT1ggN1a7tYgHg+MXDPBk/34XX3fJEPN8LdmEqU2ix/3GqZVMQNwpGEnZKuPtEjK6V1+33UFlXEPUjyoa60yvlvm2cxAP58Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by MMZPR04MB483805.eurprd04.prod.outlook.com
 (2603:10a6:190:45::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:50:35 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 19:50:35 +0000
From: Frank.Li@oss.nxp.com
To: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-kernel@vger.kernel.org,
	linux-bsp@toradex.com
Subject: Re: [PATCH] MAINTAINERS: Add entry for Toradex boards
Date: Thu,  5 Nov 2026 14:50:05 -0500
Message-ID: <179390820286.1646920.14350309115622219689.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009064705.10116-1-francesco@dolcini.it>
References: <20261009064705.10116-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR02CA0114.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::16) To GV2PR04MB12436.eurprd04.prod.outlook.com
 (2603:10a6:150:343::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|MMZPR04MB483805:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b0fcbd-a6d3-4c8d-e52d-08df3b760eaf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|11063799006|56012099006|261022105027099003|261022075727099003|261009223027099003|261028144727099003|261026140227099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: URygD+0avJxHQpU9Qli3Qwta2s8eoeCh2e1kqcm6m16bSsmV+oEjhWoWftpAWVs3/PoP1Ci7///EBo2xU3hh2VPpR/687RUcW8ly9uFZLgtZOIZJzR9DWwJx8oh1cYzPOJZ4nsxzAfvSwVkumjuaSBAf/01+y7ES08fbuGmqbuBJKjMnoTg2fCyKoFElc/Xry6MIyn1PKY4Oq9HAsrbpAIOhvZCXNOEzFLh9WZGx8oRh+GZCUo9o0X4PlehqAlPQ2S3Id4JW+DJcT8JXP5wp31VQbZ+NFFiL3v6Nocqy4B8oEvLr5tZkRlvZ3KAYIWlU+10nOWt/PfN89YssNGBFUS/ojWpmAYuHHArfcaXA4SzudQC+QPkNpmA4feP6k3aTMjDfgcO2rvv/EkAGhNg6MM3vhWL1M1277Ony25VowQi/weLH1DPkUFPKdNe8m/vY3mvrilw3ulJXFwMiSwI+76rP4XdJa87j4xpsf0iB3JbP2XmLbz7p5YvbGHj7C6Wh6WObnD32iYEcHrfTTIOL9awEepuGY9vtVXCMC1jhEh0UTsYqE5pfsLD9i/8rhlgR//tVwInTOeZVCU8oebjjLkg2pDmqxsWdsab8gsgnKOU2XE3eGGthdRE/bbLUu5ftIN8M04SzXhO55+H2sI3LuDASXvLHl2yt/7DGKDMqjGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjVHV0k5bE1pL2ovS0hUM3JQM2Jsay9ISTU4RlltVVpoWEs3SW9GRTBWc1Rm?=
 =?utf-8?B?R3VJNG1IcUR1UE1JU3ArMHl4a2U5ZkxSSmVZdWJjSDRzVlpPbkZZZ0ZoZ1lj?=
 =?utf-8?B?dkRJMS9Xc2NxQlFCZ2RrVm0vNkFFWnF2UU5VT3JKUDRWUGttVFJTRFp1T29q?=
 =?utf-8?B?R2tsNkVOM09lSXlwQ1RDajFSVkEyUTRHZXM3QVFJSVAvL1JoYnJnZGNENHRu?=
 =?utf-8?B?aTEyZ29Qa1BQcU1EQStxT0QvU1VybU9JSFNjRWp6NVNjSVdsTUtSNzZTbDRH?=
 =?utf-8?B?V29QVGhjMkljZ0w0cDZNVnNwYTNjeVZnUzFCdmI2bXhwWGFVTlhFakR1Sks0?=
 =?utf-8?B?dG1VVmh5MVhTTXViSGZHcXN4UUQ5ZFM2Z1V0R1Fka1RxaytTbGpadVB4aWhZ?=
 =?utf-8?B?UlFJbk5OU1cwMUV6c2o5OGxYWHkrbkNzalFZMDNjT1hZUGl2dGpCSU1lZFNU?=
 =?utf-8?B?Z0xoTHpxZjkzZzBiV0dod2kzVllud0VCSm9uZm54Vy9yWkVMVkZLaXRhU2xl?=
 =?utf-8?B?VUFqTFliU2FwK0MrcXdSYXdRNVdCRzVtdUR4dGNnUkk4VUVlK2pQWHVsYUdv?=
 =?utf-8?B?S3JmWlZCNVRqN1pLNzh2N3FabG4yYlI3OWp6WGZPYVA3YkZLaUFVWWx1M3NH?=
 =?utf-8?B?RmdRbFU3TVpJMTlYeWY1MU1kUFFuUGthQU9iZU5FUkw5bGVLVEFxVGxMVkJK?=
 =?utf-8?B?ZE1iTUFlTUxYS0t2ZlpaeCtydmpTNmR6eDltcXp0R2pQai9RcEw2TWZnYlFw?=
 =?utf-8?B?L0Z2MkN0eHc5MmJUcXl3L2RMcit6bUdQVHVaN29KcFUrYVVQMjhFaUl4N3Bs?=
 =?utf-8?B?d1kvQ2FRbG40aFNvclFUOXpqOTBCMEVWYXdYbVRRUTlGWDB2WnllakMvU05M?=
 =?utf-8?B?eDJGYWYzQXNZM00zakxWS0sycENteEhTMzUxOGJJS3FoSUdtK0hld0dRQUdF?=
 =?utf-8?B?eWtlSStxbDBGQ2JzbkNQQjZLOEwxby8zZ3BaOXBHWkFYWUNlK2Rrb3ExK04y?=
 =?utf-8?B?U21vS2prQW1WYm9mdDRKV09sbWkzTldIZERoUVhkS082YzlJK1FYaktpc01x?=
 =?utf-8?B?SWV3akxqTUJ3eUtDb29YcnBXanN2Zy9sbnNtSmgycmZqUVloQ2hkY0s1SWU4?=
 =?utf-8?B?d1ZoZE1weUR1d2htWXNiTEtpWUhIdDc3c0liZk8vNUZ3Y09lbTdmYUZVcENh?=
 =?utf-8?B?ZURIeGNuT0hLYzBxL29nVWFadVg1SmVYVVcxUjZaOXZSbllobW1CRzZZSkVt?=
 =?utf-8?B?UWNWNW5uN1NnNjlXbXZISmh0WHF6aVZDWUxCTXNIN0Y4dWJ4VTdpemVsai9h?=
 =?utf-8?B?YkZRUUZGYUpJQ0QzYTBNVE9ldkJFbnoxZ1dOaTd4NndMbG1JZlUrMmczZVF3?=
 =?utf-8?B?Qk5JT01uaDc0SUxxdERUV0xuaTJjR3ZLZjJRY2RQVVJvWnBEUjYwdHdHQUlq?=
 =?utf-8?B?Yng1R3Z6MGhCdENlVlZWcmY4MlpvbXBzMHhoQXFuL085bDNKemRHN0ZudmZO?=
 =?utf-8?B?eXZkTk04bURRQmhiZ0ZMQ1VvSmJ5QjJKN2w1eDNkOWxTa1VQNCt1QW02cnp5?=
 =?utf-8?B?QmZIbVdIbWVNMnJDcndZRERIM2lVWUNIc25qTityNkVnQmtYWkR2c0FiT05q?=
 =?utf-8?B?YUNmUHVPSzVKcTM4YSthU2w5RVFoUHJ0QldRNW83Qmh6Y2NCekJyOHN0Q1dQ?=
 =?utf-8?B?c0kxZWIwN3dleW1lOEd6b2hRTnZlTXloenlwS2VwTXpHeENMSndlWkFEV05X?=
 =?utf-8?B?MXc0WVlHQWd1eGIrcDlKR1J0T3NFa2d4WC9XYUprUTZFVzUvU3ZHWU4zVFJZ?=
 =?utf-8?B?M2gwQTJ6c1hGdEhnLzJiRU9ieVlwNDllNVJnYlFGcGdCRllFVys5clZCM2dz?=
 =?utf-8?B?RmZXTitxOHd6VGtWajVWNE5mcVVPQlh6T3B6NkpvM1JHS2V1RWszdVBERlpH?=
 =?utf-8?B?a2I2SEhCUTNZTUVSTWZLN1UwTTkxNXdqbFNZTldjZ2R2SlQrV0FxbzdUaG9O?=
 =?utf-8?B?OFNUS29ldUNTVHZkNkNMQ2lQbE9OclAveTYvQkd0ZUpWd2hUSU9GSk1sNUVv?=
 =?utf-8?B?SWpNTk1Xd2VCY00vMzVVd2xlZWRKQ0YvMDBJa2NmTGpkMGtjVHJ0YTdmeSsv?=
 =?utf-8?B?a0Q0aW8veWxCUHhTVkVEVUU1ZXMwMVlVeVlTbXIzZncvb1RuZUQvT2tsWEpX?=
 =?utf-8?B?d0V4dTk4Q3JOVTc0K2tDeE16N3BsZElYN2pKQjRnRE1VRkxHMjVFcXcxNWNB?=
 =?utf-8?B?Qno4Y3NnSjNJNE9QQTdYWXMwcHN0Nmk4ZEZ3Zzg3bnowcmNRZ2NCc2VrTFNl?=
 =?utf-8?B?d3JMT21GbzhnZHQvczVJT0J6MFQ5a01MTjlJYmZqbWpadXpOVlFuaXR5SURa?=
 =?utf-8?Q?yMtTACNuiNu6k9mftKydiW9Cahd3VQrI0c/Yc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b0fcbd-a6d3-4c8d-e52d-08df3b760eaf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12436.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:50:35.7013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhFzFF1/iFXQxxeH3G39c/SL35EIZkvTCg/ES1FAJu4ESL/OfbDQARAhRZiTEij5NseVgCjof17ZmLGobbIe51IaKq0Oh2NJu4ezkjJwqDlqGCwP4AQAnQG1XB8lvskl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB483805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_115041_301678_D8727B69 
X-CRM114-Status: UNSURE (   8.46  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Fri, 09 Oct 2026 08:47:04 +0200, Francesco Dolcini wrote:
> Add a MAINTAINERS entry for Toradex board device trees to ensure
> that we are included in patch discussions and can provide reviews
> and feedback on proposed changes.
> 
> Toradex has been developing and supporting its System on Modules and
> carrier boards for many years, including their Linux mainline support.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Add entry for Toradex boards
      commit: eaff1feb58b6241c7a6ac4db441ca26fdcfe359d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

