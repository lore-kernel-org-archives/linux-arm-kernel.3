Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01E7E677FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 13:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vqPDYISQhDcdF9k7RpAdqWVUZzTmtGJFd83DpIDrdGI=; b=mSHkh2CsTJ1sUjgMx1MsnbBU5k
	XeQNs8wp0U7zVkrnKs+rrEtLV6tqAIl3J4QFyf/t/eyyavFuZRVncEkURu7vP605jzw7NdnXB1fcL
	O5wxd8HW55YYbsJ6QDxcAiDM3njcW9XXhCnYp4eOMFZ0RWNDC+Vll1OW/WWwknEZGBGfzFBvFh+eI
	EN9Gwv8KGJC+SBGJAb/XelPibs244U1aHmA6tzxoE34vRLnS4+6L42eO+P+hMXIPxxqWIN1CNPALP
	rv7UikHyKQyH7A/+2DcbPmsrM0vHndhDiKHQHVJu/G+Pcs2WvPAXyun9xNopkseG6wXCFX5Bbd2vO
	iR6ymucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Dl4-00000009jcu-2YKM;
	Sat, 02 Nov 2024 13:01:38 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7DjN-00000009jJZ-0r7D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 12:59:55 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 39055A0ABF;
	Sat,  2 Nov 2024 13:59:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=vqPDYISQhDcdF9k7RpAdqWVUZzTmtGJFd83DpIDrdGI=; b=
	QsUKEfVqitrTzYosF/xicaTzE3y+qfLnbl5xZ4ryYgdo0NNSg+dEsDpTzxmFteW3
	xHdM5i2a0WATN0G7fcR3RtdIKaqpo8yN0k139zULhT93JKol7UvtJpHWgu3pftIk
	fEbzzkrq4/OqVbXGCR0kMdsQXnOLYbg9K3QtX2jr3x8H39hJOKaqMR1rivlOptEE
	S/7c0KJvGfQyEeOauruNEsZ6aWznhNdhUi4DcicYei2z9xwbSpE/UzdceBPkxXkL
	RMb7Zz8EG5dzzFRFTA2PIdF/Ojq2YQa2T8/35qpyrZd+upBYAISpU7f5C1hfJ89T
	adVd6KhKuO8ysWx5AbgIIai1CtybyBpoU9/yzDVBHtkXywg5ALomHB+Hufh3ExIg
	p+EjLJgTTKb7v5AOnMWk8FWZJkx6CvaaJU/plYiqmZZ+plISIW1RsIeuB1KHY3zh
	GFo2IujaxRtRPGli8gf0xnKJ7Yhu8e/ZIr8+L1WAEEhUz3dZI72jBrsplHaSbczy
	ELDD5nU6ttQwT9YyHTcffCq8d6EY0UQFtoXIGrwcTWGMqaM6wkNbvZhk32d3ybXO
	qEEx4tu9F7PJDx8zE/sq+NCi//vHBItokfOZ5nvAshVZ1gJa1L4MUTS0CP1vqgpv
	XkIhJmpwanXb9fgpBQBypGSmEx0xfu6qpfyag9A/mZY=
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
Subject: [PATCH v5 0/3] Add support for codec of F1C100s
Date: Sat, 2 Nov 2024 13:57:09 +0100
Message-ID: <20241102125712.2647325-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730552388;VERSION=7979;MC=637395765;ID=222165;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485566706B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_055953_723895_845F74A7 
X-CRM114-Status: GOOD (  10.42  )
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
commit c2ee9f594da8 ("KVM: selftests: Fix build on on non-x86 architectures")

Link: https://lore.kernel.org/all/cover.1543782328.git.mesihkilinc@gmail.com/

As requested by many, this series will now be split in 2, the DMA and the
ALSA/ASoC codec driver. This is the codec part of the series.
The first part (DMA) can be seen here. This series can be applied and
built without the former, but for working audio you need them both,
plus add it to Device Tree.
Link: https://lore.kernel.org/linux-kernel/20241102093140.2625230-2-csokas.bence@prolan.hu/

Csókás, Bence (1):
  dt-bindings: sound: Add Allwinner suniv F1C100s Audio Codec

Mesih Kilinc (2):
  ASoC: sun4i-codec: Add DMA Max Burst field
  ASoC: sun4i-codec: Add support for Allwinner suniv F1C100s

 .../sound/allwinner,sun4i-a10-codec.yaml      |  31 ++
 sound/soc/sunxi/sun4i-codec.c                 | 365 +++++++++++++++++-
 2 files changed, 394 insertions(+), 2 deletions(-)

-- 
2.34.1



