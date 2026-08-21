Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A52C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 23:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBeQTJcCmTxIDyDVZ2wxVHaFWGBCccQSYczu6X2wyEk=; b=T7ysH4dtC4IKYdlKlfsFwB5CgG
	WAok0P/3L3i/i2C5k3ulWQmUN/nujba1MIsSRknzyXUDce8Xts848sfRfrHL0k+2Eq0CVUxrZatGv
	EHFxGFxvECu2XXL7+kpLP/ZxeNZflrAH+RSnZt31aoPugE2JQ7iWn3wsxbCNTpgvhaSrwGi0kTMYU
	Z0p9CZx2BMp0IngRXaHeu8rg6rBunHaHDCpEWzNRFR2/NhpfPT/Myu5VL9H7JG9aYFil2pQ71Mpgd
	u7XHrLIO/7R8VEM/q9TAW9SjUfpE+VHjuCVicLRh1gYujMwR6gWajwg7B8zvN/C3QQ+ea71PFr2Wa
	mcTIsG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYUT-0000000E9XS-0DSo;
	Fri, 21 Aug 2026 23:17:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYUS-0000000E9XI-1PnH;
	Fri, 21 Aug 2026 23:17:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F2C341797;
	Fri, 21 Aug 2026 23:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374381F000E9;
	Fri, 21 Aug 2026 23:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787354254;
	bh=qBeQTJcCmTxIDyDVZ2wxVHaFWGBCccQSYczu6X2wyEk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IJe2+ZflygN5/qQJs4Sul1DBia5fxrGgdQohUaB3jzKfnrtMSH4ZHvJhaeEsC5FVP
	 F1E0a2XXNtVJtP8mFfDhifzM5zU1zMSV7JRN1moBeLkXs6MRanagHOf/s95I6v0Y4M
	 bDC0o4EmIxgwX+lGwlfuQdIqDN7rmLsIVRufIZY+5Du8O7tkptIvawld1tmacSqyMz
	 1xPdrxhjB6xGH4rbDL/B1ci1KEkY1iNHbWZz5FwsSGsLriC+cdZIHwS1fTRCOL4q8s
	 aR6U1QB1NS2gKwcHjUT/0Bal6twKD0Wb2xbvKfitz4bUXm6v5gDLIgCiUYY/ETlWL8
	 oW3/lX/qP92xw==
Date: Sat, 22 Aug 2026 00:17:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: andy@kernel.org, dlechner@baylibre.com, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 nuno.sa@analog.com, sjg@chromium.org
Subject: Re: [PATCH] iio: adc: rockchip_saradc: Add support for RV1106
Message-ID: <20260822001728.32f706c5@jic23-huawei>
In-Reply-To: <20260816114544.35502-1-vlad@zlab.su>
References: <20260815022036.7c47585e@jic23-huawei>
	<20260816114544.35502-1-vlad@zlab.su>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 16 Aug 2026 14:45:44 +0300
Vladislav Leonov <vlad@zlab.su> wrote:

> Hi Jonathan,
> 
> Sent a separate patch for the dt-binding fix:
> 
>   https://lore.kernel.org/all/20260816113636.33635-1-vlad@zlab.su
> 
Just for completeness (as I replied to that just now)
please send them both as a series so all the info is easily available
to anyone looking at either part.

Thanks

Jonathan

> Regards,
> Vladislav


