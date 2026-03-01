Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE07FD0047
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 20:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVa8w0ED+k38EeBGlsVYHu6uGg4KTi6e2PjIugFA2gw=; b=0ZQYX65Y3yXMoOp52n+zchE3Ah
	VU06KHLcLMJQguVd6WkfpTJ0bk12WcNRpc816iukkwk5XBdIw3BwYxk0STCO+KKts4l/7+8kbKp7o
	vtgNgATI2Nje8jJ5FiOT3p8WgJzQxYpl3rq5wBs08oxGRMGvpHFoZmnufInKK8Ge3Hd6n3fkS2n6X
	D7MRS6PPuI5TK29jS8nGHQk6Y/cX7/co76D/aD6ROyHahD7Z8w5dleXDDHRwnkrGTyCcIudmUny9R
	zj86VU9b7zqp5sdzaRDubWFl5SxzBcvUxw4lhmvKjaVjkUVRTlzijFhiz9ETsr1DWqhb71AsjleYK
	FFpimPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwn9L-0000000BrES-2ZCA;
	Sun, 01 Mar 2026 20:12:23 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwn9I-0000000BrE3-3xjO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 20:12:22 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CE2F292009C; Sun,  1 Mar 2026 21:12:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id BF06E92009B;
	Sun,  1 Mar 2026 20:12:11 +0000 (GMT)
Date: Sun, 1 Mar 2026 20:12:11 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Nick Huang <sef1548@gmail.com>
cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
    linux@armlinux.org.uk, davidgow@google.com, dongsheng.yang@linux.dev, 
    dory85109@gmail.com, ebiggers@kernel.org, idryomov@gmail.com, 
    jlayton@kernel.org, john.g.garry@oracle.com, namhyung@kernel.org, 
    robh@kernel.org, kusogame68@gmail.com, wdhh6@aliyun.com, wqu@suse.com, 
    yot4106@gmail.com, likerockman102@hotmail.com, squid@squidspirit.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: Replace ASSEMBLY with ASSEMBLER in uapi
 headers
In-Reply-To: <CABZAGRHA81sEqGLmptViMz8YEpi1o0m0GyJzDA7-B+tAb0Hupg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2603011816460.44093@angie.orcam.me.uk>
References: <20260228121311.3804-1-sef1548@gmail.com> <164baf81-2824-4943-bbc1-4ae8a160c0cc@t-8ch.de> <CABZAGRHA81sEqGLmptViMz8YEpi1o0m0GyJzDA7-B+tAb0Hupg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_121221_140126_2D143AC4 
X-CRM114-Status: GOOD (  11.33  )
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

On Sat, 28 Feb 2026, Nick Huang wrote:

> > But as most other architecture UAPI headers already have switched to
> > __ASSEMBLER__, it seems nobody will be affected by this, so this check
> > should be unnecessary.

 It seems to whom?  Have you got a reference to a discussion with libc 
maintainers where the consensus has been that support for older compilers 
can be dropped?  Why does it remain in the GNU C library?

> I'm aware that other architectures have transitioned to __ASSEMBLER__.
> However, I implemented this check here because Maciej W. Rozycki
> specifically suggested this approach during our discussion.

 I asked a question whether this is relevant.  The outcome could well be 
that it is not, but with data available at hand such a conclusion cannot 
be made in my opinion.

  Maciej

