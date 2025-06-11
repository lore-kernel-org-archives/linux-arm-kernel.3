Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC63CC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNUuzIMhIMAgMLWmJfRvj2s7zMHvWJKXmIWGlIvHxWg=; b=PF0zU5nvNLnBBIu/QH4z12dvXG
	TrMi/4V3yGql5VdUarpLRyFiYl4jqFNaAL2p8QmiuMrRWS6//nGdTHExB8WoGcuEhJbEkECdY+rJH
	jdtODK7707jcK7c/bSO6usOi72hUWJuMWuHiSyuEXkfVJN4LsOS02De6bXbgPYUOQGdCXOmg0QffL
	F8LkyLob+VTDSctmju1zcXHRaMIqJoM5S8taFjPP6ps9p/WaAh7xfNpLAGYOGu/K1k26q1LtBXZN7
	6FT/nLs4BNnr+4TN5nzrDNPMG6YpNglt1u1Bo6pBGy0j/pQuZf/xbdzNx368W0iOIzvfV1vcNV1Yc
	3KX/HiEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGyL-00000009Jgb-0pTY;
	Wed, 11 Jun 2025 08:38:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGoN-00000009Gec-1eie;
	Wed, 11 Jun 2025 08:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23B5144BF2;
	Wed, 11 Jun 2025 08:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAAEC4CEEF;
	Wed, 11 Jun 2025 08:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749630474;
	bh=jVJDP6VW2c8elIa1D16cOy8gn1EBmQkj2x9PgzSs7p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCYgA5OhHA2wQU2VsOhqOj4L86jotUxPIBLlMqBdvs7v2ZTOaWk4sRm1mI1umJGRq
	 zZLRN4I74yu5o9BiuWDaw+rnjtBgIMvdD0UQV5oFuQj5Fr1Uegz2rCOqoCjNtco///
	 eGz5xPzMdeYHEoyyd3fk9fRKop2VhZ0zowt4hEO9po/tX8jctg8CQfd1m3fjMzNx4t
	 tn1gEKvYWYBPNcKoWOZnfi7/ILFzZjq48BSdB1XQlXRgDUmbXXwIRN21IK9fXLV55s
	 B4LBExtZSsWsFzY6UYR7QXBwRq1PAari20VmIeX8ASd3CmqkEYguWzitzE1iXVN/Sr
	 6axg/cFccqiMg==
Date: Wed, 11 Jun 2025 10:27:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE document
Message-ID: <20250611-private-magnificent-asp-63ef5d@kuoka>
References: <20250610092852.21986-1-darren.ye@mediatek.com>
 <20250610092852.21986-9-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610092852.21986-9-darren.ye@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_012755_452105_6A286D16 
X-CRM114-Status: UNSURE (   8.09  )
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

On Tue, Jun 10, 2025 at 05:27:25PM GMT, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add mt8196 audio AFE document.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---


I gave you detailed instruction last time. Did you read it or you
decided to just ignore my review?

Best regards,
Krzysztof


