Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DCCCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApwHXccA13tThdbmTcUjBBn+h4UCN92jWt1cppruupc=; b=Ttje3QjnDq52uEmpbI0BjB+bCW
	1wil05B5rI3/v0MGQcf8M8aD+cIW9yqHtha2xuL5BCHazWYfI9Fx5awXL7TnuDDTAXzJgQ45yHrkK
	7ES05fLsvZNqKZpimw3+MWBaqCt6oDdoNxCsjUGZKlgsbNfM1sQuoztLkBFhKk8x/kbXFAm2hBMkL
	239VoOFUdrYAgJn8a5d5n/0vLBC9rWn2/7R5OWwonC43qqfBtFI608w2BJbQBgYohzRfiY+Bp1F+p
	+aATPUDEDb98hMzAKTPMC4fD1bSRTLY6pOW+nXRTGDSygqzxOYjfAc7hY+zCOIb21YsA1lCI/YiBb
	a1i8AaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4k1-00000005grb-2SWg;
	Fri, 09 Oct 2026 07:10:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4k0-00000005grP-20cw;
	Fri, 09 Oct 2026 07:10:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E89C441A49;
	Fri,  9 Oct 2026 07:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497431F000FF;
	Fri,  9 Oct 2026 07:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791529803;
	bh=ApwHXccA13tThdbmTcUjBBn+h4UCN92jWt1cppruupc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GfTAhvolL0PePaww07ARO+VPbW2vNtdQ3Hc19seTkOtHisl3eCbEI5fohaRcN13eU
	 go2VESSFrPNFQ8KH/fervuaphvHBw6j5ozwDt5kiZn3tCzZR6SyXTj06avbvQrS02j
	 8RbDxHI6Ylw8otTr45RTgp0ObZDqYtLFIjYEvwWt6gvi6KraZU6p431CiYSyiN0nU6
	 wqZ+rMHzNHz+uiUtGcVsS1gbbOOIOn/GjH1NcVNK/0WQvnJ8WGLRX3Ju7f1rBA85QL
	 p/qhIjR+i+nEHiDrwcEspuSCx6lAHfrIeVnYoI89yBeMJNQYMLPvd9ZmAThS+U9rks
	 sXQwyP/2AncNQ==
Date: Fri, 9 Oct 2026 09:10:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip
 power supplies
Message-ID: <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
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

On Sun, Oct 04, 2026 at 04:03:29PM +1000, James Calligeros wrote:
> Some integrators do not expose the power rails connected to the codec
> in a way that can be expressed in the Devicetree. Do not require them
> to be specified on such platforms.

I don't understand how these cannot be expressed in Devicetree. What are
we missing?

Best regards,
Krzysztof


