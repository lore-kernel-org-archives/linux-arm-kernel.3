Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84202C2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIr0sQIfWa4T3BPRRuuVacSrn8+fQt4tblX1wU8anCU=; b=Gu9kh+1a9aO5Tq5xtt3kBIMWIH
	UL61MBdUXqAUglNYcJgdC7B48Xe3JgV+PmMXSWiWK34oCtf9LUcVFvm27sVSWgs9ze9WL8ZLBWkEE
	PhJr06NWxNau6+HxQAE4B7NmejLHTHhMpL34SuWkR+SmDm/8wKgbr8g6Lz8wZgODftJS+dsN8jhwO
	GZRFjQuJ3GY8DPncGOoPJAiZqvxNafzUpDEbKwRSdETav0gr7vhGIAU+EbMCS0g1Pkw493IRpFPwV
	Y409aDDyIGef00++BPuxXlERFh86KABmkBcl7y+RAfZOuJRUgKEt3JfoyMFecCxwehUO9AdVmNoQ3
	hw+r4+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGtm-00000007kxm-3fAn;
	Wed, 12 Mar 2025 07:53:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGnE-00000007jlt-0Md6;
	Wed, 12 Mar 2025 07:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RIr0sQIfWa4T3BPRRuuVacSrn8+fQt4tblX1wU8anCU=; b=2NMSr2EdI/5uCqDILkGsak3e/k
	8QPm9/Xxz5AL6lJH00q5jHTHpy+XolBg/letmAxrIwLH27C3+G9x+izrEE+pxAYcEpP4DMlNab3fH
	RTxqi4Du/yok3DB5tkm2UAhV3Lx1G/HkvrfmiUTjVJlvma988l3P4JmS6sXH5onnt7ILCqL4EL2YY
	l3oGF+rQ0JvedmLY+K0fmryLy7Ks+RN6NqnGuz/4hbWd1ISEbNepUSjt18BbqMBj6YhaSEYYS8E+4
	BPxjGJXkMlLEwLB51JZNEPSjy/IyKErflpVEuAHcSdftawZ6yIc+piwLvbBO3meAgJH2u1R2EV0Tm
	e6bmPn5w==;
Received: from ip-185-104-138-79.ptr.icomera.net ([185.104.138.79] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsGn5-0005zY-5W; Wed, 12 Mar 2025 08:46:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Wed, 12 Mar 2025 08:45:56 +0100
Message-ID: <174176555637.249409.2785731072183565436.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250307120004.959980-1-amadeus@jmu.edu.cn>
References: <20250307120004.959980-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004620_123675_F0D96213 
X-CRM114-Status: GOOD (  13.14  )
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


On Fri, 07 Mar 2025 20:00:02 +0800, Chukun Pan wrote:
> Add pwm nodes for RK3528. Most rk3528 boards use pwm-regulator to
> supply to CPU, add node to enable them. The PWM core on RK3528 is
> the same as RK3328, but the driver doesn't support interrupts yet.
> 
> Unlike other SoCs, pinctrl-names need to be in "active" state,
> I'm not sure about this, but otherwise the pwm-regulator will
> not work properly.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: Add pwm nodes for RK3528
      commit: 2973d077aedfc114affab96c3b2c7286163cc8c9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

