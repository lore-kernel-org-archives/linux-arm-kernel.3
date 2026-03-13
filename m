Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820D5105F7A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtdicxhQZQful002p2FPiQBhzzSIOaWfLVbVVk+xlGs=; b=4UAV1i9ixUp7WE26/kJ1r2lG76
	m+ihI+tYEK4WbdmD3fcpWiyLr7Eks9RvoJiEMlAezTneplrNmdGr2YeuYLYqI5Dh6zEP7iq/DfFEJ
	rB+GW6MDVusDg9FD31cM4bP5hX2ES8Xb3qOEfx5n5WdYEdBKlrmKyE4JEcDxoawHWjyyWaSSTefnZ
	ruz3GZRdyt5NnG76FjKskYj7KhE+vJbDvfAPZFOOVz+tRhbUi5kh7A4Bd85GNowZxDM9FaHesbmHk
	raHT+DcJ+dN/sOzNxCtsrgBzWDj3akMl7CO564KBlLAyom4Watg6MYakszGwYH3GY+yMhJS8+v6oV
	lpe7xtNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13OI-00000000Mwg-07qt;
	Fri, 13 Mar 2026 14:21:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13O7-00000000MoK-2IAn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 14:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EtdicxhQZQful002p2FPiQBhzzSIOaWfLVbVVk+xlGs=; b=YRfWybcD6kXhrGUbQPcYnH0s6v
	94FTFoeQ0f5EK/Chr1g7sJdWio5mQzKT6HG1hi0D1xTnX9XwWMQKv4UTuWjynnwQlhg0bu0GpTQGn
	Gm6rNIHoItnCfXxmy2VXdk1IqwVMhmvldZ5hql22Tc47XhnjvZhC7xyRTo4wBb/C13HNuMKLcH114
	7W6VK6ZVWvUxDY2pOIN9zLAjKKkC2niuX3QVonwYJqtnzK9/X0oekM3lkLSbke1JbQ+H/hXKyoJiZ
	CgbihgiUxmDwn+SYVqDelTiQO5Z4RXsccs2oG5hju+1sKgLJ0sZPFuuybhP/kZlC2Ff+QdVYzFPqB
	UnBiFzuw==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Nz-00000003W9o-0Bc4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:21:14 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kOr7/JS1PxQKDY/fv9W91HvdcGHawAMhFMZTjH/Gm5htkq1VEOJolS7mojyeG46mXO2NW859TuJeuuxEoxS+vuOnxSzqPtpC7zqurt5fRfTSHGSLmZ66HATIaoKgNOTqofLYy0moYpQBNjWEoecdqvrxkG1cLCGIlA0eU10cODjUHU1QiAl7rUZ8pmIqxQzFkddCS1t31x3yfJlezCt5+/QCD9dPh09oXrSDwNmRMU3EroS+D92YOf4gPVyl74uFSo2Lek2UmIl1eLOqvGanHLndNmySxkkPuNw8QcDmz7L6E5s13MQHsQS5DhjNH1zE/F/SRffSQsgaBzh8FmV6Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtdicxhQZQful002p2FPiQBhzzSIOaWfLVbVVk+xlGs=;
 b=YRUDBaAklCLmzzjngm+BpZSqGI0tFs4DHrdC50smw+la3nw+vIFUZkbFg5ScAB+9p+W2tKwamaGG3Yb0LIp1iX02UXocGc24WmvYtY6RN//PJO1NLRgMosPx+NQQ7iYSMcwNk5W/ajXAErcqf2+1EuaLkbPqtEOnm0z+7PKHLo74DALiO0lh8XXHi+kfD/04hjcz1Fyl6h3RtboWZm1usTnycnxA2POawGku1z6t8fIzKZD/WHUqpoTf/UebSp7nAuax4RF1xowKBtatTIU9MtET/S3g9f9FWwFuLaCn59LHzNmNYLrGSdzgZMjFP78dMUMdlWeS5SAqJ8tPTwxh0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtdicxhQZQful002p2FPiQBhzzSIOaWfLVbVVk+xlGs=;
 b=HTKt49RR1IUBb1Y06BatYwPLeICy3Df0DMGGMYCD1qi5/qCJM7Z+uZW3pCKw0hmn/FkRONP+L7/UoyIoJlEu4vZBn2YrmPFi9wJN9sTtT297blPKv4B9DPah4M1X+zoYtmsLGXsXl8nAUUPlQ6V1oOQwIjXYAU34sfd1VjYPnvY=
Received: from AS4P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::17)
 by AS5PR04MB11443.eurprd04.prod.outlook.com (2603:10a6:20b:6c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 14:20:52 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::bd) by AS4P251CA0028.outlook.office365.com
 (2603:10a6:20b:5d3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Fri,
 13 Mar 2026 14:20:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 14:21:00 +0000
Received: from emails-6715857-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 9974280CB2;
	Fri, 13 Mar 2026 14:21:00 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 14:20:55 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBpK/avMv/z3S5E9Q4io8Jx+OL3Og0wOWhSQaIw3OcwO5qQagMqJza3v9U81O11KjnJFFEOKREhvB8j2P5eeY1ypvo3x7noEqtiosb/l0Da2qKYF2aTwDVBxo5P2D8ZG1SAtc3LSROgvZ3ZdDeh/K9eTZTNeq3aEMalsOF0ASMazj22EG4DRQ+k2SmIy1MZ1FvMKcrRRH2z+G8jxC/kzyac2ABIDZsh83xb5UaDLJqFeT8QQJyfwWm59NKMJs9wHj3KO59SYnzgLaxQXDt0oDdcQqdeAoGa+dykojLCh5l1WbYj487FUg0N/R5jO5oDykEAU5KucwxYFJgZ0udD1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtdicxhQZQful002p2FPiQBhzzSIOaWfLVbVVk+xlGs=;
 b=ry5mzs2+rY9ONA0fmB8qCY0hEp4IieR8jMbPpYd+Eh4uv4E0HIj9X3Eg32ibKuvE+icQv2mroYF4MWmyjY0/co8lexLAyNA4MC2H+bJ8bno54VNvjjXxcc2t7FrcIWBlJTQSksMAC5dgIHkBbwhNGrsg8HyLnP1vTB5NF6tTZiwIobRl24ndo8sGFtSCXi+TA8r54mT97xRAll1Ilw6yOuwfpYi7cZTEbcZDf6xceeO525V9Yk3tl2A/bNCZ1pYW1TJ3vbDHyMeZqHFrH9yln3/IIOTCDbcICFnoXK7ZnqFpXYvqUGSilpFeOuzUfnH6eJnK3S8KbOAynjO+ycQUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtdicxhQZQful002p2FPiQBhzzSIOaWfLVbVVk+xlGs=;
 b=HTKt49RR1IUBb1Y06BatYwPLeICy3Df0DMGGMYCD1qi5/qCJM7Z+uZW3pCKw0hmn/FkRONP+L7/UoyIoJlEu4vZBn2YrmPFi9wJN9sTtT297blPKv4B9DPah4M1X+zoYtmsLGXsXl8nAUUPlQ6V1oOQwIjXYAU34sfd1VjYPnvY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 14:20:49 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 14:20:37 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 13 Mar 2026 15:20:43 +0100
Subject: [PATCH v4 02/10] arm64: dts: lx2160a: change i2c0 (iic1) pinmux
 mask to one bit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lx2160-sd-cd-v4-2-aabcf230fbff@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8355:EE_|AMS1EPF00000045:EE_|AS5PR04MB11443:EE_
X-MS-Office365-Filtering-Correlation-Id: f82fd446-603a-4f39-54e4-08de810bc0a2
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: SqRL8kRh0FUYW07uXfyP0hZ7KKZI7YW3K1LchVGBpACFjVbdoTwpUkUDGFh9sP/aLd5xO3ZIJixHwci7wBoNXc/8ccVT8Cz/mMi7adr5s10AOHd+1IK7Hirq94bjW0yJD4dTa5961wNyeL6frTct71vE07PQmPDvQ024qFnc9NeMoIcxeR4kR+vFh7nlSuI26njhoIFf2+Ir3UPa98S1fnM/9Z6Chcpjdale4AFeuiwy+l2Zz/sD/meP/Mve54nIM0gRSVurNNIg0YfnfbbVyBnmhVUUflG8L8Fvqs66EYJaes5gGn3rI8Z1ReG+EY0MS5Piauamv9P8zjhfRxA6bc0jit7Ej5Bz1Fh/Q7ndaf77+nL7zBoqabFw7t/+pmCmcJTzIyEqdEqNtiguhuTvSADVnz0I1yseN+CIb5RyHByl3eH6UKknztCnZ91f2DDrrv4yDQZC7NL3A4OjvhV5XJ+TWLN7RIb48D9sO5XWF6Bfm+ylwFhnT57kvtz7nmSIhrxfJ8di9cRMdgNKywIDBbu/1Wm6Ou6ijgGHyv0xuai2Rd+oWid8XK4ImAggLjTru6ccFrMQbFW+wjIG+0iCSBf222gnqBSq3ol0u2Qm0MjmcMjyIdfK/VzuTH+t1S+cdPhDEA7wgYM1LBnsYC9HlBhWNoxjmd6ZsDKNX1TDBcFwtnxglrmnizdrgxzW0u7PeehSFjpZzru5Vw6dugOj8+QyCdR5ppuZvtq4OyBCN49FBQEn9i9REO0OU8GneL3ienq6EBWjzAXl4fU9d2Bq8bPorBZcVoJTcE51vJTgbCI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: OgkeMHmx60loHxHRIF8LENGniLvnCJb3+9FkwysDyPZjUL1uCqjlOiknxanPKGT+8J3fcEpH+FV/U355cadhZaXN38YlqiB4yssNw3pH2Zb/54aa5xqthJfsgiekglGU3Cbw4CZWiJEBr2UtadWOb+fARxWtp+DbIXB8HR6cjvgSPkVHkPpqj1CojAe+9unK/N+/jiakaXVOMU/DUWoF8EJIAbZOoG6vpZLy/pIfGS4avPe/0KSsNRp1pCoZRm+qS0REPWzJUKsluRHTy6Cf55MxDUw32V4m7TlztOZq3jAiNxi+7h4c19YWyOwwtT0UnN/xyyiKqMtDqd0ViGXdlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a8a7cc08380042a18bd4d904fe28cee3:solidrun,office365_emails,sent,inline:63fc3aa5d97fb79fbbc6fc70877a80c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 740084fa-0cb8-4d8b-4728-08de810bb273
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|1800799024|376014|82310400026|14060799003|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: COACPvt4GlJ5HH4scxUxbahP6H1/miot3lSUWEesnxh+iwkxuw+1YNLbD7J0JEQpn1yYo+gS0pMSuo7PzXG8Gx6pkS1FqSd3YfLwgQfgwhm+ewGgkiUpFK5NSJhbJSRXeuPScQLuxeAdWp0caLctob3AqCbmO2ZmS0uQgpseFyfZdOqWt0wtjoxS5RO7EdrqRIORsGgQQZQLOQg57H00wU+14Dtr28d4uZD+JYZOFtsJ5GK0JCrlSoc8G4PqOxMdRYWUXinuZCbbqjcGif8TBID0EWmbmuDE2zzy0iv3WX4omsoyykkoy6okdlct8mnu9iGQc/+RfWF3+q/mjMmkFh/feVHOUKC5keiyKly4jJyRJ2tACP2QhamR3n8kMYPdhSzP0toBmx/9P2fEutVFoYZLgl9TcFEhm6sTF0gUI87L3X0yGhJxmSfDL6jDGtUai+5FmhFx3qPpMSO4G/7jwjnXnY+36FM/c0tv1BL9NI9US7LceXjlLrVQ2V3x8BCOcqKiQOwhX9c1OPjaj3ybTxfr+ro60vTIipzwYeB+OAY5SX9FEj1a+QYNmJexD4Gwitg0rfk5vAcZb9gszMddIw7+J7PJbsqCjqbrCDygUiLVmrqWyR/qwDgMIiVEbph+DRkFjq3TNvlMBzuhstpoTQ2uHfcsO7Av+GjghsLkRaLK6emDNJqG7GT525HWd4VaXnrUA6pBRn2Of/hj34wu4SSe7cZaY1Ic2ZTNbW570OXrgBV0QsOChpneLGC4dQlilKHmTVxIhyhQxxnT1625/A==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(82310400026)(14060799003)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hUpaL0/u5mDbA2H7eUmtd0znSObrzwr9nRMuyvN1f+VHd1bPxqKuixKGcge2pLdlt+uu7rZs2/3R7naXQAM3o82SJPVfHPF+avaMg3jX1dY0xnKHo2xYNvAQp4X9J+/tcaUFdY0y4B9zPNGtwQUyYGrdOEXWHttxDtfTUfBAINS5vTiUROeXMZHHZxRzT2yBNFifxrWdXMvlq1PxmKKKjpglGNExMOj/KAZvMXHxjeBNdyE1NhSoc3bMjEu+hw1qPw4R27u9GXAN5nHCGG+6xfnncVGVEJY/xdHEJtWVqpfuoYjnkfz0/1J4wagyeJBCCkcsdC27avfZe5oynHzOphTKVGj6tIsFEfmxqAKd4jOs+0rISAkgKGdAYdxOG5XQQT5BnAmmQJla6m/8iLOYqapCmPLulv+Io3zel77FjMdbJePG3vyI3RDyseHgav1y
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 14:21:00.8652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f82fd446-603a-4f39-54e4-08de810bc0a2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_142110_450737_18FA12FE 
X-CRM114-Status: GOOD (  10.43  )
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

LX2160A pinmux is done in groups by various length bitfields within
configuration registers.

The first i2c bus (called IIC1 in reference manual) is configured
through field IIC1_PMUX in register RCWSR14 bit 10 which is described in
the reference manual as a single bit, unlike the other i2c buses.

Change the bitmask for the pinmux nodes from 0x7 to 0x1 to ensure only
single bit is modified.

Further change the zero in the same line to hexadecimal format for
consistency.

This change is of cosmetic nature enforcing consistency with
documentation. There is no known issue when writing the extra two bits
marked in reference manual as reserved.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index af74e77efabc5..d5bb55df03216 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1794,11 +1794,11 @@ i2c7_scl_gpio: i2c7-scl-gpio-pins {
 			};
 
 			i2c0_scl: i2c0-scl-pins {
-				pinctrl-single,bits = <0x8 0 (0x7 << 10)>;
+				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
 			};
 
 			i2c0_scl_gpio: i2c0-scl-gpio-pins {
-				pinctrl-single,bits = <0x8 (0x1 << 10) (0x7 << 10)>;
+				pinctrl-single,bits = <0x8 (0x1 << 10) (0x1 << 10)>;
 			};
 		};
 

-- 
2.51.0


