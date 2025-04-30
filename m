Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E515AC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 20:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38Egkm8oFcBbp/bWb0dgYV4UJnqEXIGXzrU/Ucj9IKQ=; b=39GIGL6BRECKH6PXjTXOwQpxPv
	ipofT7H/fG7vjLUw5HjRNq65at+8ETHa0dUbXH/tLrmwf9Y0NKk4QruDFdijHGW6x2sW8XlxOoRIL
	XSgIcAEmoLBIq0Nu7kexDEyEBtfwlhuUGXw2ivETe5XIfWDFGMzaXWBwj0kUMQSEIEtp+hpz3QS7z
	681Y7f4ICZhD4F2zSAEr7D8YYJy1h10zUUYdkhBBA8+Oa8AUhqJwlVD1SyMQef5h3iA0ZW5ZHI7WJ
	3keRYzxHvHjx51gsob46fJhNVCBBQEtcCCs8NGQ41419G9fiOhiDaj1FYmujWMa/n4FIe7a2wNjFX
	YcOZKfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uADhB-0000000Dsc0-0AoQ;
	Wed, 30 Apr 2025 20:06:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uADfD-0000000DsDg-3fvH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 20:04:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 633785C47C4;
	Wed, 30 Apr 2025 20:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0C5C4AF0B;
	Wed, 30 Apr 2025 20:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746043454;
	bh=sOnwfSJ05AlVpzAlYbQ/0NuGlFxQqXAq2x1C4iV2EKY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=U25JLx1cmAY+jpWLVGD0vUDAi4OfIKit6ldTPXGNtCcvkl9+Yrzln8DVc2doXdj47
	 xkjFrBz9Y0tEP8myMxUKQ+JIcpBpW0fDmzwH06jInApIkXhzRwIVFIvB1WiFriwrNR
	 xI3x/NzJTpC5sTT8TPYBqvS+VuoGYrJMI/iUyyJweJ56UajtNkFmZU8WrgOKFisF7S
	 45ZLrk8Hmbw+IGf379X4/KP+kZibwO5oxFGkPmlyH8cNr05oCqD4GL7fQD2zKjlnsB
	 W6m1TJonDGklm018uSSO7ZsLp+Hjbl5gIWd38Z4Sjv6Rq5//RstYDhsNM6UUaZ8ue6
	 JYR+B7fjy/d7g==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 03690120007A;
	Wed, 30 Apr 2025 16:04:13 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Wed, 30 Apr 2025 16:04:13 -0400
X-ME-Sender: <xms:PIISaMl66q4oIQvefNEDkOI1vL_wBtYRNWEX8IlLtlVykoJRdjBLTA>
    <xme:PIISaL35aOu31TsXpttNJagiKcZuvx3e8XY8ThmPsByKQnTQNOnX_DjzklWsRsEmx
    v8-chyMEUsn9JataY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnh
    gvlhdrohhrgheqnecuggftrfgrthhtvghrnhepjeejffetteefteekieejudeguedvgfef
    feeitdduieekgeegfeekhfduhfelhfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvg
    hlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprh
    gtphhtthhopegtrhhishhtihgrnhdrmhgrrhhushhsihesrghrmhdrtghomhdprhgtphht
    thhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehjrghmvg
    hsrdhquhhinhhlrghnsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehfrdhfrghi
    nhgvlhhlihesghhmrghilhdrtghomhdprhgtphhtthhopehjohhhrghnodhlihhnrghroh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhohhgrnheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepmhgriieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhdrtg
    grrhhpvghnthgvrheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:PIISaKp7rqOCdVGbRA2HZDpQJhnVGN5XFHi05juz8PVw8TSEVKlDxw>
    <xmx:PIISaInPACZ2CgKBMH-zw7kJQJ1mlVk92P2laGAC8_MMSsa3IlDHTQ>
    <xmx:PIISaK03XUW8ZeWNLPhTfV3ir-Y9kQd2S23QilEqOqABzQsbMg9m1Q>
    <xmx:PIISaPu-GCM62oFJ-kntqLgaucGOboWPKtoLJoev1nyKI1lVPIQ2Yg>
    <xmx:PIISaGVkIFm3CLtJ7Ou0CatlVuNOkKpCPShcUnK5NeUi2Dujl8k9tTr4>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B7E0D2220074; Wed, 30 Apr 2025 16:04:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T9031dfa3c80e4b2d
Date: Wed, 30 Apr 2025 22:03:42 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Sudeep Holla" <sudeep.holla@arm.com>,
 "Cristian Marussi" <cristian.marussi@arm.com>
Cc: "Marc Zyngier" <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
 "Jim Quinlan" <james.quinlan@broadcom.com>,
 "Florian Fainelli" <f.fainelli@gmail.com>,
 "Vincent Guittot" <vincent.guittot@linaro.org>, peng.fan@oss.nxp.com,
 "Michal Simek" <michal.simek@amd.com>,
 "Sibi Sankar" <quic_sibis@quicinc.com>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Johan Hovold" <johan@kernel.org>, "Johan Hovold" <johan+linaro@kernel.org>
Message-Id: <94e94c5f-210b-43b8-99bc-e7ad7da2588d@app.fastmail.com>
In-Reply-To: <20250430-efficient-spider-of-criticism-e857bf@sudeepholla>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
 <20250429141108.406045-3-cristian.marussi@arm.com> <aBHXHnXA95TwJths@pluto>
 <868qnhj2yf.wl-maz@kernel.org> <aBIbC15NiqUseZc7@pluto>
 <20250430-efficient-spider-of-criticism-e857bf@sudeepholla>
Subject: Re: [PATCH v3 2/3] firmware: arm_scmi: Add Quirks framework
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_130416_035018_F2106E17 
X-CRM114-Status: GOOD (  12.81  )
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

On Wed, Apr 30, 2025, at 17:26, Sudeep Holla wrote:
>
> Arnd,
>
> I don't see much discussions on 20250407094116.1339199-1-arnd@kernel.org
> to conclude if you plan to get this for v6.16
>
> We probably can wait to push this $subject after your changes land. But
> it would be good to know your opinion here especially if you are not
> pushing your patches for v6.16

I've pushed my branch to the asm-generic tree now, so it should 
show up in the next linux-next.

Cristian, I think you can keep the __VA_OPT__, as the build bots
should stop testing with older gcc versions once my series is in
linux-next.

    Arnd

