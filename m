Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4B1CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgKB2qnc/bRPAL5RwjdygVePDYnntw4ZWdIavREWLBQ=; b=KeVpWT6Ri77YWpOcBwUe7t0WHS
	JMabBrc8HKBpM9viQp/mpmks/M5WiWlUN6Y1B82sL+MC0WaY+TqwHLA7XBRB1LyJIXlaDwt7D6lgn
	VxuxadNHf0Cd7Qloe7LCM8vBGI8U1dBvH92VNKicb9KL+HHgTP0iHTnHxSduIewEl5iqzw086urAu
	xU0sU3sQ4UWnE7pa4diHI0s+2ajS7cn9NsXRPqBeFcvGVKRkie3XK1jP+oY3L7CPjkSC+ptEMKAvJ
	hk9/TlJSKLnDfsN1DWdN0tkVjKM9y7YUHEphBtNm5zFD5BhKq7dqS9j0OcIuJdfJxGFByOG4nIwDF
	ySIL8Hig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3jR-00000008C3t-2SWj;
	Mon, 18 Aug 2025 17:33:17 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2PJ-00000007zlq-44z9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 16:08:27 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5CE0F40AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755533302; bh=PgKB2qnc/bRPAL5RwjdygVePDYnntw4ZWdIavREWLBQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FS1soXLa521ujJUbl/402whSSESTHg9tMk1J4yJXD61Dfi279n3ZYdXUxCAqBrXbP
	 7uzuyvggLkYoXlerUj63roxK9vLzAUnVybiJ8ADgblvGi5LkC02Rne6uNwELG05I+6
	 k7OuwJQBxt+73WjptP+fON5qK+HI/wyJ2vePn9MgKDmwsi+JYLLCa/Ou+Yk0IU287M
	 3Bs39RXJcFhH8aA2anPFcTcN3lReE6Ci8Tc22FjnWBpnYKR6l1Y7r40THAF4d2OISs
	 tpNV3csYjY/jWhXXQNvQZbmv84TtmdKAC3lrG0p2OxW0RInDuM1q8EFkKH6kheFgli
	 bhQXe4L9M8KpA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5CE0F40AB4;
	Mon, 18 Aug 2025 16:08:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: hariconscious@gmail.com, shuah@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: HariKrishna <hariconscious@gmail.com>
Subject: Re: [PATCH] documentation/arm64 : kdump fixed typo errors
In-Reply-To: <20250816120731.24508-1-hariconscious@gmail.com>
References: <20250816120731.24508-1-hariconscious@gmail.com>
Date: Mon, 18 Aug 2025 10:08:21 -0600
Message-ID: <871pp8a9ze.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_090826_010516_5083D2DC 
X-CRM114-Status: GOOD (  15.54  )
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

hariconscious@gmail.com writes:

> From: HariKrishna <hariconscious@gmail.com>
>
> kdump.rst documentation typos corrected
>
> Signed-off-by: HariKrishna <hariconscious@gmail.com>
> ---
>  Documentation/arch/arm64/kdump.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/arch/arm64/kdump.rst b/Documentation/arch/arm64/kdump.rst
> index 56a89f45df28..d3195a93a066 100644
> --- a/Documentation/arch/arm64/kdump.rst
> +++ b/Documentation/arch/arm64/kdump.rst
> @@ -5,7 +5,7 @@ crashkernel memory reservation on arm64
>  Author: Baoquan He <bhe@redhat.com>
>  
>  Kdump mechanism is used to capture a corrupted kernel vmcore so that
> -it can be subsequently analyzed. In order to do this, a preliminarily
> +it can be subsequently analyzed. In order to do this, a preliminary
>  reserved memory is needed to pre-load the kdump kernel and boot such
>  kernel if corruption happens.

I don't think this is right.  While reserving judgment on
"preliminarily" as a word, the intended use is adverbial, so this change
does not make things better.  The better fix, perhaps, is to say
"previously" instead.

Should you choose to resubmit this, we'll need your real name in the
Signed-off-by tag, please.

Thanks,

jon

