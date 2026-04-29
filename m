Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE8AFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nM00K1yCTGWbLJ67CLFAJLSKUSfe1ahbLuQbeMdnPGg=; b=rJm7xDhEIbnVDGt43OBc4vhN3/
	Lj0yJBNPn5inLAWNEaKomTitUkKQgnIIhh92acax2DUMuLIo1Sjil7W7WpqcT9i+mP+vCvJJlfvRN
	K/I8SYZYUhK5Q1WoZlpOqVOUo1xXSEYgZG+WnWdWFZZkVyXKUoipEvBUbq7e1qz5tzaiVqt1+g1Un
	tGrgeK+rnco0SKo2dqOC4qbRTYPXzC61tjVNwlU8npIZaVrFsT/hnYEJMDNsnhzh41un4380pMvEz
	Hsi68aQVMNk62PvHllNGLWqnSLTvu4Alz8ogYc3n1ILMb6dceThWQplgiKyfubpCDq9y5km8C8jWk
	w66DNzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI308-00000003Vwu-0iha;
	Wed, 29 Apr 2026 11:22:44 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI305-00000003Vw8-0bE2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 11:22:43 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6607C22850;
	Wed, 29 Apr 2026 13:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1777461754;
	bh=nM00K1yCTGWbLJ67CLFAJLSKUSfe1ahbLuQbeMdnPGg=; h=From:To:Subject;
	b=wvEc/G6mjBE0GxM4bzoHZxQsbtrNL6QfVqrpNXiJgj2hb4jmIBOjrMSDhj60KFiyx
	 B12XCyED6SS4fMNsRpXPB5tMRVDX92AngCp8liFagKw35mNqFJiemKeJK+ZMBeLGwZ
	 X4u7CVL3qsNsThc1gr6U7bC3+gYI5dk3yJ/0hwgXCz+6+Srjfu5l/r89DAl1mE0QeI
	 REAYWN5VZH3QzxUnIx24Bstqhc/FLR8MBs+0rYBMAY9znW8lPQ7B5bnQTEvoTK3bWQ
	 b/3XkBTlpQq3tvVtsUOFt0rcHjSp+N6n3kkb9k932QfMll9U9D2BqNP8sAezcnpV2g
	 FAr2AjoEa2Zmw==
Date: Wed, 29 Apr 2026 13:22:32 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Karel Balej <balejk@matfyz.cz>
Cc: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
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
Message-ID: <20260429112232.GD17033@francesco-nb>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_042241_776641_BBB52C6E 
X-CRM114-Status: UNSURE (   9.00  )
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

Hello Karel,

On Wed, Apr 29, 2026 at 12:55:23PM +0200, Karel Balej wrote:
> without the firmware being in linux-firmware?

What's the license of this firmware? Am I wrong saying that if
the license allows it, you could just send a patch to have it integrated
to the linux-firmware repository? Is there any history or documentation
on the topic (please apologize if this is a well known topic, just
answer RTFM if this is the case).

I read a couple of days ago that for example the firmwares for the
various Apple arm64 laptop cannot be redistributed and every single
individual that wants to use those needs to extract those from their
system.

All of that seems just a legal matter, and IANAL ...

Francesco



