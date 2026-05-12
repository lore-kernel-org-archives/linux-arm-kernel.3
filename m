Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F525CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSr1Tf0ZzXk3mG4Djix4hLHmzWHNLYDR+N82KvuQvxI=; b=nOeMhX7ULz6wgj3KfDQyEGiSub
	ABpwttgvPC/8Q0UuTasDvxa/A/+gqvtdw6JhJbM+MthbdVYuZ3DBAWZ4uqLHJjajFqURQ1b7GKn5q
	OOu1RvC3ReEE+5R1+zoTfeX+UQWrC9Y/JsUXY/9+b38XoGFtUlKApyGQPzRs4IyWyPS8JIo0pdfFW
	tmK6+gye14cVtTJs167sw1BwAO8115QUgegzTMIlIw8KXcC/Ni+lWzX5FO1Q7NBZ+t3Zt5BlMmfHI
	wueBDeT1Blgb7H9hjBUIFpeUJohYbKP4tX1h7NZKnbJXgdXlW00TnQpgGr66EbsUFb9ewArKIRTnD
	yOXXgtwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZB-0000000HU38-1qzd;
	Tue, 12 May 2026 17:06:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZ9-0000000HU09-1mPK;
	Tue, 12 May 2026 17:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B1BE60132;
	Tue, 12 May 2026 17:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70055C2BCFB;
	Tue, 12 May 2026 17:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778605601;
	bh=ezfbGln1rAFroxwiTMHKaOWp+LJnHoZZM/cVb1R4ihY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jjHtIXK/1Reia9zFkZTv+Z8tndN2U01vImsudjV7gF3/4f5idlLEdWLA+ghnm/BRs
	 doE0D43i3whpEKjdR/XEiMshzPFWw/6CDnVtU3Ss3bPeMc1Ijgn3vxiPctQtAXDhjs
	 TYDyMF3beTwh9NqzTZqIlQfXrVe5cjDbsrMXkSurImJesRAQFXiPjE10gga6OLzPNJ
	 IrWk58KY8jc6Jb58ACPLiXiTq1JKU6iHbyQNjGgGIYeRxw/QAWgXtWUtuOa8Wium/K
	 0MAZuM5Et2YgPuan1t5AkZMvKMtwKH1cZAovmO+uEN/O3GO9+g0gEeBMFXWeDtDAQ/
	 mmu33be+Bphkg==
Date: Tue, 12 May 2026 18:06:27 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen
 Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Srinivas Kandagatla
 <srini@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 01/16] dt-bindings: iio: adc: mt6359: generalize
 description for mt63xx series
Message-ID: <20260512180627.7301b0af@jic23-huawei>
In-Reply-To: <wTd36596tJhd0sPk-1MSi79xz14IBgTKXpD25tnKuRXLfGywkoenZ-wIDtOvRxEZL8xpqijZ0nxMsCFTOJgJq__y26VzCpe_9f0JQGWrJVo=@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
	<20260512-mt6323-v2-1-3efcba579e88@protonmail.com>
	<20260512141313.425535d9@jic23-huawei>
	<wTd36596tJhd0sPk-1MSi79xz14IBgTKXpD25tnKuRXLfGywkoenZ-wIDtOvRxEZL8xpqijZ0nxMsCFTOJgJq__y26VzCpe_9f0JQGWrJVo=@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 12 May 2026 13:55:26 +0000
Roman Vivchar <rva333@protonmail.com> wrote:

> On Tuesday, May 12th, 2026 at 4:13 PM, Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Tue, 12 May 2026 08:18:15 +0300
> > Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:
> >   
> > > From: Roman Vivchar <rva333@protonmail.com>
> > >
> > > Update binding title to the MT63xx, since the list of compatibles already
> > > includes mt6363 and mt6373 which don't belong to the mt6350 family.  
> > Hi Roman,
> > 
> > Wild cards have a nasty habit of going wrong.  I'd prefer to see
> > language like: MT6359 and similar PMIC AUXADC  
> 
> Hi Jonathan,
> 
> I agree that it would be better to specify the exact PMIC models, however
> 'similar' wording might be a bit misleading here. As far as I know,
> the mt6363 and mt6373 use SPMI, while mt635x (and older models, like
> most of the mt63xx series) use PWRAP (a custom SPI-based protocol).
> The mt6323 has an older AUXADC revision which is not compatible
> with the mt635x driver.
> 
> Would you prefer more explicit list like 'MT6323, MT6350 series, MT6363
> and MT6373 PMIC AUXADC'? It's a bit mess because some mt63xx
> (like mt6333) are sub-PMICs and use I2C instead of PWRAP.
Complete lists don't work because sooner or later they become too long
for a title (though they should be there elsewhere in the dt-binding!)

Perhaps something around: mt6359 and similar SoC ADCs including those accessed via ....
 
> 
> > It is less important here than in many other places because the
> > file has an explicit list soon after this, but none the less
> > we've been bitten by this too often to think manufacturers won't
> > throw a completely non compatible part in the middle of a wild
> > card covered range.
> >   
> 
> Best regards,
> Roman


