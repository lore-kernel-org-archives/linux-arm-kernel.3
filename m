Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEFFCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0i6RikQC6DfYiiM+/GamuDmLEyTAbg8j3Lwj+lkcTk=; b=XZj9UIdvAerQARaIbSVAtT6IUI
	QORhRJBddHTMYODhblqqtTgrRLm7cnsKCLEprNTpCercsQ8IcLlf6j2Gk+i0hwvxZHsFgljdMA9b6
	egZozyj0syCVdDgBWKNjGKv7XtNi7Z9rbRBCyuI/5BoKIf20wSN/ZCVBGomlj/e1YpAU6+B676bCH
	5bRPYQv9doXR5BMPzxYG7BSIWWwj6jBwS/aBpq1TpNx+iyvKD/MRFo1+oExKFLyytPDVOaEAn5TvQ
	hh0i7EZwADq/l9AqsGI6rkZMoILTsM7JwRQTh7rhySzn7Tr24BVZFNr7e+xvy/Kx9LSYJY4skq9bh
	ETKv3kJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAi9-00000004p6R-0XR6;
	Mon, 15 Sep 2025 15:01:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAi6-00000004p5Y-3DQL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 15:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6428F4199B;
	Mon, 15 Sep 2025 15:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C476C4CEF5;
	Mon, 15 Sep 2025 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757948502;
	bh=+0i6RikQC6DfYiiM+/GamuDmLEyTAbg8j3Lwj+lkcTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqJlOyb4u8dmfEH9xbldImMZRZQ85dwUmfhkUuUpDfbyva9VqHjaKc9MzztA4vVki
	 chZ5OqV3dwxrwhKpmvTDOSImagN1Tf3y0+7WlysTXgEvoZfSeLj7zNrHhLNiuT1j3x
	 hKnV+LPaPhzZOPSKiNjeiSVvJ0KSUy/DVXv/8Ssufa41BQ/As2e95mbdUK03jNGcrJ
	 Fj5/t8PAhN2sh/02gINWNH5uMVELU3JzuvwIGaJ6dAjkKEL6RO4JHS72gkNgDttyKy
	 Y4H7YfB6t0zKhB3+UXTF3Cq/bc6r3+aCXy3TZ9v94cZLfoEkal70A2i3um88KDlvb6
	 YXwK5kFAnLIvA==
Date: Mon, 15 Sep 2025 16:01:35 +0100
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
Subject: Re: [PATCH v2 14/15] backlight: rt4831: Include
 <linux/mod_devicetable.h>
Message-ID: <aMgqT8crih7S79Oj@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-15-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-15-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_080142_821243_CB118ED3 
X-CRM114-Status: UNSURE (   7.62  )
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

On Tue, Jul 15, 2025 at 02:24:51PM +0200, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> to declare struct of_device_id.
> Avoids dependency on backlight header to include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

