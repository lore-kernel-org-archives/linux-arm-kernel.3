Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2B6C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 19:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvMB2U+mHvhYmKOUk84q4l4veB5CHun/Nhwbht5t0VQ=; b=lShY1IW8c3Z+UVegQs7YpbmutJ
	b8bo5Cg8D8R+183o7LMMOb3+3cFrFN2rzY1yet1qdx03inHhc8VnJTWlN8LM3KXZ+ael9ENxAVsIR
	Nz8HXZ7n2FKkFW++xNkkPY1Kjc561QqZVSo/S6lOixHTRlLTcvei3jt4ASz/yeXvclyulF0Y4Mt45
	BOjng1v/8sLRvUYhkWGfozDTpwaf5N5rvC92WlTpj6uBYA7evhIrcM5njrQonf+y6lXe7BH9xYGtb
	koS9YCyQHNILxj5skEFFpw80SKVk1aVo1Oullh4cpJrYg/XsLH1aeq6v29MbWIRZHV9eWlbhjCPV4
	fEB9Qrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ZcB-00000003ABq-35f8;
	Fri, 04 Sep 2026 19:30:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zc9-00000003AAc-0tdL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 19:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bvMB2U+mHvhYmKOUk84q4l4veB5CHun/Nhwbht5t0VQ=; b=mYVblt/mAAyra51VokhjYJJ8+R
	Hv9sXtOe4/wUH4oTSqF3FhDvJRum1cEQIwK7YL182MN8nPu4hHW6Sp3Qy2iVYUL2PIN3GgUDIrbeF
	RDKNBZ/7dsR7X+b6Muba4/D2gSaOJypIjLrv1t9lI39FUDjeykIG5HkyQFD9aV71JCCI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x2Zbr-0034X3-H7; Fri, 04 Sep 2026 21:29:59 +0200
Date: Fri, 4 Sep 2026 21:29:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: kvm: fix repeated word 'is' in comment
Message-ID: <6e2ccf7b-f9c3-42ca-9d10-5a3a8819cf7a@lunn.ch>
References: <20260904122445.31163-1-hemanth.selam@gmail.com>
 <20260904122445.31163-4-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904122445.31163-4-hemanth.selam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_123017_252616_7CAA37A1 
X-CRM114-Status: UNSURE (   8.47  )
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

On Fri, Sep 04, 2026 at 05:54:42PM +0530, Hemanth Selam wrote:
> Drop the second 'is', reported by checkpatch.pl as a possible repeated
> word.  Only touches a comment, no code changes.

I hope you are really looking at the sentence, understanding the
sentence, and then modifying the sentence based on your understanding,
not just removing the duplicate to make checkpatch happy.

You really do need to engage brain.

You also should consider that this checkpatch warning has been around
a while. Many of the real problems have already been fixed, so there
is probably a high false positive rate for this check. So you need to
be extra careful, or you are going to make things worse, not better.

"The the in this sentence is the subject."

If you looked back in the archives maybe a month, there was somebody
who get flamed for getting this sort of checkpatch fixup badly wrong.

    Andrew

