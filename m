Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83731C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b28ksCTnjIRFAquS7/o+nZoz6YrnaKx7+hVVFMSGgZs=; b=zRdu85Deewfivv7mJhPAL+xguM
	2sX5hh9VLLLAwxxKTprun8XhOIqdRCaOAlbfYkaX6ZmYp3PjVFVW+mn8xPg0Is0acBoZNuKnlRnAS
	rfZXCoC89J3fTlRgLPGMlA8FuwcOwPnNSHozL3TV9EXzQLsPtuv4nF0CMofD02xfGhmaOHdOWXlq9
	syAz37XSN7V/UCK5n/6MgAnS/14qDzubnJYg0obhBxhorcoTOheBiOcjrl0lqt22A8oDBLIvMpLOd
	z3k5VEVVPR9f+q6168M55lDIRbDZoEg+Atnh6a4HDlgnjM39vj+lDmAeNmbXSAArGprVhJdIoqxQs
	lw9b2StA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvLk-0000000DNbT-38tD;
	Tue, 13 May 2025 19:31:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEudt-0000000DHim-0afq;
	Tue, 13 May 2025 18:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=b28ksCTnjIRFAquS7/o+nZoz6YrnaKx7+hVVFMSGgZs=; b=2K8xhFrKIG7G61WMA7IwY53FJX
	Kd0ZCKmr5K6pEDm7R0x+h9KIVbp/TxbbEiIpnF5xG0kf0ts2pqsw7yyw10oRnelJtufY4zrMs+94G
	DoSNWiuDTff7Jd3sVgYpJRoLzhC5Dq5blgiCp64MDYXSVo8mgQGAxv/ZFiV4wuM8XAxpgo+IVz4hF
	ObU0LRf33J0QYJxF+pSXLNC1Yo2NNUNx7BfAij4rN7WxEefhmpdj0mfS+3oj03p27iR9INTnbtXO3
	mEtogGUnFsmkjPH+A97amtyt15qeyDyw+mvV6PAs1HAuFHJO8RJF2GnJLTO01VcwkpMv3oF1oUgp0
	yjM6vxLg==;
Received: from [61.8.147.169] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEudr-0003up-6M; Tue, 13 May 2025 20:46:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nicolas.frattaroli@collabora.com
Subject: Re: [PATCH 0/2] Some minor cleanup in the Rockchip clock driver
Date: Tue, 13 May 2025 20:46:04 +0200
Message-ID: <174716195452.2345121.6991370045549832048.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508182752.1925313-1-heiko@sntech.de>
References: <20250508182752.1925313-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_114617_183389_44F727B7 
X-CRM114-Status: UNSURE (   9.80  )
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


On Thu, 08 May 2025 20:27:50 +0200, Heiko Stuebner wrote:
> One fixup for the new grf-gate and bringing the grf-mux branch naming
> in line with the oher newly added grf clock-types.
> 
> Heiko Stuebner (2):
>   clk: rockchip: rename branch_muxgrf to branch_grf_mux
>   clk: rockchip: rename gate-grf clk file
> 
> [...]

Applied, thanks!

[1/2] clk: rockchip: rename branch_muxgrf to branch_grf_mux
      commit: e37fe0b9bf762dca9f16e0461d14038ec3898f8d
[2/2] clk: rockchip: rename gate-grf clk file
      commit: 553f648dbd9472ea55a6835446fe57f48491b355

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

