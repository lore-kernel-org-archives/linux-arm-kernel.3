Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2CF1073CBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 13:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HP8Ua+H3zqcR5FFL8pBvipv7yqRWlacsMq+5qGWr7fU=; b=ExzBjW+T3whNMnYSTcfQCPUxbv
	P1zeHZk9pY1RJioWOnFIAlte3rSmAhRY/8Co4amDDGShwP2u1oy4xYl0KqicQItbw0QTJosO6QAjp
	Tr06ZTveRKYJT0V4FAn+axocF3TLFqEs9X1y+hDVdTeqgyvzj1okUCBylqcB6gr3a1bBVuGte4+ZM
	sVjodGT2pkYJ55B/s892KkiCLvdfOsfAz2Va4BFDuyzwGGwHRQ49194sbgbN1Gfub+3tb8XCyO0dM
	QtqsYBU+lxEO84aL09423npU7T7/aqPcMShAqw0sIMpXZssTt+p+nawkdXVb320ie+nfri1FEeV9T
	YLZKzezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATEV-00000008wQQ-1dt9;
	Wed, 08 Apr 2026 13:46:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATES-00000008wPF-3JXI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 13:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D53744153;
	Wed,  8 Apr 2026 13:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB4AC19424;
	Wed,  8 Apr 2026 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775655971;
	bh=YHXEtl2oP+cV8K2Sx7ZVkKvy3aol+D7ON1x6VTixXeE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=dBkMBPLSwNn5Oz4u9q3bGUCkZ+SspH2Ijjj38IvisJBYF9sksjdgH+mtTTO+AR+zU
	 o7GqqJOqTVvf+63hMJIqTDO6ZtjBBZ1KWW/WEM1jq/pC8roF6HkoAjxBzye3QvgmX6
	 4AU1uBSTwtvFJ8ioX3WFVljd5WPvCr6heCscIHLQwkujU6jTc4f3oFecfcfmyVlc3G
	 il4BSPfgpM0ptAu9TXPBLy4NxtakufGYa9keUdDXNo/h6qwtRIAN2hRUTCZaTqSTbl
	 cJHZ7FKTJtflrQmamStLcBH/HK2RYMbakCEqi1EyriG8h+O1UHlasySLyATodXywVQ
	 1V+omoKGXWyew==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9F0F3F40088;
	Wed,  8 Apr 2026 09:46:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 08 Apr 2026 09:46:09 -0400
X-ME-Sender: <xms:IVzWaQ4gcC0NrhVrSbE7q39Jy8Zs90inCIjRlTv77A8Mp_4oLiEC8A>
    <xme:IVzWacsNAaKM24d1q05XDE15sD7k6VfQ_JONTPYalB4YNSwmfOvkNTkt__f5WDfEU
    UpSgwn1kHJ8hjhgwf2_iTuG7ncqzDYTAqrFEJhGfenOEcLHND357SbL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvfeejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepvdeuheeitdevtdelkeduudetgffftdelteefteevjeevjeeiheefhfejieej
    fedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflh
    hlrdgthhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtoh
    hmpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghirdhlih
    husehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhirghsrdgrphgrlhhoughimhgr
    sheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:IVzWaTohtTCLTzK5RuZnM8D9Itdv2WHQBKKyNoyMaFKu0eapZJVl7w>
    <xmx:IVzWaWs34L-eVayQRFMw-hmGQqMr3RyX_a4_YGEVpp9P84QMCxjuZQ>
    <xmx:IVzWaZQXUgl4XDOWrkZg1fghcJu5vqZKe8oRI_jSFT21hz53vxmb1A>
    <xmx:IVzWaSqBde724jlvJJubSeIH38atd9oljibiK1xBTJLWwuwC1KTrIQ>
    <xmx:IVzWacLBo-9hqk7SC2t5E8zD_ydnfSqJl57bKu4NkiP__s0nMKrMx48d>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 67B23700069; Wed,  8 Apr 2026 09:46:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AXf1VD975dY-
Date: Wed, 08 Apr 2026 15:45:49 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Arnd Bergmann" <arnd@arndb.de>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 kys@microsoft.com, haiyangz@microsoft.com, "Wei Liu" <wei.liu@kernel.org>,
 decui@microsoft.com, "Long Li" <longli@microsoft.com>,
 "Helge Deller" <deller@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, "kernel test robot" <lkp@intel.com>
Message-Id: <d0624a61-b96b-4b2f-89c2-029e8671039d@app.fastmail.com>
In-Reply-To: <20260402092305.208728-3-tzimmermann@suse.de>
References: <20260402092305.208728-1-tzimmermann@suse.de>
 <20260402092305.208728-3-tzimmermann@suse.de>
Subject: Re: [PATCH 2/8] firmware: efi: Never declare sysfb_primary_display on x86
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_064612_903838_B8AB218B 
X-CRM114-Status: GOOD (  10.12  )
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

Hi Thomas,

On Thu, 2 Apr 2026, at 11:09, Thomas Zimmermann wrote:
> The x86 architecture comes with its own instance of the global
> state variable sysfb_primary_display. Never declare it in the EFI
> subsystem. Fix the test for CONFIG_FIRMWARE_EDID accordingly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: e65ca1646311 ("efi: export sysfb_primary_display for EDID")
> Cc: kernel test robot <lkp@intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Cc: linux-efi@vger.kernel.org
> ---
>  drivers/firmware/efi/efi-init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Should this be sent out as a fix?

