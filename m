Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CEAC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 17:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFob6bHbt9evz3lA1lPRqmDyommaykyRcKttnYjRsmk=; b=2NhdR7wiroMPAbEAON8LdnwiU7
	SjjX6xQAWZTIb9RUqmzJb6SqWlZLHazeH+nB91MWYYRDl9xVOw58fPN0HGBDzOOw72avMuk4RpMMn
	gibJkL77C34WNcXl77902ebQEpUvtY1lGYzDJFiOGHVX9+0EGpcXnEoHFu/gG2+nfoA1WP8050Kus
	bwvQnTSAlluTfb1T9qnhmYnNnjhKwTzpNVYci2q4gC8ViAH2+9eVskn/2PoQejPzURjbk95QPFLpz
	dTyXLs/vUlMYufpGI59gLVX06aAJ6Lzw2/1CkBGc0ynl+pc4ga130Ex9jFsJLvERmpQ4kq+2T/xt7
	GzeihzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL35l-00000001IgS-0wIS;
	Fri, 30 May 2025 17:00:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2mH-00000001Cie-16gl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TFob6bHbt9evz3lA1lPRqmDyommaykyRcKttnYjRsmk=; b=uHJFaY3ojfDQ39JRVwhAlbj8t8
	1Y5rFZax7qQUv5Cij4StrfieciR/Co5CJwpK5qF7VQia1udFwAObBb4qN3q7xzZrUMhYZKK97F+JZ
	xjy8OW2hrcSbn/lwTqXuqrjDYtD7Qvp8DGUssryzW86/rd7piheZNH9yUJ7jlZ4jRyGfi1ReXW6+F
	t4Z2rO9xKJvT+KUrMh8aVEecqXkGTx4Bha4rvpaiIkf05EZQviIhjAfB05PimgT93oP8nju4ugggV
	8EDDqj05B1X/blg87CNyQ0wwusKrU6SDEvUe4DBaWgx8vE6gcqFMD2DwsfwLZ158BF/lxdGqRGGAI
	cwgA5dgw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50618)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uL2js-0002Yx-2v;
	Fri, 30 May 2025 17:37:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uL2jl-0004kI-2u;
	Fri, 30 May 2025 17:37:41 +0100
Date: Fri, 30 May 2025 17:37:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?5p2O5ZOy?= <sensor1010@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, jonas@kwiboo.se,
	david.wu@rock-chips.com, jan.petrous@oss.nxp.com,
	detlev.casanova@collabora.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dwmac-rk: No need to check the return value of the
 phy_power_on()
Message-ID: <aDne1Ybuvbk0AwG0@shell.armlinux.org.uk>
References: <20250530162017.3661-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530162017.3661-1-sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_094017_306559_E282D897 
X-CRM114-Status: GOOD (  14.16  )
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

On Fri, May 30, 2025 at 09:20:17AM -0700, 李哲 wrote:
> phy_power_on() is a local scope one within the driver, since the return
> value of the phy_power_on() function is always 0, checking its return
> value is redundant.
> 
> Signed-off-by: 李哲 <sensor1010@163.com>

Patch looks generally good, nice to see the reverse christmas tree
ordering of local variables resulting from this patch. However, the
subject line needs to be adjusted to meet netdev requirements. Please
see
https://www.kernel.org/doc/html/v5.1/networking/netdev-FAQ.html#q-how-do-i-indicate-which-tree-net-vs-net-next-my-patch-should-be-in
Please wait a minimum of one day before sending an updated version.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Please can you also follow up with a patch to change the function name
from "phy_power_on()" as this may conflict with the PHY subsystems
"int phy_power_on(struct phy *phy);"

"rk_phy_power_set()" would probably be a good alternative name,
especially as when the 2nd argument is false, the function turns the
PHY off.

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

