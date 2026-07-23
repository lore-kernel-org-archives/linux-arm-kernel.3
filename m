Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8BDC531D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODvRMgU85quu471D6jblpkR5IkvvraNKdRo80Vm+7cY=; b=UMa9HlLdZ90+aq6Vk39LCVnuxy
	U3hwr6kj9vjch5byPcC9mF83qXb/kZHZTyNsLO7otm/jFX+T53+PnksG/ZjZLIBKVbZBgUyZibcut
	6qgug4w4KCt+zJZusbeKRagiDTEDLERqWcJX9OS+/CbYO4WcGYdL+7j77u/Jx5KLVGteevZcMfDBg
	ie4Z/ZcEeOh9dLhoTu3YnLu+1AJxW3m9XfwFCdbbKRyv11Aop32NlvVOPn3saD1xgW3/JfpMqoZxa
	nKz410jV4ewao0kbmGQhEcYYl5X6MOSGvVPyPj1BMA4STAIJJriTA1VaCT/OceKn1mN7jpwHD+YUg
	oGToCCIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmu2b-0000000ES7H-2vkA;
	Thu, 23 Jul 2026 14:04:49 +0000
Received: from mail.lysator.liu.se ([130.236.254.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmu2V-0000000ES4G-3TZ4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 14:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784815480;
	bh=lwpQgSr5i107bmp5QM0W4QnHp/84z/4JyZveaHiwaKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ROQOgbRvAXYqrcTtV1TkTemMJQ0q1Uqv+CTRXSMDQ9+E/OnNvyYQtn5MCVH2B5Mqm
	 kvYQPYe/EqfjYF8IwZMtxEDWV1IvBYvoaAcaaKdoaxaW/qnP9+oF1+UJgHqF8CfLMJ
	 OiPT3+jX1MKq2r+yv3j7zWW3FWA1yQ4J4Z5cGzRsSCOa5KVIt5N/NYYqazDgXrvyoY
	 twYeIcbw5igiWnEbxeuiiV6lvmRR3mlw7loFvUVLEdF9ElFn0iCg8/kXL0FnSIM/HC
	 CaPiJBpuZqooOeaLxf2IsWL/rtzpfeFdZvCL8vCT8dz7zxh4zbc2F8emORQvyQZHun
	 G1cp+yHxD5+Yg==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id EFD9B1C409
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 16:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784815479;
	bh=lwpQgSr5i107bmp5QM0W4QnHp/84z/4JyZveaHiwaKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qo7dVNEXTj3AwryCF5Og6VfUjoyAEmIf3th0JV/+Bv7oNxvG3Qq8T6n3rlFmFniJq
	 h7AN2C2o1CoI9SjNIp3GlF+AVg+z5sr1WiDnfGAPdYEroJIbtsq0v7sPgmoK3sJLqk
	 a6v4nOcenXZRpXh7Z0Hh8jfXvxe/MfSDYvNW8j7YqBzuY23FnALbzjjcU8FgC8WLOP
	 0UqOIT40Mhc2XMrR2ckf2MuIA/FHSMMeRkLNiuDXDBl53K42r4h1TrRQlROUk1RmBA
	 piptf/dx/Z1SKABH9tnmq6C+yyqv877mobI3ONt3aA6DnRiHaxiA0ETXS0RzHLwGPM
	 2iW7mGARMj8Gw==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id D0BE51C2F8; Thu, 23 Jul 2026 16:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784815476;
	bh=lwpQgSr5i107bmp5QM0W4QnHp/84z/4JyZveaHiwaKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=od53DPNggVoiafmfJczBj/crzaxdLcD5ZM8fIJDk5NmmYp4nYEkkwWyvsMoGtJVv6
	 E6YjJSPaDcAPQMTcV+Xnd7459ovUYnAhmeTZXpNm0UqaImlb1FLCoa0z077+rNhmEE
	 xmREHdtT37hjCa/2a1NFrJKfwIF5D+gXxMqTg7xzaKVe8hd8LSpvcdFyBIaMIx1zga
	 Nd0MDlU3lXMtI/5izSc5ORyfUzsIrYWM2DJazgVTYL6jzvoDTeaEx/57JlqYPDbn9u
	 pFqr+GyvN+ecMJUNbwG2v0zP3G72hiBUZ9Jh7FMrcetR9oX7dmgpWz8c3LqtLe+58O
	 APGP9maR20Kgg==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id EB28B1C2F4;
	Thu, 23 Jul 2026 16:04:35 +0200 (CEST)
Message-ID: <924c6d04-c05e-4ddf-8229-574d891e6d83@lysator.liu.se>
Date: Thu, 23 Jul 2026 16:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/7] i2c: core: add callback to change bus frequency
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
 <20260719-i2c-mux-v12-1-a5010d623a57@gmail.com>
 <19dbf4be-5f17-46b3-924d-eb24ae41fdd9@lysator.liu.se>
 <amH8vX-M6lAWajQ_@gmail.com>
Content-Language: en-US, sv-SE
From: Peter Rosin <peda@lysator.liu.se>
In-Reply-To: <amH8vX-M6lAWajQ_@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_070444_034698_AAA96B08 
X-CRM114-Status: GOOD (  22.54  )
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

Hi!

On 2026-07-23 13:36, Marcus Folkesson wrote:
> Hi Peter!
> 
> On Thu, Jul 23, 2026 at 01:03:53PM +0200, Peter Rosin wrote:
>>> + *
>>> + * @set_clk_freq: Set clock frequency for the adapter. Returns the actual set frequency.
>>> + *      This function is optional.
>>>    */
>>>   struct i2c_adapter {
>>>   	struct module *owner;
>>> @@ -742,6 +745,8 @@ struct i2c_adapter {
>>>   	struct rt_mutex mux_lock;
>>>   
>>>   	int timeout;			/* in jiffies */
>>> +	u32 clock_Hz;			/* bus clock speed */
>>> +	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_Hz); /* Optional */
>>
>> To expand on the comment from v9 by Wolfram [1], I too think it
>> would be good if this function pointer did not live directly in
>> i2c_adapter but instead in some other struct so that the actual
>> pointer could live in read-only memory. I.e. if i2c_algorithm
>> does not fit for some reason, a new function pointer struct might
>> be called for?
> 
> My objection to move it to i2c_algorithm, was mostly based on that the
> algorithm should not be aware of the current clock frequency. When I
> reread the comment from Wolfram (and you), I realize that we are only
> talking about the function pointer, which is fine to put into the
> i2c_algorithm struct.
> 
> Sorry for the misinterpretation, I will move the pointer to
> i2c_algorithm and keep clock_Hz in i2c_adapter.

Please note that the main point of moving the function pointer
into a struct is to enable instances of that struct to live in
const memory. Thus, if you add a random function pointer to some
unrelated struct, users of that struct will likely need to set
up their own instance with the needed mix of hooks. That works
poorly with the generic algos in drivers/i2c/algos that export
i2c_algorithm instances. If you need to manipulate .set_clk_freq
in one of those generic instances, then they can't be const.

Hence, it might be wise to put this new .set_clk_freq hook in
some other struct with function pointers where it fits better. If
no such struct exists, a new one might be needed?

Cheers,
Peter


