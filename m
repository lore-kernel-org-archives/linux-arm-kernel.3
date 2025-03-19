Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283CBC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 08:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9jYob1RduDdA2Obw1UuKhmLTLXHcMjg/FQJZpCpk+8=; b=Zo5D02owO2Orx2vWeI2BMB57Qw
	94kr+rAFAC2nt6vO4+Ap35539XVZ6cy2L6JXDctknrQP6RPc6WJ8LlHJj6PTdfn+4zadoRsDtIwND
	ZpQjksPZMEKbsJRoJq44dQEM5r+OtUdXtLYC0L/3CsQi1hSFtlhrtD/Z8HIXSeeoNhxWghKUA+8K1
	P1tf2HqimB/6ijULehUJew4O2hdSom0EJphCwfbHg4xkWCndJi9zdkrwld9l72xHnTIxRk5z1dwZA
	m1LQ6oYv0uiIy5BIETnre2WqPtRx5XRPjFqhYO1eZFIKO5cVCIN9CnxvB6HUDlj67VSwd+QYLgpPP
	eE8Fo9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuoiY-00000008KqI-00Hg;
	Wed, 19 Mar 2025 08:24:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuogr-00000008KUc-3Zzj;
	Wed, 19 Mar 2025 08:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09B236159D;
	Wed, 19 Mar 2025 08:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3E5C4CEE9;
	Wed, 19 Mar 2025 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742372537;
	bh=qHottCH/UKxNQxJoU8i1IYC7DAOUxp3drrxyBkl7KQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLmL4vXNYRImbsRHdoXOTASyKXTCLYTmZU1XVmzyNSJ/5wXrqRTeLkUHdN0h8FOwb
	 wseediqt69jln1jyt6z2irAxoQHTRp9haUAPDfdqmRXzKrOe7vB2hR+eJevPfpLKfM
	 My0Ch6CFLjFbQ9TjfqAvhegyUVtzNytaZUXKN9MF5PrQoV35Y4yMBSYAsmzEpLIaHe
	 PKyKTYWfgjGbt7fUJCMZpP/4DeK8zH2HYZeEk3zGb/0E37UoisK09++33ln2+rqyPF
	 10ZDQTzFz5K9uA6YVd/leQFkyaOnrvDdL1kVR8/nv1do1eJV7U39mRfZSe7RTdGWDW
	 AukSgF2M/fLxg==
Date: Wed, 19 Mar 2025 09:22:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jian.xu@amlogic.com, 
	shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v4 2/6] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad clock ids
Message-ID: <20250319-daffy-classy-kangaroo-023e1f@krzk-bin>
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
 <20250319-audio_drvier-v4-2-686867fad719@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250319-audio_drvier-v4-2-686867fad719@amlogic.com>
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

On Wed, Mar 19, 2025 at 03:04:45PM +0800, jiebing chen wrote:
> Add clock IDs for the mclk pads found on s4 SoCs
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  include/dt-bindings/clock/axg-audio-clkc.h | 11 +++++++++++

This belongs to the binding patch, usually.

Anyway - do not ask us to do the work twice.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


