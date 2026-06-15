Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C47CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 05:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRGNIGtUAxBOWfQbVDUpWr/GEJrIZSxFUDYy3Ng1TpQ=; b=pPrt7IK16ISYBiToSlx6ncxp73
	F8+FPRxaPNohQ/bjiKI7eSa1O/chWqMelpEJICiiWEtLl/9K4h/s61plveqhTXtEoX8sjSAs1hacZ
	ZfH64R4x1CobDIld9tx1iFH1MSSzzWawIuYGNG/wxfctBc/8t04wwhevPfuE4KtCHYA5oRn8Ba1uf
	kymWzkvB9G6W9GYFpaQg8ahGVw/v7dYa2MyXNY9G/ttn5fFvfQh9DX/DwudoHLSICDrqa44G9WLZQ
	VprPm5z1hyYvpFSUHGP41d2YE/g7zOG9S5cC7TdNxUPu5PJ9zgGSwpfCFNSirNr9X4cuYdbVD0i49
	zQ/ohA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzwI-0000000Dd4D-1lWI;
	Mon, 15 Jun 2026 05:32:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzwH-0000000Dd3y-1lyh;
	Mon, 15 Jun 2026 05:32:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70C8B4031A;
	Mon, 15 Jun 2026 05:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6EE1F000E9;
	Mon, 15 Jun 2026 05:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781501568;
	bh=HRGNIGtUAxBOWfQbVDUpWr/GEJrIZSxFUDYy3Ng1TpQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Zm/iRI7Ktx20LebZL51LZEg+XsJ6ZzByDbBldJ86cFjZnspaXCO6PE2GNyUnq42FD
	 29PUmQJbUaZAzL9DMoFupucV47DbFexbVusfdU99hORmByEVzrTASkI4ekdt0ZP9IG
	 WVvqgccjJ+VF6lb+a1aoKCwLbPOORCIZJBtlMO4nsyVe7kOoTKEUDDO+izOJ2JvB8S
	 A1AnZj3YqzTPvR7NMJd5OjL6LcelwUagCNPWn25bxZev8KOPP+BCiGuodj9WYTlmxV
	 3AxAEhXWtrvtyyuVW1hzD6opOR9zurAKSDEFs9EKPjhK1rvxtbL7e17XQbUeIpvaCC
	 BHt5h86qBEomg==
Message-ID: <542ec217-1187-4fb2-8fd3-b90a6143b84d@kernel.org>
Date: Mon, 15 Jun 2026 07:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio
 irq property
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
 <20260611-ungloved-snowplow-522e7c0b7a51@spud>
 <a79e58b5-3a11-4593-847d-ba92527549bf@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <a79e58b5-3a11-4593-847d-ba92527549bf@amlogic.com>
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

On 15/06/2026 04:47, Xianwei Zhao wrote:
> Hi Conor,
>     Thanks for your review.
> 
> On 2026/6/12 01:39, Conor Dooley wrote:
>> Subject:
>> Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio 
>> irq property
>> From:
>> Conor Dooley <conor@kernel.org>
>> Date:
>> 2026/6/12 01:39
>>
>> To:
>> xianwei.zhao@amlogic.com
>> CC:
>> Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
>> Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley 
>> <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin 
>> Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
>> linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
>> devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
>> linux-arm-kernel@lists.infradead.org
>>
>>
>>
>> On Thu, Jun 11, 2026 at 07:54:33AM +0000, Xianwei Zhao via B4 Relay wrote:
>>> From: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>>
>>> Add the hw-irq property for each GPIO bank and enable interrupt-parent
>>> for pinctrl so that gpiod_to_irq() can translate GPIO lines to IRQs.
>> Uhhhhh, what? Why can't you just use the normal interrupts property?
>>
> 
> The interrupt cannot be used directly because the GPIO bank only 
> provides an IRQ base, which does not have a one-to-one mapping with the 
> actual hardware interrupts.
> 
> On Amlogic SoCs, GPIO interrupts are handled through a mux. Multiple 
> GPIO pins are mapped to a limited number of real interrupt sources. The 
> implementation can be found here:
> 
> https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-meson-gpio.c
> 
> To use a GPIO interrupt, an unused hardware interrupt must first be 
> allocated, and then the corresponding mux register must be configured. 
> This allocation and mapping are already implemented in the existing driver.
> 
> In that driver, the mapping is performed dynamically rather than simply 
> calculating:
> 
> irq = irq_start + gpio_offset
> 
> If the interrupt is used directly, only the GPIO index can be obtained. 


If it is performed dynamically, then it is not suitable for DT.

You still did not explain what hardware aspect exactly is described by
"hw-irq".



> The real interrupt number cannot be derived by simply adding an offset, 
> because the hardware interrupt must be allocated first. Pre-allocating 
> all interrupts during initialization would prevent later GPIOs from 
> obtaining available interrupt sources.
> 
> Perhaps other names would be more appropriate here, such as "irq_start".
> 
>>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>> ---
Best regards,
Krzysztof

