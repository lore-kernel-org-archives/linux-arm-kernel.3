Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF685C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 16:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMql8KYiWH+c+lYpthTy/7Bw8ahN0iWeZq/Ll0qDnnA=; b=XGda18EYKrIPngVAjJ+t8ILugs
	4UrZkh/jZEPuvMYq1MGZrHGyXrS656ZaPeuaI0ZVVPQweDUEjeKlDzk86/nqLOQ/d0oOooUEbYJUE
	2r5ZzihI9HZZvZUP4o9N4SF9kPS97RaurQUoaWpPR+pYpkAsf+dAQGj8ozwe2aOz/rTHIYTvB7xCR
	1XwZJmsxL0dgJXaJxVZ3qfcTbmQnOHWLN17OvsqOcAY5EGxKcglM9+f93Bv/4SrO/YjFZXcnvQIvB
	1YbS7YhmP6dpzGZl6Sar7bArODezzk7itSXYNPPzxmKaBS6Ex00Iii7nXF4MA5tzbWsYdNQLpjmRQ
	fpJHbHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tknOT-0000000DyHL-3bBj;
	Wed, 19 Feb 2025 16:57:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tknMz-0000000Dxkh-0ols;
	Wed, 19 Feb 2025 16:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mMql8KYiWH+c+lYpthTy/7Bw8ahN0iWeZq/Ll0qDnnA=; b=Sl9gdCQPtE9cOUeQU9r7dWbN8o
	YTHvDfTnCZe/KEl59VvE/dFnVzlajwC7x3Z5g8RIb/ptrYNa5U6l+BpauUQlAypuaqBOkkRGwzjW6
	jej6ACZoJci1jlZyUzqpCS30dgWQyOX2OoBenOajS2587k/NGvvjAuoJ6s8QIoUmSEC3aG89DBHov
	s836CjytoPGmyyo09QN9trvwp7Crmo/hpkQC/UqivJO+RSQe0mvN7TAU+AEmSiuijYsT2IvxPbJj2
	tDl/uNbvqT7E9JY6J77y9PPEdh0L6HdVdtxVFDO5MM7USXbFRYU/Ugr5Lnlu1HkUdHfRcxgsCxkA+
	SMkJKC0w==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tknMw-00037a-0c; Wed, 19 Feb 2025 17:56:18 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, lukasz.czechowski@thaumatec.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: remove supports-cqe from rk3588 jaguar
Date: Wed, 19 Feb 2025 17:56:17 +0100
Message-ID: <17063984.geO5KgaWL5@diego>
In-Reply-To: <da11da79-11f1-4251-8fb1-3079c3b0da64@cherry.de>
References: <20250219093303.2320517-1-heiko@sntech.de>
 <da11da79-11f1-4251-8fb1-3079c3b0da64@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_085621_259122_B1886249 
X-CRM114-Status: GOOD (  21.68  )
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

Am Mittwoch, 19. Februar 2025, 17:06:52 MEZ schrieb Quentin Schulz:
> Hi Heiko,
> 
> On 2/19/25 10:33 AM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > 
> > The sdhci controller supports cqe it seems and necessary code also is in
> > place - in theory.
> > 
> > At this point Jaguar and Tiger are the only boards enabling cqe support
> > on the rk3588 and we are seeing reliability issues under load.
> > 
> > This can be caused by either a controller-, hw- or driver-issue and
> > definitly needs more investigation to work properly it seems.
> > 
> > So disable cqe support on Jaguar for now.
> > 
> 
> Seems more reasonable to me for the time being.
> 
> Aside from the reliability issues, I could also trigger a stack trace with:
> 
> $ mmc rpmb read-counter /dev/mmcblk0rpmb
> [ 1119.647435] mmc0: Timeout waiting for hardware interrupt.
> [ 1119.653480] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
> [ 1119.660676] mmc0: sdhci: Sys addr:  0x00000001 | Version:  0x00000005
> [ 1119.667871] mmc0: sdhci: Blk size:  0x00007200 | Blk cnt:  0x00000000
> [ 1119.675066] mmc0: sdhci: Argument:  0x00000000 | Trn mode: 0x0000002b
> [ 1119.682261] mmc0: sdhci: Present:   0x03f701f6 | Host ctl: 0x00000035
> [ 1119.689455] mmc0: sdhci: Power:     0x00000001 | Blk gap:  0x00000000
> [ 1119.696649] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00000407
> [ 1119.703845] mmc0: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
> [ 1119.711039] mmc0: sdhci: Int enab:  0x03ff000b | Sig enab: 0x03ff000b
> [ 1119.718235] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [ 1119.725429] mmc0: sdhci: Caps:      0x226dc881 | Caps_1:   0x08000007
> [ 1119.732624] mmc0: sdhci: Cmd:       0x0000193a | Max curr: 0x00000000
> [ 1119.739819] mmc0: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x00000000
> [ 1119.747014] mmc0: sdhci: Resp[2]:   0x328f5903 | Resp[3]:  0x000007d9
> [ 1119.754209] mmc0: sdhci: Host ctl2: 0x0000000f
> [ 1119.759169] mmc0: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x0057b200
> [ 1119.766363] mmc0: sdhci: ============================================
> [ 1119.773595] sdhci-dwcmshc fe2e0000.mmc: __mmc_blk_ioctl_cmd: data 
> error -110

I can reproduce this timeout with CQE enabled.

After disabling CQE, this goes away to the regularly expected response.


> FWIW, the changes that Rockchip seems to have done on top of that driver 
> in their 6.1 vendor fork are the following commits:
> 
> https://git.theobroma-systems.com/jaguar-linux.git/commit/drivers/mmc/host/sdhci-of-dwcmshc.c?id=2ef0767967138d333360ec0f399f1d68646741c3&h=linux-6.1-stan-rkr3.2-jaguar
> https://git.theobroma-systems.com/jaguar-linux.git/commit/drivers/mmc/host/sdhci-of-dwcmshc.c?id=75dfde714bbe81e938190142d07307fa864fda34&h=linux-6.1-stan-rkr3.2-jaguar
> 
> Maybe something worth having a look at some time in the future.
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Thanks!
> Quentin
> 





