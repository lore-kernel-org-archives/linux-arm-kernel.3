Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF61F589AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImGXxTVYjTzC5+KMI/sxy/q4lpK9EKCgYwT08oZOWrA=; b=NagJDa0uCcM4PKOaIBYXLLTJUz
	wwL6mASYD2udK8hME4h6Oaoxr0wfV8buOf4WgL2dK5QsuaF+qLwzNBMYAw99mDzi2ofWmRvnOEa/u
	K9qAjLGEowt+8tpHsRPBzWl137+owR++LpqXk/iz7xRC/OIAz8AJQhSX0ca1akTCv7nAS80e8AdCc
	otJQSoKEva9PvAdIX9OfCFlzHseVN9Fyxs5BTU+lbYUe2SYb4bYJCCSvTz1Xjc6xc3/wK+jyG778i
	1UWzA6Ugnc/IhF+l/NGrV53i5SLbrMXxSzu7Jn6zg5HujJJV836i86GE1H6WLmSuSmBk8xI3DclOZ
	WWhq75Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFswl-0000000BbAA-1Mq4;
	Thu, 23 Apr 2026 12:14:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFswg-0000000Bb8U-3Qq3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ImGXxTVYjTzC5+KMI/sxy/q4lpK9EKCgYwT08oZOWrA=; b=e8wd9O+hjho6+Ng3U0m1q4Z3ii
	c5JFSMRFTwYHnKIW3taM06quURrlL/mx3mqgeKVam6vecldKT2KJlvFZojBYsvT4x+btSPoXgpFYR
	gxKpJQU2tFXZlW8483PYTidF7i2xanCNl0IV7dkzaYRY7WuiIaVKinAJBhJUA++57hck=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wFswY-00HEv8-AK; Thu, 23 Apr 2026 14:14:06 +0200
Date: Thu, 23 Apr 2026 14:14:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq' ->
 'tx_underflow_irq'
Message-ID: <4b90a06a-4e67-4c8e-9749-1b48e9c32c13@lunn.ch>
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
 <20260421115008.2690541-1-j.raczynski@samsung.com>
 <7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
 <aeiJ3zr4WJAm1UCk@AMDC4622.eu.corp.samsungelectronics.net>
 <f1d51362-ca8f-481a-b9c1-400ab6422686@lunn.ch>
 <aejYCYObZyFPpLat@AMDC4622.eu.corp.samsungelectronics.net>
 <52b06f0a-8283-4903-9d8a-2bbdf637dd5d@lunn.ch>
 <aenhiHCZge2dMBFw@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aenhiHCZge2dMBFw@AMDC4622.eu.corp.samsungelectronics.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_051414_858406_F281BF05 
X-CRM114-Status: UNSURE (   7.19  )
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

> Question is whether this should then remain that way forever?
> And was it really part of some ABI if no one noticed?

Hard to say. I could also be that people did notice, but after it got
released in a kernel, which makes it ABI. It can be very hard to fix
these issues, if you don't catch them in -rcX kernels.

The other patches in this series look O.K, please drop this one and
repost once net-next is open.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

      Andrew

