Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0931FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbd5QSeJiJ2oALW1ofOnwmv8bCD3xrTufxIhysCOQ80=; b=0VYr+UEEXwpigU0C5VIXBlCqJy
	7ZpC+VhPMaxzdn0YrFum/j0y47TkICJ0XAs21SmFVxvOBaGuCp4jgPMKxbE0hyXXax0IBSzP18XSK
	aJVT7RSgnGAa1+TVfZ18xVGYZybxXm8r+S1KAlu37ifhfx2wQvfi9Vq2PvTxOv1cD+9A/HbhaofeA
	7/pZMC2zmC6HNJYxFHH+zB3QzNEF7uiMSH5RWzmZ676V6kHoBvLHGhcVLkOrF1SPmuNQJXlps0GY5
	OviW3uhQNRUxb9gIg5tsG5rbsqnPxzzNsgovfb5anIbJt9GdfVTIVG89djq8ULfGkSr/bWoSGELmI
	nCcsljfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrVi-0000000BNox-3ykO;
	Wed, 17 Sep 2025 12:43:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrVg-0000000BNn7-37J0;
	Wed, 17 Sep 2025 12:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758113022;
	bh=f/DltGKx9pSF+Vy+y1ZLxi8tkefLICe4HyQIufxy04w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S5ck+4lqyVEaw6X+IVc7RImLkxZ8jIdtgAFomf8EY48Pa3HILQXwxjm2TckX+mbq2
	 cHHNPX0nflnhiuiofgtcBE9AGsclKEeQ3ouWgagveQPH4K3UM8F9gTrwnqmIN9TpEh
	 +B7/jf8wIJRKJJIYlLX+dRMXbG/tJ+nKjGad/nPQn7J9DSZ5KGibQ0+3280T/qxSbn
	 0i92rWwjMgsmP/czMsd7UspUbcxOzms1s3z8ArVeA6+F9MYZYbl5UIynhuLsTRgbgK
	 LErt7RqYx3Bmjsl0QNBSxhdm24IggBRp4nRR/5JpT7GlenTB6GtUqDAt/tFP6jpgQJ
	 ZMuh1G+SA9u7g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3EF3B17E10D3;
	Wed, 17 Sep 2025 14:43:41 +0200 (CEST)
Message-ID: <4522baca-7262-457c-94d4-326b660aad97@collabora.com>
Date: Wed, 17 Sep 2025 14:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] drm/panthor: add no_clocks soc_data member for
 MT8196
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <20250917-mt8196-gpufreq-v3-9-c4ede4b4399e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250917-mt8196-gpufreq-v3-9-c4ede4b4399e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_054344_967350_69724A7D 
X-CRM114-Status: GOOD (  13.86  )
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

Il 17/09/25 14:22, Nicolas Frattaroli ha scritto:
> While panthor does not try to do anything untoward with the core clock
> outside of increasing its enable/disable count, the spirit of using DT
> to describe hardware, not what drivers need, informs us that on the
> MT8196, panthor should work without one, as the true owner of the clocks
> in this case is the performance-domain.
> 
> Add a boolean to the soc_data struct that tells panthor whether on any
> given SoC, it can leave even the core clock NULL. Set it to true for the
> MT8196 soc_data instance.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The only doubt that I have here is about the "no_clocks" name, as it may be read
as "number of clocks" ("no" is often used as "number").

I don't really have any better name to suggest though, and the execution is right,
so.....

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

