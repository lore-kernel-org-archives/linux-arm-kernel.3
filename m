Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71706C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wFClM8+pAQczxdhJUJqKMlAR1HmGxjlTK3IxTJCg2g=; b=XXOGFqh9nhNtkvtHaaipNB8HzQ
	gCOqh23rHWjWo5rnWYy9PvVgDA2Xw9Z2eerVsyLzc1NEXFfvycQV0Oi9cmK8YXIdR87+R9Fwc+35B
	FMvQCelKGF2QLFn2fNCXn1dA7zI1nWqm8DAYV6NUSCXGkaa8j/4fB5ZjSFPSg2qxpq+49DgQsVrdW
	bymAQX1/yuRErCTNoz+jE2Og1WyYx7CLpnnZDk/H+0ZaHrJLM94mqsZpIbFmZ/YsYCklp2LcpKO4z
	qL9wemFIzn6ZFXt/vPrZdDHJL+eTe1bSWW0pFPOC19LbY3pBLL0uMUgX3WZabMwGi7qd1XRyQHUB7
	houaOxzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAsR6-0000000Gdih-3l7I;
	Sun, 27 Sep 2026 17:13:12 +0000
Received: from vinatta.cz ([2a03:3b40:fe:428::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAsR4-0000000Gdho-1Gy2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 17:13:12 +0000
DKIM-Signature: a=rsa-sha256; bh=7wFClM8+pAQczxdhJUJqKMlAR1HmGxjlTK3IxTJCg2g=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1790529144; v=1; x=1790961144;
 b=o/oOCS/AFc0OjfWcZe5MxNwXS6fDKe/EMD55e5ERTrXjHgqe6OUKdYWia3HW/I7e0okeLwKn
 ayhBroQ/58yk0do/jUapZ40tqgOdoU1OnLXZXNAVOiVYtGZ1w1KBxcoOiMhmt4XEbPV/O8J7BEF
 606PN+T8JycaxJ2BKdTJeD38bsTnT3pFAeRXkB6PbjRA7eUhQpyGhjOnk/t5ppT6E2Q6vYj+hAu
 hopCkhFeh0InMztWieMVMG3RNKypEgxs497OW4zpHlwdTgk1Uegtn1TqZJl2fk0A+JGaRbSECKn
 xB8Y6wPms7petV9XW6NabhiQLirznwv9VJOB8nmitke0g==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 713fe9e7; Sun, 27 Sep 2026 19:12:24 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Sep 2026 19:12:24 +0200
Message-Id: <DLQ9LXDE2P29.248MPYCJMT0DL@matfyz.cz>
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
 Fan" <peng.fan@nxp.com>, <david@ixit.cz>, "Johannes Berg"
 <johannes.berg@intel.com>
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
To: "Brian Norris" <briannorris@chromium.org>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz> <afI8y70U7wFT_07h@google.com>
In-Reply-To: <afI8y70U7wFT_07h@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_101310_799159_418324BA 
X-CRM114-Status: GOOD (  11.40  )
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

Brian,

Brian Norris, 2026-04-29T10:15:55-07:00:
>> Brian, what are the options here now? Would it be possible to make an
>> exception and accept the patches without the firmware being in
>> linux-firmware? This is an old device with no mainstream audience so I
>> expect everyone who will want to use it will be able to supply the
>> firmware themselves
[...]
> I suppose I'll leave it up to Johannes on this part, and may be willing
> to retract my NAK [1].

I have not been able to get a response from Johannes for these last five
months, despite pinging twice =E2=80=93 is there any chance you might be ab=
le to
help with that in any way, please?

Kind regards,
Karel

