Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD887CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajfnX6dMmVY7JCDQSBrodP3hJi7Tq1yTdnqow1jktWo=; b=qy42aVDBjp2gwNynK7y6x+TbQl
	xXRYdaFAnJV8n0jbPvAmZFYBQHvD3orZgPodp8tmejNX7v50R4uU2iiSxVIaafm/D/lHDtwAtP704
	y8jpsbLIV+mdLbf5uVeUw9t+633Ziq2dvD/qzgn50feR2xQIdPljZP7Lx028Nb9jx7yabe8XrFyQi
	kVrrbrA8wd3wJgUdET1HfJamvkemQgptD/KJDZZjZSrP0tVyy1DgESmu+BTvg4bt8j3b3LxWSKsKb
	EIR2qMMye5Y9tTmn5E5MHu7GM2cvTVtT5KjoOaTdYMoY4hox1xmj5rJW93LXfvpCapjFVpDoojOsh
	T5JxLu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOs1O-0000000EW8d-3f4D;
	Mon, 18 May 2026 07:04:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOs1N-0000000EW8M-1Fjc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 07:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ajfnX6dMmVY7JCDQSBrodP3hJi7Tq1yTdnqow1jktWo=; b=PCG/ShIiIgxbjAa8DEYdsof4wL
	otTGdx+I3MSN55tGzCGKGPcor8f14tIedXt+KNIOOOS9PTnnRrudW7NQbHQkp+wpSr3ha2OWZqbDb
	BekqEg1m+gOr8RuZjVv6HHWStmBMmXgmp0LhmGEiEWYcQl+iH+t1cCCSdqnhPn5QGu63z0EbI9EBf
	y4nGa5iVkOurUVCZ7+jWe+voKopLdnQibZvU7YsbkSH10T/ktznCkSRPvHR9j51gn9dKaSdKUZJUt
	LglxTyT6gebbY42yxUJyYa/0nIfjvefqrQuF7T3JAzptqAxvuBMrRFYf65xQvNU+OcJWzUJmRKKST
	3xJbgkcg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOs1J-0000000A6i3-442B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:04:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F74B43A30;
	Mon, 18 May 2026 07:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C8BC2BCB7;
	Mon, 18 May 2026 07:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779087845;
	bh=hnrDQUYFFgiNdzIDL56HetQO294DYGJMy2+uWl9Fu4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=loQUswwdkvWKSBGrHURb45xfjjYnNj68/OcI2MmNEZ3Tc1kBc3PSvJGLUuqiPpw3T
	 cuJZimDZ/TbC7KWexo2UhviQEupFfJ290THUbo4Wv3b7ihOVaZh3WWxJd9RkagNJ5L
	 VW3MZpAm4S3+Y9fEgwbIFZwMMZinbdJRb10WFh0kv81pQfC5yyXwXA4haGoEq4ew+9
	 0l5acAM2JXyGXqRw5UtOPe/rMevDKz4vsO0Lu1zjietCknyM4nmSw2uGJA0Vc9SDhy
	 BjzyFhymlDnMsjf/WG7il3iV8sdCW1R8uYDfFSkXNwGK0Fa4ph1znky3ILF/fSHPHq
	 TH86DbT4gTD5g==
Message-ID: <42d727b7-9117-4763-829b-6d7361c74b49@kernel.org>
Date: Mon, 18 May 2026 09:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: usb: add CIX Sky1 Cadence USB3
 controller
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de
References: <20260511024244.981941-1-peter.chen@cixtech.com>
 <20260511024244.981941-4-peter.chen@cixtech.com>
 <20260515-dynamic-archetypal-reindeer-dc6dd5@quoll>
 <agb0he7vvbqSIym5@nchen-desktop>
 <ccc8ab6c-d301-4585-8be3-1977485c5e87@kernel.org>
 <agq5eZSAZYRAuCH6@nchen-desktop>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <agq5eZSAZYRAuCH6@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_080410_802641_85443101 
X-CRM114-Status: GOOD (  12.72  )
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

On 18/05/2026 09:02, Peter Chen wrote:
> On 26-05-15 13:18:53, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL
>>
>> On 15/05/2026 12:25, Peter Chen wrote:
>>> On 26-05-15 09:54:10, Krzysztof Kozlowski wrote:
>>>> EXTERNAL EMAIL
>>>>
>>>> On Mon, May 11, 2026 at 10:42:43AM +0800, Peter Chen wrote:
>>>>> Add a binding for the CIX Sky1 integration of the Cadence USBSSP DRD
>>>>> controller. The schema documents the glue register window, clocks,
>>>>> resets, interrupts and S5 system controller phandle.
>>>>>
>>>>> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
>>>>> ---
>>>>>  .../bindings/usb/cix,sky1-cdns3.yaml          | 151 ++++++++++++++++++
>>>>
>>>> Why are you mixing USB patches with DTS in one patchset? Don't.
>>>
>>> In this series, the 1st patch is the IP core driver changes (export APIs for glue layer
>>> use), and the second glue layer patch is the user for new adding APIs.
>>
>>
>> Not really answer to my question. Why is DTS here? It has nothing to do
>> with 1st patch, second patch or this one.
>>
> 
> Per submitting-patches.rst I.7, the DTS was placed at the end of the
> series so either maintainer can apply their portion. That said, if
> you prefer I can split it into a separate series, I have no strong
> option.

Don't mix DTS with USB patchset.

Best regards,
Krzysztof

