Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ACFC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 06:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXj7CZeqo1loDtSz0pXTzQ1JoeNkYByZu2BnknAMqN4=; b=gJgismovUPPwkSCABKGPmO1IJc
	Nvb/cQus5VjycoFrlQ+ftlmzRwnsrhIcPC3zCZ4W0MQja5TC3QhKcEEz5jYop6yU7SbxcQRHL7zQX
	HErKqN+WYTGup5dxPv7lX0IZL9DsOlgydEke0CWoLjeGW1M+bIcuiqCWnnRkVQPAVrz1/VMCk6Z2F
	1KXzZelfvi4ohYGVoXFhbjpZgUBAhRuuhL6AvC8xVO+fSFE97sMfXn7htISdcItfbhsHUPd7XhsbH
	a4CO5ZMbpmvkJNxNLLVF8ApJt77Sufn9ceg01O4Vv9een2rQEkiKtKnpUvtVIbo1cXYKkVOz+XRow
	FqqUJ06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvs1-0000000Atwp-10GI;
	Thu, 20 Aug 2026 06:03:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvs0-0000000AtwY-2LrV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 06:03:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7783C60A84;
	Thu, 20 Aug 2026 06:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAE91F000E9;
	Thu, 20 Aug 2026 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787205799;
	bh=uXj7CZeqo1loDtSz0pXTzQ1JoeNkYByZu2BnknAMqN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Bk2yfDZB6ALt7tiJO60H8je+GokIcayDpuTkE3D5rvn1AlEbdc77/FF7OZkHPCre7
	 zq4000MqgbBOhr3+hNKWJRyOoyVarikKf44o/jkI2msY2RDpReLXk1JyALSDg3sCae
	 6ZnloNUZO8g/SebhY2GzcEDdEtrNoaEgF8s2C/vrfzdl5K3Q/Jsw777YqhJTkk1Xlo
	 8FteA5mrBIYyQzCmyEVqzDr/TcRQ47XDGiiUEtMwwXwjPCwLO0ROYaK5gP9IKH+hGL
	 r0L0MzbK8xnRxSZbmULLCUK68afRvzghIr52WbmEK1UXowkc9ys0UZ/BDp9PfXoqXZ
	 E7WpsEJ5+JGXA==
Message-ID: <56db332f-a18e-4a9e-be9d-67d2e25c3666@kernel.org>
Date: Thu, 20 Aug 2026 08:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for
 frankel/blazer/mustang
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 soc@lists.linux.dev, Juan Yescas <jyescas@google.com>,
 RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>,
 William McVicker <willmcvicker@google.com>, kernel-team@android.com
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll>
 <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org>
 <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 19/08/2026 19:04, Doug Anderson wrote:
> Hi,
> 
> On Wed, Aug 19, 2026 at 2:02 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>>> Is there some other documentation saying "aliases == evil" that I
>>> missed? Maybe some email thread we're all supposed to have read?
>>
>> A lot of rules are implied by other rules and this one, how Linus stated
>> in other thread, might be implied by no-Linuxisms as you want ordering
>> or stable naming of Linux /dev entries.
>>
>> I understand your reason is actually different than above, but your code
>> does not suggest that.
>>
>> Anyway, if you wanted to have aliases as ABI, it would have to be
>> documented. You cannot send post-factum DTS and say "we already use it".
>> Every ABI must be documented before usage.
> 
> I'm happy to document. Can you please point to how / where I would

Description of:
Documentation/devicetree/bindings/ufs/ufs-common.yaml
And obviously, as with every binding/ABI, you also need open-source,
upstream user of this.

> document this? As far as I can tell, no aliases are documented today,

git grep disagrees with you, e.g. second paragraph of serial.yaml.

> so this would be the first. If you could give me a hint of where you'd
> expect it, that would probably be better than me guessing.
> 
> 
>> And this is what my comment was about: "they MUST talk
>> with upstream open source maintainers before they ship such ABI."
>>
>> And no, sending such DTS in your v1 is not documenting ABI. Does not count.
> 
> Sure, sending a DTS isn't documenting, but it _is_ talking. Discussion
> in responses to patches is where we figure things out. For that to
> work, reviewers need to point out problems and then we need to have a
> continued discussion until we can figure out a solution. When that
> discussion just stops, it's incredibly hard to make progress.
> 
> 
>>> thus implicitly provides an "instance ID"?  Would it be OK if I
>>> changed my alias name to "ufs-primary" or "ufs-internal" or "ufs-boot"
>>> or just "ufs"? We're not using the alias to get an instance ID, but
>>> when I added the alias I followed the pattern of all the other aliases
>>> and put an number at the end.
>>>
>>> I'm happy to attempt to fix our bootloader using whatever scheme
>>> upstream suggests. I'm trying to "talk to upstream" as requested, but
>>> for it to work I need upstream to talk back. :-)
>>
>> Make your case - what is the purpose of it? Boot device? Then you have
>> "chosen" node for stuff between firmware and OS. There is even a
>> property called "bootsource". If this is not boot device, but some
>> calibration data for ONE given instance of IP, regardless whether you
>> boot from it or not, then I find such case as border-base and not worth
>> implementing, because basically one can come one month later with "I
>> need 1000 aliases because my bootloader is patching up every device
>> node".
> 
> I think I've presened my problem fairly concretely [1]. If you hate

There is no description of the problem at [1], except "bootloader adds
the same type of calibration data".

So I repeat my questions: to every UFS node? To every node? To one UFS
node (but how do you guarantee that?)?

I gave you two solutions, depending on actual upstream need of this. If
you have the second case - so not the boot device - then you basically
want to re-implement overlays which you cannot. Use overlays, which
gives you nice stable and build-time verifiable label/phandle.



Best regards,
Krzysztof

