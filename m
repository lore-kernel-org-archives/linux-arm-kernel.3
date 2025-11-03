Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF48ACCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzAszSWDtU82Su6aXsdxcziggr3awsEuHFtnEj7fvT4=; b=bKSA0FVpDaoTT53BC0VijPn4v3
	70L5ChJhy4DwJCXQSScMvUNxooNy7u5w34Rvl81TPfK3EdqkRMUpdrGo8zLHM+HJkaSEX3MSHFiL+
	gf8h4WCoEeepoBi1GEg2BKUsugh4JtXNYl8wnF5ov/iG27oylW71MzzBBrZz5GeF7cOc2czqnvq/A
	TarWc/EPcMzu6rY0a4z4SlG9dm48z/fL3tPjfn6ZQDRfGG4L7FFb4+Y0Su4xtAc5PDbgFzBJEFfxC
	ePJfc5VZTZJk46lYEQZPuzGLwAxvgzaWIWMmVrD8IvH7gyPv9lTiWy3RbLYFzJZQbcHO/6Q1W7CjI
	XHqy9fmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFv6Z-00000009yh6-42sE;
	Mon, 03 Nov 2025 14:00:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFv6Z-00000009ygl-0IwB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:00:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 384276013E;
	Mon,  3 Nov 2025 14:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF79C4CEE7;
	Mon,  3 Nov 2025 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762178416;
	bh=08PC3/AvFg4BABny9/8my4vAacX9aJRn5UW8imC12P4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sUw80VCpomPZrm81732UjVojj5Qvf3UxuVADgq1JY2zGk2KPxO4eQGAjSigELTMDi
	 H1s7fZiywF7FXUP/yldLUH6X7YGVxy46h8HfBHiuCqG0dayMJ+XLLkW6MLgqsrSaNC
	 3AnGk1eX+Z0wdrYNTWJUBIAASenX3gNm/KyqiI49n8ayxRy1v0OFR7cnqKyp2+ILUV
	 +RTd11iKudbDIzDZIMRUy57Z8Z+2lbSVw1om5A7ifi8HTP89ipZvJOFXSceNweH4NQ
	 yxbTi5ErQnmxPsIDKjiFJVR2cpmlyfWNOYcBs+1WndiNmD6Q++pIy2JYEmFYSQkGct
	 au4jlnQVSWbzg==
Message-ID: <79d45a6d-df37-475a-9edd-57e7a06155e3@kernel.org>
Date: Mon, 3 Nov 2025 15:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] platform/raspberrypi: Add new vc-sm-cma driver
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com
Cc: Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dom Cobley <popcornmix@gmail.com>,
 Alexander Winkowski <dereference23@outlook.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Juerg Haefliger <juerg.haefliger@canonical.com>
References: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
 <20251031-b4-vc-sm-cma-v1-9-0dd5c0ec3f5c@ideasonboard.com>
 <cc7edba3-af91-44ef-9899-18c21a3f33bd@kernel.org>
 <176217777617.8690.2075618272816893198@freya>
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
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <176217777617.8690.2075618272816893198@freya>
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

On 03/11/2025 14:49, Jai Luthra wrote:
> Hi Krzysztof,
> 
> 
> Thanks for the review.
> 
> Quoting Krzysztof Kozlowski (2025-11-02 15:00:58)
>> On 31/10/2025 18:27, Jai Luthra wrote:
>>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>
>>> Add Broadcom VideoCore Shared Memory support.
>>
>> You will have to come with really, really good argument why CMA is not
>> working for you. This is how you write commit msgs. All further is not
>> really helpful.
>>
> 
> From my limited understanding, this driver allows sharing buffers between
> the kernel and the firmware that controls the ISP and codec on the remote
> VideoCore VPU.
> 
> Maybe Dave can comment better on the historical reasons of this approach
> versus other DMA buffer sharing mechanisms available in the kernel, and if
> it is feasible/possible to make that change today.

You are upstreaming this so you have to come with rationale and detailed
analysis why existing infrastructure cannot work here.

Of course maybe it's just commit description which needs improvement.

But anyway, please do not send downstream Rpi drivers to us just because
downstream has them. That's never a good enough reason. And that is the
only impression you are making here.


...

>>> +
>>> +module_vchiq_driver(bcm2835_vcsm_cma_driver);
>>> +
>>> +MODULE_AUTHOR("Dave Stevenson");
>>> +MODULE_DESCRIPTION("VideoCore CMA Shared Memory Driver");
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_ALIAS("vcsm-cma");
>>
>> Why don't you have proper ID table? How this driver is supposed to be
>> instantiated?
>>
> 
> Sorry, I was unaware of this discussion:
> https://lore.kernel.org/linux-media/2023100955-stunt-equate-c6fa@gregkh/
> 
> I will switch to using an ID table.
> 
> This and other drivers for audio, isp, codec are all instantiated as
> platform drivers under the VCHIQ bus (PATCH 13/13).


If you have a bus, not some sort of MFD device, then you should use bus
way of binding, which means in almost all cases providing an ID table,
which will generate proper aliases.

MODULE_ALIAS is basically only for the few cases where platform driver
registers another platform device or for MFD (and even then only for few
MFD cases).

Best regards,
Krzysztof

