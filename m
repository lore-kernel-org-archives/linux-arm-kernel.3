Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62641C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 19:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9frWBqg+9ABHbKCRSF6hDwgCj340VYF0PN8eIRHYKXo=; b=rp0Q/JVaex0Bkdk6zZMVsUTL6m
	CUT6FLtePKGNg1Jfo1eM/Dcy6yjJUTjoPrOVFmFhNISJQ6YlnQVSQFeYpIl/JYWzUMYQEp2ffYWOF
	fk0g+//Vr7DT+nQcFLfgRR/mKSm/FLzo6yJD/0ow7/tclT+pQE+Xt3r0FyhzeY7x7KXxv3o7Oi3w4
	zNxuaN0AVTQxd4C+ajjIo1gXMIQtbnmcWA1s1lNiOMEjd1GrRqFXv1VMIPSYg2xMK53YEixuSr0mt
	p17c0wu4GP67oJCjcJRnwbWPE/dgUX7MWGj2jrQ1qIqiSjsI6JFTr2Idfi2mMeUZCTcmSrVKZSnm0
	jK7hX8wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIQ4-00000003KBv-1ggF;
	Tue, 22 Jul 2025 19:12:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueINY-00000003JsL-49Ln;
	Tue, 22 Jul 2025 19:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=9frWBqg+9ABHbKCRSF6hDwgCj340VYF0PN8eIRHYKXo=; b=a8Qktq1z7Iyx92raGpzD4E0N1G
	LQF4L8yD+Q5WzmxTbpmX6ltLOeo2Qia45RVqu70ZGrdtSBBBwOhs2tzVE35do/p3QXgcq8R7VMiwW
	/03RfQDkxo5tLQQri/W54X8dnDx8JvOELSkXGZqp+da4/lHYBQ8Pr2tOf40jc71f71WEk9ywgkXB3
	7G6nQzlSPAC8pGubLCxxEV3rLDTmnJniDMPtjaS/kDd0MI2DLXixqmH6iwUo3TrDzL132G7O82jHG
	xinQELQB0nvB5LDv5YOUvHTiua0+pOD6L6mHFn1Z0KeMF9hYRYbhZUAVTDRZgQI6vr0c7avo43FOU
	F67p7Q5A==;
Received: from i53875ad2.versanet.de ([83.135.90.210] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ueINX-0006hu-IO; Tue, 22 Jul 2025 21:10:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.16 #2
Date: Tue, 22 Jul 2025 21:10:18 +0200
Message-ID: <1927555.tdWV9SEqCh@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_121021_031912_EA4E03FB 
X-CRM114-Status: GOOD (  10.94  )
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

a somewhat interesting issue came up, in that the added netdev
led-triggers seem to cause lockups on the board that is using them.

So while this gets investigated further, the default trigger setting
should be gone.

Sorry for being this late, but please still pull

Thanks
Heiko


The following changes since commit 9037532ab893635a46afe88542cd747a4a846497:

  arm64: dts: rockchip: Add missing fan-supply to rk3566-quartz64-a (2025-06-30 11:08:36 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-dtsfixes2

for you to fetch changes up to 60d89a256079895a154d0f714caee8c64de586f7:

  arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R5S (2025-07-22 21:01:21 +0200)

----------------------------------------------------------------
Drop netdev led triggers from Nano Pi R5S.
Came in today and it seems the netdev led trigger causes locking
issues and has the ability to deadlock the board.
So while this gets further investigated, dropping the default
trigger for the affected LEDs

----------------------------------------------------------------
Diederik de Haas (1):
      arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R5S

 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 3 ---
 1 file changed, 3 deletions(-)




