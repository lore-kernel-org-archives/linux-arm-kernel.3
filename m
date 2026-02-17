Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E77E68152
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFrPWXYQT32uJfy+Itx8pbUU2F6AZS8gWr+T1oJUeBs=; b=Y52ABcvfyM1XBcpC/h9A06DQvt
	f7YIZkMLWPJbsToXz6hO6OQ6CJda3J/SupNG7+CN9Y7Fb95azU9foxZ1W1qLP5p9o2yi1BAoSSzT+
	ONj6Dotxh48elE4vbElAJQDgq8YyUUoS4KCIZoGZrSVrtUGB/Lz2CGcfp9RpoGuAiglpGCviix6CO
	gnvKgFCAGtDUZTUG7vWJrThGKhYokW9YcLMw6UTMLmx9BHAP+wbeLpNrX0OItyarfEU893p1ewRkA
	N+i3gFg3c+DAsQecnpcrrpVzFRs5TZVQ8cQ56FNtFWp4CsgdfnjAdL+qyguCtC/iPB440QnbBVXT8
	X24Sr4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHTx-00000007xAj-2uIO;
	Tue, 17 Feb 2026 09:35:01 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHTu-00000007x9y-1viy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VFrPWXYQT32uJfy+Itx8pbUU2F6AZS8gWr+T1oJUeBs=; b=RSQGvJp3nkM/KWKOE1V55N8Lrk
	pwlO9cyFM2UUUiM+OgmuyOXTYUN069Nn9ur8aenxt2oYUrfT6Xx36cTV6NlcBCMuL1z82zvRdQ7lM
	U8ix0yl1gi2hscTG2ZMJpv7qMAHudC6vgQ+mwh8s4jwXidPaR9XyGp2n/wQFTXRooXrbdZjHZU3f/
	f1Ep8TxJoLLF+trVeaFahWpGQk+AZjQ+chkOk7pPPTDIbxa7nCZYYfBNo1Jp9P6EFvqmD9FeeRHTg
	FaAxk25fMIvh48a4O4kYVM6SaC+hWi7f52xq92GU+oGnn16Tf2fe/EWR++vdz0bLhxPAx5P+8DsH8
	xxePVT6Q==;
Date: Tue, 17 Feb 2026 10:34:38 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Robert Nelson
 <robertcnelson@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin
 Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony
 Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Louis
 Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
Message-ID: <20260217103438.4697deab@kemnade.info>
In-Reply-To: <0EE0658D-56A7-480C-BF71-6B2EB81DC41C@goldelico.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
	<20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
	<B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
	<20260212174718.7daccb70@kemnade.info>
	<719BF710-26DF-49AB-A016-D2306F0389E2@goldelico.com>
	<20260212231907.6120a2e2@kemnade.info>
	<CAOCHtYicmeSzH5Q2_qTwAZw3s+__JRwUrXvz01+KCsJJHAznUw@mail.gmail.com>
	<20260216161155.09fae580@kmaincent-XPS-13-7390>
	<0EE0658D-56A7-480C-BF71-6B2EB81DC41C@goldelico.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_013459_474694_55DF9B1B 
X-CRM114-Status: GOOD (  15.26  )
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

On Tue, 17 Feb 2026 09:58:04 +0100
H. Nikolaus Schaller <hns@goldelico.com> wrote:

> Hi Kory,
> 
> > Am 16.02.2026 um 16:11 schrieb Kory Maincent <kory.maincent@bootlin.com>:
> >   
> >>>>>   
> >>>>>>> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI)
> >>>>>>> <kory.maincent@bootlin.com>:
> >>>>>>> 
> >>>>>>> Allow overlays to be applied to any DTB. This adds around ~40% to the
> >>>>>>> total size of the DTB files on average.    
> > 
> > Yes, I will move on to this solution for now to avoid too many complaints about
> > the devicetree size increases.  
> 
> I have done some experimentation with this patch (on top of v6.19 and our private defconfig)
> but could not find any DTB size increase.
> 
> Does it require another patch or CONFIG change?
> 
if it is your letux_defconfig, then it does not require anything else.

I think something already enables symbols in your tree. Look with
fdtdump at the generated dtbs for a __symbols__ node.
If it is there, then it is enabled.

Regards,
Andreas

