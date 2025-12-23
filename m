Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A49E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOL+AU7kVQyOpYQ+Kf5A4ON6XtLBAZC/C5kIrkAAMMY=; b=bwbv9zMuBopk0ERL3LiE4/OcrA
	7xIePZMWEbbqZLwHfHQh1ZxVb2SkQHLGP8XytVpmrKsm76bHucGajnaHjsCH9sJBRx4scMwCrW5K9
	xRqa+aoePWCdpos0n8cLd9cit6MCaybEKS51Q3nOQG+BouCwS64B86z/wmV4esBCzKpzgN6Z1i2Ou
	LbCQyINiE8Fj5IYxtc7QSCZlY8C5Ue05g0gqprWWpVg5Mx8y8lI+Q9IrGsolJzt6pPFEBFwM06KQT
	gyL2WTLKLhWi/+P6zrWX4Lwr7iTagmv9rmvhPLl88EKPKGTKQdSm0p3V3TMQZKiwqoTgzDuFq/V44
	/QspE+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Eo-0000000Ffie-0Tqd;
	Tue, 23 Dec 2025 15:23:50 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Em-0000000FfiF-1fr4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:23:49 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 88E0540AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766503424; bh=LOL+AU7kVQyOpYQ+Kf5A4ON6XtLBAZC/C5kIrkAAMMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s31WIABBnz/69IfOXguM2PScYz+zPgmqMyTUH2dALC9zZjJY+BFPgwQ7PyfdvaNzO
	 NJRjODp9ayy/VWT+6oaXylLbHZ2PpJikFFmlpYfwBjtA6ySoH74QV5lUE6THGrpA/l
	 EqTdgINL1rfaX40xJ2IofEGLYuqfPwxB3ZefCl9mJI0U32nUUiLbT0gQtasT1p4J8b
	 nrX7ZWWmUS8wDOgAACWolgwoudFUCzOWzFU8ZxpCKskQ/fxROYtykjoH86ywLvHZdW
	 uWr3CKMEr+za8eyKGhfE8DWfUkSmPavYm2RjoylGL69N8Wr+bfYJ2vgSwZgtagWYi1
	 ixFP/hLDsg0fg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 88E0540AFF;
	Tue, 23 Dec 2025 15:23:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Arnd
 Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Linus Walleij
 <linus.walleij@linaro.org>, Drew Fustini <fustini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
In-Reply-To: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 08:23:43 -0700
Message-ID: <87ecolxlvk.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072348_476911_8752650F 
X-CRM114-Status: GOOD (  19.15  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> It is already documented but people still send noticeable amount of
> patches ignoring the rule - get_maintainers.pl does not work on
> arm64/configs/defconfig or any other shared ARM defconfig.
>
> Be more explicit, that one must not rely on typical/simple approach
> here for getting To/Cc list.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
> ---
>  Documentation/process/maintainer-soc.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
> index 3ba886f52a51..014c639022b2 100644
> --- a/Documentation/process/maintainer-soc.rst
> +++ b/Documentation/process/maintainer-soc.rst
> @@ -57,8 +57,10 @@ Submitting Patches for Given SoC
>  
>  All typical platform related patches should be sent via SoC submaintainers
>  (platform-specific maintainers).  This includes also changes to per-platform or
> -shared defconfigs (scripts/get_maintainer.pl might not provide correct
> -addresses in such case).
> +shared defconfigs. Note that scripts/get_maintainer.pl might not provide
> +correct addresses for the shared defconfig, so ignore its output and manually
> +create CC-list based on MAINTAINERS file or use something like
> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
>  

Like Laurent, I don't see this as being effective.  Why is it that
get_maintainer.pl fails here?  It seems far better to fix that, if at
all possible, rather than expect random contributors to notice this text
and work around the problem...?

Thanks,

jon

