Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98266C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZU6BM+w6eML1aaICueqOwGlIiWXfWBW5ZubqN3svxA0=; b=yywcaDelxgqT/UMoN4pCzSyZ23
	cw1g6aHZu6pQ0yJLYH1fGBL3mhNg0+KqRvoebbaVz0VyARS6XuMAmELAGZcUNAHTodmt5I6Vr+zBB
	tDkCwrvnlMXzB51biuTtSUm+xwv0yGdf2ZAGAL8QEDzCvbfQ563o7enAPWWJGdDEtbyQXjNoGYTw4
	vULkffZTX2Zk6OoaRsqiU+aATQC3+86GIL8+7boqKQ37/3mjwOVApthq2PtUICXesIzZUnXDVv7h5
	0GknjkuCs8aRmgPBKJxhZ4ExJi0G6PxkS3bk/HH1ZHgpMuJSOoVMZkZfRJoe98LTipKNNbD+ziUaT
	lQdJeMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkRF-0000000EEPc-0jOy;
	Fri, 16 Jan 2026 14:04:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkRD-0000000EEP8-0i8w;
	Fri, 16 Jan 2026 14:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ZU6BM+w6eML1aaICueqOwGlIiWXfWBW5ZubqN3svxA0=; b=XIRPFCJl9mULxF8qJnYOv6N00X
	dpNc1GdyE0HIQPf/uaVTMuGfz8VDm2gcvAW/YusJvxgvhFRiqnihcKUiDaylBn3ZrObHZDFsXZR4k
	RYje3iyKb0OXnJVtnRP1gz/NjcsDmH/L/zoxEJUBqNuONCaZkrYIwJGTeL92edBjlDkewKbETGBIX
	MeRW1eA/b6La1K3xWbJEautWt/49ilfe6LUXIohVg/hUTFMQPUTPL/VPiWVHZWBzyStSFtoOEJNs4
	dAdwNh837+xr2pOzed/8wWXj59xBDppDPrySDc4PCK7caGHw5LKXaODChkElI/5YpplIX113d56jk
	mypDaMVQ==;
Received: from i53875a97.versanet.de ([83.135.90.151] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vgkR9-002dRO-Mr; Fri, 16 Jan 2026 15:04:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] General RK3368 HDMI support and 2 outputs for RK3368-Lion
Date: Fri, 16 Jan 2026 15:04:24 +0100
Message-ID: <176857210195.116631.16665150473922790004.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260114230707.4175162-1-heiko@sntech.de>
References: <20260114230707.4175162-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_060431_232721_2CD2BBA8 
X-CRM114-Status: GOOD (  13.86  )
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


On Thu, 15 Jan 2026 00:07:02 +0100, Heiko Stuebner wrote:
> This series adds the necessary bits for HDMI output on RK3368 and enables
> this on RK3368-Lion. At the same time, use the recently added DSI support
> to enable the generic Video-Demo-adapter as an overlay on Lion as well.
> 
> 
> The reason I'm shaving this Yak is that the recently added DSI support
> created DTC warnings about a single endpoint with an address.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: rockchip: Use phandle for i2c_lvds_blc on rk3368-lion haikou
      commit: 4f3df9abf44bd92ecd5d8c3018ddefa7f5bf74d0
[2/5] arm64: dts: rockchip: Add HDMI node to RK3368
      commit: 6d60168c6d2f76917b3f71d2a6807c6d8dd24363
[3/5] arm64: dts: rockchip: Enable HDMI output on RK3368-Lion-Haikou
      commit: 385430244e85e245f071ab158f7e4c7b2b5d99cb
[4/5] arm64: dts: rockchip: Enable pwm1 on rk3368-lion-haikou
      commit: f03f3e0a77a72f6f6284aff0da6d21d6508e57ac
[5/5] arm64: dts: rockchip: Add the Video-Demo overlay for Lion Haikou
      commit: 7f43ac104af7d3d4158ec306d4ca1c897ecce78c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

