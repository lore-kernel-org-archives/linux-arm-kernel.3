Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1B1CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fijvjhapfoEhEf+4wD4kYLOXf7zvrs6V5pFZuPl92ek=; b=xxxWgpa09aVkn86rEoI9+RLJ41
	UEyV3XIZ5FfWjeohaivSV4tiVxGosh+kxNXOky93CO5expa2nrfddEYC4ZR/K08A86GSiqDLvurHg
	PxG0bGlqOnO5WBDtRLQvhldaTN12tSMjNYHatjS91CGZpW9pj97QyL6fLVt+PzJYpApGO4pCg5qHT
	fZRVTazSDGV7gXJzNh5whGG0dOGmbMKZwPS2RQvv+WTz2PO+TR/nhr1CzpP/f1Gzh4SW1wWv9BioI
	4Gan6ghA7pS5vKNYIPfyeUrp2HfrS13kMkIrCMihfxWKtmAofnN9wvTjsqKn7c2Elm++ww/4Cj2rI
	5jW3vIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKBt-0000000EiVT-4C76;
	Sun, 04 Oct 2026 11:15:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKBs-0000000EiUw-2AsB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 11:15:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92E2960210;
	Sun,  4 Oct 2026 11:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6191F00893;
	Sun,  4 Oct 2026 11:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791112535;
	bh=fijvjhapfoEhEf+4wD4kYLOXf7zvrs6V5pFZuPl92ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RsSUnbjW1qWUpBj3emsjmBAQhKGCkFahGHCMAUEwLF5wcB/p/NAaOvsqFioFEUjht
	 TZ2AAIMk7DWIpVelszsYsFsxDXpnnSYhJwDESSlSOYv77Ac97Fv2go/m04vVlcKvy1
	 zpmP50o5HW5Gz1a3v1kx9zyI8QA5lvuxwlpMXhcmso0Zz2Jdcj/A7cTDC6i3dOVkmr
	 JlVN4YOOEmS5OBrgMVWXFR8/hArTxTYsN2CqxbMC3Bz4+zlqpafYxACHIj2J6p9YUA
	 WNWAGUXcFhY+/qw9e5yILWOXX8oDit6cy2SaieN/4S0GCQjykkDib40KbXlo5tGrQq
	 mXfz/skjmJl3A==
Date: Sun, 4 Oct 2026 13:15:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: dts: OMAP updates for v7.4
Message-ID: <20261004-illustrious-bipedal-weasel-5ce5db@quoll>
References: <7ha4p1b7lw.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7ha4p1b7lw.fsf@baylibre.com>
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

On Mon, Sep 28, 2026 at 10:36:59AM -0700, Kevin Hilman wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.4/dt-signed
> 
> for you to fetch changes up to c3037b5c7c38bdf78c214e7dbe513a553ce8f47b:
> 
>   ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_mpu voltage (2026-09-21 09:02:20 -0700)
> 
> ----------------------------------------------------------------
> ARM: dts: OMAP updates for v7.4
> - am335x-bonegreen-eco: Enable 1GHz OPP
> - clock fixes for camera sensors
> - misc cleanups, DT fallbacks, schema updates
> 

Thanks, applied

Best regards,
Krzysztof


