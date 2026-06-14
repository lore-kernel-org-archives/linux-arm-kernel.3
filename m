Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC31CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCdzVaLtfObb9ZWcY0NE9dFqLduRZkfGF/mOGT7kBic=; b=VYGZRJRQCxIaBeGY1hGHck9fyg
	HUQCIE45vyIXXlIeFOSexUJoXwQS6XgUmCc7tn8g3CISPAKKMlWrpPOrYQbrFNfGifTrUnNNs6OkP
	xGJe6fKtGLlKXCY9WRkwOk2axhZowrqWTM1v8XF5md3y9IoJvKRfyexlSIUob9/pBnhBp/BV6YLkw
	rd+PJJL0L85Wot9V6iECePIPJ7XD63qAR00Z4sEZqQeQrA1Cx0EJ+7+L5q4UVK3U8lGHzkoMB81OH
	5AH05b+eXtJudaicAC6cubK/LUziQOfTkc+n7J4TDZC/Ix3+GNbgLXG4rIGwQ19kd+g6lvMZFjNX+
	I2o8WuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYoN4-0000000DCro-0NnG;
	Sun, 14 Jun 2026 17:11:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYoN2-0000000DCrd-1nVB;
	Sun, 14 Jun 2026 17:11:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A49D42ABB;
	Sun, 14 Jun 2026 17:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D801F000E9;
	Sun, 14 Jun 2026 17:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781457099;
	bh=DCdzVaLtfObb9ZWcY0NE9dFqLduRZkfGF/mOGT7kBic=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WJENZEyZBWe3+949+6oiVJgtitZd3LYuAyoJFHmYSKCxnRwM/AMDYzq1nYrKbNSIT
	 LunA/Hb6tG5KJz1R4yC2F8D7z8/kBN0R5UlCPbDnS28MUXoWrwCyMAJX7KHOgRlILA
	 ePSPKMM4r1FP+kZiCA2L/17m1RX7huz+ImquUWSJRPNmbqVaBnn/bWk5SZV+wgcGOU
	 jr8LI5sF6WWXV/8FsEPx+u+f+H8hqc6xmTB5PrjISjG/YwZcLh/KMVZNOiVl51kLKI
	 aA/lN4/X21MWjDIuCjIana8E+k8ktTpCxbEPiiEdtDCc2HA0WX96IsfM2IkpbtuWyg
	 0BZSzL2SUMt1A==
Date: Sun, 14 Jun 2026 18:11:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Roman Vivchar <rva333@protonmail.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee
 Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Message-ID: <20260614181128.4c1b762a@jic23-huawei>
In-Reply-To: <aihqeLKHC3PP436t@black.igk.intel.com>
References: <20260609-mt6323-adc-v2-0-aa93a22309f9@protonmail.com>
	<20260609-mt6323-adc-v2-2-aa93a22309f9@protonmail.com>
	<aihbxowyAIlSeDjH@ashevche-desk.local>
	<hacDZbv1Whk_g8AMSfJqKHrgXfyVKt2o3_UGK-1k9jNRJyMxEFPztGhytHvHbc1x9j-F84I_ZuprmXWf2Azbtdqj2vnVal4PO1gG_DijYyA=@protonmail.com>
	<aihqeLKHC3PP436t@black.igk.intel.com>
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

On Tue, 9 Jun 2026 21:33:12 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Jun 09, 2026 at 07:15:42PM +0000, Roman Vivchar wrote:
> > On Tuesday, June 9th, 2026 at 9:30 PM, Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > On Tue, Jun 09, 2026 at 04:31:59PM +0300, Roman Vivchar via B4 Relay wrote:  
> 
> ...
> 
> > > > +	case IIO_CHAN_INFO_RAW:
> > > > +		scoped_guard(mutex, &auxadc->lock) {  
> > >
> > > I'm wondering why we haven't moved to guard()() here  
> > 
> > The compiler would complain about 'cannot jump from switch statement'
> > due to default case.  

See the brackets Andy suggested.  That error is what you get without specifically
defining the scope.


> 
> I am not sure I follow. See the examples in the existing drivers. They are
> warning clean in that sense.
> 


