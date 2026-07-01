Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2640EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrAlCihXAcC59ghuysxR7ERdUdRQ2ao8tvLWADCyLyc=; b=Ggffii+QglMKOLcAFy203y1aLX
	4cCbkRWz/mMph0Z+/M/NVaYVTBrfXn815aY2EskUo3jSRGUX9A8U1sL6euOIvL23PPeERNdcxXqW4
	VFxbZxPtBPlgHfUzhnSxJHj83itKGuGXvxZELesoeYUyNHI0y+5VY/PuP0f/X3LxtiUc/y6Ax7i2p
	S7hvchHqSFywNDZX6iMaFXg9sqk9v01uc+mfI3F9w/EIZ8b0Px07NUZNZ69rodNjivgsM6gdq1xqR
	EmHtykWgoBKcqtfSkeD0qLXOAvLzh8qs3RSrlddZplxLZuabH7fIKBLg5C4txJ26koLlQkYON+fFh
	2Ifn2WQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wep16-00000000rm5-0edG;
	Wed, 01 Jul 2026 07:05:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wep14-00000000rlG-1FLf;
	Wed, 01 Jul 2026 07:05:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 736E5601D7;
	Wed,  1 Jul 2026 07:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358041F000E9;
	Wed,  1 Jul 2026 07:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889549;
	bh=zrAlCihXAcC59ghuysxR7ERdUdRQ2ao8tvLWADCyLyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n5R2/nBlCfCHCXjuCLpDJtsz7/SIw7qGduvxvd5fw5Zfl6TnnzPfRivmKTwjvV16w
	 X/+6te7Wyh+eSaWuKU83dtJiPQ0/FJghYe/7h79Ceju2+slZ7Cm3TygXYBvyLz87+d
	 yc7OuErLnEHDBIkBN8zDqLuCS1LJmAaij7GT1SHT0pmukbbK2f//+6wUMiCQPCLSCP
	 y5680erjdCK+ATyrTEoTNpY2CwB6R4ywlQVR3sGBeryYMG0Ua5wo1pqP3EceTKDPe2
	 ickRjDeybUQNoHNfbmE8cFhIen49xZ+fG9ZfWrG+j3X1BIvlO+O95cEygKPAA9qKa7
	 8iBfkIbmEQKNA==
Date: Wed, 1 Jul 2026 09:05:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add graperain
Message-ID: <20260701-sturdy-imported-oryx-dfc12a@quoll>
References: <20260630153810.3574714-2-coiaprant@gmail.com>
 <20260630153810.3574714-4-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630153810.3574714-4-coiaprant@gmail.com>
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

On Tue, Jun 30, 2026 at 11:38:09PM +0800, Coia Prant wrote:
> Add graperain to the vendor prefixes.
> 
> Link: https://www.graperain.cn/ (China)
> Link: https://www.graperain.com/ (Global)
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>

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

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof


