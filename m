Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9300C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 06:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PA0DZjgWtTMK+N921iS75B6LpBzP1P2gEVRwQX5rucY=; b=TyRi+0uL1CAcioZ6YFBNEH96ZQ
	r1niNSezVfz9ErEiItDj7Z6ARIhg0nqvTEKmYDJflMjOae760KkWIzs+QktqV7lmWqNdbQIrMl4Cz
	r/W/BlS8xzNV4CVU2gkTUFHdkj7Crbzxz5VaSzQ8fdf2JZIDCtqJQ6vmLkHZnuRFZ1yxebI0XV5Pt
	XE4qAQ7zYtMpO446mIGpGDdu4KYmJU+W2AHVXyVxrdW1Qw8iWjq0yAEsX/116oXpYuO26RhRYMtsE
	5sjay2Ii5SJw6NV8jB2wkLaX/UtSpYB739RJPeZfQEPEqmgqrTCwd6GZ27qURZ41W2ggBCI+cfNpg
	o1moxo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCv1i-0000000HVRS-2m48;
	Thu, 08 May 2025 06:46:38 +0000
Received: from mail-244106.protonmail.ch ([109.224.244.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuzi-0000000HV2r-2ahH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 06:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746686664; x=1746945864;
	bh=PA0DZjgWtTMK+N921iS75B6LpBzP1P2gEVRwQX5rucY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=JG/Of3h2F8CvXIqft9IesNqX/4lGuDOODZvye6cTGBQ1DJkQ9bKXxGcH9Xz9M+s6E
	 2PBYjFlVWtClSHAyJbDttvI2EErBnL8jqtT8AFc8FnI3utE1VvjKSJ96g+nH7F0O+A
	 0namVmqKMw02mIGCHRKJEQh5YJtbW2lafKRJ8qRxpovf0ECOuQSikPUzmZ+FQkczkO
	 Wnv7Xelg0S3ZDAWdASYCRZytlJuT06cKRt1/bpHq3W8aUreea0eF1JgGrle5fTZIqH
	 7lkIa8KanSgrZONmDGhhe6o9hSWTIcsFKIT/uSCm08wDldEQ+oxG32PmIetCWkJXwo
	 BNU8MPqccCWDw==
From: Esben Haabendal <esben@geanix.com>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,  "Will Deacon"
 <will@kernel.org>,  "Stefan Wahren" <wahrenst@gmx.net>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  "Shawn Guo" <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
In-Reply-To: <8259306.DvuYhMxLoT@steina-w> (Alexander Stein's message of "Thu,
	08 May 2025 07:52:58 +0200")
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
	<5af33290-e7d8-437c-a22f-5b873596d67a@gmx.net>
	<rp4MSsRpdVGoLk5RPFi7xIPZluJJG97RxbkgWMHmLHRCp8gVdt6GN4xz2Mh7vZ7XAQ9uT3HgrjxAf1toMvIt9w==@protonmail.internalid>
	<8259306.DvuYhMxLoT@steina-w>
Date: Thu, 08 May 2025 08:44:22 +0200
Message-ID: <87ikmby52x.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_234435_687071_D01FF9F8 
X-CRM114-Status: GOOD (  17.91  )
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

> Hi Stefan,
>
> Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
>> Hi Alexander,
>>
>> [add Shawn and Esben]
>>
>> Am 07.05.25 um 14:44 schrieb Alexander Stein:
>> > Select PINCTRL for NXP i.MX SoCs.
>> could you please explain the motivation behind your change?
>>
>> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user to
>> disable pinctrl")?
>
> Ah, thanks for the pointer. It might be the case.

The goal of the patch mentioned above was to be able to build a kernel
for LS1021A without pinctrl framework enabled, as LS1021A does not have
a pinctrl driver.

With your patch, that would not be possible anymore.

> I noticed that, when using arch/arm64/defconfig and disabling all
> platforms despite ARCH_MXC before running make olddefconfig,
> CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
> noticed this when building in yocto and non-IMX platforms are disabled
> for build time reasons.

But is that something that needs to be fixed?

It sounds like quite a special use-case, and why not simply enable
CONFIG_PINCTRL in that case then?

/Esben

>> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> > ---
>> >   arch/arm64/Kconfig.platforms | 1 +
>> >   1 file changed, 1 insertion(+)
>> >
>> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> > index a541bb029aa4e..49c3bc25e5f68 100644
>> > --- a/arch/arm64/Kconfig.platforms
>> > +++ b/arch/arm64/Kconfig.platforms
>> > @@ -219,6 +219,7 @@ config ARCH_MXC
>> >   	select ARM64_ERRATUM_845719 if COMPAT
>> >   	select IMX_GPCV2
>> >   	select IMX_GPCV2_PM_DOMAINS
>> > +	select PINCTRL
>> >   	select PM
>> >   	select PM_GENERIC_DOMAINS
>> >   	select SOC_BUS

