Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7269C44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LN5bdwWceuskaNKmyJkWqtdrVJQGUEM8o5+xyiQlKUE=; b=zmrCXC4gOz+gLcONREy29HrDVE
	xakWsykGiIJ7wQMyTbTH6Fkn0LNCtSsjtpPSul3c+8YwchGQho1emk4bblJd+XxJuF6VjEUpAEzxA
	FcwiHtbSEj4XIYp9/ZUTwwkxTzuJ+u7t+y7mTC598rElqfg+esF+liFqKw1RYwUXNG5mbmjihm1r/
	VYevMvBC8WmuTBqhjW04i76gowX2p/VTuyt5VzlTAYwFMK9eaBBGuyY9cE29CalAHm3g3Qkc1cq+s
	rCvX8VL0QYvm358IgTQ5E2pQRFNyhTvqdeaWgEmLm4P5/cZQzIrIRO7kp5ByIfgQEMUDijV7vZx1K
	GH18bLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQ68-0000000Ax8b-2i0T;
	Wed, 22 Jul 2026 06:06:28 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQ65-0000000Ax8H-3vRI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 06:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784700383;
	bh=LN5bdwWceuskaNKmyJkWqtdrVJQGUEM8o5+xyiQlKUE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=RH3Pfm2fKMvYCi7wJbahzfRlko43ftqoQEk7VlGj5uI97BRLC7omAXn6tYMryEH1z
	 +9YxADvc3Rw8JoKyX6PHnFhZGNg/zLqvcOmZKFigkDRfd5MlKdCwQirswoMq7TRGg8
	 CkyDXwobBElM6JqKynoJfIaCE6r1S2l5MPHuAb/BNn3zMnbHoG22tNyKvr3sh2cQLW
	 oiUnVSU5aJWVGWPFZ5Xa9OQzddsFDThBMzJVqjlYFI3U7xEzJbq/LxZV+kZ4Z2wSWe
	 zuaP0Ed/qliw0w1XxQWSpHGQPNaebEPgQ7aNG4oVhwJND7Ud6o8pRAOqY/eE73f3JV
	 Lxkqt/cdqL+lw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 954F265B37;
	Wed, 22 Jul 2026 14:06:22 +0800 (AWST)
Message-ID: <7ce703b95521b11a2ddf978d23466a5acc65ce9d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 03/12] crypto: aspeed - Remove redundant dev_err()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Pan Chuang <panchuang@vivo.com>, Neal Liu <neal_liu@aspeedtech.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, Joel Stanley	 <joel@jms.id.au>, "moderated
 list:ASPEED CRYPTO DRIVER"	 <linux-aspeed@lists.ozlabs.org>, "open
 list:CRYPTO API"	 <linux-crypto@vger.kernel.org>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT"	 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Date: Wed, 22 Jul 2026 15:36:22 +0930
In-Reply-To: <20260717080045.191538-4-panchuang@vivo.com>
References: <20260717080045.191538-1-panchuang@vivo.com>
	 <20260717080045.191538-4-panchuang@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_230626_170387_B17CF9AE 
X-CRM114-Status: UNSURE (   5.06  )
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

On Fri, 2026-07-17 at 16:00 +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

