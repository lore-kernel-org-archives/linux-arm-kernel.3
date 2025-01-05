Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DF7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+OeFSCd7YH38tPZ53li4XDnnHkIKso75p2alieFcW0=; b=2EePHymOAXT3vqTpOa5ByamLfP
	k3g82njhhLUHgC8jjTCkunhBf6OZewYTmRx09ngnqvL2dr6Jx6Mw1DX98k3N8KtcR5dr62Oeb0e1m
	d7zLn3DWgk7f2QB+KFqnRaJkneNhfuqahEhhZUUVoJAIXs7FLfiJPQ51M2jiS9N+vp3pYeHh3qmKW
	06tVEGSarMw1eWEFaGY3q9kzs1FzYi390rFGo3cRKXcLNirN/XzrAiP39uiIskWdnSw1U6ZU1QDeT
	3FNcq6lOAz9TdX5rKCNIV0hZWrzOBfnCAAOtnSjFQ1V2F5UFbxw+KcXXc6vr/bjTmicssTnZo31Yi
	C1rfhCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTDR-0000000H3F9-03Dp;
	Sun, 05 Jan 2025 16:11:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUT9i-0000000H2mh-0R4o;
	Sun, 05 Jan 2025 16:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X+OeFSCd7YH38tPZ53li4XDnnHkIKso75p2alieFcW0=; b=gjpX5IrUdI3qTyw3bc1uw8tTQX
	35xwcckj7conxnuHM+jSiR4TyEjidGD8vQTaj0961SN7gCpPeTsfh8XxapbjsBR1y0rGVv/epKXeH
	Jf7JVWe8FyMyPEY1LPM4ztxMTtwIvF30P7Fd2AplVQXUu5bwI04RV+nCalblCn48IxFqxmUoCSgKF
	rusenmfHALE3wkl7jqliw+/zOxarMoi1Tm6rWUb4y3Ta4p+fLH2pZngm9xIqgok9e097SYKuTYQ76
	TLrMNBS5eUPBzNh4kjRUiRfPaYVp9CLPnC0WQV9RYwQ0Xhd90vAgDuHR8rJf4b4FT6QHs8bk7fF1K
	vNkAYlAQ==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tUT9X-0006uS-DQ; Sun, 05 Jan 2025 17:06:59 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	daniel@fooishbar.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v8 0/9] VOP Support for rk3576
Date: Sun,  5 Jan 2025 17:06:48 +0100
Message-ID: <173609319909.2437943.5709822695475196700.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241231090802.251787-1-andyshrk@163.com>
References: <20241231090802.251787-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_080710_175743_22D5D1B3 
X-CRM114-Status: GOOD (  10.24  )
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


On Tue, 31 Dec 2024 17:07:43 +0800, Andy Yan wrote:
> Here is the V8
> 
> Patches that have already been merged in V6 are dropped.
> 
> PATCH 1~7 are preparations for rk3576 support
> PATCH 8~9 are real support for rk376
> 
> [...]

Applied, thanks!

[1/9] drm/rockchip: vop2: Support 32x8 superblock afbc
      commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

