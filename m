Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D32109023F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwgWNwuqPFxUg7+dzX7DZnorsa23LOlHczwFd1Nf1ww=; b=aJiTKjTFGMR00kMstE5kDlcY1n
	EfrlFjuaPV61QwQHoDRCXTONcsf/Dajrs39jeKR9cyzv3KSOKyzfn/PVV5hCrmbsoiLsPsXLmit+s
	mr0A6KnLEPA189fdnTwqvWqT1CUQyXwdlKQJG7ZQxPeV4V7Ykhh1pAnduvlHa+8p+yUgyPBWo4brR
	VBT2qTLPR22jJf9GEilH2bs2CeBsXh2ef0aYGpA8amdenyDOV0hUpXJneXm1z1dsd1fqVuTyjk00r
	oHlSfgfYPq3uM68IhHbliM1bDrGSokxp/m2cqckClMvI8QED6C2B0z3/wlIjft8Yv01P2B43fareF
	MvzrwciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FAx-0000000Au2o-2koD;
	Thu, 19 Mar 2026 15:20:43 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FAv-0000000Au1l-3Tqi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=OwgWNwuqPFxUg7+dzX7DZnorsa23LOlHczwFd1Nf1ww=; b=aA6npBLrX9UBbGwEkoA46cwmYd
	aoWCb5LXwbZrWnVZZTuRMOf7i6uDKHj8vcleWqlYpr373wmO/H13d9gAfpc2frkTZZZ/gSwOnqQn+
	gJEnQZoGfAR64JCaS7Nw0ike8jKcqMwWa0+0yUTuNoCw+OuthUBGf6/xAs4WszszhwG/QBZJea0Wj
	pKRixTfHrkZIWXUlYhQ6DWdAeaeBy9Gz1EJ/D75uRRqYO0yBV9mNdg8CojyNblQUI7z1CDpM0huGq
	VW+4VEL3oACJZ+E1GsFK+1AIdU35H1endgEqFqGSN5EIumnDu/tEQLZBfLt2PlUXMfHF0oLVbO+iP
	xeOuep5A==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w3FAn-004WKu-Jq; Thu, 19 Mar 2026 15:20:32 +0000
Date: Thu, 19 Mar 2026 08:20:27 -0700
From: Breno Leitao <leitao@debian.org>
To: Masami Hiramatsu <mhiramat@kernel.org>, oss@malat.biz
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	paulmck@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: arm64: pseudo NMI bootconfig question
Message-ID: <abwTJBj80oX_T8xt@gmail.com>
References: <rs4igmsjrm6r2aio4nbe5jos3vcqk2u4bjhltjwtj2pn3cquip@kv3grgec7qrb>
 <20251113133403.308046d2df1c97ba7dcd2388@kernel.org>
 <wqzhgeu5vlkeuomajvy7vf3x4gf3fsnzmczmkswvjo7xdyzzbo@6uqjqftbzgot>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wqzhgeu5vlkeuomajvy7vf3x4gf3fsnzmczmkswvjo7xdyzzbo@6uqjqftbzgot>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_082041_868537_779C5933 
X-CRM114-Status: GOOD (  11.66  )
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

hello Masami,

On Thu, Nov 13, 2025 at 02:37:22AM -0800, Breno Leitao wrote:
> On Thu, Nov 13, 2025 at 01:34:03PM +0900, Masami Hiramatsu wrote:
>
> Another possible solution would be to load bootconfig earlier in the
> boot process so that early parameters can be defined within bootconfig.
> Petr suggested this approach some time back, but it doesn't appear to
> have made it upstream.
>
> https://lore.kernel.org/all/20231123194106.08f5832f558fe806b1fd8098@kernel.org/
>
> I'm not fully up to speed on the details of this change, so I want to
> ask directly: Would Petr's approach—allowing early parameters to be set
> via bootconfig make sense from a bootconfig design perspective?

Would it be worthwhile for me to take Petr's patch, update it to the
current codebase, address any issues, and verify that it resolves the
problem described above? If so, would you be open to reviewing and
potentially accepting such a patch?

Thanks,
--breno

