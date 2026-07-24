Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA5DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 14:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYZkrkiqIu9xwOG05+WaWrWOYFv6VVQ6YZhJoATWtr4=; b=fPTsmYs0HR/0qFPyZvWA0i6mzi
	dERXYRKpkURZiZxOBLHqKhBmV9Hzl3AOR0lcfex9tnJV7/tsGLnY4gi+hZE9O1JEppyUfQbu+TpcT
	bYEdDS5Va5hylKoDxDS9DivbpXqPqxV9Kjak6uPAgHD8hIcCMV4ERJ2J8/zhMhRuLCkOLnLrkkBwP
	ZhCCdNMj4fLQP5M+fct+lVaF9LiwYakQO7fMjRweUu/+/ypbLb16JzsvB50Vzxe285GsSHWs6/+kH
	barJQFjc+wdeM2UNCVTk28/TUkjJ2h0gVj0TnM2EctSW77SkVnzWoPoDKn01pEfz28Zx/cUJXaOol
	WNnvojWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGh6-0000000GXnX-0IIF;
	Fri, 24 Jul 2026 14:16:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGh5-0000000GXnN-2ESw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 14:16:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8381C600AA;
	Fri, 24 Jul 2026 14:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB921F000E9;
	Fri, 24 Jul 2026 14:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784902566;
	bh=cYZkrkiqIu9xwOG05+WaWrWOYFv6VVQ6YZhJoATWtr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RtBaTWEX6lOVJ34wQyV3FVuL9hL0DpMpAfH1t0GWNbHxgrUNjAHM/qiIp6nEqYHFx
	 XRwgHLo+Q0hFHsnWF+XcaTkURlr/paMdg2Nwc5ZaaTa80iqD2CCTmth4g4ZrBuEU6p
	 bHSFfyTrBIu5dN8Zgw0SlmJW4R2Fsaa61kfS71buwsP36/IIZaU+bIddr7wxMHeRhZ
	 cdQnqlsSBrxyTM2e+5AhbhvRFE24JgdLtl6y08iKeVX22V3BI5xSnKTKMo6UoXdCrs
	 uVQY+YcCqKW/UyQOb5+wqzHq1JbHTFeGn5OxnQ+8Ldg0g8T2Cud+27UOmE2Z3L4TPq
	 Zr6PD3hNDpWJQ==
Date: Fri, 24 Jul 2026 07:14:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <20260724141414.GB1876@sol>
References: <20260724050645.223799-1-ebiggers@kernel.org>
 <2026072410-drained-acts-3502@gregkh>
 <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
 <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
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

On Fri, Jul 24, 2026 at 11:29:30AM +0200, Bartosz Golaszewski wrote:
> It can't be used *accidentally*. It can still be used by in-kernel
> users if you bump its priority via netlink.

dm-verity, fscrypt, fsverity, and blk-crypto-fallback don't support this
driver.  The QCE driver itself has bugs that make it not work with
dm-crypt and IPsec.

That's all regardless of any theoretical tweaking via NETLINK_CRYPTO.

That doesn't leave many upstream kernel features that could even
*theoretically* be using the QCE driver if someone were to do the
NETLINK_CRYPTO thing.  Maybe SMB or kTLS?  (But not with AES-GCM, as the
QCE driver doesn't support AES-GCM.  It would have to be AES-CCM.)

However, over the years it's become extremely clear that virtually no
one actually uses NETLINK_CRYPTO to tweak the algorithm priorities.

It's part of the excessive "flexibility" of the crypto framework that is
just not used in practice.  Users actually just use the defaults.

And with the defaults QCE is *never* used.

So I think the NETLINK_CRYPTO thing is a red herring.  There's just no
credible upstream use case justifying this driver's retention.

- Eric

