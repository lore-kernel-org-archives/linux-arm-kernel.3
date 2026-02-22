Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E31C636C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 22:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxYpxXyzJEe+f3oGErlsZuy9sNLZi1GyKm1CzsPdpME=; b=o3zZXIZwBSeL44wNnOKJExE6js
	Z95Ul1h2pvFdW5xocB248pIKjI/GMfkHw6/zQZ122Jw8eqkjDFnq2zbqvS5E9MPLK/g1Su4HVcRer
	/VOcWFi685rl3Rb/ly20hdkXXIGg5QX/9fTbMSZnBJIh97haRDOzwAlhW2hg+TtAY9iN23kFQV83N
	ilWoSnwQL3eS0AuzPezpdm2/riV80hRN2pddnI/n4VrZ/GlLO+Hb56KYX/e2HDjcfMFV8gLuVU4VT
	vaGg+iivCtLT4Xs1d1FCx7ecZJeDzx8/6iPpfwDJiP4vL2ICsnLY+MuW3J88Yu3tvElayib7LtVqG
	4iaUBjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI6s-0000000Gzws-0Rm9;
	Sun, 22 Feb 2026 22:39:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI6n-0000000Gztl-2Alw;
	Sun, 22 Feb 2026 22:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=KxYpxXyzJEe+f3oGErlsZuy9sNLZi1GyKm1CzsPdpME=; b=Y3GYoehRWgcxBMDU4i9ObAKG67
	O5vcnRJAw4YMJDl+B/ctef8FPG/GUmoIMTkOTjmy81H6NvRkq09pL3kc3WZBX9dW/XpdQ4rILUSkn
	xbpJXVC9o5654VFo35EhBaji7utR9228dTaEzmQk/vqERnbGU3cYCE2MoE6JRTawfnZCFhnnQotAH
	/AD3ktVjFHtGemnKrmY7LsoQaDrj4OmcmjA7JHgWHxebC8HCKveG4VRZO8iX8qJSL7cfhplzWISn7
	wFM659WMJSmcvZEdANjXx1D/tS7XU9kApY4zk/ToaeBJDJVUOsoiE8S+/luHMMbX/oLKTXQMOLYxf
	xwkPHAqA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Revision overlays for QNAP TSx33 devices
Date: Sun, 22 Feb 2026 23:39:03 +0100
Message-ID: <177179992301.1861430.8466238325458221648.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260201191804.41421-1-heiko@sntech.de>
References: <20260201191804.41421-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_143925_552660_89EF8F74 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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


On Sun, 01 Feb 2026 20:18:00 +0100, Heiko Stuebner wrote:
> The QNAP NAS devices actually got device revisions at some point,
> so there are different board variants in the wild.
> 
> Above certain PCB revisions, the devices gained additional GPIOs
> for controlling individual power to the sata ports and also could
> detect the presence via GPIOs.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: rockchip: Add port subnodes to RK356x SATA controllers
      commit: 5918bf2a17f4689abfb94d341c5240088f8bd16e
[2/4] arm64: dts: rockchip: add overlay for qnap-ts433 device revision
      commit: 406c5515eb62fe6837fc1257855024b1ac6c52e1
[3/4] arm64: dts: rockchip: add overlay for qnap-ts233 device revision
      commit: a12bd8d24f2f942a6684431af9f885b4a4ae84fe
[4/4] arm64: dts: rockchip: add overlay for qnap-ts133 device revision
      commit: 5fdd6701fad197d0dfe21de3beed8ac45343aa73

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

