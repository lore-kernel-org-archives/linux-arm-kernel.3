Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60951C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FIFnPA4i8Uh9sav+OYDKSxMFjPguw66anaA/6adj9k=; b=woLJiXplyf8U80aY0ecZ6Bj9mN
	pTlqoycSMXV7Qf1UejqP2QsnadeXQaJXxnUKFruZymkLvBTMr6+Vyj0zoAYffYyMApY1f6Z/omx9b
	QrKY1DCG/vmtWNz4Psidn7iMLatIAaG8QWU61mZCPiG+ZqmJBV/XZf175dXW2YoV7JZ0v2mdE1uvR
	oinV2tVWi2p7qt5ebdqEv7sg4BkSDOKzN/I0MlwAS+bihQuZEiETMONXRTTEre1NB9ILUtgFIQKvO
	cLFfw87t+eGVTMcdor9IL9X9+FpoUNXYl/edHaSa5mrr9qkIJ9r5lzGOGyjLsuI6FCuStbmTOdUNd
	wZ3Ijivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBRZ-00000008Uip-1oYo;
	Mon, 13 Jul 2026 07:51:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBRY-00000008Uia-2iM0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:51:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69A2941804;
	Mon, 13 Jul 2026 07:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BEC1F000E9;
	Mon, 13 Jul 2026 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783929072;
	bh=8FIFnPA4i8Uh9sav+OYDKSxMFjPguw66anaA/6adj9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yyjr5rgxqGJLd4ab7WgiQ5BvmtH2qbg3TVLqR69cerg2tskgRThP731oNyfPPMcDd
	 kE7/22nb1dwDakw5xZPhIP25qwp1tAPiYh0XlqLdb3PKU+xKVFUenWnD5Ma2BwaEMr
	 aNzISpYVj+OP1cmTxrrSHN4U4jwseMxsH8ntgg0PPoyR/9jbeLKM8+ux4sb0G1GUGs
	 WR2tgF7+0nyFlN661jajZULEn8S6TNcXMF+PtLv2f36Up5Leh2255oXMxGr8UAkMH9
	 PmCv+3X8EGck8a0niArjVXBw7tt3sT1VH0eWIPEybI4XRIfC3xd11FouBAnmEraFv4
	 mus9RceepRfPg==
Date: Mon, 13 Jul 2026 09:51:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 10/10] MAINTAINERS: Add DH electronics DHCOS SoM entry
 and fix email address
Message-ID: <20260713-rousing-transparent-mongrel-ee18c3@quoll>
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-11-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711210131.236025-11-marex@nabladev.com>
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

On Sat, Jul 11, 2026 at 10:59:39PM +0200, Marek Vasut wrote:
> Add another SoM type N: match and update email address to an
> up to date one in the process.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8729cea57c3dd..3532d425e41f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7518,11 +7518,12 @@ F:	drivers/iio/chemical/sen0322.c
>  
>  DH ELECTRONICS DHSOM SOM AND BOARD SUPPORT
>  M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
> -M:	Marek Vasut <marex@denx.de>
> +M:	Marek Vasut <marex@nabladev.com>
>  L:	kernel@dh-electronics.com
>  S:	Maintained

Commit is fine, but, assuming old address stops working, please send a
patch changing address in other MAINTAINERS entry + mailmap entry, and
in all of dt-bindings (one patch for DT is enough)

Best regards,
Krzysztof


