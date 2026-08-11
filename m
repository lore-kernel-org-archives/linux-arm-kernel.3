Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E21AC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9QlztnxejbfKRY0mfisHNxVxHHn4/MKJ3d/oh856hc=; b=kuLpihMTJsJ2dWAE+9bfkI0VV4
	iDKR10cnuqTM2LqW6RvvEXIU+57q9YlRCQu1qHUmqFGGmGpCdOgGfjDDtZKSQVI2A7PcAil2k/yXf
	4fO+4TbAd+19B2W5mGHUi/cI7eRin60Y6G2zhKRXyK83rmo3uWhJ8pXN/AnAbr2VgVy+iVFHWtNJI
	AhblxgXVp8Ibb4rp7OUtqGH0rtQzP7/gJMWmA4eGAE6aOVdVSsg1lCohfU9Tv1syBmutwd8TRvEwA
	SdTc8aTmN1C0R3Vo9WyhBwX9AV5Oon3NXDVQYy/lnQlvMakKeOOpG6bQFqCW6RgOKyN1h+Ynvt6Ex
	x7/xFbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmGp-0000000E4qN-1JMV;
	Tue, 11 Aug 2026 13:11:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmGn-0000000E4po-0lDz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=h9QlztnxejbfKRY0mfisHNxVxHHn4/MKJ3d/oh856hc=; b=g4
	JwAwF82nbiPHyVsIeAVfounly4b1/Ev3pQFk0f+8Kl+AWlDBS5hW3XLMVISpKgm/MjiZYap7iccJK
	/qVFgud/zLjpiaVdopSasFsV/kosLsh+54hl9PT95/j5Po2bhwGfJbemaXO732pw6qW8JEfuElVpL
	pAjzpSAnjaRqiHM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wtmGd-00H5jt-J3; Tue, 11 Aug 2026 15:11:43 +0200
Date: Tue, 11 Aug 2026 15:11:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: David Summers <kirkwood@davidjohnsummers.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Marvell Kirkwood and the linux 7.1.5 kernel
Message-ID: <ac738564-b9e0-45b5-aff1-2071df8b18b7@lunn.ch>
References: <5cb9b531-29c3-4928-aba6-5f14560e046f@davidjohnsummers.uk>
 <abec4a63-11cd-4814-ae12-f1c89d07e9ad@app.fastmail.com>
 <1d3c1fcf-40b5-4d37-bc73-e84760bebd2c@davidjohnsummers.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d3c1fcf-40b5-4d37-bc73-e84760bebd2c@davidjohnsummers.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_061153_217656_417B4D44 
X-CRM114-Status: GOOD (  11.49  )
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

> I'll try this when I get back on the machine  - am currently stuck in the
> initramfs, and having problems bringing the HDD up (think the initramfs
> doesn't have the module it needs to access hdd via the kirkwood CPU, I
> though I'd made this be always in the kernel rather than a module ... but
> its not working).

mvebu_v5_defconfig has everything needed to get the disk working, at
least with with ext3/4. So anything which is Y in mvebu_v5_defconfig
but M in your configuration you should take a closer look at.

	Andrew

