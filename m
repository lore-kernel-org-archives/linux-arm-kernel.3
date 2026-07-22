Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9060C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XBZRhKpknaN9ie61rDFV9v+KJvFVfjWzRKaC3sDmO0=; b=QNbbjevYdLwFRjXcgEolT2zP2m
	AMEY2HpwtgYQOwMsfWcisBr5O4NvJ3h3UZCnrDAdv7MTyU5vRaUfU2JEuAYGLgSqNxcGGCydrNO4a
	TSznDBbaJzptPBHKjxKSZARxP8HBZGxcXeXPLxskdwKwTtNGxXfIxL2v0tO9lfvA0mJU0h818QUiz
	JiHaT4xgLVhMvCnWfUFYQaUDW7AftRXom+XTSlKpPPhlbKDgEw+TFiYsfYKwlrNOy5Q9vprUWchW5
	xpH2ThLe4pa4/oc1sKK9M6vqz8ezcJpm9fMuyKFn0cpelX3YD9WIVZvStQvyeNAUqW2cv3yQJoGnq
	UOvBPhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYyq-0000000CCTo-49HD;
	Wed, 22 Jul 2026 15:35:32 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYyn-0000000CCT3-2C0i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:35:31 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5362940E00C4;
	Wed, 22 Jul 2026 15:35:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ut7K_oDegzWP; Wed, 22 Jul 2026 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784734514; bh=+XBZRhKpknaN9ie61rDFV9v+KJvFVfjWzRKaC3sDmO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faNcpSa6xVfsnQIYl/CUXMMs6ASkhRB0yoDgBH9DwQupc0uTRFB/F9/LJoPzrKXSI
	 x+2wiROamekYhcg5CsD6Szr6hqbF5Wl29eVEOfxYDPhZiOjFSaAdDRlMxFhPN3JsqJ
	 eLbheNeZguE+iajoxqT4O8h/V0AXeTS/Qj1U9QAVyW8PmXUYDPr18lDOhMyKbq41AC
	 kke4bENmeypiNDMI9PiOJ/nm5+6wdanIDXfwbV2Fxg5p4WsP7ketpZ4LohCRnaQq74
	 hryCQIHdi5nHIG5yu8awSK7Qayh/3vk4ASXTvLr3rZW7GAF3Ysthkob/CVgbgnRkpL
	 UnYRvhedHLUAHVNx58EekH+DLpMnwz8sIqUUn4PTlAXqx6UbqHeZaUwKTbqaSk3KAC
	 R3pWCKc2nxL2oc5Ys+yOPdd5MzCy7P9FxzWYW4VfUCljoNsw68yHDbSS+D+2CdGxnc
	 Zr3goeUiS6K4u8iajxvSpu1G1uoRFeR3J2Y9LMf0UF84C5QHrdFgs2pg1k2Mg+OO0P
	 QjwXmBGOTAXtQy998c6+3b0Y2dNP7Ztb4RuOrmqQJuUrh/v8bGyGIeSZpSmlDmoQzu
	 k3Y1cHRuKklPNBS6G++YxFNF+bjmP8Ku9mdc5ikN/WOiZKKWuM9m8JM7X+XFZoguzP
	 N2bKi6buZGkgVPY8LaiGpX0U=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F01CA40E00DC;
	Wed, 22 Jul 2026 15:35:00 +0000 (UTC)
Date: Wed, 22 Jul 2026 08:34:57 -0700
From: Borislav Petkov <bp@alien8.de>
To: Pan Chuang <panchuang@vivo.com>
Cc: Talel Shenhar <talel@amazon.com>, Tony Luck <tony.luck@intel.com>,
	Stefan Schaeckeler <sschaeck@cisco.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andre Przywara <andre.przywara@arm.com>,
	Robert Richter <rric@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	"open list:EDAC-CORE" <linux-edac@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH] EDAC: Remove redundant dev_err()
Message-ID: <20260722153457.GBamDjIXWetAs3s-U7@fat_crate.local>
References: <20260713131510.332386-1-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713131510.332386-1-panchuang@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_083529_722101_0DCAF847 
X-CRM114-Status: GOOD (  10.10  )
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

On Mon, Jul 13, 2026 at 09:15:10PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"),
> devm_request_irq() and devm_request_threaded_irq() automatically log
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/edac/al_mc_edac.c       | 12 ++----------
>  drivers/edac/aspeed_edac.c      |  4 +---
>  drivers/edac/highbank_mc_edac.c |  4 +---
>  drivers/edac/thunderx_edac.c    |  4 +---
>  drivers/edac/xgene_edac.c       |  5 +----
>  5 files changed, 6 insertions(+), 23 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

