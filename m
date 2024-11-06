Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E691D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=okwVwo7asZ9u+tVOHleOHRoJjZ574ZQY9yfS63ntQdM=; b=KaBdqN91tV0BA5wvYzSpgJMePP
	JOOni0leyfi28Aw8BhsXM9cTX+pWtF40PNUpFsDn6JTrS9H/IztcQ+SM8colWgOYBq1/QAREQbuPF
	V9Uu4u9LirZ9zWSuWhroq43Xr/IYdOmUrfpuUJ2I5HHGhwEbA2YGeokzCbUMr7cvXkgQ9zA7q/yf8
	+nNmSA35OICw+32QF0MzUBvWuogHFWISArf9UK+QfDgbthO6oPaJj52HIkaaju5FHI1LIyqy4Oyct
	rYy7vOOZx9r6Tit+yc0EEPqvZiqyNS/pyVrjnRLT1vwMJNmHrQI4PovrnvWF76ZEBjgU5irTAGVsb
	kqBe853A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eRQ-00000002xzB-1bns;
	Wed, 06 Nov 2024 11:43:16 +0000
Received: from mail-40137.protonmail.ch ([185.70.40.137])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dZp-00000002noQ-0t7v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 10:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730890070; x=1731149270;
	bh=okwVwo7asZ9u+tVOHleOHRoJjZ574ZQY9yfS63ntQdM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=f03K9Ojm1YKTa2f7VqL7KWrRdp47xlYl0cBwVOYq6zyWRWu3LU3bZlKRsdIX4ROLa
	 noPNHsmSxxgp3PQrt7SbxWSPx3Zpavi/X+ubull6a1XpFSS2c6KMd1E2JOShfklsQo
	 uB1zNKPvFSNvNOo6TZvY6zePQdKaUqJBmNCoNPQmbTDqSOllCOu7AOPlT9r7xik+1T
	 4vn94zWTP3xFu9MQaebWHAu01QJjlGYHnYenPohpc1bilsrDrLZCPiUgIiQuHFa3Pw
	 dtHXbOgCFJAPv7cyUZj1YF/CUQBo93DVI1hi1vxgNG57oHz8UjKw1hQGAMDxtfPyTg
	 EQLfSZfN2JecQ==
Date: Wed, 06 Nov 2024 10:47:46 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] MediaTek MT6735 TOPRGU/WDT support
Message-ID: <20241106104738.195968-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 09934d38fc3ebae1fee80fc7dd599a9c054ee796
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_024753_506423_3CEDCC0B 
X-CRM114-Status: UNSURE (   7.24  )
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

These patches are part of a larger effort to support the MT6735 SoC family
in mainline Linux. More patches (unsent or sent and pending review or
revision) can be found here[1].

This series adds support for the top reset generation unit (TOPRGU) found
on the MediaTek MT6735 SoC. TOPRGU generates several reset signals and
provides watchdog timer functionality.

While doing so, a fix is made to the restart handler to make it work even
when the watchdog is disabled by default (never enabled by the bootloader).

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Changes since v1:
- Split restart handler fix and MT6735 support into separate patches.

Yassine Oudjana (2):
  watchdog: mediatek: Fix mtk_wdt_restart
  watchdog: mediatek: Add support for MT6735 TOPRGU/WDT

 drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

--=20
2.47.0



