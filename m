Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E1DCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBZpfZMhb/qLJdhn2F1dJKc6DesZIGgqaeovqJQ6kSM=; b=F9mX5FIwGohyeOPIl5xA1s4Vfj
	ldjczPhVowlYCvWz7a4gHzz2Dvhx6NQGoil5PqPN0ghPyftEabEyZVEDu4r3PQca0HLHtK3VvOGwu
	t2Ia7pWiV+Z8hjb5vCVzcqJyGJvztAhqkJa2slKq5ZfUisNMXnczAaCgWybPt4jTXFtaM9Fj1Vxgr
	nfGbDqW6KtLsmTYUzIXJujxIltRn0Ex1WVOlEWLmVN1lPNfbMYaN6YbLZUdZ8w12W1l2w2nOVuvmY
	KtPN/BajZeozIqrkrt1tOJ6vQZuMQdABXd0aBzdChmqpx5qPn7cdMHYQHo8ksArcsor8MgZuynXI2
	EZQ6B6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8fI-000000063Qt-3OXV;
	Sun, 24 Aug 2025 11:13:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8NH-000000061au-0pE2;
	Sun, 24 Aug 2025 10:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kBZpfZMhb/qLJdhn2F1dJKc6DesZIGgqaeovqJQ6kSM=; b=ImifMFWCfk5+S05N4JvcBEGG0n
	tdOLPAbMzN11biP7h5CTgRFeE4Uy0nQO7ryhiYE4O4/acr9+k9VlTJNXiCgLp4vAZ8Q5g7bNbmOWd
	T3DN6O9PH7fw/HExaLfmfOYYfarMmtJK7gv2U7AEa5zq/I8mUhyskFkqKpkX6c9EbVwRiqaTBkYYy
	QZ57bpunXW/bqo7Juq3U1nYDsLuZbuYG3Q8p3B4LiJsR5yyZ16nXTLzFAACl+xT9aMuJrLoXbOyzT
	l1nxFda9sxtuK8GkUfmc4vq8stfO5NaO2QZmmxsNQPyTsDa+1mS6bCQ91KVaWQUgfjCk/QfQBvHmb
	wCYRGO+Q==;
Received: from [62.245.128.201] (helo=phil.wifi.munich-airport.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq8N6-0005H4-H9; Sun, 24 Aug 2025 12:54:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Kaison Deng <dkx@t-chip.com.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	honyuenkwun@gmail.com,
	cenk.uluisik@googlemail.com,
	i@chainsx.cn,
	damon.ding@rock-chips.com,
	jbx6244@gmail.com,
	sebastian.reichel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix es8388 address on rk3588s-roc-pc
Date: Sun, 24 Aug 2025 12:54:41 +0200
Message-ID: <175603280231.3445205.18306877381327188841.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250814043230.2774813-1-dkx@t-chip.com.cn>
References: <20250814043230.2774813-1-dkx@t-chip.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_035459_233088_11807444 
X-CRM114-Status: UNSURE (   9.18  )
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


On Thu, 14 Aug 2025 12:32:30 +0800, Kaison Deng wrote:
> Use the correct es8388 address for rk3588s-roc-ps
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: fix es8388 address on rk3588s-roc-pc
      commit: 4138adfd3594ebe957c6cb640372c93e354aa171

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

