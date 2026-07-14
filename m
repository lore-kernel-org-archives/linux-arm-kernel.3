Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6124C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3CkAi0NhBu7kRLp3iC2P9Ehn1eHefsaOWNM8LYTF4k=; b=KiRpEeAL6OZ+G2CIA8gJ8YhOrt
	QLC5XZhloDgW1IvsDY6oOElv7RtQdGRXL25gdeM/yyjBeky3TErLoIIyEbchT1f/UR9aQRKHMYOBO
	tn9whMkLk2q1VKVih5ltEjb8bdatqEHuz/VxJ/JkD4vDOqVh9/J1gwB+hOzu99y4K8jIW/SKiMoU8
	kFgEvCgEWe4QfHnhxOaMee+So5a1sRhV2FiGVon6MgWefbvTEHEFu3NJ+vlC1z3HN98+QwxVU+u5a
	VArbeQAd3jc2kiRTCeoDuHjTFgW1EmcxQytkBGaffFyPtK5oSPcshUSW9n88Jfjk/rRrdAILavslZ
	CufOzVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuXG-0000000E5ux-1T0Y;
	Wed, 15 Jul 2026 08:00:06 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuXD-0000000E5tb-25aj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=N3CkAi0NhBu7kRLp3iC2P9Ehn1eHefsaOWNM8LYTF4k=; t=1784102403; x=1785312003; 
	b=lMYZ6E/WM34u0/OtvZ1E9alFcRimZ3nfSGL4NRQ8HNag3gc66LxrPJIbgkJ3zHT2FyldrAESOlV
	kmoidoM5VOpg4WHHjntziPucbzgGf5nmNdlIJa7KquhgvGpA6PzWF92Hyvmg/h3lJZiv04rN+r4Ea
	yV9pBn5lVWxb7woCvzw3eoviDztO1MTu17mqltLnOQS34DDelh7Y4e1jjXpkqDLiGSJh93C7N/f5v
	4hogENxD2RTc7ZKoUhds23Vxx/YBRDn6FZGblcScNT4Zz6CxQ4jc3Wiv3padW3WAxmlbr8yZHgTTx
	V3KOky41XMeqGVMxqx06Wt2V1ZKAteyI5NrQ==;
Date: Tue, 14 Jul 2026 20:36:04 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Grond <grond66@riseup.net>, Stefan Leichter <sle85276@gmx.de>, Grazvydas
 Ignotas <notasas@gmail.com>, Tony Lindgren <tony@atomide.com>, Ethan
 Nelson-Moore <enelsonmoore@gmail.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Sascha Hauer <s.hauer@pengutronix.de>, Lee
 Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Daniel Thompson
 <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Sen Wang <sen@ti.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, Srinivas
 Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>,
 letux-kernel@openphoenux.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 kernel@pyra-handheld.com, mfd@lists.linux.dev
Subject: Re: [PATCH 06/16] ASoC: twl4030-codec: Allow setting APLL rate
 through the .set_sysclk() interface
Message-ID: <20260714203549.4b070f72@kemnade.info>
In-Reply-To: <7ea589f951baf1e217c7169ae21c0bf510672ecf.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
	<7ea589f951baf1e217c7169ae21c0bf510672ecf.1783749722.git.hns@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_010003_586704_E62D3644 
X-CRM114-Status: GOOD (  11.76  )
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

On Sat, 11 Jul 2026 08:01:53 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> From: Grond <grond66@riseup.net>
> 
> On the Pandora, the APLL is actually what drives all of the audio
> clocks on the board. Since the TWL4030 is only used for capture, we
> need some way of setting the correct rate for playback streams, since
> they will not go through the TWL4030's .hw_params() code path (which
> is normally how APLL rate is set).
> 
> Signed-off-by: Grond <grond66@riseup.net>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

As a general comment: might we model this as clock provider (and maybe
that enables the usage of a generic audio-graph-card)?

Regards,
Andreas


