Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3223BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNOtf2TzRxsLyFHPcWQa1TjnFgr337may2J1744aXQs=; b=bHHRnd7tyv7EOXSFYWLDx6UowT
	zvkP+AU6UMcwnYUCyTn1Y7zkOBHZCnYAagGY28cbpAZpUeJsN3TiVH5S5PWLr3odtvKhVuZv70RdC
	AtZoKQl+aRNyLRYZsh3ZGYuosO334TcvmlrlJKQLFgc2Fl5LIHZVu41sEehaRL2EVoRxRLHaTuEhW
	HWQOtCbtUXnXv9w+B/5hf17y7mlNSyPIr9fOigZ2XDutD7a64pImUSF6yUjx57pYm1ItzpdozqMI0
	MGY6pm0iqzlWAN09eleYfA52OeUOVzOgZnxjGR6MQP2LdsVDXUmov+ohhRXR/QRUgjIMpcqhdntCs
	7Y+q6BYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cLj-00000003O3L-2mEr;
	Fri, 04 Sep 2026 22:25:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cLi-00000003O2m-1pPr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:25:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DF0B60229;
	Fri,  4 Sep 2026 22:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DF91F00A3D;
	Fri,  4 Sep 2026 22:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788560729;
	bh=nNOtf2TzRxsLyFHPcWQa1TjnFgr337may2J1744aXQs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=X7uq9pUX0v5IDlI+2oVNdVSZ5YmNUUqzE6Hp9xgYoZZ3WXF0DmymGxhv5d2VS+Trv
	 sdN3Q5RcSE80qNAVxD5bPUvX8vvxjMVrySggfBAciRnlMMdlBs9xrH3DvlkhnhEPtx
	 Sl2XPn70QVsE0UnHhxJfDx7tafDN883vIQ45BwPtJgvPsUUY/u4PeVGHQjbalebRWn
	 rbT0qj1/2UToSVnCf0q/P+3JO1rhI4NCWaJUF9sA3bfOqSsGc1dl/2oE/HYTDySoPY
	 9nS5ysZllX0M/VnI4pUHMES2p2QiAPfAii8QK07b/3fEVkO/KDrdOvHe0+u9CChgRt
	 11DvYkhjmcVgA==
Subject: Re: [PATCH v3 net-next 3/8] ptp: netc: export
 netc_timer_get_current_time() for cross-driver use
From: netdev-bot+sashiko@kernel.org
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 richardcochran@gmail.com, wei.fang@nxp.com, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 04 Sep 2026 22:25:27 +0000
Message-ID: <178856072792.219967.11680386922247714173@kernel.org>
In-Reply-To: <20260831082335.1184605-4-wei.fang@oss.nxp.com>
References: <20260831082335.1184605-4-wei.fang@oss.nxp.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 1 · Low: 1

- [High] Using device_lock() in an exported API to protect against driver
  unbind is an architectural anti-pattern that creates a circular lock…
- [Medium] The newly exported netc_timer_get_current_time() gates the
  TMR_CUR_TIME MMIO read only on 'a netc_timer driver is bound' and…
- [Low] Inconsistent / semantically wrong errno contract for the new
  exported API netc_timer_get_current_time().

--

ptp: netc: export netc_timer_get_current_time() for cross-driver use

This adds netc_timer_get_current_time() to the NETC Timer driver and
exports it so the NETC Switch driver, which is a separate PCIe function
with its own driver, can read TMR_CUR_TIME. The helper takes the device
lock to serialize against unbind and the per-device spinlock around the
register read, and spin_lock_init() moves earlier so the lock is
initialized before pci_set_drvdata().

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index aa9be8e2a6304..854a206b6c5bc 100644
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c

[ ... ]

> @@ -1021,5 +1021,55 @@ static struct pci_driver netc_timer_driver = {
>  };
>  module_pci_driver(netc_timer_driver);
>  
> +/**
> + * netc_timer_get_current_time - read the current PTP time from the NETC Timer
> + * @pdev: PCI device of the NETC Timer
> + * @ns: The current PTP clock time in nanoseconds, returned to the caller
> + *
> + * Reads the 64-bit current time register (TMR_CUR_TIME) from the NETC Timer
> + * device associated with @pdev. Returns an error if the Timer driver has not
> + * yet probed or has already been removed.
> + *
> + * Context: Process context only. Acquires the device mutex via device_lock(),
> + *          which may sleep. Must not be called from atomic context, softirq,
> + *          BH, or while holding a spinlock.
> + *
> + * Return: 0 on success, otherwise a negative error code.
> + */
> +int netc_timer_get_current_time(struct pci_dev *pdev, u64 *ns)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct netc_timer *priv;
> +	unsigned long flags;
> +	int err = 0;
> +
> +	/* Serialize against driver unbind: the remove() callback runs under
> +	 * the device lock, so holding it here ensures that priv remains valid
> +	 * for the entire duration of the register read.
> +	 */
> +	device_lock(dev);
> +
> +	if (pci_dev_driver(pdev) != &netc_timer_driver) {
> +		err = -EINVAL;
> +		goto unlock_device;
> +	}
> +
> +	priv = pci_get_drvdata(pdev);
> +	if (!priv) {
> +		err = -ENOMEM;
> +		goto unlock_device;
> +	}

[Severity: High]
Taking the supplier's device lock from an exported cross-driver
helper worries me, both for the lock ordering it creates and for the
contexts it rules out.

On the ordering side, consider the consumer added later in this
series. netc_switch_remove() runs with the switch device's dev->mutex
held by the driver core; it calls dsa_unregister_switch(), which takes
rtnl_lock(), and netc_port_disable(), which takes
&onestep->work_lock. That gives dev->mutex -> rtnl_lock ->
work_lock. In the datapath, netc_onestep_work() holds
&onestep->work_lock and then calls netc_timer_get_current_time(),
which takes the timer's dev->mutex here. Since lockdep tracks the
dev->mutex of devices initialized through device_initialize() as one
lock class, that second chain is work_lock -> dev->mutex and closes
the cycle. A splat there disables lock debugging for the rest of the
boot, so it is not something we can leave to be discovered by
whoever unbinds the switch while Sync frames are in flight.

On the context side, the kernel-doc you added already spells out the
consequence: process context only, may sleep, no softirq, no BH, no
spinlock held. That is a fairly severe restriction for what is
fundamentally a single 64-bit register read on a timestamping path,
and it is imposed purely by the unbind protection rather than by the
hardware access itself.

The usual way to express "this consumer needs that supplier to stay
bound" is a device link. If the switch driver called
device_link_add() against the Timer's pci_dev at probe time, the
Timer could not be unbound underneath a live consumer, and
netc_timer_get_current_time() could drop device_lock() entirely and
keep only the spin_lock_irqsave(&priv->lock) around
netc_timer_cur_time_read(), making it callable from atomic context
too.

Is there a reason a device link would not work for the
Timer/Switch pair here (for example probe ordering between the two
PCIe functions)? If so, could you describe what else guarantees the
lock ordering above is safe?

[Severity: Low]
This isn't a bug, but the errno contract of the new exported interface
looks inconsistent.

The same logical state, "the NETC Timer is not available", is reported
three different ways:

  - netc_timer_get_current_time() returns -EINVAL when no netc_timer
    driver is bound
  - netc_timer_get_current_time() returns -ENOMEM when
    pci_get_drvdata() is NULL
  - the !IS_REACHABLE(CONFIG_PTP_NETC_V4_TIMER) stub in
    include/linux/fsl/netc_global.h returns -ENODEV

The -ENOMEM in particular does not match what happened, since this
function performs no allocation at all, and the kernel-doc above
describes the only failure condition as "the Timer driver has not yet
probed or has already been removed".

Would -ENODEV for both in-function checks, matching the header stub,
make the interface easier for callers to test?

> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	*ns = netc_timer_cur_time_read(priv);
> +	spin_unlock_irqrestore(&priv->lock, flags);

[Severity: Medium]
Can this read return a fabricated time and still report success while
the Timer function is suspended?

The two checks above only establish that a netc_timer driver is bound
and that drvdata is non-NULL. Neither implies that the Timer PCI
function still decodes memory, that it is in D0, or that TMR_CTRL[TE]
is still set.

netc_timer_driver registers no PM callbacks:

drivers/ptp/ptp_netc.c:
    static struct pci_driver netc_timer_driver = {
        .name = KBUILD_MODNAME,
        .id_table = netc_timer_id_table,
        .probe = netc_timer_probe,
        .remove = netc_timer_remove,
    };

so during system suspend the PCI core takes the no-dev_pm_ops path:

pci_pm_suspend()
  pci_pm_default_suspend()
    pci_disable_enabled_device()   /* clears PCI_COMMAND_MEMORY */
  -> D3hot

The driver is not unbound in that window, so pci_dev_driver(pdev) ==
&netc_timer_driver and pci_get_drvdata(pdev) != NULL both still pass,
ioread64_lo_hi() reads all-ones, and the function returns 0. The
cross-driver consumer added later in this series treats a 0 return as a
valid time:

drivers/net/dsa/netc/netc_ptp.c:netc_onestep_work() {
    ...
    if (unlikely(netc_get_phc_time(priv, &tstamp))) {
    ...
}

and programs the value into a transmitted one-step Sync frame and into
PM_SINGLE_STEP.

Does the same apply after resume? Nothing re-runs netc_timer_init(), so
TMR_CTRL (CK_SEL/TE/TCLK_PERIOD/COMP_MODE), TMR_PRSC, TMR_ADD and
TMR_CNT are never reprogrammed after the D3hot->D0 transition, while
the exported reader keeps reporting success. The driver's own comment
documents these as preconditions:

drivers/ptp/ptp_netc.c:netc_timer_init() {
	/* Software must enable timer first and the clock selected must be
	 * active, otherwise, the registers which are in the timer clock
	 * domain are not accessible.
	 */
	tmr_ctrl = FIELD_PREP(TMR_CTRL_CK_SEL, priv->clk_select) |
		   TMR_CTRL_TE | TMR_CTRL_FS;
    ...
}

The lack of suspend/resume support in ptp_netc predates this patch, but
this patch turns that unchecked power and enable state into a
cross-driver contract. Would it make sense for the exported helper to
also check pci_dev->current_state == PCI_D0 (or TMR_CTRL[TE], or take a
PM reference), or for the driver to gain suspend/resume handlers that
re-run netc_timer_init()?

> +
> +unlock_device:
> +	device_unlock(dev);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(netc_timer_get_current_time);
> +
>  MODULE_DESCRIPTION("NXP NETC Timer PTP Driver");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/include/linux/fsl/netc_global.h b/include/linux/fsl/netc_global.h
> index 5b8ff528d3699..d4a26c17f99a4 100644
> --- a/include/linux/fsl/netc_global.h
> +++ b/include/linux/fsl/netc_global.h

[ ... ]

> @@ -22,4 +23,13 @@ static inline u64 netc_read64(void __iomem *reg)
>  	return ioread64(reg);
>  }
>  
> +#if IS_REACHABLE(CONFIG_PTP_NETC_V4_TIMER)
> +int netc_timer_get_current_time(struct pci_dev *pdev, u64 *ns);
> +#else
> +static inline int netc_timer_get_current_time(struct pci_dev *pdev, u64 *ns)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +
>  #endif

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831082335.1184605-1-wei.fang%40oss.nxp.com

