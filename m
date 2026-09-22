Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CD6C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pp7mzsLIsbavEPfem5dhuoLyc27UEuONp1Ueoff5SSI=; b=g6+qSqnBOO2gAxZpKziKQ0yp9q
	hMaBkJdRW/URNcu4cGOzgpqp3yGkxQdT44Pzh6Ih/NAWMeZvjcL3WP04U7XU41RYP6a/YkNJufP76
	WH9zeJUJ514kNYLZaKcuqXBp+GEdncWhwVyjywNqTQl2S9loYn6i0Di0VhbBpUQZhO2LEvqZnq0NJ
	tFX3jGf0yZt2oZpPm6Y+7BdKSZZhD/MN5Su93s/f/GRtK+Nk0JTGqUnOARFBTfL4oZAwkcuRRWmIw
	dWR3qWdjvOntMProz6eGoKD3M6jLl3kjzPCcltTcZv8IFZFstSy4kB8iY8TWvBCvf+viPRMPHrE1X
	9AuyLTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zx2-00000005MZm-041f;
	Tue, 22 Sep 2026 12:50:24 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zwy-00000005MYg-0jxq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:50:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6921C4E41035;
	Tue, 22 Sep 2026 12:50:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20F0160580;
	Tue, 22 Sep 2026 12:50:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 645F4103289FC;
	Tue, 22 Sep 2026 14:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790081409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Pp7mzsLIsbavEPfem5dhuoLyc27UEuONp1Ueoff5SSI=;
	b=SMWmOhVcC5GkK+X8WZA70hvKKa1Ea1wfG8B8tKZVFCR7esnlKTgnDlY00+AKd/7poPloHR
	lR4szN4Oz0HMmVM7SP1/j32iV/h2Uq917H6w8dkEjAohMivLHrGDR8Fw+6fUzrnnKNxdjQ
	4xhNMo2FEdhN08NkltOWX+XkLxiMMc7ufK5UWQhsAdd6lR3tGFmyCoD2TZgRrFK+0I1xcn
	TURJ6ab/JM9OX1x7Ch01AlIaPajCgUzc6U1MwPCAnwjSMPy8y4AEVW2IeKXCqscj2IIPXj
	vEq7eaXP0k8jH2rJO/Cw8oKlRfsmb2MZuRrwyqrTY9XcfRn6NR8FbuDvLmERog==
Message-ID: <033fc935-c37a-4b0f-8b79-68248e45da8f@bootlin.com>
Date: Tue, 22 Sep 2026 14:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode
 PCS
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev, Coia Prant <coiaprant@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
 <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055020_375864_B24134C5 
X-CRM114-Status: GOOD (  27.82  )
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

Hi,

On 9/22/26 12:12, Christian Marangi (Ansuel) wrote:
> Il giorno lun 21 set 2026 alle ore 22:59 Jakub Kicinski
> <kuba@kernel.org> ha scritto:
>>
>> On Thu, 17 Sep 2026 01:51:26 +0200 Christian Marangi wrote:
>>> This series introduce a most awaited feature that is correctly
>>> provide PCS with fwnode without having to use specific export symbol
>>> and additional handling of PCS in phylink.
>>>
>>> At times there were 2 different implementation (this and the one
>>> from Sean) but Sean agreed that this can be picked and used in favor
>>> of his implementation as long as his case with race condition is
>>> correctly handled.
>>
>> Looks like the review for one of the patches failed so it won't be
>> emailed out:
>> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260916235200.20712-2-ansuelsmth@gmail.com
>>
>> Are all of the issues invalid?
> 
> Only one is relevant, but expected.
> 
> The remark on the fwnode patch are invalid. The driver is expected
> to return those error as probe defer is not supported.
> (a notifier and late attach/detach is used to align to phylink logic)
> 
> For the specific Airoha PCS driver it's really speculation from the AI
> but HW doesn't work as described by AI.
> 
> The only real comment that is valid is about the alternative way
> to give supported interface with the .get_capabilites OP.
> 
> This is currently not supported as there isn't any user and it will
> be implemented as soon as there will be one. It's really to limit
> the patch delta of this change and to progress further.
> 
> Maybe FIXME might be suitable?
> 
>>
>> Once the AI review is cleared, some human will have to review this
>> and vouch for you as a maintainer. Better still be your co-maintainer.
> 
> I think some revision ago there was Andrew that reviewed some code.
> Anyway thank a lot for checking this once in a while, I feel it's a pretty
> important change but I understand it's complex to handle as it does
> introduce a whole new subsystem.

I'm attending a Rust training until thursday, I'll see if I can squeeze in some
time to re-test on mvpp2 :(

There're a few series pending for rockchip and S32 on stmmac that deal with
PCS support and their PCS handle. It would be nice to have some stmmac glue
maintainers that are using complex PCS to help with maintainance or at least
testing, maybe Coia can help with the tests ?

Maxime



