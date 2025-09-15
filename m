Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC152CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6vEb2J4Fd1i0b2p6SRScIxuceljrCXOC2QIb0vVDE+o=; b=xOGr1w23HJNWXI
	Xc0jk3/HkBxNYKpb/Q+AimMw4cCj3G5/0KVXI3Bjk+RN7FUJJPC0z2oUXQTaGv4H6b6ChsLGs3+uB
	i7TbBWevn5KYSB5ClwwEJaHYYlYFmr9F58LwUuWIS3W+c1tRnMvBOaULlAd6vbOggrKe2Ib8iFufm
	9fe/60YfNTcu8mkzAyQCtp+QEj1fY9qWh61nSbIVlMjWlkuvyW9NdZSstgg6NqXdVUfMCSMuNu5mk
	eR75htViSyQYZJoZDA73CZm8rNyNSF1rmUgqB0PJXQUEkg4B5i6L2dvbhHbWtzgk0Q68JDLbMOa5R
	G7J7sc9UbZXUmXrfgqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7oa-00000004205-47OY;
	Mon, 15 Sep 2025 11:56:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7oU-000000041wa-1w36
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 11:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6vEb2J4Fd1i0b2p6SRScIxuceljrCXOC2QIb0vVDE+o=; b=LJoxUDIl3MFlNPcPDGfBvOny3W
	oK8zEaE4dD8ZD9N3NOxiw3U7TqV0wvtcDWaKcRbuRaEXmZZ/VN3KfyeCrCSqoy0hfIpC1Vw7YBj4r
	hTN6fQwsxWIqnvYZ6EqEqxw7gGaLMieBXyaCuANtatDcBNswM9gTUZxXeHxydhAj360pQiqJAp0n9
	Eup3ngFi/LvWBiwIhPN3aqenJyIpi3zsVn4DMVzs7uh146+BoG468y0AD0zfZGdyRzZSH+sk0mc/1
	m5rde8jj2fwHEKZY+5maauWU2OrFmgNM8kgcyBfV3qw+1HsXNGvxt9Eu5s50SSCT2BPqI2RyM1Shg
	/K2+PEDg==;
Received: from mail-db5eur02on20708.outbound.protection.outlook.com ([2a01:111:f403:2608::708] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7oQ-00000006xdl-2Q80
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:56:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLwqauutiukfttkjnW8wPfEKbEdmzJ2yQdXoZ1Rz8dj5jiYIukhILaOdTsi/+8i4zOVyR9Oj71LncoylFGv80uROXZ1G9zLBM39lc3Ctdn0uXVByaZwYasBzN788hZYIgOUL1Cp1obOmL2XxSCtvVGabkUnrIRLavDIgNxS+h8EQhHIEKd0oKnR6GhZnpryAHtlCuquZ2OQvBlYlASS56HsByuTEECMgzXgOULr6+CJfQ8Laz1nBC/Sh8LKwj0skvI60TgOIdhXmMBvnVDICGiDAd1+PEXFZum6tyP1i3iIqkSQU2PwyBqsouDe6MhHm4j2h0DA0O3CFvqR1XOC0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vEb2J4Fd1i0b2p6SRScIxuceljrCXOC2QIb0vVDE+o=;
 b=YzfPenCpmJZmlWLY2wpWNdZckY+lZHbX92sG3z7+83YMs+Jt0bC4DBEFhQxxtu9MvcJDqfUNs1oJDQUuoKonyoUObi9waOL/WHe2Qam6bp/ixafS2ec/OHpaMv8nvzqidX+pIXdXuugADJNcoNvWmZGFoG5VWKxmz3za0vAHcVdN2VK7zXUskT23309UJTkCjIWdAVFPedB62Sj6ztmHCrYwUx7ra06DhUwe1eXL/NRkE6mUU1tcxp0XS7aPUuupw2cfXFB38icULTnHVt2n2RakuhbjSyGn+J+3OFad5K2CHB8Mp+vt3YnrGYMT5UbzcqSuzMVNUmw1JmaFmQxAAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vEb2J4Fd1i0b2p6SRScIxuceljrCXOC2QIb0vVDE+o=;
 b=Am0bohJyGKJG9H2HWHgQzKDMgIhZ93uevBqtM0+wxT3sU8zWJ8OZ6wH6LGa3yTrrBe8l6aU5/PCB4frEVmo+IKv6PllFyLcms3dTfx54oJBozzT6MJmv6+fdeYjOmaK2SdGlv/vuNcaVHy08aXdb9au4ZfjFcD9PzNoPkaqsxSY1ouxD6rABNVparL2I8NoZdT5kIGnVPcY51OuEPE2rY9dIVwlG+3zbdQ6TZL8GQAvFt/sYkPoEh1pUJPNTEp1tWIT2m/B0BzNO+TpXnTtgarNd0DDf1B0A/DEWfOchg2XeICFLQcDWMwcZRwzFc9C/ogo2AH3GJkYsYbqgsAhNSQ==
Received: from AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::15)
 by AS8P195MB1821.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:52d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 11:55:52 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:208:15:cafe::4e) by AM0PR10CA0062.outlook.office365.com
 (2603:10a6:208:15::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Mon,
 15 Sep 2025 11:55:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9160.0 via Frontend Transport; Mon, 15 Sep 2025 11:55:52 +0000
Received: from Postix.phytec.de (172.25.0.11) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Mon, 15 Sep
 2025 13:55:52 +0200
Received: from llp-moog.phytec.de (172.25.32.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 15 Sep
 2025 13:55:51 +0200
From: Yannic Moog <y.moog@phytec.de>
Subject: [PATCH 0/3] Add display overlays for imx8mp-phyboard-pollux
Date: Mon, 15 Sep 2025 13:54:34 +0200
Message-ID: <20250915-imx8mp-pollux-display-overlays-v1-0-59508d578f0f@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHr+x2gC/x2NQQqDMBAAvyJ77kIUDUm/Ij1E3bYL0YQsSkrI3
 xs8DXOZKSCUmASeXYFEFwuHo0n/6GD9uuNDyFtzGNQwKasM8p7NHjEG78+MG0v07ofhotQouIx
 uMaPVetUaWiQmenO+B/Or1j+BAiIvcAAAAA==
X-Change-ID: 20250908-imx8mp-pollux-display-overlays-b4ab84966c66
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757937351; l=1740;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=u//49ZEM/u/OHghALogYspT46i8SVzkclEtt4HVTIqE=;
 b=7T3Vsx1PAjMm8ZtxbIqBN5iDIbT4+5SVDrmeAoh5evQEhbzfUWzbxBofpZKa+AwCTCEk3jEtt
 UDftdWqPkZiCfzB9Ubb6L0MzIoZA/MU1gCX1dfyOLc4DoyUX7xhLX0z
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.32.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|AS8P195MB1821:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba1a7e3-bb9a-41aa-c1be-08ddf44ed222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW4vd2V3RmhlM2Z5TG8waVFzdGtaanFnaEVMTVRmNGpOMjhnWld5RVRrNTdY?=
 =?utf-8?B?ZlNoQUpsNUFjd2JDMURxbGMzbld3K1dkTEduRUw3cExPN3RhcUtISjVYU1RC?=
 =?utf-8?B?UklGRjhpWUczQmR2cWU0bWlWd3RpNTg0SGFicjN2T2dDVVN0citEeVN4aVVU?=
 =?utf-8?B?SjlKVHVRVE56S3pDenlYVVhDU0RwaDh1a3F3OE56bUNsaG9yU2VTd3hvamd0?=
 =?utf-8?B?cFpid3lPWi93V3hjVmVkUEdLdHhCZFk0RFY0WmJmUTRoV0ZxaXlnbnltcWhQ?=
 =?utf-8?B?SWFNdm84ZUlEc3FjSGpJVXhzdmIzQWZabTFHWnpxQXpTV2hFdzVtZWZiMmNI?=
 =?utf-8?B?cElFTHAwM3QwajM1eUs2RWNGcGZFUDZ1eUkxMExlSW5QMUpOak4zcG1nRVFF?=
 =?utf-8?B?Kzh2WGxjL3EvcWw2Z1RoZlJOeW5oNzhvYnNVZFBpaFYvQmJOdkdjRmtDd2ZZ?=
 =?utf-8?B?L3h5UFE4azNLY1h2WWY0ZnlXZU16SC85ZWNWL3FGcWt2WVc3U3F1SmZyK1VD?=
 =?utf-8?B?VHBIcmE1TTNMZUFtYlVqUjgwRWR6alVLMUNDWEVmcllQWXZEckdhSUVSb3hr?=
 =?utf-8?B?bENGSzhsVFlwWTZFcUFBT0txbWYwbWlOMWVnbFplaW5nUzI3WVIvOE1QK2tY?=
 =?utf-8?B?MTJBWDBlSk1oYkhya3NGQjRoUU5rQ1BFQzhKRlpFWE1nN2h5TEk3S29wVTgx?=
 =?utf-8?B?alhFMXVzNm5ZWkRXMG92K0VocTR1TVBQbW1XRmNvSkFwcHlzVHlyUllxUkVS?=
 =?utf-8?B?bEx1S0lxbHQvZDlhK3prSDVvaStUcHRVMSszZHhhbnhGVm02T1RKQUdLUjdv?=
 =?utf-8?B?VDVGdnJ1WXlRaWRVM2tIR0pYZlRlUFZpanV0OUlzOWhldUhzTEtRSmxEVzhS?=
 =?utf-8?B?UzdXRmYyODNmeFkyZGVWZnFXT2V5T2huRnZQY0JBeTFUUm5ZbkVtd21ZaFpC?=
 =?utf-8?B?MGhRb0EzV2w1MUdWZ2wvcUZGaWtlcjNGWFp2dmJHeTFLd3dzMzFwQ1E2UGti?=
 =?utf-8?B?RzB2eWhzOWRFN2s3ME5oNytoTWJGRnJ0UzV6QVRNVE95cWV5Sm5HR3djM2tF?=
 =?utf-8?B?WUtXa29paklhWnZLZzVkeXZnUFYxdTRncW5FZCt2NzBPRVJOSFJ2Wlc4emlK?=
 =?utf-8?B?SVBqcUo0cmxxWXBNMFZKUHZDK2ZxbFVhN1VsNHdrUDJpc1g0ODM0TFlSQmtK?=
 =?utf-8?B?QUhiMjduZGRJSEdLZmp4UFpPamIxaUtnZEZpV2NtVGR6VzlsN2pGRERISnc5?=
 =?utf-8?B?V2JiTmx0QzhhSTlWTXNSTTJjTW1LWWVHZlF6K2dUZllnWGtvS1lCeFk1dVpT?=
 =?utf-8?B?Q0NTSEJ5OFhDeG40WkwyTVFpV2J5YXI1d0EzUkd0ZWM5OGVtYmszUnhueDVl?=
 =?utf-8?B?b2VzVjlpVzhVVDEyYWpkcFlua1FSbFhSeFNoSTloMUxrdFpHci9xOXpCbG9S?=
 =?utf-8?B?WGx4RFVSSEJVVzF6NzVIQk1kREFVTWxHU2RvT1EwOEhRc2JnTUhoTE5tNTNE?=
 =?utf-8?B?NERBTjVsbDQ5eldWVnVvTGJKZG41Tmh1K0dpek9iNzd4YVNxMGtmaUlzQlRK?=
 =?utf-8?B?OEZRRDRWT09qR1pBTTJ6RHBaQlA1L1BkUzhEdFdCWVFIT1ZWTE1xWThEQzlh?=
 =?utf-8?B?WWlveDdlRlVnMmVCSGplclhlTGd1cGM2SlZ3b1BVRTFTczh4KzlmTlBlWDAv?=
 =?utf-8?B?QlEwOXNaVTlhdlZGTGczWmlVVE5RamE0TWFNa1Fpam9qOGdVN21KM3NxN29T?=
 =?utf-8?B?OXE5azZmWnlObm5Yc09Ob2I0V2huZVhpUGorN1hiVE4xRW9yNXd3S0llUmhw?=
 =?utf-8?B?bXkxV1NQQzloMVl4QlhSVkd0VXZNN1BpdVRKUTh4NXFTbWgyekFtS251eXFT?=
 =?utf-8?B?Ty9pTjNoQWpWL080UEFPU1ZZN04ybE9qbVNCWkd0a3pZdTRoMmk0RitybjNK?=
 =?utf-8?B?dE9rYlBpcEhZV2VpemlOWVFXMEt0UVdaRHJYYnhCWTFpQ2N1WVNIWGw2VEM0?=
 =?utf-8?B?Y20vRFNKOFNYOFVDNWlDc0Nxb2JhdmhRaFhpYXR2dHZ0M0lwSW1VRWFYd3VF?=
 =?utf-8?Q?19F3g8?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 11:55:52.5584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba1a7e3-bb9a-41aa-c1be-08ddf44ed222
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1821
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_125602_838888_41714D52 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

The phyBOARD-Pollux has an LVDS + backlight connector where one LVDS
channel is routed through.
Also, an expansion board (PEB-AV-10) may be connected to the baseboard
where the other LVDS channel (of the imx8mp SoC LVDS display bridge) is
routed to and there, too, an LVDS display may be connected.
However, both LVDS channels must not be used simultaneously as this is
not supported.
Currently, 2 displays are supported. Both are 10" touch displays, where the
edt is deprecated and kept for backward compatibility reasons. The powertip
panel is the successor to the edt panel and the current panel of choice.
The expansion board (PEB-AV-10) also has a 3.5 mm audio jack and thus
the expansion board may also be used for audio purposes without
displays.

---
Yannic Moog (3):
      arm64: dts: imx8mp pollux: add display overlays
      arm64: dts: imx8mp pollux: add expansion board overlay
      arm64: dts: imx8mp pollux: add displays for expansion board

 arch/arm64/boot/dts/freescale/Makefile             |  15 ++
 .../imx8mp-phyboard-pollux-etml1010g3dra.dtso      |  44 +++++
 ...mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso |  45 +++++
 ...8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso |  45 +++++
 .../imx8mp-phyboard-pollux-peb-av-10.dtsi          | 198 +++++++++++++++++++++
 .../imx8mp-phyboard-pollux-peb-av-10.dtso          |   9 +
 .../imx8mp-phyboard-pollux-ph128800t006.dtso       |  45 +++++
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |  49 ++---
 8 files changed, 411 insertions(+), 39 deletions(-)
---
base-commit: e6b9dce0aeeb91dfc0974ab87f02454e24566182
change-id: 20250908-imx8mp-pollux-display-overlays-b4ab84966c66

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>


