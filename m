Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A95CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 23:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfeAfWg+IWTxPeqmknww3EatCKkRqqTiNS+SFy7zDy8=; b=UjveK93uCISgBk4vHunUBJHeB4
	P9G77pk4tYvkqIXajbh/vAVrLDqJonTVt+k0RM1i8ryMYqGUbrdvV1AOvhQT1fDsf5dAVt1YbduXQ
	WX5CXaGQSWjlNiodorJNDjsRoczeZhKDO66AuYaydsA9Nrm8hf7IV1yKoqtXFoJw26bJU8fgxsBcr
	IoMpcr5V17KutHktcYmUtOwImJNvTNIUjR/r/4wUlv6QIMRiX799khEME4G6LYPZ8aTSf+F8z2cKg
	qecDfVPwlKioaXMi2Km3n/3p37P3qLf7vv3LuspsW4Z2R9TWs/uQjivQewNy8ZcRqW6AlWfJXrRvY
	IbQkt7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG3tN-0000000Am6y-0v8e;
	Mon, 03 Nov 2025 23:23:17 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG3tL-0000000Am6d-0oh5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 23:23:16 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F134A40AED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1762212190; bh=jfeAfWg+IWTxPeqmknww3EatCKkRqqTiNS+SFy7zDy8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C7PZi8ouCV7iZa59u+XIrElecjYmTtEFsaisx0hWWOJo13R5FX9nYHvuJRn+d9m/3
	 G+u2qR2tbuu0nzKy7e/8cy9QLbwqviODfTpNYimSGyYBTVQc7TkTcvo7gkQ1rnmRj+
	 3FsTgsmzDNqCe+orVXZIDYgMQHa0/QauBGyXKnc8u0JpcIwybwl6Fo8Og49W8yxM2O
	 c1+39723JTDAD3p9VR7EIq3bX0NYXv7baxQsvwzu/8XpTQzmTJMKTC0ZvfGQN6aMeH
	 dQnO7JQlIVoaTQjXHW17da3+xsLlZYozde36YYcjTTssIGHtYiV5jHLamyMfOmktit
	 ULWemk3qQDBOg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F134A40AED;
	Mon,  3 Nov 2025 23:23:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
 <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Documentation: treewide: Replace marc.info links with lore
In-Reply-To: <20251031043358.23709-1-bagasdotme@gmail.com>
References: <20251031043358.23709-1-bagasdotme@gmail.com>
Date: Mon, 03 Nov 2025 16:23:09 -0700
Message-ID: <87o6pibt0i.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_152315_237696_2853F18B 
X-CRM114-Status: GOOD (  12.68  )
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

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> In the past, people would link to third-party mailing list archives
> (like marc.info) for any kernel-related discussions. Now that there
> is lore archive under kernel.org infrastructure, replace these marc
> links
>
> Note that the only remaining marc link is "Re: Memory mapping on Cirrus
> EP9315" [1] since that thread is not available at lore [2].
>
> [1]: https://marc.info/?l=linux-arm-kernel&m=110061245502000&w=2
> [2]: https://lore.kernel.org/linux-arm-kernel/?q=b%3A%22Re%3A+Memory+mapping+on+Cirrus+EP9315%22
>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/driver-api/usb/writing_musb_glue_layer.rst | 2 +-
>  Documentation/mm/active_mm.rst                           | 2 +-
>  Documentation/translations/zh_CN/mm/active_mm.rst        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon

