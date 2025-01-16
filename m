Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77177C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5McEtRy0WGLcEesq1r35IBW9bLibuPeLZuSQeOZ2L2I=; b=UGmsGyAQYBOBTrpJJZS+Wy/sh+
	5m/tSzkONGn6AZPDastoo98dJK1bcMUt8ZMRvp80ACHIAL8ypLUFSOBz59K4ZcMaFSOpUUdfdS1U0
	ABHNT9Ho90B2Ht8TLW8s8Kt8jyZ0p58H+opExiri2pi4Xtr34iwTKTqKNbVbmuKW59tRpYWCtVWxz
	VJWqvuwrMgpalEfwshEZf/sGHnxEktLbgFAJ50f6ovQCwrJqkfD9WfxkMlnfPkYEYO5oPP89pXilW
	xFGWxutL1izoVMNSxmj8UM1fcvTfoPB22h3DovVygYYLkJQCV62ir1V+mZ1oD8JFrsJ/sJqEHvwn1
	OVrHe+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQPZ-0000000F4ZT-2P9y;
	Thu, 16 Jan 2025 13:59:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQOJ-0000000F4NQ-2OMK;
	Thu, 16 Jan 2025 13:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53F1FA41AC0;
	Thu, 16 Jan 2025 13:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADDCC4CED6;
	Thu, 16 Jan 2025 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737035914;
	bh=zx4Tj1mzhy028nP1IuePzF7KT9Ag3OgxvAVU7fk5AOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHQB4iTIAX5so3ZWOmHRrSnv0ZNyf37tsKts3pl853o8TV8Hn3CwxGAFlZHd8G2lB
	 2KnOxiMtVWqGNlQuvFg5AG9pqX7bHObW4dWGnLWA/O6n0O5erP9ToqBza83DXrTLoD
	 3fkRiqgcl6vxt+yk++sITBlgwDpBUsw0zeoivINfw8AUfXbiRRqDOfI0rrzv/y6xaN
	 71T6zaNMyRWDAb2mQPefU1Wlza4dUyviUN+RWgS1N8TFL8IISHJ+4v1s723JazWtUF
	 PnMuESYO1ijy6EUsSEkquEgIad2zj3SByU5GrRYwx+z5YmN7AqbpU4b9uipjNqa9wW
	 X1wgE0c0sKzAA==
Date: Thu, 16 Jan 2025 13:58:29 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v3 3/4] drivers: firmware: add riscv SSE support
Message-ID: <20250116-boxy-handoff-2f2790b5388e@spud>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-4-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uzZh/1oXmUiqmgLt"
Content-Disposition: inline
In-Reply-To: <20241206163102.843505-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_055835_744922_1FC9E2CE 
X-CRM114-Status: GOOD (  29.53  )
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


--uzZh/1oXmUiqmgLt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 05:30:59PM +0100, Cl=E9ment L=E9ger wrote:
> Add driver level interface to use RISC-V SSE arch support. This interface
> allows registering SSE handlers, and receive them. This will be used by
> PMU and GHES driver.
>=20
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Co-developed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  MAINTAINERS                        |  14 +
>  drivers/firmware/Kconfig           |   1 +
>  drivers/firmware/Makefile          |   1 +
>  drivers/firmware/riscv/Kconfig     |  15 +
>  drivers/firmware/riscv/Makefile    |   3 +
>  drivers/firmware/riscv/riscv_sse.c | 691 +++++++++++++++++++++++++++++
>  include/linux/riscv_sse.h          |  56 +++
>  7 files changed, 781 insertions(+)
>  create mode 100644 drivers/firmware/riscv/Kconfig
>  create mode 100644 drivers/firmware/riscv/Makefile
>  create mode 100644 drivers/firmware/riscv/riscv_sse.c
>  create mode 100644 include/linux/riscv_sse.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 686109008d8e..a3ddde7fe9fb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20125,6 +20125,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel=
/git/iommu/linux.git
>  F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>  F:	drivers/iommu/riscv/
> =20
> +RISC-V FIRMWARE DRIVERS
> +M:	Conor Dooley <conor@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
> +F:	drivers/firmware/riscv/*

Acked-by: Conor Dooley <conor.dooley@microchip.com>

(got some, mostly minor, comments below)

> diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Mak=
efile
> new file mode 100644
> index 000000000000..4ccfcbbc28ea
> --- /dev/null
> +++ b/drivers/firmware/riscv/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_RISCV_SSE)		+=3D riscv_sse.o
> diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/riscv/=
riscv_sse.c
> new file mode 100644
> index 000000000000..c165e32cc9a5
> --- /dev/null
> +++ b/drivers/firmware/riscv/riscv_sse.c
> @@ -0,0 +1,691 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +
> +#define pr_fmt(fmt) "sse: " fmt
> +
> +#include <linux/cpu.h>
> +#include <linux/cpuhotplug.h>
> +#include <linux/cpu_pm.h>
> +#include <linux/hardirq.h>
> +#include <linux/list.h>
> +#include <linux/percpu-defs.h>
> +#include <linux/reboot.h>
> +#include <linux/riscv_sse.h>
> +#include <linux/slab.h>
> +
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
> +
> +struct sse_event {
> +	struct list_head list;
> +	u32 evt;
> +	u32 priority;
> +	sse_event_handler *handler;
> +	void *handler_arg;
> +	bool is_enabled;
> +	/* Only valid for global events */
> +	unsigned int cpu;
> +
> +	union {
> +		struct sse_registered_event *global;
> +		struct sse_registered_event __percpu *local;
> +	};
> +};
> +
> +static int sse_hp_state;
> +static bool sse_available;
> +static DEFINE_SPINLOCK(events_list_lock);
> +static LIST_HEAD(events);
> +static DEFINE_MUTEX(sse_mutex);
> +
> +struct sse_registered_event {
> +	struct sse_event_arch_data arch;
> +	struct sse_event *evt;
> +	unsigned long attr_buf;
> +};
> +
> +void sse_handle_event(struct sse_event_arch_data *arch_event,
> +		      struct pt_regs *regs)
> +{
> +	int ret;
> +	struct sse_registered_event *reg_evt =3D
> +		container_of(arch_event, struct sse_registered_event, arch);
> +	struct sse_event *evt =3D reg_evt->evt;
> +
> +	ret =3D evt->handler(evt->evt, evt->handler_arg, regs);

Is it possible to get here with a null handler? Or will !registered
events not lead to the handler getting called?

> +	if (ret)
> +		pr_warn("event %x handler failed with error %d\n", evt->evt,
> +			ret);
> +}
> +
> +static bool sse_event_is_global(u32 evt)
> +{
> +	return !!(evt & SBI_SSE_EVENT_GLOBAL);
> +}
> +
> +static
> +struct sse_event *sse_event_get(u32 evt)

nit: Could you shift this into one line?

> +{
> +	struct sse_event *sse_evt =3D NULL, *tmp;
> +
> +	scoped_guard(spinlock, &events_list_lock) {
> +		list_for_each_entry(tmp, &events, list) {
> +			if (tmp->evt =3D=3D evt) {
> +				return sse_evt;
> +			}
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static phys_addr_t sse_event_get_phys(struct sse_registered_event *reg_e=
vt,
> +				      void *addr)
> +{
> +	phys_addr_t phys;
> +
> +	if (sse_event_is_global(reg_evt->evt->evt))
> +		phys =3D virt_to_phys(addr);
> +	else
> +		phys =3D per_cpu_ptr_to_phys(addr);
> +
> +	return phys;
> +}
> +
> +static int sse_sbi_event_func(struct sse_event *event, unsigned long fun=
c)
> +{
> +	struct sbiret ret;
> +	u32 evt =3D event->evt;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SSE, func, evt, 0, 0, 0, 0, 0);
> +	if (ret.error)
> +		pr_debug("Failed to execute func %lx, event %x, error %ld\n",
> +			 func, evt, ret.error);

Why's this only at a debug level?

> +
> +	return sbi_err_map_linux_errno(ret.error);
> +}
> +
> +static int sse_sbi_disable_event(struct sse_event *event)
> +{
> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_DISABLE);
> +}
> +
> +static int sse_sbi_enable_event(struct sse_event *event)
> +{
> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_ENABLE);
> +}
> +
> +static int sse_event_attr_get_no_lock(struct sse_registered_event *reg_e=
vt,
> +				      unsigned long attr_id, unsigned long *val)
> +{
> +	struct sbiret sret;
> +	u32 evt =3D reg_evt->evt->evt;
> +	unsigned long phys;
> +
> +	phys =3D sse_event_get_phys(reg_evt, &reg_evt->attr_buf);
> +
> +	sret =3D sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, evt,
> +				     attr_id, 1, phys, 0, 0);
> +	if (sret.error) {
> +		pr_debug("Failed to get event %x attr %lx, error %ld\n", evt,
> +			 attr_id, sret.error);
> +		return sbi_err_map_linux_errno(sret.error);
> +	}
> +
> +	*val =3D reg_evt->attr_buf;
> +
> +	return 0;
> +}
> +
> +static int sse_event_attr_set_nolock(struct sse_registered_event *reg_ev=
t,
> +				     unsigned long attr_id, unsigned long val)
> +{
> +	struct sbiret sret;
> +	u32 evt =3D reg_evt->evt->evt;
> +	unsigned long phys;
> +
> +	reg_evt->attr_buf =3D val;
> +	phys =3D sse_event_get_phys(reg_evt, &reg_evt->attr_buf);
> +
> +	sret =3D sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_WRITE, evt,
> +				     attr_id, 1, phys, 0, 0);
> +	if (sret.error && sret.error !=3D SBI_ERR_INVALID_STATE) {

Why's the invalid state error not treated as an error?

> +		pr_debug("Failed to set event %x attr %lx, error %ld\n", evt,
> +			 attr_id, sret.error);
> +		return sbi_err_map_linux_errno(sret.error);
> +	}
> +
> +	return 0;
> +}
> +
> +static int sse_event_set_target_cpu_nolock(struct sse_event *event,
> +					   unsigned int cpu)
> +{
> +	unsigned int hart_id =3D cpuid_to_hartid_map(cpu);
> +	struct sse_registered_event *reg_evt =3D event->global;
> +	u32 evt =3D event->evt;
> +	bool was_enabled;
> +	int ret;
> +
> +	if (!sse_event_is_global(evt))
> +		return -EINVAL;
> +
> +	was_enabled =3D event->is_enabled;
> +	if (was_enabled)
> +		sse_sbi_disable_event(event);
> +	do {
> +		ret =3D sse_event_attr_set_nolock(reg_evt,
> +						SBI_SSE_ATTR_PREFERRED_HART,
> +						hart_id);
> +	} while (ret =3D=3D -EINVAL);
> +
> +	if (ret =3D=3D 0)
> +		event->cpu =3D cpu;
> +
> +	if (was_enabled)
> +		sse_sbi_enable_event(event);
> +
> +	return 0;
> +}
> +
> +int sse_event_set_target_cpu(struct sse_event *event, unsigned int cpu)
> +{
> +	int ret;
> +
> +	scoped_guard(mutex, &sse_mutex) {
> +		cpus_read_lock();
> +
> +		if (!cpu_online(cpu))
> +			return -EINVAL;
> +
> +		ret =3D sse_event_set_target_cpu_nolock(event, cpu);
> +
> +		cpus_read_unlock();
> +	}
> +
> +	return ret;
> +}
> +
> +static int sse_event_init_registered(unsigned int cpu,
> +				     struct sse_registered_event *reg_evt,
> +				     struct sse_event *event)
> +{
> +	reg_evt->evt =3D event;
> +	arch_sse_init_event(&reg_evt->arch, event->evt, cpu);
> +
> +	return 0;
> +}
> +
> +static void sse_event_free_registered(struct sse_registered_event *reg_e=
vt)
> +{
> +	arch_sse_free_event(&reg_evt->arch);
> +}
> +
> +static int sse_event_alloc_global(struct sse_event *event)
> +{
> +	int err;
> +	struct sse_registered_event *reg_evt;
> +
> +	reg_evt =3D kzalloc(sizeof(*reg_evt), GFP_KERNEL);
> +	if (!reg_evt)
> +		return -ENOMEM;
> +
> +	event->global =3D reg_evt;
> +	err =3D sse_event_init_registered(smp_processor_id(), reg_evt,
> +					event);
> +	if (err)
> +		kfree(reg_evt);
> +
> +	return err;
> +}
> +
> +static int sse_event_alloc_local(struct sse_event *event)
> +{
> +	int err;
> +	unsigned int cpu, err_cpu;
> +	struct sse_registered_event *reg_evt;
> +	struct sse_registered_event __percpu *reg_evts;
> +
> +	reg_evts =3D alloc_percpu(struct sse_registered_event);
> +	if (!reg_evts)
> +		return -ENOMEM;
> +
> +	event->local =3D reg_evts;
> +
> +	for_each_possible_cpu(cpu) {
> +		reg_evt =3D per_cpu_ptr(reg_evts, cpu);
> +		err =3D sse_event_init_registered(cpu, reg_evt, event);
> +		if (err) {
> +			err_cpu =3D cpu;
> +			goto err_free_per_cpu;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_free_per_cpu:
> +	for_each_possible_cpu(cpu) {
> +		if (cpu =3D=3D err_cpu)
> +			break;
> +		reg_evt =3D per_cpu_ptr(reg_evts, cpu);
> +		sse_event_free_registered(reg_evt);
> +	}
> +
> +	free_percpu(reg_evts);
> +
> +	return err;
> +}
> +
> +static struct sse_event *sse_event_alloc(u32 evt,
> +					 u32 priority,
> +					 sse_event_handler *handler, void *arg)
> +{
> +	int err;
> +	struct sse_event *event;
> +
> +	event =3D kzalloc(sizeof(*event), GFP_KERNEL);
> +	if (!event)
> +		return ERR_PTR(-ENOMEM);
> +
> +	event->evt =3D evt;
> +	event->priority =3D priority;
> +	event->handler_arg =3D arg;
> +	event->handler =3D handler;
> +
> +	if (sse_event_is_global(evt)) {
> +		err =3D sse_event_alloc_global(event);
> +		if (err)
> +			goto err_alloc_reg_evt;
> +	} else {
> +		err =3D sse_event_alloc_local(event);
> +		if (err)
> +			goto err_alloc_reg_evt;
> +	}
> +
> +	return event;
> +
> +err_alloc_reg_evt:
> +	kfree(event);
> +
> +	return ERR_PTR(err);
> +}
> +
> +static int sse_sbi_register_event(struct sse_event *event,
> +				  struct sse_registered_event *reg_evt)
> +{
> +	int ret;
> +
> +	ret =3D sse_event_attr_set_nolock(reg_evt, SBI_SSE_ATTR_PRIO,
> +					event->priority);
> +	if (ret)
> +		return ret;
> +
> +	return arch_sse_register_event(&reg_evt->arch);
> +}
> +
> +static int sse_event_register_local(struct sse_event *event)
> +{
> +	int ret;
> +	struct sse_registered_event *reg_evt =3D per_cpu_ptr(event->local,
> +							   smp_processor_id());
> +
> +	ret =3D sse_sbi_register_event(event, reg_evt);
> +	if (ret)
> +		pr_debug("Failed to register event %x: err %d\n", event->evt,
> +			 ret);

Same here I guess, why's a registration failure only a debug print?

> +
> +	return ret;
> +}
> +
> +
> +static int sse_sbi_unregister_event(struct sse_event *event)
> +{
> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_UNREGISTER);
> +}
> +
> +struct sse_per_cpu_evt {
> +	struct sse_event *event;
> +	unsigned long func;
> +	atomic_t error;
> +};
> +
> +static void sse_event_per_cpu_func(void *info)
> +{
> +	int ret;
> +	struct sse_per_cpu_evt *cpu_evt =3D info;
> +
> +	if (cpu_evt->func =3D=3D SBI_SSE_EVENT_REGISTER)
> +		ret =3D sse_event_register_local(cpu_evt->event);
> +	else
> +		ret =3D sse_sbi_event_func(cpu_evt->event, cpu_evt->func);
> +
> +	if (ret)
> +		atomic_set(&cpu_evt->error, ret);
> +}
> +
> +static void sse_event_free(struct sse_event *event)
> +{
> +	unsigned int cpu;
> +	struct sse_registered_event *reg_evt;
> +
> +	if (sse_event_is_global(event->evt)) {
> +		sse_event_free_registered(event->global);
> +		kfree(event->global);
> +	} else {
> +		for_each_possible_cpu(cpu) {
> +			reg_evt =3D per_cpu_ptr(event->local, cpu);
> +			sse_event_free_registered(reg_evt);
> +		}
> +		free_percpu(event->local);
> +	}
> +
> +	kfree(event);
> +}
> +
> +int sse_event_enable(struct sse_event *event)
> +{
> +	int ret =3D 0;
> +	struct sse_per_cpu_evt cpu_evt;
> +
> +	scoped_guard(mutex, &sse_mutex) {
> +		cpus_read_lock();
> +		if (sse_event_is_global(event->evt)) {
> +			ret =3D sse_sbi_enable_event(event);
> +		} else {
> +			cpu_evt.event =3D event;
> +			atomic_set(&cpu_evt.error, 0);
> +			cpu_evt.func =3D SBI_SSE_EVENT_ENABLE;
> +			on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
> +			ret =3D atomic_read(&cpu_evt.error);
> +			if (ret) {
> +				cpu_evt.func =3D SBI_SSE_EVENT_DISABLE;
> +				on_each_cpu(sse_event_per_cpu_func, &cpu_evt,
> +					    1);

nit: this should fit on one line, no?

> +			}
> +		}
> +		cpus_read_unlock();
> +
> +		if (ret =3D=3D 0)
> +			event->is_enabled =3D true;
> +	}
> +
> +	return ret;
> +}

> 2.45.2
>=20

--uzZh/1oXmUiqmgLt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4kQhQAKCRB4tDGHoIJi
0hC8AP411p+sQmrNSq/IzEHylJpClUCspeJhvjMZoMsSFMIiGAEAqLhrzfWsZ2Kt
eHwEWG0k5qGKMGkRIqXNy+RSbV6uqwM=
=CRwi
-----END PGP SIGNATURE-----

--uzZh/1oXmUiqmgLt--

