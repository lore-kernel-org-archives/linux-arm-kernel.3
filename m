Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2521C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2E/foWG+GBw4iT2amZe5GTPBRmywetPiSoahCrwoJo4=; b=xrNBDSriw0EZOMCpPpQSaIYKVS
	dU0BUn/uyPDYIRRUx+VTD37ZiJZpwcvhVhWeFZZxMQjqoD/c9IQhfGXjcGVQdn5S9ZS/uOlaWVwUU
	E3MHThMO7rQZBG+kMRQKtP6lTI+6GYWdnbr3QIulgyhI9XZBrakFMpGSS7+/XILVD6sPZOvseJAis
	uXJn8kNcMcFXI05YJWPJlVqu0VUq0GQ2S3s1I1TXopdZ/cO54LkaFYcybaeezG6z+UAKwOjI85LLM
	/41t1sHILYrUzCL36JmBJjbTJKu3iIVcbyhYuMxCjHl+/nBTGjOS8RTnwaumSRgbx+NIBCnQE0pue
	HmGj6ffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVIM-000000000cU-3hQZ;
	Wed, 08 Jul 2026 16:38:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVIK-000000000bl-2FzZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2E/foWG+GBw4iT2amZe5GTPBRmywetPiSoahCrwoJo4=; b=Wkgdns+7FKN/7OvfARMas0Wy62
	BvrLXWVMBmU0pX3RgmMx+CIrySrPxjAhlJTpjKvRqN4VqxaZ3pSqJrpWE+SdXHb+WWjovvCKlZ5m6
	po+/T3o6oV75Xw7XRrhHUev+RcQV0bIi7A3fAkBrlT2yLT5kr5ZLS2yfr5yVyG6tx5cg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1whVHq-00BLyX-N9; Wed, 08 Jul 2026 18:38:14 +0200
Date: Wed, 8 Jul 2026 18:38:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk,
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com, ninad@linux.ibm.com,
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: serial: 8250: aspeed: add compatible
 string for ast2600
Message-ID: <8eb54ff0-b8ce-44e6-8251-c19e0b6773cc@lunn.ch>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <cbe59dfba231dcd55fa86233dc076b017d67463a.1783524645.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbe59dfba231dcd55fa86233dc076b017d67463a.1783524645.git.gregoire.layet@9elements.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_093844_582885_653306A2 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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

> -      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
> -      applicable to aspeed,ast2500-vuart.
> +      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
> +      applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.

nitpick, if you need to respin. Don't change to two spaces to
one.

Whitespace changes distract from real changes. So it is normal to put
them in a patch of their own. In this case, i don't think it needs to
change at all. Two spaces after a . is a common style.

      Andrew

