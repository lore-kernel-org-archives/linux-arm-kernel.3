Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5281D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 01:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QlOyxQG3;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=HmmVeH3g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAUNdUhGhVk5P10frznxuicWSRes7WCpJcGSrDhd0Lk=; b=QlOyxQG3oLpqafTG0pUv7Mbo/t
	mzYW8dPlFmcGenFGFTWpK4cJNY2IEjdglrCfF3ESJ9hjR97bT/H+yQ7khmqzllPPLHjvTjcFGyX2D
	3r29r/EgWnGuM58IZayJqpPInGnqczO/DFpSTunt8eI1fB/b539NbFrXGKTYwKutGcKvp6Yj8RMkw
	FNWW/erV84jZuLyR/IdHYuvNOVAQV5uoDO32ECZeGLqVB9a1aOa9juvLph/wuJjm15Ot7bVkFH+bz
	ONGdg5Rnu/MddMgg7X+vOkvXGkAqJ3ySLtUjx/4Pl6lW5wg4e0sf8TtG5dUxjE6t0qsygivKhoSst
	GPoCT+qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLAF-0000000Atiy-1ypJ;
	Wed, 21 Oct 2026 01:30:47 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLAC-0000000Atie-3TYK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 01:30:46 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5337c7b9937so149291cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 18:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792546243; cv=none;
        d=google.com; s=arc-20260327;
        b=bzZn5962SVneK9fQfWy5kG2ywTLFLNxi52C1iEXQzwpZ+j0r1NdTE4jSIPYOTPR9z8
         +EXHDGgHTPb7Pi+Ys2uy4N6BB1ot+K99qzyHqZfu9n1aq12mFU8QRXKn+vLHhsvcXYRP
         vZc6k9aOGV5R4l5mzeS+sKpYyQ3yvRoYqAQSK7XSDEZx897wbuqAUue5aNWKYTmw9sO9
         +qmf1COQdr9vI2+9DZ1xIJv65Qv+3etxgC2SnvVXRdQ3c7EEZ9YSNn0rkL43S6NvNlI2
         5zRynUucCI2j7Snu0YLI5mcX95KymrnNl7/5beuijIusoM/uZq/E041RNaNwAYKpJE1n
         OPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PAUNdUhGhVk5P10frznxuicWSRes7WCpJcGSrDhd0Lk=;
        fh=9en9p14b2XpyHHxuNwILowTdLH7KnVyQtzMRc0sj3C4=;
        b=EuUL1slqdKJ8LE9ebQH0vAJFe8IsAAdBwR2vbP7qBNduQREg3780p7+uprWor77x1O
         YyZ6wmFLByTuRfF4QGv7HnyuR786bXdHqAJ2HAMR5OsLDGCZ8CdyPy73Zf03dTRX2UkL
         2798WkPG/wApqNegt574WVIVPZm8HTznV82CJ3PxZ+vL/3SVf8Dvz1AIsujAmsC0z8dq
         ztOTNESTdVnJtUzw1ZMd2I7bK1+okxB+pIOARVOT/P4tzeX/J4kVv0CgPfTaYtu8UcbW
         7X1ozRoYMmcnrqVlULd3JWn7BcKM8GRje5uIBhmh3N437xbcBwGfgYaAq4oIGelHfZ+a
         0qOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792546243; x=1793151043; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAUNdUhGhVk5P10frznxuicWSRes7WCpJcGSrDhd0Lk=;
        b=HmmVeH3gUU1yEUV/GhzsmMg4MP+fRO1fLC31j7TUQCCKmc1n3cflmGfezMOo4tguqK
         Rpnm2oxdnqQFwVSvJyCaGVP4kC9rgGdmUzrm5uMx2ljk2kD1lExzObmOs9RLWhCweXC7
         WrIV6dhlnIMUubhGM6fWTP4ZbhaGzxggdFkhCZOrs8MIjM8t4KngNfToFFx9BFqsxM4S
         bOQHM9V4dpnkM0MDDf8BvcQGUBBka2SuV75iLu7W4HlV3vneBxIek5oUW1gbwAX1nW2w
         Dp7tSrljPn0GyZ4d0QN7a55P/Mald8CNvd0CJ8/JkPGksEjsz7ai6Kd0Ke4mAtSyG8kX
         foGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792546243; x=1793151043;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAUNdUhGhVk5P10frznxuicWSRes7WCpJcGSrDhd0Lk=;
        b=MJJPN7anrFVFPxoRpm6yycBqNbUlw0dAazNjTu6wSL+V11RB27Ds2d0MBnKtGxytq0
         cJAgQRtRJMBa0HEEW83EMplhM156AtjqDKkegRHWUjWDbqR7lRc98m//Rf73ATyI2GjG
         crnLHtR+DaBPBHa7sNG8xknNIMGJSWf3NQ7HzGpTemyMydawJVoBvpsW7n1I3ETS4zkL
         /NBHEGC7WuTij0u+kjJusf9pdWiPmHO/UFasC79TWPUQaydcZwwnANPYKVMN4s4P7C/M
         kNfEssBt6Tk4szbLxTwwlQcNdIBUGz1IUkwLOrK9w3m0cXw9mcHAe2OxKUUtKY7BGOl3
         /WKw==
X-Forwarded-Encrypted: i=1; AKwUvBwGaM0a6+JmI5iULkb47zAETTVQhtjYX0WTMSWu24+ss94Qp2L9Oa4mggLRW7PpXmsBET7B6MkB8BGulAgcM8V1@lists.infradead.org
X-Gm-Message-State: AFq9FYKpxpJE/A8bJkjCclLwemrAtWNrifjlnxyvZ0o7h9kReis+S7el
	u6J6x6gjJKr3lXw0vxy5EOGAvml5nPztkAaCq9lE6qpLmkoFFNBn57DjVaWEjAunMGnCAUuYhGX
	xuERbDJrJWfoT5CAp0OY/H7C8Ck0bjTzSudSutdsh
X-Gm-Gg: AYBFou1UWXVGyl0yX4SxnN1ZZfbHxip3hPdJiBDdeKyzNT/K3ya5HMoshyRTgJf3Mm5
	+i9DKAY6QtcZDDAOYmv/vMNm+GqGsjQFmu7DI0znn1/a73891QUsQtVPVEjrlGTp3r1G+KqN4dm
	GsnLeOoqB5P5Q7HMoIPkyJnGin6x1W+J4Fq5fIuPKXvohOsK9i5oV07Vq817Hv0qib0uaLSauk1
	vKjnCbDpx7VL7S3CgfYE6nX2YAX3c4JkCXMn+aYvjOyce41EDA5DB/wry+V1IUqqjrX56r7Zp88
	uvDiGPHEpuxdD28Cca49rRe3JTPdAyYe0Rk+4HyRcTyBGoD1xAyF/hOseNqZaE6RS8/ijzO9BXG
	x45DKQI/aDXoiWTJDLBgV72OuC7mLVi4YXNHRqA==
X-Received: by 2002:a05:622a:a889:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-53684a855d1mr35309201cf.0.1792546242034; Tue, 20 Oct 2026
 18:30:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
 <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org> <ate93zQFkfAecIv2@x2>
 <CAP-5=fXUMVJwtAp+8dA8V=hBD9q4x6J4YiUufwXAOXcAJoAKTg@mail.gmail.com> <SA1PR12MB6773C6D7355C7229EF1341F0A0672@SA1PR12MB6773.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB6773C6D7355C7229EF1341F0A0672@SA1PR12MB6773.namprd12.prod.outlook.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 20 Oct 2026 18:30:30 -0700
X-Gm-Features: AclHuK_s5I62ce-14bqNjkF3ExUlJi8orsBz0fc6wg1Ud9yaq6K2V9y2A5lKOFg
Message-ID: <CAP-5=fVXO+2y=0S+hRYgAoO7Vsj7xs4dbgrJ+YzMHmnkHHgx8g@mail.gmail.com>
Subject: Re: [PATCH 0/6] perf jevents: Add NVIDIA Tegra410 uncore PMU events
 and metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, James Clark <james.clark@linaro.org>, 
	"namhyung@kernel.org" <namhyung@kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>, 
	Rich Wiley <rwiley@nvidia.com>, Sean Kelley <skelley@nvidia.com>, Matt Ochs <mochs@nvidia.com>, 
	Raj Joshi <rajjoshi@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
	Jon Hunter <jonathanh@nvidia.com>, "john.garry@linux.dev" <john.garry@linux.dev>, 
	"will@kernel.org" <will@kernel.org>, "mike.leach@arm.com" <mike.leach@arm.com>, 
	"leo.yan@linux.dev" <leo.yan@linux.dev>, "mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "ctshao@google.com" <ctshao@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_183044_918232_23957976 
X-CRM114-Status: GOOD (  41.48  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 3:15=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> > -----Original Message-----
> > From: Ian Rogers <irogers@google.com>
> > Sent: Tuesday, October 20, 2026 8:33 PM
> > To: Arnaldo Carvalho de Melo <acme@kernel.org>
> > Cc: James Clark <james.clark@linaro.org>; Besar Wicaksono
> > <bwicaksono@nvidia.com>; namhyung@kernel.org; linux-
> > tegra@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-perf=
-
> > users@vger.kernel.org; linux-kernel@vger.kernel.org; Vikram Sethi
> > <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Sean Kelley
> > <skelley@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Raj Joshi
> > <rajjoshi@nvidia.com>; Thierry Reding <treding@nvidia.com>; Jon Hunter
> > <jonathanh@nvidia.com>; john.garry@linux.dev; will@kernel.org;
> > mike.leach@arm.com; leo.yan@linux.dev; mark.rutland@arm.com;
> > alexander.shishkin@linux.intel.com; jolsa@kernel.org;
> > adrian.hunter@intel.com; ctshao@google.com
> > Subject: Re: [PATCH 0/6] perf jevents: Add NVIDIA Tegra410 uncore PMU
> > events and metrics
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On Tue, Oct 20, 2026 at 12:15=E2=80=AFPM Arnaldo Carvalho de Melo
> > <acme@kernel.org> wrote:
> > >
> > > On Mon, Oct 19, 2026 at 06:23:16PM +0100, James Clark wrote:
> > > > On 19/10/2026 17:42, Besar Wicaksono wrote:
> > > > > Add event aliases and derived metrics for the NVIDIA Tegra410 unc=
ore
> > > > > PMUs.
> > >
> > > > Reviewed-by: James Clark <james.clark@linaro.org>
> > >
> > > Thanks, applied to perf-tools-next, for v7.4.
> >
> > Hi Arnaldo,
> >
> > can we not take these in v7.4 as there is unaddressed feedback:
> > https://lore.kernel.org/linux-perf-users/CAP-
> > 5=3DfWucvdYefDOL3Vn=3DO=3DYUPEXE+tngDDfPLv-
> > T5i3WkCJVA@mail.gmail.com/
> >
> > The specific problem is that the NVidia PMUs have adopted a convention
> > not supported by the perf tool of 'pmu_name_<socket>_rc_<num>'. rc
> > stands for root complex. What ends up happening is that aggregation is
> > broken as the json is claiming that pmu_name is the PMU's name while
> > the suffix perf_pmus code thinks pmu_name_<socket>_rc is the pmu name.
> > They've wrangled support via the json by claiming these are sys
> > events.
> >
> > We can either:
> > 1) support a new suffix convention of <num>_rc_<num>
> > 2) push back and ask the driver writers to name their PMU correctly as
> > defined in the ABI:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /Documentation/ABI/testing/sysfs-bus-event_source-devices
> >
> > If we do (1) then it would be nice if the support for that could be
> > contained in this patch series. In any case these events don't belong
> > in sys.
>
> Hi Ian,
>
> Could you elaborate more on why these uncore events don't belong in sys
> directory? Is it because T410 already has an entry in mapfile.csv?

I think the meaning of sys and system events has always been unclear.
The original patch series is:
https://lore.kernel.org/lkml/1607080216-36968-1-git-send-email-john.garry@h=
uawei.com/
However, since it isn't tied to a CPUID it should refer to things like
accelerator or network cards, not regular uncore PMUs.
The whole notion of sys events/metrics needs TLC as it doesn't make
sense for them to be in vendor directories if they aren't tied to
CPUIDs.

> I put them in sys so perf matches them to the PMU by its identifier ("Com=
pat")
> rather than by the CPU, similar to hisilicon/hip09/sys and thead/yitian71=
0/sys.

So it would be better to follow x86 as a model.

> For the aggregation concern, I replied on PATCH 4/6 and will look into
> it further.

So CT replied. The ABI document was created because the hex suffix
broke aggregation, which we fixed. As your reply details, cross-PMU
aggregation has been broken by your new suffix convention. With the
conventions we have, PMU names like i915 will match a name of just "i"
and ARM CPU names tend to be valid hex suffixes in things like
armv8_pmu_a53 - so we ignore suffixes on core PMUs. The distinction
between core and uncore PMUs in sysfs is also strange. Anyway, it
isn't perfect, but we documented it so that future PMUs wouldn't break
aggregation again - or if they did they can detail in the ABI and perf
code what the new additional convention is.

Ideally we wouldn't include anything fancy like physical addresses and
socket numbers in PMU names. Such information is already present in
/proc/iomem or the topology code, and the naming irregularities only
serve to break aggregation. To add detail to the PMU, use the caps
files. I don't think the perf tool should add new ways for every
vendor to aggregate, determine sockets, etc. It is bad enough we have
to carry fixes for ARM PMUs not honoring hot plugging and for the
cpumasks not being set up properly on Intel PMUs for sub-NUMA
clustering. Ideally, the perf tool could work in a user space
emulator=E2=80=94say, an x86 perf tool running under QEMU user emulation on=
 an
ARM64 CPU. Special-casing CPU type and PMU logic defeats this goal.

Thanks,
Ian


> Thanks,
> Besar
>
> >
> > Thanks,
> > Ian
> >
> > > - Arnaldo

