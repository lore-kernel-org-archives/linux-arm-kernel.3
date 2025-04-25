Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194B3C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 22:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U33urWJ0nbHUSj4/Ei55DnraHJ93Xd3t00xN2jKFwUw=; b=q4n1c5nsPz+2AaybMLy4g3w3Q/
	ySNPCVPOYiK+TyRJV1u5vhkYEDeyqMUpIwQ0YB+1DsZHILXop59qRmLdDCDOqx9DU1363xjDBYVjr
	vBbyMFOOABnKrCw0R323umlgTH5z5G2wcPsxlK+6/5vhY8pRSFGUnlSjkE712nHdOOLkAuyZBtxOb
	Xcwmm6xBcdix5DRbsaLXnkFg+DBtweGhE29gXazR8NpZOmXAAWfPSmU47nFw8z5fTuA1Ig1psSHed
	dtHm6uSJfycDn017fCp6oxSl15Qa9f3jKOoeKBUMICHPek+f17kmfSgLkf5KkdG8sb4BhYof59hJU
	vmXxxvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8RGR-000000011bb-0JAv;
	Fri, 25 Apr 2025 22:11:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8REX-000000011A1-3YhZ;
	Fri, 25 Apr 2025 22:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=U33urWJ0nbHUSj4/Ei55DnraHJ93Xd3t00xN2jKFwUw=; b=R2A0oH31L8HOyJJ3pZ3Q+UUzRc
	o8mEE4btAzk82MmSOlVcj24R+jgnLh+OsOAczxgLLgS7G3hElozLwNVypRWDYOepIbpoVJYYpl+LF
	afGJodDUn06LsKLeAysAE0DoQVb269hnPe18BDB6CbXe1pT0+m5eOJ81KEBdzwIb6gFoOffAhiPeu
	KUnwTRFJuKDYHk42LkkmxZsEWzULaSispPBUoLgj9Szq1ggFQvwQamvith2pRqh8E0cfSxpxyfVmu
	evz/qWNUPvxPBnP/IKu7+r7HYvCLQ7LVaFIi7Nz0dAkZj5B97TD25ozt98qv8jDXvXg0BjQ/+Pu2p
	xi4wANtQ==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8REO-0008Uk-72; Sat, 26 Apr 2025 00:09:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org,
	Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: Re: (subset) [PATCH RESEND v2 0/6] RK3576 OTP support
Date: Sat, 26 Apr 2025 00:09:02 +0200
Message-ID: <174561877790.431677.17884049982561107688.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_150921_908946_8A20C99E 
X-CRM114-Status: GOOD (  13.23  )
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


On Mon, 10 Feb 2025 23:45:04 +0100, Heiko Stuebner wrote:
> This enables OTP support in the nvmem driver for rk3576.
> 
> I expect to pick the clock patch (patch1) and the arm64-dts patch (patch6)
> myself, after the nvmem-driver and -binding patches have been applied
> (patches 2-5).
> 
> But kept them together for people wanting to try this series.
> 
> [...]

Applied, thanks!

[1/6] clk: rockchip: rk3576: define clk_otp_phy_g
      commit: d934a93bbcccd551c142206b8129903d18126261

While the original nvmem applied message [0] listed the clock patch,
it was in fact not applied there - probable for being a clock patch.

So I've done that now, hopefully as fix for 6.15 to make the
nvmem work in this timeframe.


[0] https://lore.kernel.org/linux-arm-kernel/173978599692.25901.15315285566342669137.b4-ty@linaro.org/

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

