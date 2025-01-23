Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ACFC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 05:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/JtWAOEJTS7avA0o5kwO6zXPnxPxjIxqAPrcu/THDE=; b=iGkrC0P4W7VZbFqCjnE5vuHfra
	h8ezyz5SOA8zeHwWI9+dJiw9MPVTGNlhFLi8ebgtvQOVRRb4l5c0/1QcAUvMcR/Yvg4cLvb4v/UPY
	L23zQDtmrGF5byDX/9I2idrqp5SQT1imu0TYxCReL0j41YNaBgBJ+DOTEufmzJgNtyGQCI7rpyxvA
	okPiJEIggbEk/jwRBO/cN9ARpKkOxhRwyl6h0mBJE4ubaFQ+t6jrkUtuuP5shZc8CSBmbf2tr37OM
	j8bRUWJlvib6FrQ71enwbFacuXyH9kuyQmpyZTJxV68ipcSXVjDzo1bPOeA9E8AQtqi0YKpW9w3/W
	RwDS3iAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tapl1-0000000BjkS-2LO2;
	Thu, 23 Jan 2025 05:27:59 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tapiS-0000000BjSI-0olx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 05:25:23 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 23 Jan 2025 14:25:16 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 37B5F200847D;
	Thu, 23 Jan 2025 14:25:16 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Thu, 23 Jan 2025 14:25:16 +0900
Received: from [10.212.246.222] (unknown [10.212.246.222])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id A448CAB183;
	Thu, 23 Jan 2025 14:25:15 +0900 (JST)
Message-ID: <ea845c58-ee2a-4660-bc13-7e05003de5d0@socionext.com>
Date: Thu, 23 Jan 2025 14:25:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/3] Limit devicetree parameters to hardware
 capability
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>,
 Vince Bridgers <vbridger@opensource.altera.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
 <Z492Mvw-BxLBR1eZ@shell.armlinux.org.uk>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <Z492Mvw-BxLBR1eZ@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_212520_349856_71413779 
X-CRM114-Status: GOOD (  25.75  )
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

Hi Russell,

Thank you for your comment.

On 2025/01/21 19:25, Russell King (Oracle) wrote:
> On Tue, Jan 21, 2025 at 01:41:35PM +0900, Kunihiko Hayashi wrote:
>> This series includes patches that checks the devicetree properties,
>> the number of MTL queues and FIFO size values, and if these specified
>> values exceed the value contained in the hardware capabilities, limit to
>> the values from the capabilities.
>>
>> And this sets hardware capability values if FIFO sizes are not specified
>> and removes redundant lines.
> 
> I think you also indeed to explain why (and possibly understand) - if
> there are hardware capabilities that describe these parameters - it has
> been necessary to have them in firmware as well.
> 
> There are two scenarios I can think of why these would be duplicated:
> 
> 1. firmware/platform capabilities are there to correct wrong values
>     provided by the hardware.
> 2. firmware/platform capabilities are there to reduce the parameters
>     below hardware maximums.
> 
> Which it is affects whether your patch is correct or not, and thus needs
> to be mentioned.

I think scenario 2 applies in this case.

The queue values specified in devicetree bindings are defined as the
amount to be "used."

     number of TX queues to be used in the driver

And the fifo sizes specified in devicetree bindings are defined as a
"configurable" size.

     This is used for components that can have configurable receive fifo
     sizes, ...

If the amounts of hardware resources are available from the hardware
capabilities, it must be limited to these amounts because exceeding
that values will cause issues.

Otherwise, since there is no values to show hardware resources, specify
these values to be used directly in devicetree. In this case, the values
will be referenced without checking.

> Finally, as you are submitting to the net tree, you really need to
> describe what has regressed in the driver. To me, this looks like a new
> "feature" to validate parameters against the hardware.

Actually, I think that specifyin an arbitrary (too big) value might 
result in unexcepted behavior, and the limit of these parameters is
determined by:
- the max number that can be managed by software, or
- the amount of hardware resources.

> Please answer these points in this email thread. Please also include
> the explanation in future postings.

I'll pay attention next.

Thank you,

---
Best Regards
Kunihiko Hayashi

