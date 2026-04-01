Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808E810F6FB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hRVzEhlZwzZ8wVVA5UjHTC0Lyyh0yJglSiy2rOftVc=; b=f/eQyc9RHkyEuLqStErZcjR79T
	munQcLMk7/dtHBy2IKV8uol+Qiv7Qv/5ODvAMrelV9r6Imx1809+IeJRivbaPByT86wEmi64hthi+
	MXwBW9dLSKRla5Aj5SJInGwHC7Kn9V7QHUbIbAw0A0pt8jv4CckhAV+Pz3F1AUUkNf4Ck61kJDCaD
	nDE5fc+8RnFP3Wbu81QVLptkVphr7sL9LluH5vKCyhIZUiPFNjodHNY0gAfWwCikBLnsE7+MpzgfS
	xpJFJWLmxWocxGMlTvfTSm30dpk2yLBFoo2iWsmzqxJG1nXhdKoYX0jltccmfq77wsMnlqa6FY3Mv
	0dMR70GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wrC-0000000FWhA-3nPC;
	Wed, 01 Apr 2026 14:47:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wrA-0000000FWgF-1AEv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:47:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A102640AFB;
	Wed,  1 Apr 2026 14:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D0FC19423;
	Wed,  1 Apr 2026 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775054863;
	bh=bFq0wLQcXd7Pf2IEe6/f1kOW5sbEkuum7x3w6aRCflA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hSu0lsBa5hb4vmB+fMgSnd0KuSgEHjJ7SqviO8/4L+nn3tHwLB+MWfNaT8KKgAxTP
	 NF72tInCQuiS+P+W90BUy+YQCsL5rF+BX9iEeELK1qaMZkkkFlbowq+f/g0+TDM3bq
	 bXc9RG4H2/psoLTf4755EhAqji8JA5MqsMaLIX0zFBuVrY1d4Wn0vh6ELBSwcnfZ1e
	 APdTaOUe/vkodv6aDz+/6ErylwL3r+WYz0KyzHSrTYzTAy3LvF+fro+e0TDtoxK5JA
	 74FOyudBMG8E26uLuLsaLdeGbW4NHTTt2CeAIcebBp5IPPmTzLg45gTUgOHv++DVEE
	 Y2eUkGSbgyOQA==
Message-ID: <3f7879d0-9e5d-4c00-a5dc-4871a049afd0@kernel.org>
Date: Wed, 1 Apr 2026 16:47:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
To: Arnd Bergmann <arnd@arndb.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, Rob Herring <robh@kernel.org>,
 Gregor Herburger <gregor.herburger@linutronix.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@kernel.org>, bcm-kernel-feedback-list@broadcom.com
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
 <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
 <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
 <df52b2ae-4b8b-487a-bb6b-07bf021500b5@app.fastmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <df52b2ae-4b8b-487a-bb6b-07bf021500b5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_074744_362796_8B2872D9 
X-CRM114-Status: GOOD (  23.36  )
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

On 01/04/2026 16:37, Arnd Bergmann wrote:
> On Wed, Apr 1, 2026, at 14:02, Krzysztof Kozlowski wrote:
>> On 01/04/2026 13:18, Krzysztof Kozlowski wrote:
>>> On Mon, Mar 23, 2026 at 12:02:39PM -0700, Florian Fainelli wrote:
>>>
>>> I think the same issue was last time and repo is non korg, so nothing
>>> seems to improve.
>>
>>
>> Maybe last time I mentioned this only internally or on IRC, so could get
>> lost. Please get your key in to the kernel keyring, to solve above. Pull
>> is not rejected, but I leave it to Arnd who might have your key.
>>
>> How to get key signed? Obviously conferences are the easiest way, but
>> other is to find people around you or on your travel itinerary via
>> ksmap. Eventually many people do video call cross signing, so even
>> travel is not needed. I video signed twice, but that was an exception
>> because I prefer to meet in person. Kernel wiki has guideline on all
>> this, so I am not saying anything new here.
> 
> I think what happened is that the key expired. I can see that
> Florian is using the same key as the last 113 times, and I see
> it has signatures from other developers, but the copy I have
> expired in 2024, which probably caused it to disappear from
> the keyservers.
> 
> this is what I see:
> 
> $ gpg --list-sigs 9BE46ADFE60625D891F72B8587D0969C44070704
> pub   dsa1024/61579915B563760E 2008-09-16 [SCA] [expired: 2024-11-06]

dsa1024 might be another answer... DSA1024 was deprecated by NIST in
2013, so maybe gnugp even drops it just like keys with too weak signatures?

But another problem is that I do not see it in the `git log` of keyring
at all which suggests it wasn't ever submitted.

I don't think DSA1024 can be accepted now in keyring, so this requires a
new key, cross signed by the old one.

>       FE4FA16F65261D8BDA57BCBD61579915B563760E
> uid                 [ expired] Florian Fainelli <f.fainelli@gmail.com>
> sig          DE95E6B5B9FA86CB 2008-09-16  Florian Fainelli <florian.fainelli@openpattern.org>
> sig          9B1F67D46FF7D7AB 2008-09-16  Florian Fainelli <florian.fainelli@telecomint.eu>
> sig          F91A73ED49C617B5 2008-09-16  Florian Fainelli <florian@minet.net>
> sig          972BE49811AD8F26 2008-09-16  Florian Fainelli <florian@openwrt.org>
> sig 3        61579915B563760E 2008-09-16  Florian Fainelli <f.fainelli@gmail.com>
> sig 3        61579915B563760E 2014-11-09  Florian Fainelli <f.fainelli@gmail.com>
> sig          3A8F3B2F5A7C9849 2016-03-12  Michael Turquette <mturquette@baylibre.com>
> sig          E6BF0DCBA6694C84 2017-04-08  Andrew Lunn <andrew@lunn.ch>
> sig          987E58D467ED50B8 2017-04-09  [User ID not found]
> 
>        Arnd


Best regards,
Krzysztof

