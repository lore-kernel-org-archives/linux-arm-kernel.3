Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C83C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5GafJInzCxSKAs8c0cbw0fkwBktF/xfipIyW3WRpGk=; b=C1fRJuH7POUhBqvKQQxjkP7iBx
	yCk//LcRMKRV57Z4DtWJlIfPj+26jth+WlqPKC9i4yY90eB6uJIyMUry12h+DySfy2Rh3rx1NxHHj
	gfscfkw4FTdKQ2R9JG+DsrVDZlRvfs3rgI0bESyBEmu+SxHoj8NXwoGwqKZ++4IQ2Im/Ewly/Wu67
	tV1uuDVu0U8XfPxo6SwLo0l6PY7PRUxpFPUhWK2T1xg0fENhWx4CcApiU1J8HZPSFD8h5qdc3JtU8
	8WjSg7ts6dP6KC6Umi/rPdIWCs3X4VbtwZ+nkhdmiG/KQkOGDv1+KkYzrSQ44H4LmrKTwtmphaXD8
	QIQBny6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kzo-000000082XT-0lfM;
	Wed, 23 Sep 2026 11:18:40 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KzH-0000000826B-0a2x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d5GafJInzCxSKAs8c0cbw0fkwBktF/xfipIyW3WRpGk=; b=YyhdqltdMFtyhNWscwGLThMi+E
	DXpWC4kHT426yGW/xZUv6+0S1odwTvabi188xHDgxVMHSLwKKJbDFGG/ANm9vEs1Scd96NmS3/X3O
	5Wa/VHIWxMgbhCEuSCcCzXmRKOwZIUmhT3IdtYR8WrX3bdiJwWqv4nyoebP4peQ1FsU/CsL72mJFn
	7oTX0HMCKV6FakhuoNjY8eC8vx71/xmV2QukX9ii1sOD21b29vKB4XwjNrd4Nm1ZDuRK33pIEgyR0
	57FlfbHGEfVduoCuSOaPq9jBhfTmEw6UcS+or4OniHkNnBRZrT9DuJVN0ZuSxOVHlKMiIl+vwXXGc
	YBwbVn0w==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:43182 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9KyZ-0000000A1qw-1fXk;
	Wed, 23 Sep 2026 13:17:21 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de,
	andrej.picej@norik.com
Subject: [PATCH 1/4] mfd: da9062: make register CONFIG_I writable
Date: Wed, 23 Sep 2026 13:17:16 +0200
Message-Id: <20260923111719.2032012-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923111719.2032012-1-primoz.fiser@norik.com>
References: <20260923111719.2032012-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_041808_421135_8FB608DA 
X-CRM114-Status: UNSURE (   7.41  )
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

From: Stefan Christ <s.christ@phytec.de>

Make the config register CONFIG_I writable to change the watchdog mode.

Signed-off-by: Stefan Christ <s.christ@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/mfd/da9062-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index ad198183aff7..32dd24483ee0 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -531,7 +531,7 @@ static const struct regmap_range da9062_aa_writeable_ranges[] = {
 	regmap_reg_range(DA9062AA_VBUCK3_B, DA9062AA_VBUCK3_B),
 	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
 	regmap_reg_range(DA9062AA_BBAT_CONT, DA9062AA_BBAT_CONT),
-	regmap_reg_range(DA9062AA_CONFIG_J, DA9062AA_CONFIG_J),
+	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_J),
 	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
 };
 
-- 
2.34.1


