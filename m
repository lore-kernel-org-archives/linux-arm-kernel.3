Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47084C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNfNy6CmTrcklVHnHQd89U0p84ZEYhAgqOFVHom5Ua0=; b=UPQSGK9yoYj8Pb2bdccTN5OK2q
	z3HYD7FAeAc1R8rphTQsmsW3VbjAN9FVYaAZDNpjEIwk49nvSVnKU58YfG/3FG6w7HH8Jp1jorbiV
	7x8fGoUVlZSUvUup6JCT2tz0cPcCooI4Af1gcUlflgmLb30plfkzEiHiRN2+h9cpfL+O64O3YWsI6
	6rjlhLqfoqO9sEiqegNq4+XoBEQlb+UkzZpIvuK06TIGdVYst9Yv4+M5Da9YuEn2f0sbOAiDQ3vz9
	gmHRvChCHbUEXdK6KCxJ8y2E2l1ciKRgiE2BMLDyUHntUFYi5QGgqdn+WGJ5UWa6+2mK1Z5uY3HRG
	auLDKI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sWp-0000000ArJi-2LGf;
	Tue, 29 Apr 2025 21:30:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sSy-0000000Aqt3-3IS7;
	Tue, 29 Apr 2025 21:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DNfNy6CmTrcklVHnHQd89U0p84ZEYhAgqOFVHom5Ua0=; b=g7xyMol7tyy9bVwY9WAg4TNOsj
	VsjnbhF8Y/z4zxhCKCdozKYSDbF3D3EResQFXBsRdrSEBJy0LjAniPc/YuC4V9W9O+b4c3o93KTZe
	PLjl753OO7cGalD23cvVT7RvlDtO1O1LKH2f1abwfzmmJrOb3+px5VJoRVgAXSDii4/wDp2bHKjjb
	anQ1nJvyG5wAviuyDnb+f+wI4ESJ47GsYQK3mcKu2ytlz9kj2pTwIGZ/hQHz/+ZC/U34Vptg25FM4
	Ts7UNJqaqOALW/NzSLyaBVfkse8E58woxYCmaUHkLFPn36tbtmhUcNGbeCng0C/PcEVms8ABHYUSq
	AdoFvTgw==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u9sSs-0008Pg-Qh; Tue, 29 Apr 2025 23:26:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix Sige5 RTC interrupt pin
Date: Tue, 29 Apr 2025 23:25:49 +0200
Message-ID: <174596194659.227689.14787521084378492437.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429-sige5-rtc-oopsie-v1-1-8686767d0f1f@collabora.com>
References: <20250429-sige5-rtc-oopsie-v1-1-8686767d0f1f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_142612_839269_0F66FD90 
X-CRM114-Status: GOOD (  13.45  )
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


On Tue, 29 Apr 2025 18:51:55 +0200, Nicolas Frattaroli wrote:
> Someone made a typo when they added the RTC to the Sige5 DTS, which
> resulted in it using interrupts from GPIO0 B0 instead of GPIO0 A0. The
> pinctrl entry for it wasn't typoed though, curiously enough.
> 
> The Sige5 v1.1 schematic was used to verify that GPIO0 A0 is the correct
> pin for the RTC wakeup interrupt, so let's change it to that.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix Sige5 RTC interrupt pin
      commit: 4bf593be2e462623c4c34c7e3b604eb3f8f9de45

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

