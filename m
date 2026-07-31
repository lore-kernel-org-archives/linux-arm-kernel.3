Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DED6C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77G49YQpBUvEnOvrM605Fie9t3iRyjf5tMxXuwe9XDE=; b=UFgUWXrJdUuzb2115Um4i+b3rJ
	wty+9mm+cK3ewGhsm5i1J2ak0y0kD+JZMcM9Xr8eiCVfPqX8zG77W3AysLd7nUfEerib0ZPvvq2W2
	dUlHTMiw4PtJSnbDomSGiss/FcmS/Ao8ojP7rL4+gz3yCS/Sp7/TGpiGdWeMRO0iTF151He+X/3Yl
	iRmJpLSOg04WYabvjGEWUYiV86bCQvoan+6QMe3QTO53+GYVAK1Y3/yciyg3rMTGUBGHaoHisjOzY
	n0OeYcTp/RGwDY8FW+fuPkAovyfn3vavWTYeFC6+9GMh2UXUFfhmkrSIqlIrAC8M4hI9MCv/shlkj
	pDyIQvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpk4H-0000000CGmm-41hu;
	Fri, 31 Jul 2026 10:02:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpk4H-0000000CGme-10rE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 10:02:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7168B6004E;
	Fri, 31 Jul 2026 10:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA4F1F000E9;
	Fri, 31 Jul 2026 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785492136;
	bh=77G49YQpBUvEnOvrM605Fie9t3iRyjf5tMxXuwe9XDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R5M2BKEKtAdUQ+F6ksjbzVhCWpjCShK2W+WbD8gJpxGMQpF9JdWJH1s96jIY8dJ5f
	 yaD+cKvQlw4K0J9uyig7Qk/lZNm1d9SNAe2Bb+tcKbdpF0Xf0Wg3tyGmABvoP6C3Sb
	 +7oVh2sF6e554RrUp576TR/33hEXP1rQiaX0r1f0RJj5z9c1wIuwx3cydI4P8VXRU/
	 Er/V8H48fjzOMRsHqqjQpud71PieY7rcCk2nS6KsHB8kK8MDFahjabhyaaz6+ZqF1D
	 7bvk2myLEzb/Xz7yp4hGwzQBcyIrVdvlRROAONbokRX8AfaFRefyuxc2OfKQtYHb/o
	 /MYl3CC0VChYA==
Date: Fri, 31 Jul 2026 03:02:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
Message-ID: <20260731100214.GA1927@quark>
References: <20260731050838.158825-1-ebiggers@kernel.org>
 <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
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

On Fri, Jul 31, 2026 at 11:06:28AM +0200, Krzysztof Kozlowski wrote:
> On 31/07/2026 07:08, Eric Biggers wrote:
> > None of the algorithms the QCE driver registers with the crypto API are
> > even close to being useful.  They're massively outperformed by the
> 
> The amount of patches you send towards removal of QCE is really
> stunning. Or rather worrying. This is like third approach or so.

Note that the crypto maintainer has already accepted a patch from
another developer to mark this driver as BROKEN.

> This is beyond comprehension and very unpleasant, because you actively
> work against the community with this approach.

"The community" is more than the hardware vendor.

I think the results of independent testing of this driver are incredibly
clear.  The pending fixes do not fix the performance either, but
actually make it worse.

I have been asking for the inclusion of this driver to be justified for
many years.  As far as I've ever been able to tell it's just a "checkbox
feature", which isn't something that really belongs upstream.

I care about the technical merit of the kernel's cryptographic algorithm
implementations.

- Eric

