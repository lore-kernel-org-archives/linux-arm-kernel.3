Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D11C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 03:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mSwWawINr+yQ3GlhEeqmNy45YB9kP71mUDFm0s9/Xg=; b=YdViZJFIwXvd+7bV5OHh75ahvJ
	zRlY+N7myE6+mDuWsiTWLm9VSuk3RNe7C/CfoDhUhkfWUoNhOE/9f9dnKoiFwOHZ+uorSDKw2iNpF
	m/sOGQ8qBV4Xyp/KB1ywVOPD5pz+kQXyeIvN64POoH7EDWOMMyb4zhN3h7FOHc3N9cc+ddHfNEHQm
	OMfYJSHz5t2x58hu6Uw2px6uY5w+JAKCXJwAg28fK9DnP3kdbgYG/nwEp8qJQPL3/FSLfyHm2Z4PB
	S21wvsbFqaNZRHRihpRr34LSfxZ97A8+yXDTkWuk5TvVfnMV8i3TYfVvhUnY1MYg4XK9D+dCPSrKZ
	dMPXWJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7cq-000000083M9-2Hdt;
	Mon, 13 Jul 2026 03:46:36 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7cn-000000083Lk-2Tcw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 03:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=7mSwWawINr+yQ3GlhEeqmNy45YB9kP71mUDFm0s9/Xg=; 
	b=K9dMVVF+QxMdhpzGsbpa2/ZjEntH68QJxbXRSnkVvZlLr8qkWv6V49Y6j4Wupf0VlFGIVVBfowK
	3cFRKqJvQMqVrn24EB7NP72skkhG/7ZFOHbHXaD7gNKuB+sOKhDTvJV4ammNaRmRuBsrPYQK2EYmP
	Iyn2xWVjUvY8/1dxiD2se/6Om+cfza1c1s/mfM0bPjw0e8w4Qv8iL8Ifby2qZBIZGu7ed0cnCWXDR
	SZOkC3zPzGav6ECS0Sp3PD3gv5oQM5FtidLunl3Ehuu5LcAA3KtjBvXbUOQ3W1C9VvL0QGILvWgK0
	0TMPKMannKPDOgrUyldb1GpkC1RDVvk6xvsQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wj7cY-0000000CyI2-3jM8;
	Mon, 13 Jul 2026 11:46:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 13 Jul 2026 13:46:18 +1000
Date: Mon, 13 Jul 2026 13:46:18 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: ixp4xx: add missing MODULE_DEVICE_TABLE()
Message-ID: <alRfim2lYMuJhlni@gondor.apana.org.au>
References: <20260704121524.42229-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704121524.42229-1-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_204633_649336_325445A8 
X-CRM114-Status: GOOD (  12.68  )
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

On Sat, Jul 04, 2026 at 08:15:24PM +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

