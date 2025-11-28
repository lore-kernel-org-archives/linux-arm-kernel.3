Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C7CD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvNIlld0IaNRs9dqfcFlKkKutDvX8ypz/zN3pY5PILI=; b=aJDJNE2hmfmqITT7yM4X3SWLTo
	7OOWlY+4dyhb0K2xUULB0qhuVGPSH3YL3rHdb8+7bxFbQB1uON2+AV1hHpheNeGHAO6luZteNozkq
	kIfEiQR4hzuuqESf64Cn3n/1GCapvhY7SAlqFGyyCVciulT+MTYVGx8OhJAviN0HI6EX7SR9BZJfX
	TwDCKN2d1gVyhIFZSVSHPmrEWz87CH6uFbBqFFN4ZWiF6kgvZwgA3xL3Y0WWoFzYoXCIfYQiznq00
	2Vk6FqMRS85cTgq4atRVBiIo/Ddf5EVfwT/gm1RHxGyYW50akL7hwc8lytdZP6hjcFyF/Mys9J/vr
	pA0QXfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1un-00000000hdg-1reQ;
	Fri, 28 Nov 2025 17:05:49 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1uj-00000000hd2-0d04
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:05:47 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E156C1FD35;
	Fri, 28 Nov 2025 18:05:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1764349538;
	bh=PvNIlld0IaNRs9dqfcFlKkKutDvX8ypz/zN3pY5PILI=;
	h=Received:From:To:Subject;
	b=TOfp9aoWdasbKSRX3VWQIfP2S+HY1WpEpSH3mVqwdhQ5yDfS27be1AKTHvSFsjhCi
	 rDQE1UgFPadMAHVK7KU7oLuVx4bwJwQQ/io4VYL3yv97S+YmzQAaNOmmgBH8dgWHQ9
	 az1pFiQ5F9tQ0puODrO/55qMjJSRCmac0iCIVOz+OaFNV4MTCurJGoKoc9TnERTdQN
	 Ng8d98Roa1Xeh7LHSG8TuK9V/9CpukRmUpYLcJrnb5Gic3xi9SNj58PKdhTSF79hfb
	 mT5mVz0er90By9o68ZHnpnUy/593diKLafCYPRuq3QHixt07+NSv9L7pZbN9mSTE7r
	 b/3KkV24y9CYw==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 94AD87F9F8; Fri, 28 Nov 2025 18:05:37 +0100 (CET)
Date: Fri, 28 Nov 2025 18:05:37 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Karel Balej <balejk@matfyz.cz>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, david@ixit.cz
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
Message-ID: <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_090546_239999_A65F0F5B 
X-CRM114-Status: UNSURE (   9.18  )
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

On Thu, Nov 27, 2025 at 04:29:12PM +0100, Karel Balej wrote:
> To reiterate, the firmware is generally available but is not part of
> linux-firmware and the entire process of upstreaming the chipset support is
> stuck on that.

I'll try to see if any of my contact in NXP Wi-Fi group is able to help. Give
me a few days.

Francesco



