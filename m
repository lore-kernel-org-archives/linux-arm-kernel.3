Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BF2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2shE/vXKGK6XxDN3EEo6pLrsf8hO3g7K+H5vR1Pf/s=; b=AlKwf0KW5JPJTIw5TYRCco7DtE
	mgiXZsIL2MIUmairZM4tQqdwbS8hnr90v4uhmrbnTLelrRt4ZfjayZ6LpffSMFETJwf5Ro541JQnV
	r//MbI02qbA/+CZRA2Kg0umWsIb6YkdvyYJqlm2PyhtYHAm16FBEL9NOxwJxXEeedzfrfAeb9UdxI
	Ie6YwI9ASs00zkS1XelIN/X5YSwO5qSquN7gI48AtDAAwKmTCGB3uhrsOMJbhxIYixwVfyIYy0Yr3
	KzwNmWYAwd0PZsXd9fkWZ7A7HJONStr862QYyx2piLmc3pLSR4LhY/dcT2Y8DINj4BYrZg2Hp8Pf8
	FI9ULcRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dza-00000006mlM-1GPd;
	Fri, 17 Oct 2025 06:31:10 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dzX-00000006ml2-38ZH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760682665;
	bh=R2shE/vXKGK6XxDN3EEo6pLrsf8hO3g7K+H5vR1Pf/s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Dk4+OInXAebpYC/bzwaUKlZrUu+oraR1IiDv+GhH4Mik82X6l/EHqwhdYdFxD9lS0
	 H+TA+9KK7XG+lWKRHkOfhbhccYhMO/vlmRMGoyECB2cZnr7tHhtXeomcWBWbtuiOzd
	 /I8OiuN/Z/11Xuf4ieP6u3hLXesAtSBQNlYnTerFZxB5pU+gzmRa+x4m8Fii+4QyRk
	 CQGqhD5RtxSG1+dRp0BsXlTX/4hTFZmONsvz2dL/xTMMaVAzPpwQyTDuU7RxSDWoGo
	 L/xyI0U5DRd/uGP52+/BEBWYYTl1v8B+K0pRZfy+HO+O9cCdGeayhbVpTu4QXDnu/9
	 xLwecaSHHTRLA==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 26EAE77272;
	Fri, 17 Oct 2025 14:31:05 +0800 (AWST)
Message-ID: <b63b53521d44c1b765cccd3f9f03d7f778b7984c.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] gpio: aspeed: remove the "gpiolib.h" include
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	 <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Kent Gibson
	 <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@linaro.org>
Date: Fri, 17 Oct 2025 17:01:04 +1030
In-Reply-To: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
References: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_233107_994309_C459CD08 
X-CRM114-Status: UNSURE (   7.51  )
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

On Thu, 2025-10-16 at 11:09 +0200, Bartosz Golaszewski wrote:
> gpiolib.h is a header internal to the GPIO core. Drivers should not
> include them. gpio-aspeed only needs to be able to determine the
> hardware offset of the GPIO given the descriptor. Expose the relevant
> symbol in the consumer header which allows us to stop pulling in the
> private one.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For the series:

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

