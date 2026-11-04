Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBAE606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qFfC1VQC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6gLz+G8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a2lfzSJOKyr9RKNMXful/dW4OAQJ/NKssbnEoTBgKj4=; b=qFfC1VQCuux+dA
	D2x5spROfzr+FqD3NhqgkQnV+OzU0uSoUUooZLMfDHXV7dr2H6BIH2uilLBufJiqaeJ9/+Gms6p0U
	iiYjWa+o4je80+0NjBty5V90/nJFVG3CnHWS+2CiTMk3vYhzsfZvdMJezhLXJea0Xd63pb6UNSLCB
	VvsEGJyHN88tEX8RQKSww3rZ+Em2oAawjbeTFHsXSLUNjkV6vOIJPC21WOgDM5oNOGtSdgh86XZJR
	bgWIc+xBzeXu7NDLQlxR+cqUEMjxzV7pLlgIyoB+DOgPxkB1blrvsoZ/DMMtZG+PucL+9Ayjt6DNJ
	azp4CrhEOZ7Sf2cZ+gTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOb8Q-00000005UMA-1hSX;
	Wed, 04 Nov 2026 13:34:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOb8O-00000005UM2-1mfM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:34:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DED1843E53
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 13:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B031F00A02
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 13:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799275;
	bh=a2lfzSJOKyr9RKNMXful/dW4OAQJ/NKssbnEoTBgKj4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P6gLz+G8i+HOKMo+639r6YKd/rhWNw9rePKfUWgcn98uAsNSl7aiQGXQoc7JLGwPX
	 SqYTf6NoC4Uhk6VmWGmQpn8FwGrXWPLTx5IxYBF6fucx8LlhfkB0P1oK56kHPV3mTv
	 2TglHiVre+V9lCVUtyYXbfBMp8uc1ihdKIKRRVCdK5a7b5EkpYXYmrizUpwF949Rh1
	 mDsIDM2f/U8mK1O4oDIG3cX2rudlO/8luEE8Ua+9rnBujZn5uGM4pGP6C9IPzhI3qc
	 su/dMlTDZKooYGCzyBdc1mYY6rqpK6BKNtyB07YXHszKZm5clNINueeUmz3Ktwf639
	 9W+EAklyQ9wWg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a772ec8389so5485991fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 05:34:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzHyl0DM+0qiLZzE1JmL2Z9VD+a1OK+pIuwwrIro/PevTk9ronNlLWKyGI5m2n02Eapcysmb0SyRQKlKdo4Wq/C@lists.infradead.org
X-Gm-Message-State: APuU4Z9T9BvDUEcDvSQ6sc2AmKW9n7gt4MeNL1c98kiNz4CAW5BmggpQ
	N0Oc4x6YqvsKIWwu29uBa7gocIEp2jehonBFqY4FfaK32PkIRcTcJX89/Wa8DfSdeS3Eear2/c0
	82DTu3rlRksDeLpKsQbC3mrTpgAkObkY=
X-Received: by 2002:a05:6512:4607:b0:5bf:dc20:c3e3 with SMTP id
 2adb3069b0e04-5bfdc300879mr4834513e87.30.1793799274060; Wed, 04 Nov 2026
 05:34:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103221717.3840215-1-briannorris@chromium.org> <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
In-Reply-To: <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 4 Nov 2026 14:34:22 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jWCz0XDgzeETbmMfGOmvh2G9qcx7xLODrpQ9NiwsddKA@mail.gmail.com>
X-Gm-Features: AclHuK-dsyKqzlehLXWkaZgjbnv2J5XTRBwV6lWjoOrFTYLkmg6F7ScIDL-aHzU
Message-ID: <CAJZ5v0jWCz0XDgzeETbmMfGOmvh2G9qcx7xLODrpQ9NiwsddKA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent to dependency
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I should have responded to the v1 of this, but didn't manage to get to
it.  Sorry about that.

On Tue, Nov 3, 2026 at 11:23=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> When a child device suspends, it does not update the last_busy timestamp
> for its parent. If that parent configured autosuspend and didn't
> otherwise maintain its last_busy timestamp, it may now be immediately
> eligible to suspend. This is probably not expected -- the parent should
> wait for its autosuspend delay before suspending.

Let's first talk about what autosuspend is for: My understanding is
that it is there to avoid incurring the runtime PM suspend and resume
latency (and cost in terms of energy) in the cases when the device is
known or at least is expected to be needed in the near future.  IOW,
we want to defer the runtime suspend of the device because if it
suspended, it would be resumed shortly thereafter.

I'm not sure if that is always the case when a dependent device
suspends and its reference to the parent/supplier is dropped.

The core calls pm_runtime_mark_last_busy() for resuming devices under
the assumption that they are resumed for a reason and so it is likely
that they will be needed in near future, but I'm not sure if that
assumption can be extended to a child suspend case.  One might argue
though that extending it to the child/consumer resume case would make
sense.

> The effect of this behavior is that a parent device may suspend sooner
> than its autosuspend delay, simply because its usage was accounted by
> its children, and not by direct references to the parent device.

The distinction between "direct references to the parent device" and
"usage accounted for by its children" is not clear to me TBH.

There are references to the parent device in both cases and it is not
like drivers can always expect all runtime PM references to come from
specific code paths updating last_busy.  There is at least one
reference controlled by user space (the "control" attribute in sysfs)
and dropping it may also cause the device to suspend immediately if
last_busy has not been updated recently.  How is this situation
different from the one related to child/consumer suspend?

> This was noticed in several cases, and some have implemented
> workarounds, such as in commit c537d3457542 ("iio: adc: stm32-adc: fix
> runtime autosuspend delay when slow polling"). At the same time, Ulf
> suggested these problems "should be solved in the runtime PM core" [1].

So I need to be explained how commit 9bdbb1139ca1 ("iio: adc:
stm32-adc: add power management support") works because ATM I don't
seem to understand it.  It looks to me like the .runtime_idle()
callback updates last_busy for the device for which it is called, not
for its parent.

> Instead of working around the problem in drivers, we propagate last_busy
> timestamps from a dependent device to its dependencies any time it may
> allow a dependency to suspend -- i.e., when releasing a refcount for its
> parent or suppliers. We take care to only propagate the timestamp if it
> is larger than the existing busy timestamp.

I'm not sure why propagating last_busy timestamps when dropping the
reference to the parent/supplier is a good idea.

Why is the child's last_busy timestamp suitable for the parent in the
first place?

Why isn't done when dropping the reference?

> Note that this works best if the dependent device is using autosuspend
> (and therefore updates its last_busy timestamps appropriately), but even
> for a non-autosuspend child, this is still somewhat useful --
> non-autosuspend devices still automatically update their last_busy every
> time they resume.
>
> Link: https://lore.kernel.org/all/CAPDyKFp=3DKTf8=3DzGBSzPYqhjnZpY8xwvjCe=
M1e-WTKT1QLSxaDA@mail.gmail.com/ [1]
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> Cc: Ulf Hansson <ulfh@kernel.org>
>
> Changes in v2:
>  * Update comments to explain when/why rpm_propagate_last_busy()
>    performs the update
>
>  drivers/base/power/runtime.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 2a117d6a776f..dd306cbabcd3 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -318,6 +318,22 @@ static int rpm_get_suppliers(struct device *dev)
>         return 0;
>  }
>
> +/*
> + * Propagate last_busy timestamp from one device to another, typically w=
hen a
> + * device (@dev) releases a reference count on a dependency (@target) an=
d might
> + * allow it to (auto)suspend. This can, for example, prevent overactive =
suspend
> + * when a dependency's usage is primarily driven by one of its dependent=
s.

AFAIAC, you need to say much more than this to explain all of it.

> + */
> +static void rpm_propagate_last_busy(struct device *dev, struct device *t=
arget)
> +{
> +       s64 busy =3D atomic64_read(&dev->power.last_busy);
> +       s64 target_busy =3D atomic64_read(&target->power.last_busy);
> +
> +       while (target_busy < busy)
> +               if (atomic64_try_cmpxchg(&target->power.last_busy, &targe=
t_busy, busy))
> +                       return;
> +}

And I'd rather not do anything like the above unless absolutely necessary.

> +
>  /**
>   * pm_runtime_release_supplier - Drop references to device link's suppli=
er.
>   * @link: Target device link.
> @@ -348,6 +364,7 @@ static void __rpm_put_suppliers(struct device *dev, b=
ool try_to_suspend)
>                 if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
>                         continue;
>
> +               rpm_propagate_last_busy(dev, link->supplier);
>                 pm_runtime_release_supplier(link);
>                 if (try_to_suspend)
>                         pm_request_idle(link->supplier);
> @@ -710,6 +727,8 @@ static int rpm_suspend(struct device *dev, int rpmfla=
gs)
>
>         if (dev->parent) {
>                 parent =3D dev->parent;
> +               if (!parent->power.ignore_children)
> +                       rpm_propagate_last_busy(dev, parent);
>                 atomic_add_unless(&parent->power.child_count, -1, 0);
>         }
>         wake_up_all(&dev->power.wait_queue);
> @@ -1368,8 +1387,10 @@ int __pm_runtime_set_status(struct device *dev, un=
signed int status)
>                 goto out_set;
>
>         if (status =3D=3D RPM_SUSPENDED) {
> -               atomic_add_unless(&parent->power.child_count, -1, 0);
>                 notify_parent =3D !parent->power.ignore_children;
> +               if (notify_parent)
> +                       rpm_propagate_last_busy(dev, parent);
> +               atomic_add_unless(&parent->power.child_count, -1, 0);
>         } else {
>                 spin_lock_nested(&parent->power.lock, SINGLE_DEPTH_NESTIN=
G);
>
> --

