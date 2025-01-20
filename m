Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB7FC02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUw9eZbjkcClj9EijikMmOy2CP4Gtz8XsHRDdZ846W8=; b=q7AGc6G1z2INtZQZ/9lytGFEHZ
	iMoPST0lvb3PSHGfrsZIk9AIMBDfm6WJUbPkxvoXOVbzIwqyCnSeh7xgwWM1ahU0/mXmTDn+wGMu+
	TQdErcFerAAjC4lupeuY7rLbGxocmCOkZ8OkKt3zU9GR1z3r8CQm5izQG4py9HKhAksmfsMRpLyc6
	ay8gxH8hzXEzC4WUX91WG6wndCkFUPMX/HByK6zGTeWFj8AMge92vKFDBpqaeFoylH9jlrjdJYafZ
	a8p3V06BGkBcppZPws4h08Zb9vQGpTt6enGdstIja11VVYe4W+fiGyWgDGBPcWFpRfoWz7Ct2RHmM
	cOpBtWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoe0-00000005Hp9-39UH;
	Mon, 20 Jan 2025 10:04:32 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoab-00000005Gxp-46Hy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 10:01:04 +0000
X-QQ-mid: Yeas4t1737367144t093t62445
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [115.197.136.137])
X-QQ-SSF: 0000000000000000000000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 17542201142139390390
To: "'Russell King \(Oracle\)'" <linux@armlinux.org.uk>
Cc: "'Andrew Lunn'" <andrew@lunn.ch>,
	"'Heiner Kallweit'" <hkallweit1@gmail.com>,
	<mengyuanlou@net-swift.com>,
	"'Alexandre Torgue'" <alexandre.torgue@foss.st.com>,
	"'Andrew Lunn'" <andrew+netdev@lunn.ch>,
	"'Bryan Whitehead'" <bryan.whitehead@microchip.com>,
	"'David S. Miller'" <davem@davemloft.net>,
	"'Eric Dumazet'" <edumazet@google.com>,
	"'Jakub Kicinski'" <kuba@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	"'Marcin Wojtas'" <marcin.s.wojtas@gmail.com>,
	"'Maxime Coquelin'" <mcoquelin.stm32@gmail.com>,
	<netdev@vger.kernel.org>,
	"'Paolo Abeni'" <pabeni@redhat.com>,
	<UNGLinuxDriver@microchip.com>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk> <06d301db68bd$b59d3c90$20d7b5b0$@trustnetic.com> <Z4odUIWmYb8TelZS@shell.armlinux.org.uk> <06dc01db68c8$f5853fa0$e08fbee0$@trustnetic.com> <Z4pL3Mn6Qe7O45D7@shell.armlinux.org.uk> <073a01db6add$d308af40$791a0dc0$@trustnetic.com> <Z44dOlfRN5FmHcdS@shell.armlinux.org.uk>
In-Reply-To: <Z44dOlfRN5FmHcdS@shell.armlinux.org.uk>
Subject: RE: [PATCH net-next 0/9] net: add phylink managed EEE support
Date: Mon, 20 Jan 2025 17:59:03 +0800
Message-ID: <077f01db6b21$ef6e07e0$ce4a17a0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQJuuL6961zeRYLpn6fcQniPsxo8VAIOTZqlAVk2sswCDJNSGAGgOtUSAjt5IngCKL/5j7GdDUgQ
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N+B8S2AmgbnC0A5D/POdhLj8Ih/HB5chyhpZuFexScquJAnrabvzKM2C
	dKrEPpqSt2S/zbfWFb7uqgkZ80ng3O3/2S5IbBt8NXxB4Nj8NOxiBkqqtSxkhTIkx2N1Yxn
	rIpKFtlbKjQKazHrjQDq5rVstzdQPlKDzrNElZbIadO791e+hzYtRbqSYZx60e6F7+UELz3
	ycMURkjSxtcgQBpeRhwgvDCSoz2LEvWagT6ckeaIxQ7w5uZDUMg04dNdFE7iqBdBLTbj22T
	Ex082Hz5iE+xXENvVlXAWNneTpyFvZAxl4oCOtrUuQleC4v6iU/48ZKSDRzlXTRfYMnLhV5
	uTj6eCtStlkNl/4MAhuwZ6ULccwcvyp5j/IYmM12wlWpCG8BuHy9AUo2R14POFnt129IM3T
	Mrqmvi+H82XE5o5hLWrsoKGThsaZdurN6Q8Zi4FmtqV+QjvK0ufbaO/h/6B58RFGq3wv6as
	UdLhnq/f2YUBzxscc2QWis4Itnhti9KbXxTodikAQFplU4IhwXAzCwHVsduPVKHvOMnqztq
	1nuaZ+vxI7U+Rh1kK3GVPkvgtYJFMQbQy+dJvsFFknbjYovNQNEgwO/XRLyn84vwtZ6oDsr
	bpWHeelk0olITZOXen+Y+2Zk2EPgGZxxAQd2l4wUjKAjrPqBiWQ12y44y6JFqC4Bor5qts4
	901zNwtUfayXcCtdT7ScbqJEDViWcjahatW3O6nvCTrhYHx5LKgrhmLkOlUdqvt+4/WA884
	gs2FKR+YwhO7qhmzk9yHtO48zLcXU3ea1GtNk6YMEcukZOTMLWwXj/mTbJQUiAvbXewNqIE
	7jaDCTdNOXiweV6eOKM9o/7wSdBmjRFIx9FD0W3PDDGhlqQ7bqGgPu0F7RFv8SJXWKAgWzu
	FKt8tSAkbkpc4pQ6wpn6fJYacMJUM8vCnvwMJnLTW2utDv5usRx1R0p4VDhFwxr4xkBL9bt
	p2gJR4mxMyAsL8pw4PjzPo1feMygSafF0j2Wk8RfUPPwggCuemJz/lnItKx1p+NH75pZ6XV
	P10y3GYQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_020102_877724_21E36033 
X-CRM114-Status: GOOD (  11.28  )
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

> > > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > > index 66eea3f963d3..56d411bb2547 100644
> > > --- a/drivers/net/phy/phylink.c
> > > +++ b/drivers/net/phy/phylink.c
> > > @@ -2268,7 +2268,11 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
> > >  	/* Explicitly configure whether the PHY is allowed to stop it's
> > >  	 * receive clock.
> > >  	 */
> > > -	return phy_eee_rx_clock_stop(phy, pl->config->eee_rx_clk_stop_enable);
> > > +	ret = phy_eee_rx_clock_stop(phy, pl->config->eee_rx_clk_stop_enable);
> > > +	if (ret == -EOPNOTSUPP)
> > > +		ret = 0;
> > > +
> > > +	return ret;
> > >  }
> > >
> > >  static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
> >
> > Test pass.
> > Thanks.
> 
> Thanks, I guess that's a tested-by then?

Yes, for this patch,

Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>


