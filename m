Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC10CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isLYgistNjdaFJ+IvtazUqH5mG3/5S4jIQ9w4kszCSc=; b=oTLLUV6sjciZbeu8CYpnlFR2Hb
	cFyOco01T5zMcawNIH/IEk3a6l3Oc22V4ZEOn1h86OUnHXDxVvN2CwKADmoiLseTisr/k991aUtol
	M2vTHExASBoqIzKnBDSU8a9IL/kwANDi7cbWGLDHpDKd8UZrKGR9bA+PDbPeSg3hEohtNMQcDZYoH
	HWgrWf1kA8FOUP3wqIfhsGLrYg3tMnQM5YUYi4FBalthVMo3Yw4Eazv2AcUJglPp2vHZkL1/CCGJO
	5KzgOqCBmYx0vpveAETb7vIEZaQJ9CmqdvicRkWWQ3N/jQ5PJ+4ACimoOC0Jsl/9DLypv+bTA4i+0
	uwXZUIOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAUZ-00000004lgk-1f0a;
	Mon, 15 Sep 2025 14:47:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAUY-00000004lgQ-0JU6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 14:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=isLYgistNjdaFJ+IvtazUqH5mG3/5S4jIQ9w4kszCSc=; b=lN5ce+NnuMdg/3CAGx8BC0fTSc
	U7ZYbVcxrg9cZrNFbd6uONUCUhQU174UY63n7ds3k4i10jJGrmB2fS3HfApz79fS5Q9Jo0Iajl/Up
	pJGviBRuWb0AJ7N3QbULpD0InwNqpJZOsKqhx8ekHImfLVuI0RsbTVFaaDbD1N6FMNMh6DSd/FP7R
	7YBFa730rhhBjEkInyXHKv2UfBj478a1W5UU+7OnfB1VPaQeb8mLHyLs7kbZ+FgjR4e4XCZAVOali
	E1ryRITfSfLdU479IeAu5Mu0iQNsWAyAQLRfCXD6p3r/LGLvdlj3fFADr07w3X0Xq6Tg1LVF+hkif
	OE+8iJfw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAUU-000000072HK-3ioB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8BF240E87;
	Mon, 15 Sep 2025 14:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B8BC4CEF1;
	Mon, 15 Sep 2025 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947654;
	bh=isLYgistNjdaFJ+IvtazUqH5mG3/5S4jIQ9w4kszCSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4wlMhtjYAOghN/Bw6VK9WtBE24NGMCF8oPJ9UZHSrMfKsq0/B3OdwmPRJ5yz1sGa
	 OVjs4KV9tXx/GrndpwGtSpX48JUEtmtPKsZ5MbGv/LUPTizKZALqwjzGu68hOzB5ql
	 FzXbyT1kXtp13oCs381JOyrWuZsJoBQ1XLv0n8ABkubTTcZuuiM2AYOM0ViN4MerAQ
	 4VptVba9101kMNZ6kWvM9QXHn8hbA+JcFNVeucYKaF4NxAi5UCp3fD0SxzrBmMyZNx
	 xky7ydLOm6XZ+ESqYeA6gQ8Jr0QLzQJu1SEJOQ0Zj/U6soM2QrlUeKptugAFYg0kGa
	 6T1Qt47mcIgCw==
Date: Mon, 15 Sep 2025 15:47:27 +0100
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
Subject: Re: [PATCH v2 06/15] backlight: Include <linux/of.h>
Message-ID: <aMgm__4sUSKYxqDt@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-7-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_154739_182103_9D5517E2 
X-CRM114-Status: UNSURE (   7.95  )
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

On Tue, Jul 15, 2025 at 02:24:43PM +0200, Thomas Zimmermann wrote:
> Include <linux/of.h> to avoid dependency on backlight header to
> include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>

