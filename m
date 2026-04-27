Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E593EFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URy40lWa+lQUJ0uoSDlws9H3+O7vKjCBby8w7d+mcdQ=; b=2IbbxTJMWFHA/+o4xPd6MG4mBF
	7FlXOqgy41OL6ZupvllIi0tTkQaaG9mEtdjrUmo4Jb5HxHPXdKMytgIlOzF5JkbmN+WH25POx784o
	Xsyru9RvBRUjY6GHo6/7lHrGG/BpzG+R6r13A/ffewyjGXUw8kW/EJ55DXraUVY+9uiH6GmzZXnHU
	dLoY0mQAWdWTIR5AikLkNX/0P+hBY7E/JOcYZ33QVFx0riUy4DJ769MfQVYd5YL4+XXDcQUKjISIr
	So1badtpnwMvMRh1nVSXJtCERtIrrJK0pm8AKKroT01mxNje1YIrOwOAYBQJsBkmMyujS0Hkku7+Y
	vetX9rTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIog-0000000GeZS-01o1;
	Mon, 27 Apr 2026 10:03:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIoe-0000000GeZ6-1mQB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:03:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2EAA43973;
	Mon, 27 Apr 2026 10:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F98FC19425;
	Mon, 27 Apr 2026 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777284227;
	bh=XYLE9TA0IWpeumy+gSbuXKXmhKHtKngemJgMUFhgkQM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LlCflqhkt+ULH/QWfcyI10bsms/b5DLgemMJvCYeVtxujGr4hly024vkJhZgFakjI
	 HTLTkC958B1q1NeO2kCzzFTPABDMwi0c5uvU6lHVo3ByZGJ5HjCb5TyZ9jhwjl1IMW
	 r89vGvgtwd0TwmblGFCSsJf5qr+2NkKDQSnefq4B/cuGeUXKwdULsLzYl7WnvthQWI
	 KutuIwfcMDJ0lcC5f/2S1N0V0lU6flfgLfQYO2gVZqfxEcfgiB7hGvU3Ed14eXCm/z
	 BEGCsbVdgQqdOcZ3EAjTPlMeeISj4rTpI8+z4SGm6lq71LzvkXKgieVz7GBG1iXMNg
	 ilW+2Zfm6n3zA==
Date: Mon, 27 Apr 2026 11:03:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Caio Morais <caiomorais@usp.br>
Cc: andy@kernel.org, dlechner@baylibre.com, michal.simek@amd.com,
 nuno.sa@analog.com, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 0/3]: fix unnecessary includes and add missing ones
 across multiple drivers
Message-ID: <20260427110337.32bfc6d3@jic23-huawei>
In-Reply-To: <20260426211834.3318306-1-caiomorais@usp.br>
References: <20260426211834.3318306-1-caiomorais@usp.br>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_030348_559533_1A250F60 
X-CRM114-Status: GOOD (  10.47  )
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

On Sun, 26 Apr 2026 18:17:59 -0300
Caio Morais <caiomorais@usp.br> wrote:

> From: Caio Morais <caiomorais@usp.br>
> 
> This series removes unnecessary includes and adds missing ones as reported
> by the include-what-you-use (IWYU) tool across different IIO drivers.

One series per driver.  Having a shared one for the core is fine but definitely
don't mix core and drivers. Tend to have entirely different sets of
reviewers!

J
> 
> Caio Morais (3):
>   iio: adc: xilinx-xadc: remove unnecessary includes and add missing
>     ones
>   iio: buffer: industrialio-triggered-buffer: fix includes with IWYU
>   iio: common: st_sensors: fix includes with IWYU
> 
>  drivers/iio/adc/xilinx-xadc-events.c               | 6 +++++-
>  drivers/iio/buffer/industrialio-triggered-buffer.c | 6 ++++--
>  drivers/iio/common/st_sensors/st_sensors_i2c.c     | 7 +++++--
>  drivers/iio/common/st_sensors/st_sensors_spi.c     | 9 +++++++--
>  4 files changed, 21 insertions(+), 7 deletions(-)
> 


