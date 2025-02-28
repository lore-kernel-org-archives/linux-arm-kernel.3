Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E74C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niJhzuucmvHsReGFyGyTF+NqMHuYvTo2E8qep1Z8iAM=; b=L9KGtdLwp3t3gX+qmdggTtXybm
	41W2TrAxo+qS+NZQD/Wma14LVgiIR1q6PheYdhSDcmpyWjiCltTchqDBvmSx+SvSH5beQG0CZwzKP
	zLqWPobAQWkABLrADUP512NsD2Lc8u2hxO36trjogvtmpKW/YHhQ2ZH4KDqUWZuyQuVKRQ0WETbpA
	+uTZ/yqc+fu1HYAuHDX+oa/hx+dWTygiALbsrpP6hYVVW44FalMNHuHy2ZJ7VKvqvW4D7fKGzLaDy
	HOzlkd9oF/y6+Yo04hyX6d/2uf9Dt98T22qSoXPfcENdpT1a/MjGHb9cFIoTDFuvum8m+3RHdLA/q
	Xw+enzsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8UJ-0000000Cog8-2G78;
	Fri, 28 Feb 2025 22:05:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8JQ-0000000Cmef-44XL;
	Fri, 28 Feb 2025 21:54:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77E245C5CF9;
	Fri, 28 Feb 2025 21:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28DAC4CED6;
	Fri, 28 Feb 2025 21:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740779668;
	bh=lPLFh+00xp78235bh44TfGLXIDG+nOh0mclninRKRyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBfYwbSngjDbqOzR37piyYJJcx6t1dyst5pJ6u5QbGRVsI5Wu4tc5qP/SD0Nw0BzE
	 ONw014XSi7UKWKvJdb+MHaHs5D8sKdo5SrTUVqZGEr+QO4F41ztzXcC/Jm/1OqaKab
	 EmwWw91YTylLtqIt4Gi7fjSotl5uiEboYIqoBhAJn8X5A0saOO/GKC7QleUfY1EGmO
	 Gqyy/IRssEDpX5gH4JSQDPpdIOZhujelNTaCFZrdF5nBfriVDUxn0cJ3FWZ/LcgIJ4
	 ghbLoGVGmVgYc+X+cddNHGq6MA6ruxhvVkrmtlB92ltBiHsS4iQr7bh1ZSl5zAGw0M
	 jjnvymy+QCHjA==
Date: Fri, 28 Feb 2025 15:54:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
Cc: shuai.li@amlogic.com, Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org,
	linux-sound@vger.kernel.org, zhe.wang@amlogic.com,
	Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>, jian.xu@amlogic.com,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
Message-ID: <174077966526.3761473.14676912177806602380.robh@kernel.org>
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
 <20250228-audio_drvier-v3-3-dbfd30507e4c@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-audio_drvier-v3-3-dbfd30507e4c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_135429_055464_363481FF 
X-CRM114-Status: UNSURE (   7.85  )
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


On Fri, 28 Feb 2025 16:04:11 +0800, jiebing chen wrote:
> Add the s4 tocodec compatible
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


