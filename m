Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7532FD0636
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4cmoup3FIXPRIl6fbPgnHbI6pJNN7pfNFC8X0IdKRM=; b=xK/+jLNR6fRam3+Pqo0kRAXeXH
	i+fceOIZZzkU2dXHy00ROiRRW5TG6+BZ9YnRdLt1hIZ2ga2JwU6wDs4evzIBRP+DaNyOlCM+w0Mw1
	usgSov2d32QqxXuI12rQ3IVBh+uaSsx8PfQFvHanqg6Prv3RxpVb1uf+8LEvQB+wxzTEnIN/KoNU5
	ijwv1qs0OyBQxF2kJA4uJot1u1vOlRjMK4NNe5XqRgXUyRwcHL5Jd1ap9uUaHRHqjEj1DYJhxpy72
	5uURT+AJeueOYRyTI/vCqjIiO5xhpgmQU8LeFEOK2NLTcpP0RIFCwoXQoccdtffFGKVMQGZx47Pd5
	HluJyW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Dee-0000000AzMS-2Vn7;
	Wed, 11 Mar 2026 07:06:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ded-0000000AzL5-1Wmu;
	Wed, 11 Mar 2026 07:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+4cmoup3FIXPRIl6fbPgnHbI6pJNN7pfNFC8X0IdKRM=; b=HnVQnMV8fWdmpubJpuRRlD/ahV
	rRN6gqYoeXHj2MSRauKF1hI2G5t552/JXyXS366KTPb88zyV97Aho9vhYwfB23E3sNMcRFa9Q/ESD
	+nLb0YRfrkPMIDQxI/bY+KaW3wr85xiEr9nRa9mdFaZ+X9WU7t8Sg3BTNBOJ4ur7pxa1jyczmPT84
	L98V4zysKd2OA8hB9adLJQmkysRs1EzRN5QKoJWmOrzdfNSiRUpFB+P1jt0ZJKThpOmAuwuw5txYx
	W8d674ctS/znfF0N7KtxFmh0NqjVEjwn/ROfxgH0rXLbJmK+ezV4Ojdf1lOYIJdLThGK9T9dcfTYA
	f9i9R1nw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DeZ-0000000GCfW-1MRG;
	Wed, 11 Mar 2026 07:06:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7660940ADC;
	Wed, 11 Mar 2026 07:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B573EC4CEF7;
	Wed, 11 Mar 2026 07:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773212805;
	bh=RR9Qvte44D15VS4RtzccJeT1Fg0fLFhuLfeFArrffZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUOLBM+tf+Xmbt4WSJJkpYCsoDglyB9XUWNK0x+zAm8AzvWVlSG6KBa41S0GrubbI
	 ZoQEs3UNBN2LOcYgEJ6duyxKpBwLRZSWELKfr9B6JshcfZLRBatSuaNYTSxGZyhzsU
	 bxuv3gMR4x0ml1VaUAGr5vrWLWForGzRwzofRA0Q=
Date: Wed, 11 Mar 2026 08:06:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
	m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, pure.logic@nexus-software.ie,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	kernel@pengutronix.de, kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com, hverkuil+cisco@kernel.org,
	ribalda@chromium.org, straube.linux@gmail.com, lukagejak5@gmail.com,
	ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org,
	mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 1/7] staging: greybus: simplify cleanup using __free
Message-ID: <2026031100-old-retry-ee2c@gregkh>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-2-sanjayembedded@gmail.com>
 <abCIBPZzZBfMoOtm@ashevche-desk.local>
 <abEQ6HA0CGGCyV1B@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abEQ6HA0CGGCyV1B@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_070647_613407_3919FE4B 
X-CRM114-Status: GOOD (  10.43  )
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

On Wed, Mar 11, 2026 at 09:51:20AM +0300, Dan Carpenter wrote:
> On Tue, Mar 10, 2026 at 11:07:16PM +0200, Andy Shevchenko wrote:
> > To complete this, one may add a prerequisite to use guard()() first.
> > 
> 
> I don't think we're encouraging people to re-write existing staging
> code to use cleanup.h magic...  It's unclear if I have to review these
> patches or if they're auto NAKed because we're not doing the conversions.

I've already rejected them, we don't want this type of changes in
staging at this point in time.

thanks,

greg k-h

