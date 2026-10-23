Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB971606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j5aQdWuA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CcWNsp58UFlqzMvxCd9b7i95QW+sy0uQcEkaKht01m0=; b=j5aQdWuANfzdeWRKxdBGNFBnfC
	kmkLXJtiaJdGpNK0r0CRweKyOG2LOAVwo50l1WKCAO6SSbqu53sHY9/HvoQgoEi4+xEc9y/QBXtNb
	zPKaXj4aUsaklAEs4xA0SOLesGPMcpZfrqwIU9vo7Ni+twE8RFnzoetQ6wnrycuugYgMnmOqtqq62
	BPnhhjFys9KQjBDT7dwkAY25EJUtKlT4RDcs+gzEja/k5EanN5VqeHa5G9iZMJXoQQFMC8SP9B68Y
	O4Zc5sKAIydm/qRUZgXNf0qLLZsdU8XoOWdKhrpoS8BAvAinRenuWWOdWkUBg67qRiooqy2SZgDEy
	OGMrBWBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKDRF-0000000GEYM-1oLx;
	Fri, 23 Oct 2026 11:27:57 +0000
Received: from mail-sh0chn02on2121.outbound.protection.partner.outlook.cn ([139.219.146.121] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKDRB-0000000GEXo-0mnm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 11:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeA1lIGdc9w2KztfEr1x/i54jcySuDuFxEcU3zEFB6P8UYNucViE3r/TMVgrsi+y+kbZkUKUsAXBNpjQ48ZywEz92XS4+ZGPDfepJbvRYtmhtNq1R4gWW5ZEpxbbWN3+j0dAw98HGMYnNKwbkM25/VzA+M7/FFV/JxLQHw3W64IomNfnVW2K+k705n48Un9v1FYoXlhgzgmwlB72WkBm5EXMrXcHmFAq2Pm3VSnxTep7x1r0RiJWiMfbpZdBEyBXM3eUDwYXhjjm0tqNXjXo+Qanu9cilpnFlgS78GNBhWxTEH6e4gEFJ2ZDe2HtmlRjHmp28th/TN98AhcgiMyZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcWNsp58UFlqzMvxCd9b7i95QW+sy0uQcEkaKht01m0=;
 b=XOSXCuRvasWKugmvWRlOx8fyCWdmmmCBiRAdHWdFhrnwit0JpLP2VSjwLOMGUbV6LiQUubzY5vBRnXIANbUDSWsbbyxrnClRPnbAu4pRfHFTEi0C8sl/q47sKvn755fI5fYb43oLMyedOPYtbOPb44jG6vf+R7c8CEZ3uyPp5Vj/T9R/16pRe8bsQVe/xj7UyYVKwF+efM5iybv2LJhjET3Q6qeQJbJoTFWfPz+JrJVm5PYtoy63EKLJ9Y3OW3LGT5RzN3yWoZCBGhEzm0B5grL8arZlGwbEh6AHseJejUOVGHOZk3yqc5cWIYNx8i1FkfWUcwxDruMwHHhBo+4eUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1217.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 11:11:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0546.017; Fri, 23 Oct 2026 11:11:19 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley
	<joel@jms.id.au>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft
	<osk@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Shuah Khan <skhan@linuxfoundation.org>, Jani Nikula
	<jani.nikula@intel.com>, Vitaly Lubart <lubvital@gmail.com>, Hanjun Guo
	<guohanjun@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, Alexander
 Usyskin <alexander.usyskin@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Breno
 Leitao <leitao@debian.org>, Philipp Zabel <p.zabel@pengutronix.de>, James
 Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>, Stephen
 Hemminger <stephen@networkplumber.org>, Dave Penkler <dpenkler@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Dan
 Williams <djbw@kernel.org>, Mukesh Rathor <mrathor@linux.microsoft.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, Alexandra Winter
	<wintera@linux.ibm.com>, Julian Braha <julianbraha@gmail.com>, Karthikeyan KS
	<karthiproffesional@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH v4 2/4] soc: aspeed: Move UART routing driver to
 drivers/uart-routing
Thread-Topic: [PATCH v4 2/4] soc: aspeed: Move UART routing driver to
 drivers/uart-routing
Thread-Index: AQHdX7GVyK/ZkUfn1kmnX+GtuE8vT7cKn6+AgABfYvA=
Date: Fri, 23 Oct 2026 11:11:19 +0000
Message-ID: <ZQ4PR01MB1202E212A321487AC0C1C176F2642@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261019100643.49099-1-changhuang.liang@starfivetech.com>
	 <20261019100643.49099-3-changhuang.liang@starfivetech.com>
 <b4bb2f36bde9df1e052a70076fb70118cf3c607c.camel@codeconstruct.com.au>
In-Reply-To: <b4bb2f36bde9df1e052a70076fb70118cf3c607c.camel@codeconstruct.com.au>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1217:EE_
x-ms-office365-filtering-correlation-id: 543af6cb-b9fc-4edb-7845-08df30f65d6d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|10067099003|56012099006|4133799003|3023799007|6133799003|18002099003|22082099003|4143699003|38070700021;
x-microsoft-antispam-message-info: ekpyrh9kIor+VbLmsZETx+x+RbOLPSd7VmxCcW4b/8UHM34tGJT/4sg7yLqb0sxKcZKpLk4mKUnm1XvY4y9tmgCAB7o0fda81bLGWlKkV6pSRvuY3ttF1a4jj2sBV9m5etDES08yE2YgHGpSr3Ds6KJyvkNzqGL9BQRuJi3pnGHG/fCrZ/o2oAqKlJjlwG0pb6amM4aC5TNVn6lWlHE2YlapGcSY524ch9Nr+IuLPQqmn0Cp8u/swKGOduKp8JarWnaXFuGXT0aX4rW0lULWeXlpgBXQJ2kVB0lwZAxN5I0ahR/WkpGTJFgJSKEGVSDMxZIKpumi8qBloId0I/31OjaGe/z6Pu/lcb9pDT6sy9WWKF182HYh/vLZoBb3/tqa0fRTjq5DstrlnUfVRYgz1ZyiUOWcniaeGJ+CbrBAl6ed4ODmOZs4NqGAtaWKHAvmfqNNotb/VL/e4GN1RijHDI2H0iyMa+9Dy5bfHanRaO4WUyM59Z0StKEJ5bIs38eYk0XXhbClKAqa6GQ1RZKQvwOXU5R+cRTdXJXA4y81okVfJ2z1m5O8kycaerwMmgG2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(10067099003)(56012099006)(4133799003)(3023799007)(6133799003)(18002099003)(22082099003)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UllTUmpQalM5OTM4ZjlJZWpLZ0xLRjljcHNocUtiRElSeG9VYVhqcnlJaW0r?=
 =?utf-8?B?TDZzQytsN2J5V3ByYUJ5MGpuK2JZZDgvdk83aTFjOTFjWHY3RFErdlE0QWJB?=
 =?utf-8?B?TGx1Yzg5a0hDTnlFd3FKZDRqVlQyWTFBamhxNGEreVk2RFNSekdpRUwrOHVn?=
 =?utf-8?B?ZFNORnIyZGkyMjB1OWNqR2ZoZndHRE5yazF5Y2lPRFJnbjF1V3lGbk1VZGZs?=
 =?utf-8?B?NHczbE1Eb0ZXd2JnUExLRFJYQWRIVUp6WTBRS2dobjlTT0RSNEFlMzZlR0ox?=
 =?utf-8?B?L2IzbUlmU05FZ2UyL3dHNEJuVGFnTTdHd2t3OThHOGlzZUNXT1VyYlMvV0Z4?=
 =?utf-8?B?MnFzS0RhMnhJMEEweTUxcXVXa1l4N255SVk2YllyWE5VOXg4RlpPRnl2NkJ0?=
 =?utf-8?B?UCtpRjRMY3R1ci9nOHp5VHJoK3pRaGNmQkRZNzZCQ1VlbEdEbUtpeitOZG4v?=
 =?utf-8?B?SzlTTFJEZkszYTBHWGdhRUF5VGlNa2k5bnlRQW1kajZnVktLRFp0aEJnK3NW?=
 =?utf-8?B?d2ZPbWdrQnltZXQ5cUFLdWY1YXZpZjY4UlZlU2VHZWtOMXBDRDJsMWFxM2Ew?=
 =?utf-8?B?ZFFRaGVGQk9xd0pFTlBET1lUUzdpV2NMVjVZL1pVY0ZaTFJUU2VQYWFqdW5B?=
 =?utf-8?B?RC9hWVNGWHV2TmYvL1RDS1d0WFJFZlFrc0o3clUrMzJrUnEweWlsUjlKK1I1?=
 =?utf-8?B?QlZRRXpTdE5EMFVZSUdQdkg1UmxqUk9EMnFRTWlVZkJZTTAwSTlaV2FERzl1?=
 =?utf-8?B?Z2NCTW9ERUIrK2g2aEN0TmR5eS9ZenlRZjd0WlhieXB1SEdtakZ2Y29DRWY3?=
 =?utf-8?B?bWFsUjQwSVhqaWpXbk01eFpQeEY5VHltb0FrY3lSd1hKb05teUFuV04rOGhy?=
 =?utf-8?B?dzZpWE1zdDV3R2dBanExejVwdnhKOE03MEk3akx4cHBpdGxXTVJiY1NWV1R3?=
 =?utf-8?B?V3ZsbEk5KzZPSEwwT0hqdFowVVJkM2RMLzFzMjNmbGhoUHdkQ1ZOYWxXdGV6?=
 =?utf-8?B?LzF3N1BWb2ZUSVdrNGNxbm9FRWphWWV1dC96ZmJ4Ukg2N3NhVUk0MWt3YTRG?=
 =?utf-8?B?OG00TVJQUitUMFdBSjY2MWpRWWZiSmdNTUQ5SnN1NlRDdWNISlpXbXpaNmR4?=
 =?utf-8?B?dzBWeGpuNWVpZUZuUEtod2twcVkrQkJBZG9SbStua0Z5YkpFMUM1OXdEUGp1?=
 =?utf-8?B?YzdxSFM0T2Q5bHpidmZuSFNHUVQ0UE9oTzREU1pIaDdYZTdkeVZvM0ljOHRF?=
 =?utf-8?B?b21OME1McW5PelhyakEwMkR1d2ZPVUhacnJzZHZuckZTU2tIU3FmQUpHRHlt?=
 =?utf-8?B?QmNGbFZPN1ZSNHZNTjJwMkF5Z3RWYTJwNkw2cy8rY3k2azdGbGl2U0ZkVUFo?=
 =?utf-8?B?bkxnSWNYN1FhYmRJSWtBRWM5Yjc2blJhV2R2OTNsTzFMSGtYSkNwSnJhNXFJ?=
 =?utf-8?B?cWs5bnR2VzNHTktlOTVhRXFQN1JZbldRNTNoRnFUeG1LNWkybEptbUwzL09X?=
 =?utf-8?B?YjZ4em1jbWlycXlwNHFrVDdPbFJWZUw5MHBRTUtFNmVhRVZDekI4OHBOWHkz?=
 =?utf-8?B?bTBubnI3amRDV2VQT25IVlB0Q09yeEJIL2FDNHhQcUI5MnhUZGJzcDdHUVVi?=
 =?utf-8?B?OVJJbkEza0lqeUI3UXJqbWcyUTBXWDFpa2VMOGpoaHI1OUFMUGtaTW1GdG04?=
 =?utf-8?B?MDV4QS8wc29FRDgxMmxsTitoWC9jeG9BRDRMSml2S1BXNGtKdmI4Rkswb1lm?=
 =?utf-8?B?c28rQlZGQnVNMzR4NXhrQ0lZQTQ3U3I3TTQvMm1TaE45TEJQbE5BTFlXV0Zj?=
 =?utf-8?B?SEN1bjQvdnF4c0NRRW8veEZLR0tnOE5qLzY3bndtQUJzck9wOUN6NkxwaGJv?=
 =?utf-8?B?NUxlVmhsZmdkbWY2RFRMNVBJb0V4cU9hOGdQQ2ZxM3cyelJwWE1CMm9sVjlH?=
 =?utf-8?B?dHJacUUxbXdwVHkyQ0dRVzNiaEt0cUVPdXZoUHFDOWVwcUFOZGR2YlJwSVJo?=
 =?utf-8?B?TlV5Q2lBdmJFOE5FOWR6OFRIOXlJSkRpQ0xzUDRUTzhrMElTaWIzV2prTHpT?=
 =?utf-8?B?S1JTRm8xbnhjZ1B1T2F5WWd0T3pmMFk2WkxidThPOWhlSFUyKzhKK1QxMWll?=
 =?utf-8?B?SHRmQkk4dm1yeDZtVm1GdzZyVTc1YlUxWmltdjArNkRJR0o2M2U5TFNuT1Nj?=
 =?utf-8?B?dnZtYjY0T0xScTIzOWpIaEJ0c2o3bDd6OUpXZHdyWmlzcUErMGQralRjbFJJ?=
 =?utf-8?B?Nk5OWWtMY2RCeWgyUzJzbmk3bU9YK21mMUd6KzNHRjlvcGJCTkNGRDNrVUJx?=
 =?utf-8?B?alNwOXZFbEdRUVhwTjl2UTA5ZlBBU3M0d2NPS2tQMlg2TUFRSG40c2NvZjVS?=
 =?utf-8?Q?4GlbS1tZZoWHb7Sw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 543af6cb-b9fc-4edb-7845-08df30f65d6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 11:11:19.7142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NsXWfIVt5tfoCOPwi18PV4ra+pfuTr7Cfss5iUlQxvZEU8h4eLzugHc5gRQqh13yALBeyp882KeGnR5c07JXu8Kz+k01hs9MKruxxHKGWj7vOTVUo+e0G4Kd4dATr6Aa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_042753_230199_A1A2E219 
X-CRM114-Status: GOOD (  29.94  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksIEFuZHJldw0KDQo+IE9uIE1vbiwgMjAyNi0xMC0xOSBhdCAwMzowNiAtMDcwMCwgQ2hhbmdo
dWFuZyBMaWFuZyB3cm90ZToNCj4gPiBUaGUgQXNwZWVkIFVBUlQgcm91dGluZyBkcml2ZXIgaXMg
bm90IHJlYWxseSBhIFNvQyBkcml2ZXI6IGl0IG9ubHkNCj4gPiBleHBvc2VzIGEgc2VyaWFsIGNy
b3NzYmFyIHRocm91Z2ggc3lzZnMsIGFuZCB0aGUgc2FtZSBoYXJkd2FyZSBibG9jaw0KPiA+IGV4
aXN0cyBvbiBTb0NzIGZyb20gb3RoZXIgdmVuZG9ycy4gTW92ZSBpdCB0byBkcml2ZXJzL3VhcnQt
cm91dGluZy8NCj4gPiBhbmQgY29udmVydCBpdCB0byB0aGUgY29tbW9uIGZyYW1ld29yayBsaXZp
bmcgdGhlcmUuDQo+ID4NCj4gPiBUaGUgcmVnaXN0ZXIgbGF5b3V0IGRlc2NyaXB0aW9uLCB0aGF0
IGlzIHRoZSBsaXN0IG9mIHNlbGVjdG9ycyB3aXRoDQo+ID4gdGhlaXIgcmVnaXN0ZXIgb2Zmc2V0
LCBiaXQgcG9zaXRpb24sIGZpZWxkIG1hc2sgYW5kIHJvdXRpbmcgdGFyZ2V0cywNCj4gPiBpcyBr
ZXB0IGFzIGl0IGlzOyBvbmx5IHRoZSBzdXJyb3VuZGluZyBzeXNmcyBwbHVtYmluZyBpcyBkcm9w
cGVkIGluDQo+ID4gZmF2b3VyIG9mIHRoZSBmcmFtZXdvcmsuIFRoZSBwZXIgc2VsZWN0b3Igb3B0
aW9uIGxpc3RzIGJlY29tZSBzZXBhcmF0ZQ0KPiA+IGFycmF5cyBiZWNhdXNlIHRoZSBmcmFtZXdv
cmsgcmVmZXJzIHRvIHRoZW0gYnkgcG9pbnRlciBpbnN0ZWFkIG9mDQo+ID4gZW1iZWRkaW5nIHRo
ZW0gaW4gdGhlIHNlbGVjdG9yLg0KPiA+DQo+ID4gVGhlIEtjb25maWcgc3ltYm9sIGFuZCB0aGUg
cGxhdGZvcm0gZHJpdmVyIG5hbWUgYXJlIHVuY2hhbmdlZCwgc28gdGhlDQo+ID4gc3lzZnMgcGF0
aHMgZG9jdW1lbnRlZCBpbg0KPiA+IERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJp
dmVyLWFzcGVlZC11YXJ0LXJvdXRpbmcgc3RheSB2YWxpZA0KPiA+IGFuZCBleGlzdGluZyBjb25m
aWd1cmF0aW9ucyBrZWVwIHdvcmtpbmcuDQo+ID4NCj4gPiBBbHNvIHVwZGF0ZSBNQUlOVEFJTkVS
UyB0byBhZGQgZW50cmllcyBmb3IgYXNwZWVkLXVhcnQtcm91dGluZy5jIGJhc2VkDQo+ID4gb24g
dGhlIGZpbGUgYXV0aG9ycywgYXMgdGhlIGZpbGUgY3VycmVudGx5IGxhY2tzIG1haW50YWluZXJz
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5s
aWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiA+IC0tLQ0KPiA+IMKgTUFJTlRBSU5FUlPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMTAgKw0KPiA+IMKgZHJpdmVycy9zb2MvYXNwZWVkL0tjb25maWfCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMTAgLQ0KPiA+IMKgZHJpdmVycy9zb2MvYXNwZWVkL01ha2Vm
aWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgLQ0KPiA+IMKgZHJpdmVy
cy9zb2MvYXNwZWVkL2FzcGVlZC11YXJ0LXJvdXRpbmcuY8KgwqAgfCA2MDENCj4gPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gPiDCoGRyaXZlcnMvdWFydC1yb3V0aW5nL0tjb25maWfCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNiArDQo+ID4gwqBkcml2ZXJzL3VhcnQtcm91dGlu
Zy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKw0KPiA+IMKgZHJp
dmVycy91YXJ0LXJvdXRpbmcvYXNwZWVkLXVhcnQtcm91dGluZy5jIHwgNDE1ICsrKysrKysrKysr
KysrDQo+ID4gwqA3IGZpbGVzIGNoYW5nZWQsIDQ0MyBpbnNlcnRpb25zKCspLCA2MTIgZGVsZXRp
b25zKC0pDQo+ID4gwqBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvYXNwZWVkL2FzcGVl
ZC11YXJ0LXJvdXRpbmcuYw0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdWFydC1y
b3V0aW5nL2FzcGVlZC11YXJ0LXJvdXRpbmcuYw0KPiA+DQo+IA0KPiBJJ20gY2VydGFpbmx5IGlu
IGZhdm91ciBvZiBtb3ZpbmcgY29kZSBvdXQgb2YgZHJpdmVycy9zb2MvYXNwZWVkLCBhbmQgaGF2
aW5nIGENCj4gc21hbGwgc3Vic3lzdGVtIHRvIGhhbmRsZSB0aGlzIGlzIGZpbmUsIGJ1dCBpdCdz
IG5vdCBjbGVhciB3aGF0IGhhcHBlbmVkIHRvIHRoZQ0KPiBkaXJlY3Rpb24gb2YgZG9pbmcgdGhp
cyBieSBkZXNpZ25pbmcgYSB1c2VyIEFCSSBmb3IgcGluY3RybD8NCj4gDQo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC9DQUQrK2pMbTdoUW5DSEFDc1pIMExWblh1Q0ptMGRaNkJxMGhBeU8N
Cj4gVHZWb215NldWUnVnQG1haWwuZ21haWwuY29tLw0KPiANCj4gRXhpc3RpbmcgY29kZSB3b3Vs
ZCBuZWVkIHRvIGJlIGNvbnZlcnRlZCwgYnV0IG1vdGl2YXRpbmcgdGhhdCB3aXRoIHRoZQ0KPiBK
SEIxMDAgc3VwcG9ydCB3b3VsZCBzZWVtIHNlbnNpYmxlPw0KDQpJJ20gbm90IGN1cnJlbnRseSBw
dXJzdWluZyB0aGUgcGluY3RybCBkaXJlY3Rpb24gYW55bW9yZSwgYmVjYXVzZSBJIGRvbid0IGhh
dmUgYSANCmdvb2Qgd2F5IHRvIGltcGxlbWVudCB0aGF0IGRpcmVjdGlvbiBhdCB0aGUgbW9tZW50
LiBTbyBJJ20gcHJvY2VlZGluZyB3aXRoIHRoaXMgDQpzZXJpZXMgaW4gdGhlIGN1cnJlbnQgd2F5
LCBhbmQgdGhlIG1haW4gYmVuZWZpdCBpcyB0aGF0IGl0IGRvZXNuJ3QgYWZmZWN0IHRoZSBBc3Bl
ZWQNCnRlc3QgY29tbWFuZHMuDQoNCkJlc3QgUmVnYXJkcywNCkNoYW5naHVhbmcNCg==

