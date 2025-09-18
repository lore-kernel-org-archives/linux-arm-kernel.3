Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E911CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 22:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EJL03UeAI2MkW8nRH1TGaiM07JjptxXrtsAZoUIIZvg=; b=DmC4OEaaHRe9RLdR+ujRc+2oHv
	HNypwEorskZtuhaLCGyE+HfTF6rILls6ducCEd0tW+y+is5ozxt3XgzQSC5CrbEwsK9+X9eJFTZd3
	StbYUXOvCY2K2F48qHMc+KKciQRgpKR9iu1eNWdRYt4+Rx4S6TI565oX8p6y/DwY6twTiewpuBwUO
	le0VWowhUtw92JD7tUeojPWT4aZ3xgug2j+pK7qw2Pip99c4bHCtRKLkqlLHHGiP/EyaPYBX/t/lr
	9l2SO392s77nQt9rh4D41OLej42hfnnk+XPU+k6qFeak9zqhVmJebNuiOaWer0wiYilaKtY5s0G10
	lLPkKGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNHf-00000001LdU-1Ptz;
	Thu, 18 Sep 2025 22:39:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNHd-00000001LcD-218I;
	Thu, 18 Sep 2025 22:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=EJL03UeAI2MkW8nRH1TGaiM07JjptxXrtsAZoUIIZvg=; b=nmBvBb8M5yGSFVx9suUCrgqTAE
	x6taqWnY2oAJF22Ve1ImuWy2ZpBKTS32rP5tcRu3mfRllEUFwt1mfE1bTXHHFqjrZXDdBZ1ivwt+o
	Jxe/t4akB6OY8ywKPh69Nf+ovMZyswDA6YiksTRDDscmw+xGON/KyYF4XhVPeX00/HYK5tOclWttB
	l231R2mvJMPoZuxvkYib5w4dS1zgeJEuRPPp1Yc+13FZvXQ71VqNcBzodxKGzE1/kO0ohK6L32EaG
	Cvf6TDHGTK4tec8wdQnDbKFJkdePbhzH20IQKpRBwsugW86J251dzrXfl8pdSRExOms9kM/CUYXom
	yjRtb5Pg==;
Received: from i53875b0a.versanet.de ([83.135.91.10] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uzNHb-0003zY-6Y; Fri, 19 Sep 2025 00:39:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.17 #2
Date: Fri, 19 Sep 2025 00:39:18 +0200
Message-ID: <21709561.0c2gjJ1VT2@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_153921_548946_BA22C871 
X-CRM114-Status: GOOD (  10.38  )
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

Hi Arnd, Kevin, Olof,

please find a below some more Rockchip fixes for the current 6.17 release-cycle.

Please pull

Thanks
Heiko


The following changes since commit dcc6785caffad27f2ea601fdd2f9782036e1faed:

  arm64: dts: rockchip: fix second M.2 slot on ROCK 5T (2025-09-02 08:31:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.17-rockchip-dtsfixes2

for you to fetch changes up to 0f860eef417df93eb0ae70bbfa8d26cb7e29244d:

  arm64: dts: rockchip: Fix the headphone detection on the orangepi 5 (2025-09-07 19:20:40 +0200)

----------------------------------------------------------------
Another missing supply and a wrong headphone gpio level.

----------------------------------------------------------------
Jimmy Hon (1):
      arm64: dts: rockchip: Fix the headphone detection on the orangepi 5

Marcin Juszkiewicz (1):
      arm64: dts: rockchip: Add vcc supply for SPI Flash on NanoPC-T6

 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)




