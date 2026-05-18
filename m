Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B77CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3re+2yPzHjrF+ubLZDklo/rF2XUbLE7mpekDVw8KNQw=; b=oFqQ1hlmRIGOmCbdpV9Y6ZT2Oi
	CKAY40W0ET6x1xpP1PeTQcGLlomEs1NPO3lCf5QZdfT4g2QJVjie2vHfBJ73HkQXHafqG1o5SDNJ5
	2okZTR7KKHzyGSDCCciJLmIET/F9ifAhTCNeOgYgGPOOa/Nk5JtEKYdUlB5271ncLELEfEoYh7XqE
	l8n91qkXRkwKT5xXijYVzWO/O2aXDRMc6+R+E6Q5A25uMlnXgAkDh+LCX/3uxlsshyjttc91SUj3f
	amj6eoiJgfpeWHt7uGafXvKuUJVrEDZw07PsoQftjxDgV5BuXmCq+qFpjHjb8R5zuEQ6b/eKtBCP2
	+jsRWVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsDG-0000000EYB9-05Cr;
	Mon, 18 May 2026 07:16:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsDE-0000000EYAc-203f;
	Mon, 18 May 2026 07:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=3re+2yPzHjrF+ubLZDklo/rF2XUbLE7mpekDVw8KNQw=; b=Ix+8cTKUmELuPKfkmpFQAR/54H
	xvX5V+D43rZ0A43Ha4TSVcOfk1d9mZBH1lmNcXi8T3iSqKH61DN4jGnd677A6HYmTa3ckeqze+C5Q
	mT1NLblERYR/nmC95aYtoZyxjtSdE+0tf0Gwk3CwZrCF9MkEGuQuA96GZRRtuYSz7qzMGAzctNmK+
	bPXRPQn174Ay98REC6R6rRnSIGRVvjuvLF56VkerRJ62+aX+kuout2TFKMUkFrzM0h9KMJwHMi94r
	NP/OPqwZ3j+ttrTmwuCdh70HKbOSHT/YPBwSK4962HNavdUot8bxlHZtPcH3ZeelVOhqQW8MSIatA
	HJC09fwg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsDB-0000000A8OS-0QvC;
	Mon, 18 May 2026 07:16:27 +0000
X-UUID: 76d7fb0a528911f1acbe4559397dec65-20260518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3re+2yPzHjrF+ubLZDklo/rF2XUbLE7mpekDVw8KNQw=;
	b=j857DA05RcaUebGFPkiJAF4HCJd2buQrr3lmge/sVqtmdvFqGJ40W6ZBJiu4l4mjTp0t0U2nNMU4oeZnKYT8c/tBtg9o7OwlbZCyPaAPCurSpOB20IoJ/8kp4dUGcsfG67nBwtIGH1gHPO91y0ndp/1OagfOcaAaZ9iEmgqjGqM=;
X-CID-CACHE: Type:Local,Time:202605172351-07,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:bf15d296-4247-490c-9c39-170e308e73a0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:1d8681a4-a669-48ac-a1cb-3b38a93be682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 76d7fb0a528911f1acbe4559397dec65-20260518
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 788531427; Mon, 18 May 2026 00:16:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 18 May 2026 15:16:15 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 18 May 2026 15:16:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJhX0KPQ4dqmCOcnrlrp01KFeQL0msUhwR2ju/QmnKqowPQmpzngMitM57DaPS8e74Es8k8ZgvspPLs4dOFXUw9lTdxwI9xjf7/oA24Be39UkSX+G7/b5t8kNFmb5QLxRbLACJaB43OUNF6LbR12Z5hCnckAphE8KE3Z7vVlWVFtJ/wZCRXNQBh9YbdZKSXkrnDBxUtT/vYcuAli090QZebypimyx0DLFwcXLYGtfy1y8t1lcTKyiwW2TIu8rR1PouHg4xaz/Segn+6SB1tligqLAS7bS/Ei3T4ZAez3+HP+buvVksw9A/5/gQHoIbzYTcw8K9Zl9/3I23J6XlZb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3re+2yPzHjrF+ubLZDklo/rF2XUbLE7mpekDVw8KNQw=;
 b=H04IRf10vFe7xbf2dBazBmoG5pE/8BWFKXrhGXbmjD1FBiaiCOc2z1DSM+51lmdHSaEZ8PdimfovuBA+3/IqQnJk2BslCi+zUG8J37I7Xn6wvPvJQ3V32GsC5Cgqz2v7uGLnNl343lYFPCB7rviUJRDSi4EC8NWKHWhHtu1QFPxjKd5520JyLduLeBIDtzn6GuSNyZf5LnbY+Ry+srev6KgFe/tfjubZpZpRv4OQCZOQ7iMuTRKg3vZ8eELxEq1lS0CcwEHrT2nHfVAaJVIiD8hjXg/Wg+x32CVtxplO5Gk7vC/VOpplIE60MTfICbgEQikqWwEobuU2yKRbYA+hAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3re+2yPzHjrF+ubLZDklo/rF2XUbLE7mpekDVw8KNQw=;
 b=XLqyrIhWA50ytOljDErM+ebUSJ9mUjV4CE1oCFW6y+JTeGqytKKubekPFIcVmPZ7PlddVYAGjFKzxqQe4kf50DHkpc7RRpivqt5+luQdnw/v2uoyKes8rn+WidXBenQjGqdRljmGZHShVsgHAdl8PTAmVjDNAvbr1WTt9M6tN4E=
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com (2603:1096:400:1c9::8)
 by TYZPR03MB7058.apcprd03.prod.outlook.com (2603:1096:400:331::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.13; Mon, 18 May
 2026 07:16:09 +0000
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326]) by TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326%5]) with mapi id 15.21.0048.010; Mon, 18 May 2026
 07:16:09 +0000
From: =?utf-8?B?WHVlcWkgWmhhbmcgKOW8oOmbqueQpik=?= <Xueqi.Zhang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: =?utf-8?B?V2VuZHktU1QgTGluICjmnpfoqanluq0p?= <Wendy-ST.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Topic: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Index: AQHbmWr+ThkPYzLV/EeJKX653FeCxLN777UAgpoJ2QA=
Date: Mon, 18 May 2026 07:16:09 +0000
Message-ID: <198865fb3184926d0b1b4e4855b5f863ad0d6a20.camel@mediatek.com>
References: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
	 <20250320073625.25225-3-xueqi.zhang@mediatek.com>
	 <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
In-Reply-To: <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6471:EE_|TYZPR03MB7058:EE_
x-ms-office365-filtering-correlation-id: ea63208e-374a-40f6-a715-08deb4ad55d9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|11063799003|4143699003|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 1QejzaJtsMfNGWxAoZL1wfCbFoNeio/GkxQzw+kgYHNAhgVdqZkWh1vSjrSdK6IeTgM2mHmi0lxdwbw6ghTAO1c3ZNAMaydf8JkCK2hUf4A3LQq/JJIGjcCdBaf3Z7QygBOldxDmoL7tewS5XYl/Xz9dsVmiiIZgn+Sh9DN1zNtb5CfC9vUWBZvMdfWg5afimSGpcyWYg6jppqJhljlHYsPjAG5cLkruVb1QDU/qhjBZ+L5UGdt5jRItsd3kiJ3mYaiqdsWdm6WdY1cI8VKcCRVzJY9qMLRCVxyymlTCd895i0cKpy8MoTjIyUTt3BceYUt98OPk480gPHQW2V/3nqtQB4QsVa85dC1Ui0curiKpxeRLiFTQfelRYWDJHhOE2iVqu55UATh/pD3CrFOdGLStJBbE/RpY3vjUHt6vmYjviM6QQ20WoqYPYzsW3bVZ7voshZG7084rrWMgEjcLLyBhVmXVnj4jRCbCayStD7i2HESFgNgVnnxaFCsRUVt5LB2MU7N7/zbD+/9GwSZrMuodHtpukXEf85XyywPS2CJYZWzzRzrFuHeoNiKhQIqlepgqnMxC9vkiifmVOKD4xQFUpqQBOxS8+waBlWF+y+wkLHHcXPUH4fE5q5/IAnkooobEikb2Nff49Aj6uFRO1tGD0AFBPAWdkavTueKl+xlwhxk+2NMWvSBq2oQKqzwe3GLOYPZr996fzTkQjsRuDsKDloYjTfwqY+FkeRX36v7UxBEfU9xIpELjarjvSDCb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6471.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(11063799003)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2g1ZEdnV0k5dEEwNFFzUSt0N09JRGI0L21BaW9IWFdiekl5OGsrTEJIeXRy?=
 =?utf-8?B?Mnc0WEhYbWpTcVMvOXF0N0Ezc2lVQnYxOVNqYTNhaGRvMjZjVCtHR292TVBE?=
 =?utf-8?B?YnNCbXJIcjNGaVV2elpTbGZhUnBLM2N4QUR0dWNIcDFrYjhodGxwekc0aGxJ?=
 =?utf-8?B?NVFCL2tZQVIySG9RQlRZZGhEVmZUYVlwak52K3hTYVNIZnZXbXFTeUpsRnlq?=
 =?utf-8?B?ZW8yWHNhdW00WlpWS044TGhiRGNKdGo5QWZMNTRzcEx0TzFBUWlwdmZyTlhj?=
 =?utf-8?B?eks0eEswQlpicnNiWFJ2aHh3UHlYNjlvQVdycE9YTmJaMnpFbExKd2hIbWp4?=
 =?utf-8?B?MUhFWXZBcEJnNFBYbGNnNTlKRmpuT0pwWStwOW9BMWtpd3RvYmZLY2R2Ykdr?=
 =?utf-8?B?aUlkU2FZTmFkdVZ3bStkTVllVEdpNnRuNkZUQ0xSdzNvRmZUNS9iQXNHYTdu?=
 =?utf-8?B?YjhNTDhOa01ncU1MZFFQVVYzZkNOSUZqOUQyUk1ld2hMWkp6dWVEbnE0bHVZ?=
 =?utf-8?B?NFFVTW1jZS9qbWJ0WTErWVZHb3llNGkwODJiM2pVQ1FVejNvMmIxcnpDZ1hB?=
 =?utf-8?B?akQxNmtUbmQwZkYxTlFnS1JUc2FzVUpRN3FyM1RXczdpbFFPWlJTYi8yUUdV?=
 =?utf-8?B?NUNPUlRiaDlrODVJZ09ra094NDR6di9RSWxsU0xRZXhJcFdXWkZkQ2txR24w?=
 =?utf-8?B?YUtHRU1jbFZmT1NGQVA1OHgySnlQUGRDUjZvSEdmT2p5WThlaGRFbzhkN3JM?=
 =?utf-8?B?eXNoMmxUS3NpSlI3MEVyRVVrRlRVN2dsY1RjcndxVUhlUVZ1Z3dVMXdvV0hk?=
 =?utf-8?B?VGp6dG4rL3A2QUk4Mnkyb0c4Wm5ZcmdZcGRGTWt5MDhnZ25HTFdNdTdjcmsx?=
 =?utf-8?B?MDU5eUtmN2tOZGJ1TFo0bE9UL1hNS2hXeGptb0JTWTd2b1NiSjBaZjdnYmFl?=
 =?utf-8?B?Qk9KS29Xb3F3NVFWYmgxU2RLcWJWcnlRQS9zL1B4MldMZVZXQ1lVK01rOUR2?=
 =?utf-8?B?cFJ3b3Z2b04wNEFOazJpZTAwejlpbTMwOERxNzFYRVVrTm1WNERTYkdqeW5Y?=
 =?utf-8?B?U2dVYVhaeWIxd3ZVK1kxUTFRQzRNWlo0bk16RUhYeHFXYi9pMW4wcExML0dS?=
 =?utf-8?B?V3pyQ1lKZjdHT0NOaUFzQWxFVWQzemdoSFRpbU1aT1pvZzRnYWoxWVRPL2tI?=
 =?utf-8?B?Ky9xMkY3V0JSdlR1T01UdG9WSHA3VnVuR0xwWlpnRWhCeGs3MzcvUlU0UEww?=
 =?utf-8?B?VmhydFlRbFBsZkFYcTYwRThIOUx1eERpTlE4QndiUmd4ZTlkOEdqYmJPREhs?=
 =?utf-8?B?SmptbFFNRXMycG5ZcVJnTDJIZWpzVXBZdU5LUnlBN1Z0c0I0Y2M1djltM2VI?=
 =?utf-8?B?eFo2d3d6WU1DWjdJL3pqTEtDVFNlNldDZzBxc2pPWDhZcHdVSEdNRGtPRVdu?=
 =?utf-8?B?NlRxQmRRV2F1Z1RXYzBGNWZNbmZoeXgwMWN0ZW12Q2l2ZGs3ZUYwcjRhTXVy?=
 =?utf-8?B?MTBLQlF4RFp0OTlHOGFqUTYraHZ2Mmh5cXRaN0o4WkhQMVFianpCM2NDenh3?=
 =?utf-8?B?ZEJGZE5HRy8zaHozNXNyM3FpaExST2p3VVY0RElGQnJqUHZ4SVNGUnZVNlhw?=
 =?utf-8?B?N0hyTXdYRHllVGlEK1NlTktkR2h4MWR5b0NUZWJMdXN1angrZlp4bnpTTjhE?=
 =?utf-8?B?TGZpSVZtK0JJRzlTbjZCZlN4Q2taTXRldlZac2t2ZDlaeHFFZ3RXR2VrTVll?=
 =?utf-8?B?R3gzWEU3ZE5DT1ZCTjd5Ty92SExGenF3SExBOElkOGN5aXNleTlWSnFqRUQ1?=
 =?utf-8?B?UTZTVW5hbDNBejNuZ0wwcXlhM2Jua0FnTXhxQysreEFSZ0lFS0Q2cVZtRXBO?=
 =?utf-8?B?MndHNnRZSjVOL3RHYnZkWkJDWFdGUFNrUWNoNUxQN25yeDdmQjFYTzhQRE53?=
 =?utf-8?B?dlFqaXVWR2ZwUFpSRUlrVFZCWXg0dnZsMlI3aGhDMHdDK0RJamR4cmZmTHgv?=
 =?utf-8?B?QlNodStYTnZJbHFRN1IvWXZMNVdmNy9kRlVMV3NmSXdjKzdWODJ1RGpWWW1s?=
 =?utf-8?B?cjE2dEdXMDZXay90TEZESzhpSlVTMElGQldraDcrR1BlVjNjb2R6aUVUNDA1?=
 =?utf-8?B?TWFvNzlVZTdTNU9UWWZHU3E4QU8zbHBvQnNYcU9SYWNPTmRydW5Kb1FTTVB6?=
 =?utf-8?B?S1hYTjRtYUJab0l4ZnUzK3JPVXI3R1VxcXV2dXVhYVhGSnNUQ0txMDZKVDRp?=
 =?utf-8?B?TXJLK05iZHpRSDVnbzFKU010a3hCMVVLQ0Qya0UwMlRtTDllZ242a1pEQ2E1?=
 =?utf-8?B?Z1hWOWx0T0Q5OEg2OFhaTEhJVnkxSlJRQWZySmxydDkyNEFnd2tDUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2ECEA5D8015DDF49A326A8BACCF80242@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rjBAGemXF7XtLTK/B9JRD3zPGrweijE64jNVK/vs3E6tfT5t9HMqhqedwIR+gPmapa5JO0QJwUPpKdmmfbdHmTJr46wD3j6yMFA1vgQy0iyjnk6EWDI8713fUvY39KQL8iIEOoE6BwhsAOhved8WsYBwO+oI9j5A8JItMa8uUZ2w4ZMSqs7KU2XHAE3DPWXEJoKvZxeZ7fvQkR734/sc2vXPpdBlBPOATr/snk2LESwyEtXXKC7WEH9goD9RkI+e2UVUz0I88NmjV2moQR3O090eVQjaBlKLVI2WSktEAU1B5fWU3gnaZ5QjnEf96fPpFYgG+QNFzpHkFKA6ew8byA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6471.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea63208e-374a-40f6-a715-08deb4ad55d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 07:16:09.5235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qq13Mz0RElpPwl5tvFEl9NPWV5ODdcTnXQKRvLjsAKX/OGkEXnalYYZmI3xmwHKN59XADYnrR2ZnrRpJEH1+PUVtTEPu1mcIU1P1pJ1c9RM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_081625_769424_5E50511C 
X-CRM114-Status: GOOD (  27.78  )
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

SGkgQW5nZWxvLA0KDQpGaXJzdCBvZiBhbGwsIHBsZWFzZSBhY2NlcHQgbXkgYXBvbG9naWVzIGZv
ciB0aGUgZGVsYXllZCByZXNwb25zZS4gSSANCmhhdmUgYmVlbiBkZWVwbHkgb2NjdXBpZWQgd2l0
aCBNVDgxOTYgQWx1bWluaXVtIHBLVk0gU01NVSBhbmQgU01JIA0KcmVsYXRlZCB0YXNrcyByZWNl
bnRseS4NCg0KUmVnYXJkaW5nIHlvdXIgcXVlc3Rpb24sIG15IHByZXZpb3VzIGRlc2NyaXB0aW9u
IGluIHRoZSBwYXRjaCB3YXMgbm90IA0KYWNjdXJhdGUgZW5vdWdoIGFuZCBtYXkgaGF2ZSBjYXVz
ZWQgc29tZSBjb25mdXNpb24uIEluIGZhY3QsIG5vdCANCmFsbCBTTUkgY29tbW9ucyBoYXZlIHRo
ZWlyIGJhY2t1cC9yZXN0b3JlIGhhbmRsZWQgYnkgdGhlIFJURkYgDQpoYXJkd2FyZS4gVGhlIFNN
SSBjb21tb25zIGFyZSBkaXN0cmlidXRlZCBhY3Jvc3MgdmFyaW91cyBzdWJzeXN0ZW1zIA0KKGUu
Zy4sIG1taW5mcmEsIHZlbmMsIGRpc3BsYXksIGNhbSwgZXRjLikuIEN1cnJlbnRseSwgb25seSB0
aGUgU01JIA0KY29tbW9uIHVuZGVyIHRoZSBtbWluZnJhIHN1YnN5c3RlbSBpcyBiYWNrZWQgdXAg
YW5kIHJlc3RvcmVkIGJ5IA0KdGhlIFJURkYgaGFyZHdhcmUuDQoNClRoZXJlZm9yZSwgSSBiZWxp
ZXZlIGFkZGluZyBhIHNwZWNpZmljICdza2lwX3JwbScgZmxhZyBpcyBtb3JlIA0KYXBwcm9wcmlh
dGUgaGVyZS4gSWYgd2Ugd2VyZSB0byBkaWZmZXJlbnRpYXRlIHRoaXMgYmFzZWQgb24gYSBuZXcg
DQpNVEtfU01JX0dFTjMgdHlwZSwgaXQgd291bGQgaW1wbHkgdGhhdCBhbGwgU01JIGNvbW1vbiBt
b2R1bGVzIG9mIA0KdGhhdCBnZW5lcmF0aW9uIHdvdWxkIHNraXAgdGhlIFJQTSBvcGVyYXRpb25z
LCB3aGljaCBpcyBub3QgdGhlIA0KaW50ZW5kZWQgYmVoYXZpb3IuDQoNClRvIG1ha2UgdGhpcyBj
bGVhcmVyLCBJIHBsYW4gdG8gdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSBpbiB0aGUgDQpuZXh0
IHZlcnNpb24gYXMgZm9sbG93czoNCg0KU3ViamVjdDogbWVtb3J5OiBtdGstc21pOiBBZGQgc2tp
cF9ycG0gZmxhZyBmb3IgY2VydGFpbiBNVDgxOTYgU01JDQpjb21tb25zDQoNCkJvZHk6DQpPbiBN
VDgxOTYsIGNlcnRhaW4gU01JIGNvbW1vbnMgYXJlIGJhY2tlZCB1cCBhbmQgcmVzdG9yZWQgYnkg
dGhlIFJURkYgDQpoYXJkd2FyZSByYXRoZXIgdGhhbiBieSBzb2Z0d2FyZS4gDQoNCkZvciB0aGVz
ZSBzcGVjaWZpYyBTTUkgY29tbW9ucywgc29mdHdhcmUtY29udHJvbGxlZCByZWdpc3RlciBiYWNr
dXAgDQphbmQgcmVzdG9yZSBpbiB0aGUgcnVudGltZSBjYWxsYmFjayBpcyBubyBsb25nZXIgbmVj
ZXNzYXJ5LiBUaGVyZWZvcmUsIA0KaW50cm9kdWNlIGEgJ3NraXBfcnBtJyBmbGFnIHRvIGJ5cGFz
cyB0aGVzZSByZWR1bmRhbnQgUlBNb3BlcmF0aW9ucw0KZm9yIHRoZXNlIFNNSSBjb21tb25zLg0K
DQpXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzIGFwcHJvYWNoPw0KDQpUaGFua3MsDQpYdWVx
aQ0KDQpPbiBUaHUsIDIwMjUtMDMtMjAgYXQgMTM6MTEgKzAxMDAsIEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sg
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUg
c2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IElsIDIwLzAzLzI1IDA4OjM2LCBYdWVx
aSBaaGFuZyBoYSBzY3JpdHRvOg0KPiA+IE1UODE5NiBTTUkgY29tbW9ucyBpcyBiYWNrZWQgdXAv
cmVzdG9yZWQgYnkgUlRGRiBIVy4NCj4gPiBJdCBkb2Vzbid0IG5lZWQgU1cgY29udHJvbCB0aGUg
cmVnaXN0ZXIgYmFja3VwL3N0b3JlDQo+ID4gaW4gdGhlIHJ1bnRpbWUgY2FsbGJhY2suVGhlcmVm
b3JlLCBhZGQgYSBmbGFnIHNraXBfcnBtDQo+ID4gdG8gaGVscCBza2lwIFJQTSBvcGVyYXRpb25z
IGZvciBTTUkgY29tbW9ucy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBYdWVxaSBaaGFuZyA8
eHVlcWkuemhhbmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gU28gdGhlIE1UODE5NiBTTUkgY29tbW9u
IGRvZXNuJ3QgcmVxdWlyZSBhbnkgY2xvY2tzPw0KPiANCj4gVGhhdCdzIGZpbmUgZm9yIG1lLCBi
dXQgdGhpcyBsb29rcyBibG9vZHkgc2ltaWxhciB0byBNVDY5ODkncyBTTUkNCj4gY29tbW9uLCB3
aGljaA0KPiBpcyBTTUkgR0VOMyBhbmQgbm90IEdFTjIuLi4uDQo+IA0KPiAuLi4uc28sIGFyZSB5
b3Ugc3VyZSB0aGF0IHlvdSBuZWVkIGEgYHNraXBfcnBtYCBmbGFnIGFuZCBub3QgbmV3DQo+IE1U
S19TTUlfR0VOMyBhbmQNCj4gTVRLX1NNSV9HRU4zX1NVQl9DT01NIHR5cGVzPyA6LSkNCj4gDQo+
IFJlZ2FyZHMsDQo+IEFuZ2Vsbw0KPiANCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvbWVtb3J5L210
ay1zbWkuYyB8IDExICsrKysrKysrLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21l
bW9yeS9tdGstc21pLmMgYi9kcml2ZXJzL21lbW9yeS9tdGstc21pLmMNCj4gPiBpbmRleCBhOGY1
NDY3ZDZiMzEuLmI5YWZmYTNjMzE4NSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lbW9yeS9t
dGstc21pLmMNCj4gPiArKysgYi9kcml2ZXJzL21lbW9yeS9tdGstc21pLmMNCj4gPiBAQCAtMTIz
LDYgKzEyMyw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgbXRrX3NtaV9jb21tb25fY2xr
c1tdDQo+ID4gPSB7ImFwYiIsICJzbWkiLCAiZ2FsczAiLCAiZ2FsczENCj4gPiAgIHN0cnVjdCBt
dGtfc21pX2NvbW1vbl9wbGF0IHsNCj4gPiAgICAgICBlbnVtIG10a19zbWlfdHlwZSAgICAgICB0
eXBlOw0KPiA+ICAgICAgIGJvb2wgICAgICAgICAgICAgICAgICAgIGhhc19nYWxzOw0KPiA+ICsg
ICAgIGJvb2wgICAgICAgICAgICAgICAgICAgIHNraXBfcnBtOw0KPiA+ICAgICAgIHUzMiAgICAg
ICAgICAgICAgICAgICAgIGJ1c19zZWw7IC8qIEJhbGFuY2Ugc29tZSBsYXJicyB0bw0KPiA+IGVu
dGVyIG1tdTAgb3IgbW11MSAqLw0KPiA+IA0KPiA+ICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfc21p
X3JlZ19wYWlyICAgKmluaXQ7DQo+ID4gQEAgLTU0Nyw2ICs1NDgsOSBAQCBzdGF0aWMgaW50IG10
a19zbWlfZHRzX2Nsa19pbml0KHN0cnVjdCBkZXZpY2UNCj4gPiAqZGV2LCBzdHJ1Y3QgbXRrX3Nt
aSAqc21pLA0KPiA+ICAgew0KPiA+ICAgICAgIGludCBpLCByZXQ7DQo+ID4gDQo+ID4gKyAgICAg
aWYgKHNtaS0+cGxhdC0+c2tpcF9ycG0pDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMDsNCj4g
PiArDQo+ID4gICAgICAgZm9yIChpID0gMDsgaSA8IGNsa19ucl9yZXF1aXJlZDsgaSsrKQ0KPiA+
ICAgICAgICAgICAgICAgc21pLT5jbGtzW2ldLmlkID0gY2xrc1tpXTsNCj4gPiAgICAgICByZXQg
PSBkZXZtX2Nsa19idWxrX2dldChkZXYsIGNsa19ucl9yZXF1aXJlZCwgc21pLT5jbGtzKTsNCj4g
PiBAQCAtNzgzLDcgKzc4Nyw3IEBAIHN0YXRpYyBpbnQgbXRrX3NtaV9jb21tb25fcHJvYmUoc3Ry
dWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgIGNvbW1vbi0+ZGV2ID0g
ZGV2Ow0KPiA+ICAgICAgIGNvbW1vbi0+cGxhdCA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShk
ZXYpOw0KPiA+IA0KPiA+IC0gICAgIGlmIChjb21tb24tPnBsYXQtPmhhc19nYWxzKSB7DQo+ID4g
KyAgICAgaWYgKCFjb21tb24tPnBsYXQtPnNraXBfcnBtICYmIGNvbW1vbi0+cGxhdC0+aGFzX2dh
bHMpIHsNCj4gPiAgICAgICAgICAgICAgIGlmIChjb21tb24tPnBsYXQtPnR5cGUgPT0gTVRLX1NN
SV9HRU4yKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBjbGtfcmVxdWlyZWQgPSBNVEtfU01J
X0NPTV9HQUxTX1JFUV9DTEtfTlI7DQo+ID4gICAgICAgICAgICAgICBlbHNlIGlmIChjb21tb24t
PnBsYXQtPnR5cGUgPT0gTVRLX1NNSV9HRU4yX1NVQl9DT01NKQ0KPiA+IEBAIC04MTQsMTMgKzgx
OCwxNCBAQCBzdGF0aWMgaW50IG10a19zbWlfY29tbW9uX3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICB9DQo+ID4gDQo+ID4gICAgICAgLyogbGluayBp
dHMgc21pLWNvbW1vbiBpZiB0aGlzIGlzIHNtaS1zdWItY29tbW9uICovDQo+ID4gLSAgICAgaWYg
KGNvbW1vbi0+cGxhdC0+dHlwZSA9PSBNVEtfU01JX0dFTjJfU1VCX0NPTU0pIHsNCj4gPiArICAg
ICBpZiAoY29tbW9uLT5wbGF0LT50eXBlID09IE1US19TTUlfR0VOMl9TVUJfQ09NTSAmJiAhY29t
bW9uLQ0KPiA+ID5wbGF0LT5za2lwX3JwbSkgew0KPiA+ICAgICAgICAgICAgICAgcmV0ID0gbXRr
X3NtaV9kZXZpY2VfbGlua19jb21tb24oZGV2LCAmY29tbW9uLQ0KPiA+ID5zbWlfY29tbW9uX2Rl
dik7DQo+ID4gICAgICAgICAgICAgICBpZiAocmV0IDwgMCkNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsNCj4gPiAgICAgICB9DQo+ID4gDQo+ID4gLSAgICAgcG1fcnVudGlt
ZV9lbmFibGUoZGV2KTsNCj4gPiArICAgICBpZiAoIWNvbW1vbi0+cGxhdC0+c2tpcF9ycG0pDQo+
ID4gKyAgICAgICAgICAgICBwbV9ydW50aW1lX2VuYWJsZShkZXYpOw0KPiA+ICAgICAgIHBsYXRm
b3JtX3NldF9kcnZkYXRhKHBkZXYsIGNvbW1vbik7DQo+ID4gICAgICAgcmV0dXJuIDA7DQo+ID4g
ICB9DQo+IA0KPiANCg==

