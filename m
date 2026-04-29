Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C10AFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 18:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaKL1VITGxGKAwtbx/cCauZTVexmzreqjwsha7+HCvw=; b=32M7qywb+RHf/lVRq7exmvTrzR
	iC/romI54ddGElQsLD1zvy07XWjgr2JrnNGDYSuFsg69+nmGisLCzI9iROqZ2XCRP/MDXIXLbuzfI
	RiAJwsQwSfJPgkQ7FnX4gmGgRWmNJDA8ja6ADCRqP32mObKwRJq4gALhJBd9iP4eQ33enFTu2DIeb
	bEAPPiOXJ8/zLcvKaWIAQ6WzIkbZW1BSyo0a3r3OJ6nLa+Zspy0PzaqjEoKV8Kkl/Fc7jNgJm6s4C
	J6/NYI8NpM9rMW8NmQkEVG+eppZ6h7y3N0oK7cliko46t72Xh216mdbx0XhrWA8hoyrEiReSZeOcR
	vtQ7dicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9mF-000000045Af-1USh;
	Wed, 29 Apr 2026 18:36:51 +0000
Received: from vinatta.cz ([2a03:3b40:fe:428::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9mB-0000000459V-3s2N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 18:36:50 +0000
DKIM-Signature: a=rsa-sha256; bh=UaKL1VITGxGKAwtbx/cCauZTVexmzreqjwsha7+HCvw=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1777487786; v=1; x=1777919786;
 b=sjExcYGfSBa/pQLBcc/Y8CfPVNF1lRhd4ybKJ1qIB2T+LFZQR6E0kXI/k07g9Bdc6mKf0tVp
 Vu6SQxAbaZxOjrbujqb5MYda9E+oVkecOARdLpMfRX0ItiRfKoHSLwYNCpkVNIBF5urXUt5ISyd
 WxtKxwG6zIboC430MwLQp4oSmR+Jun1vL6mfiiFhWN1DTEt9JcEWPXnKA92Lg9Fb1k1jopDPNV9
 n7ROIzxHCXcDSLkdEPQDsDs+3f7ohcbMijRpsF5OngqzFtdXX6JESgJ9fC53NUyNyC9CL5HvHsF
 eAJs9FaBOw2pvSImfkK6oicWWkljST0nba1KWwY7tNP1w==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 9f7750af; Wed, 29 Apr 2026 20:36:26 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 20:36:26 +0200
Message-Id: <DI5UU03J2IU3.61E7OU85TZJH@matfyz.cz>
Cc: "Francesco Dolcini" <francesco@dolcini.it>, "Johannes Berg"
 <johannes@sipsolutions.net>, "Rob Herring" <robh@kernel.org>, "Krzysztof
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
To: "Brian Norris" <briannorris@chromium.org>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz> <afI8y70U7wFT_07h@google.com>
In-Reply-To: <afI8y70U7wFT_07h@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_113648_415764_5829164B 
X-CRM114-Status: GOOD (  13.39  )
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

Brian Norris, 2026-04-29T10:15:55-07:00:
>> and it would be great to not have to keep the
>> patches in a fork, especially when trying to build on top of them
>> further (such as to fix the driver-firmware incompatibilities discussed
>> in one of the patches of this series).
>
> Patch 3 is a different story. At the moment, it's definitely not
> acceptable. But I tried to provide hints about how you can write proper
> FW compatibility logic. I'm still not optimistic that'll be easy and
> maintainable, and we still reserve the right to reject patches if they
> make things unmaintainable.

I was referring to the original patches here, I would of course modify
the compability patch according to your feedback, I just didn't want to
invest the effort into that when it wasn't and still isn't clear if it
will ever be possible to upstream it.

I'm curious to hear from Johannes now then.

Thank you for the information,
Karel

