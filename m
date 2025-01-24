Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6287BC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKwdTEzM5lSaWxcEJQL3dOATIOQEUYkzh3DpFXffH58=; b=n/Fq/wbzOu2P8ZAkTn+KavkKtz
	57n2zmI/D23ZlV64xkxwCDe1FCJxKFBk36cJ1MHLICrGWcl5n79XIhNo8z165ckP3lx6UvuZq3BhS
	eR7lznC0BDPlkw9Jz2pn5E4rcOghggMFWYoswDP4NuMFYsu6D7PTCeXI4mIeKnI+DEp936PavSNs6
	V6Y3LvgfBndcVKqCNLXdaCoVjsMSG8R773RBOZiX79S6XLMozNwVRNRhfiw/5NsQEPZyQIMJxLAph
	rqjHDRXenU9av9wj2Xp5H9agFFbn/j1Kiq8Wmst1K4ZyKyjhEyNqHmJrbYF2YmJZ4jrAsI9W5gqsp
	7fwALeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGbo-0000000EQnL-3Q7e;
	Fri, 24 Jan 2025 10:08:16 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGaQ-0000000EQgk-3dFA;
	Fri, 24 Jan 2025 10:06:52 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1737713208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GKwdTEzM5lSaWxcEJQL3dOATIOQEUYkzh3DpFXffH58=;
	b=TcGThC+GsdFJdZ4xP0tnYgTpMftKU8XSefORI5jxJhNQJJ4GvobaG+aC2S3tdNNGn8hrIJ
	x/Mdi7Eqe7IILPSprRDF6ERrdTwuod+ApSMBhCxcYb50PhnjwzF4YnuDCLoY/F/u0IG/+v
	5dxdcWnuPslFwrEH6o3YsCtYreBE3K23h1/WpoECGE/5t7wdWds6PqZXOPShJSffQ9b8gK
	iaKsB85Ul3uglAtYsTDyhbibr7X1azgjlsuPuSTDuWPTnR2ZZKjM4wgHqB2ME0LxZUcm7h
	7Udp5m5xw07iGmFXgwmHLG8EWdy/kR+i2OqaitqILv4u2cwZuD+JM6l8pqkbEg==
Date: Fri, 24 Jan 2025 11:06:47 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, devicetree@vger.kernel.org, Sebastian Reichel
 <sebastian.reichel@collabora.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding
 for rk3588
In-Reply-To: <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
Message-ID: <a76f315f023a3f8f5435e0681119b4eb@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_020651_209739_AA739469 
X-CRM114-Status: GOOD (  22.10  )
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

Hello Alexey,

On 2025-01-24 09:33, Alexey Charkov wrote:
> On Fri, Jan 24, 2025 at 9:26 AM Alexander Shiyan
> <eagle.alexander923@gmail.com> wrote:
>> 
>> There is no pinctrl "gpio" and "otpout" (probably designed as 
>> "output")
>> handling in the tsadc driver.
>> Let's use proper binding "default" and "sleep".
> 
> This looks reasonable, however I've tried it on my Radxa Rock 5C and
> the driver still doesn't claim GPIO0 RK_PA1 even with this change. As
> a result, a simulated thermal runaway condition (I've changed the
> tshut temperature to 65000 and tshut mode to 1) doesn't trigger a PMIC
> reset, even though a direct `gpioset 0 1=0` does.
> 
> Are any additional changes needed to the driver itself?

I've been digging through this patch the whole TSADC/OTP thing in the
last couple of hours, and AFAIK some parts of the upstream driver are
still missing, in comparison with the downstream driver.

I've got some small suggestions for the patch itself, but the issue
you observed is obviously of higher priority, and I've singled it out
as well while digging through the code.

Could you, please, try the patch below quickly, to see is it going to
fix the issue you observed?  I've got some "IRL stuff" to take care of
today, so I can't test it myself, and it would be great to know is it
the right path to the proper fix.

diff --git i/drivers/thermal/rockchip_thermal.c 
w/drivers/thermal/rockchip_thermal.c
index f551df48eef9..62f0e14a8d98 100644
--- i/drivers/thermal/rockchip_thermal.c
+++ w/drivers/thermal/rockchip_thermal.c
@@ -1568,6 +1568,11 @@ static int rockchip_thermal_probe(struct 
platform_device *pdev)
         thermal->chip->initialize(thermal->grf, thermal->regs,
                                   thermal->tshut_polarity);

+       if (thermal->tshut_mode == TSHUT_MODE_GPIO)
+               pinctrl_select_default_state(dev);
+       else
+               pinctrl_select_sleep_state(dev);
+
         for (i = 0; i < thermal->chip->chn_num; i++) {
                 error = rockchip_thermal_register_sensor(pdev, thermal,
                                                 &thermal->sensors[i],

If you could test it, please, it would be great, and I'd prepare the
proper patch tomorrow or so.

