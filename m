Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DF8CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 07:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLxvtDPBJ+DI+btoXw57zzh/p/fTjyv4BupQFMuDEV4=; b=cBTf7Itg7J799jd8xNgFrHOED7
	oKrQJVDlsxqyN9FnbSYS+2IP+46AfyTlcYs8paVp7o6F4oLc7X5kW3ImP0i9yZeZLIGoXzmQfSssL
	XrClwgWLZeCExF/u9f+KXFJD7mva39Vv0gy1w/WLXBteODaXDAJDAjhnuTZ0lMbENSa3GeFndxoHW
	YsyloX6A6iagVPlT/W623yfb+WBKmJ4LE0tX7JYnMxB373EfqOyVkjJV9Xl0RjxVGfvxZb2a+Q6OH
	DS3g8CFOUyvlX6cXvwlbZHa4wFYZ+uw8kSrqx7r8tJHTqZfJLAWfXAAZg26AhJA1Pi6uGkxT5uftQ
	mhrFo9lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq504-00000005p2E-10uJ;
	Sun, 24 Aug 2025 07:18:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4pf-00000005oI8-1Qdv;
	Sun, 24 Aug 2025 07:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mLxvtDPBJ+DI+btoXw57zzh/p/fTjyv4BupQFMuDEV4=; b=e3Ni8Yv3hNX8eh4IH1lsbkCSMZ
	bHTqkY19CememDhYRbGc5/XuF2F7v0q8fsMIG2m9nprnKc1CvvvsM91iTeNAUYWgQSDB0v8gHKHQJ
	TwWyUkOmPVHm1/TNwPMpUadUojJGscKVxmmenhS+N95fYE9C/CnqJSxGwraUPJiDk3Q93s7r3kRWV
	/vRWeOUf1edWZdIhxr0goumI4mhf3S35ZHn35dK58fVgqq+hpVMr0VFPljWD8LgXanpr/mdPJfwrd
	T+rUt63iBSnFMUoav1No9cryAMYIOj3eEKv22cy+edwB1n+n8vQKqy7/a6J/pECgFZnVASxGkYtPQ
	/EZGkLXQ==;
Received: from [212.111.254.164] (helo=phil.aerolan.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq4pb-0002Oo-7b; Sun, 24 Aug 2025 09:07:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ondrej Jirman <megi@xff.cz>,
	Maud Spierings <maud_spierings@hotmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Improvements for rk3588-orangepi-5 and friends
Date: Sun, 24 Aug 2025 09:07:52 +0200
Message-ID: <175601920177.3425909.16087071890772074538.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250823-orangepi5-v1-0-ae77dd0e06d7@hotmail.com>
References: <20250823-orangepi5-v1-0-ae77dd0e06d7@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_000803_378013_2AFAD8AF 
X-CRM114-Status: UNSURE (   9.71  )
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


On Sat, 23 Aug 2025 14:43:49 +0200, Maud Spierings wrote:
> Fix the headphone detection logic on the orangepi 5 plus.
> Enable the HDMI receiver on the orangepi 5 plus.
> Enable the NPU on all orangepi 5 boards.
> 
> 

Applied, thanks!

[1/3] arm64: dts: rockchip: Fix the headphone detection on the orangepi 5 plus
      commit: 8976583832579fe7e450034d6143d74d9f8c8608
[2/3] arm64: dts: rockchip: Enable HDMI receiver on orangepi 5 plus
      commit: ccc7f16ea2e33366f7b7005daad81e316f8cb6e4
[3/3] arm64: dts: rockchip: Enable the NPU on the orangepi 5 boards
      commit: 3dc7ba3548acbfb657614db4ca70d9878bdfca23

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

