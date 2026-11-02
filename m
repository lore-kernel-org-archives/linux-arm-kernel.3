Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D08606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0B9H66X2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FR30ZiB8;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XM26OgWD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xVGwxQnPo8iNr+bJIVXidlAAJucJK72QQd8YYeApDKs=; b=0B9H66X2eAGt2YxLiuHQ/hhnFt
	AAlAQKIBb48Ko12fTGVosxyURyosKq9cHhyXV6VkEh5b1damyohNLphZyg2bNQOX9F43sAkvyg3vk
	+OjkJRXlVwTbAwNA4Y9IOyZ4B+Jr329tcRfCHGiNAuMtf1ZomSORjSpaIAN+ll56cTaCoU4roJ0E1
	2tt7jeRXDMwZKARoWkCQGA0NUyjivwryQ2gjTH/mK/gAqxqFMmtO1rT5BVYK9I8fKYi8sLzGGOuIO
	+h4mGdaUMPAIDHlBVJalo++XUsOD3qm55NkDuTwrST6qVPJQYVqIZgZnE350imlogwfM8iJVokc/E
	TInRFMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr38-0000000GT6R-368A;
	Mon, 02 Nov 2026 12:22:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr36-0000000GT3A-3a89
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 12:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xVGwxQnPo8iNr+bJIVXidlAAJucJK72QQd8YYeApDKs=; b=FR30ZiB8tgtH4AEFNS+4iFrtLq
	AspIdGLvqB7ZZ64OiolHp6xmTdJtiOCYSCAewmKU3dfAbGZD3+T0Abb4KdN5+0j7DRxKCoWGegc/T
	oRqprv/qXsJLQ2NUxxuH0gbI6wwTQjBp8VJMwT4KVufIm2zPSLGdDyn42EgwSgYw/DxST+CXXCFR+
	mlv22O/0AYV1Yi3Xl/tXEywl1nzb0IQ0w/lhwJ+Bs4S8hH3Xbz2tSDJpLftsB2gsJ8H/AAzu7F0Uu
	blFqrkW+44wfTxunl2c/K7i+pdLZfgy0tm2ZRDTe1EAICznwbmbmJVDHoZ5103D+WVJvOa0O1MwzN
	2IljCz6g==;
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2z-00000002Ui6-0ZaY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:22:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ama+vbEcyIT3ZWCzBktiF2Ub9bcMPL9jggFTrjuPP6/cstT/X5lplruYa+TYzz42yXzRArcQ6d+wiq360GdxQu9be2r0CX61GciEADFFRUapoXUeRRr4DhQBWdAphJ+R2qdu2Adbz7zMahATl6O51RjCV60R7Q9it9so0pGe+UzplMxDwd9gQeSTu80dx0Vi/sLjtDG0O8fynmC2dkInLVpAlZ1C7cdBO8sPD7SzNVn0wUg8yfrkFeUkV2IzsU2g3WP7H4Rj6TIXEVxs4HX+WofLfzzvdoTc6Aaoy1ae0dhMeNK7nIgyKT2L9C967cpuV8sRvDEYMK1b/mz+uBGwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVGwxQnPo8iNr+bJIVXidlAAJucJK72QQd8YYeApDKs=;
 b=gplnDUDnDzwnJQdFQ9TFtTmizXMom/dOAEHJthfTf8Bye+cWJbDhi3THHJ5XWmKggspRqXz/BELeBPhuZ2z/FmCxiQYU0j//dTVu6pZonRooDxHhej/xB6YBnEY/SSDqUWpE7ATYpAzzG0SfBZF9gC2AlDvL6MvH2F/kVsFs6vgbUImrutnIjlItLnw86MGHl/EYRVmue/8hPEJonNlTI0z/y0/e1PcRBIBWTNa1DIDKuNNToua2dUdPD1cQ60TnGJtkDrR4R7eywBDqotn0/fGN8WxZI5n27ONSZC7VxnPVlS7EOWoNV+nwCOEDNvGdQ1URkd4iNAFpmGX6MkWKSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVGwxQnPo8iNr+bJIVXidlAAJucJK72QQd8YYeApDKs=;
 b=XM26OgWD9eMJsHfLZh2uvlKPPBOVVrfqVNLAh0qQs1JR0YOA0pl+BkCfPIQQe5wurW3eI7jqfmOoh7UOJZhMDOiH8gmCma9qs1Ydz/j3hCFVndxKIkg39i0I71nvO7S0o2v6MlzPzQB5TvyCDTV0sZNUjQAJIzKBVmusnEqQEgc=
Received: from BN9P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::12)
 by DM4PR12MB6009.namprd12.prod.outlook.com (2603:10b6:8:69::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:21:47 +0000
Received: from BN3PEPF00022BC9.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::9) by BN9P222CA0007.outlook.office365.com
 (2603:10b6:408:10c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Mon, 2
 Nov 2026 12:21:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BC9.mail.protection.outlook.com (10.167.248.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 12:21:47 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 06:21:45 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 06:21:45 -0600
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 2 Nov 2026 06:21:41 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH 6/6] MAINTAINERS: update Versal SysMon maintainers
Date: Mon, 2 Nov 2026 17:51:12 +0530
Message-ID: <20261102122112.1723130-7-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC9:EE_|DM4PR12MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 885ce92f-da9e-42e1-5a57-08df38dbdd52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|261021123027099003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0TVBxJbsLN/zDDxExUCJsq7ZO/rXtNj/ZeAi7fOMR6hsg1QUdmCtUw3aM3aK0r1B6QHFMhnt8tg2EwIknrS/gx3lvr/hUXuDF7BURs3tAYu0Zo0+JHfdIk9atXY7ae0HUTpCZT9vNG2U2jFZRH7m/ItjnXRLe+BNFEnsmdOwrR764TuZokG6hz93hTlI5/Rno8j1lHM3hP9CmmF6n4Y+bkkKC4zLlYIO6DLTCZw2wLaHvTE5LfnOrG3JlevMt+HFCYiBukTcXegB6ZXeoNuYqh8e5pF9yVE2Go38IBztIrGpT+C7o+okshPlAp/8GLhzOPlMBjvzGdCzFWn80/GuWexfDA+dBa4L7WAipHSa+WJuaHD2RbZPmYH7buASqKODGRua+JgtV541x0TPPHWZGxhcwvXk4lg+g2Hn+U22kpamJnF03sOjPJj2VG6/nQakBusR+JWfmL8m7+/5/cGZG9e0RIDYOsdArDt+sByqQXVYr/WPE0Se+A11NIYC2rbU2GGZLIW9u77VW4e1rw6Z0tZB6ZJ5t/PESPiCo8ApIG1hmZHaQKSDM4Z0edhHDMzJOonBU95yZ5MeMoKO5OHowa78WwAfqKmxY2oO1E5CBSpg0ziy3+2iDyGRCK4eTWp4wJDsLOad6G6aGJFzFWpmEWaqiZwCB4W4DDc87l//F9wSjLaQj215sGNUDLPbPa/XbQOtU1rusXt6xE7ap+THqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(261021123027099003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gZnwTwbPWJksg63QRaSwxrSU3Zk1gLej264wmWfTb4Z4wbGzlSO2BBiuig8+7vfZfVksX5+kPHHbvDnq/36caZ3DJEt/hiRt0fXr71jUL2CtpkWs4970P6+T6dwxWLv0iUjThNOkheX4MQaWDxOl8Dc/cnr+neIBiocOqEmi+JxGEWg2/ilCYYgjoVcqxERoFbmw+t1BdUSdpq2AwDOEc93VmjOJKkYhm9HWP1L64kXm2SkhHSxomcbLh94bkld2SbQFql8+bCUyUm6OVgWyE8EfnRlmD9twg3oqwFXgofJKcJf57VHjzO4sTEttDdx6xXoKqJAmKRqZ+B6wUoP78R4QQ+CIY0aZ9mm20U+wmRXsUiSJgj7304DoXcJqFxvRIhlsKxq3cxDDuJTwbmAPhMlWFC183Ivxe7yzgiqcWnoGTvZDH5i3kIoGYwFlnQdp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:21:47.1620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 885ce92f-da9e-42e1-5a57-08df38dbdd52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BC9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_122159_789220_16AB807C 
X-CRM114-Status: GOOD (  12.53  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace Salih Erim with myself as a maintainer of the Versal SysMon
driver.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ecc22d1149d1..e3aca3bee13a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30023,8 +30023,8 @@ F:	drivers/edac/versalnet_edac.c
 F:	include/linux/cdx/edac_cdx_pcol.h
 
 XILINX VERSAL SYSMON DRIVER
-M:	Salih Erim <salih.erim@amd.com>
 M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
+M:	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/xlnx,versal-sysmon.yaml
-- 
2.34.1


