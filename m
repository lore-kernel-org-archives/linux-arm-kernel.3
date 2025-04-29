Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF69C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 07:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nQtzhpIi44uw/z/MiwqoekLgmP9CvcmPUZmn2r+gcQ=; b=4Y56zLC1E8LnWUYFPoLdbxUND/
	jHJtjuKOjGvnbLdcAJRBQBYCvKPUQUcOV4lRGMHafBrLvj8PYCQk/cXLXICdWNzOSsoTKIKmbiL8X
	3/b7dZ/T2xkbAJC/KDQKN7VhUoxahuZJZ1Du9qDsxB/wLZE/kBu2/lDKWeujN6hte0JKnpgiNksjW
	c7Xd48yQf6OAtvGdsTHtcTDTm2DsiWp62zLVQqcuIXW91igtJVIPwYoKvTvTS8DEnYxrZOaunzipm
	5pZRZcDad4yLWv2PIcElBhJrMZLIOEuyu2iFyPcZkNJpx6YA2/ZxOqPxztO+psU26pwIDWbZViA81
	vsLUoX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fff-00000008oP0-3Ml1;
	Tue, 29 Apr 2025 07:46:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fUA-00000008lw6-1UXW;
	Tue, 29 Apr 2025 07:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A6B343E41;
	Tue, 29 Apr 2025 07:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7ABC4CEED;
	Tue, 29 Apr 2025 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745912073;
	bh=1FIwLwyQulKxxFP/ujnEVpEdgFJ8AVSMc5D8iY1ISc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jaRZw/fwNa8P6+yoOBvuASueTp81mAvevIGO5h2y3NT2ac5rUzI7PPeMzY0x4wxeP
	 hsbfxzfMJkWNqo9JVcuP/FLvwIFPlCg7L/QmeLfBN8XfbeTQBSzORgASauE7opb+46
	 VJNq9eT4v+TM0tE6DKElhVpHQDq7eKqXrlL5LshoR4eLWID9VkFbroFF4gvsXEZ0WU
	 pKXeWm9LqtGIyfEvWy1FjvCXxUs2q5VFV+M1HjAIXccYZ5jj8PLQBcTc2Qjmn541BP
	 r1OpbM0jqZoe9cvTTy+fybg46f0Pm2vV7wx/VhuVKihv9SkERJn7TBnd1YO3k0WUwk
	 WdxIQJKLCpN5g==
Message-ID: <4557dde5-c0fe-4339-8c4c-291b186ee86f@kernel.org>
Date: Tue, 29 Apr 2025 09:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
To: =?UTF-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kyrie.wu@mediatek.corp-partner.google.com"
 <kyrie.wu@mediatek.corp-partner.google.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
 <20250428-inescapable-smiling-oriole-bfbe3e@kuoka>
 <5735ebabb8b049bd7c8700a433bf5b073dde66ad.camel@mediatek.com>
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
In-Reply-To: <5735ebabb8b049bd7c8700a433bf5b073dde66ad.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_003434_431164_CC34A565 
X-CRM114-Status: GOOD (  11.34  )
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

On 28/04/2025 10:10, Kyrie Wu (吴晗) wrote:
> On Mon, 2025-04-28 at 09:01 +0200, Krzysztof Kozlowski wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On Fri, Apr 25, 2025 at 04:53:16PM GMT, Kyrie Wu wrote:
>>> This series adds support for mt8196 multi-hardwares jpeg enc & dec,
>>> by first adding mt8196 jpegdec and jpegenc compatible to install
>>> kernel driver. Add smmu setting to support smmu and iommu at the
>>> same time.
>>> Secondly refactor buffer and clock setting to support multi-hw jpeg
>>> working.
>>> Lastly, fix some bugs, including resolution change handleing, stop
>>> streaming sw flow and others.
>>>
>>> This series has been tested with MT8196 tast test.
>>> Encoding and decoding worked for this chip.
>>>
>>> Patches 1-3 Adds jpeg encoder and decoder compatible.
>>> Patches 4 add jpeg smmu sid setting.
>>> Patches 5 fix jpeg hw count setting to support different chips.
>>> Patches 6 refactor jpeg buffer payload setting to handle buffer
>>> size bug while resolution changed.
>>> Patches 7 reconstruct jpeg dst buffer layout.
>>> Patches 8 fix multi-core stop streaming flow
>>> Patches 9 refactor multi-core clk suspend/resume setting
>>> Patches 10 fix decoding buffer number setting timing issue
>>> Patches 11 refactor decoding resolution change operation
>>> Patches 12 fix remove buffer operation
>>>
>>> ---
>>> This series patches dependent on:
>>> [1]
>>>
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20250424090824.5309-1-jianhua.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!hDjzydf2blyIhdAkYs_NbqpEaaWTuolLbaHLDw8hLg4BJ87r7ePzKkET-uDw24U6YXAqmbSxItem1Q$
>>>
>>> Changes compared with v2:
>>> --refactor smmu sid setting function interface
>>> --Some modifications for patch v2's review comments.
>>
>> This is very vague. What exactly changed.
> 
> Dear Krzysztof,
> 
> Sorry for the shortly descriptions. The main changing in V3 is fixed
> dt-bindings comments by you.


What changed? What comments? Again way too vague.


Best regards,
Krzysztof

