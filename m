Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A44CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 06:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/14w+SFVSyk9RAwqRL6XbZhqj4wg32XI+iWWuscLQww=; b=SQiISSCn5w8SCFnbGzmPh6RZo4
	3iJB8qUj1AGoqw/5kAz4dUt8KEHB4h9sZr8w/ycMnOkr+znrM/37n3t4SmWPVbjYHs2GFLSf7WV5g
	BXemt2oLl1Jc4I37x+2tIVfeaarv+cuXsu6awZzDmSHbt77M/ijKRvm8SUMqYv7vDZxMs0uXQdhns
	XKYW3kaTlxtr3WX4LbCNvgTctMhH/tR0D1g+bhjHnD195GDu7gWuWTCW4inI0UnhM0R29QZIxOz0E
	c23bZDW+KxvKgQIIY6p8HrGRtsi5sFRHaNEZIzCG5n4IQJYQbnNhYfT2c/ePT3inrsEIKryFw9KXE
	KilZlEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unWgH-00000005PBb-1ssG;
	Sun, 17 Aug 2025 06:15:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unWdg-00000005Oyo-152J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 06:13:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BCBD43C35;
	Sun, 17 Aug 2025 06:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB13C4CEEB;
	Sun, 17 Aug 2025 06:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755411187;
	bh=lid+S2UZG+OF8iqGwXoZfpqZqgui8N3K+4MjmmWh4kY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sDpNyKzEK9ha0jQPpNT72h11TCoWyZIgCoPuQauMS8Y4J7khtPMTBmBwqhdmyWGeO
	 DMuKBrro75dmZAlZTMOzJXvzsxDpHBZCv4sg8jSqho9EKsiyTvAYy5p3beW33u72Zd
	 E9MLBSQ2uH3UAtKhrrxmbyuxC+xi/Mq2UOPCwTTLXRDcOTlYkE4EVeCrZrsSC73tcA
	 9eEtVDnNdQZYAo8A4l0tawmVx0JDTwU7a4dgHTylH8ufxfIZEttsVoU929G35D/rD1
	 CnVz2f5S5ABGRmFWIwgpacXcUn/Vk4FCtN/ZZKSF2o5/tXzSeq44Y7sWnqtzH4v8wJ
	 dI2Fs1qMUkPDg==
Message-ID: <adfb8732-3ac7-4496-9671-1fa2aa71139c@kernel.org>
Date: Sun, 17 Aug 2025 08:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] media: i2c: imx585: Add Sony IMX585 image-sensor
 driver
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-4-will@willwhang.com>
 <20250811-cinnamon-tapir-of-music-0bda96@kuoka>
 <CAFoNnryfrJvoEHNgQDpSZBbGiGjPr-bwnhhg4cgpNK_hW=0EbQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAFoNnryfrJvoEHNgQDpSZBbGiGjPr-bwnhhg4cgpNK_hW=0EbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_231308_343237_9ABAA53A 
X-CRM114-Status: GOOD (  18.44  )
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

On 16/08/2025 21:44, Will Whang wrote:
> On Mon, Aug 11, 2025 at 1:06 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Sun, Aug 10, 2025 at 11:09:20PM +0100, Will Whang wrote:
>>> +
>>> +/* --------------------------------------------------------------------------
>>> + * Power / runtime PM
>>> + * --------------------------------------------------------------------------
>>> + */
>>> +
>>> +static int imx585_power_on(struct device *dev)
>>> +{
>>> +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>> +     struct imx585 *imx585 = to_imx585(sd);
>>> +     int ret;
>>> +
>>> +     dev_dbg(imx585->clientdev, "power_on\n");
>>> +
>>> +     ret = regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->supplies);
>>> +     if (ret) {
>>> +             dev_err(imx585->clientdev, "Failed to enable regulators\n");
>>> +             return ret;
>>> +     }
>>> +
>>> +     ret = clk_prepare_enable(imx585->xclk);
>>> +     if (ret) {
>>> +             dev_err(imx585->clientdev, "Failed to enable clock\n");
>>> +             goto reg_off;
>>> +     }
>>> +
>>> +     gpiod_set_value_cansleep(imx585->reset_gpio, 1);
>>
>> You asserted reset gpio causing it to enter reset and you call this
>> "power on"?
>>
>>> +     usleep_range(IMX585_XCLR_MIN_DELAY_US,
>>> +                  IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_RANGE_US);
>>> +     return 0;
>>> +
>>> +reg_off:
>>> +     regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplies);
>>> +     return ret;
>>> +}
>>> +
>>> +static int imx585_power_off(struct device *dev)
>>> +{
>>> +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>> +     struct imx585 *imx585 = to_imx585(sd);
>>> +
>>> +     dev_dbg(imx585->clientdev, "power_off\n");
>>> +
>>> +     gpiod_set_value_cansleep(imx585->reset_gpio, 0);
>>
>> And here device comes up, but you call it power off? Your functions or
>> reset gpio code are completely reversed/wrong.
> 
> Reset pin High -> Run normally
> Reset pin Low -> Reset state

This is not how resets work. Logical reset value high means it is
asserted and device does not work.

Read carefully your datasheet. Because if you claim above this is not a
reset line, but some other.

> 
> See drivers/media/i2c/imx219.c with the same logic:

Great, so 10 year old buggy code is the example, but all other - 90% of
correct drivers - are not?

> 
> static int imx219_power_on(struct device *dev)
> {
> struct v4l2_subdev *sd = dev_get_drvdata(dev);
> struct imx219 *imx219 = to_imx219(sd);
> int ret;
> 
> ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
>    imx219->supplies);
> if (ret) {
> dev_err(dev, "%s: failed to enable regulators\n",
> __func__);
> return ret;
> }
> 
> ret = clk_prepare_enable(imx219->xclk);
> if (ret) {
> dev_err(dev, "%s: failed to enable clock\n",
> __func__);
> goto reg_off;
> }
> 
> gpiod_set_value_cansleep(imx219->reset_gpio, 1);
> usleep_range(IMX219_XCLR_MIN_DELAY_US,
>     IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
> 
> return 0;
> 
> reg_off:
> regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> 
> return ret;
> }
> 
> static int imx219_power_off(struct device *dev)
> {
> struct v4l2_subdev *sd = dev_get_drvdata(dev);
> struct imx219 *imx219 = to_imx219(sd);
> 
> gpiod_set_value_cansleep(imx219->reset_gpio, 0);
> regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> clk_disable_unprepare(imx219->xclk);
> 
> return 0;
> }
> 
> I really don't understand why this is a problem, it is up to the chip
> designer to decide
> what to do with reset behavior and not the reviewers.

I explained to you. You are mixing logical level with line level. This
is the problem, because (again I said it):

It does not work.

Your code or your DTS is incorrect.



Best regards,
Krzysztof

