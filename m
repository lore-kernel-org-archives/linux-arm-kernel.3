Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7401ACD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqAODZTseDy2b3wTVMd4RwN7DRzwrz661jj/FBjPqhw=; b=3q5b4zsRFhiABPeB9kJnX+lDy5
	Eovp6remd9c2w0q/+I52lgLChDPcylxZsUn6cWPxmEUwhaVhpKujrtOom1wuauYJ5IEzgjsVQGR0/
	4FNs7u6T0nz/JrRttFIFAPzUD5pr146Mj2GE1m3kOLsjmfNUxeMxKQYO+uG/xGctBRuUNa4rgyeFH
	2fQ7igznqmNuNrPDA0It/dZEK5fO8f8VV+7zc7+lNW9qoMaVPEGwiX5nYKxNd368ww4llMw5BMxJE
	HVDnj2d49bF6oEeC2ZOrWdfCnBDhZgHh4jz8JrxCIiS781wSp0BwlVmNPPSchaOBaGMoOVTq0TJzA
	ztPowFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPM4P-00000001wvO-1NF8;
	Tue, 19 May 2026 15:09:21 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPM4K-00000001wmr-0v7v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:09:19 +0000
Date: Tue, 19 May 2026 17:08:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779203328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rqAODZTseDy2b3wTVMd4RwN7DRzwrz661jj/FBjPqhw=;
	b=IzpdKzfnSvUjR2XRcC+CIJrKvzmIuzE4S6YOpTBRE/1Qia6QepD4RLaKPIvLQFm3EXrbM7
	uXHnG5b2yxr1SPEDSj1XNF+P7vnfWeg6zzM1QunqZYfjoUbT5emBhWpTARwUH7upZT+lKP
	uLlEfUCcPGi0B9nTgcZrXW5i7V6LuBc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] crypto: Use named initializers for struct
 i2c_device_id
Message-ID: <agx8-_ZCrC4-enwR@linux.dev>
References: <20260519141033.1586036-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519141033.1586036-2-u.kleine-koenig@baylibre.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_080916_860190_2D8BAB29 
X-CRM114-Status: GOOD (  10.86  )
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

Hi Uwe,

On Tue, May 19, 2026 at 04:10:33PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

This part has changed recently, and your patch no longer applies. Please
see linux-next or Herbert's tree for the latest version.

atmel_sha204a_id[] now uses .driver_data, and atmel_ecc_id[] has been
extended by another entry.

Thanks,
Thorsten

