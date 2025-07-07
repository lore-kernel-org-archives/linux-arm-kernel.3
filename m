Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D426C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhmy5rkMSvSqcfhj+qfTZQcUz9xL2qFz9IOTd4tVxPc=; b=a+MT4o8D8uke0IBfXbIKGUljEj
	PdGlwltQxjwmLXRbOfPy4TIF+L7MVOt5TJJZTujkgkeVmfrDxF4O/ij9caUFkqwhIvPnDbOQeADKT
	DluPV4W2r2tYlwL7eemhDEeFuWSTdgx9ot1A99c6AVrs76bbZR5dKjFRmVbLMrbfyhRh5Z2MvTR/U
	gSs4v1UNM32KGVvlPJx/O9OVxTSD5TD3xpSMp3mIwCjiQ6+bRaxrOOusDpdgwxGrBucLtjxNEAXyZ
	++wzmgatQIdvrVif9lhWNtXazyX1fMArfmYQE2KAK00EC1vtQdZ+leXctk8opKm+08SNoFwAJv0xk
	9ezrKonA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYneY-00000002q2f-1Mjd;
	Mon, 07 Jul 2025 15:21:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnQT-00000002oBn-0NZs;
	Mon, 07 Jul 2025 15:06:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A2AA5C5A61;
	Mon,  7 Jul 2025 15:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB15CC4CEE3;
	Mon,  7 Jul 2025 15:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751900796;
	bh=sYcFBrpnnl1CLUCgQkGP8a+tcIhX/H9KJmWT2MtG/0U=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=WojO9HUQAuPFgDMpOhPepbpHtdHKLdpXnhvufUzeyzEkHGzOexn2VukvSZOedHIvH
	 vGwv6A9t8RnV20QtbgPUsj4ounqSx85Uf0UNd+otKI9tM7oxW2AijT72zkjZvc6UsB
	 6hpP+D1hzCmTf1V7VpG5yUIsE26VbELj425R9uxq9tK5rkvcP8K2AjIaxONlh6VRRm
	 tETj4jRVlg7mjClrtLiiWGHMYboL7drDrH5a4/bRQG3qXnINphVf9SD0IAtW1jBWy4
	 XR9sU2JVx9vIj11nc6Ym4Owl/deZkRGmDSHXKQLRvh7Rqjd1oL2OG25GwRH+6NJvP4
	 3X7JJw89v2rrA==
Message-ID: <9b5d6bcf-f071-48e9-bcb7-8f0449a3d1d4@kernel.org>
Date: Mon, 7 Jul 2025 17:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/7] net: airoha: npu: Add NPU wlan memory
 initialization commands
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Felix Fietkau <nbd@nbd.name>
References: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
 <20250705-airoha-en7581-wlan-offlaod-v2-2-3cf32785e381@kernel.org>
 <20250707-agile-aardwolf-of-politeness-29fead@krzk-bin>
 <aGt2L1e3xbWVoqOO@lore-desk>
 <679e6fd2-967f-4057-9ccd-92a37ecc4819@kernel.org>
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
In-Reply-To: <679e6fd2-967f-4057-9ccd-92a37ecc4819@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_080637_212431_E4AF18AA 
X-CRM114-Status: GOOD (  19.51  )
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

On 07/07/2025 17:04, Krzysztof Kozlowski wrote:
> On 07/07/2025 09:24, Lorenzo Bianconi wrote:
>>> On Sat, Jul 05, 2025 at 11:09:46PM +0200, Lorenzo Bianconi wrote:
>>>> +
>>>>  struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stats_addr)
>>>>  {
>>>>  	struct platform_device *pdev;
>>>> @@ -493,6 +573,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
>>>>  	npu->ops.ppe_deinit = airoha_npu_ppe_deinit;
>>>>  	npu->ops.ppe_flush_sram_entries = airoha_npu_ppe_flush_sram_entries;
>>>>  	npu->ops.ppe_foe_commit_entry = airoha_npu_foe_commit_entry;
>>>> +	npu->ops.wlan_init_reserved_memory = airoha_npu_wlan_init_memory;
>>>
>>> I cannot find in your code single place calling this (later you add a
>>> wrapper... which is not called either).
>>>
>>> All this looks like dead code...
>>
>> As pointed out in the commit log, these callbacks will be used by MT76 driver
>> to initialize the NPU reserved memory and registers during driver probe in
>> order to initialize the WiFi offloading. Since MT76 patches are going via
>> the wireless tree, I needed to add these callbacks first.
> 
> Cover letter does not link to your NPU patchset. You cannot add dead
> code to the kernel and now it is pure dead code. Post your user - in
> this or separate patchset.
> 
> Your explanation of dependency is also confusing. If these are added to
> wireless tree (considering last experience how they rebase and cannot

... I think I mixed, that was Bluetooth tree which had rebases and
messed cross tree, not wifi. Apologies for confusion.

> easily handle cross tree merges), how does it solve your problem? You
> will have it in one tree but not in the other, so still nothing...
> That's anyway separate problem, because main issue is you add code which
> we cannot even verify how it is being used.
> 
> So far I see ABI break, but without user cannot judge. And that's the
> hard reason this cannot be accepted.

Best regards,
Krzysztof

