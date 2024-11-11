Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B0AD3ABFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 23:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNS2E7az+Jaci4XovebpTPUnBWAIfINok64yMQczmas=; b=1tBzRiYn3tjUcFiX5SoqzZd15G
	dDTS5sSimflNdF52fYmTEH9MfE6s313uNR2c2Wg4kJgikdcUcryWOyEYtuntTOMnJKPctuCSYiYI4
	nj2Su9IpJ6xUKaIbTmIwcTz/NA0X7+5m35iMQ0KZtN8pGq5OEB5nI9kA8Ff+uGQQExAieDzqkMDYr
	B7obyuUfKSu/ESNqrJiaaT9l0ZofCwyTb9Ns6ICuKfuIEEb7mJI5Mv0pFV5ah5JU8hsUyrU9yPLUk
	BZIDOH3/dAmzErecVyaS+vsmqHtW8mlk7Vh9/nYoqbhj+geSzZc+l88e4MtYKn9DeKONrMntCL1/e
	0nfCOFeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAe7D-00000001eVh-2t9J;
	Mon, 11 Nov 2024 23:46:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAe5R-00000001eM7-1Ars
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 23:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731368682;
	bh=HNS2E7az+Jaci4XovebpTPUnBWAIfINok64yMQczmas=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fagZ1UyqZw1/N50if/vQZLtnLaK3ln1MmlUv3Doq0riO2D2dQX5OxebOos98QQNHD
	 rvj5ZSDctgCE+W+cV4p2XSF04Eq28eVLhoqXjEH7mTpEnr04daecKMy+pkxKl4ciEF
	 tSeUrCkLxTdB26geLvM2hAx4DQrkgYyjp8iLyyRRvlcUrpoga3WClJd8WukQRntxHq
	 4gPqsSMAA7MJKszP7C+a+RH1KT0KyWbAWn4+Z7/5d1ihB25g6YWa6BZ4KxPQhs2KLI
	 FJwQAF8wkZD7J6WUyKAZhUFb9Yme3nUUm0jlD+mEKtrWe4zN1jioQt/zVcb6n0N0rP
	 J4pKkogAUYTxQ==
Received: from [192.168.68.112] (ppp118-210-164-236.adl-adc-lon-bras34.tpg.internode.on.net [118.210.164.236])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 61E676616C;
	Tue, 12 Nov 2024 07:44:41 +0800 (AWST)
Message-ID: <e6cdf774e4a5a59fbce798b05e6f57b11c62f56f.camel@codeconstruct.com.au>
Subject: Re: Pruning obsolete BMC devicetrees
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Andrew Geissler <geissonator@gmail.com>, openbmc
 <openbmc@lists.ozlabs.org>,  Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, linux-arm-kernel
	 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 12 Nov 2024 10:14:38 +1030
In-Reply-To: <c96c7e05-31ca-4145-a8ed-d74a32770011@gmail.com>
References: <b386a9e98412b06b6186ee5dea81ac6a69bc4f8b.camel@codeconstruct.com.au>
	 <c96c7e05-31ca-4145-a8ed-d74a32770011@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_154449_681904_0895DF19 
X-CRM114-Status: GOOD (  15.03  )
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

Hello!

On Mon, 2024-11-11 at 11:25 -0600, Andrew Geissler wrote:
>=20
> On 11/10/2024 10:49 PM, Andrew Jeffery wrote:
> > Hi all, We now have quite a collection of BMC-related devicetrees=20
> > upstream. There's interest in whether we can prune some of them
> > out.
> Thanks for doing this AndrewJ, it's always good to keep things
> cleaned up.
>=20
> > 2018-06-22 876c5d891c9d7442d2734871317bc6480cd9f80e:=20
> > aspeed-bmc-opp-palmetto.dts=20
> I think we're ready to call it good on Palmetto and remove it. I'd
> like=20
> to also remove it from our CI job.

Hmm, so unfortunately for Palmetto it's one of the primary ways to test
AST2400 stuff. Even if we retire it from OpenBMC CI it still has its
imprint in other open source projects such as QEMU. The AST2400 is
still used in some other products such as the Delta AHE50DC; it's
useful to keep things around that can exercise it.

>=20
> > 2019-12-03 53820e00aaa173db268e0288d0407806539b4c3e:=20
> > aspeed-bmc-opp-swift.dts
> Swift can also be removed.

Ack.

> > 2020-03-06 fa09a28ca3e966582d6d92ef1536de360c8b194b:=20
> > aspeed-bmc-opp-zaius.dts
> Unless someone from google disagrees, I would like to also remove
> Zaius=20
> from CI.

I'll wait for some other confirmation on this one.

>=20
> > 2024-08-02 1c8b6faf882de15fd62094e08b2ca5bf7870b767:=20
> > aspeed-bmc-opp-tacoma.dts
> Tacoma can also be removed.

Ack.

Thanks for the response!

Andrew

