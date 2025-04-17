Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F287AC369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 07:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcA7pDgKK+U5Mz+haHQ3MkuxkQ95GUlYHJO8P+FhVRM=; b=qWmTZ5l+GPRDkyAMYBGEsONFVd
	DhHE72A3riaBavpS7RnGEZt0tJcEKDcNDhuFxhvNQgjAkuXtXXM6o+34Xa48lU8U0hNVe1UX6mtyN
	MKU+aZJxqXf9UZzB7GNpApdQrPkDK8YN3IDES7xZLErWET5Wo91vOphF14NUKcXnumhe2RxVMD8iM
	a/+yARLxXUCUX+HjGCoEAEgoxjIQp/idqlys5yo8tONxpR5H2B29v4g+3i1kLH1lSXsjrFv5R+FeK
	285GMuMPoki02OQ6MJWvblIr465pX0yxpaT08ZJtRFYPd6qxEWzsSctIErVDBgK4H4SFD3RyO7kL+
	Sd/NP0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JJb-0000000C1Ud-2vW4;
	Thu, 17 Apr 2025 07:05:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JCv-0000000Bzdd-1HOf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:58:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43D41A4B19A;
	Thu, 17 Apr 2025 06:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE74C4CEE4;
	Thu, 17 Apr 2025 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744873124;
	bh=M8uhNaUfmeUfmXvJOijmkV9Vyu1HDRBd4RGQBNHkCwc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NdOtQtMA1jsQ37MWkDC+nxveJNU226XU5TVyph3Esd5oOMolljHxa8HGtmzToKw78
	 R4Ta5snFJPGUhPuPIP5vPzlLg+T89NMzWdKXMVNhUe6/sr1P9jh3IyCSYbbLYebhnX
	 SBM+/KzTeu0mIyxvtiT4boW+ftgywy1g667fugvJJ+1Ddq6q6ihG5365+29wpK1udj
	 fwzL/S/Db0kvZoV6RxE0ntD+4R+KbLgdodeAdlwljlVRsn5oD9lLcq+wvjFOHEEqXj
	 LmrN2rKUB9F0Gc/LjcTwR+Wuj042TExn5I1eGp6mqqrl7RXij0LEnReKV4U4ZqlDv4
	 4GsLC/qj24RLw==
Message-ID: <b90c05e9-feb7-4569-b79a-b623e535c1d0@kernel.org>
Date: Thu, 17 Apr 2025 08:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cix-kernel-upstream@cixtech.com, maz@kernel.org, kajetan.puchalski@arm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Fugang Duan <fugang.duan@cixtech.com>, Guomin Chen
 <Guomin.Chen@cixtech.com>, Gary Yang <gary.yang@cixtech.com>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-10-peter.chen@cixtech.com>
 <74b9fc25-0815-4ece-845a-5f730c87fe78@kernel.org>
 <aAChkWPn4ThMx44A@nchen-desktop>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <aAChkWPn4ThMx44A@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_235845_475570_7F60023B 
X-CRM114-Status: GOOD (  10.02  )
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

On 17/04/2025 08:37, Peter Chen wrote:
> On 25-04-17 08:18:44, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL
>>
>> On 15/04/2025 09:27, Peter Chen wrote:
>>> +
>>> +             mbox_ap2pm: mailbox@6590080 {
>>> +                     compatible = "cix,sky1-mbox";
>>> +                     reg = <0x0 0x06590080 0x0 0xff80>;
>>> +                     interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +                     #mbox-cells = <1>;
>>> +                     cix,mbox-dir = "tx";
>>> +             };
>>> +
>>> +             pm2ap_scmi_mem: pm2ap-shmem@65a0000 {
>>> +                     compatible = "arm,scmi-shmem";
>>> +                     #address-cells = <2>;
>>> +                     #size-cells = <2>;
>>> +                     reg-io-width = <4>;
>>> +                     reg = <0x0 0x065a0000 0x0 0x80>;
>>
>> Messed order of properties. Keep it consistent (see DTS conding style).
>> Other nodes also have oddly placed reg.
> 
> Thanks for your reviewing, Krzysztof.
> 
> All the nodes mailbox and shmem (in mailbox) are on the same bus, so
> I keep it by unit address in ascending order like DTS coding sytle
> says. I think below rules are two options, isn't it?

You speak about nodes I wrote about properties. I don't understand how
your question is relevant to my comment.


Best regards,
Krzysztof

