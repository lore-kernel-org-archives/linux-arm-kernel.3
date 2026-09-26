Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664F8C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0e/d+ZsVpIEKqzITxQ/alWcQJ8JNxkp46Yk9Fwuek4=; b=M3toK6UABL1jX9Dl2czL5Inbbc
	ztPpyUhMMeNk5br6PNun5t83/+w96wHP4K4Xgms/XOzSY9g0dZMYTpf/fedfyBW3RjozMP953YEYw
	lfcosNyVEvZ4iOCDy0JvJ0AzZRf7QGeV/QoniSDWeuASQVB8kWgwX0YtWBFTu96SKfRjoRNq+3eZW
	KJwOebS6uZWCjNXuS3t/lIuzZie2JsRNP38+B7WQrYDs+RDtC6CSG/5+jCKDsNZRTZv0l3dyNtwpz
	XR1qJ9zfZuY79RuJiQMYUOKLDvspuPg9kMlPeOf5uR+A1Vwf6kcm9+d9uFt4YC5rFBuXXtPObSU1a
	pcG5E2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUbI-0000000FbWH-1bIU;
	Sat, 26 Sep 2026 15:46:08 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUbE-0000000FbVw-3n6y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 15:46:06 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 632E1419FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790437564; bh=d0e/d+ZsVpIEKqzITxQ/alWcQJ8JNxkp46Yk9Fwuek4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bRLsAMM4KoeELTAFcDHduoNvwPLDHGpIntGJy6BZ/xS4Berr+OKKcxYz3HM6YBWq+
	 KWyLOpT1oLrsFAC7BeVO3JwpES4/VfBz+BRH1sm4MAV6ILKCbPcUby9gZgHcjWAfLC
	 m+qkEzP/vLJ3FGf5t1YwRTtvuPAja2ibYinZP7SVy5T86VAKIw4W/2/UCU22Wuzoov
	 fbY0yQz1hSAqoeXQoDBJMPDqwrn30g/ney5MzKRcI14A4esSYZpTQmsuMpcrhzOKxt
	 GU2ZqLh9NTbVD5SwSuw/mhUMbUPqbKbr/SF31Jq5o3nic7Z/I9NYLs6fle6eOu4QAi
	 jHVKjhhoxgbCQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 632E1419FF;
	Sat, 26 Sep 2026 15:46:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, Shuah
 Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/ABI: testing: aspeed-uart-routing: use literal
 block for console commands
In-Reply-To: <20260923024918.840039-1-rdunlap@infradead.org>
References: <20260923024918.840039-1-rdunlap@infradead.org>
Date: Sat, 26 Sep 2026 09:46:03 -0600
Message-ID: <87se2w2eys.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_084605_113323_62A3639D 
X-CRM114-Status: UNSURE (   8.70  )
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

Randy Dunlap <rdunlap@infradead.org> writes:

> Use a literal block for console I/O so that the lines aren't merged
> together in the produced output.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Cc: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

jon

