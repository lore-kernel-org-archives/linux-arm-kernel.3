Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094FB105F7AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gP4k2ti1TulBMhKPgWnueOjm4WQj0JB3eK0XXG1DdHE=; b=4bLPvK3YRJGG/koGxD4imGjn6o
	k6hrIX2+PqqrGU6Hb3rd4TK+X2SjX+MfZLZm9n9rLlAdiZHtNx/nKlV1bAsIxGv15/ZX7EwQS/5Oz
	WnLx6LAbnqTMf7Z4N48gSbZsuUZ21W4kAYIKjl5cYKV0afwPmGLNh0rN9xNixqkx1nsYw2xWAPjdQ
	It4uziv0zMVo7F018cVZAi8K7WfFmNvwjLa7KI84OO6lYqgfI9/lQ2LZeH5ZPllI70UeqJxuFPb1B
	04tgBPngzVNJFSVqgye9HZURNBIxXHZx7+jSioBRZIGCfdEaZGNxkkViIYzhndMZ+UJNkF9BAIZYS
	s+RIIjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12kD-00000000IZw-1Kzu;
	Fri, 13 Mar 2026 13:40:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12kB-00000000IXc-3v2I;
	Fri, 13 Mar 2026 13:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gP4k2ti1TulBMhKPgWnueOjm4WQj0JB3eK0XXG1DdHE=; b=kIkKxbEZ/v0Jb373Vpdz5bX4TR
	3kfo7umhmcGa4iCrB0pCWuN4cphkN3Oy4gN7nuQTZFf/tNP/G+WAtgH4qcRz1fFhVHZkvAXcoE0e8
	on8Sksi60LWITKTfp5+l/Bq/CDMEAyaaD2zJoxdAh4rYFY2PyIQOC2GmQaePmx9fAjXN7/wFGVHf4
	FsVmwnUvg7HuEvgb1MwYVYmh1H8LNse5d57zdVrHcy0l3B9UJP8gK2mrY1cLdYQHHRLZYV4wExFH4
	Qj+3TuPIoP50wkzqrRUHBYozO4u3uO1W1ODsGVRQlKVsca5TlsR7APjnP7BNM+vaFhlTSLw8YW9OD
	lkBl8Jaw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12k8-00000003Pro-2AnO;
	Fri, 13 Mar 2026 13:39:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4DB143821;
	Fri, 13 Mar 2026 13:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B526C19421;
	Fri, 13 Mar 2026 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409194;
	bh=1A73YCZCdwCqBIs1PA/b3ftEk+iWhmVH8hXw4g5DgOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hG7h7FxfRhjYL9T20ThO2UvC23U/Euqe4Dz8ExEV7pSyEZDoO5iEmzeqyH5cPnBcR
	 4/GSy1q1pGAR91W/s9ZJzRqfm3viVgEB39y7TDEEOIMwXarnTsfMP9L304lliI6pyw
	 h768C6nhDoEsqQzhJYs7L7mB2YISBtlgjRrsFuejTnmlCjycEEBcpWu0+KMi0qtnVO
	 TmU8Hvpg1X4noarsQiUN1EnZWc9i6sSU+LPBcQ1Xc4mOr3zVIr6bxSk1VtoTPHyBo/
	 GoSVTvN/fs151a1+3q3CVgus7WOIkuN+rYQHzTA6ayxBnurTUzK02IUJTDaZnTOhNt
	 p1qxEabsmvFPw==
Date: Fri, 13 Mar 2026 14:39:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, sean.wang@kernel.org, 
	linusw@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	hui.liu@mediatek.com, nfraprado@collabora.com, linus.walleij@linaro.org, 
	mars.cheng@mediatek.com, andy.teng@mediatek.com, hanks.chen@mediatek.com, 
	sam.shih@mediatek.com, rafal@milecki.pl, ben.ho@mediatek.com, erin.lo@mediatek.com, 
	zhiyong.tao@mediatek.com, Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, 
	seiya.wang@mediatek.com, tinghan.shen@mediatek.com
Subject: Re: [PATCH 4/6] pinctrl: mediatek: mt6779: Fix include guard comment
 in the header
Message-ID: <20260313-proficient-sambar-of-discussion-d31aac@quoll>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
 <20260312041533.187553-5-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312041533.187553-5-akkun11.open@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_133956_878446_8749175C 
X-CRM114-Status: UNSURE (   7.30  )
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

On Thu, Mar 12, 2026 at 01:15:31PM +0900, Akari Tsuyukusa wrote:
> Correct the mismatched macro name in the #endif comment.
> 
> Fixes: 920e469e15c8 ("pinctrl: mediatek: add pinctrl support for MT6779 SoC")

Nothing to be fixed here.

> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---

Best regards,
Krzysztof


