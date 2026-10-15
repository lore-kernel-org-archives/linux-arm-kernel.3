Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B549FCCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyB/6NmFZRGdrRTP5KsJ3jOecvhsS5ZTpQOfRco2vuc=; b=sWkjiVgG750JbhFpPoIUZSfA8c
	Vq9K7K5KTQO0tItX8HZgVulNIz5tP2tkb+Y/pNIvsfr7iki5QNSFDXlhfo8QVEReCh/uKxEEbK5PX
	0UwLdELG47lADOEangwRiuVRRMnyK28o0Ncj1fm0n56cBVjJCwfsINjoz5FvDHvBdbkfzz8YZoflV
	2i1heY59zmWrDBvUnDKthClBABa4A7KkYV3b88OSfvrCLzRiCVrYzv6Q9kk1A1/Kxj0GqPWy6f+Nl
	ChxitY7+HHnnr8IgUMYqi/NaXzys6RquHPeLfXeP08Ggc6+hymBGCErE9btM0A0uG74ugwaa0H+MJ
	95tn42yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOSw-00000000rfP-3mqb;
	Thu, 15 Oct 2026 16:38:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOSp-00000000rcW-2giC;
	Thu, 15 Oct 2026 16:37:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D02B40A39;
	Thu, 15 Oct 2026 16:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4019C1F000C6;
	Thu, 15 Oct 2026 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792082274;
	bh=dyB/6NmFZRGdrRTP5KsJ3jOecvhsS5ZTpQOfRco2vuc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XQSQ4lYdZyh71183NKR1fUb/KSjbuLiil4dINwYsiQOs3lIRiHgMXCptxbpKkmhDz
	 a/X3K2lWp+bDJoGHX6feWzthtGNOn0UZr5PYiSbz0XEV7zXsEvOSAGSMrSGQnAjiZ0
	 NqxKCpMsQArqjosMi5CwsqglRY77PCl/6W5JHHLpnAUgKDObX5hNVxrrGbRB76Y/LU
	 tI/khRPWUlc5yTzg+aTzNO+NrAhaM0VJuIdPTrzcr4umpYenn9ji5jQadmSZPeLajf
	 6EMgL2rbtc/5zrpyCLAfs3MZ5HAbxdgYTmwk4sW0Q+4w2Wd4/61SV6bB4gJ0yFsWE0
	 Ol29ynRUCrpuQ==
Subject: Re: [PATCH net v2 3/3] can: rockchip_canfd: cancel bus-off restart
 before closing the device
From: netdev-bot+sashiko@kernel.org
To: 1579567540@qq.com
Cc: mkl@pengutronix.de, mailhol@kernel.org, heiko@sntech.de,
 davem@davemloft.net, wg@grandegger.com, socketcan@hartkopp.net,
 kernel@pengutronix.de, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org, kuba@kernel.org
Date: Thu, 15 Oct 2026 16:37:53 +0000
Message-ID: <179208227384.1406898.15110321342582191229@kernel.org>
In-Reply-To: <tencent_B15E13184DA04C4382F48848C006A2B51F06@qq.com>
References: <tencent_B15E13184DA04C4382F48848C006A2B51F06@qq.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] can: rockchip_canfd: disable_irq() called on shared IRQ

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the restart
  callback the patch modifies re-initializes a delayed_work that may…

--

can: rockchip_canfd: cancel bus-off restart before closing the device

This commit calls close_candev_cancel_restart_sync() at the start of
rkcanfd_stop(), so a running bus-off restart finishes while the IRQ and
other resources are still available. It also brackets the hardware
reinitialization in rkcanfd_set_mode() with disable_irq()/enable_irq().
That keeps the IRQ handler out while the controller is restarted.

> diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
> index 37c1c22c40c9f..fb8f6b0675022 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-core.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
> @@ -356,8 +356,10 @@ static int rkcanfd_set_mode(struct net_device *ndev,
>  
>  	switch (mode) {
>  	case CAN_MODE_START:
> +		disable_irq(ndev->irq);
>  		rkcanfd_chip_start(priv);

[Severity: Medium]
rkcanfd_open() requests ndev->irq with IRQF_SHARED, and the commit
message itself relies on the line being shared. disable_irq() masks
the whole line at the irqchip, not only this controller's source.
It also waits in synchronize_irq() for the handlers of every other
device on that line.

Every device sharing the line therefore loses interrupt delivery for
as long as rkcanfd_chip_start() and rkcanfd_chip_interrupts_enable()
run. That window covers:

- the reset and work mode transitions
- FIFO setup
- bittiming programming
- timestamp init and start

The window can be opened from outside the box. Another node on the
CAN bus can drive this controller into bus-off. With restart-ms
configured, restart_work then runs rkcanfd_set_mode(), and a manual
can_restart_now() takes the same path. Each restart stalls the
unrelated devices sharing the IRQ.

Drivers on a shared IRQ are generally expected not to use
disable_irq() for their own exclusion, for exactly this reason.

Would it be possible to exclude rkcanfd_irq() with a real lock
instead? For example, the handler could take a spinlock, and
spin_lock_irqsave() could be held around the chip_start and
interrupts_enable sequence here.

That only works if everything reached from rkcanfd_chip_start() is
safe in atomic context. Can you confirm that? Or is there a reason
the restart path has to be able to sleep while the handler is held
off?

I would rather not see a software flag checked in the handler for
this. Without a lock it does not actually exclude a handler that
has already passed the check.

[Severity: High]
This issue was not introduced by this patch. It sits in the restart path
the patch modifies, though. Can rkcanfd_chip_start() here re-initialize
priv->timestamp while its timer is still queued?

On bus-off, the IRQ path stops the timestamp work without waiting for it:

rkcanfd_irq()
  rkcanfd_handle_state_error_int()
    rkcanfd_chip_stop(priv, CAN_STATE_BUS_OFF)
      rkcanfd_timestamp_stop()
        cancel_delayed_work(&priv->timestamp);

The work callback always re-arms itself:

drivers/net/can/rockchip/rockchip_canfd-timestamp.c:rkcanfd_timestamp_work() {
    ...
	timecounter_read(&priv->tc);

	schedule_delayed_work(&priv->timestamp, priv->work_delay_jiffies);
}

Bus-off may be handled while rkcanfd_timestamp_work() is running, either on
another CPU or because the IRQ preempted it on the same CPU. In that case
cancel_delayed_work() finds nothing pending, and the callback then re-queues
itself. From then on the work keeps re-arming.

When the restart runs (restart_work or can_restart_now()), it goes through:

rkcanfd_set_mode()
  rkcanfd_chip_start()
    rkcanfd_timestamp_init()
      INIT_DELAYED_WORK(&priv->timestamp, rkcanfd_timestamp_work);
    rkcanfd_timestamp_start()
      timecounter_init(&priv->tc, ...);
      schedule_delayed_work(&priv->timestamp, ...);

INIT_DELAYED_WORK() clears the PENDING bit and the timer's linkage while the
timer_list is still in a timer-wheel bucket. The following
schedule_delayed_work() then sees the work as idle and enqueues the same
timer_list a second time. Can that corrupt the timer wheel hlist?
timecounter_init() also writes priv->tc while the old work may still be
using it.

The new disable_irq()/enable_irq() pair keeps the IRQ handler out. It does
not stop the timestamp work. One option is to cancel priv->timestamp
synchronously in this sleepable restart path before re-initializing it.
Another is to call INIT_DELAYED_WORK() once at probe or open time rather
than on every rkcanfd_chip_start().

>  		rkcanfd_chip_interrupts_enable(priv);
> +		enable_irq(ndev->irq);
>  		netif_wake_queue(ndev);
>  		break;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/tencent_196A2433801631CD2FA42998465E26316105%40qq.com

