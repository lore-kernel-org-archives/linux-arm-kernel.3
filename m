Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36382C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 20:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkB2olGpSxGPZ6qw2DGB8PwjGIK+thrFinJ95U9WgAg=; b=idK2ktWqI6roUI01w+X/qohfGk
	rw5KWlQD/Vez7Qit73BR6MhASqqXnH0zjTWXBZYM/5ZGl5vasZp12jBsEx+l79SY1YNXFAZpag7eL
	/kzb0umvOPi01kiQXXhrgCxTt5Kz0r44YZlPShoSIW5TZjC60Jl217mtOu3h6+q1gu1h7/6jLoOeW
	VE+NVWkChdejGtj7euGKLdd4xQ53MNzCvYT7bqrDVHBigrYBtE2UZvGPY5WeHjVdXGzya3GWvGy1V
	H6BKox50GgD7gbtnNIZ/RPWLTov1cDlTIRDUev6Ig4f1O/uL4b46N4TwNMtbSp3M4nguC7llqxHtQ
	JeEAlwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txX8g-00000009XRP-2uhI;
	Wed, 26 Mar 2025 20:14:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txX6X-00000009X56-3qgr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 20:12:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 943106115B;
	Wed, 26 Mar 2025 20:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6420C4CEE2;
	Wed, 26 Mar 2025 20:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743019921;
	bh=Nw5+UdFmuqeASIGkBgOhWfX5YPpSQVc+i/qjez8P77c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXiWo7ncIulaeSE7eQDy33lCzqiEvuYvR0wLIXgzGKJzHVKUVnpMkD1FqtKZoYgHR
	 HJB/bOaswS+rwdA2ygkbI5oCmwFvQun4YYzHCKOXmOEvOoKU9/CrpRZMjws8GklFm/
	 pY6HeoyrRtu6RPcFC9l89hpn/lGBhe4HpBZlltW70sJfZfJQDuOSLmo77fcxDSol/0
	 P9T8MQduY+TxjMjeAtf6DkM8Hx4GFOgbILuChTjcCPYkbZgLpcW98J115BywP6A9g6
	 jqf/50rmI6YRQgSLY7hHG4pRJLu/hhmz949j3i/pD3B1dUZ83cWzt3wG73L+/QLx82
	 NBX/kAuhtpVMA==
Date: Wed, 26 Mar 2025 13:11:59 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: David Binderman <dcb314@hotmail.com>
Cc: "ardb@kernel.org" <ardb@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-6.14/arch/arm64/lib/crc-t10dif-glue.c bug report
Message-ID: <20250326201159.GA6625@sol.localdomain>
References: <AS8PR02MB102170568EAE7FFDF93C8D1ED9CA62@AS8PR02MB10217.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB102170568EAE7FFDF93C8D1ED9CA62@AS8PR02MB10217.eurprd02.prod.outlook.com>
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

On Wed, Mar 26, 2025 at 07:12:00PM +0000, David Binderman wrote:
> Hello there,
> 
> Static analyser cppcheck says:
> 
>  linux-6.14/arch/arm64/lib/crc-t10dif-glue.c:53:33: error: Using pointer to local variable 'buf' that is out of scope. [invalidLifetime]
> 
> Source code is
> 
>     return crc_t10dif_generic(crc, data, length);
> 
> but this line
> 
>             data = buf;
> 
> looks very suspicious. Suggest move local variable buf out
> to file scope.
> 
> Regards
> 
> David Binderman

Thanks for finding this!  Kind of a silly bug, but that's what we get for
programming in C...
https://lore.kernel.org/r/20250326200812.125574-1-ebiggers@kernel.org and
https://lore.kernel.org/r/20250326200918.125743-1-ebiggers@kernel.org fix this
for arm and arm64.

- Eric

