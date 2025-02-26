Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FC8C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zep892YhHBeGu7ypgTlnqdKmeYJIyeAfXkPBma9xeg8=; b=2kWYaXrmBGsE2znjxszU5QWFA2
	T6yoXPfT8xgsaZMR7rjivkJI0s5f76+N5zZJphQp2BzelCRWbd51iKJ6Wylnzw+io6qRsho96hxcy
	Fdepn3Yz4Da5Z27YoKCS/J69iyoFu62UOPTh21EWaD0tnIuKbH6ZpLEUkNEAYpqr1Uk/07fzytScI
	UjjTvDM6eMGZc0ZXqzqdDnbj4fbrLHLZepHzmw7v6W0lbsi6THG/AlknOkXc0p2JXqfRyKvwO7GIN
	Q3BFxLf+A2bDflZdvQ8k+ZATNWHxw9jCu1B1MvV94+lzLVggoWsKv7391dgATC7Gnw18RqPjXqpAF
	NSidMYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPSG-00000005XcB-1Ggf;
	Wed, 26 Feb 2025 22:00:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPJ6-00000005WfR-1f7p;
	Wed, 26 Feb 2025 21:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Zep892YhHBeGu7ypgTlnqdKmeYJIyeAfXkPBma9xeg8=; b=uD2QzNBNUdgc+W5pUpIdlglnZz
	zhL3oa7szuzzcK1onL81vEN9qB2pSWeo8xMhSHV/5mGZG5OwkvbCSmBmJlgNAl0mtEd+l1CZXOTaK
	gPnlwd4j+tm8yaAk38y2+QtTi2XgcTdzJeijKCc7ihPRcu/H+IsaUHEsHr22nNs972E99dcBa3cX+
	/ZdtMlbplq14g6GXoGP9E2uCoLXcgrXuxxaC0DtQCp86OT4eC6teXQiqPBrXeq+WQUvXMRBx4a7tB
	6Prvnht3tJzYDNtc7YVkE1T8+Gu/2NwvIiFX1Wvlz2Fr4Pg/hshZsZC1ByULP3076QGPUcqQfNSjb
	HqPeCNbw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnPIv-0003pQ-C1; Wed, 26 Feb 2025 22:50:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable USB3 OTG on rk3588s Cool Pi 4B
Date: Wed, 26 Feb 2025 22:50:47 +0100
Message-ID: <174060663654.4032178.11014498458940806402.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250223100757.73531-1-andyshrk@163.com>
References: <20250223100757.73531-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_135108_455318_49D221FB 
X-CRM114-Status: GOOD (  10.39  )
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


On Sun, 23 Feb 2025 18:07:46 +0800, Andy Yan wrote:
> Enable USB3 OTG and it's related PHY node. And the PHY will
> also be shared with the upcoming DisplayPort controller.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable USB3 OTG on rk3588s Cool Pi 4B
      commit: a3b3b57ec92f46237b2478973aec65270f457bc2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

