Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CEACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My6lFUc7zoLW5Gm3QynuWYETID/5UfKp0PSFhtMad2M=; b=fFI+PEEXB6pCA6jaHz4JaroGjI
	IqZ6McnfxL+Tq9DlhejrJHzANPD5jeexNaieyKQrF/Ipdgzb92v/sJolISfo0cpmcu3MTVoDT1phY
	ErcAjcbwhkIOgrBfAoTabjwiPKT1ntP8BYvEgt1geS51QFaoSk4Om7Yglp8q+MFetOdo4xw9YlHgU
	QuRG6ElxRiCkyweAvykVvSWQ6RutZ59qrl27VrAMMNLVnLJgd1QGe4dWkawSoF0rpnhI2ENt2elpy
	1CZ/rJaI6U0p0m6rdSyQ8GtUv0fMbaefXm5UGgjQHBxISBsNoBVMtwBlfShaeIzvhD2ziousqt80E
	20y2O6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlMq-0000000G9Vg-43OQ;
	Tue, 28 Oct 2025 15:12:12 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlMo-0000000G9VE-1Wf8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:12:11 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-89e73d9596dso422787085a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761664329; x=1762269129; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=My6lFUc7zoLW5Gm3QynuWYETID/5UfKp0PSFhtMad2M=;
        b=GoEVu8Pji2/iMvGulaxV3Wlp9zM39p4FNKbLth/D7VPN5gROQ9Y0kmsVSqXyQbR3x4
         flp1YoPJ6s+slEhi3z8qdqbBEupMuDLVj+AxToqj3DS8atmB1BwDG+vLKmJCbAarpFzs
         hjFCQO/UxVEz5J0fvSmaJmXYsSVY/aTWBFUUJgLBB5mH+Dp4vFXsmna9pfarLwfHkcTO
         rfHf/Nk3MmudD0nuaOKzryVG/8Hsqj/kLP11zjkw0Kx6byQ1l2yd39ZEVSDHz6iN0Shh
         1j0QszEL+GggIRFlONLerbHWlrClAPOy7Q8sW5hKesj8K0rFDgFzMgXRdGACubhQ9T/D
         LXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761664329; x=1762269129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=My6lFUc7zoLW5Gm3QynuWYETID/5UfKp0PSFhtMad2M=;
        b=vW9u7W2goIiad7S0IW1czmR7S8BLEV3Jr8qeLjsSeMivL/c7pMO5spOhJl8arGVdW5
         l2Ipwx6XS7xi+mbvraezVwn+mvNQ0DEFwmk7KdRCSpjzDn5W3s5uomUIbB2APsspHPyV
         pqHl/gjeANW5HYkpvn2f+Aw0KxWX6AKhmsuNVXmMCBXEIVyrX3PXkw8oIXe8e5ZYAe2b
         2g6fp4d3j2cHWjhbtHKgSzaXAKxOFVgAr0JiMlCUGEwx68vmi4+r4g20CRKTZmoiLKeB
         SO1hTMba+V/CrYM8fROdB7/lp+VVjAN2LXSumvzzF4o0GOGFLptmo8iV4f117DDS91FU
         AjtA==
X-Forwarded-Encrypted: i=1; AJvYcCUqkkTmRQ+OJYIUVZilxrT1GxeXs9XvGzY0AwMbo99Yzcf+MC80TdyS2wqCfKm7eipGbn1oxRVfUb1egVQoTsQR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx81H2OURNZlWwRYXGMxgmDipzZEAWp4HD5Df1WIouFONHlQzTd
	UtAaQSc3Po3UT+NhCH8CjmV53SK7XI+r48WwNRP1oAVzRqf8vLzvJWS8lVtIXc5FQKCnWe4jeHx
	OLjKc0zlJUILwFeZaePP1FrgCcbEoTWdjuCG6Z5C8/g==
X-Gm-Gg: ASbGncsnSta89FeiFdVnC7y7b7JxC18cXL9/oirvIlXB7P+vw7icUmo1NBJschorZBL
	MBG+oahM3labNmPHRfKP8JY13ZLa1ikLEDMxdULv9793FTFQLLwbRic2Mb4WJjqM4/M7r5QkdzU
	AJrniOhbccEtW8MUK2G2OtvAveP1dYBbb2kScrzgdhJxrm4rcUtnnjMVGryFjtPqxwiPYCeJP54
	BC6pSo8Gn6HP1PlKNSjmZ+MsmbE5VpTF4GvszLpuror+tsYTKtcrFc52FP8jxpBh2bc88HxVgaB
	p0gSz2an+b0+TZ5riQ==
X-Google-Smtp-Source: AGHT+IGxsG6Gqg9uzC/QFCcTBdH2eXhdtDU0NxiWL952uFRZ/a1k+6nRJwwSvhWe4NMnnzkLU3AJWdEsJsXYUqy9BeQ=
X-Received: by 2002:a05:620a:2948:b0:8a1:649b:93d0 with SMTP id
 af79cd13be357-8a72335619cmr386090285a.1.1761664328900; Tue, 28 Oct 2025
 08:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-19-ea49e91124ec@arm.com>
 <CAJ9a7VgQoJMQyuGP6UP8ptg4xcoV2cbR4bwz6ooRy5O_SaiCVA@mail.gmail.com>
 <20251003135946.GY7985@e132581.arm.com> <CAJ9a7Vgg24S3ApkvEWr5ayD0OK5cYZTsmjJKpZkZzzMah72ijw@mail.gmail.com>
 <20251023150009.GS281971@e132581.arm.com>
In-Reply-To: <20251023150009.GS281971@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 28 Oct 2025 15:11:57 +0000
X-Gm-Features: AWmQ_bl06yADJRi-j86-R2pDsUZm8waW-HfQEpa2jN5P2cPns1X9MoQxWfvToaU
Message-ID: <CAJ9a7Vj3pchaYQ6bbDkJxz-4ctT66SMo1_hoDR7Y_Bj69xHSVQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/31] coresight: cti: Introduce CS_MODE_DEBUG mode
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_081210_448008_88475F21 
X-CRM114-Status: GOOD (  56.15  )
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

Hi Leo,

On Thu, 23 Oct 2025 at 16:00, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Tue, Oct 07, 2025 at 02:56:46PM +0100, Mike Leach wrote:
>
> [...]
>
> > > > System CTIs are attached to key HW trace infrastucture such as input
> > > > triggers for ETR/ETB that have direct effect on trace.
> > > > CoreCTIs, while they have some debug triggers, can also trigger ETM events.
> > >
> > > Seems to me, it is no matter system CTIs or Core CTIs. Here, I am trying
> > > to distinguish three methods for enabling CTI:
> > >
> > >   (1) Enable CTI within a perf session.
> > >   (2) Enable CTI within a sysfs session.
> > >   (3) Enable CTI using the CTI driver's sysfs knob(s).
> > >
> > > Currently, methods (2) and (3) are both using CS_MODE_SYSFS.
> > >
> > > Method (2) enables a CTI device when we enable a source-to-sink path
> > > via the sysfs interface; CTI acts as a helper in this case.
> > >
> > > Since the CTI driver also provides its own sysfs knobs to enable the
> > > CTI device by itself (defined in coresight-cti-sysfs.c), to
> > > distinguish this from method (2), this patch introduces CS_MODE_DEBUG.
> >
> > The point here is that a user can (or at least could and should be
> > able to) program and enable CTIs across the system to generate signal
> > inputs to trace devices, then start trace either by sysfs or perf and
> > expect those CTIs to have the desired effect.
>
> I agree that we should allow users to configure CTI through the sysfs
> interface, and afterwards it can be enabled either via sysfs or a perf
> session.
>
> However, the problem is that, unlike other components, the CTI module
> can be enabled directly through its own control knob (see
> enable_store() in coresight/coresight-cti-sysfs.c). As a result, the
> enabling is _not_ bound to any CoreSight path.
>
> This is why a new mode (CS_MODE_DEBUG) is introduced. When users select
> this mode, power management should be handled by the CTI driver itself
> rather than by the CoreSight core layer, because in this case no
> CoreSight path is bound to the CTI devices.
>
> > The "mode" for CTIs was introduced to fix a ref count issue. I am not
> > sure now that this is the best solution. A "mode" is good for
> > components on the direct trace path responsible for transmitting trace
> > from source to sink, but perhaps less useful on the CTI/CTM system
> > which is both global and has multiple uses.
> >
> > We effectively have three domains for CTIs all of which can be
> > programmed to affect trace capture -
> > 1) CPU bound - on the trace path, possibly affected by core power down
> > depending on the implementation of the system and will be enabled as
> > helpers as the path is enabled.
> > 2) Trace path  system CTIs - connected to other path devices - e.g.
> > funnels, etr etc, that will also be enabled as helpers as trace path
> > is enabled.
> > 3) Other system CTIs - not directly connected to specific trace
> > devices, but can channel signals via the CTM to other trace path CTIs
>
> I would say we can simplify the case 1) and 2) as a single case, as both
> cases CTI is attached to a path, and can be managed by core layer for
> CPU PM. Only a difference between them is we cannot directly set
> register for CPU bound module as it might be not accessible when CPU
> power domain is off, but I will explain later appropriate way to handle
> the difference (and why we should not have "powered" flag).
>
> The case 3) is special, as said, this is totally irrelevant to other
> coresight modules and CTI should manage every thing by self.
>
> Could you confirm that the first two CTI cases can be enabled via CTI's
> "enable" knob?  If answer is no (CTIs in the first two cases must be
> enabled by a source-to-sink session), then the last case should be no
> matter for CPU PM, and as a result, we can remove all CPU PM code in the
> CTI driver (as all PM things can be managed by core layer).
>
> > The CTI driver ref-counts CTI enables / disables, and alos has a flag
> > to indicate when powered so that enables / disables are counted but
> > will not be acted on unless powered.
>
> I can accept the refcnt is used in CTI driver, a case is CTI module can
> be bound to links (e.g., a CTI binding to funnel/replicator, etc).  So
> a CTI device can be enabled for multiple times.
>
> But the "hw_enabled" and "hw_powered" flags should not exist at all.
> Currently, the CTI driver is a bit mess for me, mainly caused by these
> two flags used in the coresight-cti-sysfs.c.
>
> We already have the mode and refcnt, this is sufficient to present if
> a CTI module has been enabled.  And if we can clearly distinguish config
> parameters and runtime register values, and we must use SMP call to
> enable/disable CPU-bound CTI module, then we can remove "hw_powered"
> flag.
>

One of the key properties of the CTI drivers is that all the CTI
registers can be programmed at any time - even while the CTI is
enabled and trace is running. This differs from the ETM or other CS
component cases where programmable registers ignore writes and may be
unstable on reads while the trace is enabled.
Indeed, it only makes sense for the CTI APPSET / APPCLR /APPPULSE
registers to be written if the trace is running - which can be from
the command line or some userspace software application.

Therefore the sysfs interface is designed to write to the internal
register cache if the CTI is either disabled or unpowered, but will
write both cache and physical register if the device is both powered
and enabled. Hence the flags for powered and enabled.
Effectively we maintain and count enable / disable requests even when
unpowered - so that the state on repowering is respected. and note if
enabled for the write through functionality.

Regards

Mike

> > There is probably a case for ensuring that the enables/disables via
> > the sysfs files are balanced - i.e. a sysfs file disable should not
> > disable a helper enable, so a specific count on that route may be
> > needed.
>
> IIUC, we don't need extra count for this case. We simply return back
> if users try to enable CTI duplicately - first time we set the mode,
> and afterwards just nop operations.
>
> We might need to add an extra checking to prevent disable CTI via its
> own knob if the CTI has already been enabled by source-to-sink
> sessions.
>
> I might extract out CTI patches in next spin, as we can discuss in
> small context.
>
> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

