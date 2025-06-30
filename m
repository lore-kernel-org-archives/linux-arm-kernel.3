Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AACC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7EVViU5ruLGH5y+Ku78Ia3QlHNz6cQZo821Bht4t8k=; b=UDA4e/BjRzk6Kxmei0OrTwj3ar
	SKQXuESlq2spyb6oevaB4N7lWuIZmntRjUCh05TEhhvP3VSUsUJMgc8gU6U9iwJZnob4/H/l976Vr
	kuZdJfsYwvdl+cF+5/p+CGON9jX5sj0t3FX0eZ9zCsdC0gLhJVyupXDrKVAxJ58LCOmWKS5ojL6EG
	ziHA9rxr2nZITqBfg4zhgrsUJDTVQVXvmgUaUe8AI7wJ6kkKt4I14MCYIUrX63qCUp8wNOkaIymdQ
	HEDMA0rC3yrb/MkrUdgRi6muXnf9uRKyUkmc1K2OWYTdRhRj6mKMsL+scSL7xbXXt48hDKDKAziRA
	7seSilpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAaT-00000001isQ-1stI;
	Mon, 30 Jun 2025 09:14:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAYA-00000001iZ7-0NZM;
	Mon, 30 Jun 2025 09:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=q7EVViU5ruLGH5y+Ku78Ia3QlHNz6cQZo821Bht4t8k=; b=oyEKrvAbL4XsxleMXXHgIEiAuo
	sGyr2iOv/ml1ZRiPg1o638aSG+wdmbWmVf0JSy/0ESpbbgGzUj88ACT9q2iC6+4wKsUP/FQrWY/mC
	xq/JXDC15aA5i1hH3oCpXTZqn0efgKIW2lzNAvA1sX0ymOiUYGLdBAzJ3Zm8rnMWWRwwCYPJI9Xhg
	UFBqbRlJBozGPakQAovaBD13l/hhE2Thx0ww5fjuZnrMb3GxPIT4wlxzHFBk0PGEZFuwmADVg3etp
	2BWRg7Ies5BsDMlh7ArgxgIRjZpeuJvmH1orZ9WbDTIz52skuwlVpCQDvJ1LG8xuxjj3lpEI2359u
	vIw7uudQ==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWAY6-00065C-4U; Mon, 30 Jun 2025 11:11:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: Re: [PATCH v2] arm64: defconfig: enable further Rockchip platform drivers
Date: Mon, 30 Jun 2025 11:11:26 +0200
Message-ID: <175127468080.130313.8060207058865143134.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250626-rk3588-defconfig-v2-1-ae6720964b01@collabora.com>
References: <20250626-rk3588-defconfig-v2-1-ae6720964b01@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_021142_150031_59265990 
X-CRM114-Status: GOOD (  11.74  )
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


On Thu, 26 Jun 2025 22:41:18 +0200, Nicolas Frattaroli wrote:
> Enable the rockchip-dfi driver as a module, which is used on RK3588 as
> well as RK3568 and RK3399 to measure memory bandwidth. For this, we also
> enable PM_DEVFREQ_EVENT, which is a requirement for this driver.
> 
> Also enable the rockchip-rga driver as a module, which is used on
> various Rockchip SoCs, including RK3588 and RK3399, to provide 2d
> accelerated image transformations through a V4L2 interface.
> 
> [...]

Applied, thanks!

[1/1] arm64: defconfig: enable further Rockchip platform drivers
      commit: edc4a9d1dc1669e42a35b2bd1b711a5da0e83699

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

