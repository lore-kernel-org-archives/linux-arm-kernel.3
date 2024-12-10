Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F44E77183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 23:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTBNI+/X0hqMp+wiWSZrGDN3HHRyBoh0U7yQfak30Ek=; b=hGFkR3/ek9KmveZNL3UkK+seHw
	0CtEbMXqk6gQPRwNeInXg2hGsH5fCwf6ikf1MuMZVyIVhhNVh4cqdKjKaH7KOwTMvFG3iTS+Q+ANV
	NdETdyf8VdTRFs4iCrAsDUVL7m1zVNZXmGTpiMFvVkY5LpOv6XCueZz2M2OKKu4IRQuRLpqxrTv9y
	rhq2HT73BCafHjGH3K2z5Pg3gjghrv1j9slOegDIBDa/0GIbPh+BBk7SU2UZbZl2++0G/uEk4xnTn
	P4nCk2Offu1KvXnUJbsuIfLKsEAQ5zvEu8O35WkwAwf4GUOEaI7ZShPscu0hNnNwN/ntb7B8ncJOj
	x6Q90b5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9WL-0000000D9OR-069F;
	Tue, 10 Dec 2024 23:20:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9Uo-0000000D8kZ-05NG;
	Tue, 10 Dec 2024 23:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733872703;
	bh=2xopEnnq5/pPO8ebcQ2iA7v0L/YlJ7nHPQG7P9WTTEk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=EZsp/FYRIFSmUXEd2TZUjJHZYAZKXEk2H2eiauaA0UN8wgqFeaCBYlQWGoSEpQnD7
	 jFdNMcnVS6J7H5pUohRFkpVLEQ3EReBmUlNwzAusaBjaYdyLNuZCWTNBgyM3VIq0Z8
	 S19sh8M7d4kWUgDkqyOWx+khUgj4v2HjctQeWzq4l20nLNfx3UKplW1DPBlbhw7QGD
	 v3DW2aS/3Xy+tUXoANx3jX/1fWYreKuRbMQy7a3yyQrinMdlewtfJG1VvhnHRjkQNZ
	 ysMuhjr/vY3P1KqZSsSCTcGJJ01iIKq60GEsMS3pPaLnC5+VULo9xk5YO8yQLcklB/
	 3LYr+AHwfXYbQ==
Received: from [192.168.1.90] (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DDF7317E0B54;
	Wed, 11 Dec 2024 00:18:22 +0100 (CET)
Message-ID: <b15c0a3b-36dc-49f8-9dfc-4bac5beece9a@collabora.com>
Date: Wed, 11 Dec 2024 01:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add support for HDMI1 output on RK3588 SoC
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241207-rk3588-hdmi1-v1-0-ca3a99b46a40@collabora.com>
Content-Language: en-US
In-Reply-To: <20241207-rk3588-hdmi1-v1-0-ca3a99b46a40@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_151828_046570_00B4AF27 
X-CRM114-Status: UNSURE (   8.83  )
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

On 12/7/24 11:32 PM, Cristian Ciocaltea wrote:
> The patches provide the basic support to handle the second HDMI output
> port found on Rockchip RK3588 SoC.
> 
> For now I enabled it on Radxa ROCK 5B only, the board I've been using to
> validate this.

Please ignore this revision and use v2 [1] instead, as it fixes a pin 
conflict issue occurring when having CONFIG_SPI_ROCKCHIP_SFC enabled.

Thanks,
Cristian

[1] https://lore.kernel.org/all/20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com/

