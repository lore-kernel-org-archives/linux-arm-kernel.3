Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBC4D44D43
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R33AHOEKuWVl8dftmRKyPE5U6BtAYCDsZvIA1WDMh7s=; b=GUsPnFbpAkbXvJ8EXxWhsm1pBf
	BOqcsshQLOnNzPztczCyeJ9w2UNX80dRYehC4qcFoEbtAnnZqUMjbWFBlV3AzYZ5MXfLM6WnH1cfW
	jMdHYdHsrWytZmCFkWSOIyImjHRL/c8yM5jtj3eQBcdtcGg8eZgpku0S8CUnLbCVHcstGijVIm6QZ
	thZpYSdm/qpPSgDqlWw/aVsCbrKPP28lp39Ax3Exo+7OBbYj/lBMsofsW+YS9+HrK0dj1qYLkB9RQ
	SI4iaLCmlgqf7DZyJaL/GKQqioBGW8COaMkd/+m9SJD3McWmEpO//7LVID0Gw94ZdqvTO1XnVhW7Q
	tB2CDOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dHX-00000002kNf-1hIu;
	Wed, 06 Nov 2024 10:28:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cXl-00000002aff-0TsF;
	Wed, 06 Nov 2024 09:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R33AHOEKuWVl8dftmRKyPE5U6BtAYCDsZvIA1WDMh7s=; b=P8IrTqVCjorN7eadZJASD5gDV+
	DkgY0GG4hZ4lNvGNzMranIQVOzUUk17FfkTOySdqpwtT0VB/ElK2uHdIseXsi7JazCi9gvjRaMGUH
	ZvbopYu7W+ndp1Mdx1LHimV2R//HGArXbV45ZVybT9wm5NBZWFz4NZQkOP5nD0pW0Kw//PRtmeOhq
	8JrBEUhzc3tV/pPX4da5cKaI04Ne5SKcOEiTkROu9S+HIs0U5a8Smmd6/Bb8zyaL5Pix4j/lqcAsw
	haN4uGgxT/K8U1tTeTur/kQx0hkI3+wr/0K5UULXuJzRY0uvUTtgHFDJpLNy+LBs2ZSJ6htduGd8B
	cvIMtT1A==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t8cXh-00062B-Pe; Wed, 06 Nov 2024 10:41:37 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>, linux-rockchip@lists.infradead.org,
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alchark@gmail.com
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add OPP voltage ranges to RK3399 OP1 SoC
 dtsi
Date: Wed, 06 Nov 2024 10:41:36 +0100
Message-ID: <3252308.5fSG56mABF@diego>
In-Reply-To: <f6bb3387-4396-45d4-9cb4-594d58095510@cherry.de>
References: <dbee35c002bda99e44f8533623d94f202a60da95.1730881777.git.dsimic@manjaro.org>
 <f6bb3387-4396-45d4-9cb4-594d58095510@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_014141_210986_306C22A7 
X-CRM114-Status: GOOD (  24.00  )
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

Am Mittwoch, 6. November 2024, 10:32:06 CET schrieb Quentin Schulz:
> Hi Dragan,
> 
> On 11/6/24 9:33 AM, Dragan Simic wrote:
> > Add support for voltage ranges to the CPU, GPU and DMC OPPs defined in the
> > SoC dtsi for Rockchip OP1, as a variant of the Rockchip RK3399.  This may be
> > useful if there are any OP1-based boards whose associated voltage regulators
> > are unable to deliver the exact voltages; otherwise, it causes no functional
> > changes to the resulting OPP voltages at runtime.
> > 
> > These changes cannot cause stability issues or any kind of damage, because
> > it's perfectly safe to use the highest voltage from an OPP group for each OPP
> > in the same group.  The only possible negative effect of using higher voltages
> > is wasted energy in form of some additionally generated heat.
> > 
> > Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Well, I merely highlighted that the voltage was different on OP1 
> compared to RK3399 for the 600MHz OPP :)
> 
> So... If there's ONE SoC I'm pretty sure is working as expected it's the 
> OP1 fitted on the Gru Chromebooks with the ChromiumOS kernel fork 
> (though yes, I believe all Gru CB are EoL since August 2023). In the 6.1 
> kernel fork, there's also no range: 
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-6.1/arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi

yeah, this somehow goes quite a bit into the "stuff that doesn't need to
change" area. On the one hand it does make "some" sense to unify things
if we're using ranges everywhere else.

On the other hand, as Quentin noted below, all existing OP1 devices seem
to run just fine, and there won't be any more entering the kernel.

So what do we realisitically gain here, except hiding existing git-history
under another layer?

> So not sure we need to handle theoretical cases here. Will let 
> maintainers decide on that one. FWIW, there are two other OP1 devices, 
> the RockPi4A+ and RockPi4B+ which do not change the OPP either.


Heiko



