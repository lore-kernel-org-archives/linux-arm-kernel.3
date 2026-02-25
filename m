Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE56F55449
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 04:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuNz0M9WBkItf7D1SEjgMLlBY5QrhLH+7WlBomk+924=; b=nsT7V7JhpYJF0eUFTc1qQ/j+hv
	kZr6Kpsuxo5tmv4+6vcPTzH8aoSn6R8eTOiQoxMK662HhRuEVT/UuQgWf0GfZPIvSqDbtXLYDoIxF
	eUtIORySZr5fmzw0iPruQWN25/A/evrcw1C83TqYGLVqQetvZeQv/qYwUs3jO3gOa3Kkfx7WL+rAf
	mmWXu6R7/yfDXBIXoGUTUb+BLYaN0yzkBeqkWBXHj5m1pLsE4Ka/wzzc8x/68WMvvP+VMdxZYSE6A
	QgZbCLnWPu0wYDcilbCalOdjXWhZljQS5XKcB0D8azKP5gh9h+mHxqCZku/2xeQkXLo+5xxeloBHQ
	EpD/IV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv6gK-00000003Cnv-1ihX;
	Wed, 25 Feb 2026 04:39:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv6gJ-00000003Cnk-0USS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 04:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=uuNz0M9WBkItf7D1SEjgMLlBY5QrhLH+7WlBomk+924=; b=GAED7for2rx0mx5Zmxxm04ytqi
	wLMScoz3ai/jhZ6LbZaOcGAMXau1H+u3SV8KYRO9SeXcF5B+ItUW3WthLLxSMZBfwGXVgUiYBnvX9
	n8G8iOf+lucpkutkjVJhAFxmMuFf3tqTFhxoyqrzjvHjxcB8Io+uxig6VG94Cbyk+fx9aJgbvt2of
	eNGG7wXEFMIcm63Hl9CLjt5ZbWj2Ecj0uOEK/MB/AhoC9B+lgQU/qlwumZEfQmbnhvLTfHD55spl9
	QUAs23LpLcnaz6hWPnX2jNvlBRjbrc4SB57xqmRaU5x/uJm3Gx4FqKDCocXXScKa5mGBu+sQppmv2
	T8GaiNqg==;
Received: from layka.disroot.org ([178.21.23.139])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv6gF-00000000RpP-48za
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 04:39:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E37B126726;
	Wed, 25 Feb 2026 05:30:19 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcC-zT7sxKQm; Wed, 25 Feb 2026 05:30:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1771993819; bh=uuNz0M9WBkItf7D1SEjgMLlBY5QrhLH+7WlBomk+924=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=bA7IWNSXuxq9cLSSxbWjAk5ujiAduUFug6RLBCgZXwgfbcccZlh/xsZH42iEZU7XR
	 4BFNG4mP0X4QGhRkYj47c/7y0VqPRzQkdCGi7qHnqqQFC7YBmspc8Sco7TlLKAX/aW
	 2E9Xko1TebrdVBWaTrzUdvH9QmzxntuRlOyvwPyO28CZteadOqSc+TYwK0ogYC1xaX
	 sG0eLsCcWCQWtLrJBWJA+RywgEONg+3szUhMuFuwNba08mmVQ1aQ+s+029MGgGT04R
	 uBlNl00dDN0G+KGK67SWHRfnRkWzAtgr4TiQRAed6l+SKdT2l698gXVah82S52yfQs
	 8skxxwcVya5IA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 10:00:09 +0530
Message-Id: <DGNRDQ5886K7.3NSLKILM1GDWR@disroot.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Rayan Marzouk"
 <rayanmarzouk743@gmail.com>, "bluebunny" <kalorin.bok084@passinbox.com>
Subject: Re: [PATCH 2/2] arm64: dts: exynos: add initial support for Samsung
 Galaxy J7 (2016)
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Kees Cook" <kees@kernel.org>,
 "Tony Luck" <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>
References: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
 <20260125-exynos7870-j7xelte-v1-2-5cacc3042c42@disroot.org>
 <7cdeb30e-13b9-4c7d-95b4-f6bb6cf15ae8@kernel.org>
In-Reply-To: <7cdeb30e-13b9-4c7d-95b4-f6bb6cf15ae8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_043924_055076_477DE649 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

On 2026-02-24 12:20 +01:00, Krzysztof Kozlowski wrote:
> On 24/01/2026 21:05, Kaustabh Chakraborty wrote:
>> From: Rayan Marzouk <rayanmarzouk743@gmail.com>
>>=20
>> Add initial devicetree support for Samsung Galaxy J7 (2016) (codename:
>> j7xelte), an Exynos7870 device.
>>=20
>> Signed-off-by: Rayan Marzouk <rayanmarzouk743@gmail.com>
>> Co-developed-by: bluebunny <kalorin.bok084@passinbox.com>
>> Signed-off-by: bluebunny <kalorin.bok084@passinbox.com>
>
> I cannot take anonymous contributions (see submitting patches). Please
> resend or confirm that I should drop above Co-dev and SoB.

Please drop the tags and accept, this has been endorsed by the
co-author. Thank you.

>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>
>
> Best regards,
> Krzysztof


