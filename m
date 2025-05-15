Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F61C3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ld9arx90FswKTvckS4BOSrObHJezxkx22Rz8W/MXMQ0=; b=esABxSu6plkGjXdtazcNC8rIhm
	raeNPpYJkIxt9LB0sBSm1q7A8LtxA5ZjFbc6Zwp7ELedNr+B75BXopbEsZc6Y4ixM0JkfzhJWZwbR
	iOG7JILS7JPl7NuzFh09GrZjUjgXWPedtIyIc0ji8s4FEw3HsWkRCBPnfftkDmeeoiwUbhDH/WbAp
	ur6Wm9ZQvMzxUJK4he42J8vMNKVgV7c6zwIXCLKCDFpx5V7Wxr5ozbrSAreL6HH9RqgSwttcmWlwk
	LG/yeRqvPQVZtxJ8qGb1vIb/vhxw49klmsxaWdbaRni1sfBmHpxGOE+MG36/MGwcBBYoGCWgE11Jh
	Vpp44Wtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFY7Z-00000000dyS-0rdc;
	Thu, 15 May 2025 12:55:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFY3A-00000000cwK-08D3;
	Thu, 15 May 2025 12:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ld9arx90FswKTvckS4BOSrObHJezxkx22Rz8W/MXMQ0=; b=qCpCZU3mchTTrS5K0WmUB2MNeM
	wbJTFYuKhjbTs+cSkk+7pQVcxE4BXuXfcYcYbBJyQX/RUFfOIo3FLdj/gE695TuOj90lRwjD1CsX8
	aMkSaevpSiZNL2HzdtAF+QmWCo0xuHcs63UQyabUB+VKD83+xfIkyzpsghdXXfV5bW7aX0cYOJ3mn
	19AaNXknKWk/OGM9fP3neVAGSl/soWJtOTMrjWpSa9/1qXKxVpYD0x6AUUXyxfBbNj5wNKMK1FAl1
	qSYGJp+vV4Xo05B8MuKSEgr0R+UFCcAwJSP8zwoMMiNP28Bwxxd+RysmtJaXLOvMlq8xvtADz+7sO
	F7XmxPUg==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFY38-0004ph-9j; Thu, 15 May 2025 14:50:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: dts: rockchip: move rk3528 i2c+uart aliases to board files
Date: Thu, 15 May 2025 14:50:43 +0200
Message-ID: <174731343058.2524804.16404184082290188449.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250510220106.2108414-1-heiko@sntech.de>
References: <20250510220106.2108414-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_055100_066768_6AD54EB0 
X-CRM114-Status: GOOD (  10.46  )
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


On Sun, 11 May 2025 00:01:06 +0200, Heiko Stuebner wrote:
> Even though they will be the same for all boards, i2c and uart aliases
> are supposed to live in the individual board files, to not create
> aliases for disabled nodes.
> 
> So move the newly added aliases for rk3528 over to the Radxa E20C board,
> which is the only rk3528 board right now.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: move rk3528 i2c+uart aliases to board files
      commit: 34d2730fbbddfdffd656d36a13f8fdb886a3b5e1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

