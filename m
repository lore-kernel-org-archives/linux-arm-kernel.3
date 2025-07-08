Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FDEC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/SZFPNLk/Jppw2vEUbzEfDl8Xoy/j7gp38uiq1v+Xg=; b=AXotS+gy4b0E9cKk/6Lo5nW3O0
	TRCydl/St8FaI8wVRaXDBksqlqUita6Qb/GdI234CZL6KwAQhZ/B4oh0PzmI0d8cYel9XNuyDwFZN
	mNs2UlV5Ehx07fZBoy1EY1fHRWMGiw7xE5ibCNV376ySS1MXcHK+FF/drzYwtHC2FWMgS+umC+oep
	d6xh3A+2SsOjeBccBjNIkUXNMtWCCqPeH7AH9KcSolw4BKGqTgcIgYQvTAWDIPlfH/hoTzLHMx0CO
	khXSAMbObZN793APjLJgXdtapO6bh91ZHTQvwga+zJZusj/xoArWpTGsU3S9o4atW62hyfXrUYxRz
	8ePL3hoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7QJ-00000005Hye-10rE;
	Tue, 08 Jul 2025 12:27:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7O0-00000005HsY-3hSO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 12:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F340761484;
	Tue,  8 Jul 2025 12:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70947C4CEED;
	Tue,  8 Jul 2025 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751977523;
	bh=cBKfOlm0o5tbUS+WeNcyTFJHeZh0VC1N9WvCHLT15mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0TOiXxvwLSU8dr4137SUIxZfFSq0bwxl4KnbJ/7QuXl0xLguO7lPlYRni6oBFBDE
	 hiMW8NUpZfLdCdHXl7bhc8fLhYFy+fS1iZDw5+cDmP6dNDa2uNkhjxA7dyJVbOlXMi
	 8LHjCb4XsEaoBupu/dt82pmoXwwtlbB4KNb469TIDOOMFeIQNk0DrHQQCxjVhHU+yw
	 p38HSukHG2+hMUoctkdLCXPsFC17zS90K/pdBfdMT5bGEkqgY8ZUavIVQ32VbgnT/f
	 Hn7mFHLD8WNY2AUiyQlS/jz9p/sryOx08NslPN4U09qQKGztf2KPhv7Ro/hDbDcwsb
	 6c8g/ZoE2fldw==
Date: Tue, 8 Jul 2025 07:25:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Leo Wang <leo.jt.wang@gmail.com>
Cc: linux-hardening@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
	Kees Cook <kees@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Message-ID: <175197750014.297501.9917698963252838372.robh@kernel.org>
References: <20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com>
 <20250708-add-support-for-meta-clemente-bmc-v6-1-7f3e57bd0336@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-add-support-for-meta-clemente-bmc-v6-1-7f3e57bd0336@fii-foxconn.com>
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


On Tue, 08 Jul 2025 18:18:00 +0800, Leo Wang wrote:
> From: Leo Wang <leo.jt.wang@gmail.com>
> 
> Document the new compatibles used on Meta Clemente.
> 
> Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Conor Dooley <conor.dooley@microchip.com>




