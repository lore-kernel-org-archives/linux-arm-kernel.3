Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A13CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drk6vrbhDky6WwBF9HEiKazWP5pK/rfmhPgvZZFDARE=; b=47ceQ7KAtECpE26vKdfOkJ7RYS
	hmO67Z8ZN7eR4fnlqf6LJnO7rPeiDb6IGzGzA+SelCR6x0aPrX/5IciOvh+aO/BQ8iIsc+EjK2qEy
	xCALKdC4WEjCWUb+IVol31kY9vROPEMW5IbkeG9r5h17hDXU88hglpZ2I1rkV8IMbXDsZzrNEzVEM
	FnBYOZ4Hg0O0j6hucwXO1euoKGeyNHqJ+gaq9hIn1JVkbtoesmu1XgWMTUeagnZ0m48muEE5nkylk
	DukLxYdyxHSI7ZjYujNtPWfBgLx51Nh/DsWYfDXvqVZDt2xiytJI7vFS/xtpkzYty1oiPrNvrJzg8
	9+YB5I1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm0y-00000003fKE-3vva;
	Thu, 28 Aug 2025 23:26:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjQG-00000003CWV-093Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 20:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A08F43BEC;
	Thu, 28 Aug 2025 20:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26505C4CEEB;
	Thu, 28 Aug 2025 20:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756413639;
	bh=kSd9yQ5EINKYpwqi6yUYFPe1ps+5gMFanto3kxgPNGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oASrOklJJgORMInU8rbv3sn1bDbUqM6i2oWdWH98H3IhdGeV4J2N8s9jgiNE/6OJf
	 OMf2QTGYEy/SlmGfj7yZDVFvrO08c6tAzz8z7immjy23IeA3DmLPULA9szb6QsIYAl
	 mgZbGbSRfNwua09FnixrpxWRzzDqOin2FVHZ4kaA=
Date: Thu, 28 Aug 2025 16:40:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Wanner <ryan.wanner@microchip.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, varshini.rajendran@microchip.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 00/32] clk: at91: add support for parent_data and
Message-ID: <20250828-spectacular-lion-of-reward-3afda3@lemur>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <aLB7CJY9nMLoS1or@x1>
 <08dd4d82-8ac4-43a3-8d01-f293db6302e2@microchip.com>
 <aLCIcWIJ4Nfqt7oi@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLCIcWIJ4Nfqt7oi@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_134040_112036_1054AD5D 
X-CRM114-Status: GOOD (  14.46  )
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

On Thu, Aug 28, 2025 at 12:48:49PM -0400, Brian Masney wrote:
> > This was developed on 6.16 but when I bumped this thread I checked and
> > they all apply cleanly on the v6.17-rc3 tag. I also just tested on
> > next-20250828 tag and this set applies cleanly as well.
> 
> I initially used
> 'b4 mbox af762c93-c9d0-485e-a0d1-7792e6e37c09@microchip.com' to download
> the series, and tried to apply it with 'git am', and that's when only 12
> of the 32 patches apply cleanly. I expected to have to 'git am --skip'
> on the cover letter.

`b4 mbox` downloads the entire thread, including followups, and isn't really
intended to be passed directly to git -- it's more aimed at people who want to
read a whole thread in their preferred email agent.

> However, if I download the series with
> 'b4 am af762c93-c9d0-485e-a0d1-7792e6e37c09@microchip.com', then all of
> the patches apply cleanly.

This is because `b4 am` will make sure they are in the right order, etc. This
is, in fact, the command that is intended for this purpose.

Hope this helps.

-K

