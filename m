Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD40EF589D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjrfipUfn72B1GDWgNgVviWkaBvqYztmuDRubrD3LXo=; b=FP4SbbIPlNJopjx0jVmUuVkaRJ
	sZzF2zn3jhhQ9KsD/cJ4F5o447rN3rsct+yLRQZI4ybvfg3sd2EBa+c4kXBn454sPb+46DzJWzgJQ
	NFk7NDnticDETpcvaNMpFRqrOQr6JolswOOp024trLI6IKIgZC98yzffP9UiBZ1P5ztgtAqzFS5Q4
	Cv/5Mm2z8ybKC8n9yEqATHzJU4+jQasn/Mq9g79A4z33+oxivj4BJisCz7EFHfKWPaEe5U63/Z91U
	zcYgaAoZp53FV2QJH7N0JN6cLvLN4Re89CNcczcOHUnG/rG7le4H+Xd4dtYb1OwT3eyqyLkw4VSn0
	sY4B+M8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuE3-0000000BkzV-2FeS;
	Thu, 23 Apr 2026 13:36:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuDz-0000000Bkyx-2OtM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 13:36:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4A2634E42AC9;
	Thu, 23 Apr 2026 13:36:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1524A60495;
	Thu, 23 Apr 2026 13:36:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E5D710460C18;
	Thu, 23 Apr 2026 15:36:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776951366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=CjrfipUfn72B1GDWgNgVviWkaBvqYztmuDRubrD3LXo=;
	b=Pz3vvJ4fYEOwzaZmRWnzS9iiPptCFYLxeOEM4jj09xuO22X4TrR7W7xkmjFSAfp7DUpV/W
	GVDKstGvnixc9s754sXiAV2LpV0k/D52xfk9N9xxHWra/ULCGRpJBkYzz0iKIje87/t32A
	1rafq+lFLIttmnjdgBYeyvjWlNoxFfqY2IQB/AbXdpnmLVGFP3xO6E7hQfHQYzvRrj+ncL
	VXk7N8VeVeq8bCxxN1K+HjkGuxQncOBmX9GYjaXApZxtbNjOWhS6qGCP2R+3qt9BI3Ly8x
	uuLmOp45r+7tuxvWd7/wVE4u/t2XwJ/fNGBynh4lgJ+KtlZ4Hxq1rbr0UMekWw==
Message-ID: <7e6eeb33-ca4e-4067-b886-121dbb37a1dc@bootlin.com>
Date: Thu, 23 Apr 2026 15:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: keystone: sci-clk: add restore_context()
 operation
To: Brian Masney <bmasney@redhat.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>,
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Dhruva Gole <d-gole@ti.com>
References: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com>
 <20260407-ti-sci-jacinto-s2r-restore-irq-v5-3-97b28f2d93f9@bootlin.com>
 <adbXBwKC_cNxGlpr@redhat.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <adbXBwKC_cNxGlpr@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_063611_771599_C35E98B1 
X-CRM114-Status: GOOD (  17.69  )
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

Hello Brian,

On 4/9/26 12:30 AM, Brian Masney wrote:
> Hi Thomas,
> 
> On Tue, Apr 07, 2026 at 04:25:08PM +0200, Thomas Richard (TI) wrote:
>> Implement the restore_context() operation to restore the clock rate and the
>> clock parent state. The clock rate is saved in sci_clk struct during
>> set_rate() operation. The parent index is saved in sci_clk struct during
>> set_parent() operation. During clock registration, the core retrieves each
>> clock’s parent using get_parent() operation to ensure the internal clock
>> tree reflects the actual hardware state, including any configurations made
>> by the bootloader. So we also save the parent index in get_parent().
>>
>> Reviewed-by: Dhruva Gole <d-gole@ti.com>
>> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
>> ---
>>  drivers/clk/keystone/sci-clk.c | 42 ++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 34 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
>> index 9d5071223f4c..428050a05de3 100644
>> --- a/drivers/clk/keystone/sci-clk.c
>> +++ b/drivers/clk/keystone/sci-clk.c
>> @@ -47,6 +47,8 @@ struct sci_clk_provider {
>>   * @node:	 Link for handling clocks probed via DT
>>   * @cached_req:	 Cached requested freq for determine rate calls
>>   * @cached_res:	 Cached result freq for determine rate calls
>> + * @parent_id:	 Parent index for this clock
>> + * @rate:	 Clock rate
>>   */
>>  struct sci_clk {
>>  	struct clk_hw hw;
>> @@ -58,6 +60,8 @@ struct sci_clk {
>>  	struct list_head node;
>>  	unsigned long cached_req;
>>  	unsigned long cached_res;
>> +	u8 parent_id;
>> +	unsigned long rate;
>>  };
>>  
>>  #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
>> @@ -210,10 +214,16 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>>  			    unsigned long parent_rate)
>>  {
>>  	struct sci_clk *clk = to_sci_clk(hw);
>> +	int ret;
>> +
>> +	ret = clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
>> +					   clk->clk_id, rate / 10 * 9, rate,
>> +					   rate / 10 * 11);
>>  
>> -	return clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
>> -					    clk->clk_id, rate / 10 * 9, rate,
>> -					    rate / 10 * 11);
>> +	if (!ret)
>> +		clk->rate = rate;
>> +
>> +	return ret;
>>  }
> 
> Should the computed rate from sci_clk_recalc_rate() be saved as well?

Yes you're right. As recal_rate() is called for each clock at
registration, I'll be able to restore rate for all configured clocks
including the ones which were configured by the bootloader but not by Linux.

> 
>>  
>>  /**
>> @@ -237,9 +247,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>>  		return 0;
>>  	}
>>  
>> -	parent_id = parent_id - clk->clk_id - 1;
>> +	clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
>>  
>> -	return (u8)parent_id;
>> +	return clk->parent_id;
>>  }
>>  
>>  /**
>> @@ -252,12 +262,27 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>>  static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
>>  {
>>  	struct sci_clk *clk = to_sci_clk(hw);
>> +	int ret;
>>  
>>  	clk->cached_req = 0;
>>  
>> -	return clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
>> -					      clk->clk_id,
>> -					      index + 1 + clk->clk_id);
>> +	ret = clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
>> +					     clk->clk_id,
>> +					     index + 1 + clk->clk_id);
>> +	if (!ret)
>> +		clk->parent_id = index;
>> +
>> +	return ret;
>> +}
>> +
>> +static void sci_clk_restore_context(struct clk_hw *hw)
>> +{
>> +	struct sci_clk *clk = to_sci_clk(hw);
>> +
>> +	sci_clk_set_parent(hw, clk->parent_id);
> 
> Are all of these clocks muxes?

Not all.
I will check if the clock has more than one parent before to call
set_parent().

Best Regards,
Thomas

