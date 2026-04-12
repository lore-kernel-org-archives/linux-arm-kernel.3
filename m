Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098ADE64001
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTovshi1GqmNEB4X/qx5YwzrJwn7Dy1PAzbfxM8YoYs=; b=DZPyGhvgaYuNvFwqySTQNTqJ2W
	I7PCtw0rsDWDW9wobwsZbTSgvPmNICNdbO6uhq+7owugkCLIj0BnfNKYWuaKyYBOdztSd50+ddTxP
	pB/pkSxGOKZYiBS2haY1wdFYzez2/IEO/J0FO15xYY0Bxb4WK3rHFNLcMesr4Q3P3XJ5N9GZv+gCR
	ppBGliEbkQtI5zlaU6GUC4Wn4GQLEwtWQQjTAXnKpe8ysA1Yh/csOk2MeGk4BBhnKBmt+di2PkdmJ
	rxOhKMqP/Kg6RZOXVewbq2li3dfnhScKpi1rpyLGiwn8CzemjoJVGcl/eeFkKxgqGXY8uJOgSMrnu
	pSPosFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqvn-0000000EBdl-18so;
	Sun, 12 Apr 2026 09:16:39 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqvk-0000000EBdO-3bsh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 09:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=CTovshi1GqmNEB4X/qx5YwzrJwn7Dy1PAzbfxM8YoYs=; 
	b=ghwLd1QBr4ky60ey0JBGQmk90Qlz+DfCT9t4ZSvB4ZG6BFCFAWPYaz8eHQKjX9tOMereGbQ30hh
	vxW6AH3VPGjCGYtRm07U4WPoc0PVQjpdljENjCiyNu2dqSO5OeXRsutyyxgT4PXa6S+JkOskGqzYy
	r78QLUpyPGQrcLkgiF4eS6vosuXf0eGY3VNErUl7JCEXFifRCvYVBdA68WZYPAr3cdU8AwFekSITP
	UfowQzKhPJguxFjd8SH4HXLlEaRUGES7N75S6Y2/+hn0WdwsKfq96koaL0aZhqrIEwEKqy/9zNw96
	hGgwj8fGtlqzMlTL952u/YD4af0c5CceUElg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wBqW0-005UUi-0Z;
	Sun, 12 Apr 2026 17:16:20 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 12 Apr 2026 17:16:19 +0800
Date: Sun, 12 Apr 2026 17:16:19 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: atmel-ecc - add Thorsten Blum as maintainer
Message-ID: <adti42hn8JLKdpFL@gondor.apana.org.au>
References: <20260403112135.903162-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403112135.903162-5-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_021636_921027_463AF694 
X-CRM114-Status: GOOD (  10.36  )
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

On Fri, Apr 03, 2026 at 01:21:37PM +0200, Thorsten Blum wrote:
> Add Thorsten Blum as maintainer of the atmel-ecc driver.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

