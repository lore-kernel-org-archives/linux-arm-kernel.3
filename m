Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A414F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A3xpqFfd;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AcBm+Suy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CC1vODEmnnKTb78LKS5DK2XiaKmJQ0FAYi5+oeoQS5A=; b=A3xpqFfdnCjnsSFesLzfW/Ppyi
	Qj1EPNqc0RKL9ou3aW6xfWVcotIORR10ThKCAAbI386wfECt330mHjpgqIk9sgzNoinpPsEcRmeb5
	ycNOOgGDFXC2wTic7qDJNzg8QknTg7NwTzI4Y7pxPovFrWRtR1oWYD0zgSB61Mn7px+f7F7HNGdpL
	u4y4UnSRoAIo6Ha3GjDoWwDbr5k6uYPprlqSIl2n/8km8O7UDE9Rd5j5oECe0rKksZNAqq4iUGXNe
	bopoZ+6bwJlFYsdQwJR7V9nwEXvXHjwBrOzhmGDntf3AwAfYRcShnWSYpC5gLGFFJ2QEMclf5pwk0
	9K/te0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLb7-00000008k6A-12UL;
	Thu, 29 Oct 2026 08:34:57 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLb4-00000008k5o-1YGg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793262894; x=1824798894;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+9SdYDIIsgDBK5E/VjNBid0iUvKH4Eiw/oM+jcXu5NQ=;
  b=AcBm+SuySgcCRAuPRBoNQ/s8+LLMPNWfPLwPWXRIQM0IS7egy89Ah5yp
   nQyOmdLzijy1elUy1WIdaOuXaSGz/1sLBxbgulNvyI36/Th0gvtZ4ZIpB
   Z7cz+9CclBZeF84yIHaIbNbs0mkpMuruwtRAHnc37jVh5noCJf+EtFOPY
   Kd4yB5f0afy5KzKoMjvE9GF4ofUZ7ibImQom2nyUuUZSZEzAE7FWbHZQN
   TrbfBoqszikEiArG7vcDqTdBlvzSE4tfDgedq7CsS1EZEonhpgNU0MHxv
   XPv3eUZYT8SvSoYboiKwVsN0t9ljCPncDs/tga706n0TmjDvxJf9ttUfb
   A==;
X-CSE-ConnectionGUID: fKZeUfqpQKGBQ4HU4RC4Qw==
X-CSE-MsgGUID: jkPlI5M+StqGzE5hWkAluQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1881806"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1881806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 01:34:53 -0700
X-CSE-ConnectionGUID: CYaOu/tlRX+Y+cwfM7FWpg==
X-CSE-MsgGUID: PSIvczLLRjKkbHefo7P+XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5085464"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 01:34:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:34:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:34:52 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:34:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNVXN43iw/hP9rTURulKtxdSWTrYXHF05KrRMqQaGkJ73y2MKYAeKwvUzsLVZFdLuXy9QhivUnYZv7InBl9URetDHxfef8kFxCaKn5B852y1YZjeHFwdkMN8BAAqBCEaRqx9HE4LbeLyfiQkTc4gTQI9/Me8+XkA2Uw1oMBXEU1dtEvBVyUVHdtYrSjcIupoth0gSG+/hsFyEWxJcbE6GabvoXVoy2aTHZ4HQa64KbGSxwxb9nsadNI17OZg5W9h396pjAHENvF6JeTdDbKDFma+CzXc5WQZPKGVXv0NDtzJVLNQ6EO3sB0OhZKU3ARRyzg/FtMAbP1Y/8e7PJRIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CC1vODEmnnKTb78LKS5DK2XiaKmJQ0FAYi5+oeoQS5A=;
 b=uFkae5tx+21j2PNn6s/9NsoeXo3WdOvfbHP0J+OwPqJTohIUrJLj11Koj78IMj7AFv4PEcJ2XLxOgZBCl22JbzfLJeA7nBQ0h5MWQ49mUf9HvbRhE676+bdxxEwDwgkGnzj//QnyOvY8XJG3/v0jz3b6sZffgzjgemuTRxm7i546jwoV72SAC+dPvBa2+DBuNk9Gtczwn+B8TCIJcAhYAHsGMLktnoR4CilI9mBKyTHl+Q7ZMzethdW8ldymsM1nGdroTu/RshUyC8hqx4W7FVVW5csPLAVLdMJjY235975JBlHqmFMw7STMEJ8WvnOwcu2c7stto9ij2CCpwkg98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM3PR11MB8672.namprd11.prod.outlook.com (2603:10b6:0:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 08:34:49 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 08:34:49 +0000
Message-ID: <01a5ece6-2b40-4e38-aa69-7a5b974862ee@intel.com>
Date: Thu, 29 Oct 2026 10:34:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-brcmstb: don't log an error for missing BOOT
 registers
To: Karl Mehltretter <kmehltretter@gmail.com>, Kamal Dasu
	<kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Ulf Hansson
	<ulfh@kernel.org>
CC: Florian Fainelli <florian.fainelli@broadcom.com>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20261009003201.68288-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20261009003201.68288-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0149.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::25) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM3PR11MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: d69ce475-729a-4f1e-9e17-08df35977e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|261028144727099003|261026140227099003|261021123027099003|11063799006|261009223027099003|10067099003|56012099006|261021121427099003|261022075727099003|261022105027099003|260925021911599003|261026121527099003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: 3ObRQRWNEqkO5dFiB5+0ZlQS5DuREa2oqSJURVbDjjfgFKGK8ZfYKEHy1/AD7KTs4e/yaI+hvVLq2sgLIT8svDLJdUNhRhihOTUPCgFoRLpq+WvhssHhdh0nOBp+LtCK/XwobJ5a0nef3NYU4ALbaZ8gaJW/SP0nDpuYSSasv8Vcoowc+oclryCxOHGXCGbQeQtkVck22TyLmhaGKd3+BnzqvJapEUmkW4jnL1a56BXiYcTuZlVSQF5SEnyILYCvtcAvdenc9YppNXGchBQVA9R+DU0a0lNJGeGjDrTZvHZ2WqkVBq3WsNn6Bdpr0wsYLC7DeaNBiFE1HxEDIQlYxmgmtDUMeldY7xsVNR3xOqhMS01uZdQVllcmvcJMJdRpmz7nmCweJKEKaeoEBAQ6YYgtqjOHeKJ09XICwsEN5/wgCG93L7QBC2auG/l4Bc2BCur/jogiXOiIniXWj4D7QBFJkYu8k4ZGgE51B+plVW1cK7dDPgxCTqu6cMM41Z6yr1OysaMhKhaddayZxkZdxa0OHtGJpKqnb1JyLsAnPRaVvwpqcWhMdU0LyGH1w5gbyZC3zbCFsRvGOuVjItEBTTxy6FDyzNeuc7GcSANv4O7IytNCllXAsn2IwjD8g05VP6ykQ6/hCBK4elQzJVQQgLRh4Q6HVaAPB73vsjAeeig=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(261028144727099003)(261026140227099003)(261021123027099003)(11063799006)(261009223027099003)(10067099003)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(260925021911599003)(261026121527099003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXJzZmFMRnp3S2ViVmFHM0MzOFlOT1ZvdGNxUko4ZGluYThvNG1tUnM3dU00?=
 =?utf-8?B?VXVreTJ1eHJzanBMRDRrZEhlV2U1emVZRFl2RFdudWdlK2p2QW5OdEtGd2F1?=
 =?utf-8?B?ZnJSMXBtdWRoRVpxUlVZN1g4RHZOcTJsS0Qrcy9hdVdyK24vWDFtVnlFNXFv?=
 =?utf-8?B?WXJ0REpTL0E4NjZQNTVLS3RuTENQNzQyb3hVeVJXVUxXdXdObHlLc2ZhZVp1?=
 =?utf-8?B?cVBXSzFtYnhTT3ptRHBYZEw5TDcvVG5MaUVOZk16VmRtd3RzbkFaQmo2YktG?=
 =?utf-8?B?alFNek5ZWnBOV3RKb1c3RytDVGZyTWx6WTB0dmJueWZ5ZnAvSHBqeDFXbFM1?=
 =?utf-8?B?OVpPN09HMlJGcVF3TlR2L1VvQzFwU0tyU05DNGkvQURHV1ljZS9kbnlKT2VM?=
 =?utf-8?B?cURKbDFvVFpkNzUrNWk2Um1NNGVDNjRXY242VmRrOUVBTDVuU2FiMkQ0RVlj?=
 =?utf-8?B?Z1lRNzJSTWF2bzUzbTU2UU5hRGxLUTUzUUlLSkdJVE9TSXhvZzFpdzFxWGtD?=
 =?utf-8?B?QzdYL1QyTmNWYk1WQmtpYUxBZ1M5L0dNY3NhNjd6UWJRN0pyU2JuQlZ5N3Uv?=
 =?utf-8?B?V1hUeVdXSDJ5QWVrdkNNcjFRdHhRTUljTGRmOTlHalhJMlFWeEtBZXpGaUQw?=
 =?utf-8?B?TGNLRGNzMm1odWVRbHltMitSVll0akpwM2s5VWlteEVQRlVEQmNFcEVQNXlu?=
 =?utf-8?B?RUpFWkZuK2MwVkFzdGtGQjk4RzlIL3RWdUc0aUJEbmlvaHFjN3dZWjVjRGxj?=
 =?utf-8?B?Z0hnbFQvdzQ1bjdOdjdtRWg4OFBGWG1VL05vYkJIR1Z0TXNTZklSZ2tDMzdQ?=
 =?utf-8?B?WWhZbFpieTFjelZBN0JmbitXeDNJcWhueXhOL3pmK3kvUjdmcjZORG0ybURM?=
 =?utf-8?B?MUMxUk5SaWNrK05vcG9wSEN0c3EyaHhQMkJCeEZ1ME5kWHNBcVJ3MkRlcWNv?=
 =?utf-8?B?NDl4azR1ZjFrUG1QQ0NPTVNRR0JNMzBPTHJmRmFuL0ZncnpuODNaSTZPMmx4?=
 =?utf-8?B?TEtpWjhxWVcvL3UvTVgyWFNEL2NDUVduZjQ3OGlmZVlJK3JnQlBQWWoybi9R?=
 =?utf-8?B?M2djeWhOcTNjQ2VRNC9BMEdJMGljelRFT2ptVGQwZTNBcU5aZjRERERiVnhT?=
 =?utf-8?B?LzBBRVR5OTg2MXprTnZOc2diRXlZSXp6b0YzVEVReVNjVEJkTGtwRjFXbS84?=
 =?utf-8?B?OGlHNk1TN0FwWUJoQjREVjZFMzJrdXVncVI5Z2J5OC9GanREMlRGVHdidElD?=
 =?utf-8?B?VG0ydi9pOUpVS2I1T0ZUL2tYNkFQODRlL3FGYlB0WXBJWjJmR1VZZ3QzVjE3?=
 =?utf-8?B?NUVkMmttK2VGVkhuMUJoNkRid3E2RlRZSUxkbmEwRDM1VWl6bXhYRXplUksy?=
 =?utf-8?B?anpJaCthQ3V1bno2ZnJkTGFFY2w4bmVHUzlPN1BmNlZ0UXZLTXBMV01sclVB?=
 =?utf-8?B?WTh2WFF5VWNvek5YakVGdi83MHNpV1Z1dVV6cllQRFZtUk9vaDZoeHI1UU9L?=
 =?utf-8?B?RTQydVJDQVd6SWVONnRSRXRveW9OV3JJTFhBNVJoNzhLWGVwZXlMK2l5bUVR?=
 =?utf-8?B?UHlVQ1BpTm1Nd1czaGZvdnNrcFAra040L1lMd2M1OVpGVUV5UmVPQ0V1MjVv?=
 =?utf-8?B?Wk1EcVZkTkVMYVRkMXVILzE2cjY2aGtsVy9SWDdaRFl0NnU5eG04ZXZhemxB?=
 =?utf-8?B?VzQrVTRFbU1JSE5CdlZMNjBPMXN4RDJaSlB6VXFuRFRaTHU0MU9NT1NYVXJT?=
 =?utf-8?B?Nk9Fc3IxZHhTWkRGa3JpeFgwV2x6ZU9ycWw1RWMvK2k4TkpCTC8wbkxPSzc0?=
 =?utf-8?B?akpyRnBYTXp3YlhjMFJMVUNoMzJRNSt4emRmS25Oa2Rtb1R6YlNyakYva1VT?=
 =?utf-8?B?V2ladURSWXZVeEQ0RmZWL0w3Ri91NDdNMEJ3V1JqZEw1VkJHV2dkMkdYZUc2?=
 =?utf-8?B?ZzFLK3BjSGtoQ1FhU2c1bnozdVBWZE5CdDBBLzNSRGo2TGc1aHAwSUhlbnpa?=
 =?utf-8?B?V0xSemtlSTFmTGJXT002aTBkZ2NNemRxWEtIVE82TWV6dCtVbVRLdThNcWI2?=
 =?utf-8?B?Ync4T1E0L1pMRUZXR3Btc0pFVjAvR3duUVFvY0VEUWlmc3F2MG45RWNsNXVU?=
 =?utf-8?B?S0VRZTFYVXpCNjJQVitxbHZ1SkFMcHpPd0lSSUdWSTdpcG03K3VUNUp2MFBx?=
 =?utf-8?B?L3UrMkg2a1pKcjVQNUR6d0c2YThDUFltcUJJRGpKRTgvbGNKUVY3eGV3WHZq?=
 =?utf-8?B?RzduN093WjZhaUxTZlRSbW9NMWRGdzhXWWdISThKbDBxNzU4VE85VUZ0Q29J?=
 =?utf-8?B?LzBRcVg0TmNERmhvRUpjZFEyUllWNnFKbHNDUXpBOHlDRGQ3RnFUN2c4cVRU?=
 =?utf-8?Q?/CFsKQphAD7th/lA=3D?=
X-Exchange-RoutingPolicyChecked: 4tcPM3HmXbSoD5gHySxZikfsTIOWfeR4K+f0GdRAZt447bP+I1oM5XYadujMsyCegIjKxk8opUaMGsJDl6A8Tq3ALobsf8BHRneYUZF4GHuJ7rZqEjJdzS8wMENcGOWS0knjp87loTC8M+zR6Qioa14lFiY/f0ksYDoowSNmvGEd+Fk27BTc9hVCjcHNgENuThHSwuW1jOzlTb/33zi5UaYdlSC2KLuMGGm5Xnc363tlKSfh1ZHEMLXIz7dnG3jjOi6pR0h9iNSGwCGKgatU1j8TEtx+yU3Lzsxwuk5Cm4NamGKcVMt3FzJSFT8Sw9CFro6Oj1WwNQ95/NiVxCKaWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d69ce475-729a-4f1e-9e17-08df35977e82
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:34:49.1167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJ/fn0ROw/0fmnbVulbABGG7GvLTNo6qJXALVZRmZnpEACxYt2sbHUM7zESAGkX1tIt2UDwg/GuLJJWJwKGFMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_013454_456053_A0DE91FE 
X-CRM114-Status: GOOD (  27.48  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/10/2026 03:32, Karl Mehltretter wrote:
> The BOOT register range is optional: the probe function ignores a
> failure to map it and the suspend/resume code checks for NULL. It is
> mapped with devm_platform_get_and_ioremap_resource(), though, which
> calls dev_err_probe() when the resource does not exist. Every
> non-removable host without a third reg entry therefore logs an error
> at probe time and then works normally.
> 
> The binding only describes the "host" and "cfg" ranges, so this is the
> case for the in-tree users. On the Raspberry Pi 5 family (BCM2712),
> where the SDIO host of the Wi-Fi module is non-removable, each boot
> prints:
> 
>   sdhci-brcmstb 1001100000.mmc: error -EINVAL: invalid resource (null)
> 
> Look the resource up with platform_get_resource() first and map it only
> when it is present. Hosts that do have the range are mapped by the same
> two calls as before.
> 
> Fixes: b7e614802e3f ("mmc: sdhci-brcmstb: save and restore registers during PM")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> Tested on a Raspberry Pi 500+ with v7.3-rc4: the message is gone, the
> SDIO card is detected as before and Wi-Fi works. Suspend/resume, the
> only user of these registers, was not tested.
> 
>  drivers/mmc/host/sdhci-brcmstb.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index 1de2f05..7c17a3c 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -491,6 +491,7 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
>  	struct sdhci_brcmstb_priv *priv;
>  	u32 actual_clock_mhz;
>  	struct sdhci_host *host;
> +	struct resource *boot_res;
>  	struct clk *clk;
>  	struct clk *base_clk = NULL;
>  	int res;
> @@ -534,9 +535,13 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
>  
>  	/* map non-standard BOOT registers if present */
>  	if (host->mmc->caps & MMC_CAP_NONREMOVABLE) {
> -		priv->boot_regs = devm_platform_get_and_ioremap_resource(pdev, 2, NULL);
> -		if (IS_ERR(priv->boot_regs))
> -			priv->boot_regs = NULL;
> +		boot_res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> +		if (boot_res) {
> +			priv->boot_regs = devm_ioremap_resource(&pdev->dev,
> +								boot_res);
> +			if (IS_ERR(priv->boot_regs))
> +				priv->boot_regs = NULL;
> +		}
>  	}
>  
>  	/*
> 
> base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898


