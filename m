Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91DA10AB82D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 22:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:References:
	In-Reply-To:Cc:Subject:Date:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVhTS+rSfnyJGM/kliwPbFcxsz7RD9CsUGsL6T806Xw=; b=YnU7GFEqm+XCt18QIymqbNfJ4x
	O1Ltq7WFj/fiZE34OsLrbbPQOZA1DwHUwmR+P2p6MA/VTNXN5AzZLAnlRtZNXoO0YWHNGn9OIEbzL
	c8wdmwubGwpVkLbcODYbnWZtBexzmHv9K+KhzJDHq6uAjlL+P1RRExfz2IYArw8QuYQuqg6o8hpP3
	qPshkTaQdyn5H7r4GUhImWxRwUkQl7CcMKdC9aAAOQH4HZ5VhGOftdymwVgcQxEYWN+q8o5J8f6pW
	P8jTTI7xrox3OhTV6UeBJ84idXWabd5c5qXOJWnn9i3DgdN1uzJwtiLAfE1zgS2xizXNQCf6byKf7
	WCHpxHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sxX-00000006IDg-3Rv5;
	Thu, 26 Mar 2026 22:13:47 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sxO-00000006I2n-17lh;
	Thu, 26 Mar 2026 22:13:39 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 79A31EC021F;
	Thu, 26 Mar 2026 18:13:37 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 18:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774563217;
	 x=1774649617; bh=RVhTS+rSfnyJGM/kliwPbFcxsz7RD9CsUGsL6T806Xw=; b=
	d3NzGUvZCCCek0IdcQ+Z3AEOlme+tlgy//ftGm7/6F3XSh/ZzhGenuUBtmCzYymB
	mjoe3XUHXbavnHjaCiB0O8SWMwQ2Dncnect5tkHCvk9f9QIzHOs55SGKTuhJk8mi
	aYOQnAolthzhnn9rqImoDxcqss85ZvHpfLQHljsHcEvLF8x4QHwZ10/c7XuI40c5
	BjjcPHwAIR9tAucpVJh9zkpHhUn6DjKb8098hvLZAGGUIR54nrkU6X59OvaQcR9V
	vxC3wQQAyy3krTcDQj4K3Xcl+VQTyjPGaR4m/QDTICY78t8o/emH2JnlmPsnDPma
	2NY4q9fygGFfsrxH1zT10w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774563217; x=
	1774649617; bh=RVhTS+rSfnyJGM/kliwPbFcxsz7RD9CsUGsL6T806Xw=; b=C
	WsBgfFoauFDemzQiEV11ZhY871P1HBOwMH7IcRRyEI1kYnxl54ILYIUVQRXggUFE
	f5tfZRhgw6lYuAyp9Upzi7O4+CPfjYAFH+JLVcyVxgjUlXpRNVRjd3kZPwojRQSZ
	2+iok2U0hBqDNj294NiHLTK5ioZTFsFUfxDmxmpBVaHvLcZRB7O+TWP+KfLdXC0S
	0edtOz9rgGo2Axb6DomUzpbiRsxJBSPSbhjwg5Owmshb8toCGffZN6n4Op7pyt/1
	YKJYMbEPRq/fNcZgpUOEPSgn0Mkl3vrNb5LpDSgpoDZbIvV8wZ974IJCco+jQ7ST
	kBn20A0mEjukLfOBkoH5w==
X-ME-Sender: <xms:ka_FaWr6wrTaBWNj7a_DuGexI8MuuvfxwSrmZto9EJlJlUwy0tvpBA>
    <xme:ka_FafeuRsV3Qd7vL3bwMRCpm7aWU3YI1plBEuSBoWEmDNUFqm02_cCWdatDEDiTf
    JV6p1klri2o6AEy7OeQZ-vcGkFDsLkZoyLcZZhPqqwvoozXjUO3SFcI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegopf
    hokfffucdluddtmdenucfjughrpefotggggffhvfffufevjghfsehtkedttdertdejnecu
    hfhrohhmpeflrghvihgvrhcuvfhirgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtf
    frrghtthgvrhhnpeektdffveejhfeffeevgfefhffhuedvvdfgfffhieetleefvefgfeek
    tedvffffgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhmvgdp
    nhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnh
    hgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgt
    ohhmpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpth
    htohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgigv
    lhhnrghgrgesghhmrghilhdrtghomhdprhgtphhtthhopehmrghrtggvlheshhholhhtmh
    grnhhnrdhorhhgpdhrtghpthhtohepshgvrghnrdifrghngheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqsghluhgvth
    hoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ka_FaW3v_uKhki4A7iMBwl-20BnPBe3izw8xGWM1E10mgYbUXI6BTw>
    <xmx:ka_FaXVlnFKujDYIYcSEkElF1_L524kX_yVUYrpu5VQq0-Cl_bhdlg>
    <xmx:ka_FaYOU6KRuFwTy1Jc2q-UzaH5ziaCjXxfcB6sw7vS6gEymapt47Q>
    <xmx:ka_Faa3AHaZDjL4JZRK4p8-P5-QXGfajqPzmyixbDsxQB5CoABeWrA>
    <xmx:ka_FaSZIjF8kHqM0HpZJNNHSDOP54yi7oYW5OJUydon4anwK_eMsw3jO>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 525291EA006B; Thu, 26 Mar 2026 18:13:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Javier Tia <floss@jetm.me>
To: Sean Wang <sean.wang@kernel.org>
Date: Thu, 26 Mar 2026 15:26:29 -0600
Subject: Re: [PATCH v2 1/8] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Gilbert <xelnaga@gmail.com>
In-Reply-To: CAGp9Lzrme_J2UyzzG+7AWGU4MKx4yehgUy4biy4ZbtP9OkbfnQ@mail.gmail.com
References: 20260325-mt7927-bt-support-v2-0-b892a3252880@jetm.me 20260325-mt7927-bt-support-v2-1-b892a3252880@jetm.me CAGp9Lzrme_J2UyzzG+7AWGU4MKx4yehgUy4biy4ZbtP9OkbfnQ@mail.gmail.com
Message-Id: <20260326221337.525291EA006B@mailuser.phl.internal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_151338_369638_986C5D12 
X-CRM114-Status: GOOD (  13.36  )
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

Hi Sean,

Thank you for the review. Both items are addressed in v3.

On Wed, Mar 26, 2026 Sean Wang wrote:
> Using raw CHIPID=0x0000 to unconditionally force 0x6639 seems fragile.
> If another device later hits the same missing-ID condition, it would
> also be misdetected as MT6639. Normally this kind of quirk could be
> carried in .driver_data, but since btusb.c is shared, I'm not sure
> that is the right fit here either. This should probably be handled
> through a more device-specific fallback instead of mapping all zero
> CHIPID cases to 0x6639.

Agreed. In v3, the zero-CHIPID fallback is scoped to a static
VID/PID table of known MT6639 USB devices. Only those specific
devices get forced to 0x6639 - any other device reading zero will
fall through to the default "unsupported hardware" path. This
follows the WiFi-side pattern where is_mt7927_hw is derived from
the PCI device table, not the chip register.

> I would prefer using the mediatek/mt7927/ folder naming here. mt7927
> is more widely recognized, and using it would avoid unnecessary
> confusion.

Done. The firmware path is now mediatek/mt7927/ in both the
FIRMWARE_MT7927 define and btmtk_fw_get_filename(). This matches
the WiFi firmware convention (mediatek/mt7927/WIFI_RAM_CODE_...).
The linux-firmware MR !946 has also been updated to use the
mt7927 directory.

v3 sent with these changes:
https://lore.kernel.org/linux-bluetooth/20260326-mt7927-bt-support-v3-0-fa7ebd424323@jetm.me/T/#t

Best,
Javier

