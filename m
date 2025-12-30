Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4ECE94120
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a+BmYT8MYrgjGbvNoE2R73bn0bgh29YJZRHp4rJBUw=; b=oi9i5s6IFYteRvIETwoSb2C+3j
	cLIpECwx2JwTOueKzR9CdvPIwjkxf1zhZIhFk+XIG2tazuiltCSJUw7zuZDAgrzTmMdCWxMKBPQmI
	/NirOyx4gEkt6jO16fX1CiNAKLUfAjuJdtVAWDSLKLoPUeEjAYN3+XA7rssMawAnfjT7/znYsyc3j
	EtmSVEYZ458iQAIjFmPNqPx4lR/5z1oZ4QQoVsHfZl0mTUTFWb7wDzxDJo2FBL+lJIIk4qCgJWRvG
	eA0OT0CPm45eOhD8Bym3AG+K1ucOgqMlfR7I82Q+pkRFtl4DX6QsT639tGgVn/9nt9afkHerXtmM7
	OobcW+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaU1Q-00000004Va6-2OAx;
	Tue, 30 Dec 2025 07:20:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaU1N-00000004VZX-3UXo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 07:19:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4959143B97;
	Tue, 30 Dec 2025 07:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA523C4CEFB;
	Tue, 30 Dec 2025 07:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767079196;
	bh=/2UGBa3DyyErmarHe4sUFhN0qbPfDc2IdCES4ouUMns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sjNiTXiBujjRetdzcxmQfNrKq4YClTzaS8DN9sTJNTZgaB7A08/bAgIWhzD2YtlUZ
	 PiZYfH2tqiVK5zg6UMNhN97O/RxrjJwZEqcYCDtb7kzyoNAsxWccb103soYNqvdmH2
	 L8kEoI0I+fUSY5bgTdyLdBSygvqdOpu9F6nGCyU0/SLtX1hL+vcdvPLRG/SorExx6D
	 +CGnUtPcAILl0Dcnalvb7ffjUXlWEKO5/4csE3NfSFW9QuSDLUCWBCXOT7ZwGsIkX4
	 DSN8bUhX4iujZ5FRMA6fHX5cn++DlBGhT0ypkAky5WHAI/LtZLt1SsRr3v2BVRJbiQ
	 d7KKsdmcHHm8A==
Message-ID: <97f2d191-c8c7-4c47-bde2-9167991c4aba@kernel.org>
Date: Tue, 30 Dec 2025 08:19:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: cix: Use lowercase hex
To: Peter Chen <peter.chen@cixtech.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Fugang Duan <fugang.duan@cixtech.com>,
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251223152424.155253-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aVHb-kbi2QbChxj9@nchen-desktop>
 <88e9e4c4-13c9-4b96-88cc-abb581011e87@kernel.org>
 <aVMzY2VTFn-mNCEA@nchen-desktop>
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
In-Reply-To: <aVMzY2VTFn-mNCEA@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231957_916674_41F4491B 
X-CRM114-Status: GOOD (  15.60  )
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

On 30/12/2025 03:05, Peter Chen wrote:
> On 25-12-29 08:17:15, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL
>>
>> On 29/12/2025 02:40, Peter Chen wrote:
>>> On 25-12-23 16:24:25, Krzysztof Kozlowski wrote:
>>>> EXTERNAL EMAIL
>>>>
>>>> The DTS code coding style expects lowercase hex for values and unit
>>>> addresses.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>
>>>> ---
>>>>
>>>> Patches done with sed, verified with comparing unflattened DTB and
>>>> dtx_diff.
>>>> ---
>>>>  arch/arm64/boot/dts/cix/sky1.dtsi | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
>>>> index 64b76905cbff..fb8c826bbc97 100644
>>>> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
>>>> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
>>>> @@ -523,7 +523,7 @@ pcie_x1_1_rc: pcie@a0e0000 {
>>>>                         reg-names = "reg", "cfg", "rcsu_strap", "rcsu_status", "msg";
>>>>                         ranges = <0x01000000 0x0 0x38100000 0x0 0x38100000 0x0 0x00100000>,
>>>>                                  <0x02000000 0x0 0x38200000 0x0 0x38200000 0x0 0x07e00000>,
>>>> -                                <0x43000000 0x0C 0x00000000 0x0C 0x00000000 0x04 0x00000000>;
>>>> +                                <0x43000000 0x0c 0x00000000 0x0c 0x00000000 0x04 0x00000000>;
>>>
>>> Sorry, I could not apply for v6.19-rc1, could you?
>>
>> What do you mean? It applies cleanly on v6.19-rc1 and on next. Your
>> branches are not really updated, so maybe you need to fix this.
>>
> 
> Sorry for confusing. The patch was inserted by some special characters,
> See below: "=", and "3D". But no these kinds of characters when I save
> internal patch for upstream. Our IT is checking this issue.

The patch does not have them. It must have been your email system, which
broke it or you did not save it correctly. I suggest to apply patches
with b4, see my talk from LPC 2023 - Beginner Linux kernel maintainer's
toolbox.


Best regards,
Krzysztof

