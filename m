Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009B2CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 18:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnXeU95TwLHqeKmw9iwTN/c5KvjGykwSJxNVIjD3gq8=; b=Um29Qto4sMQ5c96WgjTprwpI0w
	z/sdi5fv8qtdqBYmPAjAolCsD44q3emPTV40TKyb4bAbo0hBm7+LM8nbHgrvv+4M5u3uY2tBTrX3z
	5wEzWQDmCSG1yZQQH3Vd64WMqst8m5PxqaARbZ/GrdgNxIiurtrEJupQC3Gd2/umPZWOOatntAyll
	/NLp5M+JSXofp4HpqYqcUgHeG72S/TToAJdlOXDdyHRsvU8iJn+bNyorS9zLmvp+m1rZchdippCXK
	vzH4ktW3xqKnUDT1IVrt4jrfSMfn4czh9GV4bGpS6GY/+YWQnP3Xe1uO/RzGCOmVJU57IlDeguhV2
	kHXeOXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRrd-0000000EXvP-0Nlj;
	Mon, 27 Oct 2025 18:22:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRrZ-0000000EXuZ-2Z2O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 18:22:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF96943BE4;
	Mon, 27 Oct 2025 18:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5F1C116B1;
	Mon, 27 Oct 2025 18:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761589356;
	bh=fXCVp106DkN9rGalfhDUXdv6WsG1hGhTuPCwIdmmJ+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eNdsIKCLGZ4cdIWaCc5S/irpnb3DmG6FkZl1o3o+J8IBb0k5CR20Pg6+wDetOhEDt
	 r/q5XGcQB1rIQ/kGMit9veAw3I813BRYv+UDWMGCOMkVflJLUCW59jsG+47Mc2gYgm
	 I3I32ouDMmE1vt0SQqN9bwYB8eq/8faEpjquTpKDp2WONmqYu3S/kJgEPvt20SR64P
	 UU4XVnBCg7WR0Pl1ZoghGCQWkwVf6PxHUuq3Xkp/G/4+vp2zKOBKsNwyjrk68tCSWY
	 44LzZjSK14iWF40dRlav/vRzFvX+JdUzQyNS2ZYOJWc0bJxa6lXXCxw/HSpfD4Daw+
	 gkXWG3sH9XiDw==
Date: Mon, 27 Oct 2025 19:22:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 21/21] Docs: add Functions parameters order section
Message-ID: <xpo7v5l4nw5b3ijjgk4o63xukkeyv4bqp65gu47g4beszetczy@2xvdgy4u46tt>
References: <20251025162858.305236-1-yury.norov@gmail.com>
 <20251025163305.306787-14-yury.norov@gmail.com>
 <723c936f92352352c3b1a84b858d684f5b7a0834@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <723c936f92352352c3b1a84b858d684f5b7a0834@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_112237_692740_BEE7B64A 
X-CRM114-Status: GOOD (  24.40  )
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

Hi,

On Mon, Oct 27, 2025 at 11:02:48AM +0200, Jani Nikula wrote:
> On Sat, 25 Oct 2025, "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> > Standardize parameters ordering in some typical cases to minimize
> > confusion.
> >
> > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > ---
> >  Documentation/process/coding-style.rst | 48 ++++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> > index d1a8e5465ed9..dde24148305c 100644
> > --- a/Documentation/process/coding-style.rst
> > +++ b/Documentation/process/coding-style.rst
> > @@ -523,6 +523,54 @@ below, compared to the **declaration** example above)::
> >  	...
> >   }
> >  
> > +6.2) Function parameters order
> > +------------------------------
> > +
> > +The order of parameters is important both for code generation and readability.
> > +Passing parameters in an unusual order is a common source of bugs. Listing
> > +them in standard widely adopted order helps to avoid confusion.
> > +
> > +Many ABIs put first function parameter and return value in R0. If your
> > +function returns one of its parameters, passing it at the very beginning
> > +would lead to a better code generation. For example::
> > +
> > +        void *memset64(uint64_t *s, uint64_t v, size_t count);
> > +        void *memcpy(void *dest, const void *src, size_t count);
> > +
> > +If your function doesn't propagate a parameter, but has a meaning of copying
> > +and/or processing data, the best practice is following the traditional order:
> > +destination, source, options, flags.
> > +
> > +for_each()-like iterators should take an enumerator the first. For example::
> > +
> > +        for_each_set_bit(bit, mask, nbits);
> > +                do_something(bit);
> > +
> > +        list_for_each_entry(pos, head, member);
> > +                do_something(pos);
> > +
> > +If function operates on a range or ranges of data, corresponding parameters
> > +may be described as ``start - end`` or ``start - size`` pairs. In both cases,
> > +the parameters should follow each other. For example::
> > +
> > +        int
> > +        check_range(unsigned long vstart, unsigned long vend,
> > +                    unsigned long kstart, unsigned long kend);
> > +
> > +        static inline void flush_icache_range(unsigned long start, unsigned long end);
> > +
> > +        static inline void flush_icache_user_page(struct vm_area_struct *vma,
> > +                                            struct page *page,
> > +                                            unsigned long addr, int len);
> > +
> > +Both ``start`` and ``end`` of the interval are inclusive.
> > +
> > +Describing intervals in order ``end - start`` is unfavorable. One notable
> > +example is the ``GENMASK(high, low)`` macro. While such a notation is popular
> > +in hardware context, particularly to describe registers structure, in context
> > +of software development it looks counter intuitive and confusing. Please switch
> > +to an equivalent ``BITS(low, high)`` version.
> > +
> 
> GENMASK when used for defining hardware registers is completely fine,
> and *much* easier to deal with when you cross check against the specs
> that almost invariably define high:low.

I fully agree with Jani here! When coming into describing
registers my brain is hardwired to read values from left to
right, high-low.

Linus suggested also BITS(start_bit, n_bits) which, in my
opinion, complements what we already have.

We leave GENMASK to register mask descriptions and BITS to the
rest.

Andi

