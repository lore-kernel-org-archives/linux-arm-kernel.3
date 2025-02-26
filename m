Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AD1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faGGqfXQbOiJ+9VytmDh1BHEK7Aeu0aHAnqiXKSPnZU=; b=5D+yvMFIIgZdWKUwSrIqLy5coF
	VCK+/foSKFDoYEtEK3ryqFpfp0MHDyScuqKiSzZgjbLOZtr/QTa+dCgt4PIUAdiKq7EVf/hvnRneW
	LX9HH/URQJ+tEDbKvE3kGkqR1azwKucgL59Zxiyc9wAjpExAML/Xnst8v3bB88UM4mju/jftnqaAC
	Wd1gmGWiefrEDV6haAsdMEmDToOq2vb2r/PTbMcFutZO4lJmBCLaHQAkFPInKEX8lk1oeWdQti1AR
	6djPimLUORqCcohewJ+u/vpMbF63mjMmaD5TZCjJgXpaOCJYdGD/YqM7FMNNJfN/qkFk0Wn7lytst
	NOduASyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNTw-00000005Dm7-2mIV;
	Wed, 26 Feb 2025 19:54:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNPn-00000005D6e-3Yp5;
	Wed, 26 Feb 2025 19:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=faGGqfXQbOiJ+9VytmDh1BHEK7Aeu0aHAnqiXKSPnZU=; b=A779wLZyYQY2f+RtjvixBeiva2
	o46CY6HrYmI66hHc+uKJZYwu/ISBz5MLGEKWgAocrQIAzOckCcGI+XCsinPF78Bm4UCjG59IvmQPa
	MbYcssrk+GHDBrFXUlyGdSCOwsu/jKhXutCNAzBZIE6wUuOhUSzHcdHfsQ21bQW6+W/WDyPEl/+nf
	VCwNpuhg6s8riPCnGzdt428Dn6owWifW8vLi5pAG5qXFG4AVJNIJg425ye7Aj2DqlIswMLBHS/NOm
	3kiQfQ9KbrfnG4CVqnMkrIVqD/6I1xwrYjWr2wNIFXzCiWqBPm2MVIy5n5DjQhPGPRwUld/WkdutA
	2GqBnwFA==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnNPL-0002zz-Im; Wed, 26 Feb 2025 20:49:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Peter Geis <pgwipeout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	zyw@rock-chips.com,
	kever.yang@rock-chips.com,
	frank.wang@rock-chips.com,
	william.wu@rock-chips.com,
	wulf@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	Alex Bee <knaerzche@gmail.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Trevor Woerner <twoerner@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Zhang Yubing <yubing.zhang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: (subset) [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for rk3328
Date: Wed, 26 Feb 2025 20:49:14 +0100
Message-ID: <174059933844.4008853.12666956119860907768.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250115012628.1035928-1-pgwipeout@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_114955_884525_43B56C71 
X-CRM114-Status: GOOD (  11.60  )
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


On Wed, 15 Jan 2025 01:26:21 +0000, Peter Geis wrote:
> This is my newly reworked phy driver for the rk3328 usb3 phy. It is
> based loosely on my original version, but as of now almost nothing of
> the original driver remains. The main fix here is the discovery of
> BIT(6) in the interrupt enable grf register fixes the usb3 disconnection
> detection (mostly). On occasion an unpopulated usb3 hub will take
> several seconds to disconnect. However this means all of the hack around
> work to reset the usb core manually is no longer required.
> 
> [...]

Applied, thanks!

[1/6] clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
      commit: a9e60f1ffe1ca57d6af6a2573e2f950e76efbf5b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

