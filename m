Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CC1C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAW74KaUziZf57otQ+cMQYgIy+S97aiTxfrum5vDwuQ=; b=WBmx86oRhHk2Yr4yOYYSKFqMdZ
	ralTo99eOFXD5/A5Xh90b+Fh+XhUog3YawdFTyg/p7iCq5TWqoxOEjXinwgqBi8+X80Adnyi9p0lH
	q2MfyVS5DeA+g2f/IzirAvxYQetawLJW44sWVJCVUS9iUriFxxfpiZovgejos7pEfPP8wi4A+CSw4
	gvXgkbQNRCRUhgh2nt95bZ2GDOVSXfGAfh1uPNO9SM/bO3Aru9W9uz2J7x22PBl7YqVEzUDvC3pFQ
	6JDuizEkLA6xk+E7I5izLcTVCY+vi7fk7InY6aVFg+s5fHks7eoL3cazax4g9+gMTAvLDYHkf5Y21
	E7+5pUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8So-0000000CoJl-2IOr;
	Fri, 28 Feb 2025 22:04:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8IF-0000000CmVA-23Bf;
	Fri, 28 Feb 2025 21:53:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2822B5C5BCF;
	Fri, 28 Feb 2025 21:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B09C4CED6;
	Fri, 28 Feb 2025 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740779594;
	bh=vYi1mGiS+7/01/+oN5mP+NkIR8gD/X3Dati9GNTQoD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kk7Tj5YHRqU292yTupv6Yb4e0vYzpQ6QXvvbuAFptKjGEmtQmVgMXr4NXPH9ZOgvk
	 xaRQPaKPUjidd2+KbC1kFymDR90knzNoSxlwzZqgbHbNMKQeZIE8MIYQaSlbZlpyBh
	 GDhu1YpLU/INurNIqvDGiernot51ozXh4WsUqdGNFwQI9BMedpXVnlo51QXeSVR1lr
	 h6o2BH4tfYuOUPy/X/zZYLEMKn5mRG8W1elJxgyrl3fCxDukNQE5aH3buGxe0+Wtr/
	 oJsbgjvQDZqHW4YaAgYHWsaiYKXBazgOYZ7eS0LmF3jOa4f02KgHZB6Z6njIZ6BtQ9
	 S907/hx+MssFw==
Date: Fri, 28 Feb 2025 15:53:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
Cc: jian.xu@amlogic.com, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
	linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	shuai.li@amlogic.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	zhe.wang@amlogic.com
Subject: Re: [PATCH v3 2/6] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad clock ids
Message-ID: <174077959192.3759834.11760233362510893380.robh@kernel.org>
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
 <20250228-audio_drvier-v3-2-dbfd30507e4c@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-audio_drvier-v3-2-dbfd30507e4c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_135315_566995_C3FF5082 
X-CRM114-Status: UNSURE (   8.28  )
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


On Fri, 28 Feb 2025 16:04:10 +0800, jiebing chen wrote:
> Add clock IDs for the mclk pads found on s4 SoCs
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  include/dt-bindings/clock/axg-audio-clkc.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


