Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4224EE2084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=occQpULl/gPgW6chcNR4KCCY8z8TUeSX7xWZtCapvHE=; b=x8mgnCXfJWiGuZeAh/XVhA57ID
	ZzlSMaPbcd2cPKbkPwhctUpPhhU5dTGlsGRwkbGbkDU+OFmlebmBYukodpsv58XS9+5e4D2P0Nm6y
	b0yF6rQha9UCTFiqer6WsbBv00/p/MWPOg135nkL1jQ9ISuaB9P/9HdKE7RCKwuQ6iSppJ/2/3EVV
	LEFXsWL0pPsC1z6m8kK6fUaCQr577wocB4XuUgs9yB2W8X2qnKvpsMmBbSvq0X8pQo9TFiBGO0Z+8
	xth/DMBzMa4xhZkcxVvcvOd0gT2Xic8g4doM1RmM7ygkPFgXtkGHzDmqZqhIL1FlAAn7sKXiaYQ04
	bPH/J1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJKB-0000000BBsq-0WB6;
	Fri, 06 Feb 2026 10:44:31 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJK8-0000000BBsQ-1RVw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 10:44:29 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7933F14000ED;
	Fri,  6 Feb 2026 05:44:26 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 06 Feb 2026 05:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770374666;
	 x=1770461066; bh=occQpULl/gPgW6chcNR4KCCY8z8TUeSX7xWZtCapvHE=; b=
	BBqtmhxYw9BNu+9B8Qp/Dx4qitlqEDyNjP1345lufodSAIZTZ33EJ7IJghFRfLDS
	5cEgs1On/QIzkFZ/EyoCEDbA8/8b9wwBcNGJc5qCdf52i9CgtD4bLcZDjkDBDycs
	t1gT+nsmvJ+j+56U8hpkqyYlkTWXDdusTHo2iFbrA0QEloiMW0naPKU5Q2SZGsii
	eguFF07FYW7YbKQb1pO/TXetZJ93hREGQ9E+i2InQtuYG/9QvxTVU/VwHp/ilpeY
	Un3PeAGqRtVNb8Ll/fLM79WTjzwyI16Rb0bCIURltl39LxFOjrlQIMQ7pwROro+P
	jAjHJo4rpypY51j36HuN2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770374666; x=
	1770461066; bh=occQpULl/gPgW6chcNR4KCCY8z8TUeSX7xWZtCapvHE=; b=r
	51ryLkaHWokx0CQ/7xE4cvu6QOLDmtT7wEhV08IXTJGbcCbTZDFxXRLsiNCO5dMS
	hztVJ3N7VnKW0iROpqRVu/XFuUiL0mlgnzv9V9oAQ2ZBq6l+I1YF733dcNeiOG/D
	9pbHAlpVaumg7OpxfcsUoTpHaN+K5kdXUFEdn6XsPFfeBwG8BOp5Ik9fBtf2HMX7
	pT+W3aHguzzxTEToWuac2zHfbGDBwNKoHLIIrWbnFTxz3rvsoerItrsEev/8Ht8J
	3c77DYj8l8ZxLiWN0qb+HL/NIFWIaZjtuap97pJbUGKAYxfcJTSicUbPwBBAv68t
	k3C8C1y9Tb3jWkIOMNM2g==
X-ME-Sender: <xms:CcaFaetRzRcU2Ka_8cYdc25oXTB_4L9BpsdDZZyW5fcw50nbxPqNtQ>
    <xme:CcaFaeTWN8R3OIhG5Ct6E5ppFI3fBORWU2o7Sx5ABQAw7t88ruW2N34wDiRF2AIom
    ZDLwPMCNNHNh3ArK4rH_z-dYbJEGFsjnjZYRaXA_cHEu6vjCbjBDzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeejleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepffefheeftedukeegheeftdeujeetudeltdeghfeiueduheeljeeiueehffekgefg
    necuffhomhgrihhnpegtrghmrdgrtgdruhhknecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepudekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnhgurh
    gvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphhrihhmvgdr
    iigvnhhgsehhihhsihhlihgtohhnrdgtohhmpdhrtghpthhtohepfigrnhhgiihhohhuud
    eshhhishhilhhitghonhdrtghomhdprhgtphhtthhopeiguhifvghiheeshhhishhilhhi
    tghonhdrtghomhdprhgtphhtthhopehfrghnghhhrghouddusehhuhgrfigvihdrtghomh
    dprhgtphhtthhopehjohhnrghthhgrnhdrtggrmhgvrhhonheshhhurgifvghirdgtohhm
    pdhrtghpthhtoheplhhinhhugigrrhhmsehhuhgrfigvihdrtghomhdprhgtphhtthhope
    hlihhuhihonhhglhhonhhgsehhuhgrfigvihdrtghomhdprhgtphhtthhopeifrghnghih
    uhhshhgrnhduvdeshhhurgifvghirdgtohhm
X-ME-Proxy: <xmx:CcaFaYQvhOUZ95lO6PcfXTwhDCdQLZZHD7p2pIUaXNr-ZqVfnGUyaA>
    <xmx:CcaFaehu0V7WpoxhHE6SyLUTFe3QZPb0bhDVUnanKDGA0iaj0s0vIQ>
    <xmx:CcaFaUjIT0GH6Wo7Vi-hMEstSc58YAwo65sAdBSQ3_ENCdWkLApq-w>
    <xmx:CcaFaeaNY_H6taDhY781p8MobEFOZZBS1zhNQA7qXS3y3I5nfL6RcQ>
    <xmx:CsaFaakcyqyusntsqHDgQ-oOnmPfM4hlgDTkuZ5gpY8nbnBJ6H25KjNB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 571DD700065; Fri,  6 Feb 2026 05:44:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AdHIckEZVcNF
Date: Fri, 06 Feb 2026 11:44:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yushan Wang" <wangyushan12@huawei.com>,
 "Jonathan Cameron" <jonathan.cameron@huawei.com>,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Drew Fustini" <fustini@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Will Deacon" <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fanghao11@huawei.com, linuxarm@huawei.com, liuyonglong@huawei.com,
 prime.zeng@hisilicon.com, "Zhou Wang" <wangzhou1@hisilicon.com>,
 "Wei Xu" <xuwei5@hisilicon.com>, linux-mm@vger.kernel.org,
 "SeongJae Park" <sj@kernel.org>
Message-Id: <55e3766e-e292-4136-9e8f-2098ffd53b5d@app.fastmail.com>
In-Reply-To: <4c5eaf8f-2433-4971-b5d0-4f35acb2820e@huawei.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com>
 <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
 <20260204134020.00002393@huawei.com>
 <4c5eaf8f-2433-4971-b5d0-4f35acb2820e@huawei.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_024428_601831_50E7E851 
X-CRM114-Status: GOOD (  20.53  )
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

On Fri, Feb 6, 2026, at 11:07, wangyushan wrote:
>
> Let me try to explain the use case here.
>
> The idea is similar to this article:
> https://www.cl.cam.ac.uk/~rnw24/papers/201708-sigcomm-diskcryptnet.pdf
>
> Suppose we have data on SSD that need to be transferred through network.
> We have technologies like DDIO and IO stash to make data flow through
> L3 cache instead of DDR to avoid the influence of DDR bandwidth.
>
> But if something is to be done to the data instead of merely copying,
> and cores needs to participate, we'd like to make data to climb a bit
> higher up through the memory hierarchy and stay there before data
> processing is done. That is, correct amount of data being fetched to
> L3 cache, and consumed just in time, then free L3 for next batch.
> It is more of a userspace defined pipeline that utilizes capability
> provided by kernel, where cache locks are allocated and freed quickly
> with batches.
>
> In above use case, C2C latency is chosen to avoid DDR latency, precisely
> which L3 cache to store the data is not required. (For this part maybe
> including steering tag as the hint to choose the correct L3 is a smarter
> way, like AMD SDCIAE).
>
> Memory management is, in many way, independent to architecture and
> vendors, we might not want to take hardware specific feature into
> account when kernel makes decisions of, say, swapping a page or not,
> but we can control the hardware resource to lean more on a process,
> like resctl.

Ah, so if the main purpose here is to access the memory from
devices, I wonder if this should be structured as a dma-buf
driver. This would still allow you to mmap() a character
device, but in addition allow passing the file descriptor
to driver interfaces that take a dmabuf instead of a user
memory pointer.

    Arnd

