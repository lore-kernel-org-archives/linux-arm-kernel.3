Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82446CD5822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sCdqnj/RCGcOZ4N1FNFLLmFTy7auxTIhL2QEEcNqFg=; b=kgVHxnQDAcAKmw9U+6dsILaH1s
	jvtAHpqrXMsIyKzdll6yH7L5We9fS4IYkoHjWF4cXi7EnZ++5npJg/qTTd+NcUwKYf6O0kxsYm4Fq
	ECeyUejJSNstSmGkuk9pR17v/r+6QjVyDdFyNrc0XCkblRiGUAQJovo3ESdSMqCrotFSgrwxSoKdZ
	dnhaWt80vn3pwlCxG+x+hzHewJeUzgqTRBaQcZjWXgZX8Q2nM34Zku7IM3rY/TvTOXrOjVPPqaMf0
	Q5PbcqZjYGj5NsyFSV2Un06SXegaJXvHGiLFsq1EyA3mvGGuUxBGxfQUYzXiolDe30rf/wynnjPIe
	tzUvNrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQgr-0000000EhKA-0rcM;
	Wed, 07 Jan 2026 10:22:57 +0000
Received: from smtp-out3.simply.com ([94.231.106.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQgn-0000000EhIq-2zM6;
	Wed, 07 Jan 2026 10:22:55 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4dmPHX1tZwz1DDr1;
	Wed,  7 Jan 2026 11:22:48 +0100 (CET)
Received: from [10.10.15.21] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4dmPHS5YrMz1DDdR;
	Wed,  7 Jan 2026 11:22:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1767781367;
	bh=5sCdqnj/RCGcOZ4N1FNFLLmFTy7auxTIhL2QEEcNqFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GapqslJRt7PAo/OPdy40/uiS8yl/fdKamd8Ti7v8KhTSWM+dyJpM0kA09WqDkvmTF
	 JDac2AP0hk4IXLuaOc19G85CIClqVXmQFScccHC7rgNcYdl16DovAFndj0u/scyZuZ
	 rFnlzmQeoXkgQ81qRhHQTXrNih6T2iluIH43PJMds/ZZIo6rm/VM9YDeYihibbVdmg
	 uDvdrF41naRrcWhAD/3/BJoa7qr9vCUPqLxuLP48CDDioxfF0rw5/F8n0Js/OfpQsy
	 f1VR1SCUMB9l0JY24lstr5qvSKP50VGC6KkhF0cw5Ng7hX+p9V4PT5L0p7hEJpFlek
	 UmVwAHzAgacCA==
Message-ID: <836139d1-1425-4381-bb84-6c2654a4d239@gaisler.com>
Date: Wed, 7 Jan 2026 11:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] printk cleanup - part 3
To: Marcos Paulo de Souza <mpdesouza@suse.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_022254_112878_CE421115 
X-CRM114-Status: GOOD (  11.57  )
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

On 2025-12-27 13:16, Marcos Paulo de Souza wrote:
> The parts 1 and 2 can be found here [1] and here[2].
> 
> The changes proposed in this part 3 are mostly to clarify the usage of
> the interfaces for NBCON, and use the printk helpers more broadly.
> Besides it, it also introduces a new way to register consoles
> and drop thes the CON_ENABLED flag. It seems too much, but in reality
> the changes are not complex, and as the title says, it's basically a
> cleanup without changing the functional changes.

Hi,

Patches 7-17 all say "replacing the CON_ENABLE flag" in their
descriptions, which should rather be "replacing the CON_ENABLED flag".

Cheers,
Andreas


