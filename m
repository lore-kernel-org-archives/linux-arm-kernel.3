Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EB5D78794
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iF0vusu6F5vM11wBJJKdPJp9370SzA9LvTWy2RfvvEE=; b=Matolegd9EhxvoK+9Gh65TcNsN
	DktkrgNWVWQGv/pPAAkePbQDZwvwaS/BTaEO2cEw1MC9uGsNGs77Ig7gHeO8gkg/7BzCkwPbXxKoK
	S9ivY2etwufAKJ4dvVGLLK6qpfFWras5ed/fN4fdX9akxombST5CkKky7KpwKVz07/v9e4rH6ryYM
	1yZYP8g4hAsxNbbJhh4rBruT20+YYKtngVZGxj+dsJu8JMVeIXX58wdNlovixtDmLdNWqb3VUFmDr
	lNx9F5uc+n5KfdSwpZfBYZExxDZPxTH/f0vRcsL2jkGgCmoNR8/RvqMValFfE61K5pSmpBX1fcyMc
	IUgJlB8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcnu-0000000AXvt-1FjC;
	Fri, 19 Dec 2025 15:54:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcni-0000000AXio-46hj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 15:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iF0vusu6F5vM11wBJJKdPJp9370SzA9LvTWy2RfvvEE=; b=GNrqFbL3B74TwwrHMVI0vdNQWo
	/gqw42TJ71fwWCU9fBEOWKqgtj1YzhElGycwbQtTBFSVTikoFcfuZJ9keNYh1M40xdc0sQyNTtfze
	4veud4t+z+2ZqLdftF1XbtdMNBFVaRRwSTDJ9yXU5ssrUa2+Cb9UBdfYOUeBJGOcgQq5bqaCsgpwf
	TcXHAxqy8bPdYNTmrjU2A4WTpEQ/s1gs/kDu1/2jNSdABLMUVpUPmPM6bTyC7SJr2zfMtUnJ2ik79
	oR+xLogtuO7WdBuVSsJ9+uehIvHoRU67hgr2ut6YjUOo9SC3ZUJnqwqHLXuDFejtRogk4acI3PEJ3
	Mv4inDKA==;
Received: from mail-westeuropeazon11013013.outbound.protection.outlook.com ([52.101.72.13] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbwD-0000000B9Xn-1h2c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:58:39 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XZq6MxJjA1jBd6DLpIDPwjRlxIcaSQWRInHxlQr8HtoJ8uhCiHM4d794ZxyXmXqg/UedDyF/HM/u8SQa3pnQNyf2sYadEfWAUFLqzZwfwfyabhqt3orW+rNX9RN9UwreSlCIXlHGjGhEzI9LOKvxxgB0pMKQHGyERW+2g2RPunsJIqjS59ybAcDXwf1RAFWL+3NjQWuCKYrc0ZHKtSBvvW0yRgP4ZlscXWv9QSW1p7nXWvWV4jGMyVU9f8DwuuibB9d721WfY3dq7WSRhzo5yzq5Thz6ui8Rq40FfhwMS/V03hj5iHNzw1SMJ3G9FIl36JDi/hPBRZO/lOuvruMVOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iF0vusu6F5vM11wBJJKdPJp9370SzA9LvTWy2RfvvEE=;
 b=IqNn+6rYw81frBemLAnAq/VVrIW7IMUKIZsFzS29JS8Ad4z9lC1TFerTd4Erc2f+OfPl/XXklbvjy1h1bmrsgmsxW6h+UODEp27/Vt2vTricAlL4Fpc+VyAa40wOH0ZfOiZweo7gkqTnmgMUmvq8LmpLklNKMN5W1wN74Ix7ac33iTazSg+i/5I0nPyVfTP0Y55MqbWADP/7t51kbb/H/b19e8oaRtzyrAA1ODR0pAN+2SjnRGxWkDJjGiHlPQuPXzEhFNHNzx86hLO592VFyqJznTo8fQJ/HgNZ8kU+z0p4/4zt8GfIOQNmTDIXRFe8bFDM9chiMM6Q1zqkUqEDyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF0vusu6F5vM11wBJJKdPJp9370SzA9LvTWy2RfvvEE=;
 b=oJ06e0CqTmtl+mALrjfDrF1AIS6BP/mbMnSTgigO5fRch8SoPxS86SdrdrLitk7/5HaXSdDTr/n09yAXyOMUn9NAdUaq/68wngRFba6gTN43ikALPnSfi5s0Om/A6Hjr97S0xPQZB0L6JdnmyUu9FI5Oy+e3d8+yoBBhiiioAqw=
Received: from AM4PR0302CA0035.eurprd03.prod.outlook.com (2603:10a6:205:2::48)
 by PAXPR08MB6512.eurprd08.prod.outlook.com (2603:10a6:102:15a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Fri, 19 Dec
 2025 15:53:46 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::69) by AM4PR0302CA0035.outlook.office365.com
 (2603:10a6:205:2::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 15:53:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Fri, 19 Dec 2025 15:53:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6oi0nhGTdiIrMMHYURuQc5m9udMw10f7DY/ux0YqRfwwllOELuWxRaG7iTAPMb4MHzuOJ8rq7DnUrz0m8fGJdJIRcD3EbYH/Js0QJnLpF3H6Kb1CjTQC7CKOs1tY6M8vxVicBVq09vCD24FWF5moAclwiTB3jvJrbo94PXvlGf7wuk3sGoqR+Ztktwg+drCu37MyALa3ircVwCsC0IwCSYJz6cX8niXqmE08I2GXAx6tQe8bb4N0vx0FcmBjFg8jcQkFckFY4nMxoXcCuhMJzJquYR1ivKp4+htx8Y/TVnCIuiH2mmIn9yvPcoieC7do6pDF9jxS6Q3JbLBJrmHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iF0vusu6F5vM11wBJJKdPJp9370SzA9LvTWy2RfvvEE=;
 b=WGVZmQHhZxmwboP6FmCRe1tdCFX74Qq78dIA+ncTugq/Szhq4AeShKab+FldHoseMSdwOXug15wMxWEE27/+4XA2ITJGfFEK5ZWK8SPVydLtwzaMvfdVnSaGtNnUcFpoWK7oC9WZjRfrLvfYn/lBHkKoUJcdk8EOgfaz3z+jjMj9UvRNEJbyV0ZUKzTPpnE+pa046sr2DNg61/dq0p3LLe4r6IazAumbGlYyhsc5bNq8tsI1zcBINsFDEnIg8K6OAHhNhvOKYdUGF36aFIzmU2zic03PT7BOaYxFWOIGekY7VLcO1H2G8gYsdJIgFz9ny5XOr/KzsTkMZxDxBKVuAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF0vusu6F5vM11wBJJKdPJp9370SzA9LvTWy2RfvvEE=;
 b=oJ06e0CqTmtl+mALrjfDrF1AIS6BP/mbMnSTgigO5fRch8SoPxS86SdrdrLitk7/5HaXSdDTr/n09yAXyOMUn9NAdUaq/68wngRFba6gTN43ikALPnSfi5s0Om/A6Hjr97S0xPQZB0L6JdnmyUu9FI5Oy+e3d8+yoBBhiiioAqw=
Received: from VI1PR08MB3871.eurprd08.prod.outlook.com (2603:10a6:803:b7::17)
 by PR3PR08MB5676.eurprd08.prod.outlook.com (2603:10a6:102:82::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:52:43 +0000
Received: from VI1PR08MB3871.eurprd08.prod.outlook.com
 ([fe80::98c3:33df:8fd4:b704]) by VI1PR08MB3871.eurprd08.prod.outlook.com
 ([fe80::98c3:33df:8fd4:b704%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 15:52:42 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: [PATCH v2 17/36] KVM: arm64: gic: Introduce irq_queue and
 set_pending_state to irq_ops
Thread-Topic: [PATCH v2 17/36] KVM: arm64: gic: Introduce irq_queue and
 set_pending_state to irq_ops
Thread-Index: AQHccP+C4pdNz9m590SC0rPKEsPPjg==
Date: Fri, 19 Dec 2025 15:52:41 +0000
Message-ID: <20251219155222.1383109-18-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
In-Reply-To: <20251219155222.1383109-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: VI1PR08MB3871:EE_|PR3PR08MB5676:EE_|AM3PEPF0000A797:EE_|PAXPR08MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd69024-2db0-4566-e5c5-08de3f16ca8d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?8LjFnMcHFJ3pA15ZsaqNJ6PY4BbC/TKHguAg9KvaaUANuqrbrtdV7sv399?=
 =?iso-8859-1?Q?2b+8GJVCeTyoRtnLDX8tfTlyZ2Aussx66utxM4R//hfSUMnXSCLTJWyIre?=
 =?iso-8859-1?Q?791pedlTGJjiXQoFUcyJcC7sEeO4w6KqzwTMZ+XqvKl/c9MSmf4IvqjQ7E?=
 =?iso-8859-1?Q?tYh+cvrBVR0sdwfuc6r6RObKg4i/FTsatOb03fLsjrDd58+TbnAPzMvyq/?=
 =?iso-8859-1?Q?q/J2RnYRgaXj9v5jUI1wYX3c7PBClnijpIuvTg+39vrICvT17qPCbbyZmV?=
 =?iso-8859-1?Q?Fm8jH8/ItZYGOJfYYNXLM5QqaaaX6hm5w++L3N0rKMyjingezkVcU8wbp/?=
 =?iso-8859-1?Q?YH1J2D6UneQbWpDrQjVhv/KNAodgVD67PbrhUQq8MqLI0oV3vLOBayIZvo?=
 =?iso-8859-1?Q?0i0NRIOFwzPYzE4UcsKTUk7lvqBwGESztYiMnsf/c5KdO52vX60fq+VUp5?=
 =?iso-8859-1?Q?QUTQjHZpTskS2BM0xrZKkJ0ZY4eWz5+DuP8f1WFH/e0mTu66TzSUHOmcpv?=
 =?iso-8859-1?Q?27bgzSDX7IqCQ6K0r3WLMbyukfl5q6xeVHaaSIXR4ncpc1fnTa+ieBGQgq?=
 =?iso-8859-1?Q?RT1NcMQGoP9YZ5En9NBSw1Q/W4VARcL0i+lUmlA7RgTs/Oe2kUgp2ZB3Ij?=
 =?iso-8859-1?Q?QMzFkN5CfA/p0NEv9wisMd1VKUb7Net829fCIwuh3EWzmsa/GH4Owj64ov?=
 =?iso-8859-1?Q?9hKyU/AmrNU8XjV8SUFl5zdGwZ07eDjdoLCCL3oQpu4NZormPj/R1kebTH?=
 =?iso-8859-1?Q?kbqyhtQuYB7SGXGtDLw2qqSWJ6boP1YdKGtOJdk0fSTNCwe4APmlsy6Ct1?=
 =?iso-8859-1?Q?2wUsSNWqq5BmS/wtxYpw0aM00c0lH+c29XoePmyOW94r4WKnqdfIyedJFw?=
 =?iso-8859-1?Q?+TYneItMjFP6Pr6qurGRhKo4f0X2duhLfDEE+mIjX1rEc15r9F1K2HLyrN?=
 =?iso-8859-1?Q?HmfE7BX4RJ1HxHV4aOmBZjklobxGc2UFuGF3Uu4e5dZX2/v1+gnE74YSyx?=
 =?iso-8859-1?Q?iiCrg4AQMit7ZYEdQ2vEkBw08+TFrzJ1l0asTJCaSaaesbqZe727K0tDdX?=
 =?iso-8859-1?Q?1ygkOAF1rdZXOo3kg34z6b0ekaSEu4TMKczu9coX825boxM0m6R79emnkI?=
 =?iso-8859-1?Q?RYuqjGXXfpXBtU2Nh4wJwjRr9jyzR7QyUrogfBM2UKPqfEX1XYTG51afMq?=
 =?iso-8859-1?Q?pzh4sz0foieVhz24/HUQxeBoTqyQtPaMPIrdvJUVhY84doTRc8BzB67eWA?=
 =?iso-8859-1?Q?jTMPAG1OglUEbxitc7G6PzhCQNTk3nfbKveUXey+98Gr+1ejhE/ltHdmQZ?=
 =?iso-8859-1?Q?T+fGjU9D0BfoIc5nzC8ImqrQct5XFPubrCn/+hlaIL9kcoKutj3PmZ6mfB?=
 =?iso-8859-1?Q?jKfmNrBTwDxqsVx+gBu1Nyu9kWXS/7nKrwh4kAZZiWYueOP7qMnONrHZrv?=
 =?iso-8859-1?Q?hGpMr9N8Suc32KDFhhX4VzEtxshwZ0iHD19FwQVRvYLItSzElkguEeV9+N?=
 =?iso-8859-1?Q?6QaRSxgSltzgf4/TcR0Fyx3g+5AK7keyOG6emh5GBHirTVhbq0PCJ4NuBn?=
 =?iso-8859-1?Q?SUx7iscpqEopRwodPfH7mXfBJub8?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3871.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5676
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f31e9ec9-0223-4c46-efb5-08de3f16a559
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|1800799024|376014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ALIIQqKnjVLB8LKI2AM00jK9UM3FJTFO4ORkJ8DyF5djULkdBDaC9YROn3?=
 =?iso-8859-1?Q?A1t9ldlHtMt4YrVVlqNAqM/EsG3S1qXsDffj6mmpdqJQFSD1D6IsUqIChz?=
 =?iso-8859-1?Q?qbG5dv9tx3420gD+mtS4rIfX5/2behHIL7+BB9FS5Ldb4+EIJIaHS/HMHq?=
 =?iso-8859-1?Q?bARvqo1xW41oF28yC184WErFQE+tAAxwslghYTPR/0IaF1FCxf4m8Mr1yg?=
 =?iso-8859-1?Q?UUr7XM0s9ydlguPjfQrxn6ROy5BLDL1mlvtcXO0TvIcQvkb80qM8A0f0nL?=
 =?iso-8859-1?Q?NHdNItnqyKsnJ9obBp2+Py5/LcsKGNkpM8WIFdbglO8tN7lUUWAXx3HgLw?=
 =?iso-8859-1?Q?ZqyMv+QMM9bmt90A1lWxeHXSA3P8kb0UIN4wj003RQMyjaeNSHfhCldv8t?=
 =?iso-8859-1?Q?4haiWjV0rILpsxvV9D2ky7KkuJg9NulFKJhPq+KHDA15jd08PMUxxC4jke?=
 =?iso-8859-1?Q?tDA7SpT9YSyg1vtqH63xPyCH4h2VedNVyg+SG/E8tXZSse9paU5bVPPrxe?=
 =?iso-8859-1?Q?U23EXzRZhyHeuhtCqOmQtYFVu7DHgEqujZFABFxDenmLrV26dR6yr//tOO?=
 =?iso-8859-1?Q?itxDXc6lJBakEEX8TgvUMVkibj723T6btTNYOasB0yNGsoQRT2BsrsuY9p?=
 =?iso-8859-1?Q?GaCVIoZ76eEfsup79YIKMHLXaFWjXOiCSfdpRAWx0wQr09BFIhsWPtPtFo?=
 =?iso-8859-1?Q?lWQoXo9oPex8I244HcWCqOQbHMa6xo/+fhiTjDTdRE2v8v8yZKJZ9d6jG0?=
 =?iso-8859-1?Q?9eD4ZcPQJrzvoW8+cxTrHXx4IKh5jLHxi3yjeLCrSL192w3bdWAHPtrO0l?=
 =?iso-8859-1?Q?apaN1d+pAjOKPmF0OtKPUEHag/TaRz+bBXVcWMG+L3XXW6rFLu6LKCwRY/?=
 =?iso-8859-1?Q?S+0sZYgLCHeUUAFs200SNsc+INJG3Pq4Xjp4MozZGMgNvRzIgLX5SIvAZw?=
 =?iso-8859-1?Q?Gk88QBxa10MU5aeX7MzpgNLoZNkEIUSUdn+aI4cBaZ4xxMHpstXTkSa1En?=
 =?iso-8859-1?Q?5GYn3d/no64iwv59k7nOi/8GDerLbSRsjpcfGmuDISCTspklY/eWQWmjmr?=
 =?iso-8859-1?Q?mjNT2kK9ndjVRDZwRyHRk0bQYAnOm0G6lU5/D3zMKwq+utPi/8jZ9Hgxme?=
 =?iso-8859-1?Q?jBEqzZsCTBzi4GeBUBwb5St6iMPRlms/t/mlH4HdMSnOQJcpnCUIyf9a0N?=
 =?iso-8859-1?Q?qY3AvXuTqsH+j0SEzH36rPeA0cNq7HS4adCcarE7uz4qVGL4bV83Wo9drF?=
 =?iso-8859-1?Q?ps9GL94FkY9Mn7jHw1pgMMJ74/RHnK2n+fDUgWWJqbr8VxQ3mCjbB0jfTX?=
 =?iso-8859-1?Q?Xo49nI1YXPuvz1UflNYcDWu531HjFFWRIfpOWTqwF8NkfyRTz4zu46ftSZ?=
 =?iso-8859-1?Q?VVTMfVGfAGxhvPBKVW54h/ofoWnjtYNnNnPuWgnvra7GpXD7OIn2Hk2mnU?=
 =?iso-8859-1?Q?2OJhF7vR5vLYDcGSZZKJldc1twekx3+Zqi/SlMd2ByG8aGE6ZeMbFyVoKb?=
 =?iso-8859-1?Q?O+B7/SjUO0+cNysO0p3Fvdq7iTPEwwaJ2IHOExB6hItDllJ9HG6kCdHnKP?=
 =?iso-8859-1?Q?v112pYiOArPJ/kq5fFTRXQji2ygSmxbzgWWFPyCzjunoEnGjbyiYKzKbhS?=
 =?iso-8859-1?Q?jcwCy2PPym+uU=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:53:45.2429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd69024-2db0-4566-e5c5-08de3f16ca8d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6512
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_145837_554203_D425F2FE 
X-CRM114-Status: GOOD (  16.75  )
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

There are times when the default behaviour of vgic_queue_irq_unlock is
undesirable. This is because some GICs, such a GICv5 which is the main
driver for this change, handle the majority of the interrupt lifecycle
in hardware. In this case, there is no need for a per-VCPU AP list as
the interrupt can be made pending directly. This is done either via
the ICH_PPI_x_EL2 registers for PPIs, or with the VDPEND system
instruction for SPIs and LPIs.

The queue_irq_unlock function is made overridable using a new function
pointer in struct irq_ops. In kvm_vgic_inject_irq,
vgic_queue_irq_unlock is overridden if the function pointer is
non-null.

Additionally, a new function is added via a function pointer -
set_pending_state. The intent is for this to be used to directly set
the pending state in hardware.

Both of these new irq_ops are unused in this change - it is purely
providing the infrastructure itself. The subsequent PPI injection
changes provide a demonstration of their usage.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic.c | 11 +++++++++++
 include/kvm/arm_vgic.h     | 15 +++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index d88570bb2f9f0..ac8cb0270e1e4 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -404,6 +404,13 @@ bool vgic_queue_irq_unlock(struct kvm *kvm, struct vgi=
c_irq *irq,
=20
 	lockdep_assert_held(&irq->irq_lock);
=20
+	/*
+	 * If we have the queue_irq_unlock irq_op, we want to override
+	 * the default behaviour. Call that, and return early.
+	 */
+	if (irq->ops && irq->ops->queue_irq_unlock)
+		return irq->ops->queue_irq_unlock(kvm, irq, flags);
+
 retry:
 	vcpu =3D vgic_target_oracle(irq);
 	if (irq->vcpu || !vcpu) {
@@ -547,7 +554,11 @@ int kvm_vgic_inject_irq(struct kvm *kvm, struct kvm_vc=
pu *vcpu,
 	else
 		irq->pending_latch =3D true;
=20
+	if (irq->ops && irq->ops->set_pending_state)
+		WARN_ON_ONCE(!irq->ops->set_pending_state(vcpu, irq));
+
 	vgic_queue_irq_unlock(kvm, irq, flags);
+
 	vgic_put_irq(kvm, irq);
=20
 	return 0;
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 17cd0295b135f..500709bd62c8d 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -171,6 +171,8 @@ enum vgic_irq_config {
 	VGIC_CONFIG_LEVEL
 };
=20
+struct vgic_irq;
+
 /*
  * Per-irq ops overriding some common behavious.
  *
@@ -189,6 +191,19 @@ struct irq_ops {
 	 * peaking into the physical GIC.
 	 */
 	bool (*get_input_level)(int vintid);
+
+	/*
+	 * Function pointer to directly set the pending state for interrupts
+	 * that don't need to be enqueued on AP lists (for example, GICv5 PPIs).
+	 */
+	bool (*set_pending_state)(struct kvm_vcpu *vcpu, struct vgic_irq *irq);
+
+	/*
+	 * Function pointer to override the queuing of an IRQ.
+	 */
+	bool (*queue_irq_unlock)(struct kvm *kvm, struct vgic_irq *irq,
+				unsigned long flags) __releases(&irq->irq_lock);
+
 };
=20
 struct vgic_irq {
--=20
2.34.1

