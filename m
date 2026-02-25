Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A06FD3776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZJe1ysZtHDQPXqYHzpEFAwR2dAkNxW7ASLxemDvh/o=; b=lNY6VcLswW2Duc
	1iTkH2lQRqrXp4pg4NKXG3uNWhFoSaNLDZqWM54C72MLgdGxksjlkfwIfsXmQNcWEYF/PsTzTwUCi
	SMsFJhh6H13/bl0TW6HP6kVYdypLLSR72u+p1sa/4bCxY+8mTwzsZtPAtiraaMATsOFibB4sY1pbA
	4ryycCql9/llRg71N22kINErhL9HQc+KlI40UDdKJ8RxpvkgUYkUTF9XIQrX3lUIa1mbKFgzoI590
	WuSr/TXZXr8pdttLwCtiMh5Zkfiu4gYqbAseqIV3Tt97mBLBuJ6hJBfS9cybCTvoPStZI11ZH+n//
	7etpqYcszzml+LCTl4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIoY-00000004fj5-1Oqo;
	Wed, 25 Feb 2026 17:36:46 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIoV-00000004fhX-1zlk;
	Wed, 25 Feb 2026 17:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=eZJe1ysZtHDQPXqYHzpEFAwR2dAkNxW7ASLxemDvh/o=; b=tF+WrfizVOqWBP1aoKqgQFJKi9
	7aWfTCGHVJ7F+0sHSSaOjn2xTVV+zsvEbdDFcrEApR8LLJEC8hYZcIfiiOOy5TkamOIOxuTWkeSHt
	pirVEDGEIj/ZzLbBX/J9olz8lvqTyyZPpB9R3/KYbE3GDeqiBocLFYHhYq26+Uz9ASvU=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:53172 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vvIoJ-0007uZ-Po; Wed, 25 Feb 2026 12:36:32 -0500
Date: Wed, 25 Feb 2026 12:36:31 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, robin@protonic.nl,
 andy@kernel.org, geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hvilleneuve@dimonoff.com, mkorpershoek@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 lee@kernel.org, alexander.sverdlin@gmail.com, marek.vasut@gmail.com,
 akurz@blala.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Message-Id: <20260225123631.6a2c039e05d7609604463809@hugovil.com>
In-Reply-To: <aZ8voAddPvMLCvc4@smile.fi.intel.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
	<20260225155409.612478-5-hugo@hugovil.com>
	<aZ8fXXGMx3fk7gKs@smile.fi.intel.com>
	<20260225114155.3ee2efb002aa0f52a905f535@hugovil.com>
	<20260225115652.8beb1979df3824f7a95d22bc@hugovil.com>
	<aZ8tocPCKqTXqbC0@google.com>
	<aZ8voAddPvMLCvc4@smile.fi.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: Re: [PATCH v3 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_093643_875245_7500F509 
X-CRM114-Status: GOOD (  19.10  )
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

On Wed, 25 Feb 2026 19:21:36 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Feb 25, 2026 at 09:14:16AM -0800, Dmitry Torokhov wrote:
> > On Wed, Feb 25, 2026 at 11:56:52AM -0500, Hugo Villeneuve wrote:
> > > On Wed, 25 Feb 2026 11:41:55 -0500
> > > Hugo Villeneuve <hugo@hugovil.com> wrote:
> > > > On Wed, 25 Feb 2026 18:12:13 +0200
> > > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > > > > On Wed, Feb 25, 2026 at 10:54:01AM -0500, Hugo Villeneuve wrote:
> 
> ...
> 
> > > > > > +#include <linux/of.h>
> > > > > 
> > > > > Is this in use? Or you wanted mod_devicetable.h for OF ID table?
> > > > 
> > > > I need only OF ID table, so will replace with mod_devicetable.h.
> > > 
> > > Hi Andy,
> > > finally I need <linux/of.h> for of_match_ptr()...
> > > 
> > > But I will keep <mod_devicetable.h> ...
> > 
> > Do we need the dependency on OF? We may include of match pointer
> > unconditionally and the driver could be used on ACPI systems with
> > PRP0001 HID.
> 
> Not only that. of_match_ptr() or ACPI_PTR() shouldn't be used in a new code
> (there are, of course, _rare_ corner cases, which this one is not one of).

Ok, will remove of_match_ptr() and also include <linux/of.h>

Hugo Villeneuve

