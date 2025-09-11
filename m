Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E22CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xezEPREPJQkkrl73Yff7UEqumVCaWAif9r9fc2gAvZU=; b=FJmnavSrF0z91tTlq1tb8AfSui
	5ZaF2XlPgAEYSAoUx7YUFpob0mMjBByLi3OzUviz4RgxPpQE9XBf1Qrm09M3cXT6NhluG48/n5hwb
	1uw98ZyYrWFBq5D95n/6TD4TtjGWnFp5N/kWLXfV7aMNh0mXYATfDCk+VqbTJ2sLNYKC8dFhYTP7S
	3LGcrVxwTat4tPz5/a2oFKC9kt215lzy6EBEfypyCoG/tfJV6edDtkH+e0xaQgdcSTBrtYJRU9UL3
	IGdztzD7ryqb4hRClEgqVZrf8foPul9HOFBmGBhJYJLzWdp2rAzKJ9ANXXIV9crK86LXeBeX3FIOp
	iPFUKGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwc9q-00000001dTS-0aC4;
	Thu, 11 Sep 2025 07:55:54 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwc9n-00000001dR0-3DQX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:55:53 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 612031400147;
	Thu, 11 Sep 2025 03:55:48 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 11 Sep 2025 03:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757577348;
	 x=1757663748; bh=xezEPREPJQkkrl73Yff7UEqumVCaWAif9r9fc2gAvZU=; b=
	Iu/xuWaoII7KNzuVcloK0wQmhd56+d5wX0Bleltp/a1sZa3XhGzX/yG9JsPSkl/7
	2cu0Mu9lmvGcmqeKU6/KrMP/1aCgzIef4N/ewbqrmGkduxdjqLHlEalPav5le4TA
	+jbgQ1Z+mvU5GokUwPzbGIhEj3HxlMneK0jBDzXQV6kMI00VxiXlnhook7P+C5Y7
	UriP1BgBZbVa1zMIyagjnMw+2sY7iskhAR0+3srbSjSH0y3Yg7G1I2wCRXsEXXYs
	8KS2JECjFLMhfIZNMjx0egOaiCksw2shqo/EvFx/UtUO1SZUtqDZzPy4b136cHwy
	fnHZvT9pGYqsuKxHDCD1Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757577348; x=
	1757663748; bh=xezEPREPJQkkrl73Yff7UEqumVCaWAif9r9fc2gAvZU=; b=X
	IlM4cTNCufTDuTwE3rh5KIXiSVCwiy8YX9A8fo53sWQ4p2TKGrlQ/9DVCBOHTBG0
	ffEsLPh+36l9na0nrD2CgxP/dy96GoNkRtEQRzG5aK6nn56aYQGtYTO9P7Y8UiUs
	an20A9oCUfkbsypc1JODoplvQuBjF8st8s1x31lQ2U0SYE4Jn1XlEMxhnjGHJwJg
	CNtYItDmOsxdBDmvbtNp8EHZzfn0AGkDnlRRUoNT54QTlsnpmjuslvLqJymldyuB
	7h+E3hJYEoPPv37Hpq0Dkh4acaBuHq9oAPE4oR1s4jxxyqb8Wde0k9toW89TrDKm
	U4uNM1J+ErI42a2u/TYQg==
X-ME-Sender: <xms:goDCaKLlbLhafX1ItUb5fO7F7xQAPgD71xlygMsk3wgbEP7eJM2VEQ>
    <xme:goDCaCJu-9GwvmuDVC8Y37QomJEPe0pHbKXVqPPiqeh9QFxf908KEUF8un4MQt4Yp
    DHkwlYQwPBqiaQ5cv4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvheeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvg
    gvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghn
    uggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgih
    hordhprghrrggtuhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgv
    nhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:g4DCaPln0xPi_AdWtVR-mPv6uC8M-3Q_mjf16Kd5LjcVVSzFRbJ7CA>
    <xmx:g4DCaDlZzyLWYRlZII_JRVLfe6viWHF9oK_S1UNgWncQPOR1vmL64w>
    <xmx:g4DCaJdy81733zjxS4Q3r5w2j6PHhciLt1QMfw2trLXRldoMsUuYcw>
    <xmx:g4DCaJIi6RXGIaczaDEPnKMDiC-8AkssR85-snNhqeii8rn1LFIfJA>
    <xmx:hIDCaH7vVqOM0fbJf4funeExzGloqdRoMAB7v2eOhCknP0mHQleXCcBx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D083E700065; Thu, 11 Sep 2025 03:55:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AmcCJOTBQ5ho
Date: Thu, 11 Sep 2025 09:53:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andreas Larsson" <andreas@gaisler.com>, ksummit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>
Message-Id: <363853cd-7f10-4aa9-8850-47eee6d516b9@app.fastmail.com>
In-Reply-To: <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005552_473677_9D61E5A2 
X-CRM114-Status: GOOD (  17.72  )
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

On Thu, Sep 11, 2025, at 07:38, Andreas Larsson wrote:
>
> We have a upcoming SoC with support for up to 16 GiB of DRAM. When that is
> used in LEON sparc32 configuration (using 36-bit physical addressing), a
> removed CONFIG_HIGHMEM would be a considerable limitation, even after an
> introduction of different CONFIG_VMSPLIT_* options for sparc32.

I agree that without highmem that chip is going to be unusable from Linux,
but I wonder if there is a chance to actually use it even with highmem,
for a combination of reasons:

- sparc32 has 36-bit addressing in the MMU, but Linux apparently never
  supported a 64-bit phys_addr_t here, which would be required.
  This is probably the easiest part and I assume you already have patches
  for it.

- As far as I can tell, the current lowmem area is 192MB, which would
  be ok(-ish) on a 512MB maxed-out SPARCstation, but for anything bigger
  you likely run out of lowmem long before being able to touch the
  all highmem pages. This obviously depends a lot on the workload.

- If you come up with patches to extend lowmem to 2GB at the expense
  of a lower TASK_SIZE, you're still  looking at a ration of 7:1 with
  14GB of highmem on the maxed-out configuration, so many workloads
  would still struggle to actually use that memory for page cache.

- If we remove HIGHPTE (as discussed in this thread) but keep HIGHMEM,
  you probably still lose on the 16GB configuration. On 4GB configurations,
  HIGHPTE is not really a requirement, but for workloads with many
  concurrent tasks using a lot of virtual address space, you would
  likely want to /add/ HIGHPTE support on sparc32 first.

When you say "used in LEON sparc32 configuration", does that mean
you can also run Linux in some other confuration like an rv64
kernel on a NOEL-V core on that chip?

Aside from the upcoming SoC and whatever happens to that, what is
the largest LEON Linux memory configuration that you know is used
in production today and still requires kernel updates beyond ~2029?

      Arnd

