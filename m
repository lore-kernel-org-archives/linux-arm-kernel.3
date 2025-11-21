Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F02CFC273
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toG3EBybNyGJ1GV0IybCBxeuilaLYcbyrlGkMqTdB58=; b=oMH93HeaaH6Yt+n2UalijCvQMP
	l9YzUlVRpny3zUL5pefQEuHlWJmYulK2dm2cpirx/3o7sYr3mgPMkAUnT8dmeSNF67FRMkHcTpQ1W
	+MzRb+/6U3TT3kPbJs1fclHnVHlHhmHPqoKh+f6OExmL1q4RK8BlFC3w0uoF18v08zLQiapwM7Oqv
	GRBFQ/Y3XqCywqc6xOPw+FoB1bWDBmfFdz/Puu8zD5z9HT9equffyanWhm+vUsVPpRB7zwGwWayvi
	ylqdthdqgNZtunBc4ZwyJGyx//0pDKxx+MwiYz8SOa0juw/zjtPe+4M0+lTE4L1rnGjTAxiXsmDdL
	IYvAepeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMR75-00000008POn-0WwY;
	Fri, 21 Nov 2025 13:23:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMR73-00000008POf-2qfS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 13:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9D0F60249
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 13:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68623C19424
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763731424;
	bh=ECEcTZSNracREyRBoHBY0EQNPthTpIWDuJV7GHm79Ug=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nG3IEBU1k9MufuwLMiuLVKZHavGOX5qH8JNk2SxUWFchiruvinJ2lvg3vnId/fhR9
	 +gwiS0ClKy/mrd+Ph9ljzddjMrvqgrPngTvdyn5IbvYkOWKf4xiZp/byz7vPD+ZeUj
	 peVPECgoivANQ2YWt69lFoI68Qxz/d9mEwdV2RvEbpyd3KIn95UPesTYRcbReZHqul
	 hG9RsTV/iog3GjjDm2OQc8/QLbG/35DPXmvf34qCKz7Utm7waTql2gHdbFW0Ddi6k6
	 SwB78YaLhf6Tk+FKMpgmdChbIGJIJRddeCMBOpyc5+dSzIg7kioTlA+52UaOFahpBI
	 Yawy/dohFPcbQ==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-656b52c0f88so778545eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 05:23:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDO8P38ZMAx1xMrZQImPSsyCBH9ko1junDX0mPFmcQgW6qlfM9Cic3rKC04R06A9QzcV6qTZQFRD8ObWi223tG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0FKTVDrawuaWjv0RScMQ2hjp/IcOHKz3mXZ9keY5oHGc26kT7
	OKOxvb1y9EfEyVyWzwyz+p+9aCnzDTu2bveV6Bo/hKNiHkGUcghluy3ML0YU3BUwNQTxJkQmPm4
	iA/M6HXeR1UUKcXNSWyCikXIAojN/Cek=
X-Google-Smtp-Source: AGHT+IFhp0YVKTtgS3L8OPuDSBkiyOLNkIUJXxKQSshiG2x2l23LJvripY/gCRFK9MFfhVgywKlcZjUCU7fKQ5VhEaA=
X-Received: by 2002:a05:6820:810c:b0:656:b1fb:a8fd with SMTP id
 006d021491bc7-65790a01bcamr707581eaf.1.1763731423664; Fri, 21 Nov 2025
 05:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20251121010756.6687-1-val@packett.cool> <efe52356123168be06811abd08a99f65d6980baa.camel@linux.intel.com>
In-Reply-To: <efe52356123168be06811abd08a99f65d6980baa.camel@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 21 Nov 2025 14:23:32 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h2u_Y8H-mCzeX+gxT4Aipa_MK6egMaA2fGuGkJBGXq7Q@mail.gmail.com>
X-Gm-Features: AWmQ_bk47UcrAbnlYbzZbn257NFsWpeFAQcdakF9SM7SuiCPFKaw52f_xwxzm34
Message-ID: <CAJZ5v0h2u_Y8H-mCzeX+gxT4Aipa_MK6egMaA2fGuGkJBGXq7Q@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: warn and fixup on sanity check instead of
 rejecting the driver
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Val Packett <val@packett.cool>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Christian Loehle <christian.loehle@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Nov 21, 2025 at 2:16=E2=80=AFPM Artem Bityutskiy
<artem.bityutskiy@linux.intel.com> wrote:
>
> On Thu, 2025-11-20 at 22:06 -0300, Val Packett wrote:
> > On Device Tree platforms, the latency and target residency values come
> > directly from device trees, which are numerous and weren't all written
> > with cpuidle invariants in mind. For example, qcom/hamoa.dtsi currently
> > trips this check: exit latency 680000 > residency 600000.
> >
> > Instead of harshly rejecting the entire cpuidle driver with a mysteriou=
s
> > error message, print a warning and set the target residency value to be
> > equal to the exit latency.
> >
> > Fixes: 76934e495cdc ("cpuidle: Add sanity check for exit latency and ta=
rget residency")
> > Signed-off-by: Val Packett <val@packett.cool>
> > ---
> >  drivers/cpuidle/driver.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
> > index 1c295a93d582..06aeb59c1017 100644
> > --- a/drivers/cpuidle/driver.c
> > +++ b/drivers/cpuidle/driver.c
> > @@ -199,8 +199,11 @@ static int __cpuidle_driver_init(struct cpuidle_dr=
iver *drv)
> >                * exceed its target residency which is assumed in cpuidl=
e in
> >                * multiple places.
> >                */
> > -             if (s->exit_latency_ns > s->target_residency_ns)
> > -                     return -EINVAL;
> > +             if (s->exit_latency_ns > s->target_residency_ns) {
> > +                     pr_warn("cpuidle: state %d: exit latency %lld > r=
esidency %lld (fixing)\n",
> > +                             i, s->exit_latency_ns, s->target_residenc=
y_ns);
> > +                     s->target_residency_ns =3D s->exit_latency_ns;
> > +             }
> >       }
>
> Ideally, in a perfect world, driver.c should verify input data and
> reject bad input, rather than correct bad input.
>
> So ideally, if there is an idle driver between DT and driver.c (like
> intel_idle.c in case of Intel), that would be its job to correct DT
> data.
>
> But I'm not familiar with DT platforms, so I don't know if there is a
> driver/piece of SW between DT parsing and driver.c that could handle
> this correction at an earlier stage.
>
> The reason I think this patch is not ideal is because it changes the
> input data at the core framework level, and in theory the change may be
> surprising to users. In general, sometimes rejecting bluntly is better
> than correcting in a possibly unexpected way.

Unless rejecting it causes the functionality to be missing entirely
and users have no straightforward way to fix it up.

As I said in my reply, what can be done in this situation is to print
a warning when assumptions are not met.

