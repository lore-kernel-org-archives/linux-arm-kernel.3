Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8652DC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 05:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdgatJqXq09iZfF8MwWC7oqz/aY6pcVLm3L68LKTsVg=; b=n5r0EdiXt48RISdJTg5ClpgPqH
	L32Pc1/eMiru8JW4HL1AmbyEqCrMmiIN8RfSycFI00mwDHVyYniTNp3C60db8GeO80wDlqsmZQNwi
	qxW0u06qpuev1S6TSuXPBYCvozYlpffVfl1S+PVMO+0kchqRHo9coJod5PtlGrOTT0Uud/bQe2uFl
	fSVofH/e7vApgNBGQVaZGH30t493WBIFQ4UaSGjaa++STcuy1UBIkrtDAJz1CI578dG4p7nPhs0JV
	2KRY5OZR0uzy1DOpWsbMMCIc0YLZOT+93AM1aJFlehUgY+eUVAYaeU9c+jgoY/yNDkoBHON9pkg/i
	EJ/eICOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtITv-0000000B2kA-2dzB;
	Mon, 10 Aug 2026 05:23:27 +0000
Received: from vinatta.cz ([2a03:3b40:fe:428::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtITr-0000000B2j5-23r6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 05:23:25 +0000
DKIM-Signature: a=rsa-sha256; bh=rdgatJqXq09iZfF8MwWC7oqz/aY6pcVLm3L68LKTsVg=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1786339366; v=1; x=1786771366;
 b=oGxaFSkb04TgaZtwxVkxckf1o7rYI9s9/g6I7Of/SalSoGIexeWIuZlUoEHf73s0Nz8+hSCO
 2mOt9PDjshw9LrKOukPYyHWII+Uck9dHlxrom4H64jN1o5BFdzzPoa9+IFdmpBoKBQDBVl16dQs
 hC35Gafs18KqAAzWU46laRUuSsP4DfzpJLci/N+VWs3zQRlDEPttvBsDAEekZmzC1nzttaILjwY
 yZau2lTDM6Ymsd74zl4KX0Y06mN6FNZrSkv1WFxAl0CftJlHdo4eL5z7SAml85Z/PAHHrPlxTBn
 GrKqIEVA05Te3hkgHF92CN9f233BrkQuCP+yRINYgmKHA==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 15759296; Mon, 10 Aug 2026 07:22:46 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 07:22:34 +0200
Message-Id: <DKL0GAHVZF2H.1PCBLWAT453SS@matfyz.cz>
To: "Johannes Berg" <johannes@sipsolutions.net>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: "Brian Norris" <briannorris@chromium.org>, "Francesco Dolcini"
 <francesco@dolcini.it>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, "Andrew Lunn"
 <andrew@lunn.ch>, "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Frank Li" <Frank.Li@nxp.com>,
 <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mmc@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, "Jeff Chen" <jeff.chen_1@nxp.com>, "Peng
 Fan" <peng.fan@nxp.com>, <david@ixit.cz>
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
 <DIKSVZCAQES1.35I4QY11LBVNV@matfyz.cz>
In-Reply-To: <DIKSVZCAQES1.35I4QY11LBVNV@matfyz.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_222324_003754_2D135E0A 
X-CRM114-Status: GOOD (  13.76  )
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

Johannes,

Karel Balej, 2026-05-17T10:14:58+02:00:
> Karel Balej, 2026-04-29T12:55:23+02:00:
>> what are the options here now? Would it be possible to make an
>> exception and accept the patches without the firmware being in
>> linux-firmware? This is an old device with no mainstream audience so I
>> expect everyone who will want to use it will be able to supply the
>> firmware themselves and it would be great to not have to keep the
>> patches in a fork, especially when trying to build on top of them
>> further (such as to fix the driver-firmware incompatibilities discussed
>> in one of the patches of this series).
>
> would you please let us know whether there is any chance an exception
> could be made for this chip regarding the firmware or whether there is
> any other way to upstream the support?

I still haven't heard from you, could you please have a look and let us
know if there is any way forward?

The support for the chip has been out of tree for over two and a half
years now.

Thank you,
Karel

