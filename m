Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5C8C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lJZ+v1tQE+7fXGv9gG2/kR5WGSGWGubrkKIdBQfjbg=; b=uQlbutttgzhvM1JsonT84vy+8c
	kJCSAzFP32+5UXsRRJP0LPBrpQiYQ4sA6uNUSr0xtIXSHztWr6sN5s/LIa7Pu8J3/U6vChoVNlHVC
	1iyhze1+ULCil16VeWmstjuU1UYs5tZKtyP9ujCpnG2hf/YMWuxt4YosxmN0kgUXuPGWTTMMcBNDN
	2GF20wb6SDM+80/5tNUxO5Q5+Pu5KyIJ2KeDAdAkU273np3bU0C0+4OJBpSVlp8NaUhAwZVObyAze
	P+7w99DPprXS4iT8oG+7O/yUsmmGWMZwnBy1IoXA0WUvuSie88gsytUs1xqWI/seUugfA1LN8lDrA
	lfJumxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXOR-0000000H22D-38ha;
	Mon, 24 Aug 2026 16:19:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXOQ-0000000H221-1x8z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:19:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0433B43FB4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 16:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2841F000E9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787588365;
	bh=8lJZ+v1tQE+7fXGv9gG2/kR5WGSGWGubrkKIdBQfjbg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DlLu23B71orBL404xahdMosDFAWentKWR9MnkXZ+mzDOyOniRRBlaLaxb9duhHjAI
	 oZisG9Qr/Z59MS6DIti75xFmpSn+66cN4D7zbPHIk31MBoTvyqlbnpO+fh6j8+cfMy
	 EYF+hTNnnbDd0tTs88IOXXHQTyZW8IyovKLSK+IaZQjuiDznP2Xnxd8SZaZJRWO5Fm
	 pQMXpopi21F1z3Z0+FQm/hLuPPI6Xj6UTzceVzl4QwBzs7oFfyCweE13K4UQfzD4SQ
	 xoSscrelZ4n29BvuX5DTi/L/su2shBgkcLRcbRWAbVTxYFt/IuwL9RTu0aKh1QxZU1
	 VkjzzovU3xbdw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39fa5e3a428so534891fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 09:19:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpXz7+hulDisP+PmRK4LGL7Z1VUT9oS0G2CEllRsamEJspfoaeOoU/JtERQjMOzoLxIK6XxnLsQyo0iXd6Zaj3Q@lists.infradead.org
X-Gm-Message-State: AFuF++lsHvNcAs62WaduwqjNRaYxxTnKXhTp28jwqfsethS5V/eeIz3a
	gT2nZKO52CqGNB8mH2xOD/LQbIl7843RIs2srQvU1gExKHQtMgXhqqYmCqJFnU0VbEBgTXZEUTg
	n0VQ3PZX1zM5XCjJDG3ld2anF0I5RRZI=
X-Received: by 2002:a2e:be2b:0:b0:3a1:749:3031 with SMTP id
 38308e7fff4ca-3a1ed8e6121mr897261fa.0.1787588360914; Mon, 24 Aug 2026
 09:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260810100452.426320-1-nagendra.golla@amd.com> <20260810100452.426320-3-nagendra.golla@amd.com>
In-Reply-To: <20260810100452.426320-3-nagendra.golla@amd.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 24 Aug 2026 18:18:39 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gKwxBp=Ajm5_iJEP0GTY5J7SJnHJGCQjfKYgmOHqE0xg@mail.gmail.com>
X-Gm-Features: AcwNN1Vm_R3byA4Vsfe3EkAk1m9zCfndN3eNtueRTEDziUufHrE5YCmoodKHCrI
Message-ID: <CAJZ5v0gKwxBp=Ajm5_iJEP0GTY5J7SJnHJGCQjfKYgmOHqE0xg@mail.gmail.com>
Subject: Re: [PATCH V3 2/6] PM: runtime: Add pm_runtime_if_active guard and
 conditional variant
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, 
	git@amd.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
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

On Mon, Aug 10, 2026 at 12:11=E2=80=AFPM Golla Nagendra <nagendra.golla@amd=
.com> wrote:
>
> Add a pm_runtime_if_active base guard and its _try conditional variant
> to pm_runtime.h for drivers that need to conditionally acquire a runtime
> PM reference only when the device is already active.
>
> The base guard must not be used directly via guard()/scoped_guard()
> because pm_runtime_get_if_active() only acquires a reference when it
> returns 1; the destructor unconditionally calls pm_runtime_put(), which
> would underflow usage_count on a suspended or RPM-disabled device. The
> base guard exists solely to back the DEFINE_GUARD_COND _try variant.

Which is not nice and confusing IMV.

Is there anything like that anywhere else in the kernel?

> The _try variant (used via PM_RUNTIME_ACQUIRE_IF_ACTIVE) checks the
> return value and only runs the destructor when the reference was
> actually acquired. This is useful in interrupt handlers where the
> device may be runtime-suspended and MMIO accesses must be avoided.
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
> Changes in V3:
> - New patch: add PM_RUNTIME_ACQUIRE_IF_ACTIVE() guard and backing
>   infrastructure to pm_runtime.h so that drivers
>   can use a structured guard instead of an open-coded
>   pm_runtime_get_if_active()/pm_runtime_put() pair
> ---
>  include/linux/pm_runtime.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 64921b10ac74..bc6de97e6111 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -609,6 +609,13 @@ DEFINE_GUARD(pm_runtime_active, struct device *,
>              pm_runtime_get_sync(_T), pm_runtime_put(_T));
>  DEFINE_GUARD(pm_runtime_active_auto, struct device *,
>              pm_runtime_get_sync(_T), pm_runtime_put_autosuspend(_T));
> +/*
> + * Do not use directly -- the destructor calls pm_runtime_put()
> + * unconditionally, which underflows if no reference was acquired.
> + * Use only via the _try variant below.
> + */
> +DEFINE_GUARD(pm_runtime_if_active, struct device *,
> +            pm_runtime_get_if_active(_T), pm_runtime_put(_T));
>  /*
>   * Use the following guards with ACQUIRE()/ACQUIRE_ERR().
>   *
> @@ -624,6 +631,8 @@ DEFINE_GUARD_COND(pm_runtime_active_auto, _try,
>                   pm_runtime_get_active(_T, RPM_TRANSPARENT), _RET =3D=3D=
 0)
>  DEFINE_GUARD_COND(pm_runtime_active_auto, _try_enabled,
>                   pm_runtime_resume_and_get(_T), _RET =3D=3D 0)
> +DEFINE_GUARD_COND(pm_runtime_if_active, _try,
> +                 pm_runtime_get_if_active(_T) ?: -EAGAIN, _RET =3D=3D 1)
>
>  /* ACQUIRE() wrapper macros for the guards defined above. */
>
> @@ -639,6 +648,9 @@ DEFINE_GUARD_COND(pm_runtime_active_auto, _try_enable=
d,
>  #define PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(_dev, _var)  \
>         ACQUIRE(pm_runtime_active_auto_try_enabled, _var)(_dev)
>
> +#define PM_RUNTIME_ACQUIRE_IF_ACTIVE(_dev, _var)       \
> +       ACQUIRE(pm_runtime_if_active_try, _var)(_dev)
> +
>  /*
>   * ACQUIRE_ERR() wrapper macro for guard pm_runtime_active.
>   *
> --
> 2.43.7
>

