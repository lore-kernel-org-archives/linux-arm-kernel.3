Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67652CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 20:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzfulOt3RuNjCZqZotlbZaUDHr7ww1cs1ieFRe/EaTg=; b=hibAE4gFTGgQvbmKkP4OVas7s9
	5Hd+gRMTtKshoGjRpT9DWw8JTI7r4lSfynDdW6PNR9TLHDZKCrEzvL6wWNsK6Kshhg27RCMxaZUVx
	TP12Z4+kGtSw/H4rkLWb4x6dl+I3IaoK90fdn33hYq7RgV2bheArF9f78lOwJi+1ADZWBQkOo+pQF
	qbEbg5yKBokSIViBKQk3OUZcV7ddhsb9KIz5X+6XcUjm7Cq+Dcho2x/NiVhtnIbROTv4CpapzaBCW
	YU9AJ3JwD5753uLRSZ0xb0S8+YR/M6iMtQHcO7m76hYWCE1sMvFkfQ1mJslPZnCNkIJMrDd8RI3f0
	vFrpmf9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QO7-0000000BFxB-1V0W;
	Thu, 02 Oct 2025 20:58:55 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QO5-0000000BFwq-14QA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 20:58:54 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-54bd3158f7bso1136342e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 13:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759438731; x=1760043531; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzfulOt3RuNjCZqZotlbZaUDHr7ww1cs1ieFRe/EaTg=;
        b=dqQj0Lhw9bUEwd72tPUVIiKppGqCIFUkJ9/EAg8v1tKFc7H4FW/jM/i7O0P3aW3AUi
         jm0n3TGDlaIEj7L8W0sKKTWMqOATpHpthxEjR8rq/z4TItnhmpvD/06WBsUZWiAkfux5
         9CXQZMBQKHBjrbWFrXpQW5rqa+sMzDTuwPx64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759438731; x=1760043531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzfulOt3RuNjCZqZotlbZaUDHr7ww1cs1ieFRe/EaTg=;
        b=wG4mdj0rhrl/mMYozvKK43wZ1BHxKTGbnFpPA69wWXEXQYeQpyFqvw7DG2OtSMqwVS
         12gd5LBYaTpUCLu65qGwYWqK9GKCffPg/ksgMI0+MM5GpLisf9cJ4nthcibltnKcYx5R
         JihBv0jIHNG8iqmOtSkVFplAPFmxnjcXdBh/D3jg4iOpAFplt6sOf7FYGNyFmHApdk56
         AN1yazXfsQPf0r13cykegc/MvuuVShmRIKnykAPXUK5yoTMPeq4JLlSDZx0YDUTNbNlK
         XuUu95g6lnxPLgqqaeuW+yVO5vm0kOZMa5Of0xtejdTQQbZUSCIg+/mrgjTXJZFUwnln
         RvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3wL6k0cVdVI9yOPGFK19UD9u72S5GdYpi7n3MX4GCObqT9pXKmlBF00g7j7BAosI6PsYUl0fyGEBvST47+uFG@lists.infradead.org
X-Gm-Message-State: AOJu0YxE+lKkBPE2dcqE1N4QnW0Gt5xgyzee6cuJijPD7RzYBgD/1THi
	v6JOynjGEkwmIjZujyHNnA5qUv+qzf2AJAzfdqSp2+eQiO1gL/mZQKdwB+MGY4XTM9KhDysbyqI
	gwcM=
X-Gm-Gg: ASbGncvIrgUFb2IHgp4k3KfvkFtNvKtVqp4kQHOGjJpZPIKiJHx6ehOJvp2SVcJ7GDs
	yn+TE4WfAjMDs6/cxH3YCVtxvMct3Y9RQmDj4JRFbN07PUCwlHRcAyKzBSYHF55R5MJz5+Vh7Yf
	JCA482hm+G+Lkbffr2eCYfzhcRMl5b9TQkZHKF7MHb17kxldRYM0D3nNofCvqTK8xyUmd+CyHYp
	wWPpvXFfrC2koBGansDMCNnB/vHvvJ+CAJDGknV1eybnOh9L0hiBLLLhvAFKUd3zNi7UbbRJPUu
	zvPlE+Zxb3svskRhmJCWUJ5zH3IUNRVeuuiVfsrU+xY8D00fyPZARi192b9nRptlNaltPX9IwkP
	4XigZTQUqdQ0zT92D47Fe6yK62vImHmwpjlaa5LHvfiJEGOjbVmjCXWfOWSw7A+g518u2skJL7y
	ADoxPhzfRLadBw5Q==
X-Google-Smtp-Source: AGHT+IGSHQDMicKXw+Fbadd4DIn93tG+8cAOMO2x9P7NnkeJPwxTWUOWZC9dhBgfrMDzEybmqhtm4w==
X-Received: by 2002:a05:6122:2503:b0:54b:bc2a:f58d with SMTP id 71dfb90a1353d-5524e83e38amr250360e0c.3.1759438731170;
        Thu, 02 Oct 2025 13:58:51 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf3e877sm755433e0c.16.2025.10.02.13.58.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 13:58:50 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-54bd3158f7bso1136311e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 13:58:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVStlY6CAcJEPAXcamJbwFYyp78UerPftnGGABNOuPNJ3EwBbT26R+yPhfgSZAl607QJ2yVzW9Sd6vR8RQ6Rqs8@lists.infradead.org
X-Received: by 2002:a17:902:f609:b0:25f:fe5f:c927 with SMTP id
 d9443c01a7336-28e9a61a7a1mr6113515ad.31.1759438293518; Thu, 02 Oct 2025
 13:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
 <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
 <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com>
 <CAEEQ3wn0UckgNTJCPCNDtHW8DwWAJR1PXURvH57yfHATYqs7Gw@mail.gmail.com>
 <CAD=FV=XoUw6HWoFLMcgyHhYm7oeTOXCAyvBdpOghggmdvYzp6Q@mail.gmail.com>
 <CAEEQ3w==Ekffs4+Z55AXMV52f+8ht1pWm3JexXCSiB7T6rzppA@mail.gmail.com> <CAEEQ3wkUai4-noA6CQDsOs=Hn3bSB5cdV9tZJZR8_g+o9e-Mpg@mail.gmail.com>
In-Reply-To: <CAEEQ3wkUai4-noA6CQDsOs=Hn3bSB5cdV9tZJZR8_g+o9e-Mpg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Oct 2025 13:51:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uw=TLx1KPKCdBcJ4BP8+hOcCA+7QLrmfGHCb9uw9u3Pg@mail.gmail.com>
X-Gm-Features: AS18NWAzBOpu8L_1YZexH_YKnsyYsn8PoONF8LzYzDqMVfF7ir8YT7oKetO1D5Y
Message-ID: <CAD=FV=Uw=TLx1KPKCdBcJ4BP8+hOcCA+7QLrmfGHCb9uw9u3Pg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	ziqianlu@bytedance.com, akpm@linux-foundation.org, alex@ghiti.fr, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	catalin.marinas@arm.com, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_135853_320798_90EF1F32 
X-CRM114-Status: GOOD (  42.44  )
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

On Tue, Sep 30, 2025 at 12:11=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.co=
m> wrote:
>
> > > > > > > > +static int __init init_watchdog_freq_notifier(void)
> > > > > > > > +{
> > > > > > > > +       return cpufreq_register_notifier(&watchdog_freq_not=
ifier,
> > > > > > > > +                                        CPUFREQ_POLICY_NOT=
IFIER);
> > > > > > >
> > > > > > > I think you need to do something to prevent this from happeni=
ng on any
> > > > > > > platforms that override hw_nmi_get_sample_period(), right? Th=
ese
> > > > > > > cpufreq notifiers will be useless in that case...
> > > > > >
> > > > > > I understand this is not a problem. watchdog_perf uses
> > > > > > PERF_COUNT_HW_CPU_CYCLES, which means it is inherently limited =
by the
> > > > > > CPU's main frequency. After we make such a change, a larger val=
ue may
> > > > > > be used as the period, so the NMI period will become longer, bu=
t this
> > > > > > value will not change after the system starts.
> > > > >
> > > > > I'm not sure I follow. On x86, hw_nmi_get_sample_period() is:
> > > > >
> > > > > u64 hw_nmi_get_sample_period(int watchdog_thresh)
> > > > > {
> > > > >   return (u64)(cpu_khz) * 1000 * watchdog_thresh;
> > > > > }
> > > >
> > > > I have added the maintainers for arch/x86.
> > > >
> > > > 1. cpu_khz can be understood as returning the base operating freque=
ncy
> > > > of a CPU, such as 2.3GHz. In practice, the CPU's core frequency may
> > > > downclock to 800MHz under low load and overclock to 4.4GHz under hi=
gh
> > > > load.
> > > >
> > > > 2. Because the event provided to the PMU has the
> > > > PERF_COUNT_HW_CPU_CYCLES attribute, and the counter's value is base=
d
> > > > on 2.3GHz, the execution cycle of watchdog_overflow_callback() is n=
ot
> > > > fixed; it varies with the CPU's core frequency. When the CPU runs a=
t a
> > > > frequency higher than 2.3GHz, the NMI cycle will shorten; otherwise=
,
> > > > it will lengthen.
> > > >
> > > > 3. After our modification, if the architecture is not integrated wi=
th
> > > > cpufreq, it returns 0 and will not update the cycle. If integrated
> > > > with cpufreq, it returns the maximum frequency supported by the CPU=
,
> > > > so the NMI cycle is only slightly lengthened, with no impact on the
> > > > actual hardlockup detection function.
> > > >
> > > > 4. I have also conducted tests:
> > > > stress-ng --cpu 1 --taskset 1 --cpu-load 80
> > > > echo 800000 > scaling_max_freq
> > > > turbostat shows that Bzy_MHz and TSC_MHz are 800 and 2300 respectiv=
ely.
> > > > And the NMI cycle became approximately 30 seconds:
> > > > [ 2309.442743] NMI watchdog: ------ watchdog overflow callback, cpu=
 =3D 1
> > > > [ 2341.526032] NMI watchdog: ------ watchdog overflow callback, cpu=
 =3D 1
> > >
> > > Whether or not having x86 and powerpc start looking at cpufreq is an
> > > improvement, certainly it is a change in behavior, right? If we're
> > > really changing the behavior here then the commit subject and commit
> > > message need to mention this. Right now this is billed as a simple
> > > rename...
> > >
> > > I don't personally have lots of experience with x86 cpufreq but I do
> > > know it doesn't work quite the same as how it does on arm. It would
> > > definitely be good to get someone on x86 / powerpc to make sure that
> > > they are happy with this. ...or you just keep making it work the way
> > > it did before and then you don't have to worry about getting any
> > > buy-in from x86 / powerpc folks. Up to you, I guess.
> >
> > Well, I fully agree with your suggestion. What I can think of for now
> > is wrapping the newly added content with #if defined(CONFIG_ARM64) ||
> > defined(CONFIG_RISCV).
>
> I=E2=80=99ve also thought of an alternative approach: add a generic
> WATCHDOG_PERF_ADJUST_PERIOD to /lib/Kconfig.debug, then have the
> Kconfig files for arch/arm64 and riscv select
> WATCHDOG_PERF_ADJUST_PERIOD. What=E2=80=99s your take on this?
>
> Do you have a more elegant approach to

Yes, this feels right to me. I was going to suggest this in response
to your other message and then I saw this followup. :-)

-Doug

