Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DCEC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 06:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKzqvHcLYMQ9A/ghtJ55tnbSdRDXZ2jRUIyCf46FFG4=; b=jzmccgkyea9W+PnBG+zk5J53/B
	XledRNkbuvfg0goD1Yz1zwP1+218xoxOtVTnAdC64okWLJWlGw5WvhSEIl4qlkMBnDUhrTMXHyQbP
	hC/CcRyhNnyB6fH5XLEADLsKAIzhVzp9HeJy1UevSb47QWAj9zCst/g60De9aArj7EaHgGpvIRITc
	Ir9M3axN6Gab/TdKEKuAMZW8koB44vw9BF65XcMZEfLXsr1EygST4sM9wkCJM/ZtIxkGPJRjQijPH
	ammp4+U6nEouZcoiBGFQsL6AAp8RhI1I+bpp05Pv15SBjRVEgIMDQ8xNGX+ULKYo4VduFkDgvx4TB
	63U8dVbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8CQD-0000000G3dQ-3gaZ;
	Fri, 25 Apr 2025 06:20:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8COP-0000000G3Wo-0WL8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 06:18:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4455868465;
	Fri, 25 Apr 2025 06:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56039C4CEE4;
	Fri, 25 Apr 2025 06:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745561912;
	bh=TZBqwTGakRiI4xCMOVlYfoco7l7Gxq+F1PuR3rAswoE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=efif1Fkve+IIndI24SNv7BWar4d22kcjqJZkjcLhP4kEZdmRVIoiq28MHClUVLifA
	 CjGFNAOiW0CBKFkLN+c+EkawiaQ4hMkpRdkZAeVF44mjgV+bOJtozJRUq5Zo93iRoo
	 lJnDU+At0qxHhJ+xhjtdkJ1jrTB28yara2Z3iKx7GDyTs7fzYsuQK8mybusMlt80p4
	 eLTIubHG3+S6Z1AlwZXNcX3kZhsdvGLyru1ltf3jVXTY2bXIKO0IHCIfLUG2YCwl1i
	 D0C4udRHeFyBA5Qu8MM70l0TH9TGHrm4B+ydBORrMSI0YdXcHHb3JGCNznsmnHEExG
	 sVUfuGbPaULng==
Message-ID: <a5f54d46-6829-4d60-b453-9ee92e6b568c@kernel.org>
Date: Fri, 25 Apr 2025 08:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v7 4/7] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250423072911.3513073-1-lukma@denx.de>
 <20250423072911.3513073-5-lukma@denx.de> <20250424181110.2734cd0b@kernel.org>
 <0bf77ef6-d884-44d2-8ecc-a530fee215d1@kernel.org>
 <20250425080556.138922a8@wsk>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20250425080556.138922a8@wsk>
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

On 25/04/2025 08:05, Lukasz Majewski wrote:
> Hi Krzysztof, Jakub,
> 
>> On 25/04/2025 03:11, Jakub Kicinski wrote:
>>> On Wed, 23 Apr 2025 09:29:08 +0200 Lukasz Majewski wrote:  
>>>> This patch series provides support for More Than IP L2 switch
>>>> embedded in the imx287 SoC.
>>>>
>>>> This is a two port switch (placed between uDMA[01] and
>>>> MAC-NET[01]), which can be used for offloading the network traffic.
>>>>
>>>> It can be used interchangeably with current FEC driver - to be more
>>>> specific: one can use either of it, depending on the requirements.
>>>>
>>>> The biggest difference is the usage of DMA - when FEC is used,
>>>> separate DMAs are available for each ENET-MAC block.
>>>> However, with switch enabled - only the DMA0 is used to
>>>> send/receive data to/form switch (and then switch sends them to
>>>> respecitive ports).  
>>>
>>> Lots of sparse warnings and build issues here, at least on x86.
>>>
>>> Could you make sure it's clean with an allmodconfig config, 
>>> something like:
>>>
>>> make C=1 W=1 drivers/net/ethernet/freescale/mtipsw/   
>>
>> ... and W=1 with clang as well.
>>
> 
> The sparse warnings are because of struct switch_t casting and register

clang W=1 fails on errors, so it is not only sparse:

error: cast to smaller integer type 'uint' (aka 'unsigned int') from
'struct cbd_t *' [-Werror,-Wpointer-to-int-cast]

You probably wanted there kenel_ulong_t.

> access with this paradigm (as it is done with other drivers).

I don't understand. I see code like:

	struct switch_t *fecp = fep->hwp;

But this is not a cast - the same types.
> 
> What is the advise here from the community?
> 
>> Best regards,
>> Krzysztof
> 
> 
> 
> 
> Best regards,
> 
> Lukasz Majewski
> 
> --
> 
> DENX Software Engineering GmbH,      Managing Director: Erika Unter
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de


Best regards,
Krzysztof

