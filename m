Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43627606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=42bLJ6Zo;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AcfTlBeG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cQLFEQtugZT3lTbkTsdBesMpn6778rHTv2ZMdrwchus=; b=42bLJ6Zob0a3YPYrRpAjwjYnBE
	GRMv6G9Gw4gKwssKK7n3PhywT/nnRtkzqewOb6v9R70DtERqHB0tlId4xMenNXXp3V15FyTc6opkW
	b90/h3GPUoeUjmy/O41DIdkGJH+eDCDfziZZPwrj2QJEaq4921G81b7icgOOqEUCEXVEIa1Ylhx15
	Kslnn0y3UHTf2rw8uHLx4EkYxjkBwfkIZxrJXbjPgabfuBMs9CO3RnlDPF4wY4Vw6m5kZJ2Y5KnEV
	cPMmwFhlkydryWa6uxrWlAIW88ydsF8T5nlZMk1/NTf88rOKVMQTAfcr62YY493s/TFNZWUbPmagj
	76qiOeRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw85-00000008nfC-32mJ;
	Thu, 05 Nov 2026 11:59:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw84-00000008nf5-1taV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:59:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BD2560F48
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 11:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118EA1F00919
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879979;
	bh=cQLFEQtugZT3lTbkTsdBesMpn6778rHTv2ZMdrwchus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AcfTlBeGykO4iaAxSxMwvGjO92tPWHL1Yc5DG1odL7zUW10qanoKrO7YZfDkOabJd
	 fQR6hv12wPxrXf+Ic0ZIeHLEk8hpESFXKuRl9cyHBgPF8nxwT3HipmRLZWAlvuK9GQ
	 D/MXuSNZZf21Kp/lCHIfyUViNRJ9G8k9sZMYM3GMEY7bYhOCXV7HO6WiaXmkcIemY1
	 dLhp1EQehm1sNkMlbLZcc5pRpf7ZNBhHoxOxC5KErzsFJ9j17OS4upniPe2jmLM5zU
	 L45FF5c0uZUXaA60NQ6Ca81xPcD+tzGIeM1SCmtMMs05QnwX2Vu6SgglFr2YIGDT4B
	 zcDiZ/pI4B4QA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4fea434bso540965e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:59:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzmyeRydNqLnXcaK+myZHEy2LLG9WbPxbE2asJz1LmnjdRQEMGRycl/xWM92qtttlJtHPVZS36TyKU95+y/Dm0W@lists.infradead.org
X-Gm-Message-State: APuU4Z8Tf8dJW4EM9DEmNhASLkmF+/cxgvtmpUt6NyVaFrJ3NkQ/Nr/5
	xKZPBXxx25V3OBdwFd+93eqqqBFwUz35nvWluQqfzoNQFAXwOdissgejkUoza7FfIQilr5XO4Fd
	5Yyd3RWoEtvWaWhH5vLJOE2IiIb4pM6w=
X-Received: by 2002:ac2:4e99:0:b0:5bf:fa5f:ec48 with SMTP id
 2adb3069b0e04-5bffa5fee01mr389052e87.2.1793879977424; Thu, 05 Nov 2026
 03:59:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103221717.3840215-1-briannorris@chromium.org>
 <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <CAJZ5v0jWCz0XDgzeETbmMfGOmvh2G9qcx7xLODrpQ9NiwsddKA@mail.gmail.com> <auuICAm4BC_8Pzs5@google.com>
In-Reply-To: <auuICAm4BC_8Pzs5@google.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 5 Nov 2026 12:59:24 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com>
X-Gm-Features: AclHuK9dyrT8aOv3E9w2rFXXQi14VKVDnZ-0h6e3INl2PD9T4Uke8dArGNUlYGs
Message-ID: <CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent to dependency
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000d30e06065f863a0b"
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000d30e06065f863a0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:31=E2=80=AFPM Brian Norris <briannorris@chromium.o=
rg> wrote:
>
> On Wed, Nov 04, 2026 at 02:34:22PM +0100, Rafael J. Wysocki (Intel) wrote=
:
> > I should have responded to the v1 of this, but didn't manage to get to
> > it.  Sorry about that.
>
> Hehe, well that's what v2 is for :)
>
> Thanks for looking.
>
> > On Tue, Nov 3, 2026 at 11:23=E2=80=AFPM Brian Norris <briannorris@chrom=
ium.org> wrote:
> > >
> > > When a child device suspends, it does not update the last_busy timest=
amp
> > > for its parent. If that parent configured autosuspend and didn't
> > > otherwise maintain its last_busy timestamp, it may now be immediately
> > > eligible to suspend. This is probably not expected -- the parent shou=
ld
> > > wait for its autosuspend delay before suspending.
> >
> > Let's first talk about what autosuspend is for: My understanding is
> > that it is there to avoid incurring the runtime PM suspend and resume
> > latency (and cost in terms of energy) in the cases when the device is
> > known or at least is expected to be needed in the near future.  IOW,
> > we want to defer the runtime suspend of the device because if it
> > suspended, it would be resumed shortly thereafter.
> >
> > I'm not sure if that is always the case when a dependent device
> > suspends and its reference to the parent/supplier is dropped.
>
> To be clear: dropping a reference is not the point at which we extend
> the timer -- it's simply the point at which we propagate the last_busy
> timestamp.
>
> The naive algorithm is:
> Every time a device updates its last_busy, sync that timestamp to all
> its dependencies.
>
> My proposal modifies that naive algorithm so that it avoids additional
> graph walks -- it defers that "sync" step until later. (Now that I'm
> spelling this out, I feel like I should have included this in the commit
> message...)

OK, thanks for explaining!

You seem to be arguing that the current behavior is counter-intuitive
because people would generally expect the parent's (or supplier's)
last_busy to be automatically advanced to the last "busy" time of its
last active child (or consumer).

That is a bit far-fetched IMV because the child's last "busy" time
need not be the same as the parent's last "busy" time, at least in
principle (of course, that is debatable, but that debate can be had
later).

Still, the underlying observation seems to be that if the child
suspends and then resumes relatively shortly, it may not make sense to
suspend and resume the parent in the meantime, which is fair enough.
Of course, advancing the parent's last_busy will only help here if its
autosuspend delay is long enough though.

So you can argue that if the parent's autosuspend delay is long
enough, then it should prevent the parent from suspending across
relatively short periods of child suspension.  Again, this is fair
enough, so why does it not happen at times?

It certainly does happen when the parent actually has to resume
because rpm_resume() calls pm_runtime_mark_last_busy() for it then and
(given a sufficiently long autosuspend delay) it will stay active if
the child resumes a short enough time after suspending.  However, when
the child resumes, the parent is still active, so rpm_resume()
triggered by the child does not advance its last_busy timestamp, so at
one point in the future it will suspend when the child suspends.

This arguably is inconsistent, so my approach to addressing the
problem at hand would be the attached patch (sorry for the attachment,
but GMail is generally not good at handling appended patches).  If I'm
not mistaken, it should be sufficient to address the particular issue
that triggered commit c537d3457542.

Note that I'm not worried about the potential raciness of this new
last_busy update with other possible concurrent updates of last_busy
because they all use approximations of the current time and if they
are close enough to each other, it should not matter who wins the
race.

> With that said:
>
> > The core calls pm_runtime_mark_last_busy() for resuming devices under
> > the assumption that they are resumed for a reason and so it is likely
> > that they will be needed in near future, but I'm not sure if that
> > assumption can be extended to a child suspend case.
>
> But that's not what I'm doing: I'm not calling mark_last_busy() -- I'm
> just making mark_last_busy() transitive to all dependencies. So any time
> we *already* say the child is busy, I also extend that to the parent --
> I'm not generating any new timestamps; I only reuse the timestamps we
> already selected.
>
> My view on the logic (using your terms above): when a child calls
> mark_last_busy(), it suggests that child might be needed in the near
> future. Whenever a child device is needed, so is its parent (barring
> ignore_children). Thus, mark_last_busy() should also refresh the
> parent's busy timestamp.

Of course, it can be argued this way though there are
counter-arguments (probably not worth discussing in detail at this
point) and there is the question how much of a difference this would
make after addressing the rpm_resume() inconsistency mentioned above
(which IMV needs to be address regardless because it is not limited to
the parent-child or supplier-consumer situations).

> Importantly (in the same topic Jonathan was already asking about): this
> does *not* mean the parent gets a whole new autosuspend delay period --
> but it *does* mean that if the parent has a longer delay period
> (presumably because it has a more expensive/slow suspend/resume latency)
> it waits a bit longer (in case the child wakes back up, for one) to
> autosuspend.
>
> In concrete terms of commit c537d3457542 ("iio: adc: stm32-adc: fix
> runtime autosuspend delay when slow polling"):
>
>  * child device has 100ms delay
>  * parent devices has 2s delay
>
> SEQUENCE:
>  1) child is active for longer than 2 seconds
>  2) [timestamp N] child finishes I/O, drops reference with put_autosuspen=
d()
>  3) [N + 100ms] child suspends
>
> CURRENT BEHVIOR:
>  4) [N + 100ms] parent suspends immediately after #3
>
> PROPOSAL:
>  4) [N + 2s] parent suspends (if there was no other last_busy update)
>
> The only last_busy timestamp is N; we just use it in more places,
> because the parent was, in fact, busy at timestamp N.
>
> > One might argue
> > though that extending it to the child/consumer resume case would make
> > sense.
> >
> > > The effect of this behavior is that a parent device may suspend soone=
r
> > > than its autosuspend delay, simply because its usage was accounted by
> > > its children, and not by direct references to the parent device.
> >
> > The distinction between "direct references to the parent device" and
> > "usage accounted for by its children" is not clear to me TBH.
>
> "Direct reference" is to mean "pm_runtime_put_autosuspend()" or anything
> similar that updates last_busy. We expect that when the device in
> question is the target object for I/O or whatever is keeping the device
> busy.
>
> But if the I/O is performed by a child, then it's no longer "direct
> reference" -- it's "usage accounted by its children".
>
> > There are references to the parent device in both cases and it is not
> > like drivers can always expect all runtime PM references to come from
> > specific code paths updating last_busy.  There is at least one
> > reference controlled by user space (the "control" attribute in sysfs)
> > and dropping it may also cause the device to suspend immediately if
> > last_busy has not been updated recently.  How is this situation
> > different from the one related to child/consumer suspend?
>
> I think I've improperly directed you to focus on the "reference" part,
> which IMO is a bit of a distraction. The point is: when was the device
> "busy" (or "last used")? The 'control' attribute does not represent
> "last used"; it just represents some unrelated policy to prevent
> suspension.

Or not, depending on why user space flips the "control" attribute
which is not known to the kernel.

> > > This was noticed in several cases, and some have implemented
> > > workarounds, such as in commit c537d3457542 ("iio: adc: stm32-adc: fi=
x
> > > runtime autosuspend delay when slow polling"). At the same time, Ulf
> > > suggested these problems "should be solved in the runtime PM core" [1=
].
> >
> > So I need to be explained how commit 9bdbb1139ca1 ("iio: adc:
> > stm32-adc: add power management support") works because ATM I don't
> > seem to understand it.  It looks to me like the .runtime_idle()
> > callback updates last_busy for the device for which it is called, not
> > for its parent.
>
> Note: stm32-adc-core (drivers/iio/adc/stm32-adc-core.c) is the parent.
> stm32-adc (drivers/iio/adc/stm32-adc.c) is the child.

It would really have helped if that had been described properly in the
changelog of commit c537d3457542.  Oh well.

> When the child suspends, the parent checks .runtime_idle(). This updates
> last_busy but still falls through to autosuspend -- that means we get a
> slightly suboptimal sequence like the following:
>
>  1) child is active for longer than 2 seconds
>  2) [timestamp N] child finishes I/O, drops reference with put_autosuspen=
d()
>  3) [N + 100ms] child suspends
>  4) parent runtime_idle() updates last_busy to [P =3D approx N + 100ms]
>  5) [P + 2s] parent suspends
>
> Step 5 happens approximately 100ms later than it really should, but it's
> good enough.
>
> NB: I think this is also why greybus (gb_bundle_idle(),
> gb_interface_runtime_idle(), etc.) and USB (usb_runtime_idle(),
> dwc3_runtime_idle()) look the way they do, with a built-in
> mark_last_busy() in runtime_idle().

So I'm wondering how much of this will still be needed with the
attached patch applied.

> I also think that some other areas could use some logic like this. For
> example, drivers/pci/pcie/portdrv.c has a 100ms autosuspend delay so
> that lspci doesn't cause repeated suspend/resume. But suppose config
> access for a child of a port are slow ... then the port still might
> suspend immediately, between config accesses. (Never mind that
> pci_config_pm_runtime_put() doesn't update last_busy...)

But at the point when the first config space access takes place, it is
unclear that the next one will happen, which is part of the problem
here: The child resume needs to be expected to happen shortly for all
of this to make sense.

--000000000000d30e06065f863a0b
Content-Type: text/x-patch; charset="US-ASCII"; name="pm-runtime-last_busy.patch"
Content-Disposition: attachment; filename="pm-runtime-last_busy.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mw3ed8z20>
X-Attachment-Id: f_mw3ed8z20

LS0tCiBkcml2ZXJzL2Jhc2UvcG93ZXIvcnVudGltZS5jIHwgICAgNiArKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCi0tLSBhL2RyaXZlcnMvYmFzZS9wb3dlci9ydW50aW1l
LmMKKysrIGIvZHJpdmVycy9iYXNlL3Bvd2VyL3J1bnRpbWUuYwpAQCAtODE5LDYgKzgxOSwxMiBA
QCBzdGF0aWMgaW50IHJwbV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2CiAJCXBtX3J1bnRpbWVf
ZGVhY3RpdmF0ZV90aW1lcihkZXYpOwogCiAJaWYgKGRldi0+cG93ZXIucnVudGltZV9zdGF0dXMg
PT0gUlBNX0FDVElWRSkgeworCQkvKgorCQkgKiBBbiBhdHRlbXB0IHRvIHJlc3VtZSB0aGUgZGV2
aWNlIG1lYW5zIHRoYXQgaXQgaXMgbmVlZGVkIGZvcgorCQkgKiBzb21ldGhpbmcsIHNvIHVwZGF0
ZSBpdHMgbGFzdF9idXN5IHRpbWVzdGFtcCBpbiBhbmFsb2d5IHdpdGgKKwkJICogdGhlIGNhc2Ug
aW4gd2hpY2ggaXQgYWN0dWFsbHkgcmVzdW1lcyBiZWxvdy4KKwkJICovCisJCXBtX3J1bnRpbWVf
bWFya19sYXN0X2J1c3koZGV2KTsKIAkJcmV0dmFsID0gMTsKIAkJZ290byBvdXQ7CiAJfQo=
--000000000000d30e06065f863a0b--

