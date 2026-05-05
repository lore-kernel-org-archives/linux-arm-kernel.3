Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A7CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgBXtsiIb+gLX4PuiVNT80qMAKULOs6sKPUTMJVrqqs=; b=z9UGhcj30F2RUVcjk6ZGTgy0sg
	UFs5qmEZX/Xq0hFOWPI+f/hgrxF0zIf+bJosP0NDiZUIEXdG8Ov56Frs3FaYSQtYeBLQIaNE1I+dL
	V0QmYotVU0FK2FACmooaT1c9NE99ovVQfVU/XIZ1/G1ipE2M9oXFSjxnLnNnAEumkrW7s67kk7lHs
	c7kfDcExn98AeZ2x3v1MbrxC3CAAJDUTENfWC4uV4043UHUSal8c5uOQ9xeyUrztrlmTMuaC/P396
	HlZyiyYlMMCSp0Xwpa6n1knaKUFbz8L0tQ9TGImJoLO22MVzn/sWcjShw+BBnBsvvcHGwbea2/RNb
	rf0eTghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHTv-0000000Gcxi-0trV;
	Tue, 05 May 2026 15:14:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHTs-0000000GcxC-01eL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:14:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A94251A3522;
	Tue,  5 May 2026 15:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C8FB6053C;
	Tue,  5 May 2026 15:14:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAACE11AD02B4;
	Tue,  5 May 2026 17:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777994075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=XgBXtsiIb+gLX4PuiVNT80qMAKULOs6sKPUTMJVrqqs=;
	b=AwT8yA7Bb/ath1ep+MNhY9ZGU6GOKM5XLv/FPv5oguicxv+2eEyRzqeLuD+47Hscws9Pc4
	ZJYGeZps9buNs2BLs/CxHg+d3OEhL0Uj3CcqdY3bjg+0tM+sBgw/RFsZ7n7fuVP4+spSSk
	de7VcUnG9jYvIFryOSllE+8hNBI5yXv0iMKfE1YTNOy3D11lSyQXPK+F218QY/A3pCYNnw
	IqDgdbphdsTim60DphNuGnn/IpmiWazZn8qp/bZFGrfNcXGyWQfPWWmE5TCcebQT5t6S6R
	qZaFVoa2rBFOG8woj+TkBT7LZwJV9hN2oenXBzmgTHqsPqy6DejG5XRIjF1X/Q==
Message-ID: <676912d8-a957-48dc-9182-5a6a1162b3f4@bootlin.com>
Date: Tue, 5 May 2026 17:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] clk: keystone: sci-clk: add restore_context()
 operation
To: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>,
 Abhash Kumar <a-kumar2@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Dhruva Gole <d-gole@ti.com>,
 Kendall Willis <k-willis@ti.com>
References: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com>
 <20260427-ti-sci-jacinto-s2r-restore-irq-v6-3-72c6468cb2ab@bootlin.com>
 <20260505114249.y7svb7jf7w64zflo@concerned>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260505114249.y7svb7jf7w64zflo@concerned>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_081440_179463_C07B4E6F 
X-CRM114-Status: GOOD (  18.03  )
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

On 5/5/26 1:42 PM, Nishanth Menon wrote:
> On 14:21-20260427, Thomas Richard (TI) wrote:
>> Implement the restore_context() operation to restore the clock rate and the
>> clock parent state. The clock rate is saved in sci_clk struct during
>> set_rate() and recalc_rate() operations. The parent index is saved in
>> sci_clk struct during set_parent() operation. During clock registration,
>> the core retrieves each clock’s parent using get_parent() operation to
>> ensure the internal clock tree reflects the actual hardware state,
>> including any configurations made by the bootloader. So we also save the
>> parent index in get_parent().
>>
>> Reviewed-by: Dhruva Gole <d-gole@ti.com>
>> Reviewed-by: Kendall Willis <k-willis@ti.com>
>> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
>> ---
>>  drivers/clk/keystone/sci-clk.c | 44 ++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 36 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
>> index 9d5071223f4c..b090edf5f82e 100644
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
>> @@ -150,6 +154,8 @@ static unsigned long sci_clk_recalc_rate(struct clk_hw *hw,
>>  		return 0;
>>  	}
>>  
>> +	clk->rate = freq;
>> +
>>  	return freq;
>>  }
>>  
>> @@ -210,10 +216,15 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>>  			    unsigned long parent_rate)
>>  {
>>  	struct sci_clk *clk = to_sci_clk(hw);
>> +	int ret;
>>  
>> -	return clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
>> -					    clk->clk_id, rate / 10 * 9, rate,
>> -					    rate / 10 * 11);
>> +	ret = clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
>> +					   clk->clk_id, rate / 10 * 9, rate,
>> +					   rate / 10 * 11);
>> +	if (!ret)
>> +		clk->rate = rate;
>> +
>> +	return ret;
>>  }
>>  
>>  /**
>> @@ -237,9 +248,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>>  		return 0;
> 
> What happens if get_parent() fails during clock registration? Looking at
> sci_clk_get_parent(), if the firmware call fails, parent_id will be a
> valid value of 0? and in restore, we'd attempt to restore it back? I
> think that is wrong.

Okay. I'll use an integer for parent_id, so I can also store
get_parent()'s return code in case of error. And in restore_context() I
call set_parent() only if num_parents > 1 and parent_id >= 0.

Best Regards,
Thomas

