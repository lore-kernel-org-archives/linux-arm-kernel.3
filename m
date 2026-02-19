Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63FCE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 00:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTjAa0tCRYiFexMM+I6PIlkZMfxa4jr/sH3DeHWqxJA=; b=SH8Tb7xIvlk4tsi3kQfMBJdzcY
	iST76Yn14fJePviUCWY+OVNbGbWsiP/qaqq1IJWFocmq4VGTp1DHTf0m+WE9z8X1MVCQnInjJ7bza
	Epdaqe/Eg5VIGNyv3g1mKuZEzC7qCYI/yVWcEVkPsbyitfYvJeQ5tix4yXlrO4mAuESCjpB3BKfs8
	FQpWSyjwV4y4nyaadcAXki4UX/MLNXljS0y5OFZ3a3SgnK3oG/gPEHZWFpVXHR2wf6a6XbLvii8JR
	+HATTp9BYsfFfZxrYf8KhlOjPkrLrmmB+putaSJNZ+VAfHxeYGDKRvbaxiVdwB8M5ucSO6BMKaK/z
	7svOWKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsrof-0000000AdhA-0JcU;
	Thu, 19 Feb 2026 00:22:49 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsroc-0000000Adgl-0A8X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 00:22:47 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7D14C92009C; Thu, 19 Feb 2026 01:22:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7A74192009B;
	Thu, 19 Feb 2026 00:22:40 +0000 (GMT)
Date: Thu, 19 Feb 2026 00:22:40 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Nick Huang <sef1548@gmail.com>
cc: Russell King <linux@armlinux.org.uk>, yot4106@gmail.com, 
    dory85109@gmail.com, Eric Biggers <ebiggers@kernel.org>, 
    Rob Herring <robh@kernel.org>, Dongsheng Yang <dongsheng.yang@linux.dev>, 
    John Garry <john.g.garry@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
    Chaohai Chen <wdhh6@aliyun.com>, David Gow <davidgow@google.com>, 
    Qu Wenruo <wqu@suse.com>, Namhyung Kim <namhyung@kernel.org>, 
    Ilya Dryomov <idryomov@gmail.com>, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: Replace ASSEMBLY with ASSEMBLER in uapi headers
In-Reply-To: <20260218133952.5356-1-sef1548@gmail.com>
Message-ID: <alpine.DEB.2.21.2602190008470.57399@angie.orcam.me.uk>
References: <20260218133952.5356-1-sef1548@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_162246_243623_9AA98993 
X-CRM114-Status: UNSURE (   9.72  )
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

On Wed, 18 Feb 2026, Nick Huang wrote:

>   ASSEMBLY is defined only by the kernel Makefile and thus not suitable for uapi headers
>   unless userspace Makefiles also define it. Switch to ASSEMBLER, which the compiler sets
>   automatically when compiling assembly. Reference: commit
>   639f08fc20c92c2cc373b2b4d065185daa9633e3

 While not a regression, as this used not to work anyway with ASSEMBLY, 
the use of ASSEMBLER requires sufficiently new a compiler and in principle 
the userland may have old tools installed for whatever reason.  So perhaps 
#error is in order if the compiler is not recent enough, for a complete 
fix?

 FWIW GCC 2.95.x didn't yet have it, it landed ultimately with GCC 3.0.  
Do we care?  For instance the GNU C library still does for its installed 
headers.

  Maciej

