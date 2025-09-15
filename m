Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BF2CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaOlF/AN2FazGCbmDk6JF3p53NVlVRqHIRd4HGYE/Jw=; b=ob6RKuV7TD26vaQ80PAl6FBsN5
	zQMnjnBxNt4t9rSHw8ZSBM2RBR3LyjQdPMkclbUoszHsAZEh6aoU9+h1/h7M7bpwRwwqmM1oLDDaR
	3iUjomHxEKSfH8yXdLttV5AsitJGypOXvxAe6Wm2iFeZZwq6DkdL27vKx1BCCXQyKGrzrSmm8OG94
	k5jZbwB+9qodd9xa/QUfU0w/f/56OLKNgLwnZ2PPPNCGXKbL2C1THg7fLQpjMDkcyLGvMeM8d97rz
	VMoJJw+JhOpx0aLLVd/qzAU3YIYovdazRc0BZ7P1tyr8ti8PmVW9+vIO8qLogLIVy3Xa0P9cMwjy2
	MjQPudYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAhh-00000004p0J-2ECD;
	Mon, 15 Sep 2025 15:01:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAhg-00000004ozp-0suG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 15:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XaOlF/AN2FazGCbmDk6JF3p53NVlVRqHIRd4HGYE/Jw=; b=QKIjTESjEGMef8nZ4V+ajSFkli
	KIStmI5TBLovuYBtBPU9Zqh+VaeygVFEkVrs2Nqgbl49JbAi+nWT8SxMtzbtPfeFsezYADYR2jiHR
	2Z0oVqmOa6BPsUEJJEyx1ahYuTshf8TShHZl+9+tEnPBm0C4Ho+nV6oZ4nqNiuuSfqiUKQJ3ajwAr
	bw8bBxW8bhlsDGYAPJv9U1tl00Ny0rUrffRpAnjEK3Kn5/xXmCu1w94ASU/at9UKATPl/q9hocwOm
	pUJrFhmEV99YzN/QYil1Boy3iZRLIV+zXwxSPiOyyZZpzq/xrbPaSUf5LlQALuHAJOX7ZdlIEce5x
	HHXinYMg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAhd-000000072dW-099q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 15:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38F6744316;
	Mon, 15 Sep 2025 15:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B2AC4CEF1;
	Mon, 15 Sep 2025 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757948471;
	bh=z0vvKjrNnbzohkI8G7KdLmDE1Sza+Ghgjl1k3I/cZus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4pyKPGlIG0QOHu7CV1l+6FD65J4tSTt9q76gucq+drVv8UquOGGHgWeHMlY34tFl
	 bf7UIFoIZZHAtNs2JSfUIJJ+lemNb0lJhhkJBQXghrUa3+2SA3wynWu3TMeLmTm7ea
	 XARLu959v0QcwDTVRiZeZGVpT8oK8pH6luSM1CaPQIyNoISCvvKAzl5XkXsPxTcYRv
	 lJKssGhU5jDjkqP8tm/ILybIZptGFBiquoA0o/xM4gK5y7yURzu7q1TUh+WEj89wfC
	 srs5mEOVaCI0wC8+W8DrEq/3g4jpoov4VABTijNuCKUu0ywgxhA4TfNl11w2JKvzJ6
	 +kv31KGcVF/9g==
Date: Mon, 15 Sep 2025 16:01:03 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Rob Herring <robh@kernel.org>, lee@kernel.org, jingoohan1@gmail.com,
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
	deller@gmx.de, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, sven@kernel.org,
	alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 13/15] backlight: rave-sp: Include <linux/of.h> and
 <linux/mod_devicetable.h>
Message-ID: <aMgqL-ZeSkICqRih@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-14-tzimmermann@suse.de>
 <CAL_JsqKSjQy8CVohbVL50kn=o_kPVUsAUFjYvNC3mpcA7pm_Og@mail.gmail.com>
 <26a9a762-23bc-4367-9cb3-c2b081d641c6@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26a9a762-23bc-4367-9cb3-c2b081d641c6@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_160113_485472_C2670D55 
X-CRM114-Status: GOOD (  19.83  )
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

On Wed, Jul 16, 2025 at 08:39:03AM +0200, Thomas Zimmermann wrote:
> Hi
>
> Am 15.07.25 um 15:34 schrieb Rob Herring:
> > On Tue, Jul 15, 2025 at 7:30 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > Include <linux/of.h> to declare struct device_node and include
> > > <linux/mod_devicetable.h> to declare struct of_device_id. Avoids
> > > dependency on backlight header to include it.
> > struct device_node should be opaque...
> >
> >          /*
> >           * If there is a phandle pointing to the device node we can
> >           * assume that another device will manage the status changes.
> >           * If not we make sure the backlight is in a consistent state.
> >           */
> >          if (!dev->of_node->phandle)
> >                  backlight_update_status(bd);
> >
> > Well, that is ugly. IMO, we should just drop the check. A DT built
> > with "-@" option will have phandle set, so that's not a reliable test.
>
> Not that I disagree, but fixing it is out of scope for this series.

This pattern appears in several places. It is used to guess whether
the initial state of the backlight should be on or off (which avoids
flickering artefacts during boot).

You won't get much argument from me about the ugliness either. However
this patch makes the presence of this logic more obvious rather than
less. On that basis I view it as moving in the right direction rather
than the wrong one and therefore:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

