Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5F2C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETDvRVLoFd8Kn+xtd3X2yg3Wj607hdJ9xcrOiy6lh68=; b=39WaB+jkaJT6MPYBTwB/JzYOGY
	i2OWhJHKVCCOimMxiHAE0Gx5/7zmGegJuNuS/0DeChtR2wLL/DF9OotRw4dqbGZNRNJE+iYhVzqs9
	0d5J5cM/JoYm6HOzsEjaQ+HZ9b3aWm1cbHrNIS5NdyeLfBBj6vbBFthQzVsOWi4Ug10PFLtgeFalW
	CKoDZ3LfKRH+pDqeEG69wnfcdPp5J4KvV0pX2GWu51sFAxJ+4F3VjxwOhiH5UlwLFHEkaov9bD7ly
	QAAIugiYwZ15l6srsNZ6zz3vJWem1vRTpXJoW8bi0HCk8mKfd8m7av/NqeNgURJgayshDEzEcy+ve
	ZA6XvDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozFK-00000007BeQ-1Eb0;
	Wed, 29 Jul 2026 08:02:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozFI-00000007Bdz-2tv9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 08:02:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0524C438CB;
	Wed, 29 Jul 2026 08:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641201F000E9;
	Wed, 29 Jul 2026 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785312151;
	bh=ETDvRVLoFd8Kn+xtd3X2yg3Wj607hdJ9xcrOiy6lh68=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DhOSZ2XIZzmUHm5UHLW4cink/2JeNlJqCtKvUsqJhNX4vGUTQGseKrwMZM0s9Eopv
	 DgZ+ywXKt70saNOe+MrDvY+uDZSpsEKHcHsECiK6Aw/JPwEWyekxrKtk81AEgzkLRh
	 1IHO+/xa7DNg6NyAQQVzOKvAU0rMAyuL7OyKvXkN/5ID7xRNmSe7JB5ncVuUuQqDud
	 wcgd/dHJmF3dxDgJZWX3vC1/dKXedt2gtokpp2XvpG3s59JKFrabF2TqPyA8XNpEL8
	 1R+CA8jlcLA4csqcXj9rPjlAUAX9AyHPetSw3nTQA4BgcpDxoJkGkj/ky+Okcz+hl9
	 BCJROv4sKQosA==
Message-ID: <15904301-fd03-45e5-b909-dfce52449726@kernel.org>
Date: Wed, 29 Jul 2026 10:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Remove driver
To: Eric Biggers <ebiggers@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Demi Marie Obenour <demiobenour@gmail.com>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <2026072410-drained-acts-3502@gregkh>
 <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
 <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh> <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh> <20260724155144.GA2032@sol>
 <20260728152241.GA4281@quark>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20260728152241.GA4281@quark>
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

On 7/28/26 5:22 PM, Eric Biggers wrote:
> On Fri, Jul 24, 2026 at 08:51:44AM -0700, Eric Biggers wrote:
>> It is consuming a lot of the community's time to help maintain,
>> including dealing with LLM-found bugs, with no clear benefit to anyone.
>> Even considering *just today* we can see someone sent a bug fix:
>> https://lore.kernel.org/linux-crypto/20260724081537.191992-2-thorsten.blum@linux.dev/
> 
> Another example:
> https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
> 
>> It definitely *was* causing problems before it was disabled via the
>> crypto priority system (which made it unused in the kernel) and dropped
>> it from AF_ALG (which removed most of the unprivileged attack surface).
>> When anyone accidentally used it, it caused at least a huge performance
>> problem, and sometimes other problems too like filesystem hangs.  It was
>> an issue for years.
> 
> This actually seems to have been an overly-optimistic characterization!
> As per
> https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
> this driver drains the battery on every system with the module loaded,
> even when no crypto requests are actually sent to it.

Unfortunately removing it drains way more battery, because the buses
never hit sync_state and are kept at their maximum frequencies:

[   18.021823] qnoc-glymur interconnect-1: sync_state() pending due to 1dfa000.crypto
[   18.029605] qnoc-glymur 16e0000.interconnect: sync_state() pending due to 1dfa000.crypto

(it transiently also pins DRAM and friends to max-freq which absolutely
kills battery life)

I understand your concerns given the past handling of this driver,
however I believe the nuclear option comes with way too much fallout..

Konrad

