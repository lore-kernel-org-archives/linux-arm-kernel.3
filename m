Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24209D6409A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 06:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h3fxm4z+c91KxsW+ogUYNJ2j99SHBt0o37+T4ZWfW3I=; b=WgS1YgTdCwTGDWQ0FELVIpTAfD
	KnR37uSIptQCenDdirDg2MJLUXFjHjneuxak0A8eQB+lvaQenf1v1ToxSTI3eL3ygZgcXWyeqn+tm
	DWmw5GfPwjQr4R8LCpyISmzRb/1+fiJ/hxJIk7RkBrOLCZgNzR2Uwgb5pjScyGvpdQcybd9oXQKv7
	28ffgNTP77TIXUtmssosSlM+NdB2YOLJY1KPMTD98rQt0wjNhwMWpQgo1ZqbtwSm8vCkFrYgNVWt6
	3q3xz8TvxCPxkgliGhdPFbS9LK6QtXufgrs5chsaVpVJgw/XIEDk4ukfrAo15xwf0UtyeE5XlAHcl
	jUueagWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9eau-0000000Cl8y-43tv;
	Sat, 09 Nov 2024 06:05:12 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139] helo=cmccmta1.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9eOD-0000000Ck9S-3wP6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 05:52:09 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee1672ef86fc8f-c75a1;
	Sat, 09 Nov 2024 13:51:57 +0800 (CST)
X-RM-TRANSID: 2ee1672ef86fc8f-c75a1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee2672ef874356-bc53f;
	Sat, 09 Nov 2024 13:51:57 +0800 (CST)
X-RM-TRANSID: 2ee2672ef874356-bc53f
From: guanjing <guanjing@cmss.chinamobile.com>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	guanjing <guanjing@cmss.chinamobile.com>
Subject: [PATCH v2] firewall: remove misplaced semicolon from stm32_firewall_get_firewall
Date: Sat,  9 Nov 2024 13:50:49 +0800
Message-Id: <20241109055049.269163-1-guanjing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_215206_559791_139FE3A9 
X-CRM114-Status: UNSURE (   9.29  )
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

Remove misplaced colon in stm32_firewall_get_firewall()
which results in a syntax error when the code is compiled
without CONFIG_STM32_FIREWALL.

Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
Signed-off-by: guanjing <guanjing@cmss.chinamobile.com>
---
 include/linux/bus/stm32_firewall_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
index 18e0a2fc3816..5178b72bc920 100644
--- a/include/linux/bus/stm32_firewall_device.h
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -115,7 +115,7 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
 #else /* CONFIG_STM32_FIREWALL */
 
 int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
-				unsigned int nb_firewall);
+				unsigned int nb_firewall)
 {
 	return -ENODEV;
 }
-- 
2.33.0




