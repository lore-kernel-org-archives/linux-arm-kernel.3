Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFA9C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tCA3MpugcvamtC2m19lgcfPbZXndx2JkhzDnbI/5+s=; b=H5ygyKFyQa2RNEJXgynQc50i4M
	55l5X7WwxOJ3pZemuXUhXnzJlN37ZVKe5EDaJa/IfLgS4NF7WGaZ0RKjQAtkR/aHjUHr09OK83Fmi
	uAFFNNrJf69VxE4XNKB2LHeyrIISwr1RZJqLXbfERxLt8uUCvE6Yb80GjknvPYnWP+xq4B/N5FP+A
	nST/yb1eeZSMFhH8CAoydMPisBbP9Ac7uUKVOCDh3lwmIh/2uVq3AQxmtiShxbH84Z9LY+P6EDF45
	UYD21NZr0aEEAb488lOdZKAi8dfE/7LP+6BhMsGneSgYWDCOhtrugxK5GIkgYw8IY3a+Ma5A5iPyy
	5BzKg49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dIW-0000000ABj6-19co;
	Thu, 24 Sep 2026 06:51:12 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dIB-0000000ABdj-2ghO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5tCA3MpugcvamtC2m19lgcfPbZXndx2JkhzDnbI/5+s=; b=WXFLPzEMsM7F53cl819dPWHDlR
	C1E4XVN5ZoCDHHYoTAnn4ZnUsXGOFbOGBSHXTAeHCYaF6tsqV1fDpdwZk/PkANrVGAQDAdsR+fAEa
	HEMFApMD55iF4Nl40tievej1PPlAXGIpoTGzZvsgbCu9KRYjO1V132qZZ8fyYaElD58/CmhM3RfTP
	pv3dmpF9e4MrC8ymW8BJfMeXPPjMgh9ji/2Pfnl0ZGwNXjP7EcU1zCP5pCG5ZX+l7TlVGHKOnyaKc
	zuEIQzwqRIDgF1Mo5Izq+NtaoOcDl/65haqFhVPt0Jl6F0eVKE0G2j2T3sisoPkRUqfrScDurDPDb
	pq8cwgjA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:54176 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9dI7-0000000AyGs-3EKx;
	Thu, 24 Sep 2026 08:50:48 +0200
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
Subject: [PATCH v2 2/4] mfd: da9061: Make register CONFIG_I writable
Date: Thu, 24 Sep 2026 08:50:42 +0200
Message-Id: <20260924065044.368341-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924065044.368341-1-primoz.fiser@norik.com>
References: <20260924065044.368341-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20260923_235052_241570_AF76519E 
X-CRM114-Status: UNSURE (   7.42  )
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

From: Andrej Picej <andrej.picej@norik.com>

Make the config register CONFIG_I writable to change the watchdog mode.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- capitalize subject description

 drivers/mfd/da9062-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index 32dd24483ee0..c987e533824d 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -427,7 +427,7 @@ static const struct regmap_range da9061_aa_writeable_ranges[] = {
 	regmap_reg_range(DA9062AA_VBUCK1_B, DA9062AA_VBUCK4_B),
 	regmap_reg_range(DA9062AA_VBUCK3_B, DA9062AA_VBUCK3_B),
 	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
-	regmap_reg_range(DA9062AA_CONFIG_J, DA9062AA_CONFIG_J),
+	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_J),
 	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
 };
 
-- 
2.34.1


