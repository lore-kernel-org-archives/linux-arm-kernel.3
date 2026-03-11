Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD8F112584E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qN+dhQ7pIipgV9gAXix/V7hiZX0XYifLWQqq8RuMIw=; b=vSpeKzsN2g5BXwLoe4LEPkvsKB
	o/Bsq3aLyjik03sz2aGfnWXtUgZcGuYIBLll6ujNUI/mXas7GnuFzMXFld0QPIk+h5cftcSDkfacy
	JSC0LIHQvMQqbCUeUffkVYowUY3Pc9pOQE+ouL4KLEOBjWXaCGeEp3U0rFncrNfrefnpv0yCmrWQh
	Dr4eU71Vpu34MoNyl/F3cyqjSEaxI3K3/3JoVasi4LkTMm17zApuNGkygaJZ+dGL1EnDyA7Vt4NxN
	4C6XGPzfXUFumP2LqspPTowzUkSgXetZuJgre8Qxq3EGKI8yVgLpQbPnakotbGwUjvuStNzwW/9so
	icZ33QrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M1a-0000000Bs34-22bG;
	Wed, 11 Mar 2026 16:03:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M1W-0000000Bs2Y-2YfU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:03:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4E204C41587
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:03:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E463660004;
	Wed, 11 Mar 2026 16:02:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27E3310369D16;
	Wed, 11 Mar 2026 17:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773244977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8qN+dhQ7pIipgV9gAXix/V7hiZX0XYifLWQqq8RuMIw=;
	b=FbS8cv5mqEBnW0ck1ma310L2cGQcGkF5hEZeu83lpF6B+nYICwGlCj6iQXp2YyMOkWXFUm
	sSUdKuk9yYOmDy968oeK2ApUGWr1Rt+J1B90oHVbd2eibMpYjUa04u2PRADlQ1SeG939kt
	Gxs/rsPjauEJ3VdeC2N+Q1Eg6y1rYtEqXrZH4CUA1T5ELG6dD5N2yn11YFclh/eN7vWwX0
	sRl/2Y2tDRorqpEtgIUDpGIIws4wd3AtKDBr/pGOhWO2P+Lwr7wHRZchtw0uuKGYcr4HXQ
	F+QylaO9rmPCkOixXr7A1YlovW+CIi80sfDEs7ScbApCUGH9PIn6AJStoWDQlQ==
Date: Wed, 11 Mar 2026 17:02:53 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: Do not use
 underscores in node names
Message-ID: <20260311170253.1636929e@bootlin.com>
In-Reply-To: <1c1fc11f1f183a8e72f168bf6eb35a40e01ecacb.1773240961.git.geert+renesas@glider.be>
References: <1c1fc11f1f183a8e72f168bf6eb35a40e01ecacb.1773240961.git.geert+renesas@glider.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090302_792663_34AF6A27 
X-CRM114-Status: GOOD (  10.73  )
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

Hi Geert,

On Wed, 11 Mar 2026 15:58:07 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Node names should not contain underscores; replace them by hyphens.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v7.1.
> 
>  arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

