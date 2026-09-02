Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD2AC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtq/Hbwh3y6+tZU+24Z00S/OaFKe/w6VjMyJdVY5XfE=; b=QAEuXks5bMKNzcAtoRM/DtxEJn
	sq7HpsUCEafv6iAfUUloafRC4Bp8nUzQ0MzdIqkYrR6x4FAZVJD38gCcGLIxSMSeNrYPuyYCd6+gT
	slk8yQKbS4V5W04GiZfVpNnUTx+38TvwUkMMwQwGldy39YjYw7c5ieehKE5cXCDMA/VE/kIcmD3bV
	RKwKN9DDNIJs/PbMadcUbyWvYlbYdgIHdFQ/LVVLrqVc0B+VSxYhBgbrozjZthIXxztaH9x1dHaCa
	mhfAr6zCSd4nDxFZimkpNNCDC5Y5OmPW3x6tQhULcRNVPXgr5SRFNE+FY09ZsfTFJsFblHYAvluDb
	2sdhUZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1isO-0000000ESpL-2Haf;
	Wed, 02 Sep 2026 11:11:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1isJ-0000000ESjb-3QBB;
	Wed, 02 Sep 2026 11:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jtq/Hbwh3y6+tZU+24Z00S/OaFKe/w6VjMyJdVY5XfE=; b=GzHRdNdbla3pQEwW2Se5SLxB7T
	KQPQr3K7NviQhmFM7GkxzgEygrlhcXWj70lGyHyUs5kMA8neLseGhiPejDvTLl6zNU6654Bn3iln2
	Cgi/ADt+xlPaZjfmQlLD8O83GPKq1NfIA2yR4BlO3IYfeOurDFBdV8NViundwSQIl2IPhu++mDCI3
	1MgM3mhocUg4KltxLp8FMQA8UsS0oHsprz7GvW55l//j4jNCPgvMucDft+R7IXgy4zCwu/a0+e3lM
	EHnPCdsfZdX7sBV2M9j2Ly+U4UWP322pMKBsmONinSN14Fg4mpkxgWutn7jbL9vwuRipvIgEfI6XR
	rz3xlixA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3399pro-vmarc-som: add i2c2 scl timing
Date: Wed,  2 Sep 2026 13:11:17 +0200
Message-ID: <178834747218.2268650.11241416915608173120.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aou1Q5-hdF7kRVpe@0d3a7a881997>
References: <aou1Q5-hdF7kRVpe@0d3a7a881997>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_041127_870222_FF181C23 
X-CRM114-Status: GOOD (  10.56  )
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


On Mon, 24 Aug 2026 03:06:43 +0000, Rudi Heitbaum wrote:
> The hym8563 on i2c2 does not ack:
> 
>   rtc-hym8563 2-0051: could not init device, -6
> 
> It is also the ext_clock for sdio-pwrseq, so wifi does not come up
> either.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3399pro-vmarc-som: add i2c2 scl timing
      commit: 7c40dc4055b6868c5ee7c4e30fd483544a25a58c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

