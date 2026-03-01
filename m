Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C635DFD0079
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 22:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTKHHz0a7GUcsQuAn/SO4iW69PiIZsWzIkr4LPnlQSs=; b=uGFeadL1HhnCHBoepk5auGALpA
	gGZcLbnF52LLpAXno645Pt/xcVP8r5eL1qaG/t17Yn328iXbAwK562gSkkNVB7FMAdgej0TygAqHD
	Kaz904MdKT0STNF406dixcBlV+98UTJsUkcU5Vj+DiwAVyRfglGzd/dhBmGOr1Zi3FadWf9Ic9rTD
	rAa6OV9p3oe7fOt3SUde9MFcH9P3wY679TpQmJbvTdsmdPh5ZVKgB4O0jxHS9b9qAszQn/nCkSH3t
	2IcyfWLMr000mfJIJUgnl6xRhlyAzYeSVYX51r4LCtArkJBh1It4JM0kvn+8aZO7SvRgjqtlMyssE
	5S+s1oDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwowE-0000000Bw29-1WOj;
	Sun, 01 Mar 2026 22:06:58 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwowB-0000000Bw1X-1cng
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 22:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772402808;
	bh=JtofDS4uurPFDMsup8m9GieF0+EfeZ0b8emZKMTzxy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uC+uRSteIUC5hJRpzuZ1EIAWYbADe30m+xzcRk5QV/zI3vZSOsKNEC/wRJ5aFjmd+
	 Lqy9J8DqDqEnHCqFVaQ9kCmSzj0JhsEWf1UHBOzP9OP3ccdUduD1eHtWFKVTTfNGiG
	 T5+jwBm0D3+I4+D3uK4FijyMdufFXN6rkqTdBPr4=
Date: Sun, 1 Mar 2026 23:06:48 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Nick Huang <sef1548@gmail.com>, linux@armlinux.org.uk, 
	davidgow@google.com, dongsheng.yang@linux.dev, dory85109@gmail.com, 
	ebiggers@kernel.org, idryomov@gmail.com, jlayton@kernel.org, john.g.garry@oracle.com, 
	namhyung@kernel.org, robh@kernel.org, kusogame68@gmail.com, wdhh6@aliyun.com, 
	wqu@suse.com, yot4106@gmail.com, likerockman102@hotmail.com, 
	squid@squidspirit.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: Replace ASSEMBLY with ASSEMBLER in uapi headers
Message-ID: <b49479f5-3d67-4651-a106-dc46fd25217d@t-8ch.de>
References: <20260228121311.3804-1-sef1548@gmail.com>
 <164baf81-2824-4943-bbc1-4ae8a160c0cc@t-8ch.de>
 <CABZAGRHA81sEqGLmptViMz8YEpi1o0m0GyJzDA7-B+tAb0Hupg@mail.gmail.com>
 <alpine.DEB.2.21.2603011816460.44093@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2603011816460.44093@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_140655_634259_C9579D58 
X-CRM114-Status: GOOD (  23.77  )
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

On 2026-03-01 20:12:11+0000, Maciej W. Rozycki wrote:
> On Sat, 28 Feb 2026, Nick Huang wrote:
> 
> > > But as most other architecture UAPI headers already have switched to
> > > __ASSEMBLER__, it seems nobody will be affected by this, so this check
> > > should be unnecessary.
> 
>  It seems to whom?  Have you got a reference to a discussion with libc 
> maintainers where the consensus has been that support for older compilers 
> can be dropped?  Why does it remain in the GNU C library?

To me, based on the fact that nobody has complained so far about the
other architectures. But I don't really want to advocate for dropping
compatibility.

> > I'm aware that other architectures have transitioned to __ASSEMBLER__.
> > However, I implemented this check here because Maciej W. Rozycki
> > specifically suggested this approach during our discussion.
> 
>  I asked a question whether this is relevant.  The outcome could well be 
> that it is not, but with data available at hand such a conclusion cannot 
> be made in my opinion.

Fair enough. I have no issues with retaining the compatibility.
But the approach in this patch is counterproductive to compatibility.
For regular C sources, which I assume are most users of the UAPI
headers, the __ASSEMBLER__ or __ASSEMBLY__ are wholly irrelevant.
But with this patch they will be hard broken. Also UAPI consumers which
might be perfectly happy to manually define __ASSEMBLY__ will now run
into a hard error. So this check is strictly *less* compatible with
exactly those old compilers.

Given that there is a general switch to __ASSEMBLY__ for regular kernel
headers, the chances are high that adding these manual version checks to
the UAPI headers will be forgotten frequently and will require a lot of
fixups. If we want to stay compatible, we should do the following:

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 9c15e748761c..2f1d1767ca26 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -36,6 +36,7 @@ sed -E -e '
        s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
        s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
        s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
+       s/__ASSEMBLY__/__ASSEMBLER__/g
 ' $INFILE > $TMPFILE || exit 1

 scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE


Then we can convert all UAPI headers to the in-kernel style using
__ASSEMBLY__ and drop -DASSEMBLER from kbuild. Userspace will still
work as before and if we come to the point to drop compatibility,
we can do so far all UAPI headers at the same time, without any
inconsistencies.

Right now I think the consistency argument is enough that this should
have been done from the beginning. Your thoughts?


Thomas

