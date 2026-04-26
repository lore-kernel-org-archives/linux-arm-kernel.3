Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27CCFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 09:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QT/EFaL4fcCqqsu06HNkALgIVcLkVsgdWHpd2+shATA=; b=2upuqGugayOgOPXjYEO1HAbddj
	SXo5xWD6hF1QCSln8DnioIOqHARz493PIRM1I2hlheGfxJGy6D2g++D2kjcJWCY2k5ecw1F4KwX1K
	aXErcX5AzoI/TS18U2goxu8+TuiRgfrn6FsPJi2loSPs2n0MBPUkOsUG1RJHTlZBgffvNOStk+cWb
	5/Ko2tBtEwMkecC55NTAYo5zCWrnf1xnHuVGDpwhqbS3ugH03+vvacGviBM6mSfipLoV9txplx1hB
	xJS5kD/0Omao9S0ajWPgYky9flMwGGfD4RjqK0d/X2G1BnB8cGDMCQBpwtHFCjx4zyzBWsSSoHO1U
	/fCRg0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGw2s-0000000FPL7-2w2k;
	Sun, 26 Apr 2026 09:44:58 +0000
Received: from mail-m1022.netease.com ([154.81.10.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGw2o-0000000FPKe-3N0o;
	Sun, 26 Apr 2026 09:44:56 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c2b50084;
	Sun, 26 Apr 2026 17:44:46 +0800 (GMT+08:00)
Message-ID: <4592b323-bebd-4242-ae31-892a51b5b3be@rock-chips.com>
Date: Sun, 26 Apr 2026 17:44:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] pwm: Add rockchip PWMv4 driver
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>
Cc: kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
 <20260420-rk3576-pwm-v5-3-ae7cfbbe5427@collabora.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260420-rk3576-pwm-v5-3-ae7cfbbe5427@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9dc92d5ac103a3kunmad79455f144c6e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ0gZSlZMHU8aT0pIGh
	8dQx9WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=CJLx/i7y6XIEhYYkK+bcgbOZWb7NOyQLgyDPGnFicFerhHIaBNhya23FTvMhF0ELqg0hwYPcLAE8ijcflb+VnzUyvdw1e702NyfyYnKk08xcMHFVZIbWrDHosDGHV59BmABw2a+DV9+1R2xtfFph6z2yjW0VDJnk4GjdMRUUAas=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=QT/EFaL4fcCqqsu06HNkALgIVcLkVsgdWHpd2+shATA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_024455_384009_5648F6E8 
X-CRM114-Status: GOOD (  11.26  )
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

Hi Nicolas,

On 4/20/2026 9:52 PM, Nicolas Frattaroli wrote:
> The Rockchip RK3576 brings with it a new PWM IP, in downstream code
> referred to as "v4". This new IP is different enough from the previous
> Rockchip IP that I felt it necessary to add a new driver for it, instead
> of shoehorning it in the old one.
> 
> Add this new driver, based on the PWM core's waveform APIs. Its platform
> device is registered by the parent mfpwm driver, from which it also
> receives a little platform data struct, so that mfpwm can guarantee that
> all the platform device drivers spread across different subsystems for
> this specific hardware IP do not interfere with each other.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Damon Ding <damon.ding@rock-chips.com>

The continuous mode of all PWM channels has been preliminarily tested
and verified working on the RK3576 IoT board.

I have tested with several typical period and duty cycle configurations.

Following Uwe's suggestion [0], I also tested with libpwm using commands
similar to the following:

./pwmset -c 0 -p 0 -P 1000000 -D 500000 -s 5000

I was previously unaware of the existence of libpwm. I will continue to 
follow its upstream development and updates going forward. :-)

Best regards,
Damon

[0]https://lore.kernel.org/all/fgu42esufq2x4fcccncqs3hlotih2gqmws5atotlaznuahoslw@34vblr6vboze/

