Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24131CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNsT1TAS43uWKM1Y2XB0KoME7o52ict7JXgRPit0hts=; b=2JD4kEPOBbJmqLTzy19nvrpCjE
	nbYhRppSN8wIpm08pgGkDdTnnDo4Vn7r5k+IynNBUHZS81xEyMKOQnSnbCROU2GjVNclTtG3jCrzm
	2mmEvfqpfZja2sdwBvZNQhVr5/RVSS7K4z3/ng+MubYgToRFraNoQQdYoxHWsthdSTGYKfQACn11x
	9coRI8Ci2Sc/9gPqfJ1v5nrZN5TUAR2/8/aAC23QridJxlb1tyCbu2ptWJc5WSp3sBlphHW4jgGrM
	N3bXcYMZt9I1CUaVXmhnWIxd7+R+Pd2in4kYJyddVQZePdEODVmCiyTIssy6Lq+FjWGNvwdDcXfM6
	UObOQ/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQP78-0000000ApZL-3B5D;
	Fri, 22 May 2026 12:36:30 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQP6r-0000000ApCd-3YGg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 12:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=TNsT1TAS43uWKM1Y2XB0KoME7o52ict7JXgRPit0hts=; 
	b=sgAX1blRqiIrRAghvzrcYJejWi1O/5c63TxFH/XmkmIeNvdlyVm4I/E6ZCjkPKF6YJn7UzHGe/g
	zaS4dNxFtpS+jJllBtMS9/03vtKkDmHxzyeWGjFiEYx9EqKYgzNEGU0zHY0YUZgmyn/cXeyvZcZkx
	k2JQ4utsyUt99NKSj3PH9kiNtatStonxYTH7N+q2qdkxn5EVRXtlkQzaoe/i5SFihPae00jirkOK8
	aORCRWVQ6sHCZpnpik1+e+Hj/4VdpVDRIV0Mt4Sp2Xzt1b9Eymu94buccfru/TEV+qW+xPmNjynO1
	Tq11Q2mpHRD5ond6OeIR89jknpFLZufVgoeg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wQP6e-00GSWn-06;
	Fri, 22 May 2026 20:36:01 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 22 May 2026 20:36:00 +0800
Date: Fri, 22 May 2026 20:36:00 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-sha204a - remove sysfs group before hwrng
Message-ID: <ahBNsH0Z_mtR_sDZ@gondor.apana.org.au>
References: <20260517123706.1182427-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517123706.1182427-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_053614_419340_C408505F 
X-CRM114-Status: GOOD (  10.67  )
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

On Sun, May 17, 2026 at 02:37:07PM +0200, Thorsten Blum wrote:
> atmel_sha204a_probe() registers the hwrng before creating the sysfs
> group. Mirror this order in atmel_sha204a_remove() by removing the sysfs
> group before unregistering the hwrng.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha204a.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

