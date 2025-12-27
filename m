Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF51E8FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcv7JOz90KS/ympIYL2/RwqEfc8myrTrNEU4bzskd+c=; b=jy19C87MkNlslOlcXhL8GwQ/0B
	b+lCpACFB/DsLdoGITX634qNID/5ZZvSX072byd1a9baZJX+jvz3Jx5LdBtNvJ50434QWHWeycQo3
	LtJN1st/botM320hY8+DZcwQasZzTJdftWDKfyTBxtY7TvS9zuNeICJVPRhIFAJzLprzwuqBGjoNB
	nwxzz5205cG3RxCoDHKp3rsVqfGpYRSsYmq0H8oNelHcE41yWCDDKxiBpdGsUfM8vkD8yy1Hfm96o
	XWlT40jq3HuSo6YqvJhiOR46yBP705luZr2Ds+bWRbM9D5pOeU8zGYvYCmKJ07bzuY4SgNfF6+BbS
	aZA7jUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTMs-00000001y7J-0vLw;
	Sat, 27 Dec 2025 12:25:58 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTMp-00000001y5J-3xek;
	Sat, 27 Dec 2025 12:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1766838350;
	bh=pcv7JOz90KS/ympIYL2/RwqEfc8myrTrNEU4bzskd+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlBW141f3JLD6koSAPz8P9KbFq1Dog8Nmf6ps5pJsuXAbuSnWRyFAlrvadAjjP04z
	 +wxDaTy7NhPvNbkCGcYFkXbMkb5B0irxegt72eUF4X9//2MvZiCciZn2jx6M7/+8Pc
	 rRV6+KsTH0/+t++aSjoN5VkqfnzDF82gueIC93qc=
Date: Sat, 27 Dec 2025 13:25:49 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: quan.zhou@mediatek.com, Felix Fietkau <nbd@nbd.name>, 
	lorenzo@kernel.org, ryder.lee@mediatek.com, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-wireless@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek@lists.infradead.org, shuah <shuah@kernel.org>
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
Message-ID: <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_042556_190409_02845328 
X-CRM114-Status: UNSURE (   6.27  )
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

Hi Shuah,

On 2025-12-27 02:07:24-0700, Shuah Khan wrote:
> mt7921e doesn't load on my primary laptopn on Linux 6.19-rc1 and problem
> still there on 6.19-rc2.

This should be a duplicate of
https://lore.kernel.org/all/CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com/

(...)


Thomas

