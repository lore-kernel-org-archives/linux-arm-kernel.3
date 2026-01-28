Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2B8D3F09D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CMFkKWYqAiPJqedGOMih8yrSq49djeQXlILBKYzmzI=; b=EmqwsnGpp/7/LbaOs+to0fH4AA
	bfO/epjxH4lDPzqjvHJtlbqI/kRLMeJZxdjwmoAD4gd4/n5CDFUKUJ4+K7g7F+Stn5FESYjhZQKSz
	D8LA08rEXqXjbYbF3wCY5fBcrLKYmW8KLv0Jkf5ZMwZOqR5ng/jRH670UgnNV2Wl3/hLr0mULD/Of
	wKeRIfe944sM4nH7hHhlwaiWYIwwu2edEtI3ERAPjgILeygjHll+tXnt/sYI6YPds9eWZKT4KJgr2
	xZ1AUrPapEArohZSIDQ/uHQ13pc12dKc3CNhm1yYFTCt7o/DQwVXxST8nojWryP/6MM5i6l97HZqx
	O/EZTO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Ia-0000000GTDe-3n0W;
	Wed, 28 Jan 2026 17:25:48 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9IY-0000000GTCk-2aJ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:25:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EAF64279C4;
	Wed, 28 Jan 2026 18:17:47 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSSomJ4dRYpG; Wed, 28 Jan 2026 18:17:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1769620667; bh=2CMFkKWYqAiPJqedGOMih8yrSq49djeQXlILBKYzmzI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=FnH6M/LE6xRvSd3BCxukBrBdzw9jV5ENDKtDMtHsNFgtczSxak0z1Vgj2MIXluCJ2
	 DfnsSqIXb5Fvbcdr9BB++GU84i466rHHEkJ7A5G0234h7xBsfIBEIXQCZIA87ctQt8
	 9E/gq9/BZ8BnTtFuQre3vA3bvHTy/xxWNBB3LBDyjNUvAhSPYSUnZhR8RRkokbAdM/
	 a/xpyiXZPJxPKBidcQVS6wHOBJNWvuXhbbxz7EcJESEXSCFvQ8w6Wqy784F/iiY6i2
	 xif2IYytwsuS6DOgS8r39Jc8+mYgPqir56vni7MZ2lJkF6VXjRS1VChwk6JHvq0ous
	 gtxLEsJBJpO9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 22:47:38 +0530
Message-Id: <DG0E63PNXEGU.1MAVGEG49ZV87@disroot.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Rayan Marzouk"
 <rayanmarzouk743@gmail.com>, "bluebunny" <kalorin.bok084@passinbox.com>
Subject: Re: [PATCH 0/2] Add device tree for Samsung Galaxy J7 (2016)
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Kees Cook" <kees@kernel.org>,
 "Tony Luck" <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>
References: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
 <abc5995e-3b29-4e0f-a091-40797f1b6abf@kernel.org>
In-Reply-To: <abc5995e-3b29-4e0f-a091-40797f1b6abf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092547_178364_FF5117FE 
X-CRM114-Status: GOOD (  13.46  )
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

On 2026-01-28 11:58 +01:00, Krzysztof Kozlowski wrote:
> On 24/01/2026 21:05, Kaustabh Chakraborty wrote:
>> This series introduces the device tree for a new Samsung Exynos 7870
>> device =E2=80=93 Samsung Galaxy J7 (2016).
>>=20
>> I have acquired permission from the authors of this patch to upstream
>> this on their behalf.
>
>
> Thank you for the patch. My tree is currently closed for new features
> till the end of the merge window. I will review and/or apply the patch

It's alright, I did not intend to have it picked up in v6.19 release anyway=
.

> then. If I misjudged this patch and this is a fix, please let me know.

It is indeed, not a fix.

>
>
>
> Best regards,
> Krzysztof


