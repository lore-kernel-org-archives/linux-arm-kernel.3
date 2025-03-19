Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CCFC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 04:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKSll+AjFaXDsa3V404KP+oTDZ/84YQEiVw+vNnx8JY=; b=HfoGOssSdbF4nYBI9CVg3anrt/
	o8BvzEdlO+vCPTYAdZ2rSHP2Ang40DXbVQ2REHkMFxVk0yhttj3Nr4wb8sr00pjg2Zszj86FOw9l0
	Bj6lI4kocbEI4DSK1VzKSL0o3KBNvQnYRmaKhv55dhyNn3D6ja/U2qvjQ3KNL/KaQ2FbfiZ8g9Ivl
	i33Fta4SW9dZnXf38ZFCVz8uyh19XYojkEVyBcVFn3JqIK+E+Te2jw/ZEmmIHtp/+vTCwvSCa/Dp7
	gbe3uddtXjPNaYuDPZRUb0Nx9T/hXlpcFAVMFgGmoA/0gLEfKY7XdzSeW4zoMe6ecRXDegeda3cI9
	8mCjibkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tukbp-00000007wOT-2mw9;
	Wed, 19 Mar 2025 04:00:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuka9-00000007wA8-0nfu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 03:59:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44A2E61606
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 03:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE79C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 03:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742356743;
	bh=nJdePGolDOxThuT4ThxqJ1hMOvDDzgOCApbzNq/083I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f62a7Y7eQEz8j24i1zwa4EnttCuxmn4ead+oTqajI3jCk6BrPUsMktAAG/S4RJoXB
	 2y8C+Tw4Ab48scWnjlZy5UTpdde3/ri7v5V/0ArG+7z2VDMe3QBq2U/cZQONwSXx1k
	 LgFxVBqvOd4tPrgIpHwNkRyhPKIKdnSQ7onxIDdEox50Z1qy+J9oIwpnCN1OHW5hrg
	 ubtDzTk+bNlbjJohh61xOTTsmv6ZOajJFSTYTFhig6Q1iGIddZuA9Cq9U4kFNeknHq
	 86FwywN5VdHHxuJpb/3vEA/wvKKTx09i9N7usXotXuT3kIAfSZBHei+hC6tCLHdMTG
	 3m0sl7tp80vwQ==
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d442a77a03so18530855ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 20:59:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YwRAoVZd1oxEWaSdHkXXGpmbjRkXA6LinqhG6O/aaj0UceeCgdY
	GdjS0Ggk95fcIKYeKF1Z2WVH70sVb0DztIu2CE1x/ElNShXmmP31pCIK3u9N2qXnXLnTZgbfEiy
	MVc5C9jF5Lv1+liZIFFjVOx6OD5A=
X-Google-Smtp-Source: AGHT+IGhlzOUomoHZuyt8hTr9krnohQDGxaTZPrFGMMN4mUZ/OdCXyZ4UpJNV9IGF0TuiKDCHyPwaobT5UyUdnL7UCY=
X-Received: by 2002:a92:c246:0:b0:3d3:f64a:38b9 with SMTP id
 e9e14a558f8ab-3d586ba4e4amr12677985ab.15.1742356743031; Tue, 18 Mar 2025
 20:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250308012742.3208215-1-song@kernel.org> <20250308012742.3208215-2-song@kernel.org>
 <iajk7zuxy7fun7f7sv52ydhq7siqub3ec2lmguomdd3fhdw4s2@cwyfihj3gvpn>
 <CAPhsuW4A73c0AjpUwSRJ4o-4E6wpA9c5L0xWaxvHkJ3m+BLGVA@mail.gmail.com>
 <ox4c6flgu7mzkvyontbz2budummiu7e6icke7xl3msmuj2q2ii@xb5mvqcst2vg>
 <CAPhsuW4BEDU=ZJavnofZtygGcQ9AJ5F2jJiuV6-nsnbZD+Gg-Q@mail.gmail.com> <pym6gfbapfy6qlmduszjk6tf2oc2fv4rtxgwjgex7bwlgpfwvs@bkt7qfmf7rc4>
In-Reply-To: <pym6gfbapfy6qlmduszjk6tf2oc2fv4rtxgwjgex7bwlgpfwvs@bkt7qfmf7rc4>
From: Song Liu <song@kernel.org>
Date: Tue, 18 Mar 2025 20:58:52 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6_ZA+V_5JK+xy4v3pyQ-kaZzUooxO=4L+c95fHaW38ig@mail.gmail.com>
X-Gm-Features: AQ5f1JqUKV77-11Llcj708ejD78WXiysKYghH5KgEYTc37jjnaWgIAoDKjabSdQ
Message-ID: <CAPhsuW6_ZA+V_5JK+xy4v3pyQ-kaZzUooxO=4L+c95fHaW38ig@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com, 
	irogers@google.com, joe.lawrence@redhat.com, mark.rutland@arm.com, 
	peterz@infradead.org, roman.gushchin@linux.dev, rostedt@goodmis.org, 
	will@kernel.org, kernel-team@meta.com
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

On Tue, Mar 18, 2025 at 6:03=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Tue, Mar 18, 2025 at 04:38:20PM -0700, Song Liu wrote:
> > On Tue, Mar 18, 2025 at 4:00=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel=
.org> wrote:
> > >   - even in the -ENOENT case the unreliable bit has already been set
> > >     right before the call to kunwind_next_frame_record_meta().
> >
> > For this one, do you mean we set state->common.unreliable, but
> > failed to propagate it to data.unreliable?
>
> Hm, I hadn't noticed that.  That code is quite the maze.
>
> It's unfortunate there are two separate 'unreliable' variables.  It
> looks like consume_state() is the only way they get synced?
>
> How does that work if kunwind_next() returns an error and skips
> consume_state()?  Or if kunwind_recover_return_address() returns an
> error to kunwind_next()?
>
> What I actually meant was the following:
>
>   do_kunwind()
>     kunwind_next()
>       kunwind_next_frame_record()
>         state->common.unreliable =3D true;
>         kunwind_next_frame_record_meta()
>           return -ENOENT;
>
> Notice that in the success case (-ENOENT), unreliable has already been
> set.
>
> Actually I think it would be much simpler to just propagate -ENOENT down
> the call chain.  Then no 'unreliable' bits needed.

Yeah, I was thinking about something like this. This is actually quite
similar to my original RFC version.

On a closer look, I think we also need some logic in unwind_find_stack()
so that we can see when the unwinder hits the exception boundary. For
this reason, we may still need unwind_state.unreliable. I will look into
fixing this and send v2.

Thanks,
Song

>
> Like so (instead of original patch):
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index c9fe3e7566a6..5713fad567c5 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -276,6 +276,7 @@ config ARM64
>         select HAVE_SOFTIRQ_ON_OWN_STACK
>         select USER_STACKTRACE_SUPPORT
>         select VDSO_GETRANDOM
> +       select HAVE_RELIABLE_STACKTRACE
>         help
>           ARM 64-bit (AArch64) Linux support.
>
> @@ -2509,4 +2510,3 @@ endmenu # "CPU Power Management"
>  source "drivers/acpi/Kconfig"
>
>  source "arch/arm64/kvm/Kconfig"
> -
> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrac=
e.c
> index 1d9d51d7627f..e227da842bc3 100644
> --- a/arch/arm64/kernel/stacktrace.c
> +++ b/arch/arm64/kernel/stacktrace.c
> @@ -277,22 +277,28 @@ kunwind_next(struct kunwind_state *state)
>
>  typedef bool (*kunwind_consume_fn)(const struct kunwind_state *state, vo=
id *cookie);
>
> -static __always_inline void
> +static __always_inline int
>  do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state=
,
>            void *cookie)
>  {
> -       if (kunwind_recover_return_address(state))
> -               return;
> +       int ret;
> +
> +       ret =3D kunwind_recover_return_address(state);
> +       if (ret)
> +               return ret;
>
>         while (1) {
>                 int ret;
>
>                 if (!consume_state(state, cookie))
> -                       break;
> +                       return -EINVAL;
> +
>                 ret =3D kunwind_next(state);
> -               if (ret < 0)
> -                       break;
> +               if (ret)
> +                       return ret;
>         }
> +
> +       return -EINVAL;
>  }
>
>  /*
> @@ -324,7 +330,7 @@ do_kunwind(struct kunwind_state *state, kunwind_consu=
me_fn consume_state,
>                         : stackinfo_get_unknown();              \
>         })
>
> -static __always_inline void
> +static __always_inline int
>  kunwind_stack_walk(kunwind_consume_fn consume_state,
>                    void *cookie, struct task_struct *task,
>                    struct pt_regs *regs)
> @@ -352,7 +358,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
>
>         if (regs) {
>                 if (task !=3D current)
> -                       return;
> +                       return -EINVAL;
>                 kunwind_init_from_regs(&state, regs);
>         } else if (task =3D=3D current) {
>                 kunwind_init_from_caller(&state);
> @@ -360,7 +366,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
>                 kunwind_init_from_task(&state, task);
>         }
>
> -       do_kunwind(&state, consume_state, cookie);
> +       return do_kunwind(&state, consume_state, cookie);
>  }
>
>  struct kunwind_consume_entry_data {
> @@ -387,6 +393,25 @@ noinline noinstr void arch_stack_walk(stack_trace_co=
nsume_fn consume_entry,
>         kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs)=
;
>  }
>
> +noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn con=
sume_entry,
> +                       void *cookie, struct task_struct *task)
> +{
> +       int ret;
> +       struct kunwind_consume_entry_data data =3D {
> +               .consume_entry =3D consume_entry,
> +               .cookie =3D cookie,
> +       };
> +
> +       ret =3D kunwind_stack_walk(arch_kunwind_consume_entry, &data, tas=
k, NULL);
> +       if (ret) {
> +               if (ret =3D=3D -ENOENT)
> +                       return 0;
> +               return ret;
> +       }
> +
> +       return -EINVAL;
> +}
> +
>  struct bpf_unwind_consume_entry_data {
>         bool (*consume_entry)(void *cookie, u64 ip, u64 sp, u64 fp);
>         void *cookie;

