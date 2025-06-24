Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FE2C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCl//NgQ11EoWr28Zx1npe46oBjxvKOji5pNi3k+NNk=; b=x+hiL5PvQlTIXhquqTgcSpSRft
	zsqPUtnTkM7PhnR5CeOk2HxHy5zc2FmcjhkcKuTgaiMLypvB/9CkOvJYPm96CmuxACqT0I0MsLbt+
	F9yTxW6OJca2RCvEkHn8Wj/d9OqBrjenB1jD6xF8kK08olErHzRsTniUdN66tQLv4ohguvDiJCp5Q
	1wqHIhwjS4LpGmHCKLUdnCfjQXy6rJKD3XW/pdinGFda0YjwLbVqrVau3BH224x7oEIWVER/Xvs0p
	VVhibdPAtpfHUMI/wO7GFnWQ54FifNmH9jzjn1njDBshdqMwVUlqOOhM5orhqJtRhJsH1U84gN0jW
	Q0fpZYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1r5-00000005R17-1EG8;
	Tue, 24 Jun 2025 11:30:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1JW-00000005Mvm-3ECM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:55:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28AC5629C8;
	Tue, 24 Jun 2025 10:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C19DC4CEEE;
	Tue, 24 Jun 2025 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750762541;
	bh=Pu3DHb8aP+XC/W7n3/h0zTNv+tV4W0GTHtRsft6M9TE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rrp/ErDYDCrpSErtMPyFgneczghqkJ4natiJVaKPRR/5+h+kYiJp5tsihKX7jxcHD
	 AxpHsQF4BknyYwn6GAcn8jwC4TGjkQa8Q0SP3cYucl8Zx28YtAjDyIkl3IyU1VATrl
	 4xiWm+l8bOFez4NGm4wCvYl7uYHtxLkoMJ/qAoXmLVH2Qx6rmfQZ7BbfqlQitKA8vY
	 M9zrCU92PcTRyEUFqFiIU0gzrZN2Mn8XxNcvFu5et6IF0x0Uh1JVV6VTWqIypZ7ISv
	 M8o6SNJG9TuJjALo/qMR8ihXl9vtd1iOsIm7errENpkHRCsk2P6msB5ZMQgzylgdth
	 oMDrluo03zeoQ==
Message-ID: <6f98274a-88c3-4afc-b324-b024f31e1628@kernel.org>
Date: Tue, 24 Jun 2025 12:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 2/6] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
To: Paresh Bhagat <p-bhagat@ti.com>, nm@ti.com, vigneshr@ti.com,
 praneeth@ti.com
Cc: kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, khasim@ti.com,
 v-singh1@ti.com, afd@ti.com, bb@ti.com, devarsht@ti.com
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-3-p-bhagat@ti.com>
 <2e26a403-fac2-4217-8525-24e39d4c92c5@kernel.org>
 <c4362d9e-62a4-4c28-b1cd-c338467f92ae@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <c4362d9e-62a4-4c28-b1cd-c338467f92ae@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 24/06/2025 12:39, Paresh Bhagat wrote:
> 
>>>
>>> This SoC is of part K3 AM62x family, which includes the AM62A and AM62P
>>> variants. While the AM62A and AM62D are largely similar, the AM62D is
>>> specifically targeted for general-purpose DSP applications, whereas the
>>> AM62A focuses on edge AI workloads. A key distinction is that the AM62D
>>> does not include multimedia components such as the video encoder/decoder,
>>> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
>>> processing, or the display subsystem. Additionally, the AM62D has a
>>> different pin configuration compared to the AM62A, which impacts
>>> embedded software development.
> 
> 
> This section is important as it clarifies the difference between AM62a 
> and AM62d, as we are reusing AM62a dtsi files for AM62d. Let me know if 
> you need a shorter version.

This is not important:

"While the AM62A and AM62D are largely similar, the AM62D is
specifically targeted for general-purpose DSP applications, whereas the
AM62A focuses on edge AI workloads."

It is irrelevant. Rest is fine.

> 
> 
>>>
>>> This adds dt bindings for TI's AM62D2 family of devices.
>>>
>>> More details about the SoCs can be found in the Technical Reference Manual:
>>> https://www.ti.com/lit/pdf/sprujd4
>>>
>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>
>> And what happened with the previous comments?
> 
> 
> Yep there were some indentation problems earlier, which is fixed in this 
> version. There was also an ack from Conor Dooley in v3. I will include that.

Why you did not include it before?

Can you start using b4 for your process of submitting patches?


Best regards,
Krzysztof

