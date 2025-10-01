Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F34CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4RMHSI7e9md1Ls3UjWi5Kh6rVy5rfF+pdEJ5EKaAds=; b=bSEDFtJQHBj0r1WnJn77b0l83c
	FDJBeNO7Dn2BmJIPn6q775qQn98r7wk8/PWb4EKJZrV6iJohwFoOKdX5h5aPjhd+CizIp/GR0gbK3
	Z6Exu21lqyp76fCf53av0mEd0WCynAIxSaaMwVmCml43N7r77CD1ZHrb62Z5x32JQyTDwHWG9Jhsv
	iR1lG1SqSFnIovL+08cii5Nqmz6E8TfBjDHIBO9OBojrvmhf/mPjVl9vt252TJsBIELDKGrhOIWv/
	k2Ydu6A5mbAH635nLidskfbvHPnZoOc7Dk3liBARS7avCfQDt/rhxSnvTuliR78jmfn2BPWbA+S0S
	0NpL264A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3x7e-00000008499-1wUO;
	Wed, 01 Oct 2025 13:43:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3x7b-0000000848k-44Xc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56E1840326;
	Wed,  1 Oct 2025 13:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD183C4CEF4;
	Wed,  1 Oct 2025 13:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759326235;
	bh=YmUasciFTD3VpD/4siSJw5bG0HOrjO+PKhZbkV8qFZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JD4uthE2Rsh+qEXs6bIwdNbHH28S03NLE3YeLIr9LMR2OLYUtKYV9n/DL5uyZ+jw7
	 A6al/dMkwCdpvZrNwL9k1W51fGeaxcoeZy8EZi7wex82438FEf92cYf/WYvKbTSIGb
	 3P7KMqMWcHld7FSN1WQGX5/QB3KQFLCfoHihXZ34lZcUjnpL4ViRv7mYHn1t/+Xej/
	 7PEtMZ7SQc3spbLwT9ARPzdQ24f401iS1uF5chparAU5Sd56Gc76ga46EZT+lXFP0f
	 IATWexjuHSXee1lTgCifkNA3zrqgdGK2aGO9ZnqyKy8h3rDk4t9b1rYgnKwFszjDQJ
	 MPEe5UjGia+PA==
Date: Wed, 1 Oct 2025 14:43:48 +0100
From: Lee Jones <lee@kernel.org>
To: danielt@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com, deller@gmx.de,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, fnkl.kernel@gmail.com,
	j@jannau.net, ilpo.jarvinen@linux.intel.com, sven@kernel.org,
	alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, Hans de Goede <hansg@kernel.org>,
	duje@dujemihanovic.xyz, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/15] backlight: Do not include <linux/fb.h>
 in header file
Message-ID: <20251001134348.GT8757@google.com>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <175803873238.3892705.12154571803108246655.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175803873238.3892705.12154571803108246655.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_064356_030728_B0E14512 
X-CRM114-Status: GOOD (  13.04  )
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

On Tue, 16 Sep 2025, Lee Jones wrote:

> On Tue, 15 Jul 2025 14:24:37 +0200, Thomas Zimmermann wrote:
> > Remove the final dependencies on fbdev from the backlight subsystem.
> > This is really just the include of <linux/fb.h> in backlight, but it
> > has some fallout in other code.
> > 
> > Patches 1 to 14 fix all the implicit includes that come from fb.h
> > throughout the kernel. It's all trivial, but touches various drivers.
> > Maintainers are in CC. Patch 15 fixes the backlight header.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [06/15] backlight: Include <linux/of.h>
>         commit: b12224c28d84d054dfb680c05cda61d1e2584bf5
> [07/15] backlight: apple_dwi_bl: Include <linux/mod_devicetable.h>
>         commit: 945e411acde3800234d506f4304203a9b11890f8
> [08/15] backlight: as3711_bl: Include <linux/of.h>
>         commit: 6789cd935a57464deaacdd14c84bc026aa228e72
> [09/15] backlight: da9052_bl: Include <linux/mod_devicetable.h>
>         commit: e2e76f67bdbbc7b8df608e3dd1028059d838871e
> [10/15] backlight: jornada720: Include <linux/io.h>
>         commit: ce4bb1a2f1cbcd5f6471f74ee5c7e1443a4cfd84
> [11/15] backlight: ktd2801: Include <linux/mod_devicetable.h>
>         commit: 5f60004f152b432c6ae5dbacc172adc1fa215825
> [12/15] backlight: led_bl: Include <linux/of.h>
>         commit: b38ed7c05a35f3a029c2fc5e43a94aa81e2ac843
> [13/15] backlight: rave-sp: Include <linux/of.h> and <linux/mod_devicetable.h>
>         commit: 246da2b48e2ce973db255fc4b6faf42f73c03114
> [14/15] backlight: rt4831: Include <linux/mod_devicetable.h>
>         commit: ba3b29a639fe5173033914db6ee58d8d9bb86aba

> [15/15] backlight: Do not include <linux/fb.h> in header file
>         commit: 9f218f9bb9d274b9d5d48a4c95e1b199141fc1f2

I have removed this commit from Backlight, since it was causing too many
issues.  Please resubmit it once the merge-window is closed.

-- 
Lee Jones [李琼斯]

