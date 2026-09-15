Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B1EC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cj5R5t5jOOWUOh1laLGFPGvkStY05/j6AF1nA691sZ8=; b=eK0WigIJBqixPDm/NGdZnw0ETy
	j5Po4W+ZWzLy5kY38QjYHU5VDDNSKyOfDkI5+D34sMI4ck2ldTOHldYQPQ8A7ZgD8182k00vdpMAH
	DKihHcKTTuu75ErsuWrNlWRZuIPWp+j3PVqvOesTHNQdmUWiuYD4nugwCzasOp8SLtUfm0i1fjR9y
	WXKfCgIMgmTsmf2cH2vav8d0j+0ftuR8rBw7xXh3J8XmT/BMjHm9K/2NPnUZ39o1TZ9eQmBQtqX2v
	ILVE90ulibs04aQ59wpB+J8s2OeQxgPYqXAhuyGclSz1nlq6b+wmCe7X7SplwzP8ICApkb6amqvql
	il+IeZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Sye-00000006fpU-0d6W;
	Tue, 15 Sep 2026 13:13:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SyW-00000006fmJ-1EKS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 13:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Cj5R5t5jOOWUOh1laLGFPGvkStY05/j6AF1nA691sZ8=; b=CZYrpRCMndP2xZbY5vbmIJ0puO
	sFW5diJI5OgZQF1x8hx4V6cApImLWg1sYLoEoo/Oysy1LtIP+l7E/FVJo6SMjujK5Jn21ouIuHOna
	x5yk1ZkBkLYaU9XLspVTZktaud5f0YSV8znIdRl9JTc0itWnIJACl7N0bbV3ZrrdXuPyF6a2KfoAR
	D7GwCETgX3yrenNhPiq8+BsRht/GNRPioYbNdcri0z3ve0IU5sJbMPfL0Lq6bZnO1b3U1UHZOIDxt
	0jk0V9A2mShkcI4iji9RYzhAHyxOzAlYByyWj9Z8+P5eUZiKIRVSeGWUX26mFOgCijw5tuI66Xph4
	Ds6FTrGA==;
Received: from out-107.mta0.migadu.com ([2001:41d0:1004:224b::6b] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6SyT-00000006nXE-2YpQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 13:13:27 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=sxgCcXsVUgd/NZQaj7eoMIiwtZuGOSGHsbhHSkNY9/Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789478003; v=1; x=1790082803;
 b=AgKqjuJp+ugdldX+QGlrYnmEuztbSQarp+vTf7ORWT8RTUkg70IRukuHe7f7e76dMTeWkkJW
 iWY0L6boHzjKWjVrCsGFSzGEX6z3oFqMo52Nsm70qgP8MiOmb9OW4+4pivUE0pubONgoDszyzMu
 SOd1uGDCsoLZy78GA6q+Hzcg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 39e716653a419840;
	Tue, 15 Sep 2026 13:13:23 +0000
X-Mizu-Trace-ID: 39e716653a419840
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so384e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 06:13:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAEQkf4C8u1QEPEX/K3F0OthbV+OGTlvRrzfu9CuuMMzMqucnFvmSD2M+1JMcTvVkuLnIP+gIO4GG7WSLm+n2C@lists.infradead.org
X-Gm-Message-State: AFuF++l8sijLOQLys9aUEDnhw1O9m8IJX1MrMwHkfkU0onX3XtSkRlz2
	lpgNF3iN3xXIYysZqeVa7pZ7oGYfBkNpBLmCRoiWI5SQxoKrkfGheKktqoFVt5+XNloi/Az8Aib
	OdxiW2/OfhZKUAxrMCdOqTv/a0wJ/Xd5jnHgV1Aio
X-Received: by 2002:a05:6512:3b0f:b0:5b2:a967:c0c9 with SMTP id
 2adb3069b0e04-5b8b31fbc42mr139494e87.7.1789478001771; Tue, 15 Sep 2026
 06:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-7-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-7-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 14:12:45 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw84p44gZ=qGJq1M7FAg47uJkDMZxxebHx79fzcsETA7w@mail.gmail.com>
X-Gm-Features: AcwNN1U5YrLQgZHFUd0Pkt0i-x1LoJbyUs7P4djhMll5Y6K5gu4LvMmdOU3oihM
Message-ID: <CA+EHjTw84p44gZ=qGJq1M7FAg47uJkDMZxxebHx79fzcsETA7w@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] irqchip/gic-v3-its: Add support for the ITS
 emulation setup
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org, 
	kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com, 
	smostafa@google.com, tglx@kernel.org, vdonnefort@google.com, 
	vladimir.murzin@arm.com, yuzenghui@huawei.com, zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_141325_741404_3EE376C1 
X-CRM114-Status: GOOD (  45.43  )
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

Hi Seb,

On Fri, 7 Aug 2026 at 17:43, Sebastian Ene <sebastianene@google.com> wrote:
>
> Introduce two new helper functions to allow locking the ITS and setting
> up a copy of the host ITS state that will be given to the pKVM
> emulation. The caller of these functions is responsible to implement a
> callback which will be used to setup the emulation layer. The calling
> flow is expected to do the following:
>
> pkvm_its_emulate_setup(its_phys, host)
>         // allocate memory for the priv state of the ITS emulation
>         // call the its emulation setup(its_phys, host, priv_state);
>
> pkvm_drop_host_privileges()
>         its_emulate_acquire_locks(&flags);
>                 on_each_cpu(_kvm_host_prot_finalize, &ret, 1);
>         its_emulate_release_locks(ret, &flags, pkvm_its_emulate_setup);
>
> Augment the its_baser structure with a new fiels that will hold a
> pointer to the base table copy. The gic ITS driver will use the pointer
> to the base table copy when emulation is enabled, as this allows us to
> hide away the original first level of an indirect table to prevent the
> following:
>
> // assumming an indirect Device Table layout
> 1. malicious host patches an entry in the 1st level table with an
>    address that it wants to write to.
> 2. malicious host issues MAPD to install a DTE in the table pointed by
>    the address from (1).
>
> As the driver only manipulates a copy of the table, the emulation is
> responsible for looking at the updates from the copy table, sanitizing
> them and updating the original table before talking to the hardware.
>
> In a simillar fashion, when emulation is in place we no longer let the
> gic ITS driver use the original command queue but we present the driver
> a copy of it and we hide away the original command queue from the driver
> as this will be used entirely by the emulation layer.
>
> Co-authored-by: Bart=C5=82omiej Grzesik <bgrzesik@google.com>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>

A few typos, "fiels" and "simillar" here, "innaccessible" and
"assumming" further down.

Missing SoB.


> ---
>  drivers/irqchip/irq-gic-v3-its.c   | 157 +++++++++++++++++++++++++++--
>  include/linux/irqchip/arm-gic-v3.h |  39 +++++++
>  2 files changed, 185 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v=
3-its.c
> index 6f5811aae59c..e74ae9220af5 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -78,17 +78,6 @@ struct its_collection {
>         u16                     col_id;
>  };
>
> -/*
> - * The ITS_BASER structure - contains memory information, cached
> - * value of BASER register configuration and ITS page size.
> - */
> -struct its_baser {
> -       void            *base;
> -       u64             val;
> -       u32             order;
> -       u32             psz;
> -};
> -
>  struct its_device;
>
>  /*
> @@ -5226,6 +5215,152 @@ static int __init its_compute_its_list_map(struct=
 its_node *its)
>         return its_number;
>  }
>
> +static void its_free_snapshot(struct its_host_state *snapshot)
> +{
> +       int i;
> +
> +       if (snapshot->cmd_host_copy)
> +               its_free_pages(snapshot->cmd_host_copy, get_order(ITS_CMD=
_QUEUE_SZ));
> +
> +       for (i =3D 0; i < GITS_BASER_NR_REGS; i++) {
> +               if (!snapshot->tables[i].base_snapshot)
> +                       continue;
> +
> +               its_free_pages(snapshot->tables[i].base_snapshot, snapsho=
t->tables[i].order);
> +       }
> +
> +       its_free_pages(snapshot, 0);
> +}
> +
> +static struct its_host_state *its_snapshot_host_state(struct its_node *i=
ts)
> +{
> +       void *page;
> +       struct its_host_state *snapshot;
> +       int i;
> +
> +       page =3D its_alloc_pages_node(its->numa_node, GFP_ATOMIC | __GFP_=
ZERO, 0);
> +       if (!page)
> +               return NULL;
> +
> +       snapshot =3D (void *)page_address(page);
> +       page =3D its_alloc_pages_node(its->numa_node, GFP_ATOMIC | __GFP_=
ZERO,
> +                                   get_order(ITS_CMD_QUEUE_SZ));

Once its_emulate_release_locks() has a caller, all of these run under
its_lock and every its->lock with interrupts off. Could the buffers be
allocated before the locks are taken, leaving only the copies under
them? (Sashiko is trying to say the same thing I think)

...
> +static int its_emulate_switch_queues_locked(struct its_node *its, its_em=
ulate_setup cb)
> +{
...
> +               baser_phys =3D virt_to_phys(host.tables[i].base_snapshot)=
;
> +               if (IS_ENABLED(CONFIG_ARM64_64K_PAGES) && (baser_phys >> =
48))
> +                       baser_phys =3D GITS_BASER_PHYS_52_to_48(baser_phy=
s);

its_setup_baser() has a third condition here: it fails unless psz is
SZ_64K, since 52-bit PA needs a 64K page size. This converts at any
page size, and psz is in host.tables[i].psz. Could that check come
too?

Also "host_snaphsot" in this function.

> +
> +               its->tables[i].val &=3D ~GENMASK(47, 12);
> +               its->tables[i].val |=3D baser_phys;
> +               its->tables[i].base =3D host.tables[i].base_snapshot;
> +       }
> +
> +       return 0;
> +}
> +
> +void its_emulate_acquire_locks(unsigned long *flags)
> +{
> +       struct its_node *its;
> +
> +       if (WARN_ON(!flags))
> +               return;
> +
> +       raw_spin_lock_irqsave(&its_lock, *flags);
> +
> +       list_for_each_entry(its, &its_nodes, entry)
> +               raw_spin_lock(&its->lock);

pkvm_drop_host_privileges() runs on_each_cpu() inside this section, so
the IPI goes out with interrupts off and lockdep_assert_irqs_enabled()
in smp_call_function_many_cond() fires on a PROVE_LOCKING build.

Moving the locks isn't free, though: priv is only set by the setup
hypercall after the IPI, and the handler drops every ITS access until
then. Would running the setup before the stage-2 install work, or
forwarding on a NULL priv?

> +}
> +
> +int its_emulate_release_locks(int ret_pkvm_finalize, unsigned long *flag=
s, its_emulate_setup cb)
> +{
> +       struct its_node *its;
> +       int ret =3D 0;
> +
> +       if (WARN_ON(!flags || !cb))
> +               ret =3D -EINVAL;

The acquire returns with no locks held, and the release then unlocks
them anyway and reads *flags. The only caller passes &its_flags, so
could both go?

> +
> +       list_for_each_entry(its, &its_nodes, entry) {
> +               if (!ret_pkvm_finalize && !ret)
> +                       ret =3D its_emulate_switch_queues_locked(its, cb)=
;
> +
> +               raw_spin_unlock(&its->lock);
> +       }
> +
> +       raw_spin_unlock_irqrestore(&its_lock, *flags);
> +
> +       return ret;
> +}
> +
>  static int __init its_probe_one(struct its_node *its)
>  {
>         u64 baser, tmp;
> diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/a=
rm-gic-v3.h
> index ea5fd2374ebe..b75f82cef4bf 100644
> --- a/include/linux/irqchip/arm-gic-v3.h
> +++ b/include/linux/irqchip/arm-gic-v3.h
> @@ -657,6 +657,45 @@ static inline bool gic_enable_sre(void)
>         return !!(val & ICC_SRE_EL1_SRE);
>  }
>
> +/*
> + * The ITS_BASER structure - contains memory information, cached
> + * value of BASER register configuration and ITS page size.
> + */
> +struct its_baser {
> +       void            *base;
> +
> +       /*
> +        * The table used when emulation is in place and indirect layout =
is
> +        * configured.
> +        */
> +       void            *base_snapshot;
> +       u64             val;
> +       u32             order;
> +       u32             psz;
> +};
> +
> +struct its_host_state {
> +       struct its_baser        tables[GITS_BASER_NR_REGS];
> +
> +       /* The command queue used after the emulation is in place */
> +       void                    *cmd_host_copy;
> +
> +       /* The command queue configured by the ITS driver at boot */
> +       void                    *cmd_original;
> +       void                    *cmd_write;
> +       size_t                  cmdq_len;
> +};

struct its_baser was private to irq-gic-v3-its.c. Would it be better
for these to have their own header?

Cheers,
/fuad


> +/*
> + * Callback used to initialize the emulation. It is expected to allocate=
 memory for the private
> + * state of the emulation and receive as arguments copy of the host ITS =
driver state along
> + * with the address of the ITS.
> + */
> +typedef int (*its_emulate_setup)(phys_addr_t its_phys_base, struct its_h=
ost_state *host);
> +
> +void its_emulate_acquire_locks(unsigned long *flags);
> +int its_emulate_release_locks(int ret_pkvm_finalize, unsigned long *flag=
s, its_emulate_setup cb);
> +
>  #endif
>
>  #endif
> --
> 2.55.0.654.g21b8a5bc05-goog
>

