Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA96EDF15E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 13:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8v8CAc1a5nqAtx1ctsnV8mP5cbisxVoVDSRVV0yUIiQ=; b=Vx40KNmDUNgp/wSQB3Iho9r1dy
	nhmJJp30MSzDzcxeOkkW5hLASKHF5ZRqDWk1qjWEHAdmFZ0DemW9kmMtIBoFVHIaZdj3dGo8TVVl+
	PhFHdIPDrsknsT9LdU3IL6dvWmN5TytOf/9w1rHr2v9rRL+wOTYFFB1h9SiLVhVhfNCK3NsP7OqwM
	hrRH8u8k23CSPr+ePE9IfqqXwCwkkRrkH5i2rkRqGerRNPjQ99ACnnIML1ajl4MQ9c4aySPtN5rDZ
	eQsJFGrxlaNwoA5gIcVa5Jbf0SwW1HvxbOFFwwpE7KjDyyqTzg7uVzdZ+F8IkIzVkqlcW3Mj6+WOj
	GO4ZgYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqt76-00000003Ttv-3lxW;
	Fri, 13 Feb 2026 13:21:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqt74-00000003TtN-262v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 13:21:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B77FA44516;
	Fri, 13 Feb 2026 13:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D84C116C6;
	Fri, 13 Feb 2026 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770988897;
	bh=kyXJnbWHtVqYzU5oI/WdyhgLoBcZVbYqrHuJ3jB/U4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALpCMQrr0ThiCKs5Z2kZgO7LXj0dgJ+wuLIhhja7r5of6AI9dLP3rLHsUr3UWi4DV
	 479gca9of6f3glzP0Awfxi47pk5N06aQzyThnY0HixbhHuvPdkUbpA719YPbYMqMXv
	 +yDG/jXwOtV0gxJQ88fqbUspNyFkARcaNDTV5//2g+WkT3s1mGzU8CQAEDFfJQGbRe
	 nPQjoRSXyqMKD/R0wRAJlGTO8LVbb0zPLzFpRE/NIH4ZKBkQrn++RTdVP8AZ0kv8Kt
	 A0htIRChPUaDEd3wyfRcto1mam6BqtSXcAvSMYEq6QwNOKbFQR7uKs/+0K+BmIbqy6
	 paPpSfliixIFg==
Date: Fri, 13 Feb 2026 14:21:32 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
	bhelgaas@google.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s-vadapalli@ti.com,
	danishanwar@ti.com, srk@ti.com
Subject: Re: [RFC PATCH 3/4] PCI/DOE: Add DOE mailbox support for endpoint
 functions
Message-ID: <aY8lXB5JB3ffiUlK@fedora>
References: <20260213123603.420941-1-a-garg7@ti.com>
 <20260213123603.420941-4-a-garg7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213123603.420941-4-a-garg7@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_052138_565832_4359ABC9 
X-CRM114-Status: GOOD (  12.01  )
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

On Fri, Feb 13, 2026 at 06:06:02PM +0530, Aksh Garg wrote:

(snip)

> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index e3f848ffb52a..2a57a314054c 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -146,6 +146,20 @@ config PCI_DOE
>  	  Say Y here if you want be able to communicate with PCIe DOE
>  	  mailboxes.
>  
> +config PCI_DOE_EP
> +	bool "PCI Endpoint Data Object Exchange (DOE) support"
> +	depends on PCI_ENDPOINT
> +	help
> +	  This enables support for Data Object Exchange (DOE) protocol
> +	  on PCI Endpoint controllers. It provides a communication
> +	  mechanism through mailboxes, primarily used for PCIe security
> +	  features.
> +
> +	  Say Y here if you want be able to communicate using PCIe DOE
> +	  mailboxes.
> +
> +	  If unsure, say N.
> +

I think this new Kconfig should live in:
drivers/pci/endpoint/Kconfig


Kind regards,
Niklas

