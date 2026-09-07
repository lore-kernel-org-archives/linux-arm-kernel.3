Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF9CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 05:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuhOLAG6UxWzryB3JhbcOW54E8o7VyWgtXuI/wqq78g=; b=PKQWx4CW6kdQJXlBERktvE1Xnx
	/9txn6Fu90/nknxzdyFo17L/5YERJW37KgRuPxzYoCRq6Y5MgNyXUu9apD94bGLI2KXQjk7/NxFEK
	7zm9nEgLr7oCXYFGRbCUWm9Zv0c/XorNGlFF3TegnIFC1u346/ccqYIpOLug6073xBIZdGzISpgGD
	m52Xa6jMx3bS6op/z7L+OIm5UHD284LcMfEeI8F4VSboxHSCZmcKJdOJGgscYP5jvxhWcwEf5Dmok
	+fI5cs1oO56Dhv5ydV/pJHsfx8kHtxvu2eceZXoYfA6hUk9b9fpdrG571s8xwILJH1kvdu1bEC2f7
	kNN9we/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3S2Y-00000005wWx-3OMI;
	Mon, 07 Sep 2026 05:37:10 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3S2V-00000005wW4-0hll
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 05:37:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1647A11D1C8;
	Mon, 07 Sep 2026 07:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788759415;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PuhOLAG6UxWzryB3JhbcOW54E8o7VyWgtXuI/wqq78g=;
	b=F3+zgDO/D4DWm0kPNyLkXbJCNs+TfFx4av3seCYnwbmW3Zj+a3op/k1wQGKEqWy3Gf/qih
	N4snN6KUz7SEz1LQkm5YOrBMJd4FLsYvj4aiGKUpALma/4ywjDTgrogo2FSpytLlZyX6Gz
	diSok2KMajQ/DS4LZ9B563KtD8bsLArIqCGBVSjH1Jnm3Ry33ZzJbvwLT1/dKyjLFo0ik+
	DtSWp4MGBZOyGYj1tGNO6BTT69n8iOTcAI99MNhGJTjzvaDc9xgR76r6Wbku4YFVERJ4JN
	PlOk+TmZic2KPAKbGVdwPqH6WtZC3k46lX9tSFfXgCX7iiAiZ9JR9RBhKxU+qA==
Message-ID: <6a489d2b-b5d1-0455-793f-f4100fd3b3d1@nabladev.com>
Date: Mon, 7 Sep 2026 07:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
Content-Language: en-US
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fpga@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Xu Yilun <yilun.xu@intel.com>, linux-gpio@vger.kernel.org
References: <20260810062105.299808-1-hs@nabladev.com>
 <ap2Yx8oACWfBKOep@yilunxu-OptiPlex-7050>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <ap2Yx8oACWfBKOep@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_223707_578831_717E6BF6 
X-CRM114-Status: GOOD (  49.84  )
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

Hello Xu,

thanks for the review, and sorry for the confusion. Answers below, I will
send the v5 after you agree...

On 06.09.26 18:45, Xu Yilun wrote:
> On Mon, Aug 10, 2026 at 08:20:51AM +0200, Heiko Schocher wrote:
>> The current driver requests the optional CSI_B and RDWR_B GPIOs but
>> only configures their initial output state and never changes them
>> afterwards. As a result, CSI_B and RDWR_B remain inactive or active
> 
> I got even confused, the old code explicitly set them GPIOD_OUT_HIGH,
> why "inactive or active"? And I also confused by your comments in v3,
> why "inactive or active" depends on DTS?
> 
> Do you want to activate or inactivate the GPIOs in your code? You can't
> say don't know, go check the DTS, is it?

What I want is, to deassert both signals in probe, and asserted them
only around the data transfer in xilinx_selectmap_write().

With v4 code does this already, just my comments / commit message is
misleading... sorry.

My above sentence in the commit message is wrong, you are correct. I drop
it in v5. Nothing here depends on the DTS. The flag handed to

devm_gpiod_get_optional()

is a logical value, not a line level. gpiod_direction_output_nonotify()
does

         if (test_bit(GPIOD_FLAG_ACTIVE_LOW, &flags))
                 value = !value;

and Documentation/driver-api/gpio/consumer.rst states it as well:

         Note that the initial value is *logical* and the physical line
         level depends on whether the line is configured active high or
         active low

So GPIOD_OUT_HIGH means "asserted", on every board. The current driver
asserts CSI_B and RDWR_B in probe and leaves them asserted for the
lifetime of the device, which is a bad idea in case you have more
devices sharing one bus, and this patch fixes this issue.

>> throughout the configuration process.
>>
>> This may work on systems with a single FPGA where these signals do not
>> need to be controlled by software, or where the signals are configured
>> to their active state.
> 
> Could you just tell the actual problem, as you said in v3 "The gpios are
> never used in mainline".

The problem is two (or more) FPGAs sharing one SelectMAP data bus, which
is the case CSI_B exists for. With current driver both of them are selected
after probe all the time, so every byte written for one is clocked into
the other as well, and neither can be configured on its own.

With a single FPGA on the port the permanent assertion is harmless. That
FPGA is the only device on the bus, so it may stay selected, and the
driver never reads from it, so the port may stay in write mode.

I would change v5 commit message to:
"""
     The driver requests the optional CSI_B and RDWR_B GPIOs with
     GPIOD_OUT_HIGH and never touches them again. That flag carries a
     logical value, so both signals end up asserted on every board,
     whatever polarity the device tree states.

     Keeping them asserted works as long as a single FPGA owns the
     SelectMAP port. That FPGA is the only device on the bus, so it may
     stay selected, and the driver never reads from it, so the port may
     stay in write mode.

     It stops working as soon as two FPGAs share one SelectMAP data bus,
     which is the case CSI_B exists for. Both devices are selected all
     the time, so every byte written for one of them is clocked into the
     other as well, and neither can be configured on its own.

     CSI_B (Chip Select) selects the target FPGA. Assert it before the
     configuration data is transferred and deassert it afterwards, so that
     only the intended device sees the bus cycles.

     RDWR_B (Read/Write) selects the transfer direction on the SelectMAP
     interface. Assert it for the write cycles that carry the bitstream and
     deassert it afterwards. UG570 wants RDWR_B settled before CSI_B is
     asserted, a change while the device is selected aborts the
     configuration on the next CCLK.

     Both are requested with GPIOD_OUT_LOW now, the logical 0 that leaves
     them deasserted, and their descriptors are kept in the driver private
     data.

     A board with one FPGA keeps working. SelectMAP allows the bitstream to
     be loaded non-continuously, with CSI_B deasserted between the data
     transfers, and a deselected device ignores the bus.
"""

> 
>> But this does not not support systems with
>> multiple FPGAs sharing a SelectMAP interface.
>>
>> On systems with multiple FPGAs sharing the same SelectMAP data bus,
>> the driver must deassert this signals in probe, and actively control
>> them during configuration.
>>
>> CSI_B (Chip Select, active low) selects the target FPGA. It is asserted
>> before configuration data is transferred and deasserted afterwards so
>> that only the intended device responds to bus transactions.
>>
>> RDWR_B (Read/Write, active low) controls the transfer direction on the
>> SelectMAP interface. A low level selects write cycles, while a high
>> level selects read cycles. During FPGA configuration the driver drives
>> RDWR_B low before transferring the bitstream and restores it to its
>> reading (high state) afterwards.
>>
>> With that info from the datasheet the driver is now changed to:
>>
>> - deassert the CSI_B and RDWR_B pin on probe and store the
>>    optional GPIO descriptors in private driver data.
>>
>> - toggle both signals around the configuration data transfer
>>
>> This allows multiple FPGAs to safely share a single SelectMAP interface.
>>
>> Signed-off-by: Heiko Schocher <hs@nabladev.com>
>> ---
>>
>> Changes in v4:
>> - add comments from Xu Yulin
>>    replace wrong gpiod_set_raw_value() with gpiod_set_value()
>>    deassert CSI_B and RDWR_B in probe as in patch version 2
>>    rework commit message (correct the description what current
>>    driver do on probe), why this is not a problem with one
>>    FPGA, and why it needs a change if you have N FPGAs
>>    sharing the same selectmap Interface (clk and data pins).
>>
>> Changes in v3:
>> - use 0 (deasserted state) and 1 (asserted state) in gpio_set_value()
>>    as commented from Micahl
>> - rewrite commit message as requested from Xu Yilun
>>    - describe what rdwr_b and csi_b do, and why this change is needed
>>      for more than one FPGA.
>> - add comment before asserting the signals, why they are asserted
>>    in this order.
>>
>> Changes in v2:
>> - add comments from Michal
>>    - skip check if gpio descriptor variables csi_b/rdwr_b are valid,
>>      as validate_desc() checks this in gpiod_set_value() call.
>>    - initialize the gpio variables csi_b/rdwr_b immediately with
>>      the return value from devm_gpiod_get_optional(), so we can
>>      drop local gpio variable at all
>>
>>   drivers/fpga/xilinx-selectmap.c | 36 ++++++++++++++++++++++++---------
>>   1 file changed, 27 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
>> index d0cbb5fdfe3a..e9b1d15ca054 100644
>> --- a/drivers/fpga/xilinx-selectmap.c
>> +++ b/drivers/fpga/xilinx-selectmap.c
>> @@ -19,6 +19,8 @@
>>   struct xilinx_selectmap_conf {
>>   	struct xilinx_fpga_core core;
>>   	void __iomem *base;
>> +	struct gpio_desc *csi_b;
>> +	struct gpio_desc *rdwr_b;
>>   };
>>   
>>   #define to_xilinx_selectmap_conf(obj) \
>> @@ -30,16 +32,30 @@ static int xilinx_selectmap_write(struct xilinx_fpga_core *core,
>>   	struct xilinx_selectmap_conf *conf = to_xilinx_selectmap_conf(core);
>>   	size_t i;
>>   
>> +	/*
>> +	 * Assert CSI_B and select write mode.
>> +	 *
>> +	 * UG570 states in note 4 in Figure "Continuous x8 SelectMAP Data
>> +	 * Loading", RDWR_B should be asserted before CSI_B to avoid
>> +	 * causing an ABORT on the next CCLK.
>> +	 *
>> +	 * To be sure, set first RDWR_B pin before activate CSI_B
>> +	 */
>> +	gpiod_set_value(conf->rdwr_b, 1);
>> +	gpiod_set_value(conf->csi_b, 1);
>> +
>>   	for (i = 0; i < count; ++i)
>>   		writeb(buf[i], conf->base);
>>   
>> +	gpiod_set_value(conf->csi_b, 0);
>> +	gpiod_set_value(conf->rdwr_b, 0);
>> +
>>   	return 0;
>>   }
>>   
>>   static int xilinx_selectmap_probe(struct platform_device *pdev)
>>   {
>>   	struct xilinx_selectmap_conf *conf;
>> -	struct gpio_desc *gpio;
>>   	void __iomem *base;
>>   
>>   	conf = devm_kzalloc(&pdev->dev, sizeof(*conf), GFP_KERNEL);
>> @@ -55,16 +71,18 @@ static int xilinx_selectmap_probe(struct platform_device *pdev)
>>   				     "ioremap error\n");
>>   	conf->base = base;
>>   
>> -	/* CSI_B is active low */
>> -	gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_HIGH);
>> -	if (IS_ERR(gpio))
>> -		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
>> +	/* CSI_B is active low, deassert signal */
> 
> I'm not sure "active low" does any help here, it just makes more
> confusion.
> 
> At first glance, "active low" && "deassert" => "set it high", then you
> should use GPIOD_OUT_HIGH?? You are not reasoning your change.
> 
> Please elaborate on how these flags work before you send v5, thanks.

Agreed, and that comment is what causes the confusion. Active low is a
property of the board, gpiolib hides it, and the driver never needs to
know it. GPIOD_OUT_LOW is the logical 0, which is the deasserted state,
and for a line the firmware marks active low gpiolib drives it high.
GPIOD_OUT_HIGH would assert the signal, which is what I want to fix.

So I will rewrite the comments in probe for v5 to:
"""
         /*
          * Request both signals deasserted, so a device sharing the SelectMAP
          * bus with others stays off that bus until its bitstream is written.
          *
          * The value in the gpiod flags is logical, gpiolib drives the line
          * high for GPIOD_OUT_LOW when the firmware describes it active low.
          */
         conf->csi_b = devm_gpiod_get_optional(&pdev->dev, "csi",
                                               GPIOD_OUT_LOW);
"""

Many thanks!

bye,
Heiko
> 
>> +	conf->csi_b = devm_gpiod_get_optional(&pdev->dev, "csi",
>> +					      GPIOD_OUT_LOW);
>> +	if (IS_ERR(conf->csi_b))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(conf->csi_b),
>>   				     "Failed to get CSI_B gpio\n");
>>   
>> -	/* RDWR_B is active low */
>> -	gpio = devm_gpiod_get_optional(&pdev->dev, "rdwr", GPIOD_OUT_HIGH);
>> -	if (IS_ERR(gpio))
>> -		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
>> +	/* RDWR_B is active low, deassert signal */
> 
> Same concern
> 
>> +	conf->rdwr_b = devm_gpiod_get_optional(&pdev->dev, "rdwr",
>> +					       GPIOD_OUT_LOW);
>> +	if (IS_ERR(conf->rdwr_b))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(conf->rdwr_b),
>>   				     "Failed to get RDWR_B gpio\n");
>>   
>>   	return xilinx_core_probe(&conf->core);
>> ---
>> base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
>>
>> -- 
>> 2.55.0
>>
>>

-- 
Nabla Software Engineering
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Geschäftsführer : Stefano Babic

