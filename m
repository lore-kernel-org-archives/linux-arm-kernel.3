Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FDCCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 02:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrsBLriRgC1EgL80ODJnHwyIwn1KvUDijJjv6Fz1IwE=; b=Lt/i1fdYgtuhHQGkZ3uoGBIgoD
	lKlOdWLkWYa6gjknV4lxrBqLKyWl+fWiB6LQo/Zio5G1JfM8HaBvadv7rfKyGx38MHsLnsa/obITA
	/dz237w/shpSx0W8HMcX9vU4pP+dysLD+3bl+WDdP25h+S/9BiX272W7g0iK0VBdLQMB1C7lYUbpA
	Dj6vEBsP0rosavXoyS/Gnm82Ax1spmdcIdxK/9gY9D3Oydby4yzhGrMtYFPTTH7SZ4iVIqi0Nn64O
	fE/X/9TDarlyLPOtEWJg2M04kyhUI8crSuTXauugZonfB+ol9tQ0ioNks6tRvpHBobAC0z//806wD
	Z0a88wXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGp8g-0000000EOgt-35ro;
	Wed, 14 Oct 2026 02:54:46 +0000
Received: from out203-205-221-149.mail.qq.com ([203.205.221.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGp8c-0000000EOeR-37N7;
	Wed, 14 Oct 2026 02:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791946480; bh=rrsBLriRgC1EgL80ODJnHwyIwn1KvUDijJjv6Fz1IwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=p4GGPcp9hmNOT7VRCgExfsOA9ZMqsJrZpGMZH8xcy/qFH3949NvkJkyFfWng2XQCT
	 PIZaIfbUsj/zd+ALJjqi97fb55++CtfpXX3WIlG48VriQ6CDEal1kBI9x5u18TzzSG
	 FQLKs0saKNdx+oYUHtXzy5WJZZ02VKZj4084u1X0=
Received: from ubuntu2204.localdomain ([2409:8d20:7f:35d:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id D9F194D5; Wed, 14 Oct 2026 10:54:31 +0800
X-QQ-mid: xmsmtpt1791946477t7xfc84ol
Message-ID: <tencent_B15E13184DA04C4382F48848C006A2B51F06@qq.com>
X-QQ-XMAILINFO: N5UQ4LLbVXWPL282Toa2IMxmL68QeoSL/cfBpJlIlNWoy17a2y+V4vEH9aBaxP
	 HPVtgjaOhAA+m/x39+UfLBuFCL5F+koTsVOsMiAhGRfLOKOrXoD2bjXUauIykD717W7gyOcn0ToP
	 svMPzBTaMOxzGte5r9wpjz5VTNc8bR3rP8BR3zG6pBpzmokke0eQSTdQuBY4PPuW41tzu3eex/7K
	 +q5ElWy3zVjJLlI0+r7NFIsNa40Z5IC+ujcDT0dWqa4X8J/tAhGQ8SH24fBQhQPwP1oHpNal9h84
	 piau0KUO88uUsA3ac6B+r3iGBEwCwzNVn6JhH0+UYVXajptNex5I70hPPE0A3h6iQdWkaJrFyBc+
	 uvgWg3JUa+fEk/zq2z7n8bKGy7lqdA2iRfbEjy7X5nEyde9vl1+t0vNzFNHOIz9W4ItPNUNjx5KL
	 u8PxmV6Z9cslTzq4PRmfIm2oCvTDMBznjMQZI+Pvnzpczi9AZjnhMqJ+ERVfeTSdLAeFJrBXgsjz
	 K0MpzFxpeCmg5X8zSUYgGTM9k3y73E/7Yo12z8PmWGpYRfjelQ6/5k5CraF+GOdjjQir7v9l/j9z
	 ZHvzP7bTfow1/FLLavrdp18Uu0PI+5TqaBXzdhJE97nFVv4jWDkpm1azygi8TlEIDUq7BRn9W3uh
	 wYMp1Y3k0PfQ9D1jeWsg/sFV0FBLyXiKxAl3TgldFWeLzUjIej/N53KeBLJ8nyO69PKgRCQG5w8a
	 ev4/nrFyHdi8HD9QvbrVlc36QCgC9p32QzIDtmaBVt5K3MSjacuZAmgtjvZ7h/nLQL6P5Tfy2BzM
	 i1w0ZPEUh1DeeZ52pT8czg0wu1ERu/33zJLLmobo8xnv8Gj2PPJww1pVsnknuhjZIgLHzOaOVKyE
	 7yTrhxqWFWbYtDk+qWHK6BcMYxxDVDtRfZdhyVjG1W/nNUR36xSR7haR8jOMalPFBq9zFrW81AzR
	 yGeU/EuQD9oq/ZIa96vfCYJa+rYL67ZTWwlL0J+5afmqtlfGSSMb3RnUzUrKF8ufShkp39yaHIOi
	 KlnDaxhWnNPcsOYlGTwT5AoRvnrAdsNBud1JPxw+ijbJdFl4l09SQCHkvj1T6ILw7BtD5bFctPXX
	 UPdxfkVLPRAgwZy+ggrnPMD38Ylki1g/9e16nPgnhcBYHq46qfoM0I6OEL1nF3ERmqbEH39Qs263
	 xcFHJVwzAUY9IfSmIOuc/6LG7bpS/+FSlfQAk=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Cunhao Lu <1579567540@qq.com>
Date: Wed, 14 Oct 2026 10:54:24 +0800
Subject: [PATCH net v2 3/3] can: rockchip_canfd: cancel bus-off restart
 before closing the device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20261014-rockchip-canfd-restart-close-v2-3-c8fbdfad1803@qq.com>
References: <20261014-rockchip-canfd-restart-close-v2-0-c8fbdfad1803@qq.com>
In-Reply-To: <20261014-rockchip-canfd-restart-close-v2-0-c8fbdfad1803@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Wolfgang Grandegger <wg@grandegger.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, kernel@pengutronix.de
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_195444_522611_D3C82CD7 
X-CRM114-Status: GOOD (  11.78  )
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

The close path cancels restart_work through close_candev() only after
freeing the IRQ, disabling RX offload and stopping the controller. A
running restart can re-enable the controller and its interrupts after
IRQ teardown, or restart timestamp work after it has been stopped and
before runtime suspend removes the controller clocks.

Call close_candev_cancel_restart_sync() at the start of ndo_stop(), while
the resources needed by a running restart are still available. The core
netif_running() check prevents a late restart from entering the driver,
while this cancellation waits for one that has already passed the check.
Keep close_candev() after IRQ teardown for the final cancellation and
echo cleanup, including work queued by an IRQ racing with the first
cancellation.

Exclude the IRQ handler while reinitializing hardware in the restart
callback: the handler continues processing after scheduling recovery,
and a shared interrupt can also invoke it while this controller's
interrupts are masked. Keep the shared IRQ enabled while the close path
waits for restart work to finish.

Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD controller")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/can/rockchip/rockchip_canfd-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index 37c1c22c40c9..fb8f6b067502 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -356,8 +356,10 @@ static int rkcanfd_set_mode(struct net_device *ndev,
 
 	switch (mode) {
 	case CAN_MODE_START:
+		disable_irq(ndev->irq);
 		rkcanfd_chip_start(priv);
 		rkcanfd_chip_interrupts_enable(priv);
+		enable_irq(ndev->irq);
 		netif_wake_queue(ndev);
 		break;
 
@@ -758,6 +760,7 @@ static int rkcanfd_stop(struct net_device *ndev)
 {
 	struct rkcanfd_priv *priv = netdev_priv(ndev);
 
+	close_candev_cancel_restart_sync(ndev);
 	netif_stop_queue(ndev);
 
 	rkcanfd_chip_interrupts_disable(priv);

-- 
2.34.1


