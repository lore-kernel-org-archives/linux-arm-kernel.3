Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990A7CE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 18:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmLkhnUtlIFWR7yGqTqutMCpz/ZCKPyDidaM4P7NJJQ=; b=I+miJ/VGInfgny0Gvp+4EKOEEN
	NcRuhbuqEdITXhayPk2UuyrHbx49balD0BLttUbEMk8/u9QW0Fl/+G6Wxae058RK+yQ3KDXLqD2re
	ehmNUz/X47rGfty8xynus2Y92NWA3n7ucOtO0+jDk1SBM22FI6kiVbl8WlNvZAhx92phEz8Zm9Od1
	3MRMcKmqhn8Ej8qPq2In9YnMqh/um2UwDjhyZ5oLkSvJpPa1cfWnDm+LLmQGTPRI+1JQ50plWqs1u
	lUsiRjGjCixTTQRCcu4QqiKWQZfe+d4cyq23SBBEynHruCTTw+1UwMvfe1U5qcPQg6jqF+FXB6x2P
	9VumQTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42BO-00000001OpE-1nnf;
	Thu, 24 Oct 2024 18:03:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41v3-00000001Kpo-0P9d;
	Thu, 24 Oct 2024 17:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729792002;
	bh=W3VllNwtqRwVtIeBKaJd3C2VVqpPgbov///WpOSkPlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGdBVc4ASaPLaghvUgQ0DFhiGKTEDqIoVFn1+HyNer1j93XXc5Cz5BjgV87wgH0CQ
	 B6nsj1eITJ7aMAWhWuAC9FR3zsdafizu1HIG9qFgRpaqxZbx9bzt4byAUFw5Z2MyGQ
	 BbQxFkD3lxxVK9S1FqDJkKWKfCkVuL2nfVUjbNeCIS/bI5w3FVpYYMmV5+XbERHprI
	 DeTa7IdFS/rJb7Kz76JJ/ZL0wYH2NE/1/QvvYzshXNOe0vtqNyDyo2X3dFX1p8mH9D
	 de8N5I/jXKxhNl8NwmS3DALC8CeQif3oOJygSYXrzZs4IJ2uKPB9aRmPcdKHpF/3T8
	 u2h8mOoubrz6g==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 00C2F17E36B5;
	Thu, 24 Oct 2024 19:46:40 +0200 (CEST)
Date: Thu, 24 Oct 2024 13:46:38 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Shuah Khan <shuah@kernel.org>, kernel@collabora.com,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Subject: Re: [PATCH RFC 1/3] pinctrl: mediatek: paris: Expose more
 configurations to GPIO set_config
Message-ID: <a3d6b2b9-1379-4bab-a584-651ca66677ee@notapiano>
References: <20240909-kselftest-gpio-set-get-config-v1-0-16a065afc3c1@collabora.com>
 <20240909-kselftest-gpio-set-get-config-v1-1-16a065afc3c1@collabora.com>
 <01020191e0901d10-d427a5dd-af4e-4ecf-99e1-4bb051ad1475-000000@eu-west-1.amazonses.com>
 <8fdeec5c-5de7-44ae-9086-7930d02d610e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fdeec5c-5de7-44ae-9086-7930d02d610e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_104645_339630_1683E99B 
X-CRM114-Status: GOOD (  19.64  )
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

On Thu, Oct 24, 2024 at 05:17:05PM +0200, AngeloGioacchino Del Regno wrote:
> Il 11/09/24 12:10, AngeloGioacchino Del Regno ha scritto:
> > Il 09/09/24 20:37, Nícolas F. R. A. Prado ha scritto:
> > > Currently the set_config callback in the gpio_chip registered by the
> > > pinctrl_paris driver only supports PIN_CONFIG_INPUT_DEBOUNCE, despite
> > 
> > [...] only supports operations configuring the input debounce parameter
> > of the EINT controller and denies configuring params on the other AP GPIOs [...]
> > 
> > (reword as needed)
> > 
> > > many other configurations already being implemented and available
> > > through the pinctrl API for configuration of pins by the Devicetree and
> > > other drivers.
> > > 
> > > Expose all configurations currently implemented through the GPIO API so
> > > they can also be set from userspace, which is particularly useful to
> > > allow testing them from userspace.
> > > 
> > > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > ---
> > >   drivers/pinctrl/mediatek/pinctrl-paris.c | 20 ++++++++++----------
> > 
> > You can do the same for pinctrl-moore too, it's trivial.
> > 
> > Other than that, I agree about performing this change, as this may be useful
> > for more than just testing.
> > 
> 
> Nicolas, please don't forget to respin this patch.

I was hoping to get some feedback on the test itself as well, particularly from
Linus as the pinctrl maintainer, but it's also been a while so I'll send a v2
with the feedback here addressed.

Thanks,
Nícolas

