Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7BB105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=; b=n33G0tzC2MBCof6dJVOLyqFNOF
	FmYSphm8n/2GcTmKi2H8bS/lv2GfjLVz+M5J8GeTCDKQh9U/9dbUtUVUtKDVovPW2QZcs2VrVmsMP
	pkyy/YvuvfRzOq5EZafqCmZKrSDjVFF5EaniV6GDZd2+J/jUqK7MzovpR6pbgqJVGKMVraolhWYAu
	eTevtG16+5H2YhDj4KmpP/OOKp7DSXrCE7/2WT2+MCU069nZAX630Bh0JsVZ1QLMKcdxCGJPINWk1
	76UQMrIlZAaDvcDKRxH0WucS+zEyhMLHgKAXWUkZlHW2beaz0Y+JQReb20akUcUtLtyXS5tlSq8Ft
	nUpL9cqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13OI-00000000MxY-1bvg;
	Fri, 13 Mar 2026 14:21:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13OA-00000000Mqa-3HLr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 14:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=; b=glgIa00Z9IsiTQY1V8ANHaf2Yn
	s7u80eJLLP7bjMSoLvIGVCSQrzMS3VI4rnzEVmXVzkUgin7DkoJlB01MwyvQmPZwMlwy+N0pLrXwO
	bRgdIqAwrUl13a+WkU1yjDK7+B1j4qZMIWiRHpWfbgbpjjayMcVOv1/n8C3GbOqdJvGpaDDOYEmhL
	0KgXHewzgkAqw0AkGzK/+Q69Gd+9I7N5gfYfCunbi5VYCXkssXKO6ip6UIJb5bovE03alyopTqJ28
	8Hz5aPVpS4RS7KD7pY7ilZuyzqN9B2ovfRm+8K3tXgQCbQz0RQWdv3Y4g7muUpzu496TbuYAn6Inp
	XqYv12zw==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13O2-00000003W9x-3VHW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:21:15 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=u+W2yplkXCmt5rfM1QXi4Ccv7OO/WnlJ4ACw+b94BpqKnk7EyHP/jHxroY+vakRz/H1Yg3LP4nSjaeg3LXeHn4B88rFGY7hjdf1T0jSfbPNO1sKEViEZdTyhZMEvfqSWC9a6hFN8SwmBw1s3ZoYQrqGhKERjlkO9U+L/DQM2zkG0Qpw6UWAGDTlcrTFmciDmx5R8tl5LaEKNMQM3IC4NLI6/xyqIGZDJg7sCtUzwcvWbb29F2+GsBFQ8dHpEbWUEq680avp+KeaIDWzviGMRxMUEEDuJ5ULWhKxewzBYTD0CRtLZnycwjBlRZuFmjh1CnyffM65SHUahRNvRF6KR/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=LhasllClXkGTd2Gxfb/95DNygdeI5qHauVQnZvFMwuoUfn0MTj/bMi0rm1nXsVXtlZ04NTf64ULHV7RQHcKx2CAQa/GBUBxqnTCHiSZZi0Y+3pX3eJNFxLZG27kmFLF1Dp4pmrhH7Y9JujqmcP2x7X3TGhxf9mtorjhG8XDjvpihX9gJ9X7AxhioqgDJlDDtGV1wJCjil1iFi5oeLtgvOkf4+tqFKnoEpPWrjD8WKRLuZYpOLvttwb7tbP/M0grlLCoLiLC1KRrdmTmxR3O7r6iLKDC/KT6YukZHzNGevwdpEWHwRWwB5BqiFgh/bGiJIbkHDHN2KngkADD04f1k5Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=UUbyFbgwaDRb0yjad6nH2lr+QvJscH/AKUci2xl3VtSZoZJJuCwMNTKuUK73ZgF9WTnef/KW/XtSDRfbBOA0eUgA88H3scrWLloTpeiuDSyI7EDCKwCMVJJGudLlh7+b/YQylK/fReC6kXGyL+9q2reCLA0mjMQoNwtpPL1nMng=
Received: from PAZP264CA0124.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1ef::21)
 by VI0PR04MB10440.eurprd04.prod.outlook.com (2603:10a6:800:218::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 14:20:55 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:102:1ef:cafe::ff) by PAZP264CA0124.outlook.office365.com
 (2603:10a6:102:1ef::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.30 via Frontend Transport; Fri,
 13 Mar 2026 14:21:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.1 via
 Frontend Transport; Fri, 13 Mar 2026 14:21:04 +0000
Received: from emails-6715857-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B88D180C50;
	Fri, 13 Mar 2026 14:21:03 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 14:20:57 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+QPmsGqIwKUb7EX/wyU7vb6IYtpONBKTiYrcwR7zv/ulXZW2TWrxG/0okX0zXSpEDLAarmbo8czqbLwIsPz6YxL5C/WtwV2dW+FHHAf0GAwB7veK0agjQm58vwInfwJ43a0mB2gk5frvFW/CL5XrpVdiKG1tfLFwYvAdwouTyHXHUQhZSwoIeJTuI9KCB6gc0KqcfVBDoI7D7ZQBT9EvbZwcqZVpqet7oTwQKm/S7hFtvqS45VZUE7s9HCQmfo84U9PeubmHiHqLcdd79+cRln4jk63TbVSxup81dtW41CMiF5QUcRY7nsquL2r61gq67pcj4Br/oPrvl4I0xGbVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=CXzL6qJ7Z7N5hCXyS23pMQK6A2UeWjiDhTTWWycOWB0Vh1NY7FqeroBoxYYILPRakPx9D5+A0i6igEnYIBPLMMDeyZbBekmXt02uzXdqFoUEWseUS+AAAXHfBjrpTPZvGsYWao0p4gc1EAAEfT9TL38gEwaBBWbzF0A0tUTYrQL8YbTmGLjOP/IK2nMq0MTcmXORsFbeSO3oc6Fb+tmalwLcyzsALtp3cRX8shM58FD2RWnYOIfMGMm83APGOAbD7pv7VrV2NF9nGqvUCB4B49P7GPozUEwQosceKIESEfIoMPuN/uNVArut6jVcnBKxL7ngmEF0e0B5Q2V6gLSYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=UUbyFbgwaDRb0yjad6nH2lr+QvJscH/AKUci2xl3VtSZoZJJuCwMNTKuUK73ZgF9WTnef/KW/XtSDRfbBOA0eUgA88H3scrWLloTpeiuDSyI7EDCKwCMVJJGudLlh7+b/YQylK/fReC6kXGyL+9q2reCLA0mjMQoNwtpPL1nMng=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 14:20:54 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 14:20:42 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 13 Mar 2026 15:20:50 +0100
Subject: [PATCH v4 09/10] arm64: dts: lx2162a-sr-som: add crypto & rtc
 aliases, model
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lx2160-sd-cd-v4-9-aabcf230fbff@solid-run.com>
References: <20260313-lx2160-sd-cd-v4-0-aabcf230fbff@solid-run.com>
In-Reply-To: <20260313-lx2160-sd-cd-v4-0-aabcf230fbff@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::18) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8355:EE_|AM4PEPF00025F97:EE_|VI0PR04MB10440:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ea1107-f89f-46d8-b481-08de810bc2bd
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 9i++yrGeIDJn7WyVpB5+x3Oige/VblJ0BWLeqM5gOA0DHwlWpJJmKMZ/P4UijpKbLSjDDWWjKbqb2+1xA/5qbvy4bk6AbS8E0oBEyX34n2dGg7qwIg816a5OUw9xblWPU7wzFINTmvHV5BtQ3O0zJaX+eRFlPEpgZBLYxspoDjz4bZkFnBVXAtQzdIVcWNNpE5U4TsYXx784smaPitSvJAMbPjkwk2FlLop7uT9e0RbLAXuIJOMT72H78oAXhY7VL3+Rqc7+bvQ5w+n+V2FWIsrZJyFGiFMVUY72UeWJ6hrPd+84TMgyUjm/buR5VJVcnBf37RkIKGx1Ym5ALaiuMmMTaT067sKfo7tHJ4wEJpYwoQEWUuY37uq1F0bw/MSm3L06M8MfWyfsUnzWuctIn9kaNpGLf6+F08nHt00WimZ5Jha+gTvCJ7QdnY96eL9w7KoDAVA4Y0OuumOGd/Z4ObTZ5OxQjDJcgM7uwUfaYmfBG4zHIf72raFad0P6VX7Jxc8DK8coIdfhqb0MDzQzQlX8PvD4j8EIxt6OwXohJt1CaDXGDsMD/8j37HkycWzilco0rkLx1im7xGu68jPaXfGS27UIs/PEAr8To9tHQR0UApzd+Eh0ENqHs+v0NVod1klDxkB3opGjs1oGngXiQoxm5/iqsiJeIwWmm8v+mhps3GGRV5JfujZhYyvP+L+Y1TFd+vgYgDXnQTWkYME7eodqTaNCczdZdU+IHAZA5TEOl8X4vawLHDY1qrCo18b8bvUYbsXwhq34m1V52W0LnjnXvwUPidZnnWtsQ+d8y5U=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: J29Ml78QMl31omR7AFxFki3uwEqTa995BLDFxx0qKt0hCXDInNFTyShrPX5tsXI5PnuuAVV3jfLxoygVuWo82dODkwLYmz0pRO0ts3ri6MD2hJIMczju63iaexcVjBcD9dX9MYpYnZMNa0cFaRTtYCgQ+CpOY5TGhji6bfFBXZzEBf8KgbaugmXy8oqin3GK2WO/O0nlbpGaoIbTnEwMWU2BJTZdUm5KfrK4RGP/RG5e6enL5REVDp9WI3ptupJbwkhtjYxF+6omRkOMmTZzQS4ZxqHad6xv023hxFRqLb7vpOFIWjYCNoSVSDcB+TTrDMzMRxDu0GYnz78RrE3Gmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 92ee5be3eac549b387b982028d0a50df:solidrun,office365_emails,sent,inline:63fc3aa5d97fb79fbbc6fc70877a80c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b5bccb7f-a9bb-4534-0432-08de810bb4ee
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|35042699022|14060799003|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: sxQTy4IOQazXGhsHdULw/Ld6YGKgiGMvjtM8m6iNmsugCWKJfLV/ASvHLemwK5N0JrRXXwPStjetP8e9ki3htCmocgU+nWKS+Thtsh42Q1ou3sxFW1HpvEnmwXZy6QbzMLqy2JC9s4roDj76KPtacWdjUfU6SvszhW9yy8+q+NLgvvobw/2NiXWYLx4lgGFIRLW2cFfejhQy2Y6IEQE+1kensfDUM5/n5LwiFDh3YT3DkLzAh6Y2xj+YdALjvX6WaTTOQxaIJsOIssrVSNPppYTlYSp+9cNITfkoQlXwwNkM9ha3NxhJz7eryV12YUoYlPJUKuNFAkHmBP364oFOdAuH0NVAmJOw7YcZssFh2FM3w5eEb7ulkexnEsCdzG+3o5N4niUbgvAYP5VF5x2bOT1spU675cheYgefMsZFhPuYxGtV1BFE0NtaTAQ1CbulUo/ulUC2ZSgUxxXsvhTTC2Crmi1Z8v6olBe4cuvY34jMUU+wl0Fabup8x5rQy620hrfuX2iUbu/uage3KC+QTXNU9hZPIwRTLO0HaxsAjS/S1y7PbzILsh/tYqsH6r0HIukQbBYHT/Akm5u0XRofRKMW2or+7vz5duc2DeF1gvQSyM5MhonvXDkpAVOY7QprBdU9hHN7EcTeXgwqJ5lQxoJ+N/nswmbiOZi1io/uI3byujoqUOw8vzqzVjHgUvefV2q6Iy2jQBNIYCTf/nd/ZCtRjv78nmdzH2St8V9PcJMjpig9agMnNvp5YLFAiYthwjx1NpFQqCwEbwwXeGaJ8A==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(35042699022)(14060799003)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8v7Z3SR5HCIaLOuVmjo0nSl1eS6wLb23kY8c/hmCW35Poh+Rs2omazfpXBtWE/lJbUXUr/kjJSXQQpsSNTJKttepcC+j49oATYRvdbniV1ZrLUR3GsSkuiJ+g9sIQzE2CDDsRiLNMuYNHpTGjeuufqqj/e9iGR2/xmFv0UdV9ssDNvzYuyVfiyOZuq84AD7L8KPdhtD3LSak8dPdHbdLoz8qLPr3Nxaj57UpR1/ewYYike/BCYb7a1B8eSCHhSnEmcaIni8TEKzUUVLAjpjgI54bPu+TjE/TCOdakAZ73hGPsDdjZfSMBrrj10eU9nWSf6w+C0T36tViRN/qjIrAb027mdmjh80rTFEZvis5cNzx9qF78DnzxextuvLxL97PFEjrSr+uj3sGlw7LG27n/LTN3MTzMgsSQT/R1k0gmIn44Ccv5oeqSF2dNfJbYqr9
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 14:21:04.4012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ea1107-f89f-46d8-b481-08de810bc2bd
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_142112_572380_927D9494 
X-CRM114-Status: UNSURE (   9.48  )
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

Add aliases for crypto accelerator and rtc0 ensuring that on-SoM RTC and
the SoC A72 domain crypto accelerator are assigned first index.

Further set model and compatible strings which are informative but
overridden by actual boards.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
index e1344942eaaee..3ad908d52a18b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
@@ -5,6 +5,16 @@
 // Copyright 2021 Rabeeh Khoury <rabeeh@solid-run.com>
 // Copyright 2023 Josua Mayer <josua@solid-run.com>
 
+/ {
+	model = "SolidRun LX2162A System on Module";
+	compatible = "solidrun,lx2162a-som", "fsl,lx2160a";
+
+	aliases {
+		crypto = &crypto;
+		rtc0 = &som_rtc;
+	};
+};
+
 &crypto {
 	status = "okay";
 };
@@ -77,7 +87,7 @@ variable_eeprom: eeprom@54 {
 &i2c5 {
 	status = "okay";
 
-	rtc@6f {
+	som_rtc: rtc@6f {
 		compatible = "microchip,mcp7940x";
 		reg = <0x6f>;
 	};

-- 
2.51.0


