Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296ACC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MLKLWQghRFfoCawFKRGWPxJXg92KIL/1MA9aUdW+dqQ=; b=i3CjpkzLccAeiUGn2zZifmg5Ae
	b+14fbeW9hLe/AHcH6R9uCtu1lwt5cnwYEC3Ca+BCZXMj0qaLyG2/PyDzuVsyIdZacM9FBLxWWBrP
	7gwXlnH92I3HP/FEVEXgyH9jlWGe29zHeFnrQfcAaFyYA61TAk02oOs/HsdAaqe085uWIR1oT+h7n
	3OCQj5vZkf8dTDM2bLJy7WJw8J8xqz5Was5Gu42xb4v2un2h05Wb0jO/LmnDAY7nnKpHMTsuT93T5
	nVbngGLYKRvzFDxSBBK81Q957igJ30b/NidN1mqHrYQ6c4d5qcQu0EOmtHP3xGviXbFyfS13g+0PX
	cwSk3iDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtlz-0000000BxTr-2hn8;
	Thu, 27 Mar 2025 20:24:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtOP-0000000BudV-2qmq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Mar 2025 19:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MLKLWQghRFfoCawFKRGWPxJXg92KIL/1MA9aUdW+dqQ=; b=EC6049pMOdH1FxkYX+W6zthMO+
	npqmiM9ebNBsRX2i50kxlIw0/rqTUYFDOVIPCUb+i8RJxQHwP61Q23PNdHAI7oH+CX3J6tUxqyhJ8
	VgxRthHGyPz5wOxWNxJzdnsdNwVjfWVxcIh95f134MlOUjA4qbmqU0M+nqzdMRGhJulg9fxB057J2
	egFpGahKn7s7Vho4XGzZ21X5wNk6WCKYbYxz6TJj9QuyjjNmRfbN0W9g/qOy6wKYl95cI8ZyKeI0a
	Uy+YRkAImUvt8nK/F7a9o1e6gq+s4Jji0NM2ShwFpb6u7gl1p2bYzJiFW38pesOzjAbLY91cfYJ5Y
	BYI2OgBQ==;
Received: from fw2.prolan.hu ([193.68.50.107])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtOM-000000061si-1aJK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:59:56 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A84D7A06AB;
	Thu, 27 Mar 2025 20:59:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=MLKLWQghRFfoCawFKRGWPxJXg92KIL/1MA9aUdW+dqQ=; b=
	VwB2A6eC6Aa9C1iipDu3RgNMnNOfZ0DpKu3n0j8q1KxLIBiTlbCcknGQK5o95Zlk
	itfUhB5F7B0gbJH8nhea4cWdJieeY81OH+UrTkb1YYYfm279pfgzz29de6/neuuF
	pL+BIr80ZCcwPqPIHNqU3r90H5Xa58WYz/V6Dvy41ktCTdfRvKwkWAxzkvjLOgVM
	EbNlGbYHgcIGQhQVo8i+08997sV8Nt8IXE4AcU855itsXTeV7mlYm5tcNCK63BxK
	T0ORrdpcK1jxd1vdfIS2UEaYrBV3mgBFQ1ejfw0QWBbT4UOLzPbffj3JZ1PqVnHo
	IdWDMsIQRvoglZNwMnHWUDz6n8jQm4Mk0jPcfzWRFoSmf3ZEBeSB0tVCLP7JQdby
	tNdyvnOtI8uDeyJ7Wx3eoYfEXL8C6CCQh5K4YNxGZO3WIh2C/kZED9vtO3jpQPf5
	d+gIGu+17HLaQ4vR59wAuV7HtVmTtQmYEWKMP50IFBLfgGzyF1Oqus8WMGpv3+LQ
	Sv4HlmISSznJuNHT5momCbm2J2g8TR4aos2H/sycet84VYUVG1MZnFegxY7jvVYJ
	iK4ZLTph8xLsSnmwDLRs3DKetyNNhDgyspJtyw0z+C/GHq1Is0dcajUFa/Go1RqG
	h0wJOJM64uL8bpvVw3ytZBxC5PGeCgbANpsWglkqWcY=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Alexander Dahl <ada@thorsis.com>,
	"Nicolas Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v6 0/2] Add more devm_ functions to fix PM imbalance in spi/atmel-quadspi.c
Date: Thu, 27 Mar 2025 20:59:25 +0100
Message-ID: <20250327195928.680771-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1743105582;VERSION=7987;MC=2827852488;ID=112013;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526C776A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_195954_766896_2BAC36F4 
X-CRM114-Status: UNSURE (   9.78  )
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

The probe() function of the atmel-quadspi driver got quite convoluted,
especially since the addition of SAMA7G5 support, that was forward-ported
from an older vendor kernel. During the port, a bug was introduced, where
the PM get() and put() calls were imbalanced. To alleivate this - and
similar problems in the future - an effort was made to migrate as many
functions as possible, to their devm_ managed counterparts. The few
functions, which did not yet have a devm_ variant, are added in patch 1 of
this series. Patch 2 then uses these APIs to fix the probe() function.

Change in v4:
* the DMA cleanup was split out and will be submitted separately for 6.15

Change in v5:
* rebased to linux-pm/linux-next, will now target 6.15

Change in v6:
* add `devm_pm_runtime_set_active_enabled()`, which is safer

Links to previous versions:
pre-series:
https://lore.kernel.org/linux-kernel/20250114222851.1023194-1-csokas.bence@prolan.hu/
v1:
https://lore.kernel.org/linux-kernel/20250115160244.1102881-1-csokas.bence@prolan.hu/
v2:
https://lore.kernel.org/linux-kernel/20250124085221.766303-8-csokas.bence@prolan.hu/
v3:
https://lore.kernel.org/linux-kernel/20250207124802.165408-1-csokas.bence@prolan.hu/
v4:
https://lore.kernel.org/linux-kernel/20250210111008.248929-1-csokas.bence@prolan.hu/
v5:
https://lore.kernel.org/linux-kernel/20250317093445.361821-1-csokas.bence@prolan.hu

Bence Csókás (2):
  pm: runtime: Add new devm functions
  spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API

 drivers/base/power/runtime.c | 44 ++++++++++++++++++++++++++++++++++++
 drivers/spi/atmel-quadspi.c  | 17 ++++----------
 include/linux/pm_runtime.h   |  4 ++++
 3 files changed, 52 insertions(+), 13 deletions(-)


base-commit: 8f61ea3ebb4de9a4cacff995b6885e91450cb094
-- 
2.49.0



