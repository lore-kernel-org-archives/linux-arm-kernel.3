Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB48FD8FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWRIAGm+mYJCfd0bohr/LOIqmo49wdl1CTvNl6KBdV8=; b=3BUuOkIBs5LXaFmb/gFlWuB4iL
	bYcK/adxWrNxfU4XmO/XVN0dSB1RhVNmjr0O4/k/icjbrzvvP/kFGacx2y152TAj7vUdW6p28AIOm
	1LfG1no2UwUc4WpvN1hleoKAEUKtBNUQsERA+ROJkrmOWww/mj4D7mNDALkdUVqZ/XRFI6watGb/U
	IpwiGA2RSzuMxV3acMtuHwv4vgHr9ytkONTOwWluaCOrAaj7LhiRP/cs/q6/2wu1py0ZnZs0Ao0iq
	laZEDZ8buWVxN3nkJJWrTNnnyEDKECdPyIZh3XCKFV4WUVitV7AmC4YF8JM/juhZJMO3Z5wQntSR8
	3TQCZbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdpG-00000006djT-3L61;
	Thu, 26 Feb 2026 16:02:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdpG-00000006diQ-00tK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 16:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dWRIAGm+mYJCfd0bohr/LOIqmo49wdl1CTvNl6KBdV8=; b=J2lcvMS/6xDX5uo+6I7W34hgac
	Hlnl0X9PVD3HijIpHz+0zWxyOy2j1OUq1wQB0Fc0DhQpHsaEBZXmVsz1CnC5YRRya5jcI6HJ/rFfQ
	Xn7VYbE7Nb8/stP9UmYOmlzpqY7mKZBnbBQ4eLmFbjlbn88f9J7CSBkwlzFg5w/IhHIeaOHuPyat6
	iOh+2SwF38DBAlxbXDgpjYT0VlvfRajSqaOfyiwLOwKrQRQLO3PgdDTiYoP1bWYQTfs8Z055dkl+O
	B3Lx8fhAEwtO/2Faju9EnnIjOhmhb3mNGKQFnrYbW1R5g1VLGpG0fcNySUQGO2MuhImc+vOjRhJ5E
	/qsNPq4w==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdpC-0000000BPlZ-1TnN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 16:02:52 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TRO64MkmRa2/MqD8lAmFJP4dTKzZqfIswQUshd+qbQ+aLBbX11MbAByl2pqtsgd788DXF1uY2wf/G+ZFkiqZIc+7+aaSTyaRTR4RjhWkI3ZlJpp5HthwhnJr+TX1EEEaDqJ6ev2WzoXoPQ1PpwQ3M9qVrg3miEy4Wygz6x8UYhI/qxfyos5oSXVG0k3d2zaRd31wG0j8sRWt1i6ootHd1x6ffOnViwTaGTlhBy/BEFFW6AbDUmblYXK/Zd4MTgpgJVY7GLs5sWC8uTTz/u0INsAWc+nN0Uu6knLgQbvV5RMR82b8lqbEQ6+kniwm9SVxx1IywjWeeSpv4YVKHMfumA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWRIAGm+mYJCfd0bohr/LOIqmo49wdl1CTvNl6KBdV8=;
 b=syWMXmd/O5VvVxlj3XzAwAVc5smFei+ASog5hLjOIl9SmvESS+lBh4iFF+ipEtYhnoIH2jIT0LUqQIXAuDIyKxPj29mV5g3erVEcLbMu2+xo1DKDGfYZk7oi4xi1CIBQndsGvDFD4QkEKNJZmQEoGv+9RkOgchiu065Ji75awT/jCeup9WQ0W8z05ojPu6GEyrDYSwDs2KLKcNzGsV9UFeUKxRnDmeIqYozxX2qjM1DL+bpNAJC2yuP421vuOM7/wE9hp0FvDMk2yio2xkwFx/JumsnOQ4ntwQBTEbdRu4qHySsgGrN+1bN94imPL8g9UymN6uJUkrxGESHuplWVTQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWRIAGm+mYJCfd0bohr/LOIqmo49wdl1CTvNl6KBdV8=;
 b=c3YAVBCT0xkEVD63/YZ2Z5o83vslhBuJ2gWMzPPEQaw5VEKFisC/xF+ZEQW+zOCdhi58IJmtd1bTF3BMaQIxUlKED6MKZsmblTA/bUKDx814CbITpbAyUgwQA3SUOVDzn2cNvnYxt0zI+f6RBzjQ8eCpI5ZjCLdaq+Hlh2clAG0=
Received: from AS9PR06CA0590.eurprd06.prod.outlook.com (2603:10a6:20b:486::14)
 by PA6PR08MB11261.eurprd08.prod.outlook.com (2603:10a6:102:516::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:02:45 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:486:cafe::7) by AS9PR06CA0590.outlook.office365.com
 (2603:10a6:20b:486::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Thu,
 26 Feb 2026 16:02:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 16:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buiJ/+iqt0E0/607cq65iuHb0lbgoqnERz3WmB0olTmqR29iNsbZXpigFWHkCkWUh1SGR5hSwy0t5LW/Yxhl0QOE4Z/wm1ARdt/R3FivGU6dh9Md8sgNYvnnbRzNgT5XguqDQAZpwqDiTGXWhORId5N/bSrT0KGfGd1pkSnd5PGdcXJ+CX80Nzxhp9HJgFr8RPHKvUl/B/yo3sQkI0REvaOGZY6LORM0LMUbmjMcG31xZwGLI/dUp6ExAIN4DdLykSW3zvh+gUUTmVrb+5L8Fisq6i+TgDnATV0OFidCt14la42ER3irBklvWwrgyd88W7bW289InabnQ4C1hFjBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWRIAGm+mYJCfd0bohr/LOIqmo49wdl1CTvNl6KBdV8=;
 b=Hb4cDf1V4fjJNiEt5iLK70D8kXTgLqKBrGRLwQH1fHmH5tmmfEnbLAKivrX2E8faEKg5dC5wil2bmxXiID2AULGRIzq/w1jyy7oDbkF5cU9Thj/YdC2ifItvdnfnwBFXDO2iZdYmQ1tKE217pY4DCyvXEKfWC2qImrI9GGoAh8qjaynz/DiCQ0SriC1kct+BAncRCKzLdsUYCKYzMmgh1bOB+2BMCOTGGer6CU4JvvYSWwtSEEWABxc9wJ+nG8t+xcXs6vJpY+3GYavl3GcgKecOMHAZMSachPMQprCwZ9rdVzjzQ+fTBtpNg+XATlljevhwjHTR34gnVhphyUOW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWRIAGm+mYJCfd0bohr/LOIqmo49wdl1CTvNl6KBdV8=;
 b=c3YAVBCT0xkEVD63/YZ2Z5o83vslhBuJ2gWMzPPEQaw5VEKFisC/xF+ZEQW+zOCdhi58IJmtd1bTF3BMaQIxUlKED6MKZsmblTA/bUKDx814CbITpbAyUgwQA3SUOVDzn2cNvnYxt0zI+f6RBzjQ8eCpI5ZjCLdaq+Hlh2clAG0=
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com (2603:10a6:10:1b1::17)
 by VI1PR08MB5486.eurprd08.prod.outlook.com (2603:10a6:803:13b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 16:01:39 +0000
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793]) by DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793%4]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 16:01:39 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>, "jonathan.cameron@huawei.com"
	<jonathan.cameron@huawei.com>
Subject: [PATCH v5 24/36] KVM: arm64: gic-v5: Create and initialise vgic_v5
Thread-Topic: [PATCH v5 24/36] KVM: arm64: gic-v5: Create and initialise
 vgic_v5
Thread-Index: AQHcpzkwBExfdsCZaUqXR+pmwDr3Nw==
Date: Thu, 26 Feb 2026 16:01:39 +0000
Message-ID: <20260226155515.1164292-25-sascha.bischoff@arm.com>
References: <20260226155515.1164292-1-sascha.bischoff@arm.com>
In-Reply-To: <20260226155515.1164292-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DBAPR08MB5687:EE_|VI1PR08MB5486:EE_|AMS0EPF0000019E:EE_|PA6PR08MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: 1600845b-7768-48ce-efd2-08de755079b8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: bQ3hJesIdEkeWJKIL/rI1K46eUL7jGbJgDwdLBitTCUxr7Nf3MWCor8lgH1NJxb0a2A6EGH4RXHckrRFQi0vXztjSaal4N8x/BHLROn+7U8XkqE4ByRFYMncWBBUkejd1QfnS3V0s+K0NCxfE5pQYxiXsaj9gneNGtUdbux9kGSS3Qrq1sayO1+T/OVb6OrV7HYwZdV+BtcNUbq3ti1M5qR2xxxTdGmEMA+C7fGZufef98lcauMgDHGOe8BV/sHtHJ5vIBMJIxBXgs6Bo/Px991A36+urOtz5QbhDhwP4kCILb6qs8QplWjGO1RKL6j6aL1NEaNGkvk5xfROh+RParwEQf+FejHFhAxTRcVZVwawXtSeWVYtt4O99Tvgg5hRxP/K+7zAHrzgTdJx5vDcGDh9F+JuwhmLBFW6c/q9kpWW9dr9Ze6wtIxAARRSf33Aem72jHBZ+qbQa214EX9cGKI4f6bDB9kiOJ78wJRCVKf5JXcyWJX3tbmvcL+ptY1UqVUk9r76CgrsZc9X9zOPBEYZNDgDvnqBM4TbCgFuLRgkahYkhn1poeA1Obh73dXENMSyWWbvj+/YTEe3bpUPelL9bFZnqSmsePSgFQIXhRKxtTj+U2WwtGfqCjv1xNsBdP+sDf+q5/7HPwWSm0ktRH2o+2ULvGmG48OTGAwqaXDS6MCVxPpsygvanTSk51QsBETJziy4112CWfHIHRZEn57NYbGytyIwLFJmmLUdAwHAann/HoLpPO5TTfUWiv4de9s/TgO8SXBb3oGfqI+8rnOQUlb7pkv/TOVnIMXl8/0=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5687.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5486
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 49fd9ce5-2914-4a70-26cb-08de7550537b
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|36860700013|82310400026|376014|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: gMgiYflTWg+JizruOQTlb/7E3HAb1W7gD4HFPMd8Bq7XlV5cLPLJoYURt81nBrpj5vA5V5ic52xooId5dNPBAxi0H1IOJN4B4j0J+TihgWPAOOdsEHKvY+18hw/Shdm/pRo7e5gchggCJReFeuCiQMaBb3fTX7zQh9GqgsmyiBfO386nbj1yMeJJgx+pjwvvjd1ajzS4GKCkfIxIOkh0EXoQcFbosQaPIX0MuQSIS7NA4bzBvz07mftpXPtu22VJ5VJ2Fwwx1N8ftkAgoq+w8Dhfewgkaoak9w6EaFfPjdLyoDC4hKuhijZluAuBKtiiN/8vKmtKlx1GsBSkJWy70k/n3B8WStxOR678ob+y+yla5SMVowEipdXFxnxZta0sDeHe6WYft2bwO4k25EDwadM0TIi/+ow3PBuzQz7qRtr+rVNG3+WI7aYNdrQychYKWOv9sUs0W6eIO7WqZqRIr+k5w12wO/hkxhIroyyjvPE4IPLTshF0UwstQWVCupGZwIWKHm1+DUOGOFKhHD9jI7/89lioBb5TnoWfORzqX4XHnUfWBHV4QdnsoHAKrUQBS4W8lbr7NT8km+9b+gtayATmWYeHXCggGgDs/KcwW1U85vdbqskQ1BKpW6U2fkmeahDPg+bWp6+aGW1Z+KgSjFJw9qby4/9N+8IkOyhiKM1tjWBpKMFRaB7pw5zFz55UVVZ2PjLWHUhubzzZ/WSlafjTKo45YE0XTJw2fb8YoJvmIrpCvs7hlY75myHTdqVqzm/h863oIOiZbJWUFNeClQIAeo16iW6erFYMyPuEniIDNizo+8x4FaZLqaVWjgqB3NL5GL0D4G4h5kVX6VVRQQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(376014)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NYxM9kDvz3FeyWMJFDJb2VkHcZsFjX1Mb3ni9Rx2JweB1F2dFSyHClN7mqa7vxeWlcb5cxoEZrlYbpxKrPJTzUenIb/ETGGkn8sT58kCV9jALDxoPanVyk1d8s36DIoKHuU0mBS6yj29FdwloWSEt9z0eGaaUV8pZg1bHnSxffBUPlOfeNKkxQVp0B97807U6bvUHdXe7tUKIQZU0gFCqfK6PTmjqL+rXoW1hwRH8qcOlUQxiXQpnDx/3sLBgxdbTkqOykU21KtKTJKMRoZ0LJ9UVz/xIazmg1mx2TNDdjxkYoSU+vA1XD7J7CH1QF4f1HFHx5SAoXGbIZiPSX910Px9PQitQ1cv/kLEThg1PgsDKpong8VSO9pJKb85IBSz0odwJTPhwt41m3RkbJh0xp5xNFFcrCIw3oaIC9TkMwO6PJPrpmJfA6yPepC6D5Lx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:02:43.2144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1600845b-7768-48ce-efd2-08de755079b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB11261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_160250_447468_54E16589 
X-CRM114-Status: GOOD (  17.73  )
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

Update kvm_vgic_create to create a vgic_v5 device. When creating a
vgic, FEAT_GCIE in the ID_AA64PFR2 is only exposed to vgic_v5-based
guests, and is hidden otherwise. GIC in ~ID_AA64PFR0_EL1 is never
exposed for a vgic_v5 guest.

When initialising a vgic_v5, skip kvm_vgic_dist_init as GICv5 doesn't
support one. The current vgic_v5 implementation only supports PPIs, so
no SPIs are initialised either.

The current vgic_v5 support doesn't extend to nested guests. Therefore,
the init of vgic_v5 for a nested guest is failed in vgic_v5_init.

As the current vgic_v5 doesn't require any resources to be mapped,
vgic_v5_map_resources is simply used to check that the vgic has indeed
been initialised. Again, this will change as more GICv5 support is
merged in.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/arm64/kvm/vgic/vgic-init.c | 54 +++++++++++++++++++++------------
 arch/arm64/kvm/vgic/vgic-v5.c   | 26 ++++++++++++++++
 arch/arm64/kvm/vgic/vgic.h      |  2 ++
 include/kvm/arm_vgic.h          |  1 +
 4 files changed, 63 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-ini=
t.c
index e4a230c3857ff..8de86f4792866 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -66,7 +66,7 @@ static int vgic_allocate_private_irqs_locked(struct kvm_v=
cpu *vcpu, u32 type);
  * or through the generic KVM_CREATE_DEVICE API ioctl.
  * irqchip_in_kernel() tells you if this function succeeded or not.
  * @kvm: kvm struct pointer
- * @type: KVM_DEV_TYPE_ARM_VGIC_V[23]
+ * @type: KVM_DEV_TYPE_ARM_VGIC_V[235]
  */
 int kvm_vgic_create(struct kvm *kvm, u32 type)
 {
@@ -131,8 +131,11 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
=20
 	if (type =3D=3D KVM_DEV_TYPE_ARM_VGIC_V2)
 		kvm->max_vcpus =3D VGIC_V2_MAX_CPUS;
-	else
+	else if (type =3D=3D KVM_DEV_TYPE_ARM_VGIC_V3)
 		kvm->max_vcpus =3D VGIC_V3_MAX_CPUS;
+	else if (type =3D=3D KVM_DEV_TYPE_ARM_VGIC_V5)
+		kvm->max_vcpus =3D min(VGIC_V5_MAX_CPUS,
+				     kvm_vgic_global_state.max_gic_vcpus);
=20
 	if (atomic_read(&kvm->online_vcpus) > kvm->max_vcpus) {
 		ret =3D -E2BIG;
@@ -409,22 +412,28 @@ int vgic_init(struct kvm *kvm)
 	if (kvm->created_vcpus !=3D atomic_read(&kvm->online_vcpus))
 		return -EBUSY;
=20
-	/* freeze the number of spis */
-	if (!dist->nr_spis)
-		dist->nr_spis =3D VGIC_NR_IRQS_LEGACY - VGIC_NR_PRIVATE_IRQS;
+	if (!vgic_is_v5(kvm)) {
+		/* freeze the number of spis */
+		if (!dist->nr_spis)
+			dist->nr_spis =3D VGIC_NR_IRQS_LEGACY - VGIC_NR_PRIVATE_IRQS;
=20
-	ret =3D kvm_vgic_dist_init(kvm, dist->nr_spis);
-	if (ret)
-		goto out;
+		ret =3D kvm_vgic_dist_init(kvm, dist->nr_spis);
+		if (ret)
+			return ret;
=20
-	/*
-	 * Ensure vPEs are allocated if direct IRQ injection (e.g. vSGIs,
-	 * vLPIs) is supported.
-	 */
-	if (vgic_supports_direct_irqs(kvm)) {
-		ret =3D vgic_v4_init(kvm);
+		/*
+		 * Ensure vPEs are allocated if direct IRQ injection (e.g. vSGIs,
+		 * vLPIs) is supported.
+		 */
+		if (vgic_supports_direct_irqs(kvm)) {
+			ret =3D vgic_v4_init(kvm);
+			if (ret)
+				return ret;
+		}
+	} else {
+		ret =3D vgic_v5_init(kvm);
 		if (ret)
-			goto out;
+			return ret;
 	}
=20
 	kvm_for_each_vcpu(idx, vcpu, kvm)
@@ -432,12 +441,12 @@ int vgic_init(struct kvm *kvm)
=20
 	ret =3D kvm_vgic_setup_default_irq_routing(kvm);
 	if (ret)
-		goto out;
+		return ret;
=20
 	vgic_debug_init(kvm);
 	dist->initialized =3D true;
-out:
-	return ret;
+
+	return 0;
 }
=20
 static void kvm_vgic_dist_destroy(struct kvm *kvm)
@@ -581,6 +590,7 @@ int vgic_lazy_init(struct kvm *kvm)
 int kvm_vgic_map_resources(struct kvm *kvm)
 {
 	struct vgic_dist *dist =3D &kvm->arch.vgic;
+	bool needs_dist =3D true;
 	enum vgic_type type;
 	gpa_t dist_base;
 	int ret =3D 0;
@@ -599,12 +609,16 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 	if (dist->vgic_model =3D=3D KVM_DEV_TYPE_ARM_VGIC_V2) {
 		ret =3D vgic_v2_map_resources(kvm);
 		type =3D VGIC_V2;
-	} else {
+	} else if (dist->vgic_model =3D=3D KVM_DEV_TYPE_ARM_VGIC_V3) {
 		ret =3D vgic_v3_map_resources(kvm);
 		type =3D VGIC_V3;
+	} else {
+		ret =3D vgic_v5_map_resources(kvm);
+		type =3D VGIC_V5;
+		needs_dist =3D false;
 	}
=20
-	if (ret)
+	if (ret || !needs_dist)
 		goto out;
=20
 	dist_base =3D dist->vgic_dist_base;
diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index adf8548a5264c..b94b1acd5f45e 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -86,6 +86,32 @@ int vgic_v5_probe(const struct gic_kvm_info *info)
 	return 0;
 }
=20
+int vgic_v5_init(struct kvm *kvm)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long idx;
+
+	if (vgic_initialized(kvm))
+		return 0;
+
+	kvm_for_each_vcpu(idx, vcpu, kvm) {
+		if (vcpu_has_nv(vcpu)) {
+			kvm_err("Nested GICv5 VMs are currently unsupported\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+int vgic_v5_map_resources(struct kvm *kvm)
+{
+	if (!vgic_initialized(kvm))
+		return -EBUSY;
+
+	return 0;
+}
+
 int vgic_v5_finalize_ppi_state(struct kvm *kvm)
 {
 	struct kvm_vcpu *vcpu;
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 55c5f4722a0a1..f6de4e6b8ced4 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -364,6 +364,8 @@ void vgic_debug_init(struct kvm *kvm);
 void vgic_debug_destroy(struct kvm *kvm);
=20
 int vgic_v5_probe(const struct gic_kvm_info *info);
+int vgic_v5_init(struct kvm *kvm);
+int vgic_v5_map_resources(struct kvm *kvm);
 void vgic_v5_set_ppi_ops(struct vgic_irq *irq);
 int vgic_v5_set_ppi_dvi(struct kvm_vcpu *vcpu, u32 irq, bool dvi);
 bool vgic_v5_has_pending_ppi(struct kvm_vcpu *vcpu);
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index f469ecea959ba..2ad962298bfa9 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -21,6 +21,7 @@
 #include <linux/irqchip/arm-gic-v4.h>
 #include <linux/irqchip/arm-gic-v5.h>
=20
+#define VGIC_V5_MAX_CPUS	512
 #define VGIC_V3_MAX_CPUS	512
 #define VGIC_V2_MAX_CPUS	8
 #define VGIC_NR_IRQS_LEGACY     256
--=20
2.34.1

