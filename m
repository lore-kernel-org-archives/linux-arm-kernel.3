Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFE2CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 04:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eTPWIiTslPj4qNBIVZ/pEXGUtVBPB+85nL0yN0f4T2Q=; b=uKaSuq+myW4TNPnVBwpNNQRe+b
	X7CJozDsxi/oFkB/TToGlz8xX5o7ip2etiAaR+2RJ0pFZjxigMqod5vgfBUKckreQHEumrztGYmNl
	aTl8xozgZr4LFST0Za3ilZv9bJ2xGlp4lIYjuZRClmzoIy1RY55GE00XJhfWbRjyjD2W8LrzKowF3
	hr1QoDrgKyDCN0xrkwWrWN0WfACgDLqMnAcYp9nzihz1kD0ynXIrp9kZ+kOGLJ8smz6c1+bBPqymF
	8aWf67cYjYsdeQsUjnFOwu5tUThnQ6tpQ6FoOSMe6uRFtSIeWuxnIC3Vz5Yf6JeQ/MsjaxM4QO4ZI
	KdSXdTvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoaOV-0000000CLJb-3jFH;
	Wed, 20 Aug 2025 04:25:51 +0000
Received: from mo-csw1802.securemx.jp ([210.130.202.152] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoaLt-0000000CL81-1JUl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 04:23:11 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:Cc:
	Subject:Date:Message-Id;i=nobuhiro.iwamatsu.x90@mail.toshiba;s=key1.smx;t=
	1755663782;x=1756873382;bh=1sLVmJEVELm+3EaQx5S5Fb5yqH/hy5nMB0COk6qZdDw=;b=Sqk
	71vEahlIjYAB6jJU5K3fqbBg04X8dM6fUUDTP8Z5/VeP1PJZj2sE91UgTdiX+szGZTCl+/MzTG9+U
	Q71klbwyazhPx5Wm3d+xka7xt1WeEC5fvSLN/pY/pHi60aWl67BcIjQ4vrMTQiuT9T6T7NUbFCLAl
	dQQ6AtwgeNadcluUj+YNNZSeBTdXJ2dSSZcjG9KeCfl6m+aLkuSaXnFoeNKlASr8Rh7yvByFAZNnd
	j82fOw26SyrKfNMph6f0RkTqc+vLsSwEZrvoFGxEc4W4XC34sRxtFNWmvqDph8ReZYsRSeaWKrbXN
	gJlRrdgoiMwNKH47Wizlfmvz08ggS1A==;
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 57K4N2KP2103061; Wed, 20 Aug 2025 13:23:02 +0900
X-Iguazu-Qid: 2yAbaKzOl4H8PZRSai
X-Iguazu-QSIG: v=2; s=0; t=1755663781; q=2yAbaKzOl4H8PZRSai; m=AQ2Y70863fIkF40ki8y3XRx/yrNIO1xMVjEI7bcmleU=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1800) id 57K4Mx7T1451794
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 13:23:00 +0900
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [PATCH] MAINTAINERS: Update Nobuhiro Iwamatsu's email address
Date: Wed, 20 Aug 2025 13:22:47 +0900
X-TSB-HOP2: ON
Message-Id: <1755663767-1612-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_212309_806365_DB10603C 
X-CRM114-Status: UNSURE (   9.36  )
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
+Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba> <nobuhiro 1.iwamatsu@toshiba.co.jp>
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



