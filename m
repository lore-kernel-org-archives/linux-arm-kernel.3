Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC18FA3727
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xboeX7iqp3yKPiHunSosJbagSL4sCsNu5Hh7gtei0fw=; b=aF6982YXnkLWigjB5oZKnrML57
	UPTqqBgXu0dH9NrPAuUcWG4AuLq6v9F1bR7foGBN9BA/h0HKWKHj8WtAeqm2XyQDx9z64vUdu8fFJ
	Ezm0/jRPrQdZUPd8/V5DFWBujCLirWxYl1QcOtvoEmiLeUASE63PmIxP9NCIijPrDZh0Wb/lj7PVt
	1ZcPCm32px+JnnTCIQXdH0ls5UlKzlPkdnWTwtMbBYUf+1rOCXMiN70kAiBs5hYTmDVT5giwj0JtI
	V4lhp0X8Wzb+/arxSFXTdFJQHIye4Yg+eH84ECQMiYdO4p+AZ8HbVta29wjdEeTnGsXjGEi5ObJdz
	+QLgtjmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbP4-0000000819S-0XCf;
	Fri, 02 Jan 2026 09:25:02 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbP0-0000000818N-2m3E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 09:25:00 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EA5F614000AD;
	Fri,  2 Jan 2026 04:24:54 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 02 Jan 2026 04:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767345894;
	 x=1767432294; bh=xboeX7iqp3yKPiHunSosJbagSL4sCsNu5Hh7gtei0fw=; b=
	aDSBt+A79WKXvc4f0lRnxJqT6zEOJQGqJKzz3e0zmZJkSJ+I98bstXT497fL+tFB
	64XDyFgpEIVa8NioYlhI0HrziMsCSN0iU+XXmsn0KAPjGsTsVCt2Dcg3r31poSVc
	W5XnidRgQUtXRZygFuv+TWGQqtFbnYWrrWCs3b9x2Be0+sJLM4w+w8iA1iBuZEdf
	+8EiLJf34Tc7PHog57vADOP8pL+HoRmCkKZ8ikR8NuW/hL4OC5gN+kCYdEn/2NJS
	S/u5ahvNqCPn/ne3n9p3RfSGFCv4L3HnVMI1//ygbE7YCKZFZ1mjcP9Orw66q9MZ
	zkq4O2KDvRG470mIqZNxfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767345894; x=
	1767432294; bh=xboeX7iqp3yKPiHunSosJbagSL4sCsNu5Hh7gtei0fw=; b=H
	gncAOTv5hXasZnfO+DefsoIKG6IcQscodgz1nK3zYRriD4dbYPJUW9OMXhU1MCDo
	ev/NmqZrrb/w7grftiyv2y4H/3cK5kX4RY6NXblDcg8uZtuYjq5DGkC/gzQor3ee
	Gt79KRxlj3XdVtxadlFGLH8WHdsrtBScfBP6FGVZ8D5eUf/xVvadrka7RVZNDQr4
	wVUN1JCjseOCXF1MfpQgr9EtYXsjHdGDaR054RIJfG3BuamBU74W0zrVnS4Bus4n
	eyXYjfF1ZKfkwAaRpbG5A/OF0I31M8oxaE8fVjS0LAmENKOJQ20PQTTLxAcPWHwl
	Z+Mc/XjDX2VkLjITzVJIA==
X-ME-Sender: <xms:5Y5XaYihxTgTDU1PZ-z290UhDEZaTS5s2suS9_yef3GyND0SJtVilQ>
    <xme:5Y5Xab3KNHDn0jKFStcNpwGM4MaHDVjJ-5rVatUc-KGgVgkbrir8d9rx6DpU6uu4k
    Ls1pkf0Ug0-u35alpN3Lqs6-LPgYnPkGiJxudhJuPJmCJZkGQpBscw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekkeeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertd
    ertdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhn
    uggsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhe
    dvvdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtoh
    epkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhn
    uhigrdhorhhgrdhukhdprhgtphhtthhopehrmhhkodhkvghrnhgvlhesrghrmhhlihhnuh
    igrdhorhhgrdhukhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhuhheslhhinhhuthhrohhnih
    igrdguvgdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:5Y5XaRzIjTbUNLrxGr0sqwE_YbxvX-6eNffzwqOge8lpG-o2ae4jTQ>
    <xmx:5Y5XaRsSmW-Q-K1mA_xlGV_8lFLPpH2Iwio-p9VGk-n03dH_YACR0w>
    <xmx:5Y5XacDzW-6O6VxqoF5s4oMP8TDbdqXmRiRW-vjIMMRDuU49G0B1Iw>
    <xmx:5Y5XabEv8cZh6nZOD0UjfmY1X4grWK9bHRazqxmFbV3UnwBikPb-WQ>
    <xmx:5o5XacrIRGAev8YYYemAQzEnmYkiOpUc9zw5f3ALgJqjIDJ-NP0kA6ex>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C5156700065; Fri,  2 Jan 2026 04:24:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AtSnlUpPuEWk
Date: Fri, 02 Jan 2026 10:24:33 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Russell King" <linux@armlinux.org.uk>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Matthew Wilcox" <willy@infradead.org>
Cc: "Russell King" <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <bfd7776e-574a-4828-99a2-f70a3b9015e6@app.fastmail.com>
In-Reply-To: <20260102-armeb-memset64-v1-1-9aa15fb8e820@linutronix.de>
References: <20260102-armeb-memset64-v1-1-9aa15fb8e820@linutronix.de>
Subject: Re: [PATCH] ARM: fix memset64() on big-endian
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_012459_255831_AAFFFF0B 
X-CRM114-Status: UNSURE (   9.88  )
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

On Fri, Jan 2, 2026, at 08:15, Thomas Wei=C3=9Fschuh wrote:
> On big-endian systems the 32-bit low and high halves need to be swappe=
d,
> for the underlying assembly implemenation to work correctly.
>
> Fixes: fd1d362600e2 ("ARM: implement memset32 & memset64")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
> Found by the string_test_memset64 KUnit test.

Good catch! I guess that likely means you are the first one to
run kunit test on armbe since the tests got added. Did you find
any other differences between BE and LE kernels running kunit?

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

