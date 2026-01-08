Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC498D148AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0byx3DZoRUiUQTtEbt34uHJmMg/kOxQkmRcK6Wjio08=; b=K6l11QhOvxoaK3kav4Jyop1sZH
	sCcjG92ELfsFXOOlXSb+V0egR/FQq001K6+FKhToRi6hYqbARoakwNYiDaSaTOn3UFddWou6aDBgB
	EcSFW5JI0ifcwZlkDyjkxQfj3fAdOX3jlgcaboaE+PZdmpUnm11FOJOAUYBAo1YyXo++JnzGTQd9z
	0+5lZYshZ4cnucoamGWyDvMA4YncZuQ8Zh6MdsCM20m3B+Vbyf1j9PAoOuSxO/mjz0cFMZhCCx4kr
	GpHXb8JgiBHqcGxnj754LwZvt80zQDwTv3QeGvedPW37vjnJdUW9A9Mq0og9ZsEoGyh08fcuripwZ
	TGIeoEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdju6-0000000G1xF-3dC7;
	Thu, 08 Jan 2026 06:53:54 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdju2-0000000G1vn-26sP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 06:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767855226;
	bh=0byx3DZoRUiUQTtEbt34uHJmMg/kOxQkmRcK6Wjio08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h2pJqKSzWUPMfqc5UdM7e0n7epIStbXL9QtR6WPNxrp8hBnhHpcbCMXRbInsBHSnm
	 sOdPoExzBxSTsS86cWBI+v+sa7Ragmj1W2t/oGqgHnCNv+y8b4bF7KpGp4ft45LRUY
	 22uD/pD4i1CHBjxcQqyzs+1dJ6YdyvnvLjwzwpmhDGFwhDofHUckXsG19iCdbOp/KP
	 B4oUCTBos9sLGBx98PQ3z3tEQUhnzeVFfo+IURuiOaNa5eLlk0nOFmRlmPJeD36Ay4
	 wL452Xr8YtgHpZQNAgrs5I6HE5yZBwJMV7MfoRjmt78OY9aW/c/gkZLZfuMzBuYlKf
	 uFuAvDFjgIUYQ==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 73A0D7C834;
	Thu,  8 Jan 2026 14:53:42 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: linux-arm-kernel@lists.infradead.org, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
 Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, 
 patches@armlinux.org.uk
In-Reply-To: <20260104010044.2722221-1-rdunlap@infradead.org>
References: <20260104010044.2722221-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] arm: npcm: drop unused Kconfig ERRATA symbol
Message-Id: <176785522283.1156760.963237190160295594.b4-ty@codeconstruct.com.au>
Date: Thu, 08 Jan 2026 17:23:42 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_225350_737756_EE3715BC 
X-CRM114-Status: UNSURE (   6.33  )
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

On Sat, 03 Jan 2026 17:00:44 -0800, Randy Dunlap wrote:
> The code for this errata was not merged. See
> https://lore.kernel.org/linux-arm-kernel/CAL_JsqK--G_7nO_UQ6jyomA1Sq6GUKtXVZpBF0dXjYA2iE047w@mail.gmail.com/
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


