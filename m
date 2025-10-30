Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEC7CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tb0V2rWF8eK5noQCPf0SL+1neAJPUMgNFsms4dB+ol0=; b=otEK3oGnbhDsBV28gyH7FPGn3B
	RFiq0/bG+z9hYsqAt7sEtgpZkuk6HuVmxaPZl87oSH99EXWbqOZL7cGYgE1xWVumvJy/z7R22RpxG
	cDKM6xrl+LKwml9r0OEgam1rQDvIxYx+55pVmIwHowWadlV7zhONUWWjHlGk4rjxV1kLcueNyxK2I
	S4uNhpKzvu1zx1p+i5szRiyKxybQGSd1/4IuHdtHQd0n7cbjurq3cTB34sLngt0Bw/0CT0TLxdoMI
	yTm4HqnxVZV47ZAN2t61Kxp5x2604tiPUOtwva+V2IkpJCu/jWOUKCeH1DsZllmLiIlwJ6d5Jq6Hb
	c2+/lJfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOgV-00000003pAR-2GXP;
	Thu, 30 Oct 2025 09:11:07 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOgQ-00000003p9U-0UF5;
	Thu, 30 Oct 2025 09:11:06 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CA3CE14001B2;
	Thu, 30 Oct 2025 05:10:57 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Oct 2025 05:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761815457;
	 x=1761901857; bh=tb0V2rWF8eK5noQCPf0SL+1neAJPUMgNFsms4dB+ol0=; b=
	G2IQJO95adkPHgL2RfFliPL7gFRAaAg5OtYxLBIfNxL6pb8jgmaQw5iHi+PTwB/1
	Vi0uKCr977vPjTQ5eQ4qqW1gQlZBDUAtKVlJEu/CdokvPpZxyMRbp5ohwnR6J3bN
	lCwwR1em5n16nPrx89XEHmqlYZTjfjwyeOZfFrSnaf2XZ4lkfFgTqIESaXbVP6iL
	lZnkQEdOYgwEmOtRp6M3EK+XQpl76EOw1wFbyqQoxVGkXl9QdnRZveW0R2NGkxVS
	oxTWMXsysOGEFS6PyZytYeuzEo/9QolWjNItIF+d7Q7XJNbcTLHN3Pzqbftn+b1e
	qqg+I7u0ra2vaQPawxyx0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761815457; x=
	1761901857; bh=tb0V2rWF8eK5noQCPf0SL+1neAJPUMgNFsms4dB+ol0=; b=L
	3ey6p+1i2RRBrNpVwE/AI9rUWRHZasfr2ezQxr6UwMWVWrMlmyMjPCvGSTsAWo+W
	1/b09Ug3Z7mEfj50zKmxvpGFyPXF3B8+t8Rwj1gsZ+M6kGB/DP4aJKcxur3PgyIp
	fWE29kr1BMADTO1SxOe0gxbI+V+812cQ7CxzXgKYwDIKdFrmgDMON3TqFf3qVM5p
	QI2Vb94WY+I35hMl9LS7EfI81Ak9i3VSFKKTStL2YrXEYYggb6mGjWumNMo/OUTm
	7dZl/pBOF3XZGSb2uq2pK7RgMNCqATH3ujTezCWXvykz7EZhgmeoGmu1v76MvcWi
	wV0awuTuES7+yi0gxgtDw==
X-ME-Sender: <xms:oSsDabVPrIrTAdK_m5JigryzDqTJVooQbuI_XrkyLlusjclGGdAepg>
    <xme:oSsDaeZhZSc4TnJ35k38hvg0zJnRQMaRNOPI2tBhQ2gjO25sWUwvzMLKtYjcFNNys
    8Gk9nD9s6HFSZq-_vHpiXqbotvqiOS29gvLA40TiakvO9T5cdnVIveb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieeivddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopeifvghnshhtsegthhhrohhmihhumhdrohhrghdprhgtphhtthhope
    grnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgr
    rdgtohhmpdhrtghpthhtohepkhgvrhhnvghlsegtohhllhgrsghorhgrrdgtohhmpdhrtg
    hpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    rghnuggvrhhsshhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthhhihgvuh
    drphhoihhrihgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:oSsDaWB9qRfihMri8moXwHla_MkZk0GCsxLCxQ2gXBbQ0Mr5TvNOIA>
    <xmx:oSsDaewnx5C0FXH3B4xhDmLLOfzFlFDuMJ6zbBvYV-nIzWbxsiOXqw>
    <xmx:oSsDaS5LiP9Tuuc7OO14BJkDjhsLQyWVBzY56kbZ6v3vKgNerK1j3w>
    <xmx:oSsDaXwp4GkDZ5eFt32DUXgSKHuva78C0j57vuM2rhTuQ06fUCQ97g>
    <xmx:oSsDaSnin9clfra-86r2dbBeGWJnhtq8OAB7muA_mrNh8B9qgws6CvnM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 65CD5700054; Thu, 30 Oct 2025 05:10:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A1uT7sOefpDB
Date: Thu, 30 Oct 2025 10:10:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen-Yu Tsai" <wenst@chromium.org>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: "Mathieu Poirier" <mathieu.poirier@linaro.org>,
 linux-remoteproc@vger.kernel.org, "Bjorn Andersson" <andersson@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Message-Id: <f434165f-1717-41ff-93e4-9be5b7fca929@app.fastmail.com>
In-Reply-To: <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com>
 <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
 <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if firmware-name not
 present
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021102_226686_A7E437B4 
X-CRM114-Status: GOOD (  17.40  )
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

On Thu, Oct 30, 2025, at 09:21, Chen-Yu Tsai wrote:
> On Wed, Oct 29, 2025 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> >
>> > I guess I can send a followup patch?
>>
>> The only followup patch that I deem to be necessary is one adding a s=
ymlink
>> or renaming for MT8188's SCP and nothing else.
>
> The firmware was uploaded in March of 2025, and is packaged in Debian
> Trixie, and was also backported to Bookworm. Either adding a symlink or
> renaming it won't trickle down to users for some time. So this seems
> like a possible ABI break, where the ABI is the file name.
>
> Or maybe you don't consider it as such because SCP hasn't been enabled
> in the kernel in any release yet?

It's normally up to the kernel driver to know about the firmware
file names and the order of trying the possible fallbacks, which
is exactly why I originally asked to not rely on the property
from dtb.

If you want a symlink in linux-firmware, that would go the other
way, pointing the old filename to the new location.

    Arnd

