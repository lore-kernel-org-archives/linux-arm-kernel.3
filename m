Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096ECC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 08:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZTRJDBNNgYDkCBY6upcyYXVnBhkGlf/cu+m+M/6vIQ=; b=d3m+Gj0Suc8p8B61EZlUwwsdKP
	4qiM232VtZ5J9ZGvwiCAdopPvnGF6DD9w3/VA3OG0U9hFqqKxkPy4+30C5GnxSZC4VMv5Yy5qFjoj
	qvyqQpOtsaM1VcG8YGUmrOocFmDTsGRCLTqQdKceKZ/ybJUuRaLgWONOrwlZC9PjdI4G4Yq771czy
	RNsOsaf/mooRG5Wf0WVdpoU4RlRpIX/bat9Dkj0vWpVOwNmvCsphA5gIB9YwWV5VqbXfvmFNVO0HT
	Sy+Qc4qtioQN5Jpxr8nQ0tpDUWhmBrhxk/zT4EglbgnihVhKe8nVQX7bVyLY0UMmMlk/XkTGWt6q5
	I8dwkc5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cpf-0000000BD86-26x7;
	Fri, 04 Apr 2025 08:55:23 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cno-0000000BCZP-48uD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 08:53:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FA204340C;
	Fri,  4 Apr 2025 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743756804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SZTRJDBNNgYDkCBY6upcyYXVnBhkGlf/cu+m+M/6vIQ=;
	b=phXjCmqzZZKxxuJwruXaetuuVy5P0E2DyGB/9ihDxzLCq+CQn5d1CAbwfZaZ+Fmg9BRjus
	7Q5NWpzcI5e6Iwg39kYruOE98vGmVxUWb92md2uia83KBMDgVaDpZD9qfsncjO9bloHYL0
	5LW158MhgkQiGj/JRR4z4HNiKF/TIGimyBmXrN32dWWPehyS1tRmaxMY/ADDmnMiJ2JMXK
	+jXcXkkKQxqOLY710F/sL0n/tx69yrVl2R2/wb7aZ+nBlIIbwoOt1WeP41torkK7+dYjWX
	yZhckxdHE9b9jL60QvNPVyUM1Vvk86wzB9MlfLJgNsMswfGXXzhKQMTmz9R48g==
Date: Fri, 4 Apr 2025 10:53:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH v9 3/4] arm64: defconfig: add S32G RTC module support
Message-ID: <2025040408532288b38dea@mail.local>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
 <20250403103346.3064895-4-ciprianmarian.costea@oss.nxp.com>
 <c4a80c1f-56a0-4cdf-afbd-cb2c13cc0b8b@kernel.org>
 <6ebb8c15-9ff1-4bf3-bbf3-c91aa387d873@oss.nxp.com>
 <dec769ad-5144-4503-9714-d9c83a4c242c@kernel.org>
 <b7d82f31-05d1-4331-809b-e865d21c958c@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7d82f31-05d1-4331-809b-e865d21c958c@oss.nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduledutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheptghiphhrihgrnhhmrghrihgrnhdrtghoshhtvggrsehoshhsrdhngihprdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_015329_780045_048FD1D0 
X-CRM114-Status: GOOD (  24.10  )
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

On 04/04/2025 10:19:56+0300, Ciprian Marian Costea wrote:
> On 4/4/2025 10:15 AM, Krzysztof Kozlowski wrote:
> > On 04/04/2025 08:24, Ciprian Marian Costea wrote:
> > > On 4/4/2025 9:17 AM, Krzysztof Kozlowski wrote:
> > > > On 03/04/2025 12:33, Ciprian Costea wrote:
> > > > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > > > 
> > > > > The RTC hardware module present on S32G based SoCs tracks clock time
> > > > > during system suspend and it is used as a wakeup source on S32G2/S32G3
> > > > > architecture.
> > > > Which boards are using it? I don't see any DTS (nowhere), so I do not
> > > > see single reason for this patch.
> > > > 
> > > > Best regards,
> > > > Krzysztof
> > > 
> > > The RTC module is used by all the currently supported S32G2/S32G3
> > > boards, so currently they are: S32G274A-EVB, S32G274A-RDB2, S32G399A-RDB3.
> > 
> > I don't think so. I looked at these DTS and there is no RTC.
> > 
> > > I do see your point in the fact that this driver should be enabled as
> > > module only after platforms are actually using it.
> > 
> > No, post the user. I don't see the point of sending defconfig patch with
> > RTC patchset anyway. That's different subsystem.
> > 
> > > 
> > > So, would it be better for me to send a V10 in this series with the DTS
> > > patch added ?
> > 
> > No, separate patchsets.
> 
> Ok. I will send out a V10 in which I will drop this current patch from the
> patchset. Also, I will send the DTS patch which adds S32G274A-EVB,
> S32G274-RDB2 and S32G399A-RDB3 usage of the RTC after this patchset gets
> accepted.
> 

I don't need V10, I can apply V9 without 3/4 and 4/4

> Best Regards,
> Ciprian
> 
> > 
> > Best regards,
> > Krzysztof
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

