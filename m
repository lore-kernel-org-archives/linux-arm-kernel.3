Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A676CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bma8GiY4yUzV27qSAWPGDFtL0k+HG+lI2FGJDZ+a/PQ=; b=Pa06677uCwjdtVB5fXdllYfg+M
	0lvG0geZ4ZCQe0+qm9HbvJINA/ALTgahtWW2j3tbRwALVmpyso2TmAkqpl2kNdYN4qHYNVRt1eoVZ
	KBsLRF26wRFtt1DV7kRDQE6UX/DCRjj55lTUJM3X2IDil1f6LAcgWOQjRcP5DHCAxn5+zYVEvzM/S
	D2hxPUg6kfu4Quqlt0F4dsa+lFklSJJ1NLcPp3UUBs8ZfAxVgoOXPjlVWT/ECNrdkUpsuz5RHk6+K
	sZITetlil4VItr5hSqTEZN8/a4HAGbL22lGzQLa5+Rmw53BhqQr03c5Akx9i5sHUN33gkwG/nF9tc
	8OxeLeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAY5-00000004mbi-0Tcb;
	Mon, 15 Sep 2025 14:51:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAY3-00000004max-2XDx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:51:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E525260244;
	Mon, 15 Sep 2025 14:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5688BC4CEF7;
	Mon, 15 Sep 2025 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947878;
	bh=bma8GiY4yUzV27qSAWPGDFtL0k+HG+lI2FGJDZ+a/PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lt8uy5TIMZvdWWoEVcsK6aGDdWEzGe8s7vVNvgTd8ZNu1QQjqO6SWmHCJ1Q6WbO5S
	 Gz9lbP7gQbJJwWUMmpaY0xDTSM4Ck5MC8Ubwx7/bLfG7TviNkhu7mdLPAY4/mBqYfH
	 3zvh1C4ulnfpd2PrkkGGiPXI7IBbH5HxfdD4DpPkHbPXXxjUIRiRaK1weTrIn7ujFN
	 mH4Sgv5RVTwD1jV8B/IKNs6JMrnLOEpj+9V62T06Vkwn6Diz1nHaBEjHmQT/JmtKiX
	 huJplgGSJNy+ewquR96QHCN2HVoGry4w+hsTnaqqpUDbXWHxUsu6H8sXECoENs8CUM
	 8sXhYcx0pEoEQ==
Date: Mon, 15 Sep 2025 15:51:11 +0100
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
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 09/15] backlight: da9052_bl: Include
 <linux/mod_devicetable.h>
Message-ID: <aMgn3zB9yigdlVrw@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-10-tzimmermann@suse.de>
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

On Tue, Jul 15, 2025 at 02:24:46PM +0200, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> to declare struct platform_device_id.
> Avoids dependency on backlight header to include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

