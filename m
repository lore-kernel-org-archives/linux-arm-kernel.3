Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8CBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 16:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyoYHvirLNOs1Mdwh6lJI8kI6cksiOg+TSaaJH42Koc=; b=oHnh134sYyUdiV8+QL5yS4UnNy
	fE2qylxgWYPX4HwyDAb2p+asCT4mKhFdeoK7WCZTZFA2RL+Rf4PXFm8cHBPAn3RMSvE+imKCeJi4I
	KlThRNFcDFKYg06qU7vvdPTz4Jd2g1NDL/Xhnul7PvdTy61/4ZcPJHVESQsdoY0emdGQS6AwCS/Na
	9W5lKtmYMaVUgS42XjF+E+IhuiHJJxqyyFPM9pfeqhY6i1wCNKRpTEITKNKLlbzdRao4s5n93DADM
	m+WcaNHGZgdeyXsTuwv97MfOGmUdpaaEtrZviJ0UvCdif8VHQxUysslDF+Kaa68vQe7ykMVQxjAPD
	+TSdzFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uKl-00000004m5D-0lnT;
	Mon, 21 Apr 2025 16:49:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uIu-00000004lq2-0sx3
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Apr 2025 16:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RyoYHvirLNOs1Mdwh6lJI8kI6cksiOg+TSaaJH42Koc=; b=JbAfr8sl14grq8kSGobK+q8KQ+
	VY6WWqCT1RQolWJhBoQLOOGZx248g1+56d4/TxExH9OHyuqkxcvkRaTDWmxk20hhwGOjAoxvMwwXK
	wchJADKmdDGq3nG//o2MWhXcGYW01DyLMdGM4GKU278PNv7PvZJ/OCXjh4EeKM2Z53qZz0gjWID50
	w2QBPgtxYspM/GVLYYH18TrPzoe0w4YyWZuu/j/1D5/fvIw7T2KoIc3OO5ovM9kzYx0gAYoaHY4jp
	5odL8ogkXJ5kH7k0ff1EP6EVHFNtPJUdBXI4+qnUpReYboMkuhBog2teuXaiBl2C4AZjnf+KP5hO9
	F3WL+qHw==;
Received: from mail-mw2nam04on2061c.outbound.protection.outlook.com ([2a01:111:f403:240a::61c] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u6uIr-0000000B4TO-1DTt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 16:47:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9jCiqM1jQYAzjvvGwdnaaShjaUmKZMr54Gp75kplHfefGADbF67/CRwSNql3h2w1MjGai4e6wiLPDuCpCHQXVbdRDOnaH/o7crVD2EmoC2Dznm/0q+AdBro8O2JItaIn8ZacBInWZHWjhbI76ssBwYVj4KqW8Oywh52Hguc62SLfS3VMS0qF1I6ugvsU8V88G8ZlVn9OSOgEqU7o4dBvpFO9AxGUyZY2pYcZ6bjeZJ9x0Dx6yPgCikFSaaxX3sZdSrsREbvbty/Vgno2NzZ2m8BjY0DIilpLdxHJu4Wrd/NEzZBgAeBFwe+G+aFPU/beaDTaW8VtvUAGXmk930DPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyoYHvirLNOs1Mdwh6lJI8kI6cksiOg+TSaaJH42Koc=;
 b=aBaa+LAC6jZgvyO65cxb00dJpwkTeU02DspzL2y3P2ij5nPozwqVeN9mYK3Lg/3cYY3a4qm7RJ3luxRUWiV3Zskxpoc7OyoL+vh3g4oheJRwC8xdjrjUcX2pnmS40H8rZLzmXSiHZ5xVB0nTR3E2HR8ld7ZxM5vbfnhxw9VN3fayN2QgUWn0vWnzy2XK6cyjlg/meQ0j2UEDzhT9fshKnS9hIwoywo6C/FLx6qToVcJ4xJ1/Oik5Itx4MkEbCCxgW1NMKteOBdDNCYaJ2hINrUahY8kKcVMT/+HXp+fwdKFgewAmivRcvnWOd78ZeSNVyl2VZWudkGUbxQyssSDN3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyoYHvirLNOs1Mdwh6lJI8kI6cksiOg+TSaaJH42Koc=;
 b=UxtkzFIeLzwMxu/55kl2q7zG5JErkhOwb6al0ZGLPrxSNPQ03vDZnApc64cu2uUpitQBNVIetkgd3038GSNppefysVcDos826xr0aOvE0dey7u9SfnjDgGvoJiF/NvXDBRgXA3eLWNz7K13b02t0M1aLFcm2VjILlkJU0bIEKmXRaQnG3qjdVGShV+aVdbP998MVJb3fyiCbFViVHP5a+Orp0WF05VdbNHYeR8mVTvtRH9l/ZxlaYCIUO+Zu9R0VDdvVt2w0tujrEcUlu+Ka72AXcH3h15wsgYuKkuyIt01HMuJMTpGBv09BBDNOC1BV7tE6pLsgaJmWJodryLVz+A==
Received: from BN8PR03MB5073.namprd03.prod.outlook.com (2603:10b6:408:dc::21)
 by DM6PR03MB5289.namprd03.prod.outlook.com (2603:10b6:5:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 21 Apr
 2025 16:47:20 +0000
Received: from BN8PR03MB5073.namprd03.prod.outlook.com
 ([fe80::7483:7886:9e3d:f62a]) by BN8PR03MB5073.namprd03.prod.outlook.com
 ([fe80::7483:7886:9e3d:f62a%3]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 16:47:13 +0000
From: "Ng, Boon Khai" <boon.khai.ng@altera.com>
To: Simon Horman <horms@kernel.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
	<hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, "Gerlach,
 Matthew" <matthew.gerlach@altera.com>, "Ang, Tien Sung"
	<tien.sung.ang@altera.com>, "Tham, Mun Yew" <mun.yew.tham@altera.com>, "G
 Thomas, Rohan" <rohan.g.thomas@altera.com>
Subject: RE: [PATCH net-next v3 1/2] net: stmmac: Refactor VLAN implementation
Thread-Topic: [PATCH net-next v3 1/2] net: stmmac: Refactor VLAN
 implementation
Thread-Index: AQHbqF534FzGLRNwp0yA1XNTHIr18LOeruIAgA+55CA=
Date: Mon, 21 Apr 2025 16:47:13 +0000
Message-ID: <BN8PR03MB5073253767315FB81E5C76B8B4B82@BN8PR03MB5073.namprd03.prod.outlook.com>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
 <20250408081354.25881-2-boon.khai.ng@altera.com>
 <20250411163602.GM395307@horms.kernel.org>
In-Reply-To: <20250411163602.GM395307@horms.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB5073:EE_|DM6PR03MB5289:EE_
x-ms-office365-filtering-correlation-id: f3293345-cf22-4d87-4b49-08dd80f42ac0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BncIRxoum9qiLnmxuNt+Tkvn1pkOT3C+IV40jXupZlrXA478btaCccqMRxWJ?=
 =?us-ascii?Q?pTiUaEL3qePsckdJy/WfxzAD3ZdAyZI9UamDoLF97ICR13PKg3fqdPiqmi6O?=
 =?us-ascii?Q?LyiBcR3w72ivBQyoJCuzAvZhMaP0bnOXblrKCEj1YAYokvvBDBRKiYzh1/yc?=
 =?us-ascii?Q?cDitGGrmuquhwNEMu/96oehJZrsdL3gkwrWQeuxVQvMopOqaQN9OIGrjHZ3m?=
 =?us-ascii?Q?wkmDf+LQ2IF0yLD1RDMfg9zlu65g6aYY+XYk+EucApHs7Ahvp4XxJWVNAiYb?=
 =?us-ascii?Q?Ih/kOK2NzgIeX/bQuH8s1id9xfcc+vlVVCTiEB5RQPdKW+joR4CwhFP5/xYz?=
 =?us-ascii?Q?9moLFe+wAR72je1TlK9n/ywME+MBN+4tMuz4fG+0gbuk4jnbxSB7iOaj9xrK?=
 =?us-ascii?Q?dJCesaekjGSHQCbXfneLQvaOGl2tJZZKb9FV2D4BKHZPyZu0hVohD5jNfpKK?=
 =?us-ascii?Q?8NF5i7tOAx+zZJHhDuE5ZX9tAAGbHBLXaQOoGsTl3DZf4Zstti883gUAnp00?=
 =?us-ascii?Q?BI1jtAA/sWPrR918iqmI2PqLhYYR4CH2yq5NMIDhXeefthsSi8DRxVF5g/6q?=
 =?us-ascii?Q?VnYFyMZdMrvlip5P2eeOpDR+PkoweJTMwzKTNQV0MuLzvJfPnqMHEAYqxDv3?=
 =?us-ascii?Q?HE8sPlP2THTtPI63H3vtzgUGZ42necUCWjtW71MYPB0ZNxQY7e69rd/xybmT?=
 =?us-ascii?Q?Br+6fCXqD4q6wG9r1+aTX0YkfsZWNEyqItu/r9o2qD7t5BnZOWokw3kEfJd0?=
 =?us-ascii?Q?6b35+1buMQhKg8/jn/I+1m9MvHUN6+k7FJ7gTfVqxVMPUmeddzvjqlSdIh9q?=
 =?us-ascii?Q?a5bm4fJVTeDTp0Cqrav/wfLijN9jKGLcZJX3czGnd0A5shui7BZeCXNwUVCi?=
 =?us-ascii?Q?kcpxkNBf1UjCQmzb0YnVx2QkDQh1jHKcoRMUWEYnocbNGSfJ/t6nMfVtzOua?=
 =?us-ascii?Q?9XP8Fjc3TRCDvt62aCr1sqKOcalpsPvxAVbgpw8pICIJdgnEFeHU793v/eri?=
 =?us-ascii?Q?NXQy73J6s4VQbai2HAimXDAO0cX2mleSQwgSYKnLoJHP+nKIL73oN2NL1Jl8?=
 =?us-ascii?Q?xSQbGXNhzrQy17ffWBysQbFMzkI/ibdzCyQ2kBI8bH7NlaYny8CvijbMhQJE?=
 =?us-ascii?Q?DOVSLCqU7BlKrIBtC7jisGQ0PD1Y3eYVsXDRUNf737WNtFpL5Cf/AEDuit9E?=
 =?us-ascii?Q?Dky7wx0FHu9phHJWQhssXwZxHJOIRoASMzEhg7fngLvxx1Mj+L+jzYuGypm7?=
 =?us-ascii?Q?9MI8Cvths6X2OxfYyWHXmbpzf36p9qzin0uuNtw5iC+qT6jRsn42eqxULbLk?=
 =?us-ascii?Q?kQY/hb2XW/OrqUiwrn7APP5eXzWFDjnhEHYc++oJnARV2+iSFqvv/KH/XHL6?=
 =?us-ascii?Q?sJGF/voT52wLMPoJXflhWhS3OnGRPAjx8H+/rGtbWIHGqZnf41H/j5Q+YIiz?=
 =?us-ascii?Q?4+41lwXTDBZXCu7ScjOKtE4Es+nAqLOswCVqs8Nu80q8K1YG7lWgRg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB5073.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YYcSwMe3C/aHzLCb12n4p6tC+F0Gh1R3B3A1Nc4Q4d9mxz5uudbjz/G5ZWoO?=
 =?us-ascii?Q?2FU2g8OJ8ImBCqDgffQmnunbMMr3q6/wNPAY/VwBRbuDdXDtIQYdmrGd/V/f?=
 =?us-ascii?Q?uSTrigI3divEZgFdl3zaykZuTlpU5V3O5JNqzJMc7LVTfc6OxrDHO6RMLq0r?=
 =?us-ascii?Q?onI0cJBEcu1xqJM/wiKMb7Os2keSNxHOy/7CePelBInsuL8jzDGLGfNXtZbz?=
 =?us-ascii?Q?J9eQ0YgTXBf8+8MuOjQdYup5Ikx8mcTW4mDr5tm0xZe4d8hKhN8pbhbYjziV?=
 =?us-ascii?Q?vUD1YxjJrmfeX2XYkHbvJNs3xdv66MAPrI+8gizvGYGw8NGCeLrK4jYhJ6gb?=
 =?us-ascii?Q?/fU8Ql60Lv4b5KHiCkEFcRNaKbOPpCM5uJngzULtv8Ycb4oyYCJrQIoyIT6x?=
 =?us-ascii?Q?3kPSoMLhKxinoql6WlwjCP+kzHRy3IfdnVOuVyzGDxkG+eR6gcU+oD2Xqhb0?=
 =?us-ascii?Q?OB/fHIY5LKB0yO7PTbCpfTgzJAJx/sgabPNuTj4fGQ6LvCOT5Do21G1bHCjZ?=
 =?us-ascii?Q?phG9/Sd+i2o6rOkymUiw3qL6fFaoBHRz45u+qGAHOf9aZ2hbiroppgSbkyon?=
 =?us-ascii?Q?7QkAoLvTLyhKZPqgHsyI3xuYD5Qd3CXj9I8Gzsa2HLm0lhLYPP7FiYFL8gnw?=
 =?us-ascii?Q?mMurkq9s1NxA183esm03ZoFHcxmVFChbb1kl0PH+XDuFKOH+gTunUW8ZvDUt?=
 =?us-ascii?Q?rhHtApjzoVD3khSg0xcMdoGQbWTJA+cPLk/os3cminW/eoVGXLV1NqqUWI0v?=
 =?us-ascii?Q?7txX5b/REZ3N4tgWiXhjSF1wX9jjg2v3bXU9hCH7WcMhl4nWsxtphB9gPDg8?=
 =?us-ascii?Q?jbeytmDbnFEE9GHGdO5OdexGtMdhvXscrejw3HWF3ojF3UzMywdBq+ZTjBMv?=
 =?us-ascii?Q?iVbw9vRm7FJ0uG5Mf6vZ1IspMna8cdW1rjLqKH5YLKgMZ9PNIsItcWBLGUni?=
 =?us-ascii?Q?LtIcUnTf4La8goEA6ok2uMWwmP7MnBs4tHID+Q2GHeKZew0wdj1CnTi14mFJ?=
 =?us-ascii?Q?JCAg1AFqlH408BPMLLOL7zkADMalZD8CiiL+pbtlbZkLiZF5CulMqJ0iaCB5?=
 =?us-ascii?Q?h5UD7Fofowd0Q/uFR5hcuKU4ZZD3+qptFeW8FUDNUcklhJ9UFh9JpjrL2pay?=
 =?us-ascii?Q?11qFVpuiu30TppttYzxMwaZP8iG5L+RqLnM+3z/6o/YEHmYt1ISN50XhcUez?=
 =?us-ascii?Q?hOQgbkOc3soLQBfVu+r4mceZEhsEZ+NAujZ5shZI7SsIPoaY6rETlfZbKf+5?=
 =?us-ascii?Q?J1NrJ52Yh0KKgTHBhvmOoiPa9MSdQ+MGq2WmovO3nYkhscyPHsA3gFl5o0G4?=
 =?us-ascii?Q?tRJlp+yUcRhXGNLHxX1ERuqeRYqi99v/nskCyNOy1e17G2AvrZozDXXOt/ZH?=
 =?us-ascii?Q?IqOyU457akktWl1CL7WFpilV/cp4H5j5m0QubamFeorK+vb+x+uHxmibiCIE?=
 =?us-ascii?Q?9H/Qyi+8ZmAjYKCzJbG8wg25B+zXqlVnUgxjYsa39cCWNDX6VRMcP4o9TPZD?=
 =?us-ascii?Q?VcxxZ2vMHi3756w8ktcoeOsLUpwDUaTKZFM+OALlG21uknN7NnhfYFBNPhOA?=
 =?us-ascii?Q?9vfiRL2ZPKKznrKoVkkrr5sKjZT26IHTOaOEpu92?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB5073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3293345-cf22-4d87-4b49-08dd80f42ac0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 16:47:13.3944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xq7W86XHwHP4pR5t99k4C9gCNqiNceay4R6xFlEetPMAn6QiCtm9rbHhOVPrJxFUYhdl196D+mq05qqCV/cg6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_174729_505916_AA4E6826 
X-CRM114-Status: GOOD (  10.39  )
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

>=20
> Hi,
>=20
> The signature of this new function does not appear to match that of the
> functions it replaces. And it appears to regress the endian annotation of
> perfect_match which was corrected in commit e9dbebae2e3c ("net: stmmac:
> Correct byte order of perfect_match")
>=20
> Flagged by Sparse.

Hi Simon,=20

Thanks for highlighting this issue, I have fixed it in v4

Regards,=20
Boon Khai

