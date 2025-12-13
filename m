Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D6AD59F60
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 01:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inO5mMNHZ47Bm4+rKLc88zkAFFzs0iu8YvVNFbkzeRA=; b=EjXPiS5kwqHsQLKP55ZWcGm1Ej
	qsqR3pxWuTnZrJPY+VdDtUVa6l8mtfZjiOZdrilvAXjN4wZnIVsYK+2WlN6AALxEAxEOG0vbALOX8
	RoUtgwpKM/+cOJhKQstDKHt8ncW05KWAWrne5rsnneQIkEu6JdTiN+qbN3kqmy0cSVa9VdqmZxkrf
	OJ9UZ1ksjlMILUiHmRP2EjGOg5ums4RLv7zdZUP4xTzf8PHKTPswQMXhE7dlDV5GxARfvvlYjS6E6
	fcqE8qOFJN0EqZYhhNxV6Ke++wxOM4EbMar+NHidbaqpZOgOA9qYXWgw1u3WabQE2OreLT60bBl3+
	fMs1qp4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUE8o-00000001Gl2-3QEa;
	Sat, 13 Dec 2025 01:09:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUE8l-00000001GkT-0AKS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 01:09:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 032964E41BC4;
	Sat, 13 Dec 2025 01:09:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AED816070C;
	Sat, 13 Dec 2025 01:09:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E887103C8D89;
	Sat, 13 Dec 2025 02:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765588177; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=inO5mMNHZ47Bm4+rKLc88zkAFFzs0iu8YvVNFbkzeRA=;
	b=r7/akPv0xpDvS9+O+WsdxVmqkgAIrrlY7GtyJ/ebLJ/DGxw+yCy8+Y3eSQPQ4qGr5cUiX+
	8oL2B1AOW2v0UmHhQBSWZEhO6ZyPawJmCsBRguraQnNTBNvP6pr8RxEQiTNYKkTnoFz36R
	PvKmd88CIB8VvHIngz9DY9O3PTBqJ4uA56FQk38qUNdSSC6vsiCTQAwfS43PYP6wFkD7VE
	Ai0Av7ifoLHBIj9PYJ/C14SEPsagQl0V4QvoylyS3uByz6H2r9K7iUJ1UeXyNOzQVILevh
	ZakbhnSpMuaax8MgY6Xk89SgLeRLlprDZEaKlvlK5coFHDYfHc3xkgv/8QLSrw==
Date: Sat, 13 Dec 2025 02:09:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
Message-ID: <20251213010934353f1efe@mail.local>
References: <20251212203226.458694-8-robh@kernel.org>
 <aTytWyyZiYFnyauo@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTytWyyZiYFnyauo@shikoro>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_170943_554057_7375EC93 
X-CRM114-Status: GOOD (  14.08  )
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

On 13/12/2025 09:03:39+0900, Wolfram Sang wrote:
> On Fri, Dec 12, 2025 at 02:32:14PM -0600, Rob Herring (Arm) wrote:
> > This .dtsi file is not included anywhere in the tree and can't be
> > tested.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Nowadays, this should be a dtso which did not exist back then. Is it
> okay to convert it? Yes, I can do this.
> 

I don't think this will be missed by anyone. Unless you actually have
one of the boards, I would simply drop this.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

