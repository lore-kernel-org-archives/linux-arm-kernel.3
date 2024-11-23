Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACBFE6ADFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 12:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YbLZjplGEQIjdXszpZTw4vmkavVtRiLv7/HeUvS1y6Y=; b=0W+spOh8JpJjFJuIAz/6No55uA
	MkVTaPDhBa+yqv9d2YKd9Jey1vDteT31zuvJuHbNCbirglF4y8YakxgjKEomHALK0qzTJ2p1FzYH/
	87ii6dQU+rAmsygJ4HeLBfrPgIRKkIN5cZDar2kX8tjVm3GwTDoqWcX3QpAO5dWebjVN3Wf5E2HHx
	Ed7D5+NJ2xRKj1FvdhKHhkjXkIzJME1OX3MjAiGwuHtkooAZ6Vng1evP+RSbyeT6peUsnXBYjQ4Jz
	5xb7bE+1mD4n2e7nQUGstnqRk5/U/UD+gy0YuUVzzZb7EiJp0lmOpc7WaEiHLLI+wC13XlbzZy9Mb
	D9PQqvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEpTk-00000004KDa-2KIF;
	Sat, 23 Nov 2024 12:43:12 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEpSk-00000004K1g-2EBq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 12:42:12 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 33191A0302;
	Sat, 23 Nov 2024 13:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=YbLZjplGEQIjdXszpZTw4vmkavVtRiLv7/HeUvS1y6Y=; b=
	m7vYdD4CUbhmbR53UkvxOK/TK4UYu/0dzaiSpkTHsbSOn/w+C9+PB3bK+Rx4OugB
	vzKmBP8GsuGe3a/fwmnPnqU5CDbEJwrLZiy4jGZKUgu3KRnJMZa8Uk5+m9j2rIMZ
	CRHq4s20Sp2T/zJhH322B1h87P4DQDLPLea3beVq7nSmB8+sr0zQC7BuSIvh3GqQ
	LKfwa+Wr1jCj27c8gXcIpf2n3BpgFpyDFEAMvsfwSXFm9VzJLSnXBTzQc1r3MNAo
	YTIVenfri5KnvRymrIWYSqU9IdQrNnpRUt8frMbWl8UCFNhg9ef3lksrnNbWTYex
	+yiQAj3gauhR4uwUjfjwqgh0jMDZttHf7FDs0AVqQVY5qv7G1LWfgw3Lb+I+UVIx
	IVvXAtx2qJgJ5QXWmaC+1F4u/X4kudFQawlTXmalQLgAuPG/LONAQGX3N6Ef6J3V
	A8vaUXfca5DngT07aNY1YA6vvY4WBdwek8oxfBinHpg3kueP0BOK+oOZDvRiz2Xu
	AImB+RaN0GrDud+sM8S5RvAAGaZQZmRWcK8xrZ1FqCa/fZcH0cFrsZSvdjOe9Q+e
	iEzTia0PF0KS1wcvTFQGESQuY1fuWT7n9QtHK8sqsFakSlH3MaD7kMY6VDm+phN6
	F95SmWDXFSbc13pvAD89hQLqi3HBsU+csH+H2uNphcI=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Mesih
 Kilinc" <mesihkilinc@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v6 0/3] Add support for codec of F1C100s
Date: Sat, 23 Nov 2024 13:38:55 +0100
Message-ID: <20241123123900.2656837-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732365724;VERSION=7980;MC=2816337656;ID=80950;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD9485560726B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_044211_062109_81A54770 
X-CRM114-Status: GOOD (  10.24  )
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

Support for Allwinner F1C100s/200s series audio was
submitted in 2018 as an RFC series, but was not merged,
despite having only minor errors. However, this is
essential for having audio on these SoCs.
This series was forward-ported/rebased to the best of
my abilities, on top of Linus' tree as of now:
commit 28eb75e178d3 ("Merge tag 'drm-next-2024-11-21' of https://gitlab.freedesktop.org/drm/kernel")

Link: https://lore.kernel.org/all/cover.1543782328.git.mesihkilinc@gmail.com/

As requested by many, this series will now be split in 2, the DMA and the
ALSA/ASoC codec driver. This is the codec part of the series.
The first part (DMA) is at the link below. The first 3 patches of this
series can be applied and built without the former series, but for working
audio you need them both, plus the last 2 Device Tree patches in this series.
Link: https://lore.kernel.org/linux-kernel/20241122161128.2619172-1-csokas.bence@prolan.hu/

Csókás, Bence (1):
  dt-bindings: sound: Add Allwinner suniv F1C100s Audio Codec

Mesih Kilinc (4):
  ASoC: sun4i-codec: Add DMA Max Burst field
  ASoC: sun4i-codec: Add support for Allwinner suniv F1C100s
  ARM: dts: suniv: f1c100s: Add support for Audio Codec
  ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano

 .../sound/allwinner,sun4i-a10-codec.yaml      |  31 ++
 .../allwinner/suniv-f1c100s-licheepi-nano.dts |   8 +
 .../arm/boot/dts/allwinner/suniv-f1c100s.dtsi |  14 +
 sound/soc/sunxi/sun4i-codec.c                 | 367 +++++++++++++++++-
 4 files changed, 418 insertions(+), 2 deletions(-)

-- 
2.34.1



