Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAFBE6B253
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxpPEhpTuus5zpDuVHoYLWnmHpT26Bi4kxaWAvzhOiI=; b=CdLPvKDJxRbu6mC/W+vCYGcfGk
	hwlFpz9zTzoNfVA2tHwOxtv0RYiPyL7hdGgOylzxJJ9a9w5fuq/DOTzkQ19AGHaHDI0E0eBLmYdPC
	kAWi/W0lObB84K2+MCFvu6n9RMoLe/BVnUFQnHIU7o7X9QPROZKiVX+O86qjwK3qbmiYfXzGnafVc
	CtGu2UxGeP51RfAQbaqki1cvso47fLYlk+VWwgAU20Xqnlj+v/FUmE73RxqDfTTWy84NwxcCLG7sb
	yGKX+MMDC6KfF0t9KAf4b3y4L28U8VE4TavilT/RecmkF13TWENmJiDJ3QfSQyoGgs4vFuUQJti5W
	KltsM4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qrs-000000073Ha-1nY8;
	Fri, 01 Nov 2024 12:35:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qOi-00000006rVQ-0fyM;
	Fri, 01 Nov 2024 12:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730462695;
	bh=VUpg8swfaMH8KH/YYd4yjICcXgkMLBMqp0RubHiLe2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8kGI6/OGf9VC0m9ypPCHAgD5grp8peLL1jVHBsKMKcQUcN/w1MyDpUQY5TngyiuY
	 SucTeTCT8+2RkPrpgp8k7dEipBeaEWF98mOy4iG6iP3vfIxvI28XhvJ7o/ChVp3H19
	 21n4VMIeO+z4mcyVF3/476PbEfeHQBb7RFqs2XeHru0kW6p+OqyQaVY8OHvi0unIIy
	 pvIDS4tBcJePoA9cHV1VgnOhQ6MU/6xMDc2S9EVnxfvbG+KzfKrTmsPnKHfJq6yTjJ
	 1XpH7imWfxuJOaz76QdRScHfYdOyYPqsR9zYrnAca0hj4SMYQS3Ei6QPaIfIYcqJbr
	 PtQg4h8JEmMPg==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7E7717E1574;
	Fri,  1 Nov 2024 13:04:53 +0100 (CET)
Date: Fri, 1 Nov 2024 08:04:51 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Shuah Khan <shuah@kernel.org>, kernel@collabora.com,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Subject: Re: [PATCH RFC v2 3/5] pinctrl: mediatek: common: Expose more
 configurations to GPIO set_config
Message-ID: <4ed22f25-ad10-461c-be68-8472590db44d@notapiano>
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-3-040d748840bb@collabora.com>
 <CAGXv+5H9OTCn033yoi6oxxRKG1G=vbrBK+aw+ZWwGPWbn=uWuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5H9OTCn033yoi6oxxRKG1G=vbrBK+aw+ZWwGPWbn=uWuA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_050500_429176_9A0F398B 
X-CRM114-Status: GOOD (  17.92  )
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

On Fri, Nov 01, 2024 at 03:54:58PM +0800, Chen-Yu Tsai wrote:
> On Sat, Oct 26, 2024 at 5:16 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > Currently the set_config callback in the gpio_chip registered by the
> > pinctrl-mtk-common driver only supports configuring a single parameter
> > on specific pins (the input debounce of the EINT controller, on pins
> > that support it), even though many other configurations are already
> > implemented and available through the pinctrl API for configuration of
> > pins by the Devicetree and other drivers.
> >
> > Expose all configurations currently implemented through the GPIO API so
> > they can also be set from userspace, which is particularly useful to
> > allow testing them from userspace.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

> 
> Missing signed-off-by?

Huh, I don't know how the pre-send checks didn't catch it, will take a look,
thanks for pointing it out! I've added the SoB above so it can
still be merged if no further versions are required.

Thanks,
Nícolas

