Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB0BFB3CE6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUwEBaG9uQ3dYUOCSfxdYyIp/VwIgG+fgAgoqoHEw7s=; b=eTgTqiUPzEqruNTUr+/ff0uAtO
	dM0cZP9nMMkhohpNllVKzYak52yrLPfNHwDlTv/Uhusit0OHqVWSl5omO5nWl+bUWfXd+UkChNfgG
	4URhCGkiyqOyJvlu/WYr6rx/F1ytROyC3F7FD29dRvi/xo/uRBuuMKvBVS36ONF/SJHuokaGIbAbb
	vO6c5rbc0wWlWlY41p6ex3KadPYw92mWHkYHLd6bpYMtat6IV/g9LdX4cmwiLGYkH640gMMIXWNhf
	ywrZOl2xUPv5tbAyGcv3tO1foDEYLgfQ9bygV7YMXooaOQPCY+AAI9jM7pdCJr5EeG2PQng4PXE2w
	QOTy29og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78lA-0000000Awx5-2mz0;
	Mon, 30 Mar 2026 09:18:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78l9-0000000Awwo-1iSq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 09:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zUwEBaG9uQ3dYUOCSfxdYyIp/VwIgG+fgAgoqoHEw7s=; b=d4AT0JbsPLRP64BFZPHCsKQZHD
	0+UpjPxk9fNlJvNVLFZoOaicEwh8aDx6uL5A7mzZdnDD7jFOXQOmH8i2EurtKw6Auv6Qcik8v893j
	DG+8uVJ2MaycRFr5fwZFN0OyZoc+M9AS5YXZjUlo2AB+xkor1qBCUDz7JAPBlWYjww/h2Oj3BnjsH
	ROcFOcvnPJpHXxrllQ7IkrETbYhasIIlqF5ax2VOC0JnNl+NjAFs7rH8mpe+WSoCulhMln7VoFeCB
	sOJt81ziJ9BTaBglsmCoDj8/wYVHmRlCR0OfmaRatqFRlMHOHXJz+rQdlEelBb2sisBDsOAuAzM4N
	gwpN2DVw==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78l6-0000000DQBc-0ZFI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 09:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=zUwEBaG9uQ3dYUOCSfxdYyIp/VwIgG+fgAgoqoHEw7s=; 
	b=pCtl85fVKvJ4gT8TC0bbHnVsIG4tjKeAj5ZU70JfKTbYx8dNtGB3xzBNhk17ypp8+h3FPZA3x5V
	n+tFi3zI3+U0SjwkmOEu30E5j1SwEcwNSDxlroMzDOOCLPiXyMEFgG99jEtEJgCu2PSza+KIY6zeN
	HU9GKQ00oh8lIgiM3aW8560cW9QkTHJzLGroXkMq4sOI2pkf/dd2p5wd/ih8HO1ZVx+T1PDuiMEwH
	Vkayki76rrjQRJONtCCllWUjfblnHGFlHGXppTcN4vL51EY4o6fITxtGs6Wta1a0eBBD19EmFHcyy
	hwfrPwGKhqNIp2eM1JDdN4wqrt5d127md5/w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w77qc-002Fdh-2B;
	Mon, 30 Mar 2026 16:46:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 30 Mar 2026 17:46:05 +0900
Date: Mon, 30 Mar 2026 17:46:05 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] crypto: testmgr - Add test vectors for
 authenc(hmac(md5),cbc(aes))
Message-ID: <aco4TfqpfWBZ1UIm@gondor.apana.org.au>
References: <20260303184916.69132-1-olek2@wp.pl>
 <abToanZh-mkEjmJ-@gondor.apana.org.au>
 <c2a3dc2e-8d4a-4a59-ac5a-ca22be705488@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2a3dc2e-8d4a-4a59-ac5a-ca22be705488@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_101808_446887_9EB54BEF 
X-CRM114-Status: UNSURE (   9.77  )
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

On Fri, Mar 27, 2026 at 06:03:48PM +0100, Aleksander Jan Bajkowski wrote:
>
> Checked the crypto tree, and this patch still isn't applied. I've sent
> multiple test vectors, and you're probably referring to a another patch.
> Should I send it again, or will you accept it as is?
> 
> By the way, that's the last one. As of now, all my routers have the missing
> vectors added :)

Thanks I'll put the patch back into the queue.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

