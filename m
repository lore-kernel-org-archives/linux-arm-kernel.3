Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FD9CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rClnxrZ5RQY6W2/QkiF6PaUfaw2QDLMno3DhO8yZoQc=; b=G6vm6ZA1Az5//5UB1tRbheU3Tf
	dIF8r+OpHKOxWLWeL213uZpaxxvybuepqxzmUSmvvGCao+GJHAisJJOYRe3Dh2M6jZMGo04y+pWBe
	vZMWS+HIE1GfKigpDUnXWY8qHQrs6TdWvwaZzhLYAbE57SeEhrYzNU9j7Ln/LoSrrFCDMiOFiqcvS
	h9mmiKGWxboF0VebqIgr727oi+kt25BC6zrGkLaSMP7WCkWSGb+LuAxhI2fZ8S+EdcrvKY1AlIjJz
	qYD80rHww1obJQCt4RYGLOoLXHIHy6AO+sH8t0J0euIIvz4tRMoNo0+0bDoD+Zd7PlrhyCsmg7rSu
	OT7ss9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMle9-0000000Gbq4-1EIU;
	Tue, 12 May 2026 11:51:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMle7-0000000Gbp8-29Ky
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 11:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=rClnxrZ5RQY6W2/QkiF6PaUfaw2QDLMno3DhO8yZoQc=; b=Yt+RCMLISe2aqGGvrw32+5k0dW
	0EQLyVYKgp+dhpyLB/i+aMBDGQlWb5S9XS/bFPP0sGfHQsqwO4qV3Q0Z6eIRBlSJOUWUJ02N47rc1
	XoX9JGg2CH0WXuT2+l8W5NcSWEavgHMgtIGnWfctDdfDwluMqePuae5yWvvq2EPS23x8IyquTVbPo
	/JDBaeIbhTU8KVCJTK9eSnQ8W/a8ZkfPxJ0JMrheU2CjZHNwNqb0ze7a1rpvksRVmQXQ0Yog2fAHt
	aaSofCSIsrU1O548u2bdtFD0U5bJXHEbkq03hoC4EChd5m0D9XgNAe5jFzo+J9QwI9Na8vKLw5sdB
	+HZP89ng==;
Received: from mail-southcentralusazon11013068.outbound.protection.outlook.com ([40.93.196.68] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMldu-0000000EZqA-2duQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 11:51:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgimcXYYdnR69WYsZt/k+LtCMM3+2jctj2/SYdxAApVvMrIRc92y6cD0vv1FyxcXVpGl/k/7x2rzLLZyODo1CjYZTwv+hiGMadc00/bHOqOG6pBokfd83GGkYuFmGOP2hTi+RXzyTQbopK5EXcYlp6K7pdfTroaLzEhfwBgKMbzPQJ8aLJr4/8h1XIQ+Zpf8PVqm+K4k6jtiGMQTc3ftImDNTtQHlizWxgmk3PrHYsKx3avzqD4yFE0tfWDtWRRlVYjznutaK8heL90TRP+oF8mNqkJWQShRDmmvsOblgwsodfMBfsylHvInEbNsXK+/3PQqxbPkCFojEkkeQ6mq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rClnxrZ5RQY6W2/QkiF6PaUfaw2QDLMno3DhO8yZoQc=;
 b=H6pibQc/jpCPMuveGR0xn49MhAfLW/hZNpp1bJUyTLjdrfQMWIO2KbSQpqYcWIJqWicbSD0zkYyDsvGhufV1BSWIhjqeEmq5crhoiU34CVD9bjhhgXyFyaMmbcwuJERb55j7S7PQnb7o+eIodMyx1qN+JaOkcFlQEMri1sdFvXd1xZKeUAOhvYXC/xtO5Zmcg40DCogbEuxzBMYyG94THfaSMhgj6Tuu8iMu6taouewgbq5MMhqRsCVANtR7zOgdSg3hMnSm1A4BXSoUM89rd/y+OL25J19LPi2nWErpc3eqsH/uN16deVKSmaG8gX2FBK0GLTD+8beQoSlfpwtK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rClnxrZ5RQY6W2/QkiF6PaUfaw2QDLMno3DhO8yZoQc=;
 b=VDwNA9z63uZGjLnhzvRWYeLvL46zzc2S2SmohTPIs6NfDxrUBiTo+a1soIjhEOtnAlMAhe9+vu3/xk/SAMjFlP3ZtEX3sKn1RTB1pwDUmCK7LIzEtHLgqznqwPGGfwTdgPvXkTqHsl4PCVeQZpSqeEXlr29xFy5uns4pM2Blv/hpMwfv3Z4k9GQlzXqB55M9QN8swMyF94gKTQ+CxKa2qSbhDUUZWTZeTyYIwgxyBND2esSKgST6suOb+A8hiqpAQ0zU5k1Blz2p0S7uCSA96bRA7mYrGdCjKYci26fkLkVI8gB6jix71Pe4LL9Dr11J8w/vQ5WIVnNw9gSLPhe0KQ==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PH8PR03MB989151.namprd03.prod.outlook.com (2603:10b6:510:3b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 11:51:08 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 11:51:08 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"tony.luck@intel.com" <tony.luck@intel.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Thread-Topic: [PATCH] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Thread-Index: AQHc3r+l7HrYYLKubEKb4hmldPqVcrYIvEiAgADl8YCAAKRSAIAABzMA
Date: Tue, 12 May 2026 11:51:08 +0000
Message-ID: <4f80ef77-a38b-4652-a1f1-1bea3e88de74@altera.com>
References: <20260508075240.23638-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <cc767b60-3b91-40d5-aa70-c5f252d1d39b@kernel.org>
 <275595ca-6044-4882-a9fd-ca9d496a27a5@altera.com>
 <de0f32eb-2216-47a8-80d4-bd66fcb253a9@kernel.org>
In-Reply-To: <de0f32eb-2216-47a8-80d4-bd66fcb253a9@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|PH8PR03MB989151:EE_
x-ms-office365-filtering-correlation-id: d28ca0b3-3e6a-4e1a-ac0e-08deb01cc15c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|55112099003|22082099003|18002099003|56012099003|11063799003;
x-microsoft-antispam-message-info: FmvwdCZDNu7uMwxPxvsCbzS8ts7WMNkWioMqTdcBC9d7e5T8AnLjkyeleyxdm2ExWMIBTSd8EzE8/V2tIWDwvR8TDi+S1oCaut1wwSKLRHEY2uSMabh+Pl3AA9Lthce3LOY/1J0iA1eGzKaLPwUxb2WlHYBH0dYBH8yza5czswzIy/An4m5OvrOFl1IXBAsB/h9yJ/d2+e6bIE/7NFSp/9IaASzwT8lWcLdfa/LC9WS+OgEnu34uEUa27KoA3y2NqtWmtua9L7DSh8lCW27eRerOkie8pK8DtFFhyQiV7349pE1WFWAWhlfxIg6PeT6+JjdeQqcRjrVsWCkItNHzCOTQrO1XwUDSrSKxa3DDJm1xt5DJL3jd3howiQwiMx4IMM24TG+zz0to5IWifCC45HiSwElGIovD1IGAWE6ujLcthiqead/1Thl1UXUfaDt5Sva0wBMHrmKr5Izz/1vecErZSm6IwKeGIZxyQtY8sroHlXslGVR0r36uj3F+CDg86B/oCUqlxYqMHFMoVOZzY6DwIYs0Zq/7/gGY6ow0WeQ3+Ka5OVMd7WVpmVOXZDK2cbWIuQHF96YUr2L1JGFm2CXWUVdh1UhrZQm+OZwogr9zN0FfQMImoJ8iNlRTgesnJ11YPKR4ot6xlB9G3kCCXwyNx/Oip3x0/2T/ouLoI4sHUt8r5QyNx9vhWd+QHV+jn0JIUBrdGPQt3Zqo2jY1lhXpbQ1ndcW/FepJ3YJvxmj6w6MarKnN4p4YzTuyWwwx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(55112099003)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFhPc2NhZFJSZUZjK2JzMGp1WlVScDNtdEo0ZXI4Z3hZTmJJM1l6cEJIaE5Z?=
 =?utf-8?B?NWtEaVk0cW9FZVFXcm43TTlWZ2o4MzB5ZWhtN3UvTjNxWmZuc201NmtCS0Vh?=
 =?utf-8?B?NGVqdGRPTE5QVEd4b2hRcVF2RENZVzZrMFBVOGN1NjA5NEY0VU9LVHBIVUxn?=
 =?utf-8?B?TVpGMDhmZEc3SjVIaERTU29MSUh0WlJ3T3B1WXFtMEU1NEZIdGc0aTBma0NB?=
 =?utf-8?B?QWpaYThUUDhVRnV2V2dtWGxTOWFoZEdqZ2RXZkVwZW1XajR0em9KYWZLbmhS?=
 =?utf-8?B?L3NHVWRXQ3EvVWwwWE1BZURhWHpMMUk4NXdjMVRodVVucHZBT3V0ZDB3Y1NJ?=
 =?utf-8?B?TE41a0MxWkVsK2R3T1pSajhKQnpxN25IRFA5Tk1Hb2dFVmtFa29FQS9sTVNL?=
 =?utf-8?B?R3B2NUpxc3Z6cEo0MkxBNU9BbGFjeHZ2dXRGay96SFNVaGU0RVVXTmZ4VDgv?=
 =?utf-8?B?c3VBVlAwS2o4bnNVd0J5TDNkb2RVNm9UM3hPUG1vWkQzQUtRejVLbm9CS2hm?=
 =?utf-8?B?dDlkREdCN0Q5V2hjTkZwTzFUZWZhSm51ZlZIazJycC9ETTM5a0ZEVWprc090?=
 =?utf-8?B?RkNGc3lwSkQvTHptbGxpMFptM1lLaERWMTF2UEVPYmc4NHBFb3lJU2NNemZ6?=
 =?utf-8?B?ZTNWSWZid2FuNzFOd3ZTclhiNnllem9rRi84REd0VlIxN20wRTdiOVhLOUVm?=
 =?utf-8?B?ZDM3TEh5WVpSNHFNdXprLzZSSjRkQ2Jnci9hcWNzamlvT2pmd3E1T2Naekk5?=
 =?utf-8?B?djFrNkUyQ0dBVjU5YlBrOEx3Q09nTUpTK21uajVaZ0I3VlB1TUZxaHh0Vzhv?=
 =?utf-8?B?MFgwb3gwTU1PdENqTVp3NnRTcGJzd0NhZFcyTkNzZkY1V01zcDJNM09YcTNL?=
 =?utf-8?B?d2JPZlZ3QjMvdUdHTkNLM3d1RjB1NnFDQ2ltM1g4YWczdnBaV3QwdW15U254?=
 =?utf-8?B?UWxRWFZsWGZLOXo4UVRFZU1hZG9zNEVsZjhVelRycmp2U1BWZEpSd3hiUjc1?=
 =?utf-8?B?M2E4V2Vuc2JCVEdRZFN6RGFqYVZFeUJsVG5qT01Pajg4UEFySUgwS0ozQVNm?=
 =?utf-8?B?MDFmb0pGNTZrc3NMM25kMEk0SnltdUpxaXg4N21NTElmY3hERnZObzM3Wk04?=
 =?utf-8?B?ZUdvNjRSc2JraysxaUxnOVRtakJERWFBbEhzMXFkUXNxVy9RMFBaWDBqN1pt?=
 =?utf-8?B?dXFFMzF6cFQ3QU5LckpSYi8waEU3MXBTeDlXSzAxbFNvK0JlcUIvTWNHY0d5?=
 =?utf-8?B?bkJXTm5xYUd2WXhYSm1xZjVvNGlsdXFJUDJTampxZ29yNGdLbEgzbUM1TFFs?=
 =?utf-8?B?c2EwUXRDNVE1SXArY1R5Q3dTSVYyelpmRUpESS9mRmtvL0pNbVdqY0k2MHVa?=
 =?utf-8?B?WHRkbVcrZW5ManlNbmJ3TFpMTnZqSzUrYWttMjFEZW0rV2I3d1BwZlN5QUFu?=
 =?utf-8?B?c2V3SzlFUzZtT0hsdDExbHVqeFpITk9keTFHczRHQWJVNHQ5ckpkTVZTTkdy?=
 =?utf-8?B?ZDlCd01ONUJDNXlZNHo0cmJ3TkY1SDRmdms5Q3ZNUlhDdXBsTDQ4WkpqV2JF?=
 =?utf-8?B?bUpWbnF4VlZ2U3VLNlVOVTZ6QnU4cDlvemNUNW01SHQrc1pNTlo0dm5pMnR0?=
 =?utf-8?B?Yk54UTZ6QllRejQvMUVPbUM1M09DM1cvM1hFejlqMDJnK1Zqc1JSekFDZFNQ?=
 =?utf-8?B?UGZCdjk4bndjekcwMk45eURheE9rSHpwR2oyRWhJd3Y1dlBwK2JzcW14VkND?=
 =?utf-8?B?ZnBNYU5ueUxUSU9FWDZmNEh4UUFnV0hmbjl0OFQySGx4ZGFxSjNCLzVrV2FU?=
 =?utf-8?B?MXhsckJsZGduSnNkZHZEeTR0NU8xWnBQcnVwOHR6WUNFWU1TLzcwclhiL3dS?=
 =?utf-8?B?NXJycDVRNlRmandyOFRhMGRUQlpPbjV6YUR1bzhJODdZSG1jUGNUcmlNdHA1?=
 =?utf-8?B?TWljZGEvd0tLdTdsZy9BbTlUbXYrQXN6NTdLVWZ1MUxzUnNpdmNtRUNGS1JY?=
 =?utf-8?B?M3N2Y25ycTlNUXh0UlVlOFZyZkFweW9vbkdxZERxS3hPVGpENFF3VnlHWjdC?=
 =?utf-8?B?Rkk3UTRZZlJtUTNsUUJGdFlGTWtDazJQczZDaERWYmdZV0NlUzFuMjJrMkoz?=
 =?utf-8?B?SHdDMitIOC9mQURyQm5scHI4YXg5QnFhV0JuSWo2QlJndExVNTQvSmwvL0x5?=
 =?utf-8?B?YkxnckxCSE9JSmVZVmpwazRCMWhDUi95cnFoeGZoNG9VdjJUeDZYbzlvZVF6?=
 =?utf-8?B?ZVZpRTN5bkRNRnVnVE9BcVBYaWU2REpaTmxZcWpmM213cjRXcERvVWNVMldP?=
 =?utf-8?B?QjhvcDJFc1lZUmVlNjU1OEFFMnk1MFpJZWxyQXVEeGhrZTBvRG4vdW1Kbmdi?=
 =?utf-8?Q?b5aIowdl8DRYYekJE1hAgV1Wk9ftommgTomSwpkGONRn8?=
x-ms-exchange-antispam-messagedata-1: qwclyAbVzhwQOg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA8C0FEE957B9840BD92B5D9AAF5064E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28ca0b3-3e6a-4e1a-ac0e-08deb01cc15c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 11:51:08.2579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B4dUTdtux36BpPjy6tCQRjVaKlLJIAH/PR29IAUk8esEJo+71KbnywZRGQvWnAbic3epLgy4r/1YfKqeD3b/CpfRJp/iKDNfNKIZLoqC0BVnOF484Jv1CN6B7cquWtCJxTDzzgt63nhqTLkqa6+p4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_125126_673111_B23ACAB9 
X-CRM114-Status: GOOD (  17.36  )
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

T24gMTIvNS8yMDI2IDc6MjUgcG0sIERpbmggTmd1eWVuIHdyb3RlOg0KPiANCj4gDQo+IE9uIDUv
MTEvMjYgMjA6MzcsIE5hemxlIEFzbWFkZSwgTXVoYW1tYWQgTmF6aW0gQW1pcnVsIHdyb3RlOg0K
Pj4gT24gMTEvNS8yMDI2IDc6NTQgcG0sIERpbmggTmd1eWVuIHdyb3RlOg0KPj4+DQo+Pj4NCj4+
PiBPbiA1LzgvMjYgMDI6NTIsIG11aGFtbWFkLm5hemltLmFtaXJ1bC5uYXpsZS5hc21hZGVAYWx0
ZXJhLmNvbSB3cm90ZToNCj4+Pj4gRnJvbTogTmF6aW0gQW1pcnVsIDxtdWhhbW1hZC5uYXppbS5h
bWlydWwubmF6bGUuYXNtYWRlQGFsdGVyYS5jb20+DQo+Pj4+DQo+Pj4+IEd1YXJkIHRoZSBpcnEy
IHJldHJpZXZhbCB3aXRoIGFuIG9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgpIGNoZWNrIHNvDQo+
Pj4+IHRoYXQgcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAxKSBpcyBvbmx5IGNhbGxlZCBvbiBBcnJp
YTEwIHBsYXRmb3Jtcy4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogTmF6aW0gQW1pcnVsDQo+
Pj4+IDxtdWhhbW1hZC5uYXppbS5hbWlydWwubmF6bGUuYXNtYWRlQGFsdGVyYS5jb20+DQo+Pj4+
IFNpZ25lZC1vZmYtYnk6IE5pcmF2a3VtYXIgTCBSYWJhcmEgPG5pcmF2LnJhYmFyYUBhbHRlcmEu
Y29tPg0KPj4+PiAtLS0NCj4+Pj4gwqDCoCBkcml2ZXJzL2VkYWMvYWx0ZXJhX2VkYWMuYyB8IDMg
KystDQo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9lZGFjL2FsdGVyYV9lZGFjLmMg
Yi9kcml2ZXJzL2VkYWMvYWx0ZXJhX2VkYWMuYw0KPj4+PiBpbmRleCA0ZWRkMjA4OGMyZGIuLmIz
MDMwMjE5OGNkNCAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9lZGFjL2FsdGVyYV9lZGFjLmMN
Cj4+Pj4gKysrIGIvZHJpdmVycy9lZGFjL2FsdGVyYV9lZGFjLmMNCj4+Pj4gQEAgLTM0OCw3ICsz
NDgsOCBAQCBzdGF0aWMgaW50IGFsdHJfc2RyYW1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZQ0KPj4+PiAqcGRldikNCj4+Pj4gwqDCoMKgwqDCoMKgIH0NCj4+Pj4gwqDCoMKgwqDCoMKgIC8q
IEFycmlhMTAgaGFzIGEgMm5kIElSUSAqLw0KPj4+PiAtwqDCoMKgIGlycTIgPSBwbGF0Zm9ybV9n
ZXRfaXJxKHBkZXYsIDEpOw0KPj4+PiArwqDCoMKgIGlmIChvZl9tYWNoaW5lX2lzX2NvbXBhdGli
bGUoImFsdHIsc29jZnBnYS1hcnJpYTEwIikpDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpcnEyID0g
cGxhdGZvcm1fZ2V0X2lycShwZGV2LCAxKTsNCj4+Pj4gwqDCoMKgwqDCoMKgIGxheWVyc1swXS50
eXBlID0gRURBQ19NQ19MQVlFUl9DSElQX1NFTEVDVDsNCj4+Pj4gwqDCoMKgwqDCoMKgIGxheWVy
c1swXS5zaXplID0gMTsNCj4+Pg0KPj4+IFdoeT8gV2UgYWxyZWFkeSBzd2l0Y2ggb24gYXJyaWEx
MCBsYXRlciBpbiB0aGUgc2FtZSBmdW5jdGlvbi4NCj4+Pg0KPj4+IFNvcnJ5LCBidXQgTkFLLg0K
Pj4+DQo+Pj4gRGluaA0KPj4gVGhpcyBkcml2ZXIgd2VyZSB1c2VkIGJ5IGN5Y2xvbmU1IGFuZCBh
cnJpYTEwLiBDeWNsb25lNSBvbmx5IGhhcyBvbmUNCj4+IGludGVycnVwdCB3aGVyZWJ5IGFycmlh
MTAgaGFzIDIgaW50ZXJydXB0LiBUaGF0IGlzIHRoZSByZWFzb24gd2h5IHRoZQ0KPj4gaW50ZXJy
dXB0IHdhcyBndWFyZCBieSAob2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJhbHRyLHNvY2ZwZ2Et
YXJyaWExMCIpKQ0KPj4NCj4gDQo+IFllcywgYnV0IGxvb2sgYXQgbGluZSAzOTcsDQo+IA0KPiAg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIE9ubHkgdGhlIEFycmlhMTAgaGFzIHNlcGFyYXRlIElSUXMg
Ki8NCj4gIMKgwqDCoMKgwqDCoMKgIGlmIChvZl9tYWNoaW5lX2lzX2NvbXBhdGlibGUoImFsdHIs
c29jZnBnYS1hcnJpYTEwIikpIHsNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
KiBBcnJpYTEwIHNwZWNpZmljIGluaXRpYWxpemF0aW9uICovDQo+IA0KPiBEaW5oDQo+IA0KPiAN
CkhpIERpbmgsIFRoYXQgaXMgdHJ1ZSwgYnV0IHRoZSBvbmUgdGhhdCB3ZSBsb29raW5nIGF0IG5v
dyBpcyBhdCBsaW5lIDM1MiANCndoaWNoIGVuYWJsaW5nIHRoZSBzZWNvbmQgaW50ZXJydXB0IGFu
ZCBpdCBpcyBub3QgcmVxdWlyZWQgYnkgY3ljbG9uZTUuIA0KUGVyaGFwcyBhcmUgeW91IHNheWlu
ZyB3ZSBzaG91bGQgbW92ZSB0aGUgaXJxMiBhdCBsaW5lIDM1MiB1bmRlciB0aGlzIA0KbGluZSAz
OTc/DQo=

