Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B507E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 23:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=368DqfZnKYxPLB7xKnUQdGYH96HHRu0CaoIOkS3Mix0=; b=Y38kB9gh2HbqEUkLpWUN/gVleZ
	qvNfkvC0SXjixNMOi27q27P2G94ImKlUDLrDs0GIOJlbPuZxFgevNpIVCuSt5DkpRsvfoD4uP1kMo
	eH06wXj8wwuvmnHuCUPiInnrma3U5hoyk+twZy62kAXd2dOO/dwebKeRuxQ2uKuTndCKasCxGl1Ze
	zmkoAiUtERDZmUZGAOh1sqTC0K5j1JpRI2yyJxIrYRjMEjk7Ft0aM7hrAMmXMcZemaO8PaYD5+Ejy
	lK5DYydus0CLslhuH+0ohEVz0V+GIftT6xiEA1bOJX4SKPba3trcC8gb2+lXydJAfkLxp4oNkeLZE
	8NUA9cMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQxWD-0000000Gf7V-0Gpv;
	Thu, 26 Dec 2024 23:43:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQxUg-0000000GeuB-3i53
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 23:42:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3EAB2A40F35;
	Thu, 26 Dec 2024 23:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48671C4CED1;
	Thu, 26 Dec 2024 23:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735256537;
	bh=OL0Vc85gaSAOyZE96hHWhX8ZEbETAzA+wIIp30AqWTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjW2V2Q60PIulbUBvf6RWeEBKI4VmoeK+KMXIi5xknU8e5sS8VYq5si5d/AVWxjHU
	 GnTKH+Cu99lAjtNicU57V2buh5hGrGCBw0MlDU4PI4J8kT/ho7JFbGJaayF2XB/yDU
	 C9YDmSKsLvr/HHUGP2ur+w8xLwptYLpj3trjMWkkuBFpmop1hjHBu+ftWRf/Cy6dAx
	 3AnK7sNtPM5NrH814Tc/VEWeeg8wl0ITIbjhTKt8oeDhKV9nPAB61IDDwHXTnIfZYk
	 OnXhCYCLONn24DEb7YoVwmFjtyLiHcpm7s/pvWZXvSUiG5K0Eh1LbgEWStutbDF+fO
	 pV7VP/jT9BaXg==
Date: Fri, 27 Dec 2024 00:42:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/3] i2c: davinci: order includes alphabetically
Message-ID: <jao47cv5ns53jrs7vvaz2ysqkz4mnc3n4tgbln5wwlijoeubf7@vx7i7zl3tfiz>
References: <20241211102337.37956-1-brgl@bgdev.pl>
 <20241211102337.37956-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211102337.37956-2-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_154218_987187_1118D372 
X-CRM114-Status: UNSURE (   6.62  )
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

Hi Bartosz,

On Wed, Dec 11, 2024 at 11:23:36AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> For better readability order included headers alphabetically.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

