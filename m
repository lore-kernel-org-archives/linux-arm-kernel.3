Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53230CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPbFNsZLvdThwohuFoxuz7Dt+lLXspWabhIC+wYJaUY=; b=axzFzuAcrfp8iRaNa3+tjzHzy7
	rBN/KlSFzim/S2uv/6sVH/Jr+x5TCOfZoo36N8uvrKxOhytBDz/UjkJ0ssDkjDJtxzWUSpSKVI8ga
	UEgsHOT7uiRiXs9GfklaRsxLbA4wEGd7R6IO7oaRZm+im7KS1lbUS+RHBhvgZHJ4FuSHYUQmRovv3
	g3++lQyDvUfoKwM93a/PeesJwXqHn3JwdNGoVqmA7rdhznCQhpYkPcNLvtlG3jzmJ63livyu4KvVX
	LLHPx72gIsaQkiQ2XBmG81PbqdxZ+Bmz5UUgS5SDyp30XuBc7QpzMrkYd8GmVWSDCI/3NaQhTuzBr
	fZLNboTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv9r-00000006Hfe-0AHK;
	Wed, 30 Sep 2026 14:19:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv9c-00000006HUa-28On
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sPbFNsZLvdThwohuFoxuz7Dt+lLXspWabhIC+wYJaUY=; b=kWdqxVUB663imwKorQcbUBrY57
	cglz/17g2jty7gS8CwhivkUSeuE9sBzMDFF9toVJFpONWfWnUkzSd4xpEfFZNI7Ws5SUzGcPjSMFA
	z3uWHszd9JAOajnikFZf1+gmNeGTxlXMr/yY4LF/h/gmNMxW5dU46zLj3nRTnrKGhXsPmBikZvrxp
	wkFIhopJ1HGefpHJHUZryBsTTfAX8Oc/9Y/79RyL8SmjqIrUrS2mqopP+SSf4ahj+axzy6EbD2vWW
	Ncjl3tsWSUMtKDkHqNQ/kMHeHoe4tfytwRGSV5arEAKz/XxzJu21D5RAsDDTfN5+hUoEysCcD0gEB
	G8rYa6cg==;
Received: from mail-northeuropeazon11010031.outbound.protection.outlook.com ([52.101.84.31] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBv9Z-00000003uay-2LkV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:19:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHEUNlVQWeJQ95/sXk8VRhAAlBJdnDOWeOQ9yvi7NYQ46B49PBfmmv54dOsFz9fpsqGLwio3Ms+ugsW8ACOzEr/To7fwOP+o/9XRt7yS7ZN3GNaWf6ps79IcxCmtEt0jJ5fKkpFbgtrwHK2P5jVjuqfXs0+Xcoqx1PqWSOW1eiR9RLlgp5wm+/Ethk4bIJ5jtA4T/l5ydRuejKVc+3+ndKignpjbHTizUZp4qWHlmwVtWWVWbDUQ0plCvgmHsQ23+eyovHgZy2DF5CMWpX6MN+uLmgdaQ/WLPnaq8Ubipx9022lmAkHi5qFp9XKpJRk/RfSqo3gQFbhRF2thpCFevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPbFNsZLvdThwohuFoxuz7Dt+lLXspWabhIC+wYJaUY=;
 b=zW47kSXWt1G6lGA+TfDkc0aQjLdVp4Qst55QQ292mTlATJNl8zEKhNK3k78rHO3OQjUs3TJ0ML6ZpI5eDn852l4K3mc8T9PiLobgLBFBT4r7zPbhOhhZHoGIw09GLcO5LBiQ8LT2LaUL3Tq3g5m4Ii2IkCSGti6zFn98ObmPKyTqMGlP+WwtKQOr2nkQIh+swtVTPYnC3cqLcuYkTpBwL4i0tziSCi45mCF+91l90fQpYaUjYsQuoFZP2CRSUUZsHLeHIgwXQMwU3fuRIyDGbOZHlAF+5u8uAWBirROhogDLNc12SWE8HjdjTxcf6bW28bjDtPXcoqXnLSbQZw3jkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=baylibre.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPbFNsZLvdThwohuFoxuz7Dt+lLXspWabhIC+wYJaUY=;
 b=O4ie8BNUTS+BhhqWYbs1RYro0RDrffKlOsHjF+HlOSwvu2qH0pb6/HB2V7lmF51mVNLDRTrOIaQiZsgLYmBzAEgYAaEqUGQl1PoBr0L+Z7aoeLXDlocrASRHd3OnGqY0PL5fRhevRzWu0vcnXg0uDPSWrf3xjmSwrWlFi61fMZ9sy1S9kVCTYa906mpzC1xGrfnHji9CU4wi7aynyPev0g68Wn6LZTHSLyg7/bf5HGAYfh9HzhFY+VT7KbpUQWuDi/AS26S09Se17e7xyPpwzHkiNZEBYjgI3f/L2MXrXXGZxu1K08HM4tQLjbr+NyO/vsKkobw9ZcLgypps9mrxUA==
Received: from AS4P192CA0019.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::8)
 by PRAPR10MB5421.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:299::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 14:19:20 +0000
Received: from AMS1EPF0000008D.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::2e) by AS4P192CA0019.outlook.office365.com
 (2603:10a6:20b:5e1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 14:19:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008D.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:19:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:25:14 +0200
Received: from localhost (10.252.17.140) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:19:19 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 30 Sep 2026 16:18:33 +0200
Subject: [PATCH v3 12/15] arm64: dts: st: add vrefint calibration on
 stm32mp25
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-adc-stm32mp25-v1-v3-12-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Patrice Chotard
	<patrice.chotard@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.17.140]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008D:EE_|PRAPR10MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e2eeff-777f-49f2-d491-08df1efdd1e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|7416014|82310400026|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: /24UkGSL5gP4yPSf03jaVhhtaeBNyFqTMNKm0RiNqoIQuZjU8AclwM7ffc7CLrjL8H9DTRnm+W3UKFGxHXn9nY2YeuG1vMkeHeRBC6muNrF6q+eVvu2EjJ+jigvZSxzXInZFzsj2e6nGiDzcPt5zjVzgYdDxbY5AoxEgG16oxWFiK5wIrOVkUMB/dG2lEGdhAKSvkueN9AemyuRfe4WFZpfV5RQQQqGs6wrluoBVPMaikp5NmKZGcyOKoSTwxLzfd5ENhfTLk6avsQ5JG0et37bULKo9BvY1dqStVPaK8O0xPzKk6lnauHbeuUPdrbnSqgXFEgQb9rD6GJJrIrAMVhik2jTq85hBeFv0rWcHq03+J1rpkZhiFwjruBXHJT6uQoBbjkjC/aIF2DtwvrAiPYpOoXXug0oDdl6UpQ9HtqWXNVMKvf5kPfVzektb8nP0fFAtrn6ufi9Eibp/4RpgOPhkSuiT6tgCymxsHeVxwEtNLTxmnxGva73tHCxQAs1OZa7hecWu8SYFmIj9MgFXmq88XjIQ/7J3WckGq2lwboaiU7XQ+VCQ9G6L7NXDb1m/dQ7CcYCEZPhNGzJJViiMf1lnfCxnkRVwwaPi4fgCSWunbNaVV/M7fI9KjpOpBHMLgVZ1sNeUw5LvgANEPp+xfwgHJROA0TjBtXiQM6CKPbo4IGAarImaL6wVkBxHQ1qg5LK4yrIUe+YR4R4B/PDvIg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(7416014)(82310400026)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0WGNK6D5quDdWGB5dtnZZBWJTyajrWho29PBvUiK0d2WHAJVEhvRGmImBPmb3r8isx0DpGNUcHsUhWaLFvtB6PPD27WMYj82NR8ea3UvI+pIKXnIg9RUAl6b+Qv2eJxhAQ1kAF2OwIfcOFqUqxf4f2cU0HyymXazTVMXLvOD+uYePv2NzNvRlCotPx9ezaUUxCNjdKRcwhBzrNLwxdZRhOy401u/iyTVdjZlQx1FkyDKOnUQsjJP/IQAU6uvAbZiYN6kU3XPcM5KvjYzIH48KzAC6Fv4zrPq75TGjjUKlV7uA9wUyTacmIThQ1kVEC9wJ5S7ulENoU5gGZs3H1bKYpuBZz9EBlThwuQWSwklrWDKYREmJmt9I1PHmbmQRN4pzq5IjN6xeeGd+AmWlkrBqf62AZB/Y5O7RSlQj2H087ftTcP56MFw9eevxZp2Moee
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:19:20.6198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e2eeff-777f-49f2-d491-08df1efdd1e7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_151925_780393_122D7BD2 
X-CRM114-Status: GOOD (  11.18  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Describe vrefint calibration cell to be retrieved by ADCs through bsec,
on STM32MP25.

Co-developed-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..82a8a6f1f881 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1777,6 +1777,10 @@ part-number-otp@24 {
 				reg = <0x24 0x4>;
 			};
 
+			vrefint: vrefin-cal@1b8 {
+				reg = <0x1b8 0x2>;
+			};
+
 			package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;

-- 
2.43.0


