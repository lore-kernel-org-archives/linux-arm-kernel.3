Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA0BC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ciZo3Rb0oHyr7k3Catpk4nU+ODKWlZkt8ewyJGvtWtc=; b=mio4aa/eu1MsfE
	5oVvUNxAKVmBgcfUNtyhqmKQPzj8N3AONFsHUaWSqpJzMvJj1CBH0n/MaJTlW7/xwDm7dBAi783eK
	1K/0gy/sfcRRUoy8QzLQdUe1EBvhkiGcjYrXUJFdI/rXxzTHiOeqsJslwdTwxoovJTpy4ZY1yi2Yq
	UpA7JKGx7lvb40/RpSWtBLRi9CWxnwCT0vhUQ+qApsuHakzpKTa1ree4ErhRvbHZIwTfyC3WAOpcA
	ffvDnn3ddxk4J6qV6mSh+cK9lpjMUBA7z3hBSGYfAtUdwCeTI42O1PyVDFPzQNLcXDimHbYZKBKvs
	R1nhIxPvq883w7a1mCjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRRe-00000008BTC-3CS0;
	Wed, 09 Jul 2025 09:50:31 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPRd-00000007qKu-0zuM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:42:22 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 9D036A0AD0;
	Wed,  9 Jul 2025 09:42:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=ciZo3Rb0oHyr7k3Catpk4nU+ODKWlZkt8ewyJGvtWtc=; b=
	nLbkwTcbD1dBeWZQSCAsQLrXaW/WfQ22k085LHblLIv9OlgH9S4zCKaTVGpM98pm
	HVjE+bW9gi1SYFUn8hl0gfV+WDHXnIGQW/Tk2cN8IZmc9MtNATST0hjxxSG4NKc6
	3nQfMTJSGQWieF14yiyBGtXAUH5KsCgK59YA+pf6fHaZRCkxAAVsmcwjUGtKzmOq
	7Jorqna+whWh0rOpQErvwakX3p0CSLcBLdHdIstxDYZDpZu6m93REEEkfPHWtvDQ
	7T8OnoNBBNR0Tx7pZ1uZc/LcsZ//tT6vvTtmHgBU5ix1wNhyg2XeBcv4KdKsE0Ki
	sjOLFyLLoUuQBGXDb2Giv1RZgNLa8FswqVyRVWg9Rs0nR7UDRZ2UUjfZrG+seYjs
	yCdSlcxeF6L6qNTxHWq6Ve8+Tx7ndLCZJKjTIR/E698Qxx+/zIHON0DXS08diruh
	uVKH6LATakEYoogBtsCk9+kIRWFnOY5IbB0spaQAXKJoJrHfmEy5sZKMJAOBh9HC
	0gn0GBmxTpcLRtV6zlsmKC6e9YaTJkRdepjolBVnGtK3Xdd2zq1mE3HjUDy1tlxs
	WncmWVbOxGsL0RplFRbV0TpfKnYD3ZcnzvkGMQjh2u6YH98mkWzuG9hYD2dTjCIt
	KA6i1IdwMPr/gcrGVrbT0G9FLmMWWJ3/58F70sm1/6c=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Subject: [PATCH v3 0/2] Replace verbatim license text with a
 `SPDX-License-Identifier`.
Date: Wed, 9 Jul 2025 09:42:00 +0200
Message-ID: <20250709-sr-som-dts-lic-v3-0-51fcbd61aef1@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEgdbmgC/3WNwQ6CMBAFf4X07JpShIIn/8N4aMtimwAlXSQaw
 r/bciIxHid582ZlhMEhsWu2soCLI+fHCMUpY8aq8Yng2shMcFFyyQVQAPIDtDNB7wzovOqMrHh
 ptGBRmgJ27r0f3h+RtSIEHdRobLoZFM0Y0tA6mn347OElT/O/jSWHHATWZX3BytSFvE3B92o82
 xdLjUUc9eJHF1HnRVOaRktZtc1R37btCzFkmR4EAQAA
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1752046939;VERSION=7994;MC=3508746739;ID=98588;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2998FD515E657160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_004221_446272_3A920F48 
X-CRM114-Status: UNSURE (   5.60  )
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

Fix up Device Tree files by replacing the license text in comment blocks
by a `SPDX-License-Identifier`.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
Changes in v3:
- Also patch imx6q-h100.dts
- Link to v2: https://lore.kernel.org/r/20250703-sr-som-dts-lic-v2-1-0395c9b776d9@prolan.hu

Changes in v2:
- Fix message tags
- Also patch solidsense files
- Link to v1: https://lore.kernel.org/r/20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu

---
Bence Csókás (2):
      ARM: dts: imx6-sr-som: Replace license text comment with SPDX identifier
      ARM: dts: imx6q-h100: Replace license text comment with SPDX identifier

 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts           | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts     | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi  | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi   | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi      | 38 +---------------------
 7 files changed, 7 insertions(+), 259 deletions(-)
---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250702-sr-som-dts-lic-b16fc7605cb2

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



