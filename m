Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC900FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqRqdqb9cql00b3xqlZ9Qf54W2TCp7JZjtSRq3okoys=; b=K0tvZ/cwiticlyKPNwyrvyTznu
	+xAxYxqn58xlP5BBlOYUtSNu9AgxjGRv4Scge3bqs78sKrIOkHkqV06wwrOTnohDvF5Mcm8CD6xO5
	KsB5UlQ/9Z+e2gWy/VwnxctPbdDNuBMfYgXxp6yU2Vxf4vnAwTiH69TRM67tWmYFMbxorybEdyKmH
	B3/NjaUjmQjgLr0k8GGqRubWsNWwGr11+I+7fPe5n/Zi82EdO76zolFup9Eg5ABTkrijdqCSsR/v5
	FSL4V4hGcyIssK//zant5hfTBAsBnV35Y1B4unTx6Sa5zzpkBvfsl099+JHjQW3KYsLvmBCSSrrCl
	T13BzChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4qh-00000003exw-0AlV;
	Wed, 29 Apr 2026 13:21:07 +0000
Received: from vinatta.cz ([2a03:3b40:fe:428::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4qd-00000003ev6-3NKJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:21:05 +0000
DKIM-Signature: a=rsa-sha256; bh=xqRqdqb9cql00b3xqlZ9Qf54W2TCp7JZjtSRq3okoys=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1777468828; v=1; x=1777900828;
 b=IyM+Dn02OPnovfHH7qNxVHpRW3lq/vYVi8gIZcW4AH7D2xne9s+wetiIl+wxpJE6OZFyTOkm
 RguW5ARTHy3psH4xEHq1wSvuu9pVbbBnDs7WkbnysjUgPn2Zn3tjG/vwTwPw6Jzk8QNkZajEwln
 bEnKo/NHeCiP3dxeqdMa/VD2iYAHYg6eNe9oGnLxh+poF0IoDqoQFGNVA00lFNXMxn6Ic/jt0CK
 fy6UDDHUSrkQHQ1sajzCK6X3Ek3xAf3QWRyeapcFtUvNGmSxGuNDfAOtcZFgdBCEUkHi/u1pIh5
 7MIEt8s/hY14nWI79pi1zTXz57/0aOCSnp6eLVR7s/6cQ==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 2b91500b; Wed, 29 Apr 2026 15:20:28 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 15:20:28 +0200
Message-Id: <DI5O432AFZVX.3VGKJP31AZX97@matfyz.cz>
Cc: "Brian Norris" <briannorris@chromium.org>, "Johannes Berg"
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
To: "Francesco Dolcini" <francesco@dolcini.it>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
 <20260429112232.GD17033@francesco-nb>
In-Reply-To: <20260429112232.GD17033@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_062104_298495_BAFBAEE2 
X-CRM114-Status: GOOD (  14.26  )
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

Hello, Francesco,

Francesco Dolcini, 2026-04-29T13:22:32+02:00:
> On Wed, Apr 29, 2026 at 12:55:23PM +0200, Karel Balej wrote:
>> without the firmware being in linux-firmware?
>
> What's the license of this firmware? Am I wrong saying that if
> the license allows it, you could just send a patch to have it integrated
> to the linux-firmware repository? Is there any history or documentation
> on the topic (please apologize if this is a well known topic, just
> answer RTFM if this is the case).

that's one of the issues, the license is not specified explicitly
anywhere as far as I know. Likely it is the same as the other Marvell
blobs already in linux-firmware (the mrvl directory), but we don't know
for sure.

As far as I know, even if I was to submit the firmware myself, it would
still require a sign-off from someone from NXP [1].

> I read a couple of days ago that for example the firmwares for the
> various Apple arm64 laptop cannot be redistributed and every single
> individual that wants to use those needs to extract those from their
> system.

Are those blobs loaded by the mainline kernel? If so, it would be the
same situation as I'm proposing here I believe.

> All of that seems just a legal matter, and IANAL ...

It is.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware=
.git/about/#signed-off-by-requirement

Karel

