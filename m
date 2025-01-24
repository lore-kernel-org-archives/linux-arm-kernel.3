Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1761DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk0WtuB7IBBdB2ZubHqj5SIqZBKyHzKI9J09Po15jvk=; b=Rtz30q7NsxwhMgfYr99rWr++2O
	SBdiv34xuHTouG+vWxuwnCuJW2Ju82qXen/sFCjkL3Ite6qbrJ177EABTHhVIG7BxGgmApPZQETDs
	UVGRXGS0yRdKgvlHHZngSSHIWs1hujd3Jvn4FQLUdt4WGIvD+bXF9rAXqbmghqgqNYfV5HLvV+RGw
	SlRCBovyZMnqfOv4wyflETBJJ1SjPbDyobLyEiaQMQYLr56XWqzc6Xwi7Un12f2bDLUy83tb3qYPH
	D2nGKkGIrHzBRUYHAsuRYW5VOCqoGCWUceLj1sf7oaYWX+MClBlEf+TkpLgtsDh3Lj5nHk+9L3JUS
	XQmhL51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLcc-0000000EzZX-1APR;
	Fri, 24 Jan 2025 15:29:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLZI-0000000EyQs-3OKx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yk0WtuB7IBBdB2ZubHqj5SIqZBKyHzKI9J09Po15jvk=; b=tKTHwNHQ4yuj7LOxZkoipl3w3L
	+pmwpEagZ8nSo9vzYEWpJgTlFO3b3MJK6WY859s2lsog9Jcv+r1Ejwpr7vQllnZjACwkrD+0REPZj
	JPwFC180N1a1Q6qfTtZW7OLxMDJBLWTp+IDZokMfewC1Y6Yq/cdYhpk0CogSjJytiSWVMjvVsODKM
	/PrjietXElqRu9sOkSDsG53qNOHdDt3LFofeDz8wGa0sI9AkoKpJ0mU6B8EzjH+1cbceDegqB0NI2
	pgEXNx89wQ5DFGzUgE8py24EFw/RyMqTDon+lpwNofSx1dw6qDFWpwp8Dj2+F+qnfdzqzrLk4K5dv
	47fZxoTQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37958)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tbLZE-0002SG-0p;
	Fri, 24 Jan 2025 15:25:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tbLZB-00074j-1R;
	Fri, 24 Jan 2025 15:25:53 +0000
Date: Fri, 24 Jan 2025 15:25:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yuntao Liu <liuyuntao12@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ruanjinjie@huawei.com, kees@kernel.org, masahiroy@kernel.org,
	ardb@kernel.org
Subject: Re: [PATCH -next] arm32/boot/compressed: Force hidden visibility for
 all symbol references
Message-ID: <Z5OxAfyKq-d7YPSp@shell.armlinux.org.uk>
References: <20250124082030.764417-1-liuyuntao12@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124082030.764417-1-liuyuntao12@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_072600_846744_C94BC8E5 
X-CRM114-Status: UNSURE (   9.73  )
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

On Fri, Jan 24, 2025 at 08:20:30AM +0000, Yuntao Liu wrote:
> Eliminate all GOT entries in the decompressor binary, by forcing hidden
> visibility for all symbol references, which informs the compiler that
> such references will be resolved at link time without the need for
> allocating GOT entries.

One question. Why.

I don't think this is desirable. We don't want the linker to fully
resolve references at link time - we specifically want a GOT so that
at run time the decompressor can resolve the references irrespective
of where the decompressor is loaded - in other words, allowing the
decompressor to be loaded anywhere in memory.

We do not link the decompressor for any specific address, and thus
the only way the decompressor can work is by fixing up the GOT.

Unless you can demonstrate that the GOT is no longer required, then
based on your commit description... hard NAK.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

