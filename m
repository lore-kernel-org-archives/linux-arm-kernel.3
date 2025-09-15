Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C88CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2NxZp55bh/g4Bpl7yA/2C+cFMjRxak3v0321vSLHbs=; b=B1N4NgdM4oIjrzHcRxVAJAXQ5q
	rINKfUDmIwiB7Kax1R9iuDuMqcMHGjkpXYpOWQ6oCJLQn49A29wv5Oaf9qtodegY8r9/xnbqmzkL2
	5Sxk1XbeCUStUCamBEuWDsOWk0E5Vzjh9qzRsEdXRAuBbEduH4JKVM2gC6QUolzCL3Fflf026q0ay
	RpqUMb0EZWRu8m17AUs0NCudISLDGz83l1VhXU9FVZP4rpqG5TvdCp38Fl2w81nLMQERwxoVW/VFe
	j308ALfNsmH690jspFLzV1RIKTgQ4XSyhRh9rsrOHBtuWxZPiFjsLd87UQXy1PEvuWhQ9Cb0BB6Vn
	o3qu/MlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAYa-00000004mjL-1scQ;
	Mon, 15 Sep 2025 14:51:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAYa-00000004miq-09oj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AC376025C;
	Mon, 15 Sep 2025 14:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3908C4CEF1;
	Mon, 15 Sep 2025 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947911;
	bh=U2NxZp55bh/g4Bpl7yA/2C+cFMjRxak3v0321vSLHbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQz8ZlBG3AUGf1039ykzz5ukRMehIllHrqWRuHJxYUKbJ9RLtOto2t3ViKa3rEvlT
	 5Y7C0jHirt0PXvxH/soZWDWKfjtZwIHJCPym0Z3MgJLvkXfLrqbLI5X0csa5hJVrm+
	 SnHLBwqrepxZMFOPaHWc5Pz+v1RBgunZ/GG4slP+87wubUyDfx+UCZQWLqMpd3ppkC
	 1Y1UpB5KVBhb8UX+JiD5DiBVKx6KDVDLf5iORr71lLvj9zW+OS2BTkDGIxaWU6DSKY
	 mIkvFOsOTPoRMnyyyC/hxWpmRaD2d3B1R+B1ZLP5insPotIx6scq8wrcYh2TRODifi
	 wkRUEu+4ullHg==
Date: Mon, 15 Sep 2025 15:51:44 +0100
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
Subject: Re: [PATCH v2 10/15] backlight: jornada720: Include <linux/io.h>
Message-ID: <aMgoABOReK7j6QuP@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-11-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-11-tzimmermann@suse.de>
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

On Tue, Jul 15, 2025 at 02:24:47PM +0200, Thomas Zimmermann wrote:
> Include <linux/io.h> to declare IOMEM(). Avoids dependency on
> backlight header to include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

