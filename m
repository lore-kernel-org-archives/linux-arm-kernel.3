Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F6AC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+04FxogYzi4sdZRzCbFnxRd7zajIX6CS62l/K1+2oo=; b=tL7xOHqgSq3JUMKm44To4X8BwW
	fujk/pBvIkhl+53ER8XngUVbyrJ2GvZ3ycPcrWZ0METafvuAk2NVBe+UoX18NqaUtZSCBFtjDwKKS
	QTMBiBMfHw3vb5Trunj4lIyx+IktXq0FyT3ehz4UtyY43daiAxEtnx4tpMKFx7Ho2XgXyGms0I4nA
	9v4CJJsB5QtxNVa92GnsPuzHSdrGkVIpkopOoE4+LRZTdRTYv0nnqqA6zx86+ZxMmtFm2D4Dh5J52
	eYFJUwebox9moIhYv3cjd6TzJ4GHwicBpP1AsZiifEeazkssZV1qIMrzYNC8zwtqsh3yxGtdAN6fl
	BcojcALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQSZ-0000000Gsoa-2uiK;
	Mon, 10 Feb 2025 09:52:11 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQPq-0000000GsJw-1MKk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 09:49:24 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 42831A008F;
	Mon, 10 Feb 2025 10:49:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=E+04FxogYzi4sdZRzCbF
	nxRd7zajIX6CS62l/K1+2oo=; b=nMZz+fZC8yZfoZ2XFlFzGQKyde72ueUik4Rk
	xfYEy3jujdD0kFCCmjJ7SLfd4ILmlLfoMgF+Y7JEYkEFQ2vMUmuJ1VipMR1t6u44
	OsnxF7W0G2j6fRjxET5pJ4kikMknR3x3pAYntsMSZSmFt5tiqj6k6K8N9FDbiy0r
	C5LTg3rXfXkRNtDDOQwETcQIMzI28QIQBIHZdVJHpZL8ZiYa63wf/w19O6EBtM/o
	Z0SwSlkDv36igAJQ2cCR9kzyguX9AbnXtB/Tev5f4KwMPSV36XqgBVUnEss+NGYe
	YDI/rgNM8SxVYf7dRL63vPVX9MNJ40TsVtycvFK/vlSqpyWgqiBZxANgzShIW4dF
	hCwd/U3uwUhVuy7DxVhY+DikCkhjseptCu4osvGV03GgBtvfREoeAGljzCMSEymr
	QYm3IVpP6BQRtdBXlwedNQVaYhy6a6tJFX0RBaT5K3WHd72Oxwf1pDHCIJoNQrAD
	III6dfpK9zcqKOqhKxAhRhmZyIJHJtu+MNJLn70JJXdzL3TZW4U2LskcNGRNu7uu
	hn50p/lKX7LkOled0WXfvEBLGmuxwVQGBQSxuOKCaw2AxloBUl3kG16c5cfpqdgG
	KGVNqqAXIm2pqVi2IAfsG+35/9MgEefL+fCcgwsjK5230ahdIoojtkZOe1H1+VMQ
	Jmqw3SQ=
Message-ID: <3f424600-33d3-403b-9df6-85f7cb97c9a6@prolan.hu>
Date: Mon, 10 Feb 2025 10:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] counter: microchip-tcb-capture: Add IRQ handling
To: <Dharma.B@microchip.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kamel.bouhara@bootlin.com>, <wbg@kernel.org>
References: <20250205104957.95236-1-csokas.bence@prolan.hu>
 <20250205104957.95236-2-csokas.bence@prolan.hu>
 <ed8b9d03-0f03-4872-b9e0-ab670e307450@microchip.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <ed8b9d03-0f03-4872-b9e0-ab670e307450@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.253.18]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485261776A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_014922_830819_9EDFC7F7 
X-CRM114-Status: GOOD (  10.43  )
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

Hi,

On 2025. 02. 07. 9:12, Dharma.B@microchip.com wrote:
> can we have macros for the channel (3rd argument) for better clarity?

I myself have also thought about that, even about adding an uapi header. 
Thoughts?

>> +static int mchp_tc_irq_enable(struct counter_device *const counter)
> 
> Can we have it as mchp_tc_irq_init ?

Why, what's wrong with the current name? It requests IRQ servicing from 
Linux, then writes the peripheral's Interrupt Enable Register.

>> +{
>> +	struct mchp_tc_data *const priv = counter_priv(counter);
>> +	int ret = devm_request_irq(counter->parent, priv->irq, mchp_tc_isr, 0,
>> +				   dev_name(counter->parent), counter);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], IER), ATMEL_TC_DEF_IRQS);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = devm_add_action_or_reset(counter->parent, mchp_tc_irq_remove, priv);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>>    static void mchp_tc_clk_remove(void *ptr)
>>    {
>>    	clk_disable_unprepare((struct clk *)ptr);
>> @@ -378,6 +438,13 @@ static int mchp_tc_probe(struct platform_device *pdev)
>>    	counter->num_signals = ARRAY_SIZE(mchp_tc_count_signals);
>>    	counter->signals = mchp_tc_count_signals;
>>    
>> +	priv->irq = of_irq_get(np->parent, 0);
>> +	if (priv->irq > 0) {
>> +		ret = mchp_tc_irq_enable(counter);
> 
> missing error handling in irq retrieval (check for -EPROBE_DEFER).

Hmm, what should happen on `priv->irq == -EPROBE_DEFER`? `return 
-EPROBE_DEFER`?

Bence


