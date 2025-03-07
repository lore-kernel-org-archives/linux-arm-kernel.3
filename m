Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C32BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 05:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olxLrd0QC9zoKYMcXvUz70QEQ37Dr3MKljzYN3XTg3w=; b=wdr5jbI0zr5tUTt+X+PFyAjdYJ
	NSHpiXu0CNF8Rbk3BX6XCAtUjpgvNhWsOs1oQfZ/8vCytNQfa2XYaszkRvU8RaJp5Nc5ZzrkJcIv0
	oA0s08NlTVHj0gb91+OijYZDlqubq8WrizEgpcWGToX25i1IIwWBpuwFRqzlY8/I3XlUQY/2XeLbj
	MjnGl3I9EiufXn79Hr+6UJv+joHObhmF/W/0OAjK1DzcOow/lhcgeFKCLzPbBOSwWmc9RtgyOSKR8
	9cTC7V2rO3Wrz/IoLwEm8u9Uce9PyybFtR/NCmZ12Zeu2wrApiNlIUdPDiPsmUNeCnjD++zHMfg3P
	wASHc6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQfZ-0000000DG0Q-47fJ;
	Fri, 07 Mar 2025 05:54:49 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQdx-0000000DFu9-1EFl;
	Fri, 07 Mar 2025 05:53:10 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1E15425D53;
	Fri,  7 Mar 2025 06:52:59 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tckWDYJ3Tzh5; Fri,  7 Mar 2025 06:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741326778; bh=8pUgSgop8ysTVfRFBXPiQaRHFFGbXmooM4lxtk87R90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AOZJ9o5FvW8yfwecTcbsNRyFRpzyskfWAfP8kCR0cykMVfEp3cnzJUryHx1DxeEYh
	 p3MsEvNrV3rvJencFZY1bQERwvUPvH1zgd5RsKXwdnEXuoYDKaRcW4XbiEUtunLxRw
	 b0yHFE/cOsdfgQ1y9kotL5mg0VVt1Qc2Rq/DobUuFkohMiutlIqopJXbDFG4+TsMiY
	 PzDkpIT6teC+LBBIGipyajKr45tBW+C9FarX8+euI6lkalw+53DIYdiArukvfPAyeG
	 2HoUaEG1audW1E9M2y525bHuexgCGddvX+I5Qe/AP271yw9lj2reCV/tjvtvIoY2d4
	 YpIzFCRidQNtg==
Date: Fri, 7 Mar 2025 05:52:42 +0000
From: Yao Zi <ziyao@disroot.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com, devicetree@vger.kernel.org,
	heiko@sntech.de, jonas@kwiboo.se, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 8/8] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
Message-ID: <Z8qJqpUwi7VV8tJk@pie>
References: <20250305194638.47187-1-ziyao@disroot.org>
 <20250307033508.656479-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307033508.656479-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_215309_749152_DE2EE555 
X-CRM114-Status: GOOD (  11.86  )
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

On Fri, Mar 07, 2025 at 11:35:08AM +0800, Chukun Pan wrote:
> Hi,
> 
> > +&sdmmc {
> > +	bus-width = <4>;
> > +	cap-mmc-highspeed;
> > +	cap-sd-highspeed;
> > +	disable-wp;
> > +	no-sdio;
> 
> With 'no-sdio' property:
> [  129.608986] mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
> [  130.711168] mmc1: Card stuck being busy! __mmc_poll_for_busy
> [  130.725536] mmc_host mmc1: Bus speed (slot 0) = 300000Hz (slot req 300000Hz, actual 300000HZ div = 0)
> [  131.751240] mmc1: Card stuck being busy! __mmc_poll_for_busy
> [  131.765608] mmc_host mmc1: Bus speed (slot 0) = 200000Hz (slot req 200000Hz, actual 200000HZ div = 0)
> [  132.825083] mmc1: Card stuck being busy! __mmc_poll_for_busy
> [  132.839413] mmc_host mmc1: Bus speed (slot 0) = 187500Hz (slot req 187500Hz, actual 187500HZ div = 0)
> [  133.960141] mmc1: Card stuck being busy! __mmc_poll_for_busy
> 
> Without 'no-sdio' property:
> [  105.224019] mmc1: error -22 whilst initialising SDIO card
> [  106.290838] mmc1: Card stuck being busy! __mmc_poll_for_busy
> [  106.801931] dwmmc_rockchip ffc30000.mmc: Busy; trying anyway
> [  107.385835] mmc_host mmc1: Timeou sending command (cmd 0x202000 arg 0x0 status 0x80202000)
> [  107.400425] mmc_host mmc1: Bus speed (slot 0) = 300000Hz (slot req 300000Hz, actual 300000HZ div = 0)
> [  107.431561] mmc_host mmc1: Bus speed (slot 0) = 49800000Hz (slot req 50000000Hz, actual 49800000HZ div = 0)
> [  107.433107] mmc1: new high speed SDIO card at address 0001

So it seems the sdmmc controller actually works with SDIO commands as
well? I don't expect that since the datasheet says RK3528 has only two
SDIO 3.0 controllers.

We could remove the "no-sdio" property if SDIO actually works. Will
apply it in the next version if there's no objection against this.

Further tests about the capabilities of the controller are welcome.

> # cat /sys/kernel/debug/mmc1/ios
> clock:          50000000 Hz
> vdd:            21 (3.3 ~ 3.4 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      2 (4 bits)
> timing spec:    2 (sd high-speed)
> signal voltage: 0 (3.30 V)
> driver type:    0 (driver type B)
> 
> Thanks,
> Chukun
> 
> -- 
> 2.25.1
> 

Best regards,
Yao Zi

