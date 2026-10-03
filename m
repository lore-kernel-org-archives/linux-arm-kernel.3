Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7735CCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Za1pZegFszNhsXf/v1xZJxwhyF/n2vi12w8ByATTNQk=; b=N4Z1IbT7V4uenHq+WPLizj6I3Z
	OiZiJlw2XtbWWJ2rny5UBC0FAdWjLQgckRyNjU5hSf0sociF77+QKJXd2uAtae9ohag8VAUNqxetR
	kibM+w2tRMKT+VQ6+WMqJdyvOcHFaFhQaokH+kUzbDJtAautBqFwusaxEdJ46pTPEZdpVg29gbo8F
	o4G/qf+6lLYWRKRjpzE/VcF2MB4LE5qr6dwMYAEZGcGJ6JzeAgVyKqyWcbyMdhHnd+9mg1fZeTMhl
	OyotvcKDmvMnv7lIEbzbFy4QZvqmIB5ER+vWze1y3xb3N3AyYHE92yC4IRMAV/kiRqUHYd6nsEHpj
	N2nYR0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0vC-0000000DdXM-417w;
	Sat, 03 Oct 2026 14:41:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0vB-0000000DdX7-2S97
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 14:41:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA94F60D82;
	Sat,  3 Oct 2026 14:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32811F0089B;
	Sat,  3 Oct 2026 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791038464;
	bh=Za1pZegFszNhsXf/v1xZJxwhyF/n2vi12w8ByATTNQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nU4kZ3olmxqRaWGh/BMyUHNDmUetS5azGwKj+HLbpDQ+6CwqJrNiiXtOqPvtCxGby
	 n8C2YQcakn+dKgddXQgrFasrajHZTSYl95IkQg/PrhO1L6/BYRw3sLgjV/d9+wR/kl
	 n8HpXYCJab/uHaIQWOvLOIWtPBMYrOFV1pkXjjFG7fvRzNEAlamHlU/QOwnW4Z9z/Y
	 x+2oUmN4B201cIbsl2ncSI3rnvDb7c6UJrkhBpK5YhRyL7Fw3lOBK9Xo0Y9BFyFStF
	 pNukhjCLyv9PkPaDwwRLvjBlF9eDfu9C/LpoKxHlchOfR4Gulr7D/cri+QLY+T27IJ
	 PsiNQffNRWcjQ==
Date: Sat, 3 Oct 2026 16:41:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Subject: Re: [PATCH 2/4] dt-bindings: arm: aspeed: Add Intel JNCRP board
Message-ID: <20261003-convivial-mottled-turkey-d6c932@quoll>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
 <212171467173c9af64b3f8ecddca2a445b7e7148.1790344811.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <212171467173c9af64b3f8ecddca2a445b7e7148.1790344811.git.dawid.glazik@linux.intel.com>
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

On Fri, Oct 02, 2026 at 06:32:43PM +0200, Dawid Glazik wrote:
> Add a compatible string for Intel JNCRP BMC board.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>

Squash patches. You don't even say anything useful in commit msg, just
repeat subject and diff, so what is the point of having it separate?

Best regards,
Krzysztof


