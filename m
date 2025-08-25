Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E35CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 02:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VZRjjCAW03gO/0NOUIx/9eRKFPADuzyQ+cyx8I6jelE=; b=iib2UK5YMpGs267qLF1pVTylMx
	xpPHMxnwk+RSVw1KFnId2zArMj/uU4X04HViDV14BlIXJg20cHpFN5UJmQJU3UmVedyl+HpRjs8m3
	RILsqIR3PF/ZiddgoWsM5ZKHp+zBGMm+pSyGqTIESGMQFVGLunNUqkc4lMLJ3nCbgEd7nBD/C5Rqt
	YgBQk6/bKUw9uvJiH76ZagfRFHqnQ3jWvSDO7zeaULMZ1zvFi+zDd6YDvksop855UJEQ0xkoZbvdr
	d5RdWs4GotITeaIs09FHHv1GNJGBV462F5de4Fy9Z4WEff2Y3U37GbjBGCCCPSf7D95BF6YzcpC9F
	PDAWKWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqMf3-00000006jAi-23x7;
	Mon, 25 Aug 2025 02:10:17 +0000
Received: from mo-csw1802.securemx.jp ([210.130.202.152] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqMb9-00000006ixH-3qjg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 02:06:17 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:Cc:
	Subject:Date:Message-Id;i=nobuhiro.iwamatsu.x90@mail.toshiba;s=key1.smx;t=
	1756087567;x=1757297167;bh=z6qlv8kuwCIMObmOi1417vC0z1UI8429u9UiX5kj+UA=;b=qn6
	0oGs5StkPt3jP4IG4J0i9xXxNK0G8NjxDaRDZe4B/TZRU1QmGcITpMGw86RuP4i9SxsExkSAR8X0s
	pXy7OhhDncdib9ppguXrqmViW1nqS/6m2wgun52kOs8Ycq6OnyCQZSytCm600/qTp17jX62vMgqn2
	ir6WryviG7HPePW9CJM+M+dC7bQeTRX98gyDtDLaxcfUXnDNBuU8fcDwW4cJBHkTofUpsAK+18Pj+
	2/shKd1bxUEA74vseJTZyUac8zHeVhEw4DN2aoUvan9uqEwe4dCmiqpcJAMnnoAduZ1bxa5A7mCZp
	KHUd1EoikBSaTW2EQ6t/+2gZEHDFl5w==;
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 57P266eh109129; Mon, 25 Aug 2025 11:06:06 +0900
X-Iguazu-Qid: 2yAb5t3M3txZn3UtiZ
X-Iguazu-QSIG: v=2; s=0; t=1756087566; q=2yAb5t3M3txZn3UtiZ; m=9m84xjz33U/vViEszGDPSDB4VoIwlPs7yd4w8uiZTKE=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4c9Dfh5l6nzyPc; Mon, 25 Aug 2025 11:06:04 +0900 (JST)
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [PATCH v2] MAINTAINERS: Update Nobuhiro Iwamatsu's email address
Date: Mon, 25 Aug 2025 11:05:56 +0900
X-TSB-HOP2: ON
Message-Id: <1756087556-25424-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_190616_061260_881AA6FA 
X-CRM114-Status: UNSURE (   9.73  )
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

The company's email address has been changed, so update my email
address in MAINTAINERS and .mailmap files.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
---

v2:
  Remove extra space.

 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 4bb3a7f253b9b..328b04f82dac7 100644
--- a/.mailmap
+++ b/.mailmap
@@ -585,6 +585,7 @@ Nikolay Aleksandrov <razor@blackwall.org> <nikolay@redhat.com>
 Nikolay Aleksandrov <razor@blackwall.org> <nikolay@cumulusnetworks.com>
 Nikolay Aleksandrov <razor@blackwall.org> <nikolay@nvidia.com>
 Nikolay Aleksandrov <razor@blackwall.org> <nikolay@isovalent.com>
+Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba> <nobuhiro1.iwamatsu@toshiba.co.jp>
 Odelu Kukatla <quic_okukatla@quicinc.com> <okukatla@codeaurora.org>
 Oleksandr Natalenko <oleksandr@natalenko.name> <oleksandr@redhat.com>
 Oleksij Rempel <linux@rempel-privat.de> <bug-track@fisher-privat.net>
diff --git a/MAINTAINERS b/MAINTAINERS
index c0b444e5fd5ad..47d059d5878a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3431,7 +3431,7 @@ F:	Documentation/devicetree/bindings/arm/ti/nspire.yaml
 F:	arch/arm/boot/dts/nspire/
 
 ARM/TOSHIBA VISCONTI ARCHITECTURE
-M:	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git
-- 
2.50.0



