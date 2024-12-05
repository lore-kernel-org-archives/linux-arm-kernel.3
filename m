Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746FDE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+mJGKllQF4YY7mOgOcvnI1TedTI/H2hqcW4/lzxPSM=; b=MQC1rsgdCJ/vEVg0vfD+U6leR7
	p3pQGcUrmNTqHmYRrypntPLFwcFYIpM1PyCzWQRdaawtbWSzIJydHWkqIJ7iHQ2Em1teBcS4+zdO8
	Zxj+dBuPlEP7K42Nn6WbBtXEWfbAKl0IC7Plpu/Ov3JHX+rFIIOFEVYK5d3irtiUFfgzy5hsxS0e4
	yfvRJgB5ZIuuXEX/hal4WCFbH/0FvwQxGJBF5ImtJFtHU2X1Gop3lAy6+ALKdhU2JuE8enPIj0/5p
	6Ot0ohK2OReiJucx2s8HP/3pNFt5N01GRcLuo2HUtRFrEfvK9pxc47lCALzeTNfQbmAEyN6rYoMJr
	rRryo3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCob-0000000GK5f-1eTn;
	Thu, 05 Dec 2024 14:26:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCnW-0000000GJqr-49J7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 14:25:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 474DA5C72AB;
	Thu,  5 Dec 2024 14:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B082CC4CED1;
	Thu,  5 Dec 2024 14:25:41 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id EB4315FB49;
	Thu,  5 Dec 2024 22:25:38 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cs=C3=B3k=C3=A1s=2C_Bence?= <csokas.bence@prolan.hu>
Cc: Mesih Kilinc <mesihkilinc@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20241123123900.2656837-1-csokas.bence@prolan.hu>
References: <20241123123900.2656837-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH v6 0/3] Add support for codec of F1C100s
Message-Id: <173340873895.1777403.9265230616081178067.b4-ty@csie.org>
Date: Thu, 05 Dec 2024 22:25:38 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_062543_065652_38FE5174 
X-CRM114-Status: UNSURE (   8.78  )
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

On Sat, 23 Nov 2024 13:38:55 +0100, Csókás, Bence wrote:
> Support for Allwinner F1C100s/200s series audio was
> submitted in 2018 as an RFC series, but was not merged,
> despite having only minor errors. However, this is
> essential for having audio on these SoCs.
> This series was forward-ported/rebased to the best of
> my abilities, on top of Linus' tree as of now:
> commit 28eb75e178d3 ("Merge tag 'drm-next-2024-11-21' of https://gitlab.freedesktop.org/drm/kernel")
> 
> [...]

Applied to dt-for-6.14 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/5] ASoC: sun4i-codec: Add DMA Max Burst field
      (no commit info)
[2/5] dt-bindings: sound: Add Allwinner suniv F1C100s Audio Codec
      (no commit info)
[3/5] ASoC: sun4i-codec: Add support for Allwinner suniv F1C100s
      (no commit info)
[4/5] ARM: dts: suniv: f1c100s: Add support for Audio Codec
      commit: 95b570f7ded1e921eb3fd256d0a70b294f31bd0c
[5/5] ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano
      commit: 20296f8baa25839585b9060079946f7333a5c5aa

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


