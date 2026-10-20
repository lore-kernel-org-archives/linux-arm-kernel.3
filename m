Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5034606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sXdTApKa;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=kUsG+/9P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCZMgDNHJnyVkTmzhS00C7Ww+TVIIt4Gb4tn9ijL2aY=; b=sXdTApKac1StITy5OC3gkiChiY
	6rxkd+DxxEnaIXVDCfk1Ji1pzQn3vDtX6d23YO4DQPMJC+z0hZgWcmGX7lyY2/GX7QYWIZ2Vjv787
	d8N9M499zvfhERoQkz3q0Tox1wCsDytoYECVaX9IaF0O3OYnOSXwkrrZETkRmMvTp3NzAaI7j8ZX6
	uiq8BzDXQRqeX5L1/cP1os0qPiIk+LUn9nx4pfYDD6E+p5I0XVNPufxjGYFWdXR8DePJworF5yM/I
	fI7CeBDtE410IjLMUIPgasp/VXIpTUwts3F1MX1502CqBk5uuE3O84KOLaRGaJcdUNk9MUJdeVAB1
	tLJ865MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Sv-00000009MdW-3gpK;
	Tue, 20 Oct 2026 09:49:05 +0000
Received: from mail-swedencentralazon11013003.outbound.protection.outlook.com ([52.101.83.3] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Ss-00000009Mca-1dCd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:49:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2qoT0ldPPtTW4+8q1yiyvZMI1+Ktmy2v7MUhs2i0b2Q5+gCouyhVd3HGKXk/VgMeDmGbT0CAHodQDJkjtMw60WPEnT1tiZPduWs+5sOz0L76CL7iJxQZaC+FczNYnApD/oGRUtj35yN3JjoZeeaKMlBuT/2UM77wDNFTivXGT11nfGxggBDXQ5EHbxw4NpjDMwYKh54bk5hL57JwR13JBlD6t3iWxJXrGoFQwdp10kwgWrU0dYSEbaPwGcgaNYODGemvlqfKEs90q051uNSZ27rXj5SCA3h8dBXGSvivdCXd3r454hZkWYx7s3wZrS/FY66B+7FcHNcf3IotV/w7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCZMgDNHJnyVkTmzhS00C7Ww+TVIIt4Gb4tn9ijL2aY=;
 b=MOtkNFpsbRSZMtstOiv3oZCQQswLHYhWAUHwe24Z0aIJYUtuUtRA0B8V3r31TWWWZbFzvYyWB8tve2VMOyJ2QWFeqIyhdJbtEad9gql9jEK97q/j9ij5+1Qq/st/zfna1KmYlr86JLpBxdxXrN+W7LJ6IpESfUQEigoxdtfXuRuFwssjHfK9U1TW0JEbhTdd8HTaRheCjSm5tVxLbUir3noCWsi2U8yU/b/aURjo3MhPJhfYpZ0CDQzVgquog+61aMyc8ybeB0/zrfWS7QSxJEp+4CvkKrSJKwaIgMKMAam+gXdJ+hIUw/v/Ga5Pzz5Br5km1qVfYsrw+0MESufuYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=redhat.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCZMgDNHJnyVkTmzhS00C7Ww+TVIIt4Gb4tn9ijL2aY=;
 b=kUsG+/9PhYSPAph27uRpGogzgQez7b6JHKjrtYnT178g13Y0/nIlLnildQPzcd/jrwdRT9fc3QpESER3CLHYrvCBlrfI214hB0WIjZ4fCelPvDC5PTStFgZpES8Wj+iK1+W00w91C0PZ3miCEFiTwK3lh9x7pnVcyR4KN4NXNck4rgLFvr3UrANZEALv3+vYoXiz9JHugW+kXc9ziWBErxn5WyieKxUlfbEQuZwibiiC2jQXQnzqE+MbjZndiF8K4TykVYS/v4B+1Qg037VBjXPJstuOuUx/Ndb3vRwxJBhV8R4U6dwTGVuhNAZp/YaezstIjqpz5DYli2N22v2vIQ==
Received: from MR1P264CA0152.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:54::14)
 by PR3PR10MB4064.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:48:56 +0000
Received: from AM7PEPF00000051.EURPRD83.prod.outlook.com
 (2603:10a6:501:54:cafe::a8) by MR1P264CA0152.outlook.office365.com
 (2603:10a6:501:54::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 20
 Oct 2026 09:48:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM7PEPF00000051.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Tue, 20 Oct 2026 09:48:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:49:26 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:48:55 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 20 Oct 2026 11:48:53 +0200
Subject: [PATCH 1/3] clk: stm32mp1: add i2s_ckin as a clock source of PLL4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-ups_mp15_clk_update-v1-1-67da20111b08@foss.st.com>
References: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
In-Reply-To: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792489734; l=995;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=HWVjWVAmDMqPHrrh9MywQx6QVwXoaZX6I/UMJc3VcRg=;
 b=pZhqxsSzzT/v3MWGIAf4CCEOg+UvqqR0OgifmXtFb8ksgI3th73S7h/FdYPBxzt8ZzOBrq/Tq
 zU3JcVYjfusDr028nvsrmGZvl4+zMFq6qjK3fED/FIzyYf5eMwTyLkz
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000051:EE_|PR3PR10MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: 9656cbb7-6b9c-4642-83eb-08df2e8f5bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|261009223027099003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: cYSpV6y2sskDn5cSd1SwzCfnPDAM+SBuDuUcGM9EpoJDvqx6Mmab1/G9/9q1w1+wN9Yp+BsLi+iuWbBWziYcf2/dNF0/DBLWzCpleEiCfdVgPHqGF92btoVTDC2ZSkZ5jKodDt4639wpqE/6j4w2D/V6reNGVdhvv14+Kjel72Ek+AmPrqEkXJeYvcKxKqqzlJ/6mL08kf2gmYic+Etzw1DxVK0fT/kmY3+iFXk1iNkgUivlrWOr4vnM9gfhbR/UEhV+kOHKHHmLUa4AsSd8atw4bR/ua0lfC8vpjPvfMn7DnbWDm9HLOcSwRlIIhJF/ksSj0jBudik4RrqexKjiaDgZXFtMpf/wZ96rmtaZk7h6HjPGGsvSLlXqzGhaNfA63JKYwbI9vIjYwt070Jf08kRgjm7XnSH5DR4HTPbJuLmz6kDT5lHDRayYCEV8H9s230qUOYktUmrtochYHPwhCcLwjhLfocQtq9xPF5CccHrPMdBUrG73EXs2UGIXstUQmxvJO25EyNxSAhxPjVc0QgZh0ACmUEcfb++NBuA8oMkVthKIAEM87SoegB6KnM053OBKBgjecfYGo4pJXW9BfvzC5JR0F04A4pEKXEi5pJKEGFIjUxTeRCMiq5aDaAummEZ97lHGim7Kqk2t/S12fVe5h+jR6BGNl+ypudea33FQjwid9JwFx+7G3nDMoA8/TxVCcN6RaL0L9/kL6HQZBA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3bUY30cazKuoY0cQ7sfS9q0HWDGETGvzuWTTgNJoUvz6Y/DEBjovg5IHHTdRfHLr4j2cRGOf1xSsUt5ddWEHA4vcdVtPsbrDQaeFlg4csRd7MQpyu9bzdTkzi8Wc4z0q3/2hGVKfrHF7U2RcRVhHc5uIMjs29FZBwnv6hL0TlRW45ZJkMs9DqLcrZ6RSnmNA802vm7eMX5Ajydnxr6I6QydNjAag30q6OH8UdE8FnNxa6OFFgRVCVZyDaHkGy34OkAJf5YUCG5wTs37LntRoiw3Vsu5LYC6HmqPDgrRFEjlZs1oMP6AHXtcaJjd+e+iJUIKp4UvPb0Rh6QNVx/8kCz92gZQU5wirgRzKKML49P4FGAoIFIuXAy+6p6HVdK8HDdIVtFQPAYEqqu3ODx6SG/pT0SAIfhCSUeoJTG+IyhGOXWYIwRI0DuYeIg8Pb2Bt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:48:56.3649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9656cbb7-6b9c-4642-83eb-08df2e8f5bc0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7PEPF00000051.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_024902_668861_00650123 
X-CRM114-Status: GOOD (  10.99  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PLL4SRC field of RCC_RCK4SELR selects the PLL4 reference clock
among HSI, HSE, CSI and I2S_CKIN. The driver only lists the first three
as parents of PLL4.

Add "i2s_ckin" to the PLL4 parents. This clock name is already used as
a parent by other clocks of this driver (I2S/SAI/SPDIF kernel clocks)
and is expected to be provided by the board device tree.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 2d9ccd96ec98..8f7bb2c31809 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -120,7 +120,7 @@ static const char * const ref3_parents[] = {
 };
 
 static const char * const ref4_parents[] = {
-	"ck_hsi", "ck_hse", "ck_csi"
+	"ck_hsi", "ck_hse", "ck_csi", "i2s_ckin"
 };
 
 static const char * const cpu_src[] = {

-- 
2.43.0


