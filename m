Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B8FCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejwjh+o9jhqSuKD2cvYC1v+KSfWdk48xui83j0dafTw=; b=DaXmMOW4BOz2jZwGVhSN9C3IdF
	zzwqUnbliQim408W/+DxiZJKrD/sOS4heaRxLWQdwWMQswhFUS42p+KgVN9Ou3TT1tmSeABYfEK5M
	RQyewSQ/S8sQIlYZnft3V/RfAPITEzN69gqoXKop66LhNqm1c6olSNXNdl/PwClvH7buVUccRWdoX
	2N8UnS/MnyDPUj406doAV5Iap1uj55I39CIAoWxOmiyqkvHIJM8GHFtTth96xAaFgzOvchQGthNz0
	4fTLA7FgtyS0PngcfHLefsOLFIhoxtuHdwexNP8b7Y9F98D/E4WbURRwHCThcc+VsiYtlLzlav4Wj
	WGeGRFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHP9-0000000BubB-0Fyw;
	Tue, 04 Nov 2025 13:48:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHP6-0000000Bua2-2jKG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81BC144653;
	Tue,  4 Nov 2025 13:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF5EC16AAE;
	Tue,  4 Nov 2025 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762264135;
	bh=XTcyrwzPPbVxt4yuu5PoJh4o4WAUu8sxpeKAaaI1rDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtKUpd2fIKsw34pBrwJf/Us5+LnHw/xOgSmgF4qrWbXdaGcAYvp4zofJlRz2zf15P
	 sFyWewjCvdqgVw8xJXDa+0Qp0SMQqmuQW/ZKe1+GibtuNJTdR8oF8jY28tshkEtGHV
	 NZ77E/rLfSsm0ji9CwHQMxQBq0pYQuhLK9rDnwHoUqFV6NGRIqfNOsNhx536/KX/g7
	 8mzyqsl2l1g5j9KF3GRLrfjJZClj+s5wmxoeKbge3+l2hsLLSZ3uAKl4yE2nqE0Sle
	 a6Ox9Ha08hKFdeVDqmrYkBIHW7e4AE+CMJRKBw/SnVercsa90kpMeSKWeGRAdKez1f
	 Gu0h1nsYFhetw==
Date: Tue, 4 Nov 2025 08:48:53 -0500
From: Sasha Levin <sashal@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 6.17-5.4] ASoC: pxa: add GPIOLIB_LEGACY dependency
Message-ID: <aQoERYOC4JY57P66@laps>
References: <20251025160905.3857885-1-sashal@kernel.org>
 <20251025160905.3857885-71-sashal@kernel.org>
 <eeb6d1ab-e8ec-48dd-b8f0-0de3eaf545a6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eeb6d1ab-e8ec-48dd-b8f0-0de3eaf545a6@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_054856_713018_BF7ADFAA 
X-CRM114-Status: GOOD (  12.50  )
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

On Mon, Oct 27, 2025 at 10:23:35AM +0100, Arnd Bergmann wrote:
>On Sat, Oct 25, 2025, at 17:55, Sasha Levin wrote:
>>
>> LLM Generated explanations, may be completely bogus:
>>
>> YES
>
>It is indeed bogus.
>
>> Rationale
>> - Fixes a real build failure during COMPILE_TEST when legacy GPIO APIs
>>   are disabled. The failure stems from `gpio_request_one()` in the PXA
>>   AC97 support code: `sound/arm/pxa2xx-ac97-lib.c:374` uses legacy GPIO
>>   (gpio_request_one/`GPIOF_OUT_INIT_HIGH`). When `GPIOLIB_LEGACY` is not
>>   enabled, these legacy interfaces are not available, leading to the
>>   implicit declaration error cited in the commit message.
>
>The build error would only happen after we make GPIOLIB_LEGACY optional,
>but in 6.17 it is still always-enabled.
>
>>
>> Notes on applicability
>> - This backport is most relevant to stable series that already have the
>>   `GPIOLIB_LEGACY` split. Older stable trees that predate
>>   `GPIOLIB_LEGACY` either won’t need this change (no build break) or may
>>   require adjusting the dependency accordingly.
>
>On older kernels, this would actively break configurations that need
>the symbols.

Dropped, thanks!

-- 
Thanks,
Sasha

