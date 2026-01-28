Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E00D46C0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 22:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kL5xR/IwwRggd+tjtkDqeU/lLMEuwjvUemYV4fI7oXs=; b=ZTGj35fJTmCtUUnjz1Kudaz3XQ
	LawvVGwoubvYrrt6GnpRXuO5OIBXmecNGOvQC7yfRNUILX7CSYXSBg3nR5qQTriJ33AQ/UuAKvbl6
	8HQX2I3Ld4Nw+fmDwyZHXH2qU2EcQvRWHJclIhvC8eReGrvO3DmFOe2mJFzaYeC1Se+73wVAKujdY
	VqIVsGP9m9M1rPQjUun8+6b42wM/cbsYg/Yi3thXFfs1ofS80Kd4vYd5YN7h9erW+Ussk+KHYWYox
	fWrTQoe4YuieOuVQTyqyTko0opDX62vy1wgC6l2m4OGWgLZzLi1ppkp/PXmpdx9xaGBLQiZ3TL4jL
	X19HP4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDat-0000000Grlk-1w2q;
	Wed, 28 Jan 2026 22:00:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDaq-0000000Grkz-0Reg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 22:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=kL5xR/IwwRggd+tjtkDqeU/lLMEuwjvUemYV4fI7oXs=; b=Qk
	KP87rQ5pEIGipEENjVa7jpd7nimjSv10d81KWctU1peddGibgGy0hDFtj+JQ96J1yhjQdkuXHBfc8
	+ktcvBVsd/jddvpo23l8DZXZ1ju7ECMdsxbUVmtkhvAkqQnX9hnYvR9bY/HPuSiGXvOgl/3G6dj65
	wJAGA0NlL/N8/J4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vlDal-005HgV-JZ; Wed, 28 Jan 2026 23:00:51 +0100
Date: Wed, 28 Jan 2026 23:00:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?Q?=C5=81ukasz?= Majewski <lukasz.majewski@mailbox.org>
Cc: Jakub Kicinski <kuba@kernel.org>, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, horms@kernel.org, shawnguo@kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, wahrenst@gmx.net,
	pabeni@redhat.com, davem@davemloft.net, netdev@vger.kernel.org,
	richardcochran@gmail.com, edumazet@google.com,
	andrew+netdev@lunn.ch, robh@kernel.org, krzk+dt@kernel.org
Subject: Re: [net-next,v20,2/7] net: mtip: The L2 switch driver for imx287
Message-ID: <ed0e1af1-0210-4461-8939-3e4e35d74dae@lunn.ch>
References: <20260126103400.1683125-3-lukasz.majewski@mailbox.org>
 <20260128022549.4151341-1-kuba@kernel.org>
 <20260128224125.246bcf41@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128224125.246bcf41@wsk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_140056_969331_C2212F4B 
X-CRM114-Status: GOOD (  10.04  )
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

On Wed, Jan 28, 2026 at 10:41:25PM +0100, Łukasz Majewski wrote:
> Hi Jakub,
> 
> > This is an AI-generated review
> 
> AI is going to take the "Maintainer's" job :D

We had a bit of a discussion about this.

Our observations so far is that AI finds different sorts of issues,
which human reviewer often don't spot. It also does get things wrong,
so we spend some time sanity checking its reports. So overall, it
might actually increase the workload, but also increase the quality of
the code which gets committed.

	Andrew

