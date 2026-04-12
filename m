Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A84D58B04
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrOHZVZL38C6MgwICRN4Rb/b7X1X7UQKjoQlDB9L2ho=; b=HQlC0+vARwqFhUC66soSYm9ivw
	iGi/gPWsLVVbeYU20mtwqpFWzbqQsKQwdkdU3KN5TYjgj8NZZiL/VyclTAUnZpAoDuECDFNeQScfd
	a5ybToPqE3yeQ8XJ3nrPHLYdlV7EqURTyXOpCECPsa6qoKjJVLBw8L6NFOxXNySiMlTs7/y+j/LVF
	oRaQoU6bbpPlgNYfs61vywO3gRbMMnHbgJx29E5ypoPdo9BnfUBGQIW5NU9m/zR2bQbXr6invIdTz
	iyxLR18Mr+BxCj2jyu7f0XmrbCmqD5q4QwgG9c9z2gt2IGtvTm8gCyBGlldfKtdheHSpp4XyZ4f3V
	GcLSFBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBp5W-0000000E7EO-0CWt;
	Sun, 12 Apr 2026 07:18:34 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBp5S-0000000E7DT-18nZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 07:18:32 +0000
Date: Sun, 12 Apr 2026 09:18:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775978299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UrOHZVZL38C6MgwICRN4Rb/b7X1X7UQKjoQlDB9L2ho=;
	b=aYFajoX9/l0+IIExwKph5VA+Fe71nYSPR2sNFgBZnutveAXeMIKuTJLMXmtjuyyRGNrMx/
	YA5kNnSvlgl1QATt2ZZ3pncYG7AlvO07Nzd70RC6GJTBJAmj/SZA/J8b1LC/C4nSco05K7
	Pvqh7P98KD2SBy6teLKPvzn45BfpQqg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: atmel-ecc - add support for atecc608b
Message-ID: <adtHNa-eMUQO0JqX@linux.dev>
References: <20260330100800.389042-3-thorsten.blum@linux.dev>
 <adsyzmm3WSZ1ao4a@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adsyzmm3WSZ1ao4a@gondor.apana.org.au>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_001830_857505_00F327C4 
X-CRM114-Status: GOOD (  14.74  )
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

On Sun, Apr 12, 2026 at 01:51:10PM +0800, Herbert Xu wrote:
> On Mon, Mar 30, 2026 at 12:08:00PM +0200, Thorsten Blum wrote:
> > Tested on hardware with an ATECC608B at 0x60. The device binds
> > successfully, passes the driver's sanity check, and registers the
> > ecdh-nist-p256 KPP algorithm.
> > 
> > The hardware ECDH path was also exercised using a minimal KPP test
> > module, covering private key generation, public key derivation, and
> > shared secret computation.
> > 
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >  drivers/crypto/atmel-ecc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> 
> Is there supposed to be a 2/2 or should I apply this patch on its
> own?

Patch 2/2 is here:

https://lore.kernel.org/lkml/20260330100800.389042-4-thorsten.blum@linux.dev/

Thanks,
Thorsten

