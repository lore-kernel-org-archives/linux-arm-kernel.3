Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD88FC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/fd/QdmYac4W+wfV9CB8/vjp3FgLg+QnA/XaSaZSTs=; b=WQc4jpW+P35YmHw9bIkkzNZCA2
	QJhN3dgkat5x0US7BvnYeJ+x+rZ8lkmHjcM+Bo3uWpwh7Xv1pi8u52IO4SLRcNVHkb+w+3RMQwm84
	edD6ncLo40s85NcjOjCGU2D36W1clZV5CJdt5Me3KXshMkDgdMI1477wCvvO2AwD7APrqOwMUo3vg
	qRm6+wcBF/M9IC+vu+HRh3zTR4fDI73Dr6gALTbgEqbGGzbrLe874s1M0oA9xoF2bb9A3jtXe+7h0
	Nx/R8TqXPOGtymJYhN49jNdU4uUvt+osZUcI528mY6kI/CJTa8v9chT5wK1RwOcqzopuHU1gueYU3
	PEYvr6Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4w6-00000001NgM-3KnU;
	Thu, 08 May 2025 17:21:30 +0000
Received: from mail-106112.protonmail.ch ([79.135.106.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4l3-00000001LkI-1ajI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 17:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746724200; x=1746983400;
	bh=e/fd/QdmYac4W+wfV9CB8/vjp3FgLg+QnA/XaSaZSTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=AYvzsXxL6h1+eijXThsjW3ckLwn4A18iekWbFFgaqh6krd2I6ID1Ju4H7kyYVRMZQ
	 hwaQjesXHvcrTRMhqsKnNE3sgNjKC5QPcrFG1a0NVX4K1ReHOW6WizWmiPR5qkUT+p
	 tD9T6Mc4fXqiXA6TAByTNtz+TXubJlU4/d5uQ2BPzYGSRb7azDPfjRYrheonqnL6xz
	 H2dfgCqck8YfRJmSwPZGGkiFtVeHaNUHxDlflu8eyEpeQPxSmsfi7iFRKHoTcA55/k
	 vw70qKYyjkeNwvS3fRriaLekuXKuUJ3/zeipVekgm3aIPxGboKFshOm+4InXXsNR+m
	 6y+aM7lG61l8g==
X-Pm-Submission-Id: 4Ztdsy4mVWz4wx9Y
From: Esben Haabendal <esben@geanix.com>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,  "Will Deacon"
 <will@kernel.org>,  "Stefan Wahren" <wahrenst@gmx.net>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  "Shawn Guo" <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
In-Reply-To: <6002097.iIbC2pHGDl@steina-w> (Alexander Stein's message of "Thu,
	08 May 2025 15:18:04 +0200")
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
	<5724399.aeNJFYEL58@steina-w> <87a57nxogy.fsf@geanix.com>
	<kUQplj_lxisPWthzRoWcVoRtp5bycldVvw8f7SsR3PVfpzcnS9VNTPmEfDeC7gIRGK6_FR2EFXSAAuoYGH6D_A==@protonmail.internalid>
	<6002097.iIbC2pHGDl@steina-w>
Date: Thu, 08 May 2025 19:09:57 +0200
Message-ID: <87ikmbav16.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_101006_490072_EE449D15 
X-CRM114-Status: GOOD (  22.42  )
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

> Am Donnerstag, 8. Mai 2025, 14:43:09 CEST schrieb Esben Haabendal:
>> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>> > Am Donnerstag, 8. Mai 2025, 10:18:35 CEST schrieb Esben Haabendal:
>> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>> >> > Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
>> >> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>> >> >> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
>> >> >> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
>> >> >> > I noticed that, when using arch/arm64/defconfig and disabling all
>> >> >> > platforms despite ARCH_MXC before running make olddefconfig,
>> >> >> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
>> >> >> > noticed this when building in yocto and non-IMX platforms are disabled
>> >> >> > for build time reasons.
>> >> >>
>> >> >> But is that something that needs to be fixed?
>> >> >>
>> >> >> It sounds like quite a special use-case, and why not simply enable
>> >> >> CONFIG_PINCTRL in that case then?
>> >> >
>> >> > PINCTRL is crucial for any SoC to even boot, so this is an option which has
>> >> > to be set if that platform is enabled.
>> >>
>> >> Yes, but PINCTRL (framework) does not by itself do anything meaningful.
>> >> You need the correct pinctrl driver.
>> >>
>> >> Making the various SOC's select the corresponding pinctrl drivers makes
>> >> sense if it is required for booting under all circumstances. And this
>> >> should then indirectly enable/select PINCTRL and anything else needed
>> >> for that driver.
>> >
>> > If you prefer I don't mind enabling PINCTRL and the SoC-specific driver
>> > (e.g. PINCTRL_IMX8MP) depending on each SoC-support, e.g. SOC_IMX35 or
>> > SOC_IMX8M.
>>
>> For SOC_IMX35, it should be selected by default.
>>
>>     config PINCTRL_IMX35
>>             bool "IMX35 pinctrl driver"
>>             depends on OF
>>             depends on SOC_IMX35 || COMPILE_TEST
>>             default SOC_IMX35
>>
>> For the IMX8M* SoC's, that is not done, as there is only a common
>> SOC_IMX8M config entry, which corresponds to multiple pinctrl drivers,
>> which we probably don't want to select all of by default.
>
> Well, is the SoC support is enabled, it makes totally sense to enable a
> crucial driver like pinctrl by default. It's still deselectable after
> all.

Yes. But now I think I figured out what I was missing here.

In order for the patch to achieve something meaningful, it is not enough
to select PINCTRL from ARCH_MXC. You should add default statements to
the various related SoC specific pinctrl drivers. For example

    config PINCTRL_IMX8MP
            tristate "IMX8MP pinctrl driver"
            depends on OF
            depends on SOC_IMX8M || COMPILE_TEST
            default SOC_IMX8M
            select PINCTRL_IMX
            help
              Say Y here to enable the imx8mp pinctrl driver

This aligns with the way it is done for the arch/arm pinctrl drivers,
and will automatically enable the relevant SoC pinctrl drivers, and
still allow completely disabling pinctrl if/when that is needed.

For SOC_IMX8M, 4 pinctrl drivers will be selected.

/Esben

