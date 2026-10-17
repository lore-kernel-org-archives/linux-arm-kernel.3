Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25DECCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 01:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLKAVyMVSmQOjN6SHuX6n9xWSw2+Rtn3bZHkHCgeQho=; b=FHSw1iFJZV2GIlpoq8J3N5I+Vh
	sY9AwVfia07oqmliG5CCSmxFI/Newiy+hqHeTt/c39jxA6JaGFDHqUVpaT5GW9VFPMlnZc/y4eDhD
	vXMYIFZO14/1zCLZjzDRFPGDLiH8Ay7BeGeXYqmtnweC4b3+QO2XghDsA32mNC6e4fRtd7sdAHS4w
	1BRfOGCBDEqAeVFkQMQMVlM4GhCZ7vZd/8PrbyFE/UVbiEfK556NIgM09hbjh+dkT3pcaSVGYxact
	H9Zp+BtdgHn6u7yL03I+WiNiS1U7W2Wier3MIbFguLg2DajosAo4TQsPU7C8JUXQA3aSngF38El/4
	H8fZBj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHsn5-00000004Hip-08ML;
	Sat, 17 Oct 2026 01:00:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHsmy-00000004HhJ-3LFj;
	Sat, 17 Oct 2026 01:00:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 31B6E43CAB;
	Sat, 17 Oct 2026 01:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651501F000C5;
	Sat, 17 Oct 2026 01:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792198844;
	bh=WLKAVyMVSmQOjN6SHuX6n9xWSw2+Rtn3bZHkHCgeQho=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E12KcGjtaayPBL4g8g1vaqI+AYz5jzQd2vvaGZfmQO9jAH7CMQmjOnIolCfAkHqKP
	 gAcLN6YgxgpzwDmt6ICy7g1Ip1Q3Bzfx7n81wgeurXwnrsiQgBW3W4y+qv2S5BNmTp
	 O21bWfMBEzENvmA3HvTomx3tlNWexxx7vCFy+dB58txADDbUj8o6XBXxif9lSa0eGQ
	 g/hG2iBs4IQvp3HfSbB+nUUjk5+tyYi4ff1lMSVkDzA+mxahYZPz892midFdmEAJpo
	 72GNwCnfuvuUN4yPnmdR9iX3dW4RA++3kxDea/DLzZ4SWNjfXNKoLGSMiOrESkyJMq
	 eIwQCdpvd9sVQ==
Subject: Re: [PATCH net v5 2/6] can: dev: add close_candev_cancel_restart_sync()
From: netdev-bot+sashiko@kernel.org
To: 1579567540@qq.com
Cc: mkl@pengutronix.de, mailhol@kernel.org, heiko@sntech.de,
 davem@davemloft.net, wg@grandegger.com, socketcan@hartkopp.net,
 kernel@pengutronix.de, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org, kuba@kernel.org
Date: Sat, 17 Oct 2026 01:00:43 +0000
Message-ID: <179219884300.1406898.17794218418731765550@kernel.org>
In-Reply-To: <20261015-rockchip-canfd-restart-close-v5-2-ae77327037c9@qq.com>
References: <20261015-rockchip-canfd-restart-close-v5-2-ae77327037c9@qq.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Concern: close_candev_cancel_restart_sync() is added to
  include/linux/can/dev.h, but the only call site is a no-op refactor in…
- [Low] Concern: the commit has 'Cc: stable@vger.kernel.org' but no
  Fixes: tag and no '# prerequisite for ...' note, while being a no-op…

--

can: dev: add close_candev_cancel_restart_sync()

This adds an inline helper, close_candev_cancel_restart_sync(), to
include/linux/can/dev.h. It only cancels the bus-off restart work, so
drivers can cancel it before tearing down IRQ and hardware resources.
close_candev() now uses the helper and keeps its existing order: cancel
the restart work, then flush the echo skbs.

> Use the helper in close_candev(), preserving its existing cancellation
> and echo cleanup order.
>
> Cc: stable@vger.kernel.org

[Severity: Low]
This isn't a bug, but could the commit message say why this is going to
stable?

On its own, the patch is a no-op refactor of close_candev() plus a new
helper. It has no Fixes: tag and no "# prerequisite for ..." annotation.

The only new user seems to be the next patch in the series, "can:
rockchip_canfd: cancel bus-off restart before closing the device". That
patch has its own Fixes: ff60bfbaf67f and Cc: stable.

Would it help backporters to mark this patch as a prerequisite for that
fix? If the rockchip fix were picked without it, the build would fail
rather than the code misbehaving, so this only affects commit metadata.

> diff --git a/include/linux/can/dev.h b/include/linux/can/dev.h
> index 6d0710d6f571d..a277d12332f15 100644
> --- a/include/linux/can/dev.h
> +++ b/include/linux/can/dev.h

[ ... ]

> @@ -115,6 +116,17 @@ struct can_priv *safe_candev_priv(struct net_device *dev);
>  
>  int open_candev(struct net_device *dev);
>  void close_candev(struct net_device *dev);
> +
> +/* Cancel bus-off restart before tearing down resources used by the restart
> + * callback. The driver must still call close_candev() for the final cleanup.
> + */
> +static inline void close_candev_cancel_restart_sync(struct net_device *dev)
> +{
> +	struct can_priv *priv = netdev_priv(dev);
> +
> +	cancel_delayed_work_sync(&priv->restart_work);
> +}

[Severity: Low]
In this patch, the only caller of close_candev_cancel_restart_sync() is
close_candev() in drivers/net/can/dev/dev.c, and that conversion keeps
the old behaviour. As a result, no driver's ndo_stop gets the early
cancellation that the commit message describes.

Is the helper meant to be used only by later patches?

This looks resolved later in the series. In "can: rockchip_canfd: cancel
bus-off restart before closing the device", rkcanfd_stop() calls the
helper first:

	close_candev_cancel_restart_sync(ndev);
	rkcanfd_tx_disable(priv);

	rkcanfd_chip_interrupts_disable(priv);
	free_irq(ndev->irq, priv);

It then calls close_candev() after the IRQ teardown.

Could the commit message mention that user, so the helper doesn't look
unused when this patch is reviewed alone?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261015-rockchip-canfd-restart-close-v5-0-ae77327037c9%40qq.com

