Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D52CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 05:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4SmUX7P+kpNB7OaZvmmYUNeRGLdLLWkUbpUICDS3qY=; b=2/Saei7cuQWM/BngWPKNrXw2bz
	VBvAOEsVw3nD4yY10zKYuhk2HSGK+xwFXgWbMqSTO64VKmzeks7Adm1VWfAH9goCFFAjeJNa+bb0H
	kkeA1qZuFz1hR764lbeJPofFGSsU3IM0iB2PDenKWGR7b/FaZC/qOqzQohaZwbH8L9IkbsYtqcpq+
	dZwLKKmlkxYfkbdmBZq+v1G24lOpHVJarlgGDUhybRnPc/51Z9hIpvuuz04wKT7H0kpau1/z7qSUy
	xrmTrb9F3rwbzi7yjEsc3NvU7vuXOgEv0wD2BF8eSX/6aDeoBgMvT3SGHDf89ItWQYkOzxQn9+d87
	wsfOs0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwa0t-000000012bl-0tk5;
	Thu, 11 Sep 2025 05:38:31 +0000
Received: from smtp-out3.simply.com ([94.231.106.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwa0p-000000012XP-2f5D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 05:38:29 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4cMmYn6jWzz1FQVw;
	Thu, 11 Sep 2025 07:38:21 +0200 (CEST)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4cMmYn1PXCz1FQVP;
	Thu, 11 Sep 2025 07:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1757569101;
	bh=J4SmUX7P+kpNB7OaZvmmYUNeRGLdLLWkUbpUICDS3qY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Hs7ZfSyDOM7aPRu33LOA+3yef+fVto4kU9xa+4YpClIxfuXs1fUOvHNHSbYzTsH95
	 ys3zgWHJHS23RTioc6nK1rRkrbxCam9D5ptr5a/DgIz7xpPRDCQ6Etyd5bStpWc73w
	 7yOC/+8Ounc2FdB1AGu5KYNtNxw+XWF0Y0vJdIXiwXVxxPzwE6FGqoMLKjGAvRTDu6
	 0tRpQ6v9KDjievFY3f8w6p8LSH1LMGdoj0SQczd00LYltcWoPmKILRmn5F8FOypXFd
	 6Zp6gO/YqFuyTXHhSNlsS6DU3Zk+NRltjlY23ffJsltCzkH4eal4Sp3ahPCc/wsqRM
	 gmrx1Brnia8oQ==
Message-ID: <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
Date: Thu, 11 Sep 2025 07:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Richard Weinberger <richard@nod.at>, Lucas Stach <l.stach@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand
 <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_223828_046264_55C51ADB 
X-CRM114-Status: GOOD (  19.05  )
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

On 2025-09-09 23:23, Arnd Bergmann wrote:
> High memory is one of the least popular features of the Linux kernel.
> Added in 1999 for linux-2.3.16 to support large x86 machines, there
> are very few systems that still need it. I talked about about this
> recently at the Embedded Linux Conference on 32-bit systems [1][2][3]
> and there were a few older discussions before[4][5][6].
> 
> While removing a feature that is actively used is clearly a regression
> and not normally done, I expect removing highmem is going to happen
> at some point anyway when there are few enough users, but the question
> is when that time will be.
> 
> I'm still collecting information about which of the remaining highmem
> users plan to keep updating their kernels and for what reason. Some
> users obviously are alarmed about potentially losing this ability,
> so I hope to get a broad consensus on a specific timeline for how long
> we plan to support highmem in the page cache and to give every user
> sufficient time to migrate to a well-tested alternative setup if that
> is possible, or stay on a highmem-enabled LTS kernel for as long
> as necessary.

We have a upcoming SoC with support for up to 16 GiB of DRAM. When that is
used in LEON sparc32 configuration (using 36-bit physical addressing), a
removed CONFIG_HIGHMEM would be a considerable limitation, even after an
introduction of different CONFIG_VMSPLIT_* options for sparc32.

Regards,
Andreas


