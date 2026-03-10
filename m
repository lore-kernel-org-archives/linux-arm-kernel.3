Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF84EEA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XW5x2W70/4qH1wnLG28SxFGceYyAdqEbV+ODm4WuYMg=; b=ba9JOkD93jakfgtYBzah5E4TrI
	l0uimPONUb2C1IBgfiWyT73V7g9Qbcff/pU2xYmH+zuSJ6DiAdwcL17keN8utiM4amwygA5p7SNVw
	oKPWoipntZLhcpBbGiIcfgnOKmRcGvrKR0i0BOq3WWYA1XDHlsnlWcBTXiZAYnZ5qQApg69EyJ95D
	Re8m416mb+reWBTd8Nv6989esn9I03/vDMx/nVxNp/JmK5TzNNNVAGRrqg20gxaSFaoQDB6aeCWMd
	OJjc3wfeR0DQQ70bIuwG8Uhx4CyaS+tP/4K6PQ4t/e81X9PNos4ttHa4Hyuu4QmJgcKaCZblYsYrF
	QC9qLzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztPm-000000095mF-3ldu;
	Tue, 10 Mar 2026 09:30:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztPk-000000095lU-2v3A;
	Tue, 10 Mar 2026 09:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=XW5x2W70/4qH1wnLG28SxFGceYyAdqEbV+ODm4WuYMg=; b=AXZiRj3XaLjCcEcg6QX35x7Q7S
	+gR7ns3jStOmeS0rkfMeYt3tnLMbvRTFwDgc8Ft5TKwsFLVLATTFA0ZfWs1VcZb0Mb+7aw/WDNBak
	bKAcwLYW5l0b+dwGRpr9M30txEbxjxFhdmme8XWm+0nAwx+Mu4Tnhxd/R/PRZVUbLYJXgqnfWVeHv
	yML0UHWTDARQPfVNWq3KpGGkSXwLKPUaKDNe5CI33Af3j0rRgo4+AyDRF1F4sWomD3HneyvKxHhXp
	hw8PWlC4da8rzUUeWCpGaIjD/kUzjswHfy62agnvfbzWbMt+QmrAYrEsa5cYQNpwsiPEMyDGAIGh3
	EKsvhBKQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-jerry
Date: Tue, 10 Mar 2026 10:29:54 +0100
Message-ID: <177313498974.2340533.2031096927430655073.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304164448.1024410-1-festevam@gmail.com>
References: <20260304164448.1024410-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_023008_755950_991E1F86 
X-CRM114-Status: GOOD (  11.11  )
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


On Wed, 04 Mar 2026 13:44:48 -0300, Fabio Estevam wrote:
> According to hid-over-i2c.yaml, the correct name for the 3.3V supply
> is 'vdd-supply'.
> 
> Fix it accordingly.
> 
> This fixes the following dt-schema warning:
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-jerry
      commit: 3ca314a5643057ad30d16b18c99ceaa5474c1200

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

