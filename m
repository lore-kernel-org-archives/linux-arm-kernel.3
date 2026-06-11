Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3D4CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pVz5J49AxA7AOOClK6NcKBTj5l/4nUBhjoMqDmJbOc=; b=naFZ790cPkkyBKla7mRQbd621k
	2A3bzzoJhsKZdZXmEXgxh4MOGCY2JBSoofIEsWHxlDUDYpGyGP4MW+xye9lTZQplGoBEHxTtfQSoi
	uQIX9ft86+mTI21c8vRV72crP1u1qb7VjPOhp+m/yGu93+NzNhuxnj1vTrj6cO4rCMNDtokCOZroc
	46vhBRjaZ1vJIrLJXCjvrjqZ2WdrykzkMKZi0Wr5xrP8B5uSvQ1pBqgsoio9S/iybTHS+KhHBwooC
	Vmv6+kuoyVqsjoP74TNysgyT4keJXVD+L9fsewrmldp7Q1CJIj/v4yXSJbGcR+4mvFGKwClw8V5J8
	EbTup0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXd45-00000009G8Z-16t9;
	Thu, 11 Jun 2026 10:55:13 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXd42-00000009G7B-2lF8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 10:55:12 +0000
Date: Thu, 11 Jun 2026 12:55:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781175306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7pVz5J49AxA7AOOClK6NcKBTj5l/4nUBhjoMqDmJbOc=;
	b=cM2dQJFHmnegyMvYl7NA6PRZ6vrBnxxJTP26I0GwbHjIRkMd1vuCmDQZH8hTyOSWgjYMUj
	hTp0iPirf4mk24tS5I9Ycsk9P0zuTlQxpRh4VO+QlWxVobViJDBtofRtRuwSTnlhJCOL5g
	bx5qEIsqrr5fqT3WM5pTFJO/NZnzPGk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - remove stale comments in
 atmel_ecc_remove
Message-ID: <aiqUBXIybgHXA6uj@linux.dev>
References: <20260602165247.977197-3-thorsten.blum@linux.dev>
 <aipH0NgL4Gbe7Oz1@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aipH0NgL4Gbe7Oz1@gondor.apana.org.au>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_035510_844247_87B7CB52 
X-CRM114-Status: GOOD (  27.17  )
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

On Thu, Jun 11, 2026 at 01:29:52PM +0800, Herbert Xu wrote:
> On Tue, Jun 02, 2026 at 06:52:49PM +0200, Thorsten Blum wrote:
> > atmel_ecc_remove() no longer returns -EBUSY since commit 7df7563b16aa
> > ("crypto: atmel-ecc - Remove duplicated error reporting in .remove()")
> > and is a void function since commit ed5c2f5fd10d ("i2c: Make remove
> > callback return void").
> > 
> > Remove and update the outdated comments.
> > 
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >  drivers/crypto/atmel-ecc.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> > index 9c380351d2f9..e6068dc0a0c1 100644
> > --- a/drivers/crypto/atmel-ecc.c
> > +++ b/drivers/crypto/atmel-ecc.c
> > @@ -347,13 +347,11 @@ static void atmel_ecc_remove(struct i2c_client *client)
> >  {
> >  	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
> >  
> > -	/* Return EBUSY if i2c client already allocated. */
> >  	if (atomic_read(&i2c_priv->tfm_count)) {
> >  		/*
> >  		 * After we return here, the memory backing the device is freed.
> > -		 * That happens no matter what the return value of this function
> > -		 * is because in the Linux device model there is no error
> > -		 * handling for unbinding a driver.
> > +		 * That happens because in the Linux device model there is no
> > +		 * error handling for unbinding a driver.
> >  		 * If there is still some action pending, it probably involves
> >  		 * accessing the freed memory.
> >  		 */
> 
> Please fix this properly rather than fiddling with the comments.
> 
> Drivers should always fail gracefully if the hardware disappears.

Yes, I'm working on a fix, but it's not ready yet.

Thanks,
Thorsten

