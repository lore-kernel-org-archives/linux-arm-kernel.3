Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AF2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2zJoI4zUhnQFWnhkAmCA/G6I5XpawwTFf8gjoo1QOYE=; b=bIiJa0XwueU+OH
	mugpw1FUjAL9ULsxKs1656on2O1ctI0rnMq9vl60mS935fS2QcqWlnbdBecn4qvSxtJxdFXIxbl4X
	hy97LTX+kMshcOjPi9f5U/gc2vP4X+flfNHzlc9lIvSlewB5kDwbxbpUVFuPjlbHSOp8DfNMieVZd
	aL50zlJ5YtZGj6tBaVWnFQCW6hzA3iCcfpBiwKdngSWf0wEbuPmTmab4W/JymtPp3/cKWUz0VIW2f
	fyC/7v6/6v0FNVf9eh8gsoae46SsO5655iDuRkUmzY/vl+VpKHItODYOWv5IGXEe4aZ6DuvI9ak9r
	Gm/crtMlVduSRsvaaMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thS0h-0000000HDyW-0pzK;
	Mon, 10 Feb 2025 11:31:31 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRg9-0000000HA2E-0NzJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:10:19 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 14CD1A0748;
	Mon, 10 Feb 2025 12:10:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=2zJoI4zUhnQFWnhkAmCA/G6I5XpawwTFf8gjoo1QOYE=; b=
	QI/aT7t/diqN7H9jybwNT2W3yN4oxmBwNbPh3vYnTLj2R4D0FHQx7ZOM3MfV6/Um
	j6YP8qzSxoahWnlYZjXhj+h8e8ksVUcMNA1d5Lt3l2L59YvtI7jkw6wn263c7rsx
	pxLtzpY4cXg/tHXgVPJf1O3+vlMDrnqHgssw6R9yArCCs4tZ1b4mIt+9AFujgxuZ
	/Aq9fbv4Jt62FS4SLsAjhOv9pKkdVx0lcBF3kh4GthEmt42T1FcrNoKRIbKUdvjn
	Ikm8yGUNAOCwuBlYIHPeWeXwPBRmy5e6Uu+lM3jNUpT5RUlk0mMXpLspSPXvsqKN
	c91NjQpWs/qfGMedAkszrLOcDIikTJFSUa5neFsaE4PzPMx8cvWhHxptbvVQdlTW
	RAaT764DEC6mvLy/d7rocaJXC85bq358RxQq75GiRKAggoxka0ZVK9+qxevEd+sA
	wyPSII0IWnYl7RRe7JJz4P6HUJg5zN6QJaRzFBuTe1VzE5PaW4W7DPfd0bIoJm/g
	9dw67GwjmHmOMNAMs3GK+Q+FB9ZVPtl4VAga4DbKpDcZS6pFcgBb+Qlwg8B1/D36
	qCGs8Ma0sAWAiDEMdtKHTQcIYNybvtlwhgLTIFJ2xo6Ak4u4K/7Z14Rqp7rRJ89b
	x86IZF7S2iFUyug1ZreAZYfr3gusurix7bsUCBM+NMM=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH for-6.14 v4 0/2] Add more devm_ functions to fix PM imbalance in spi/atmel-quadspi.c
Date: Mon, 10 Feb 2025 12:10:05 +0100
Message-ID: <20250210111008.248929-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1739185812;VERSION=7985;MC=1898231991;ID=637647;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD9485261776A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_031017_599853_3DDC530A 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: Len Brown <len.brown@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Dahl <ada@thorsis.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Pavel Machek <pavel@ucw.cz>, Danilo Krummrich <dakr@kernel.org>
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

Links to previous versions:
pre-series:
https://lore.kernel.org/linux-kernel/20250114222851.1023194-1-csokas.bence@prolan.hu/
v1:
https://lore.kernel.org/linux-kernel/20250115160244.1102881-1-csokas.bence@prolan.hu/
v2:
https://lore.kernel.org/linux-kernel/20250124085221.766303-8-csokas.bence@prolan.hu/
v3:
https://lore.kernel.org/linux-kernel/20250207124802.165408-1-csokas.bence@prolan.hu/

Bence Csókás (2):
  pm: runtime: Add new devm functions
  spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API

 drivers/base/power/runtime.c | 36 ++++++++++++++++++++++++++++++++++++
 drivers/spi/atmel-quadspi.c  | 18 +++++-------------
 include/linux/pm_runtime.h   |  4 ++++
 3 files changed, 45 insertions(+), 13 deletions(-)


base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
-- 
2.48.1



