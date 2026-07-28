Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25AEC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKw7caf9g11sYWC9aIB1I05YdyImrElt0NfZF3BzFj8=; b=OrdwMaDBgDA2NUVz5xdZ4vfP2t
	Zh0maeLrNiKtiXIV5JiLpgGCzn1TJJEcSRWpgr+UEhCttMBLpMSCgjjqkUIUSlnDUuyWIRrrEUa3n
	UHja8iEVckvm95ftt4x57zJVT5bK5v4ygs5vT+XhvtBUN+r8qLPFmsv+sia7uER5NWprBlnh/DyfB
	I0fhw+hg5YAnSWNYZZIU1Ok9ax/y+1qGosVWlH9ZdadHCEaKXDCjD5ho2dzU2TdSt15JzYx7ls+5N
	/g2C2/iAe5FRXCUXKuqKWJE3DlFrPhr7HvInPoKdYgW03+iD+Im4yrGfBm3SoLwudZWCMDbFtKJDt
	70O2Gesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojdl-00000005d8z-0oNP;
	Tue, 28 Jul 2026 15:22:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojdk-00000005d8j-0MJM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:22:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A0A4600FC;
	Tue, 28 Jul 2026 15:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A752B1F000E9;
	Tue, 28 Jul 2026 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785252163;
	bh=yKw7caf9g11sYWC9aIB1I05YdyImrElt0NfZF3BzFj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dWB0j1zSVg8/OAqbDrwzmbMbz6lsH8A9/amYwRkbuphjXxwQqtaMF4YjUMbb96OBX
	 HrINd4z3xSGqzQL49Am1SiSjc/aSOWtGY6AJUcDB5EwYsRs6yDMctV3jcwVHM1z/sT
	 rnqS2HuTC5aOnNbR4735yPignpu+eottmQuRLweUO9xuptjqsePGTWXUsjs0PNAXnY
	 a4XQHgqU53/MzKyJI5yvkUI5ipa+mWSq8lgeoE23r+yWx+ux+BA70KsuTMr4ZqcWSs
	 oAyYEvhgnmk33llNIcSl2mOtRHfXEPS5ftdNT+sXiJqk6rxL839bmzzxaIybPoOu4x
	 +wrjQ+udy27qw==
Date: Tue, 28 Jul 2026 08:22:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <20260728152241.GA4281@quark>
References: <2026072410-drained-acts-3502@gregkh>
 <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
 <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh>
 <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh>
 <20260724155144.GA2032@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724155144.GA2032@sol>
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

On Fri, Jul 24, 2026 at 08:51:44AM -0700, Eric Biggers wrote:
> It is consuming a lot of the community's time to help maintain,
> including dealing with LLM-found bugs, with no clear benefit to anyone.
> Even considering *just today* we can see someone sent a bug fix:
> https://lore.kernel.org/linux-crypto/20260724081537.191992-2-thorsten.blum@linux.dev/

Another example:
https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/

> It definitely *was* causing problems before it was disabled via the
> crypto priority system (which made it unused in the kernel) and dropped
> it from AF_ALG (which removed most of the unprivileged attack surface).
> When anyone accidentally used it, it caused at least a huge performance
> problem, and sometimes other problems too like filesystem hangs.  It was
> an issue for years.

This actually seems to have been an overly-optimistic characterization!
As per
https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
this driver drains the battery on every system with the module loaded,
even when no crypto requests are actually sent to it.

- Eric

