Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E34CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbdghP89407ki72C54bZEEXFY2jq+D9w1Aq8ZiLnoZw=; b=DndsjKTlJoZ+e6kRCMCs/8YcnC
	95KAUbgUWVKr/K+kYiiULUV4hzxLMl18fwrbHmc6TvxyKdT0aoGm0+JOgkiKD/hY+2n659Sr6oweQ
	qyNVM5bEgsV8FGKM7vhikBajZWkZYszvTSGe3P1EkXVFouCsE1Bakbx0W0cLpPWjXHgTIZSZtACJ0
	9rXN1oDd9Ad6Wq0XCC1VJWLu5MPxlQz9LcRUUojUsr4og0MN4bTvKfzc6zvq0IS5DM2taZwdkeBtw
	lLBnAH5gw4E5wp5r2P47enzMofbR9XBOEQfzAbnHtmUhyesZQFNBLdQ4S83J2tF72R6nziITdqsyo
	++kkEY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI59I-00000003gra-2S3k;
	Wed, 29 Apr 2026 13:40:20 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI59F-00000003gom-1lXF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:40:19 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A054F22BA3;
	Wed, 29 Apr 2026 15:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1777470015;
	bh=wbdghP89407ki72C54bZEEXFY2jq+D9w1Aq8ZiLnoZw=; h=From:To:Subject;
	b=tAezjJF24BF4hg11VMQFul5zOsbu6N1rm0cj6pHYem2jSptlxX6CHhVV9lTNJvnU5
	 /0C9M5TyXuezBAZPtd6OYF5NgcNCmoQIimB5W6oVTanbpzAPfcdOVlMrad5D02Eokv
	 eZ3rBhmRnqJLrbtrHLD0hXoVM5Eto+AlnIFVQxLNevkxhfz1B2edLbzo2kKwvPSqXv
	 A4/Jf+0gf1vYElZBZy9E9m5PgcNIxEOIBluMP6SZFV44Rq/pHbj1ljvZcddF7Pf44J
	 jNzTpLh0RlzHjl+IO8nhiJ/HcUEqAaO+ZgwVB2y8ezTL8whQ8S7ieVkksU+zQYfJUC
	 gpTf7+FWWcnrg==
Date: Wed, 29 Apr 2026 15:40:11 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Karel Balej <balejk@matfyz.cz>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Brian Norris <briannorris@chromium.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, david@ixit.cz
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
Message-ID: <20260429134011.GA73482@francesco-nb>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
 <20260429112232.GD17033@francesco-nb>
 <DI5O432AFZVX.3VGKJP31AZX97@matfyz.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI5O432AFZVX.3VGKJP31AZX97@matfyz.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_064017_634175_C2F3AFEF 
X-CRM114-Status: GOOD (  14.32  )
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

On Wed, Apr 29, 2026 at 03:20:28PM +0200, Karel Balej wrote:
> Francesco Dolcini, 2026-04-29T13:22:32+02:00:
> > On Wed, Apr 29, 2026 at 12:55:23PM +0200, Karel Balej wrote:
> >> without the firmware being in linux-firmware?
> >
> > What's the license of this firmware? Am I wrong saying that if
> > the license allows it, you could just send a patch to have it integrated
> > to the linux-firmware repository? Is there any history or documentation
> > on the topic (please apologize if this is a well known topic, just
> > answer RTFM if this is the case).
> 
> that's one of the issues, the license is not specified explicitly
> anywhere as far as I know.
That's enough to be blocked.

> As far as I know, even if I was to submit the firmware myself, it would
> still require a sign-off from someone from NXP [1].

And this is clearly there to avoid situation that are problematic from
a legal point of view.

I do not see any way forward without NXP.

Francesco

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/about/#signed-off-by-requirement

