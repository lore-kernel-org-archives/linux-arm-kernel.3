Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD50CC44506
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYaQcEoqy6orUWR6icG3w0FgGfd8AtiAsN6o/qvFNtM=; b=jtAU2sJtNK/iuuvulaBqMmOwNA
	rCaOIfBWIb9v1hGW5LqdKuCeen1SZ/NqdX3uflygvY8c51cHiH3lqqC4cz9oqNg6mbBmG4/XXQPvh
	lOLN6XVBaRO1qwgjCVTGA54cxx517tHJdv6j30flApoN+7mqZiXFcU8Sko+6hQn7JtqD0iiEJFaT4
	rLQDxatR77f+BguxyY4BsJX+wB6t9df2xa6K5gfBkSXz9ajhOBidM/6md2GYSENvjo6nOoVLKwYNs
	G//rPsuHj4s5vSxBhT3Vvi8YBzQ7tWYIsNnJ32Y/lK8nu0hHaQ44NfDqZFF4es326Tts6ziiux1Pp
	3eiVnYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBin-0000000FnQL-1EMj;
	Tue, 07 Jul 2026 19:44:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBih-0000000FnMT-2e3K;
	Tue, 07 Jul 2026 19:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RYaQcEoqy6orUWR6icG3w0FgGfd8AtiAsN6o/qvFNtM=; b=mFoFOaGnTTTKr5DIXj4QqSrTo3
	5d7IsOC3+I3K0O4+ETuoi+iGZrINflKIaahW8ZDHai5YftYZUnTl5M4x3oND9D2C+8kIRrG+ROLTF
	V3C3Ovluv7GZZvq+7q4tPke5eLHy5S2SFU1qNbilqEgWW56X4slj1puTVWuZhnzv/Y8L6WBE4Do3o
	wjgpFGkLs8EZJFnr2dPqmQmzDZBOXlIXwlH8xCdib2Wetrx1mROyK3l0nxZS5o3unQC0Ycpbldpbm
	PwegqzmxZKhkZHHExOlqHVYo1tMJIMDfBoH0icC3Hzysj5LIuOg3sPcR9FAbk02tdnpHSVp1E81xm
	+n18ps2w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Mayer <bleemayer@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
Date: Tue,  7 Jul 2026 21:44:29 +0200
Message-ID: <178345345842.664858.9814271532472718755.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260705181920.8633-1-bleemayer@gmail.com>
References: <20260705181920.8633-1-bleemayer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_124439_818158_A4487742 
X-CRM114-Status: GOOD (  10.28  )
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


On Sun, 05 Jul 2026 15:19:19 -0300, Brian Mayer wrote:
> this v2 only contains name changes I didn't test. I added the missing
> agent tag and am sending the patch inline. Thanks.
> 
> The Radxa CM5 IO carrier has a Haoyu HYM8563 real-time clock on I2C6 at
> address 0x51, with its interrupt line on GPIO0_B0 and a CR1220 backup
> battery holder. Without a device tree node, no /dev/rtc* appears even
> when CONFIG_RTC_DRV_HYM8563 is enabled.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
      commit: 1945f419277503ebacd87cc221e370c8b6b94a7d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

