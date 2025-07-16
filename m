Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C28C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/rm8scvzUXrihtknqjtLAemYGQPHMAAfEFq95mpGyA=; b=qLvK5LyHQc/a8J9prdm4WfjOzO
	Puvv8llWvqSrXbzJMwVPxGzoZ8VnVRvUbCdZaT9/7/NMIM3ogpyVMrwSXJ5ajCFzqkDLPXonxhfuA
	EjoV/3LkFNIQI1g5VSv+cI+mnzCt5n6WpOjFvejVlPpOd+duQFMM+oXxGvsd6GBN3cdtjj40+pseM
	ZLtsvcrWW5e11D2/WFNjKQgP3QpFPINQe1zH/ngqacsFPOPIkJt44L1MgdPBy0TfdKCZcsFFHk+mV
	fIc+BZxrFaVBHMd0e2gmk1h/kemU/Gm3TFY4FTqphex3toa1C7fe7TqZEt4XzXASVaKye3iw67rAd
	VEFneYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4Yw-000000088Cy-1aR4;
	Wed, 16 Jul 2025 16:00:54 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4Mo-000000086MV-43O1;
	Wed, 16 Jul 2025 15:48:24 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ab39fb71dbso186561cf.3;
        Wed, 16 Jul 2025 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752680901; x=1753285701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/rm8scvzUXrihtknqjtLAemYGQPHMAAfEFq95mpGyA=;
        b=GqG1l72n+GNOyV7/+aDAosj+twStpX3T/SJWkEIcva2FBOft1q7a6i7PovxN5RjIi9
         s/HEpXXTorjgt4j+sd4Xj152cxEuON2EY0TmzSmDLok9zKp9h0s/sE6r4SpMOBTja40d
         0GGZZRoFewXfqZwcYNO92eaZqcq5zZUwbTueTvrCWaQOgNZx2UjdWzXa6E0lOPZnQhmR
         M673WnH3Rjh9NxaVLgHj415eyU2X63DmCYbHP3qOcKEoc/iTUeL/Fd+czDB4ru58/+Wx
         BkeWMIGSJNQMeXdZW5Y5tIy30KRKuqSkkDK8V+hoa7ag0Vy/V4mHfImwNRPemIecPMrf
         5FWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680901; x=1753285701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/rm8scvzUXrihtknqjtLAemYGQPHMAAfEFq95mpGyA=;
        b=KmIoI+CMsuKNtqpneYBqs+PNdnto37E3dCxyB6gTqdR9yL3zBaLiz1nrBGHXZk66s0
         y9QBvfAooW3ApThvoWjs0QL+UHroGnrrVvcjdtSZv5BH8+1KKUllKuE64FAGdOw63eUl
         v0xD6uuCK3qeY5I3nH5bfIo/4AUR2XAxvOqs//evMya9+o9bI1osNxZV2RNdVMklKNQO
         Ad30V7qjjmj6JODTiGOgwrd30dhJXXn+OLUnPcYxKvttnYhIaJb49/IlXP0t3kVjFEDl
         eGAW3jnO+nzjtUqsJAc1MxBr5hRCQvM/gYKM0A5D/RNicfw3vz19eWHKblPGHjc17Wuq
         omCg==
X-Forwarded-Encrypted: i=1; AJvYcCVV6n9DQYJX+TYhajhyQX1nxCgHtNpCQciMxhGbDqR6GrZlXhFqLvBUHutmBIMPqa8eLYhJfEVP5Q1uYemyk/g=@lists.infradead.org, AJvYcCWoz5VCx0G7lhjMNdVjZt6EcriqK1WLFyADyngJ3abBQOcz+7YqqLBn2+CD9O3o+1RKWdQ7i44mbvYm2IYqzbU1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3GtioCcBc7nhK9sSKufZ74bpvvrvCoF9q93ltmqs6q1ZrD4td
	NCiV+Cz9+2MBPa0s0rELYdbb0CyrWnsQMRflps1H2h98RVD5oLvRKxUjBSN3plxRBtn9k77B9gk
	f8bammN3l9B+VYPon6NVIvkxPv9QeQrs=
X-Gm-Gg: ASbGncsO8jg8oN8cZ+aRdUDVGwbonrMMrwJ+uqNjJLaGvqgZSPnkCdE0TH21e6WHzdn
	AkW7a7JpjKmoz88UTY6Gi9emd1ihgC5A7Ud4Z/iwaA0GcJ0Hpt1vfu3GS9YVPnPBxME+9vOfMs2
	vMd0dzL2bniseUxeEABb+p6REd0Erv17mndrZS+7zmxXqgixNSNmzL6oKZLkfXkOosSgZN28J3P
	imLtDJj
X-Google-Smtp-Source: AGHT+IGZkuwYf/CRlFpg8ouV1Ni1Gc+/D2pROcmk1GXPjk7rcMxm2v3iwcET9Iy7rmi/yw6IZUJYr4N4D+vNkrJvXEw=
X-Received: by 2002:a05:622a:1309:b0:4a7:70a5:e726 with SMTP id
 d75a77b69052e-4ab90cc9bedmr58696201cf.52.1752680901038; Wed, 16 Jul 2025
 08:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <CABjd4YzCL3U9yf65FUBE6EMqFjZHosULU7fUcjVo9VJ_=Ov+Dw@mail.gmail.com>
 <20250716143016.620430-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250716143016.620430-1-amadeus@jmu.edu.cn>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Jul 2025 19:48:09 +0400
X-Gm-Features: Ac12FXy9WoL4TICFh6J03oGYZT5PkKMhZ242n-cx_vXoVMHQVGR-YEvxeooikVM
Message-ID: <CABjd4YzVqOssjMH0VUiUJF78dV9n6Dq6EipWYqUXoxHu6ehUSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency
 scaling support
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de, 
	jonas@kwiboo.se, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	ziyao@disroot.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_084823_009941_66F8D658 
X-CRM114-Status: GOOD (  33.52  )
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

On Wed, Jul 16, 2025 at 6:30=E2=80=AFPM Chukun Pan <amadeus@jmu.edu.cn> wro=
te:
>
> Hi,
>
> > > There has often been the argument that selecting a frequency that has
> > > the same voltage as a faster frequency does not save any power.
> > >
> > > Hence I remember that we dropped slower frequencies on other socs
> > > that share the same voltage with a higher frequency.
>
> Sorry, but soc.dtsi on rockchip doesn't seem to have dropped slower
> frequencies with the same voltage?
>
> rk3562.dtsi: CPU 408MHz -  816MHz 825mV | GPU 300MHz - 600MHz 825mV
> rk3566.dtsi: CPU 408MHz -  816MHz 850mV | GPU 200MHz - 400MHz 850mV
> rk3576.dtsi: CPU 408MHz - 1200MHz 700mV | GPU 300MHz - 600MHz 700mV

They were dropped for RK3588 when merging the CPU OPPs that I
submitted, after respective feedback from Daniel Lezcano [1]. GPU OPPs
for RK3588 were merged before that discussion, so they still carry
"lower frequency, same voltage" entries.

[1] https://lore.kernel.org/all/731aac66-f698-4a1e-b9ee-46a7f24ecae5@linaro=
.org/

> > I.e. here the mainline kernel will always choose opp-1008000000 as
> > long as the regulator voltage is 875000 uV, unless explicitly
> > prevented from doing so by userspace. Whereas the BSP kernel [1] would
> > request different frequencies for different silicon, e.g.
> > opp-1200000000 for a silicon specimen with a leakage value of L4 and
> > opp-1416000000 for a silicon specimen with a leakage value of L8 - all
> > for the same regulator voltage of 875000 uV.
> >
> > So my 2 cents would be: no added benefit in having "lower frequency,
> > same voltage" OPPs defined here until we implement an OPP driver
> > reading the NVMEM programmed leakage values and selecting different
> > *-L* voltages for each OPP depending on those. Once there is this
> > support in the drivers, those OPPs can be added together with
> > leakage-specific voltages (opp-microvolt-L0..11).
>
> I assume this has nothing to do with the NVMEM driver?

There is an OPP driver in BSP code (for v6 BSP kernels) or a custom
cpufreq driver (for v5 BSP kernels) which read factory determined
leakage values for the particular silicon specimen from an OTP (NVMEM)
cell and select different initial voltage values for each OPP based on
that. Those voltages come from opp-microvolt-L0..11 DT properties,
where -L0..11 represent different leakage values. Default is no -L*
suffix.

These are then further tuned in the BSP code by stepping over adjacent
regulator voltages until the PVTPLL provides a frequency closest to
what the OPP defines. The kernel then uses this calibrated voltage for
the particular OPP instead of the original DT provided one, as it
better suits the particular silicon specimen and operating conditions
(PVTPLL =3D process, voltage and temperature adjusting PLL).

The calibration process can result in varying voltages for PVTPLL
based OPPs, even if the DT listed the same voltage for each, so it
might make sense to list those once OPP calibration support gets
included in mainline driver code. Before then they won't be used by
any of the energy aware governors and would thus only add bloat.

> From [1], we can see that the voltage used by the same board from
> 408MHz to 1008MHz is the same. The actual test is also like this:
>
> The first  board: CPU 408MHz - 1008MHz both 850mV | 1200MHz 862mV
> The second board: CPU 408MHz - 1008MHz both 875mV | 1200MHz 875mV
>
> [1] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64=
/boot/dts/rockchip/rk3528.dtsi#L227-L271
>
> > Right now OPP values with frequencies lower than 1008000000 won't be
> > selected by any of the energy-aware cpufreq governors anyway, because
> > their voltages are the same. Exercise for the reader: try to convince
> > e.g. the "schedutil" governor to select anything below 1008000000
> > without touching
> > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq :) This may
> > change if OPP tuning logic is implemented such as in [2]: that will
> > try and find the _voltage_ resulting in PVTPLL providing a frequency
> > closest to what cpufreq requested, and use that for the in-memory OPP
> > table instead of what was provided by the DTS.
>
> Thanks for the clarification, so should we remove 408MHz, 600MHz and
> 816MHz from the opp-table? Is this also the case with GPU's opp-table?

I would say yes, drop for now and add them later when the need arises
(i.e. once we have driver support for OPP calibration using
PVTM/PVTPLL feedback).

They do not hurt per se, but they result in something unused right now
becoming part of the device tree ABI, thus limiting options to rethink
stuff later.

Best regards,
Alexey

