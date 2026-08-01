Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2D5C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIxQo1lwuRObPNtRG3pl2vqbuRxkzNAJrAeSuo6abuo=; b=Kp4WVMpP4Ig7qNw0xWt1bufF0v
	Rz/DTq4SaeYi6o8DCCBn8cuZ5dK3SsgfTvOMm7ppfcTm8DN+x29zQDkuZE9bINzFXYhGjtfKvwh+R
	wayq423M2HJM2YVNsQWslvxtqLe2iJQLfKH78fvH2ojGIbrlQNfYgp6owgmn1wt/2pJQHZ3oS9GbZ
	/SHXhoJKyC2/0TSkN1euhqIB3D6c4K9evliv3SCjihdI8dv9q0A1HALxqA4/EG+E7huBs6pwzrxrq
	2besZijBzJl6BI6iD/jqPG6fIUDiMpcKKivrRdnPQFpZGutgG73r7M1QcTyTeIGTLAvT6NYhMKoQd
	NUJrKG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCa8-0000000ErWg-1iBG;
	Sat, 01 Aug 2026 16:29:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCa6-0000000ErWR-433T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 16:29:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BBE9408B0;
	Sat,  1 Aug 2026 16:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC54E1F00AC4;
	Sat,  1 Aug 2026 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785601742;
	bh=cIxQo1lwuRObPNtRG3pl2vqbuRxkzNAJrAeSuo6abuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fDmr00/Z6DZO1Gucn7BdNU9xHWsTUnxAds/CIc9rPQ7jV6+qXyp9p0ZgJDDYXfqui
	 3EeYsG6/9pZz3MngkjJ6ZXiNwFnptKQ637gPc0Hjgtvd9nySeTWEirxdOoKf0iqdwe
	 C8jlzCiiJ4LNc5imE/ZOjoPcPAchgVuGcYI/btpVooLnbolHCQLh+xL2leRm0QW3Ih
	 jACJnwd0PU5buXbHKlx5wdTa280vBY/LEsLWWJGzr7gpmB9IcvoIBuIF5opwim8Pde
	 1gmFZK/m1AwMuRCGUJQ23qY/kr5Z3LB1nYgOLgV7beVAvKy10aMW56AiUZIs7Eg73Q
	 gHCHgajqvFNvg==
Date: Sat, 1 Aug 2026 09:29:00 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
Message-ID: <20260801162900.GA2021@quark>
References: <20260731050838.158825-1-ebiggers@kernel.org>
 <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
 <3ba57269-3305-4d80-b3f2-aa82fa59b59d@gmail.com>
 <b9b655a9-c683-4c4e-ba0d-f98577dd2912@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9b655a9-c683-4c4e-ba0d-f98577dd2912@kernel.org>
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

On Sat, Aug 01, 2026 at 11:18:46AM +0200, Krzysztof Kozlowski wrote:
> On 31/07/2026 20:31, Demi Marie Obenour wrote:
> > On 7/31/26 05:06, Krzysztof Kozlowski wrote:
> >> On 31/07/2026 07:08, Eric Biggers wrote:
> >>> None of the algorithms the QCE driver registers with the crypto API are
> >>> even close to being useful.  They're massively outperformed by the
> >>
> >> The amount of patches you send towards removal of QCE is really
> >> stunning. Or rather worrying. This is like third approach or so.
> >>
> >> Your previous approaches received valid feedback, including even fixes
> >> and committment of new maintainer.
> >>
> >> But you even complained that it does receive fixes! [1]
> >>
> >> We removed the driver temporarily from typical configurations, so no one
> >> will be affected, by whatever is found now and not yet fixed. Still not
> >> enough! For you this was reason to remove the driver (AGAIN!) [2]
> > 
> > A stub driver needs to be added for power management reasons.  It turns
> > out that if there is no driver, power consumption is very high.
> > 
> >> This is beyond comprehension and very unpleasant, because you actively
> >> work against the community with this approach.
> > 
> > I trust that Bartosz can fix the driver with enough work.  However,
> > even if the QCE driver had never had a single bug, it would still not
> > be worth using.  Its performance is so poor that one should always
> > use CPU-based crypto instead.  In the default configuration, that is
> > in fact what happens.
> > 
> > The QCE's algorithm implementations only provide a way people can
> > misconfigure their systems and ruin their performance.  There are
> > debug options that also severely harm performance, but they have
> > legitimate uses during development.  The current QCE driver doesn't.
> > 
> > I have no problem with a driver for the QCE that does something actually
> > useful.  While there are disagreements about whether restricted media
> > processing is a feature or an anti-feature, my view is that it is
> > better for it to be implemented upstream than in an out-of-tree driver.
> > However, the driver as it currently exists does not implement this.
> > 
> > I expect that such a driver would not use the crypto API at all.
> > Instead, I suspect it would use dmabufs for source and destination
> > buffers and integrate with the secure world firmware in some way.
> > That means that the driver doesn't belong under drivers/crypto.
> > 
> > These are the reasons I submitted a patch to mark the driver as BROKEN,
> > which Herbert Xu has since accepted.
> 
> And Bartosz and other people committed to work on this by improving,
> fixing and in the long term providing you with the actual important user
> of this. All this was already said.
> 
> And then after having all these discussions Eric sends AGAIN patch to
> remove the driver. How many times this will have to be discussed the
> same way? If we now reach agreement the driver stays, next month again
> there will be a patch to remove it? And then one more month again?
> 
> The driver is marked as BROKEN, thus absolutely NO ONE is affected by
> any issues the driver has.
> 
> It's some personal vendetta to keep coming after that - unimportant now
> - driver.

Well, there was also feedback that BROKEN drivers should not stay in the
tree and instead just be removed.  So I was considering that feedback
too, as well as the results of additional testing and review of this
driver, including evidence that the driver performs even worse than
thought and is actually getting even worse; the performance seems
irredeemable.  As for proposing the stub driver, that is addressing the
power management issue that was mentioned on the other thread.

Anyway, it sounds like you support it being BROKEN.  Okay, but again, as
Greg mentioned
(https://lore.kernel.org/linux-crypto/2026071312-uncover-refining-8cac@gregkh/)
it is awkward to have BROKEN stuff in the tree since it cannot even be
built.  I'm not sure we can have it both ways!

- Eric

