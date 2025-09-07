Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBC1CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 17:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pi+FScEH8RwdrVr7Oxt2JXPrqf9PvwEaZcz5KpMAXv4=; b=FrtDzzYSr/0Uh+Pupdi4pnITwB
	7l6HzRqYFyfMK6pd/KAAMxKXBE9YXjMrYW5o0IUJMkNyAzqjeT7nzsKBJhNoYPYt2frPlCoheFvQw
	syvSK0vpS+vaIqnqYpNDp0XgsxWvYhjiSSMTtco2tifypNCVyjOEZBAkZMzGjP9TN5JTRt2Jc1fzi
	+sPsgo/DG8u1/I10/2zsoEPVihc3ow2fdcrr0IKdLX3nO2ZWQ3qa3/n1SblYlyxm8IvFEFCGjILrg
	W1r0HB+4ahHN9svm9N1Eq70M5YIq9m8wyYtBkeo3hkTX2Gk0bIO91YEDz2OLadQHZN6hr+aCB8H+k
	pf9XWLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJKi-0000000C7sd-1m4x;
	Sun, 07 Sep 2025 17:37:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJDh-0000000C67p-1POZ;
	Sun, 07 Sep 2025 17:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pi+FScEH8RwdrVr7Oxt2JXPrqf9PvwEaZcz5KpMAXv4=; b=Ncuse2Aq6Ws3pS01vd6bMpmNKO
	9X1gXYkWHoA2zfZ9sWbIkMm71fQL5byYIFX1Udb2oWF8MEpueSwWeHsZgLylnrdha2XShRR0WdXDA
	EaaHU2aWrUxAoI+0+4Iny8175g8uJlYIeArkRuFHYuda/Ds4nkpKegPP6TBQeVfTa4s/g8Qx1J1fn
	dSQIrMcn0UyMH1shBUBL+4UYhNNFouBrkm0VrXSyt0uzXgz9LWwfCQ/mDWGM5D9W8c3u5f1nFmTRG
	DwuzWvPPfU0z/Wwc8OmDiiHSov4a2A5/6+ixzuViOS2sABiZXeu2wLCDlG4szuEQDkCnWyhdIg5Wz
	oomgQSsA==;
Received: from [61.8.147.163] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uvJDc-0004Ii-Hm; Sun, 07 Sep 2025 19:30:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] Enable HDMI Receiver on NanoPC-T6
Date: Sun,  7 Sep 2025 19:30:11 +0200
Message-ID: <175726620391.195224.16245258032470336933.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1757068166.git.marcin@juszkiewicz.com.pl>
References: <cover.1757068166.git.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_103029_371024_AAD32D0D 
X-CRM114-Status: GOOD (  11.44  )
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


On Fri, 05 Sep 2025 13:02:29 +0200, Marcin Juszkiewicz wrote:
> For quite a while I had this patch in my local tree but never made it
> work. Kernel generates the following messages all the time:
> 
> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock, tmds_clk_ratio:0
> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x2, scdc_st:0x0, dma_st10:0x10
> 
> "v4l2-ctrl --all" reports that HDMI In is detected, /dev/video[0-4]
> exist.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: enable HDMI Receiver on NanoPC T6
      commit: fdab01864390db7ef0bea28804c7a3147dc0a386

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

