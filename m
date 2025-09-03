Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE736CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDg0jCcMyiKzR2Ge2sZ2PhL3ySMTEU5OcHOphkCPX38=; b=EGxCZbDpFrzLn3udUDAny0gZqC
	WxbH3CIt7MdJU+uriVlJay9wIKtsM82o7pJewQL9UGBy1C0M1BRUc57IHhPiSGbDIh1597dyG6mPI
	Dg4tBbVrtdPwMBSeUYbNLxxBxdTxdDc3BmerR00JHpZx6A+5oe3gN/K2iV4X2bplFjgu65sRsnhP/
	CIbTnMV5DR16IqzALmChMVDLDde62slenul5bDrwgGCZfP++hsKmjHyeCYf6+5vbj3WHLF8Sdmrd3
	FTyLM/kJcei+iY0cYZgoQmeIweExEJLKgauD4xeXSCoZtyONyDy7kYq80V1yawwsb5R+nJr1w4MY0
	uEjx6lVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlqM-00000006FhN-43YQ;
	Wed, 03 Sep 2025 11:40:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkms-000000066g1-0Peg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:32:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EF7140561;
	Wed,  3 Sep 2025 10:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF577C4CEF0;
	Wed,  3 Sep 2025 10:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756895541;
	bh=OfzrlZXS+tBMSuJAzsFH4VWHQa6joDmypBhEW3I93v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGHA0fp3Hf1VEqeMMAZrlym6PXabO9rrhcd1lvPa2WIXppoeyaZpTlX33Ha+Oxa4l
	 CowlJYe7rWfTlggy9zoRE6n4HkKJPbs7FxxCWT3ojJZZ9Fg7JCOvkRsrjrbfe0hDxl
	 m4i2Lgq3XFWrVqu1J5ngy7bJp66xcgRIoy4mhoY/yZXh7Cc3AXwSpfkVhE3tqG3XhB
	 UETEhyweujRGFIBXIJONOP4GF++pjORZ6tsw1noHizONGEEhDS4IM07q1tHTcEBiBm
	 F1TT+Ls0atcjKvScPCIpFITyZ/z17NjYKj6FCLcum/ohMXUdbjcUkk/WuUhAa/cavw
	 NkdPePleYX4JA==
Date: Wed, 3 Sep 2025 12:32:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: s3c2410: Drop S3C2410 OF support
Message-ID: <gqcst3ceesm6zt3es332wbr3wqabayuvax4do6mg3y6725aufv@iarjuy462xcz>
References: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_033222_157318_ECD6321D 
X-CRM114-Status: GOOD (  11.50  )
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

Hi Krzysztof,

On Sat, Aug 30, 2025 at 12:36:02PM +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of "samsung,s3c2410-i2c" compatible.
> 
> However, there is still a user of "s3c2410-i2c" platform device ID,
> S3C64xx platform, so that part needs to stay.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

As an ex-Samsung active developer (and always hoping to be back
someday):

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

