Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A167606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bqrzlLPW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IflFzQft
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FugUTfP6os2SMkrCz7l/ffuyz7L5QQqtjSQ2DNFJmTo=; b=bqrzlLPWh43z7EeEaDDZlTVIgk
	OEXKxUADdXxnK/9odBoM5MjFnkhY05omHhpCRdYUV6N6gAhe36GBeu6YegripdwZmT46YpIZw/r+z
	VR9DAxqQsFE/ApfljmQCFQHHOSuS4W8BuM2p1TvU66p36MFTb7CvquF+Vndr5/ExIjR0KUqqNB0uU
	2gh/cdr6iW/PB1Cfuk0Eb3ZEoA3Bxl+F1ovDM4YLIaau5DMb2EJMBXdieeuy+lMWaoSzkFlNI33bw
	HoXYXWBeX7Y3z4kheVOXyFdVkbu3WIbn0GTrDldkrtxi12qot2nLHYyBAKvWIq6xWRl5UMxHgyKy7
	nuCJbIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxx1-0000000ElR3-2Zdh;
	Thu, 22 Oct 2026 18:55:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxwy-0000000ElQf-3l9E
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 18:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FugUTfP6os2SMkrCz7l/ffuyz7L5QQqtjSQ2DNFJmTo=; b=IflFzQft771bUg5LULtkAIpL2P
	jKw533DoY7qA8tH8vz6yK8vu6yMmDRo6F5zKwsvqOr8nmIlF5dLhcCETz/FwIyRQArCgDmxIc0dcm
	9T7R/iaYEzmn186XvydIAFk7DKscknvF3QhW64tBzLWepF1yyzbMlTvq5GQnGqLjCIqnOyF08Id4Q
	/KG5o1NGW6VwiRmpckWqZKXPwC5LAgqG41ry2Br346K8T0IhTa8Jt19lusY8Uo3OO9EpF5Kf8Z2u9
	xlFKGlogQipcQw6TIJLb7jYfJ5qC8HWSVR5xtOG2kSSPs5CK7Kq127DuE/LuKM5a0bXn8urxsWnEe
	C4WCcAlg==;
Received: from elvis.franken.de ([193.175.24.41])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxvj-00000007mEp-1iE7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:55:39 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xJxva-00029b-00; Thu, 22 Oct 2026 20:54:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 8312BC0AA8; Thu, 22 Oct 2026 20:51:45 +0200 (CEST)
Date: Thu, 22 Oct 2026 20:51:45 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Message-ID: <atpbQV_qEoLyAG2J@alpha.franken.de>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
 <as44ROCHy-WeMdIZ@ashevche-desk.local>
 <atjBsoY8mjGw9fQ8@alpha.franken.de>
 <atjbpKxrW7x7Ohpq@ashevche-desk.local>
 <atjfOrjsxnKe80zh@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atjfOrjsxnKe80zh@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_195423_840570_AFA95B71 
X-CRM114-Status: GOOD (  23.85  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 06:50:18PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 06:35:06PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 21, 2026 at 03:44:18PM +0200, Thomas Bogendoerfer wrote:
> > > On Tue, Oct 13, 2026 at 04:55:16PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> > > > > On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> said:
> > > > > > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
> 
> ...
> 
> > > > > > Bart, anything needs to be done for this series to go in?
> > > > > 
> > > > > We don't have Acks from MIPS maintainers. :(
> > > > 
> > > > Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
> > > > the changes, please?
> > > 
> > > sorry, I was on vacation.
> > 
> > No problem, we now have more time :-)
> > 
> > > I'm fine with the changes, but I'm not, if they still apply cleanly...
> > 
> > Can you provide your formal Acked-by?
> 
> Maybe I misunderstood you, but FWIW I have applied it on top of today's Linux
> Next and there is no conflicts.

ok good, I probably mixed things up :-/

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

