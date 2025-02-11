Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46887C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnsQBWqEuRRtpC1o8f5ipeZHrP7bQA6G/kVoZZiFqMM=; b=hjmhtmyZpG9bhZutATtt4SAWum
	Hjg0R4m9G62zdvf/W9Jbbr+jMlj5dU9ljNSFktFx1sMYvCwrC0X7uf5nGFWrz0/bi2xCPZRSgQltK
	+hc4FzRN7eXZncF6jSAy77p098hkMWV5i3GJDnS8R7uAXGNOSC54bEZt2a+gaIMPSM0hGIlgDnIeY
	FFt1xtYQHFrjEuJ1RI6LgTCdbCqZrgkL9YZo8JqfIc+76J446gf3VpdF1tdQ6Y73YrBH74PQzDK6r
	/NQVBwOAJYmoT6HJe7xzHoYefnaj0n6MW0CsJw2d22RNkvDhO/x56JsBtCPvTkf3DLVe5jeLNXdtu
	6krs59nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thx1p-00000005E2t-2ggv;
	Tue, 11 Feb 2025 20:38:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwz3-00000005DV6-3j9D;
	Tue, 11 Feb 2025 20:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bnsQBWqEuRRtpC1o8f5ipeZHrP7bQA6G/kVoZZiFqMM=; b=Q5Eg2Pjs/DTW2jdvYcurVmy6Fn
	CFBxdt8iHp3NcSP5Qg79D1DjTMW15CBi4fMiokU85KIDbLeEG2x3wScqazNE3pA0guVOquui0daTW
	9wgWKrZCCo8x9gAsIVunJGq+tpfbiCsPIGAGl959RPa/43XepCLgrbKjQFCgeWSvUPofJCVikXBAA
	UdhmDULuP/agL6A5bhDbMM8iBNpd5ko0YPIo4q84ljFUXXqI0HSFcQhFTVpzqmQTpGYdQjk7SuZ84
	xpmehYI29gKr22g/d1jBdjH+SaQ3uZDARlHgr4pqkAoHLRk2naytcVnerYaiKZjb3P4rtMKK446Su
	3cT0O4Uw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thwz1-0003OL-KE; Tue, 11 Feb 2025 21:35:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Patrick Wildt <patrick@blueri.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: adjust SMMU interrupt type
Date: Tue, 11 Feb 2025 21:35:39 +0100
Message-ID: <173930613281.1358259.10855559235361885923.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <Z6pxme2Chmf3d3uK@windev.fritz.box>
References: <Z6pxme2Chmf3d3uK@windev.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_123553_922857_B4838D1E 
X-CRM114-Status: GOOD (  12.20  )
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


On Mon, 10 Feb 2025 22:37:29 +0100, Patrick Wildt wrote:
> The SMMU architecture requires wired interrupts to be edge triggered,
> which does not align with the DT description for the RK3588.  This leads
> to interrupt storms, as the SMMU continues to hold the pin high and only
> pulls it down for a short amount when issuing an IRQ.  Update the DT
> description to be in line with the spec and perceived reality.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: adjust SMMU interrupt type
      commit: 8546cfd08aa4b982acd2357403a1f15495d622ec

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

