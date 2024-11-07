Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADC4D43356
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJL1GyUCgTA1svzeqME0f9QajTsSDi5hNsjCJsnkRfE=; b=LJuxLbkhpj+JdPsaWhovx5QV4B
	BFDC4KiNbc10Hq8pfwHG/503xOiMdy1ea091YISpKEToyTJUUMvjD/1IPYoZzj5QETT94KSL9KsEc
	Cxg1jUFpqfShP+Q5wFXdZBA92CL/Nn47fVKGCTnUYYFehgAZmPeJBoK02nSdll4zmW7KHIalQJKxV
	DUAkTKhBZUKIM0lH8PhBjVtn9m9N0syT8p+eoKcIHy0al36rktghAArUjYilwT5EO3GjbeyNUkUyv
	vPFNofMyTszLH+CRNPB9QBYOAti1CWKU/Nnvdu2zpWGJ0u17zzs704NMtsY/FBajDZMEAoobK4dhU
	sJLuDazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91Qd-00000006tL0-0n12;
	Thu, 07 Nov 2024 12:15:59 +0000
Received: from www.linux-watchdog.org ([185.87.125.42])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91Bx-00000006qjx-0fop
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 12:00:50 +0000
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id D076C40A06; Thu,  7 Nov 2024 12:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org D076C40A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730979206;
	bh=uMm7eWhg5zxwjiJM+lslSNcWxvKbHa1oHkkgaXf1Ha4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AkgDiDNpn7Kzfmt28t44X/BKrVl/jNC32/Iuk2YdqhcUbXdwj9wyZKo5SWY40Nbsv
	 l5VY0SruRwW5o8cFrBumW5cMJvrEHhhloYCUmam74ZNHU8TiYuheZw99swUYGHLbQ/
	 ZtuYbDdokTE0kuGPZRSi7z3+thKl6ZxUzyTwdwSw=
Date: Thu, 7 Nov 2024 12:33:25 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Taewan Kim <trunixs.kim@samsung.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Byoungtae Cho <bt.cho@samsung.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: exynosautov920: add watchdog DT node
Message-ID: <20241107113325.GA5284@www.linux-watchdog.org>
References: <20241021063903.793166-1-trunixs.kim@samsung.com>
 <CGME20241021063938epcas2p1c01c89badb532f08a46087a4907df7dc@epcas2p1.samsung.com>
 <20241021063903.793166-4-trunixs.kim@samsung.com>
 <961e1aca-cd90-4db1-87d7-afd2e542421e@kernel.org>
 <20241107103331.GA4818@www.linux-watchdog.org>
 <589c40e1-6a1c-4ef7-b0d8-b761b132578a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <589c40e1-6a1c-4ef7-b0d8-b761b132578a@kernel.org>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_040049_367152_FBB88A96 
X-CRM114-Status: GOOD (  20.52  )
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

Hi Krzystof,

> On 07/11/2024 11:33, Wim Van Sebroeck wrote:
> > Hi Krzystof,
> > 
> >> On 21/10/2024 08:39, Taewan Kim wrote:
> >>> From: Byoungtae Cho <bt.cho@samsung.com>
> >>>
> >>> Adds two watchdog devices for ExynosAutoV920 SoC.
> >>>
> >>> Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
> >>> Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
> >>> ---
> >>>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20 +++++++++++++++++++
> >>>  1 file changed, 20 insertions(+)
> >>
> >> How did this happen that this patch was taken to watchdog? There is no
> >> Ack here from me.
> >>
> >> Drop this patch from watchdog, I do no agree to take it via that tree.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > 
> > Seems like you are having a hard day. 
> > The 3 patches are dropped. I presume that you will take them all through your tree then?
> 
> I meant only this one patch, not entire patchset. The bindings and
> watchdog driver are for you. I commented only about this patch here - DTS.
> 
> 
> Best regards,
> Krzysztof
> 

I added the first two patches again. Even when it sounds more logical to me to keep the 3 together. But that's a never ending discussion, so we won't go into that :-).

Kind regards,
Wim.


