Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E933ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZNBEQC/8mpEzL4wmbNqb3FPh6BDDrGddIBOowgnbp0=; b=1nTHfJrzPqLf/SVOzslXxYmG4h
	g24z/o0PudrefHAqFR9/Y1ST9ldHLjzBrV47ooWjUI4P29F9alVMOHW9bcCGAqymwIY4G1mstlgC2
	7VVO7Jah7ZVI2qdgmBeqBpAp7g5UTjB67KGPQOUbi8u28dIFAlnpRpg+InqICAzC1lIt1dgh41asT
	QUQdIpa6uApZkIxmpHCEmKwxn1Fyf2QHZmntIK41f1h35baflqcASKYfv3PbiNnaDwAPbGQSpsvyY
	kQwQd5cNeJvnabj48CxLiEXcAUkl/6tMIkrDr96+aAics22pvEFl3NRIC0BnWrXmvzC6p54vDi9fL
	slwm7rmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAW3-00000004m14-3baL;
	Mon, 15 Sep 2025 14:49:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAW0-00000004lzl-4681
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:49:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A80F43D2C;
	Mon, 15 Sep 2025 14:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDF4C4CEF1;
	Mon, 15 Sep 2025 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947752;
	bh=1ZNBEQC/8mpEzL4wmbNqb3FPh6BDDrGddIBOowgnbp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uw/e9d7/kGCAran4GK0T6S0xU0+gS6A944ToJDHNMIGJHn9PAIUYlRLUTSxIVOfds
	 7Zg/ChGsYEhAkzyT5nSAUbVpCVYjQBFUKOfgeLKSV4N4bztiHb1bilnrmZTPRI/3TK
	 RkmBLTwNY3a0Hw2KLJXnijdTvniaBGMZCcmi+dkzPorZH1WeKe/DrYVfSPAqNMl8or
	 fBxrz5KZ6PHUSBWsBb5ugQkgS0SLEE8uz6pxcTfza21YdBAjbODqepbdm/x7ec5djr
	 QZrPWDpqCBt/X9jxoPp8PXB3ToP50q98GQ535zG0XIPPNyEtu27jdNz0HjJScGHOKs
	 5yZyB3qr0jtHw==
Date: Mon, 15 Sep 2025 15:49:04 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com, deller@gmx.de,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, fnkl.kernel@gmail.com,
	j@jannau.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	sven@kernel.org, alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v2 07/15] backlight: apple_dwi_bl: Include
 <linux/mod_devicetable.h>
Message-ID: <aMgnYFWzXLUKUG-w@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-8-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_074913_032009_169AD659 
X-CRM114-Status: UNSURE (   7.64  )
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

On Tue, Jul 15, 2025 at 02:24:44PM +0200, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> to declare struct of_device_id.
> Avoids dependency on backlight header to include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>

