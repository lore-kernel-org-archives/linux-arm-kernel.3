Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1663BEE498F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 17:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/IB+huzo10okk2OaTVTslD9guwUX3b+iP/CdZtUnaS8=; b=Q+N9Z+qeGQJTLBdoX+j6pwxNcW
	NTWJOfkMVWnxNPV7A/jImB2uaMeNckFe7TgpjB4t5iPBOlpekGHpFneZmCCiniAWoarR25AbllBgn
	uzSrVddT1vx9kPbxDj52APGhMEsUyNIn0x9ahrgoNgulPSR5ZilmaJkQhAAqy+s64MIHD+QN+LwTu
	lLcDdWznM6+zGLR6U+4qi3ysuhefugc8fldxwjzxcyG4EW2wnnjqgiOHxZpyAUzwF5H6betK44Bsg
	LORDpPrMrXgu3J0DOlQlAF1cOlu8F4xOFxZx2IXqhrzDOqnyQ8xiAJ6ViN0Xbk8BHuom6ZzzdI7Zw
	xjs1aTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaddX-000000058Qc-0UOZ;
	Tue, 30 Dec 2025 17:36:00 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaddU-000000058Pk-0ctY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 17:35:57 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-162-171-nat.elisa-mobile.fi [85.76.162.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4dggGl2dZJz49Q8K;
	Tue, 30 Dec 2025 19:35:42 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1767116145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/IB+huzo10okk2OaTVTslD9guwUX3b+iP/CdZtUnaS8=;
	b=C0J63I2rqTHg2c8seaXumRYMepfu9z8lkPKAr014D4AbO/8Mha3L9EDoepEa7PulAtIVdR
	zzA9FZr8FHULlZ27pzfNSXAXc8FW5GkeVsdBw3PMQZiIditn5x33IyjDxPwlO0R36JObLT
	cT9QMw5wmLNwIxYGx7Xe3YM1bFLWXDMLE0anIhK5RJxMt4QVN8xCV3EzVaCbMnRFv3QxXW
	hGiaeOjwr7o/wTWNBpFahNI0xrEwDD7aVl49Rg4iplp6ipD0epXXFHfFBaEvqkvNuWMP2r
	1q4EYYz7GShxddFmiFrrGYtA4w5+FjWex9S19mL3TGrpqjwF/3WMF9U2raTrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1767116145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/IB+huzo10okk2OaTVTslD9guwUX3b+iP/CdZtUnaS8=;
	b=Gfl/D9D/vVEHaO4gJY0CAoQqPjmvQ/8qjdkxdgTUNS8coc2XsHjv8gLUTNYjUAQJJ2hD9t
	SKugwNgFJyVaDmoXuFo4nLSd6x8SnrkgY8MYs8TNI2JjizQKg6do2h/UYvQzTzua+MD3h6
	esIDy7pvi398YIKclN9sfvr+Vjs5G29PyD20bpteVZT80FMC9hYPpzYoM6EoQ0HpWCDlCN
	YEZLkQ6dGYgofgIA7953XxKfdT7a3YH8vE8M8jPP7dVdnlr7ZkAlDaB40NfL8p9WulwoEx
	5LAeiaT87weV6gzNZA4LA1kXsQKskTkYs+8HlEbAXiwL8XC6emKC6HPkX9cFfw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1767116145;
	b=BhE4yi8POenZhEl4FPyDdkrAeQAlsFc0UbQRxqAz7as9BCgxglLYgQGdw78oHT/+rx3sN1
	pNmRD3Vw4VJycfXGibYD/JmPRmdwr2v57sRxQBV46cIuiVCu89MpNNnbnUTKWKlcyiPOKW
	a5IHP5RzSdqRZj33DuiboTKc0e6D70a5AM9eFyAWGnHXuJ5URqFHIAXKOnggZQw9OmMhO+
	yfDJpfXrcFiBBRXuhZZMqQc14TtcG1CKlk61NV5ZITPaf9SbSj3KOWIood8rlOPHG6jomb
	J6VqEGn00Si5D57jpPkwc7iUUvzkyoQYnOqL9ZtT8dUqTCeuAt9SK+MXuF8Grg==
Date: Tue, 30 Dec 2025 19:35:40 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	patches@armlinux.org.uk, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: omap1: drop unused Kconfig symbol
Message-ID: <aVQNbK4K_q4UtJP_@darkstar.musicnaut.iki.fi>
References: <20251230055230.3212260-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230055230.3212260-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_093556_376828_B63847A5 
X-CRM114-Status: GOOD (  12.70  )
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

Hi,

On Mon, Dec 29, 2025 at 09:52:30PM -0800, Randy Dunlap wrote:
> "select ARCH_HAS_HOLES_MEMORYMODEL" was mistakenly merged here
> due to a botched rebase (says Arnd [1]).
> 
> Drop that line since that symbol is not used anywhere else in the
> kernel source tree.
> 
> [1] https://lore.kernel.org/all/5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com/
> Fixes: 7036440eab3e ("ARM: omap1: enable multiplatform")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

> ---
> KernelVersion: 6.19-rc1
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: patches@armlinux.org.uk
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-omap@vger.kernel.org
> Cc: Russell King <linux@armlinux.org.uk>
> 
>  arch/arm/mach-omap1/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
> 
> --- linux-next-20251219.orig/arch/arm/mach-omap1/Kconfig
> +++ linux-next-20251219/arch/arm/mach-omap1/Kconfig
> @@ -4,7 +4,6 @@ menuconfig ARCH_OMAP1
>  	depends on ARCH_MULTI_V4T || ARCH_MULTI_V5
>  	depends on CPU_LITTLE_ENDIAN
>  	depends on ATAGS
> -	select ARCH_HAS_HOLES_MEMORYMODEL
>  	select ARCH_OMAP
>  	select CLKSRC_MMIO
>  	select FORCE_PCI if PCCARD
> 

