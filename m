Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08E0C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 13:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQdxKKVZ1GM7fhQqDu7S5KrsXU0ul66dbGYdSM5AmB8=; b=KLrwqOnrrEjRB44IGIDwmUdKv/
	13ucI+3ILsDrxuos6h/JSgaBEqmrrzq+nFkaVhn+9tcdtzNP7ngZu2m4bUKMl1mloe3zYPrNqMeD2
	W5Tkh0d9zVcms7JbcFmBvsnNQEzqs5KqTSZR9of1eMokwGl3/Ffr2JFoVDz/OSIK2B721rkV8Hywk
	ClFcWZz5RStYxLza1jdSANXJ3kWj5XP5t9hpvONtScUEY9u9igDtmHTwbF6EaE9tJigOKqYaTf4kg
	RFbTQ2xlBXGtEdHQ+eHx3XiLkutl0tfwScM41UABUtrejuEoabRopL4/aVbLgUl0j0v7Quby6SZjs
	sfKkLVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkr0-0000000Grde-1mOM;
	Tue, 29 Jul 2025 13:58:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkoG-0000000Gr3u-0UJH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 13:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TQdxKKVZ1GM7fhQqDu7S5KrsXU0ul66dbGYdSM5AmB8=; b=JCYskDSCGBuSczNjpjsQY5I19S
	KpaMTZOPRKIXZthIe0Ra+XbS+f14yNgQyF8RpCcM5UssF9/mKrNKvv3Fb3Yyv+m+qDKbiJsklw8zE
	eSBvljolvU6qo5fWYda0ckU8D4odrrnb81PLnQ48bG2eMZqCjwGD/vxbOl+vXSTo2Qq8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ugko2-003CMb-PD; Tue, 29 Jul 2025 15:55:50 +0200
Date: Tue, 29 Jul 2025 15:55:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Fred Chen <fredchen.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] ARM: dts: aspeed: santabarbara: Adjust LED
 configuration
Message-ID: <bc6b2174-e7b9-44c2-8232-51a3accff2d0@lunn.ch>
References: <20250729091351.3964939-1-fredchen.openbmc@gmail.com>
 <20250729091351.3964939-4-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729091351.3964939-4-fredchen.openbmc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_065604_154477_778CFBF3 
X-CRM114-Status: UNSURE (   9.89  )
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

On Tue, Jul 29, 2025 at 05:13:45PM +0800, Fred Chen wrote:
> Add a new power fault LED on GPIOB5 and relocate the ID LED to GPIOQ4.
> The ID LED is now driven by the CPLD, allowing it to reflect multiple
> system states depending on CPLD logic.

It would be good to add a comment about why this is not an ABI
breaking change.

	Andrew

