Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63844C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 01:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ep+oq+yHnM/WBMJtlCFUdAjPKEh0uJ3B/SDc5WqQzHc=; b=vwO5leokHiwwb5fmjJGRYbeVWo
	0y3AGijLkzr88hkNOMYoL7WoxG0AnCB42UAE7t0EYBuoc5OdoGacunF1rqKapJs7euP0DiIthuFr4
	aSwCph2mQFOaIY5yJ1r0yX6uSicaSHGDywE9NwBPftlcD//pHLckqa0raYm8LMcGJzqvuWyrIlWXa
	adiCqLeoCYZGfhoqUfo1SQ1IBM3634CJoyQxDouB6QGRMOWCsJv3326M/+akTbgxpii3U7661Oqto
	9pLr/Q+ksDwcrHaZX9R1YjULcsar6PhoBlMji6ZaYceHP/gq9jdcDPxmGLlDDbBzmq8Yc5o8nDWXw
	p0559vdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ZxQ-0000000DdWB-1TEC;
	Wed, 02 Sep 2026 01:40:08 +0000
Received: from mail-m9374.xmail.ntesmail.com ([103.126.93.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ZxM-0000000DdUd-22vD;
	Wed, 02 Sep 2026 01:40:07 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c2d816b7;
	Wed, 2 Sep 2026 09:39:53 +0800 (GMT+08:00)
Message-ID: <e419efae-da7c-4766-94f9-4021125bd218@rock-chips.com>
Date: Wed, 2 Sep 2026 09:39:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: onboard_dev: add the Rockchip rk1808
To: Rudi Heitbaum <rudi@heitbaum.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
Cc: Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <aouw7rH6FZxscUTO@0d3a7a881997> <5096877.GXAFRqVoOG@phil>
 <apFpPP1O45BWXDv5@5be1eda4e59e> <4512468.iIbC2pHGDl@diego>
 <apGMEsCwly8TCOww@5be1eda4e59e>
 <84A6832DFD4B9FF2+64806113-d65e-448a-b2c4-ee83e125a665@airkyi.com>
 <apa6PKthz_vMv3XP@649ea4ce1770>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <apa6PKthz_vMv3XP@649ea4ce1770>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa05fc5cbe003a7kunm6f9d1f9f758db1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGBkYVhpLHk8fSU9NH08ZSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LYgXzsjWBJSLWVrpHcoTEHvfZCqyfTpvw27cThFxaxfv+/JZTueYpbZ7RtZAe0igqtVGLYWwIfdFHuCP0pH+z174t6s/zFGIrI7SJ1nndbktJh45Uqe6I+fj5+rnAwMT1JHHn1sSvG04MNdmdzgpize/KSAEq/KwAM/rTahZuqQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ep+oq+yHnM/WBMJtlCFUdAjPKEh0uJ3B/SDc5WqQzHc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_184005_135316_C7D32C36 
X-CRM114-Status: GOOD (  24.09  )
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

Hello Rudi,

On 9/1/2026 7:42 PM, Rudi Heitbaum wrote:
> On Mon, Aug 31, 2026 at 09:41:08AM +0800, Chaoyi Chen wrote:
>> Hello Rudi,
>>
>> On 8/28/2026 9:24 PM, Rudi Heitbaum wrote:
>>> Hi Heiko,
>>>
>>> I hadn't looked in to these from the mainline viewpoint. I had been
>>> using an adapted vendor script based on the radxa npu_powerctl binary
>>> which reimplements the npu_reset sequence over GPIO.
> ... 
>>> I have the schematics and the working N10 here, so let me look into
>>> describing these in the .dts and update the onboard_usb_dev.h.
>>>
>>
>> Perhaps we should first check whether the power-on sequence in
>> onboard_usb_dev.c meets the requirements, as it enables all
>> regulator supplies at the same time.
> 
> Hi Chaoyi and Heiko,
> 
> I have done some work on the bringup of the rk1808, and can confirm that
> it needs six rails up and its reset released before it appears on the
> bus. There are no ordering requirements, issuing the reset 25 ms later
> is reliably working. The supply names being "vdd", "vddlog", "vddcpu",
> "vdd0v8", "vcc1v8", "vccio". This moves the power-on into the kernel
> and not the userland script. 
> 
> The MAX_SUPPLIES fixed size array needs to be expanded from 2 to 6 to
> accommodate the rails.
> 
> The rock-pi-n10 and the on-die rk1808 (including the onboard VIP8000Nano-Q
> NPU) are now both running on the 7.2 mainline kernel. The
> rock-pi-n10/rk3399pro-vmarc-som is booting with the mainline .dts and
> the rk1808 is booting with an adapted vendor .dts.
> 
> The required changes to the drivers/usb/misc/onboard_usb_dev.h are now:
> 
>     @@ -6,1 +6,1 @@
>     -#define MAX_SUPPLIES 2
>     +#define MAX_SUPPLIES 6
> 
>     @@ -134,6 +134,6 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
>     +static const struct onboard_dev_pdata rockchip_rk1808_data = {
>     +       .reset_us = 25000,
>     +       .num_supplies = 6,
>     +       .supply_names = { "vdd", "vddlog", "vddcpu", "vdd0v8", "vcc1v8", "vccio" },
>     +       .is_hub = false,
>     +};
> 
>     @@ -167,2 +167,2 @@ static const struct of_device_id onboard_dev_match[] = {
>     +       { .compatible = "usb2207,1808", .data = &rockchip_rk1808_data, },
>     +       { .compatible = "usb2207,180a", .data = &rockchip_rk1808_data, },
> 
> Hoping to get your direction on this, and if this can go through as a
> single patch, or should be raised as a series. I will raise a v2 of
> the above if this is suitable.
> 
> https://github.com/heitbaum/linux/commits/rock-pi-n10/
> https://github.com/heitbaum/linux/commits/rk1808/
> 

I took a quick look at your submission. Since it spans multiple
subsystems, I'd suggest splitting it into separate series by subsystem
so that maintainers can review them more easily.

-- 
Best, 
Chaoyi

