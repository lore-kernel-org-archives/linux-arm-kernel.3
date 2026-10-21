Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E25606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 02:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gzmTYHR8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NXw/DiN+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/o+ktcXtgylGbQbhfzImy/2UDYuWyqTPPta4Wh5mK34=; b=gzmTYHR8VEme4D64bYTrKMSJ1s
	PffuLCHlNsbRFxvHhTo59UpW+DLKjnRYKVTnNpwGxfzgFkoHDBSFv0tKw7GHtgFW0eT2ZyjiNMOgC
	u3gOCUj1qP99KVN2JrhTCdbGYJ4g69mKaqzRQclh5TxRNZ4ByisHHJ8EQANZMkevPaNwaYv83Zr05
	OsgkIiAtUDgY/Rgj5dmmAtmVafHFX2mQZg3HL1L/Savb8fJTWI+NMYAe8FAJwVCvR0k19rSGUZVTs
	eKbIBB6dsaM1x/QAQrQOHIp7eM2Fw13jkMr8t5LkPjgxnTP4XrXcHvtInd7aNjjouEuxq9Vf4jOkf
	IenTjUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLkw-0000000Avaf-1pOI;
	Wed, 21 Oct 2026 02:08:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLku-0000000AvaS-3Lhq;
	Wed, 21 Oct 2026 02:08:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B57B16022A;
	Wed, 21 Oct 2026 02:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17131F000CB;
	Wed, 21 Oct 2026 02:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792548519;
	bh=/o+ktcXtgylGbQbhfzImy/2UDYuWyqTPPta4Wh5mK34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NXw/DiN+sjBq0u8sbzgvYB/BWnFhuxmE2DOCqWrYyIYGZw+3vLzEV82Fp/Vhoxb8k
	 zM0x/XjjRgG68mNYlYm3l8jq3a9P/LV37zcpAsvR/cOTa5OOKMu6fwz1Yeu2H43Zlq
	 GBmLtrfIjwTFxQtsSN4Lpp6PPED1C/rzID1mrzD+V8vs8LlsSFfSLDfLUl+3y/uqBi
	 ftkOb27wzmEZCuOTzu5o6lft46NSRenRnNhTzCJIa1xNP9OApq65XqInf5ojVxY1N1
	 8s4UU0nIrkDaAEyAuRbxlgWJ9HfmIhXkUMwTDyyiMGywsSLcdCDdLa/KEQ+m9pJelq
	 WdyVsiG6dS1IQ==
Date: Tue, 20 Oct 2026 19:08:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Cc: jackbb_wu@compal.com, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
 <johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, Minano Tseng
 <Minano.tseng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Robert Yu <robert_yu@compal.com>, Jeff Chang
 <Jeff_Chang@compal.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 0/6] net: wwan: t9xx: Add MediaTek T9XX WWAN driver
Message-ID: <20261020190838.6f5334a7@kernel.org>
In-Reply-To: <20261014-t9xx_driver_v1-v10-0-4d0dde3613f5@compal.com>
References: <20261014-t9xx_driver_v1-v10-0-4d0dde3613f5@compal.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 14 Oct 2026 10:50:58 +0800 Jack Wu via B4 Relay wrote:
> T9XX is the PCIe host device driver for MediaTek's
> t900 modem. The driver uses the WWAN framework
> infrastructure to create the following control ports
> and network interfaces for data transactions.
> * /dev/wwan0at0 - Interface that supports AT commands.
> * /dev/wwan0mbim0 - Interface conforming to the MBIM
>   protocol.
> * wwan0-X - Primary network interface for IP traffic.

AFAIU AI finds so many bugs in patch 3 it overflows the output token
budget. Please see the review for other patches here:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014-t9xx_driver_v1-v10-3-4d0dde3613f5@compal.com
You gotta feed patch 3 into some models yourself and try to bring
the bug count to a sane baseline before we can proceed :(
-- 
pw-bot: cr

