Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A0ECC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 03:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rMWwBwzIsxgTang0VaqK2qQLpHGh3EmiA/vzN5c6ZA=; b=P66vwAF06b2hxaaYcvLpJRedIr
	wL5MffvS1jZ8RWWjy+jihBuTiXaUOpOMezflpuudX5w83M56Pg6y0oD3aMw9+5lmVxAt3UboYUu+X
	uoMSYRnIjIq3E62FTK01ZmgdDifNdo8X6r9LR0PuAQIdA0EomqYDp5JoGrFoM7D5BoNdnOZ4JOoIp
	vkGDiI8VcQm60z6JPv8mfe2s3Hy2FyXZkMABxy7eaYEaXfSIUhKwp8rIYvywgZMZHL0Q2yabo5q7z
	P213LSJ+AS6eZdcP0n/fR3vs3flnCqmvPQqliRp2ASz+S7MWfQkSWgisdnLsl6ERlfQSZVJWW5mO+
	zk723Q5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGpeB-0000000EQsj-428J;
	Wed, 14 Oct 2026 03:27:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGpe9-0000000EQsL-2zbu;
	Wed, 14 Oct 2026 03:27:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D183600CB;
	Wed, 14 Oct 2026 03:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2861F1F000FF;
	Wed, 14 Oct 2026 03:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791948436;
	bh=0rMWwBwzIsxgTang0VaqK2qQLpHGh3EmiA/vzN5c6ZA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=W5uDa+kIII3GfcJWkHe1W4BJUC7aLnd5wGY+BdewiNgOa/dXOYv3jxB3xv0q+kuuB
	 S93s/SJBlnJ+OmCwgW97NGSfzh4m36qp2W7nXumQcR9UQvV1/SDgVCv+Tit75X0VVw
	 TUE1kl3MMAeyjUHsbPgOeheG0NyyuLpHmil0uXTS7Y5VR6f+1+2aiLpckHSE3TBuhU
	 rfD+q1sYwKxxuqY0INPdZkIOBKutybj+hs8t7TJZwFdqgtFZI9V98DJutb4pvvxTy4
	 dkXkdkWg7lFkepzrrSifRJqsSXcyrmnwF9YTLq1H5u9R+waQ12Fexk6SyFCotoTAuA
	 8ni/GCIl0FcSA==
Subject: Re: [PATCH net] can: rockchip_canfd: stop bus-off restart before
 closing the device
From: netdev-bot+sashiko@kernel.org
To: 1579567540@qq.com
Cc: mkl@pengutronix.de, mailhol@kernel.org, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, kernel@pengutronix.de, heiko@sntech.de,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, kuba@kernel.org
Date: Wed, 14 Oct 2026 03:27:15 +0000
Message-ID: <179194843570.434549.16906326776857003512@kernel.org>
In-Reply-To: <tencent_5802EE88434010229EDF7A53084D994C6106@qq.com>
References: <tencent_5802EE88434010229EDF7A53084D994C6106@qq.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 (2) · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch now has rkcanfd_set_mode() return -ENETDOWN when it
  sees priv->closing.
- [Medium] rkcanfd_stop() publishes priv->closing = true (line 776)
  before it masks the controller interrupts with…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it sits in the
  restart path the patch hardens and it can corrupt kernel…
- [High] This problem wasn't introduced by this patch, but rkcanfd_open()
  calls can_rx_offload_enable() (napi_enable) at line 750, before the…

--

can: rockchip_canfd: stop bus-off restart before closing the device

This patch adds a mutex and a closing flag so that the bus-off restart
callback, rkcanfd_set_mode(), cannot run concurrently with rkcanfd_stop().
In the close path, interrupts are now masked and the IRQ synchronized
before restart_work is cancelled. During restart, the IRQ is disabled
while the hardware is reinitialized.

> diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
> index 37c1c22c40c9f..e38ddd143a3ad 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-core.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-core.c

[ ... ]

> @@ -353,19 +355,27 @@ static int rkcanfd_set_mode(struct net_device *ndev,
>  			    enum can_mode mode)
>  {
>  	struct rkcanfd_priv *priv = netdev_priv(ndev);
> +	int err = 0;

[ ... ]

> +	if (mode != CAN_MODE_START)
>  		return -EOPNOTSUPP;
> +
> +	mutex_lock(&priv->state_lock);
> +	if (READ_ONCE(priv->closing)) {
> +		err = -ENETDOWN;
> +		goto out_unlock;
>  	}

[Severity: Medium]
Suppose restart_work runs after rkcanfd_stop() has set closing and dropped
state_lock, but before it reaches cancel_delayed_work_sync(). How does the
CAN core handle the -ENETDOWN returned here?

In can_restart() in drivers/net/can/dev/dev.c, several steps have already
run by the time do_set_mode() is called:

	/* send restart message upstream */
	skb = alloc_can_err_skb(dev, &cf);
	if (skb) {
		cf->can_id |= CAN_ERR_RESTARTED;
		netif_rx(skb);
	}

	/* Now restart the device */
	netif_carrier_on(dev);
	err = priv->do_set_mode(dev, CAN_MODE_START);
	if (err) {
		netdev_err(dev, "Restart failed, error %pe\n", ERR_PTR(err));
		netif_carrier_off(dev);

So in this window userspace receives a CAN_ERR_RESTARTED frame for a
restart that never happens. The carrier also goes on and then off again,
and a normal ifdown logs "Restart failed, error -ENETDOWN" at error level.

The commit message says the ordering is deliberate so that "a queued
restart can observe the closing state", which suggests this window is
expected to be hit.

Can the restart be aborted without these side effects? Alternatively,
can restart_work be cancelled before a restart can reach can_restart()?

>  
> -	return 0;
> +	disable_irq(ndev->irq);
> +	rkcanfd_chip_start(priv);

[Severity: High]
This isn't a bug introduced by this patch, but this patch hardens the
restart path, so is it safe to reinitialize the timestamp delayed_work
here?

On bus-off, rkcanfd_handle_state_error_int() runs in hardirq context and
calls rkcanfd_chip_stop()->rkcanfd_timestamp_stop(). That function only
does a non-sync cancel:

void rkcanfd_timestamp_stop(struct rkcanfd_priv *priv)
{
	cancel_delayed_work(&priv->timestamp);
}

Meanwhile, rkcanfd_timestamp_work() always re-arms itself:

	timecounter_read(&priv->tc);

	schedule_delayed_work(&priv->timestamp, priv->work_delay_jiffies);

If the worker is running when the bus-off interrupt arrives, the cancel
does nothing and the worker re-arms the timer. When restart_ms expires,
the restart path runs:

can_restart_work()->can_restart()->rkcanfd_set_mode()->rkcanfd_chip_start()
    ->rkcanfd_timestamp_init()
        INIT_DELAYED_WORK(&priv->timestamp, rkcanfd_timestamp_work);
    ->rkcanfd_timestamp_start()
        schedule_delayed_work(&priv->timestamp, ...);

Can this corrupt the timer wheel? do_init_timer() clears
timer->entry.pprev while the timer is still enqueued. The following
schedule_delayed_work() then enqueues the same timer_list a second time.

If the old callback is still running instead, INIT_WORK clears its pool
association. The later cancel_delayed_work_sync() in rkcanfd_stop() then
cannot wait for it. Could that callback then call timecounter_read() on
the registers and re-queue itself after pm_runtime_put()? The commit
message says this patch prevents exactly that.

The new state_lock and the disable_irq()/enable_irq() pair keep close and
the IRQ handler out, but they don't cover the timestamp worker. Also,
timecounter_init() in rkcanfd_timestamp_start() races with the lockless
timecounter_read() in the worker.

Would it work to call INIT_DELAYED_WORK() once at probe time, and to call
cancel_delayed_work_sync(&priv->timestamp) in the process-context restart
path before the timecounter is reinitialized?

> +	rkcanfd_chip_interrupts_enable(priv);
> +	enable_irq(ndev->irq);
> +	netif_wake_queue(ndev);

[ ... ]

> @@ -736,6 +749,7 @@ static int rkcanfd_open(struct net_device *ndev)
>  	rkcanfd_chip_start(priv);
>  	can_rx_offload_enable(&priv->offload);
>  
> +	WRITE_ONCE(priv->closing, false);
>  	err = request_irq(ndev->irq, rkcanfd_irq, IRQF_SHARED, ndev->name, priv);
>  	if (err)
>  		goto out_rkcanfd_chip_stop;

[Severity: High]
This is a pre-existing issue, but this hunk touches the request_irq()
path in rkcanfd_open(). What happens to NAPI if request_irq() fails?

can_rx_offload_enable() has already called napi_enable() by this point,
and the error unwind never disables it:

out_rkcanfd_chip_stop:
	rkcanfd_chip_stop_sync(priv, CAN_STATE_STOPPED);
	pm_runtime_put(ndev->dev.parent);
out_close_candev:
	close_candev(ndev);
	return err;

On the next ifup, can_rx_offload_enable()->napi_enable()->
napi_enable_locked() would find NAPI already enabled and hit:

	BUG_ON(!test_bit(NAPI_STATE_SCHED, &val));

Should can_rx_offload_disable(&priv->offload) be added to this error path?

[ ... ]

> @@ -758,9 +772,14 @@ static int rkcanfd_stop(struct net_device *ndev)
>  {
>  	struct rkcanfd_priv *priv = netdev_priv(ndev);
>  
> +	mutex_lock(&priv->state_lock);
> +	WRITE_ONCE(priv->closing, true);
> +	rkcanfd_chip_interrupts_disable(priv);

[Severity: Medium]
Is this ordering safe on a level-triggered line? priv->closing is set
before the controller's interrupt mask is written. The new early return
in rkcanfd_irq() neither acks nor masks the source:

	if (READ_ONCE(priv->closing))
		return IRQ_NONE;

The RK3568 CAN-FD interrupts are IRQ_TYPE_LEVEL_HIGH in rk3568.dtsi.
Suppose the controller raises RX_FINISH or an error interrupt between the
WRITE_ONCE() and rkcanfd_chip_interrupts_disable(). The line then stays
asserted, and the handler rejects it every time it is redelivered.

If that IRQ is routed to the CPU running rkcanfd_stop(), could that CPU
livelock in hardirq and never reach the INT_MASK write? If it goes to
another CPU, the storm would last until the spurious IRQ detector reports
"nobody cared" and disables the line. That would also hit any other users
of this IRQF_SHARED line.

The mutex section is preemptible, so on PREEMPT and PREEMPT_RT kernels the
stop task can be preempted between these two statements, which widens the
window. On PREEMPT_RT, the forced-threaded handler returning IRQ_NONE
combined with the oneshot unmask could loop the same way and starve the
stop task.

Would masking the hardware first help here, i.e. write INT_MASK, read it
back, and only then set closing? Acking or masking inside the closing
branch of rkcanfd_irq() might also work.

> +	mutex_unlock(&priv->state_lock);
> +	synchronize_irq(ndev->irq);
> +	cancel_delayed_work_sync(&priv->can.restart_work);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/tencent_5802EE88434010229EDF7A53084D994C6106%40qq.com

