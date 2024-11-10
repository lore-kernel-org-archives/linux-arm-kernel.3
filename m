Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72434D12D59
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 22:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkqTmDbdBXwncbB/SqrgnscfDV2IPo2W195nS7H5Lnk=; b=44MIlNPUkUA+FNSTTJpcDoHt9D
	cAHpjvl5ENi+a1zh83CgcGbOHFG1N1YOYFQVJ1A4+3QZgIJuCjTAqYTMg5w5/nY7XAcmDz8rh5B7a
	pthUbZHpL0VMLfJuLFO+h8JFKiOgzzssjwAu+DTgz0g89Io2BLfWAaJtIoK85wzUA21z12FqtGweH
	nwCw4BDlQXXzGn2eK3/CK9p5g+pCuLu8iTbWgoI6Vsz4KlIbAADV/GHFziBylbohW5d3uArEVPfGK
	PZYc0jB2ldfVHg6FRgEnfRMEG/eFXX0i/WqvwY0Ds4L2bTa7kjfN31MCPQe+2eNiFyKw052IJE7cV
	+V/2GNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAG2g-0000000Fgi4-45ij;
	Sun, 10 Nov 2024 22:04:22 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAG0t-0000000FgQi-3hXi;
	Sun, 10 Nov 2024 22:02:33 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731276149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkqTmDbdBXwncbB/SqrgnscfDV2IPo2W195nS7H5Lnk=;
	b=eqeaNeR48b2tbFZYf7aTI6Nz68dnUI7Qmke+o8aCsSgRaypo4fFkpa8RBHPO/JRPprdBE5
	fV84emiu4I5tV3XCwThhp7VFAzRWpaWLauPASa/mIrG/JM2KKn2GvX7xLB9ZE5anYbcFLU
	kUhxNW/qSp+tPvXUwgVBOUgoSIcJE7nrz2lGFTx3pt3mwM07PA5aGRS55IeLvgySKxQtzM
	m64fxwmlRSoQNQA92AN4pREctHGRRW8pMH9P0T0U/0oqGwL9w3gzc4pgtKWINb5GrftP++
	oIaDVbWmj/RxND7Iba314AhRmwU14x09fTr7/39FNyjNu3Fdqq4ePmwnlCyYHg==
Date: Sun, 10 Nov 2024 23:02:28 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdd_gpu voltage constraints on
 PinePhone Pro
In-Reply-To: <865640012.0ifERbkFSE@diego>
References: <0718feb8e95344a0b615f61e6d909f6e105e3bf9.1731264205.git.dsimic@manjaro.org>
 <4386271.ejJDZkT8p0@diego> <fb3700f2d67c7f062c66cb8eb0f59b17@manjaro.org>
 <865640012.0ifERbkFSE@diego>
Message-ID: <bececa1572e006935fdbb216a72c82df@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_140232_254126_D6D4D87C 
X-CRM114-Status: GOOD (  34.53  )
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

On 2024-11-10 22:16, Heiko Stübner wrote:
> Am Sonntag, 10. November 2024, 21:47:15 CET schrieb Dragan Simic:
>> On 2024-11-10 21:08, Heiko Stübner wrote:
>> > Am Sonntag, 10. November 2024, 19:44:31 CET schrieb Dragan Simic:
>> >> The regulator-{min,max}-microvolt values for the vdd_gpu regulator in
>> >> the
>> >> PinePhone Pro device dts file are too restrictive, which prevents the
>> >> highest
>> >> GPU OPP from being used, slowing the GPU down unnecessarily.  Let's
>> >> fix that
>> >> by making the regulator-{min,max}-microvolt values less strict, using
>> >> the
>> >> voltage range that the Silergy SYR838 chip used for the vdd_gpu
>> >> regulator is
>> >> actually capable of producing. [1][2]
>> >>
>> >> This also eliminates the following error messages from the kernel log:
>> >>
>> >>   core: _opp_supported_by_regulators: OPP minuV: 1100000 maxuV:
>> >> 1150000, not supported by regulator
>> >>   panfrost ff9a0000.gpu: _opp_add: OPP not supported by regulators
>> >> (800000000)
>> >>
>> >> These changes to the regulator-{min,max}-microvolt values make the
>> >> PinePhone
>> >> Pro device dts consistent with the dts files for other Rockchip
>> >> RK3399-based
>> >> boards and devices.  It's possible to be more strict here, by
>> >> specifying the
>> >> regulator-{min,max}-microvolt values that don't go outside of what the
>> >> GPU
>> >> actually may use, as the consumer of the vdd_gpu regulator, but those
>> >> changes
>> >> are left for a later directory-wide regulator cleanup.
>> >
>> > With the Pinephone Pro using some sort of special-rk3399, how much of
>> > "the soc variant cannot use the highest gpu opp" is in there, and just
>> > the
>> > original implementation is wrong?
>> 
>> Good question, I already asked it myself.  I'm unaware of any kind of
>> GPU-OPP-related restrictions when it comes to the 
>> PinePhone-Pro-specific
>> RK3399S.  Furthermore, "the word on the street" is that the RK3399S 
>> can
>> work perfectly fine even at the couple of "full-fat" RK3399 CPU OPPs
>> that are not defined for the RK3399S, and the only result would be the
>> expected higher power consumption and a bit more heat generated.
> 
> In the past we already had people submit higher cpu OPPs with the
> reasoning "the cpu runs fine with it", but which where outside of the
> officially specified frequencies and were essentially overclocking the
> CPU cores and thus possibly reducing its lifetime.

Sure, having higher-frequency OPPs working doesn't mean that's the way
the SoC is intended to be used.  It also doesn't mean that all samples
of the same SoC would work reliably with higher-frequency OPPs.

> So "it runs fine" is a bit of thin argument ;-) . I guess for the gpu 
> it
> might not matter too much, compared to the cpu cores, but I still like
> the safe sides - especially for the mainline sources.

Just to clarify, in this particular case the above-mentioned "word
on the street" came straight from TL Lim, the founder of Pine64, back
when we recently discussed what actually makes the RK3399S a special
variant of the RK3399.  He basically forwarded what Rockchip said him
about the RK3399S as a special variant.

One of the troubles, in this particular case, is there's no official
datasheet that describes the RK3399S, so it's all a bit up to "the
word on the street", I'm afraid.

> I guess we'll wait for people to test the change and go from there ;-) 
> .

Sure, but even with a few "tested, works for me" reports, we still
won't be able to stop relying on the above-described "word on the
street", simply because e.g. even CPU core overclocks, which would
of course be wrong, perhaps would work just fine for some people.
I hope I'm conveying this in an understandable way. :)

>> This just reaffirms that no known GPU OPP restrictions exist.  Even
>> if they existed, enforcing them _primarily_ through the constraints of
>> the associated voltage regulator would be the wrong approach.  
>> Instead,
>> the restrictions should be defined primarily through the 
>> per-SoC-variant
>> GPU OPPs, which are, to my best knowledge, not known to be existing 
>> for
>> the RK3399S SoC variant.
> 
> Yes, that is what I was getting at, if that is a limiting 
> implementation
> it is of course not done correctly, but I'd like to make sure.

Indeed, I'd also like to have it all checked as much as possible.
I'll try to extract the device dts from the test Android image that
was supposedly provided directly by Rockchip for the PinePhone Pro,
and check what's actually defined inside it.

> Of course Pine's development model doesn't help at all in that regard.
> There isn't even a "vendor" kernel source it seems. [0]

I see, it's a bit confusing, so I'll try to explain.  See, Pine64,
as an SBC and device manufacturer, basically has no official software
development model or an associated team.  Instead, the entire software
development, be it low-level or high-level software, is left to the
broader community made primarily of various individuals, who all have
different approaches to their work.

That's why I referred to "the word on the street" originally.  I hope
it all makes more sense now. :)

> [0] https://wiki.pine64.org/wiki/PinePhone_Pro_Development#Kernel
> states "There's no canonical location for Pinephone Pro Linux kernel
> development,"

