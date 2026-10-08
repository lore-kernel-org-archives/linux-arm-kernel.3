Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F08CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 10:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfHXFrn9bxCF1k5xaIHcseuQSCS5M5xMD0l7wGXRV10=; b=vHMnguLKn8yBr8p23PpwaIjnA6
	hVQt0Egn2o7FpXA43EQ/XfUnvs3Usv8BKn/KLekMWaYFbkyb+Ke9CVb+Ii+gISegIPS/ecg/6+iep
	6zYGJp+K0XcfOxHzSbnaqr9F4QAJGMtuTZN/op4UBhDe8buFIYEsxxsxwOuJbcUyHsI9/Snp1njgd
	Ix9mj7NwqyforN/dPQwgTngm+p1ly9CLm2+sEpQVb+ii3qqnAdfpkKxNkOrt8SIRjJmGtzKLXJAQR
	NHtDxN61BC8HEW4tz8DMR734ckuOHrYzQUQo9GoKnWHjJHTBnyyCsNE04o5tKPKItA09o/3YPEpC5
	fam+CnmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkzu-000000043d5-3ty6;
	Thu, 08 Oct 2026 10:05:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkzs-000000043ci-0it9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 10:05:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 995AF1477;
	Thu,  8 Oct 2026 03:05:02 -0700 (PDT)
Received: from [10.200.189.43] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 456533F763;
	Thu,  8 Oct 2026 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791453906; bh=9yshqY0UsvsN2Mu7vdC0H+AY9MBl3HX2n35HE4yMhMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AOURYJ4RFZP2eUpD9e3naQX9rcXMBm4r9ZpeLyLg9mN0ienQYSL3PYRj5KN+WBfe8
	 JvHtHFmAAfmzMlFtlmoHLrDURDE7yUaSOugZ7DKeupGFwo/+SS2/aPVc6B8fA4k3jS
	 Gqivs41alLwZ/RIhwpfzrVbzgCYgR7VbvtJNBmDk=
Message-ID: <c031b259-e6a2-4eed-8174-b7fdb4075646@arm.com>
Date: Thu, 8 Oct 2026 12:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner
 B288
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Pablo Mazzini <pmazzini@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-4-pmazzini@gmail.com>
 <20261007211626.GA338242-robh@kernel.org>
 <6bb97a9e-cc9c-48c0-bf6d-3a1c6e8048f2@arm.com>
 <CAD++jL=5XbF11=B8Ek0sEXbBthDvMXntsS1B3g=hVj3tvJrJ8Q@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAD++jL=5XbF11=B8Ek0sEXbBthDvMXntsS1B3g=hVj3tvJrJ8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_030508_438674_983CE604 
X-CRM114-Status: GOOD (  16.95  )
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

Hi Linus,

On 10/8/26 11:21, Linus Walleij wrote:
> On Thu, Oct 8, 2026 at 9:50 AM Andre Przywara <andre.przywara@arm.com> wrote:
> 
>> If you mean to just drop the allwinner prefix: this has been discussed,
>> but NAKed, because the generic property carries a different semantic.
>> And implementing that generic behaviour in the existing sunxi pinctrl
>> driver would be quite some effort (read: a rewrite), without any obvious
>> win, so we decided back then to not boil the ocean here, and just go
>> with a special property.
> 
> The point to switch over to the generic "pinmux" property would be
> when a completely new SoC series with new hardware arrives, so that
> it is significantly different from earlier iterations.
> 
> I don't know which semantic with the standard "pinmux" property you
> got hung up on though remind me?
> 
> The bindings just state this:
> 
>    pinmux:
>      description:
>        The list of numeric pin ids and their mux settings that properties in the

                      ^^^^^^^^^^^^^^^^^^^

it combines the pin number *and* its pinmux. For allwinner,pinmux we 
just carry the pinmux bits. The generic binding makes a lot of sense, 
it's just not very appealing to the existing sunxi pinctrl driver.

Cheers,
Andre

>        node apply to (either this, "pins" or "groups" have to be specified)
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> 
> It's just an opaque u32 array controlling all muxing for a device.
> There could be one single element in the array.
> 
> Yours,
> Linus Walleij


