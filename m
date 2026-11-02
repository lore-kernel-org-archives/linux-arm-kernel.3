Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33662606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 05:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T0GWWCwN;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=selector1 header.b=TJ4coB+6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uxoaB0oXPxOohgw6ObJfwgDwkfHcSJ4uP3TcyXX+8kQ=; b=T0GWWCwNfMHAxoGSNTIuPuQr1Z
	CUUczgVweypwTGd0eYTPD52Oa2wyR8z3YGJRLBlN574bDmwPqwjHM+e0mjf/ZGr0TEkzmdA9XvVk4
	LfsbbIQwVXa+gwedbO2v8Wyon7tyeDs7LDkkrU3BNAWw4lyOnKZ+MI7F/3tFbaMj5LRY2kG8mDu4B
	B6hiRGIbkLNdaxc06uhtCFOstoACC6SdAU9nZhOEhZh4H8HH4aADXDCT7ScSmC/AuqMr5xPBFlRYX
	8Y+IKitJPUuZA+duko/BXA9a9QnNxYZEJFts6BspU88+M8OPto0dwZOa14KCxx9XrtdUeO1bqm4Zo
	p2Y4TeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNknq-0000000FbEG-3zeH;
	Mon, 02 Nov 2026 05:41:54 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNknn-0000000FbDj-2QBC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 05:41:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6cC9Re79A+fCh8X64HePcVl6nE9r+kT6SHVCb9ybBAauKotZii3VVJwzE4OaSHNLAsM/sQieEtzjDQP4vYoPj/AHiu1csIr0AuEgTc8wXPLupbqXywiGMCnc1vfhQq1NoVnZ+2E5aoaiVu603+Fd4x4jfgqm2fLGvB/yeCL6NhVQKQwmwO6mn/vUhtzKgR63rcGOILvLyVcnrFUJcMx8xJlH9LYwS/OPVh/geCLl7wQkRF5AJfTqycDDh/TkhW70hFrLdC4+P7J3wVP3NtX0QlyeXGI0P9FD3DLXpeX/+JDWINhs2LHXEfdsp2jIaNuwCXcIzahQtZUClH99b0Kzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxoaB0oXPxOohgw6ObJfwgDwkfHcSJ4uP3TcyXX+8kQ=;
 b=TOvIHA3yIIqHKx5c56rq8jgLuBtQ8uVK1e1N1JVeHsM0a1oj6FXQDfjmALTibIVVWQdEIXARlG7QDrpL20iHmnYEXblmIjibvrS7F2npBKOptPlfGA7i50nZl1uj7dzbfDqs97kOKlWoH/bqgZouFRqzUNck44Z/3u28Swlj2OnzwLsS2qWYB+FVblrFWWUkiySeYKUPdO9w4pzukL8OWTLHeiEK0jBjNM8UqA6JyTW/InuFukGCghUHfRiM79umf9g0JoFEeH5LzR7KxjLmIG9tN0TCquUe7w+hixH+hWavYeXTTW9VnYO7E9NRN4TqJqj8g29jcI+ptVPnVybnDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxoaB0oXPxOohgw6ObJfwgDwkfHcSJ4uP3TcyXX+8kQ=;
 b=TJ4coB+6niNRkko737dBWdAmt7SSiU46MYQVgYLlDhl1ru40x1klIea/uFm+xHoA70rOWu2jkOB0hKd7xzPpYCx7OPoQThr6I/nYhADZ7W4VnOye4C9hQVw9r9WR7zsnolkKySmdryosyceY5M1pXnDathxH1h5CT4Wd6hQXEHAhGAXJz4BiVVlxCo+oJh7ZATXacwKMzLFlEupDMkqOedoxPjTpI+zWCN1n2Tr9ZjJwEIquAk7FqjeR9A0I9DPULNYNzMgs6XHr0nMDpxiNO5bvkQcwn86odkD9Yj9g3AiYIrZ8vNz/tdkTNI83lNr7y7cqGbUHdIUu3VqeVpSUjw==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by TY4PR01MB12924.jpnprd01.prod.outlook.com
 (2603:1096:405:1e8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:41:41 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 05:41:40 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: "Reinette Chatre <reinette.chatre@intel.com>" <reinette.chatre@intel.com>,
	"ben.horgan@arm.com" <ben.horgan@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>
CC: "tony.luck@intel.com" <tony.luck@intel.com>, "yu.c.chen@intel.com"
	<yu.c.chen@intel.com>, "babu.moger@amd.com" <babu.moger@amd.com>,
	"fustini@kernel.org" <fustini@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: Re: [RFC PATCH v2 04/10] arm_mpam: resctrl: Split control and
 monitoring domain setup into helpers
Thread-Topic: [RFC PATCH v2 04/10] arm_mpam: resctrl: Split control and
 monitoring domain setup into helpers
Thread-Index: AQHdaou8Q0HmZhjcaUKgr1ImmrYbJLcaQ2u4
Date: Mon, 2 Nov 2026 05:41:40 +0000
Message-ID: <TY4PR01MB16930DAEC61D558A935F8C27E8B6A2@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20621c28067916be2709fc4437473f1ccad7e334.1792443633.git.reinette.chatre@intel.com>
In-Reply-To: <20621c28067916be2709fc4437473f1ccad7e334.1792443633.git.reinette.chatre@intel.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-11-02T05:41:18.613Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|TY4PR01MB12924:EE_
x-ms-office365-filtering-correlation-id: 22e7ca71-8ecc-4f6c-6d0b-08df38a3f872
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|38070700021|11063799006|5023799004|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|18002099003|22082099003|6133799003|1580799027;
x-microsoft-antispam-message-info: OBmJ4ivryJNA3CgpNmblKgPVCgYyeFJ/ss248okbjrUz8zuw1A/GHBV2VJlI+x5UVMIX2EFJKn4Rg3N/OHbUmV5ppnqmUpPupfYO5rXfkNF82K09FeHj6h1fYwOrQC/9m+UdVLhLTCydaDui3ekO5XgOdeBDtULXTD6k393bvUmQvsWfmvMW/9/jhVlHDSG1BhQ9O7Mee5Z0GiZEp2gGfMyiFpXbkRsjssLbPwp3Q/FDwYNvwCn/8S6+9WJQfQGfW5KTV9IrYa7xQCYkp72IQ0QXIxWulLTZUbc4SUyREVGSc5cjV8441ul8oh+fspqH1v/yChuNvhUA+9dMVKOT4WSXFLebhLAtr3IeEAyLhDRbwoNVgtn+jMtHmdy8P+zn9l13BdVnufRtjL/J4qqRKrllo2xjAZEmeVsGtsXvnH8m2zzYoaGgeIJ2s6A5vPnb+IDKvQbtA62VfbiCdEPqaOBlJG0ipP3XnRo6EhhBnejuGRnF8NY5H+jPH9TBvxYE2cZN0LAf9UEwqJJ5deSXHpIcfhb7wrvfNxv3MZnBaFqZ99UfKpv9LQwQvqoCMxUs0SWtUmsYY1zdfa+mLBgRqRROhDyPUvJdPY6kYn4kxjWykp6ncVaEwWNbZD17bykOOf121tUNleB/uRXzNMgY+vuoB1rS1kZIKgN2gq2GVbGp45ZfdvUQlKHgvwAwtKZevw36B1HqZcvjSzFl1uk1yNtvxIemUrMliZIfLKaDr/3obu7085BrhLtKGGfpibmA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(38070700021)(11063799006)(5023799004)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?K3RKMC9JSDIreW5mYndkY1VtNTZOUUpBc0hiUTNYcFAwVzJjWFVvR3V3?=
 =?iso-2022-jp?B?T3FlOTBRM295YnVFWG51SGRMd3V5aXRLVTZ6VEdZU0ZwMUZ3V05GK3hi?=
 =?iso-2022-jp?B?MWZGRDF6Yyt1cVp0NFJtV1JZeWliNmwzUnU3NnlOVGtacVRtUDVURnJ3?=
 =?iso-2022-jp?B?a0xQL2p6dTV4cGZzRFFOdU56U3c2MUl2Ynh2MHZjbkQ3YklCVFlrcis3?=
 =?iso-2022-jp?B?QldlVkhUWnRUMTBUaUZvNkZNMHI2SGlCOHEzUkE1M0FHejMrdHZsNTJ0?=
 =?iso-2022-jp?B?VEhmTzJDYktQL3pWNFM0cnBWWVlhMUtTQWFvZVZFemE2MEs0RWhkZkpj?=
 =?iso-2022-jp?B?VDJBNWh1cEkwNmkvb0VsUGFwWHpIR2xsdm1wKy8xaDFXcGxnbUpWdm83?=
 =?iso-2022-jp?B?VHRtRnZ4OWF6OUlkdWtobGVTbEVsUnl3dElTUlRQY0MrdjE5TXNFZjh6?=
 =?iso-2022-jp?B?V1BiY1NGbVEyYjUyNjZyR0FiYVJqcTZLZzVuWnpDV1dwOEhkb0xkMnZ5?=
 =?iso-2022-jp?B?MmYxay9mS3lYbk5XbVFlOG1ab2E4VTZPbHVwcWNxaW4rcFlFTDFuOEs0?=
 =?iso-2022-jp?B?RDQzRGRSSW9hNU1ZY3FkSDFjS3c3b3d5ZGEvejJNSG1rMFFXZWxUTW85?=
 =?iso-2022-jp?B?UlRvdCtsQURMcUh6Q1k4ODIzR29lWWhiVzZZUnVmVUxZTElSYW9xSERW?=
 =?iso-2022-jp?B?TTJLMVVPbnpyN2w0dE1jajk4Q1VFWXZZMlF3b0F4M3cwRWlEcXI5UzRu?=
 =?iso-2022-jp?B?S0JtVHRsY25Yb3FXM1NvbkNWUm5MZXp5MUhDSkI4K1VWbHN3UnpPTytw?=
 =?iso-2022-jp?B?dTF3cTYyZG0wWDZvWUJqYVVkQmJZYlBoRkFXR3BvV0ZpMEQxSXYvUDBl?=
 =?iso-2022-jp?B?eHQxc3IrR2MvaWFUU01wWDNqQkkxeSt4TklFYzlTdmhJNVIwbFZiUWNL?=
 =?iso-2022-jp?B?Ym8rNGRDL2hUR2JISi82QmtVZ0tOaDBXaSswNVg5ckZ5VStrNkNYWnpO?=
 =?iso-2022-jp?B?TFlhelFSVlJ2bHFxMnd6WmVqMC9GTDRFdm9iaFZyRmhjUUNFVFcza29h?=
 =?iso-2022-jp?B?cTdFTHdTanBqUnFsdUEwT0xsODhPY0NIajJoYVpEZWFycmhDeGRIMjk0?=
 =?iso-2022-jp?B?S1NDM3FPSFJNOEY2L050bjlHNkpiV1p0T0doMHRPZlpoQ1REQXV0LzdG?=
 =?iso-2022-jp?B?Um00ZFR2T0VGTkF3SUNSZ3MwbE9EZzlaQXkrWGM5cUF5TWg2SHZwL1hs?=
 =?iso-2022-jp?B?RWEralJKU29XeEtmekxEbFYvbHg1bUJZVGlVT2oxTXV6SmZCOUQ0VlFj?=
 =?iso-2022-jp?B?ZHNObkJ5ekUyMnJSb0YxVzg3c0lXNlZTdFQ0OExkWlhJMHVBSXZxaWRN?=
 =?iso-2022-jp?B?TGpIbUJDc0N4cWEvQmxtNkVPRDNtKzNKaHdZWXZvMDQ3b2FsSnhqaDJh?=
 =?iso-2022-jp?B?YlZObWlTS1paT3JGUmFCVXhKSnRKUFMwbFJKWVNzbEgyOEFXRXpPUnFC?=
 =?iso-2022-jp?B?VkJsbTkrMzQxWmg4Snp5Rkg0UldJVml1TmcrWW1hUGZ3U1B3eUNxZnFx?=
 =?iso-2022-jp?B?OUkzVWlSQzVVQXFxejl2dWtWOWYrTnNSL0VyV3FwWkhiS04rcmcyekkw?=
 =?iso-2022-jp?B?SW5SazZ2YnhPR1NWMVVtWG5FTzFpUExxVzNWMzQrVlZPUFlibjVkWnBx?=
 =?iso-2022-jp?B?Tm1Hd3BNMUFsby96Tnp6aE84dDJ0Sjg3ZWxKM3hHdmZTcURFekg2UkVW?=
 =?iso-2022-jp?B?aTVZUFBXYWF0cjZDTnYrT0lDRHdWZHpPNXQ2UTRwd0NzMnQ0Z005NWt2?=
 =?iso-2022-jp?B?aG9GMnZGRzA5OE0rYm45L2hjNHhaUkNGOFhqWGRuYUJ3Nk1mMU9QNjBH?=
 =?iso-2022-jp?B?LzlkSGJUSTEwZ3FDN3J2ZlNrd0ZrUTZ2QUkxSm5nRjR5RWhESWI1am14?=
 =?iso-2022-jp?B?ZHZPYWNNekFReitBT0d5NGIyemtubmkyTUhkYXQ5RTZlTGxXWHJraEhz?=
 =?iso-2022-jp?B?bkVDWlFyYVVGUGJmOGZuMXMwamVtaE5aYkoydklsYnExRlpFQWhybjNF?=
 =?iso-2022-jp?B?RVR2ck9EdGtLUGg5YlpJMWpnangyYXhQZ3BPMkcxMjlMUUk4NUM2UmQv?=
 =?iso-2022-jp?B?WldjZkF3Qy9nZWFvWFdzMjNSMFJyejdXcXUwaUxQRjFyaUQySEZJN29s?=
 =?iso-2022-jp?B?Y3hVNHRGVlNDVHJZRW80ME1XWDVFaGYxbXhtT0xMMEIwdzJqWjN0TjZv?=
 =?iso-2022-jp?B?TkxDVVAvd2k2WnhueDROSXRwMTF2U3NGMDVtYXArcFVURWd0V2R2SHFQ?=
 =?iso-2022-jp?B?by9qMmtCSU9PMFViWlJWa3VGcU52NUJKYlVTWlZ0S2E3ZS9pN0RXU3ZC?=
 =?iso-2022-jp?B?VGl3cWZvMlJEa2UwMUNmZE5VMkpPSzJrSGhXQmJEcHMzN1EySFV5TDg2?=
 =?iso-2022-jp?B?TTYxdDVDamkrbkVDUDVRM1NnTUxVa1VkbUZ6WjdCclUzaGxiRHZGbmhE?=
 =?iso-2022-jp?B?Z29VNUJNdElDbzJBVjhLT0MvOFNMQ3NtZWtXZz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lv8eoXJw+J8dq/MRyINTXFKvkrX3ohbbBclbnDnI6JVczz79hIJ77dLvOPcIJLlLNAi7ISMVKyHoDaaKA5W788HoA1R0voANQd9ncwc/rkiA7/t+uA+KUYdMtl1cb5a8bXO+PLbh4Slf9uLu1F64Rn+m4KFh6czcHsILh/jEIsf56QLGJ1aXWXtoBvl2apTmCW3B2e/d6ExcPTRlm4QwSzLJjWmlOD7vbs6jPV9Exfw5N6zc7C5daakAAi39UtvMXiz7HSzT6c5eTvMtKlFJDGaAZRQp0ReuSarVSP7xPiy7t8OVD8NVnp/+yuprmDgBLBwx3SAKlOBYrEpXv0bwPw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e7ca71-8ecc-4f6c-6d0b-08df38a3f872
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 05:41:40.8811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HHgAcTdhT84ULez34cutat+E1W3IIK8NBC7cSKLgQKQtlM4GTIKWq84L0xGBfGjbK/VeXmI41IZgcLocI4G/hQ+/z6DSl2s7lSsUOtw6UOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12924
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_214151_999654_50EF5ECA 
X-CRM114-Status: GOOD (  21.49  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Ben, Reinette=0A=
=0A=
> mpam_resctrl_alloc_domain() allocates one structure that holds both the=
=0A=
> control domain and the monitoring domain of a resource. It sets up=0A=
> whichever of the two domains the resource supports, with the setup of=0A=
> both open coded in the function, and undoes the control domain if=0A=
> setting up the monitoring domain fails.=0A=
> =0A=
> Apart from the code that manages domains, every user of the structure=0A=
> accesses only one of its two domains, so the monitoring domain can be=0A=
> given a structure of its own. Doing so starts with separating its setup=
=0A=
> from that of the control domain.=0A=
> =0A=
> Move the setup of each domain into its own helper in preparation for=0A=
> giving the monitoring domain its own structure as part of supporting=0A=
> multiple controls per resource. Keep the allocation and the error=0A=
> handling in mpam_resctrl_alloc_domain() so that a failure to set up the=
=0A=
> monitoring domain still undoes the control domain.=0A=
> =0A=
> No functional change intended.=0A=
> =0A=
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>=0A=
> ---=0A=
>  drivers/resctrl/mpam_resctrl.c | 116 ++++++++++++++++++++-------------=
=0A=
>  1 file changed, 70 insertions(+), 46 deletions(-)=0A=
> =0A=
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctr=
l.c=0A=
> index dc442851fd7e..246560247a28 100644=0A=
> --- a/drivers/resctrl/mpam_resctrl.c=0A=
> +++ b/drivers/resctrl/mpam_resctrl.c=0A=
> @@ -1615,13 +1615,77 @@ static struct mpam_component *find_component(stru=
ct mpam_class *class, int cpu)=0A=
>          return NULL;=0A=
>  }=0A=
>  =0A=
> +static int mpam_resctrl_setup_ctrl_domain(unsigned int cpu,=0A=
> +                                         struct rdt_resource *r,=0A=
> +                                         struct mpam_component *comp,=0A=
> +                                         struct mpam_resctrl_dom *dom)=
=0A=
> +{=0A=
> +       struct rdt_ctrl_domain *ctrl_d =3D &dom->resctrl_ctrl_dom;=0A=
> +       int err;=0A=
> +=0A=
> +       dom->ctrl_comp =3D comp;=0A=
> +=0A=
> +       mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);=0A=
> +       ctrl_d->hdr.type =3D RESCTRL_CTRL_DOMAIN;=0A=
> +       err =3D resctrl_online_ctrl_domain(r, ctrl_d);=0A=
> +       if (err)=0A=
> +               return err;=0A=
> +=0A=
> +       mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static int mpam_resctrl_setup_mon_domain(unsigned int cpu,=0A=
> +                                        struct rdt_resource *r,=0A=
> +                                        struct mpam_resctrl_dom *dom)=0A=
> +{=0A=
> +       struct rdt_l3_mon_domain *mon_d =3D &dom->resctrl_mon_dom;=0A=
> +       struct mpam_component *any_mon_comp =3D NULL;=0A=
> +       enum resctrl_event_id eventid;=0A=
> +       struct mpam_resctrl_mon *mon;=0A=
> +       int err;=0A=
> +=0A=
> +       /*=0A=
> +        * Even if the monitor domain is backed by a different=0A=
> +        * component, the L3 component IDs need to be used... only=0A=
> +        * there may be no ctrl_comp for the L3.=0A=
> +        * Search each event's class list for a component with=0A=
> +        * overlapping CPUs and set up the dom->mon_comp array.=0A=
> +        */=0A=
> +=0A=
> +       for_each_mpam_resctrl_mon(mon, eventid) {=0A=
> +               struct mpam_component *mon_comp;=0A=
> +=0A=
> +               if (!mon->class)=0A=
> +                       continue;       // dummy resource=0A=
> +=0A=
> +               mon_comp =3D find_component(mon->class, cpu);=0A=
> +               dom->mon_comp[eventid] =3D mon_comp;=0A=
> +               if (mon_comp)=0A=
> +                       any_mon_comp =3D mon_comp;=0A=
> +       }=0A=
> +       if (!any_mon_comp) {=0A=
> +               WARN_ON_ONCE(0);=0A=
> +               return -EFAULT;=0A=
> +       }=0A=
> +=0A=
> +       mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->h=
dr);=0A=
> +       mon_d->hdr.type =3D RESCTRL_MON_DOMAIN;=0A=
> +       err =3D resctrl_online_mon_domain(r, &mon_d->hdr);=0A=
> +       if (err)=0A=
> +               return err;=0A=
> +=0A=
> +       mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
=0A=
Currently, it returns success even when the domain fails to be inserted. Is=
 there a specific reason for this design?=0A=
I believe it would be safer if mpam_resctrl_domain_insert() returned an int=
 to indicate success or failure. =0A=
=0A=
For example:=0A=
	static int mpam_resctrl_domain_insert(struct list_head *list,=0A=
					       struct rdt_domain_hdr *new)=0A=
	{=0A=
		struct rdt_domain_hdr *err;=0A=
		struct list_head *pos =3D NULL;=0A=
=0A=
		lockdep_assert_held(&domain_list_lock);=0A=
=0A=
		err =3D resctrl_find_domain(list, new->id, &pos);=0A=
		if (WARN_ON_ONCE(err))=0A=
			return -EEXIST;=0A=
=0A=
		list_add_tail_rcu(&new->list, pos);=0A=
		=0A=
		return 0;=0A=
	}=0A=
=0A=
Wouldn't this be a more robust approach for error handling?=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=0A=
=0A=
>  static void mpam_resctrl_alloc_domain(unsigned int cpu,=0A=
>                                        struct mpam_resctrl_res *res)=0A=
>  {=0A=
>          int err;=0A=
>          struct mpam_resctrl_dom *dom;=0A=
> -       struct rdt_l3_mon_domain *mon_d;=0A=
> -       struct rdt_ctrl_domain *ctrl_d;=0A=
>          struct mpam_class *class =3D res->class;=0A=
>          struct mpam_component *comp;=0A=
>          struct rdt_resource *r =3D &res->resctrl_res;=0A=
> @@ -1638,57 +1702,17 @@ static void mpam_resctrl_alloc_domain(unsigned in=
t cpu,=0A=
>                  return;=0A=
>  =0A=
>          if (r->alloc_capable) {=0A=
> -               dom->ctrl_comp =3D comp;=0A=
> -=0A=
> -               ctrl_d =3D &dom->resctrl_ctrl_dom;=0A=
> -               mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->=
hdr);=0A=
> -               ctrl_d->hdr.type =3D RESCTRL_CTRL_DOMAIN;=0A=
> -               err =3D resctrl_online_ctrl_domain(r, ctrl_d);=0A=
> +               err =3D mpam_resctrl_setup_ctrl_domain(cpu, r, comp, dom)=
;=0A=
>                  if (err)=0A=
>                          goto free_domain;=0A=
> -=0A=
> -               mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr=
);=0A=
>          } else {=0A=
>                  pr_debug("Skipped control domain online - no controls\n"=
);=0A=
>          }=0A=
>  =0A=
>          if (r->mon_capable) {=0A=
> -               struct mpam_component *any_mon_comp =3D NULL;=0A=
> -               struct mpam_resctrl_mon *mon;=0A=
> -               enum resctrl_event_id eventid;=0A=
> -=0A=
> -               /*=0A=
> -                * Even if the monitor domain is backed by a different=0A=
> -                * component, the L3 component IDs need to be used... onl=
y=0A=
> -                * there may be no ctrl_comp for the L3.=0A=
> -                * Search each event's class list for a component with=0A=
> -                * overlapping CPUs and set up the dom->mon_comp array.=
=0A=
> -                */=0A=
> -=0A=
> -               for_each_mpam_resctrl_mon(mon, eventid) {=0A=
> -                       struct mpam_component *mon_comp;=0A=
> -=0A=
> -                       if (!mon->class)=0A=
> -                               continue;       // dummy resource=0A=
> -=0A=
> -                       mon_comp =3D find_component(mon->class, cpu);=0A=
> -                       dom->mon_comp[eventid] =3D mon_comp;=0A=
> -                       if (mon_comp)=0A=
> -                               any_mon_comp =3D mon_comp;=0A=
> -               }=0A=
> -               if (!any_mon_comp) {=0A=
> -                       WARN_ON_ONCE(0);=0A=
> -                       goto offline_ctrl_domain;=0A=
> -               }=0A=
> -=0A=
> -               mon_d =3D &dom->resctrl_mon_dom;=0A=
> -               mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &=
mon_d->hdr);=0A=
> -               mon_d->hdr.type =3D RESCTRL_MON_DOMAIN;=0A=
> -               err =3D resctrl_online_mon_domain(r, &mon_d->hdr);=0A=
> +               err =3D mpam_resctrl_setup_mon_domain(cpu, r, dom);=0A=
>                  if (err)=0A=
>                          goto offline_ctrl_domain;=0A=
> -=0A=
> -               mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);=
=0A=
>          } else {=0A=
>                  pr_debug("Skipped monitor domain online - no monitors\n"=
);=0A=
>          }=0A=
> @@ -1697,8 +1721,8 @@ static void mpam_resctrl_alloc_domain(unsigned int =
cpu,=0A=
>  =0A=
>  offline_ctrl_domain:=0A=
>          if (r->alloc_capable) {=0A=
> -               mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);=0A=
> -               resctrl_offline_ctrl_domain(r, ctrl_d);=0A=
> +               mpam_resctrl_offline_domain_hdr(cpu, &dom->resctrl_ctrl_d=
om.hdr);=0A=
> +               resctrl_offline_ctrl_domain(r, &dom->resctrl_ctrl_dom);=
=0A=
>          }=0A=
>  free_domain:=0A=
>          kfree(dom);=0A=
> --=0A=
> 2.55.0=0A=

