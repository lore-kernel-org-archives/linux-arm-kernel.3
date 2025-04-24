Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAB6C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBh4ID6MkKCq/M6hhKiaGHyKoqoAherEyA+UpyvaMSg=; b=RKoxPhH45osy3FfJAlLFkTIlF2
	paPo7RW+RcZYd0lJIxUNoP8pydsnvDkWknGdLjbYxrWOpBLYki03yXU3oj/Xx0Zhc0jIxBmdGfKLd
	m7/jX0Qilkp8GBI6pJWFjEZr2CfKUiLV628txRGw4tHwL/03PEItTsDcZ5NxB7K6NQiH8XDC2Ogcc
	6dtpBizFOkRsv6nGgh26euxB4qC5G+YYlCSoCbFuRcZV/HATjsSKdf8QKIa+eW/rOejVlelCsQ7ok
	MBXmbcDducGR+XJe4kvbdLHVo9RSUUBckl6YLioJvec/KPytYV+RFEfemS+06TyH0WnyPgGZMtw8T
	Dueq1vUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pjV-0000000Cw1I-2ded;
	Thu, 24 Apr 2025 06:06:49 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7phY-0000000CvsB-0OCF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:04:50 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 45BBD1380516;
	Thu, 24 Apr 2025 02:04:46 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 24 Apr 2025 02:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745474686;
	 x=1745561086; bh=yBh4ID6MkKCq/M6hhKiaGHyKoqoAherEyA+UpyvaMSg=; b=
	gwxlHovpSTKyDeFIppa5bCcrVGSsJB/+f2mcAFPhs1/pQgcIhTfuzOKsTjrrp1T9
	VSOojdY8cs7dDI8GLbIMH+SoJ7K+fMq+axomhVQ6F6Ds0FzwAPhQlg0rF18xK4Vp
	Z3Gs1s5vyjE2Mo0rcM+mdcPE9vy62Cvhl0XsWyYot89vOrJTACl1veVhmwCEBvnn
	8jTeUehIJo1GD1e5upX2Uq8u7Zbus2WhIPK068ZSfuNSWhQ0vbd9Bh6daNucWuY/
	OVd7OY7KZa4Qja1rhU1R9pDL+58o5kFO4zmMtTCVm3nffaFkp6md4Nu/ImBcsM+E
	Y5jtq/2xCldlsuV1Sj0bDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745474686; x=
	1745561086; bh=yBh4ID6MkKCq/M6hhKiaGHyKoqoAherEyA+UpyvaMSg=; b=U
	ao+/955wa/Bozix8BLdU9hQC7uYDp3vGE8STUU78n9rqIXPiL2gEIy7bT0Pz/VPX
	K/vIu3jMSPDu9lwgMxDaVFkubO8w1RGGoIJDbuqkasHUPiP9al4shvyU8edq0R7T
	T1f+lF/9B7H5JMcJ9AqKcQw5lpZLMTKV4CA1IX9ac8rAxzQ8THtcCIUzmt7VpVpm
	7Wute6P92tusFJqlfczwwXV3PYPg7E1+dd0OzkhE3frvznx21zAb4mE+GUaf+XiQ
	kGlaFWHKj94KW1d1oX/+IbOr1opR2RAk9abZpEwQso1SK5uNC/mN5GcnbulTzqMb
	biOccq4oBbe3yjV2yEv6A==
X-ME-Sender: <xms:fdQJaIn7xa72vY7lUr7PCGvUwauTir5mXw6AlnO8G3jZN2abRqaCrA>
    <xme:fdQJaH1Li0L8QDzDQ17VjNj2rSpipZ-p7eVigQQrc-CofargJSJjIJliZq68JNxq6
    U64JuQ8XneIwJVvGbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepsghijhhurdgurghsrdhjiiessghprdhr
    vghnvghsrghsrdgtohhmpdhrtghpthhtohepphhrrggshhgrkhgrrhdrmhgrhhgruggvvh
    dqlhgrugdrrhhjsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopehnfhhrrghp
    rhgrughosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegsihhjuhdruggrshdrrghusehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheplhhumhgrgheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihsiiht
    ohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:fdQJaGrKvW9RFZhk7RudXGzsxEG1Q9E-Aq-awWO7knlTOGHY4v7NSA>
    <xmx:fdQJaEnXReKKywGOEAMBqbrkLrWpnUfpqmwxyqJEaDu0w8ZjwEFc0A>
    <xmx:fdQJaG0EuBhMbuY6PCvY5E_PVj_z8Q1SiYttWtHz0vv_uOUUc4oipg>
    <xmx:fdQJaLtstvXdjPwaAHuyJbLGjWruj7XMs4NVj808VxW5H0f4NgivGw>
    <xmx:ftQJaM7VYztCNU_C38sF2Ld24pyAaT1mbvWPpSqIiSRIaQMOIAwRqjyZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E06C2220073; Thu, 24 Apr 2025 02:04:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T706ac2956bd1c4f2
Date: Thu, 24 Apr 2025 08:04:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Taniya Das" <quic_tdas@quicinc.com>,
 =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, "Biju Das" <biju.das.au@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Message-Id: <6d3fe783-05c5-4742-a8f9-37a41e1caedc@app.fastmail.com>
In-Reply-To: <20250424054050.28310-5-biju.das.jz@bp.renesas.com>
References: <20250424054050.28310-1-biju.das.jz@bp.renesas.com>
 <20250424054050.28310-5-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 4/4] arm64: defconfig: Enable Renesas RZ/G2L GPT config
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_230448_886634_046480B8 
X-CRM114-Status: UNSURE (   6.90  )
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

On Thu, Apr 24, 2025, at 07:40, Biju Das wrote:
> Enable PWM config for Renesas RZ/G2L GPT as it is populated on
> the RZ/G2L and RZ/V2L SMARC EVKs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

I assume Geert will pick this up through the Renesas tree
and forward it to soc@lists.linux.dev.


