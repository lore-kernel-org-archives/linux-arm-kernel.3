Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6600FC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+XgH0rIRqKV07OTyvhe5YqpcOYz2bBf5mCHrTax72w=; b=4L9X1zMfNSJrf4FccR/YnhtY+j
	l5pp5jJvzARKDYoEUR6eJQ6aYcKM3hExs2zcsfFMcWTet+B20BjMbBGsuqyq+xF0bma1U0/qecAdo
	ptx/BA41ocxkWQAABDJxAIo1uFAxztAw1Tq7W9qZDvAfxPi2u3hswYgbPgHbtZT5tqxfeKDuW9U5S
	KE/l7TRHWGvQmt26WjJ1VWcTLDvgaSQKdkiFgNERuty4wKEgWX0/35kYg9wOUa/8M60ejTJSnBvCg
	1Msim6C9GvaqTe+agCfk0jpIQEdDUeCMeLTBWlVdaGTTC0Vc/CHMWb5LLRd7AeErio5uYbyOjdHhc
	pzVQEo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0jb-00000000fsK-1GUH;
	Thu, 08 May 2025 12:52:19 +0000
Received: from mail-244106.protonmail.ch ([109.224.244.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0as-00000000e7T-2Ie7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 12:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746708195; x=1746967395;
	bh=0+XgH0rIRqKV07OTyvhe5YqpcOYz2bBf5mCHrTax72w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=OIkSZspvQ4QqIyHkLoBDX1f0k8Cunqwe+LQyURHMMvZxOEboElm85r6ayAoW35GlN
	 Z/S1BfBApmOZQvIiuTd1GIczM8VrooixpwCUYIUrKRMsf8kFNGwfR/H7qO0muDfsEP
	 6kc+cxcFZ91D5BldZqvDZqWHo2Cb3L0xI31exXwPqjmy9kFcMtVgLl2pITatMJq/XR
	 +2YnTkC038n5zWlehvX3OvTUI0G4yuNkNPwhdx57ZYDbhFdJXYlD3TkQBNDRlJxTl2
	 q+id2RrZuiE4lR58Rh9pLtTayn/3CTIYodWPlCO127xpaX9+A6DG/O/kb1e0By0xOU
	 /T6jR/nOdLUIA==
X-Pm-Submission-Id: 4ZtWy62rNnz454
From: Esben Haabendal <esben@geanix.com>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,  "Will Deacon"
 <will@kernel.org>,  "Stefan Wahren" <wahrenst@gmx.net>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  "Shawn Guo" <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
In-Reply-To: <5724399.aeNJFYEL58@steina-w> (Alexander Stein's message of "Thu,
	08 May 2025 14:25:44 +0200")
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
	<7023673.LvFx2qVVIh@steina-w> <87ecwzy0pw.fsf@geanix.com>
	<Etws1ew28TLJxt4SyQRijrPqBXWRnMQ518XgfauJ5tEfgI2y1mms25jjdVACQnjc2jZmc-PHiK4BIVQ4M8a09A==@protonmail.internalid>
	<5724399.aeNJFYEL58@steina-w>
Date: Thu, 08 May 2025 14:43:09 +0200
Message-ID: <87a57nxogy.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_054319_464366_6E42E8D7 
X-CRM114-Status: GOOD (  27.87  )
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

"Alexander Stein" <alexander.stein@ew.tq-group.com> writes:

> Hi Esben,
>
> Am Donnerstag, 8. Mai 2025, 10:18:35 CEST schrieb Esben Haabendal:
>> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>>
>> > Hi Esben,
>> >
>> > Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
>> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>> >>
>> >> > Hi Stefan,
>> >> >
>> >> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
>> >> >> Hi Alexander,
>> >> >>
>> >> >> [add Shawn and Esben]
>> >> >>
>> >> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
>> >> >> > Select PINCTRL for NXP i.MX SoCs.
>> >> >> could you please explain the motivation behind your change?
>> >> >>
>> >> >> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user to
>> >> >> disable pinctrl")?
>> >> >
>> >> > Ah, thanks for the pointer. It might be the case.
>> >>
>> >> The goal of the patch mentioned above was to be able to build a kernel
>> >> for LS1021A without pinctrl framework enabled, as LS1021A does not have
>> >> a pinctrl driver.
>> >>
>> >> With your patch, that would not be possible anymore.
>> >
>> > Why? LS1021A is arm, not arm64 which this patch is touching only.
>>
>> Good point :)  Sorry about that.
>>
>> > BTW: Commit b77bd3ba762f3 ("ARM: imx: Re-introduce the PINCTRL selection")
>> > is actually doing the same for arm as there is some fallout from
>> > 17d21001891402.
>> >
>> >> > I noticed that, when using arch/arm64/defconfig and disabling all
>> >> > platforms despite ARCH_MXC before running make olddefconfig,
>> >> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
>> >> > noticed this when building in yocto and non-IMX platforms are disabled
>> >> > for build time reasons.
>> >>
>> >> But is that something that needs to be fixed?
>> >>
>> >> It sounds like quite a special use-case, and why not simply enable
>> >> CONFIG_PINCTRL in that case then?
>> >
>> > PINCTRL is crucial for any SoC to even boot, so this is an option which has
>> > to be set if that platform is enabled.
>>
>> Yes, but PINCTRL (framework) does not by itself do anything meaningful.
>> You need the correct pinctrl driver.
>>
>> Making the various SOC's select the corresponding pinctrl drivers makes
>> sense if it is required for booting under all circumstances. And this
>> should then indirectly enable/select PINCTRL and anything else needed
>> for that driver.
>
> If you prefer I don't mind enabling PINCTRL and the SoC-specific driver
> (e.g. PINCTRL_IMX8MP) depending on each SoC-support, e.g. SOC_IMX35 or
> SOC_IMX8M.

For SOC_IMX35, it should be selected by default.

    config PINCTRL_IMX35
            bool "IMX35 pinctrl driver"
            depends on OF
            depends on SOC_IMX35 || COMPILE_TEST
            default SOC_IMX35

For the IMX8M* SoC's, that is not done, as there is only a common
SOC_IMX8M config entry, which corresponds to multiple pinctrl drivers,
which we probably don't want to select all of by default.

>> Having ARCH_MXC select PINCTRL as such is mostly pointless IMHO.
>> Enabling a driver framework without enabling any drivers for it, when
>> building a kernel where no SOC's requiring any pinctrl drivers is kind
>> of weird. If you want to do that, why not simply enable both ARCH_MXC
>> and PINCTRL in your yocto recipe?
>
> PINCTRL is currently only enabled because other SoCs happen to enable it,
> just this feels just plain wrong. If these platforms are disabled or
> removed for whatever reason, the other platforms should still work.

As it is now, to build for let's say i.MX 8M Plus, you have to enable
    SOC_IMX8M
    PINCTRL_IMX8MP
to get a kernel that is likely to boot.

If you enable
    SOC_IMX8M
    PINCTRL
but not
    PINCTRL_IMX8MP
you won't have pinctrl support, and the kernel will probably not work as
expected.

What am I missing?

/Esben

