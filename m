Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F252FCD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dakiticL3KcnH3Mr/ftel+GcbHuqEroaW01vc1VFp8c=; b=V006fJCOo0BuV/wOgldKKuKv9l
	vRK8M3MELnVElKTnuqMTY6flgFbOBjPVoO38+fNSVrSDCKKfz/ZCUZ3nLHePaVEJuIfVh8u0oQXqK
	/ToqGOsDAAcNkRst9zeSjRpM3Rgr+65XfTiVtyFYT5workDn6ag7vBU9mIXIsHO4uPA4+O3Bkz9jw
	bJeT7NLE+QOqsjWfcfFVi8K0Ob8albtCwukTLS5QGiv0B2tiaQs3TJAPsG6U+PQV9v6UGvoc2l9RX
	a184cWziM7IDdFB9q5S9mEeeCkWyMMmUPj2UVinUetAm1/wL+X6tPYhXwwfb83JRkT1gkkz9eWeeA
	x2JVTL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvdp-00000007J8d-3pv9;
	Fri, 29 May 2026 11:44:41 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvdn-00000007J6n-2Jfq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:44:41 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 187F91D000B6;
	Fri, 29 May 2026 07:44:38 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 29 May 2026 07:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780055077;
	 x=1780141477; bh=dakiticL3KcnH3Mr/ftel+GcbHuqEroaW01vc1VFp8c=; b=
	doQ+STQBDCQgZDyK9pBeL0MTZOTbF07Z/QNSNr0EM/3dEPvcnCWJPz56JRM/EklT
	PWYu9w/2yhbTmhgCyh6Kk/ruMfJGRCAhqhg8QF8ARqOvvu+ejgkRI41p5BWECfQz
	EaPAGA+e42ZPEaxyGzfMZTvqghJP8bootznZb/WnSdT1NkDu7sP+X00/ckgCFXyL
	aPU9qo7MMfAUnw2VeymhcU5LRx2AcwDzyXS+d0jNEUhfN/9qB4gyUFJHxWmIs0tB
	+2ZCDutrLkoL5S+WSqCCM9+7qFY3oxySxt0Z8BNP0csGsIvGwd0VUoOuHDVgxODm
	1cB36qFMEdwbC3V/VkL1BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780055077; x=
	1780141477; bh=dakiticL3KcnH3Mr/ftel+GcbHuqEroaW01vc1VFp8c=; b=R
	lmuvkiZtvll5fAliuc/TayDNvVWNF6BMKGoWKixK6BqYmOlBwhRy5BZVwVagtfS/
	IdNE0yxwYcuAyCoCy8Wu3i2Vt0eOaC1RBBgIaakbpv6glha6evjUjCLlS4zMOY3i
	0SWXMozKanuJha9r1FUaki4gPF9tom9gFyUJQmLw0dheqtI6FPGYhNoc5tKbuMPs
	oqPYl63xlN0Qj3Dg3ooIlyuJ/dfDQ5pZRpgU7NI7ERsAfOPo08OQ2vE72nZzni1/
	HgbTWkt4P3xXaV1BUXm0jmqyDuvtuDecii4e27p44YCdGs//sFI56Nax7U+8nPEM
	0KaSqmByBTVWcDLiX0ZCw==
X-ME-Sender: <xms:JXwZagmdaKx8-aNcyjUjF3Sa4WL8r96Xcs7Mrsk3KA87uRNBC5K1dQ>
    <xme:JXwZaqrGe9NGz0h1SnvmbEUnwwCRrksXx-M65tdmPCc3kZKiSlx-PDPX90z7mp__R
    lIMfj2xr4IMdNnRVuicZjiHqCvD4i3_vlo-XvwlUJispV5g0wHeYNg>
X-ME-Proxy-Cause: dmFkZTE1AF5MuKiGjejyqiNs30FvaXZD/yW/oTzYH3UBKvNMbqhYUiGLgUeBuBy7X5uoOl
    4ybjLNi+fwFzCC9jiQREiqcI76WN1VuKsrnej+BrSv6Gp+mjdbS3XWvzJzaSexVgS4KXOZ
    zQTIfg/WUY0dIfRGE952WmkgtiI7YW+0zMYxdpWx79VfZeXeqq8rhqEuXDuaE+PuuZjLHS
    uBUcDK6I861h6yf5/Z81VmnqC2v4S4rOch4/3I8bbDEXchPpIRi89Px4hVVGSwAuJNbfzB
    tDxxWKi23rcH+qe23+fvt2yCYVjTwlrVLbHlp3Qpd7FG7oCzJ1Tdv6mobO+wXryNnK79g+
    NcBsAeIz2y/45Opi7CaUmYVDDhYyDU8wp6cHa7/5uNDrATQITbumjW7liU/JcP0Jyx56mY
    UiCLgKRsyMo7IR/Y+CcGOfeO5NCSlzuGFn5/KklrRnzQc+ves0E6LNWuMZe5NlDOrt64Ti
    de7hPqkvuUTZxPJ0g+iip8GGx5Ycgtd/3EsG8fKe9v3AWPHLcXGeMu7BiZ/Tnkz0tN2VkJ
    OtYZLCNa7C5XLLy8MRrPXDjBqhX5xHyJ9OvygLX2fSq9H6QvvLBzlMJPnxZ+noO9QHZ/0I
    /479X2zXsltj1R8AzCoGTxISDQaC5kQsKqOGn40F/LCHBzT+ttyjAQxI5d3g
X-ME-Proxy: <xmx:JXwZasIsi81tOW2TXB2vBVZEbZwPz0Peq_4nP98nIS-wL7nfUe_IoQ>
    <xmx:JXwZatuX_j_MRa4jIqAUcb96tsCv6EvBfp0HhUx67ax5kVG7yFfC_A>
    <xmx:JXwZar8ARCpsh1-AyQHPSnr9KKRptmrUXC8gGWaPONSJ-IXi6vfJ2w>
    <xmx:JXwZav28spS3WNj6lag2ON44iiGXTfvYNtFYepFwWRvUhQ3XTkhsYQ>
    <xmx:JXwZasJh5DiBbqJEG7zNlbaySmfxS8HwR52mvUr6dA4wHfCtHl35VHhi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 452C5182007A; Fri, 29 May 2026 07:44:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AR8ZB97ino5k
Date: Fri, 29 May 2026 13:44:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Peter Griffin" <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 jyescas@google.com, kernel-team@android.com, stable@vger.kernel.org
Message-Id: <9d6bda31-839b-4cf8-b715-0d24760c73c2@app.fastmail.com>
In-Reply-To: <ed771a16-6241-4246-976e-48349e544b5b@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
 <20260505-acpm-fixes-sashiko-reports-v5-4-43b5ee7f1674@linaro.org>
 <a1629d9d-0357-42a3-aef8-c8d1cfa5ad39@app.fastmail.com>
 <ad30ca8b-01ba-40b9-a631-503ff463bc50@kernel.org>
 <26e9c700-c519-4888-8739-c48c73b8a39f@app.fastmail.com>
 <ed771a16-6241-4246-976e-48349e544b5b@linaro.org>
Subject: Re: [PATCH v5 4/7] firmware: samsung: acpm: Add memory barrier before
 advancing RX pointer
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_044439_950734_2E33F6BD 
X-CRM114-Status: GOOD (  14.83  )
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

On Fri, May 29, 2026, at 13:20, Tudor Ambarus wrote:
> On 5/29/26 11:25 AM, Arnd Bergmann wrote:
>
> I missed the data dependency chain. I focused too much on the read
> part in __ioread32_copy() that I missed the RAM store implications
> in it. The RAM store is forced to wait for its SRAM load, and the
> writel is forced to wait for all the RAM stores. So the entire
> payload is guaranteed to be visible in memory RAM before the writel.
>
> Maybe I thought about the reordering of the final __raw_readl() loop
> iteration with the writel(). But the dma_wmb() -> __dma_wmb() ->
> dmb(oshst) from writel has a compiler barrier, so the compiler can't
> reorder the code. And given the ARM64 device memory accesses ordering,
> the ordering is protected.

Ok, thanks for checking and confirming my thoughts.

> My bad, sorry. We shall either drop or revert the patch. Please let
> me know if you prefer a revert.

I'll leave it up to Krzysztof, as he's already sent it to
soc@lists.linux.dev as part of the 7.1 fixes, and I'd
like to send the rest to Linus soon.

Krzysztof, if you can send an updated pull request without
this patch (and maybe also without b4a38606991c ("firmware:
samsung: acpm: Fix dummy stubs to return ERR_PTR"), see
separate email), I'll just merge the other fixes and
send that off instead.

      Arnd

