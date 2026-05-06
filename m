Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74ECCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 18:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UE+2Zam3ay8MYkBMhcoLDn4N5xRtFcmwEwLGUcw133s=; b=ZfoYw75KY5lnPNS/Tmo+jkaD6R
	UOLbmELaJfE/FKWQ7lkewz+FDaJXiecWWzQq07Qn1pHfKcZzL5+ocqc9lGguZ8y3nGc2D8aRyPjuP
	lo5J8H7TPygiIk8dGiRBxeFUpti4QxwiL4euW0I/XCkLvJz6zuQtRwuKNSTuBbNzsfxZuImCd54Aw
	upt08qJRDYWJ7RwdxKV6cpEqtWG89eXXa9lw0u4EG6oRCpdDuBMYPIOMBfTuX+TzpivMNaK7XLh/X
	9VshIKyJyjI5sSsRl6c0MdMgiGuXFAECiVtLnNExIOGPnhIcqxWJ8Rdw1NXvc2/45opF6Jlf4IE5z
	z3uSQEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKglE-00000001k3L-3zwO;
	Wed, 06 May 2026 18:14:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKglD-00000001k2i-2HkC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 18:14:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5149B4E42C15;
	Wed,  6 May 2026 18:14:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DEC56053C;
	Wed,  6 May 2026 18:14:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91C3A107F1C0C;
	Wed,  6 May 2026 20:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778091249; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=UE+2Zam3ay8MYkBMhcoLDn4N5xRtFcmwEwLGUcw133s=;
	b=yWWNLpp+I5ZQobJ7kMrpz4OZD9zuMuFX+sZwPoC7yDqJlr7RixirIvsR0qNoS8jO2gjTmi
	5/fR8GJ8C3feLBwSwRkOxHfYbuEDIacO1YMvE7XVj1kGx55hr/uVMmew2JBzXqaiAntz+P
	P6ax1r0bk/J8BF6oTYPGUqKSGPd29AHDBnZguwoqr1zi3uJ1mtuGx7Gr/o2xFyzNC7Jun0
	M1MxNEm3LtVMARzfXOIqw1VXuyDvMiOcTFUIOqE3BYRFqH1UkWFaLYb4/DcsKM3AjyW22b
	d8DFUDYuabv/zNuRz44nFrzQHyoTn4GhEAyBc0npTnBQrWBcbDoFSm0EETgs0g==
Date: Wed, 6 May 2026 20:14:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Subject: Re: [PATCH v2 0/5] arm64: defconfig: Cleanup and change Ethernet
 drivers
Message-ID: <20260506181405ca12f502@mail.local>
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_111416_034819_602EF2C8 
X-CRM114-Status: GOOD (  13.40  )
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

On 29/04/2026 20:50:21+0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Drop patch #5 "arm64: defconfig: Drop AMD XGBE Ethernet driver",
>   because the XGBE driver is used by enabled ARCH_SEATTLE
> - Last patch (switch to modules): switch also IGB, because it can be a
>   module, since I2C will be built-in. Switch XGBE to module (it is not
>   removed now).
> - Add tags.
> - Link to v1: https://patch.msgid.link/20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com
> 
> Several first commits have no functional impact.  The last one has.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>       arm64: defconfig: Move entries to match savedefconfig
>       arm64: defconfig: Drop unused legacy netfilter options
>       arm64: defconfig: Drop default or selected drivers
>       arm64: defconfig: Drop unused Ethernet vendors
>       arm64: defconfig: Switch Ethernet drivers to modules
> 

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

>  arch/arm64/configs/defconfig | 374 +++++++++++++++++++++++--------------------
>  1 file changed, 197 insertions(+), 177 deletions(-)
> ---
> base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
> change-id: 20260412-defconfig-b57e7f9b5394
> 
> Best regards,
> --  
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

