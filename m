Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5EBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcSG3wV7MqHR3xZjXiOchkGnM5zXJlh1CFw5Rs+uYuA=; b=kkqbVWSO1aFZPFwvhyDJESIfTg
	Ekx14zRIXKPMLO7unuFp4gw2v8FcD5GuUGXTINItqL2R81XUwYlL/upKO0xTZZf3j7Zwa15JVurnJ
	+ntDiwGe2h8/NWoW/CExvVQhhi9CkwTYu4agIKyAOu46kvce2JLDYL+MnpxnA0GcrbC/NZUpTEuqz
	uHgABNr9lsnrEJ8eUXDbEK+alnc4zNgnJsIxySDph4+VJGejqEeQ6kFRF4RyZWMnBLbHef0Rv9KVd
	e/YJ/GCNeJvD9/Q9KgMx0lpeIj1AD9rLUDqanKki+KfWUK08JMvY2l9QIOHc+esHSGXvIefGDgaRZ
	6cQuPipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8E7-0000000Dz24-1XjA;
	Fri, 11 Jul 2025 07:31:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua81y-0000000DwAS-3fe8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:18:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A7685C6E74;
	Fri, 11 Jul 2025 07:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B67C4CEED;
	Fri, 11 Jul 2025 07:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752218330;
	bh=ShP/GEws3F/Xu4CDdBl2pJANZePb6Hhgh1YDAXnYmF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SR7VvVLmsgpvKcfH6j88LGLYp5FOHNoAYvu61OXcQ6IHEFQo42mfJGjToRC2rYl+W
	 1BZdMGfEFqmqZYXvP3Oeguc7jbozkY+7FRVoxZlzUB9HuUd7pB/JtudX0gd3WEU3PX
	 yYsl8VZNXozDIpheEfYjCqJ2f3rhJChNxensOUop9nP+/RXQGGMjQm+l96EuI0XXCg
	 5H0ufFAZA7sE8Ha5GUNAS0r0iWl8VbgzYoDjzrHEghmEAEZRK7r7SUx6rO2QYfG70i
	 5zZr3vn/Hc8fn68kuSvzt8i2WkjNTdavny94tmwc8t+KDqWSItiGtQpNeW38izvlYu
	 IU0m78xaLR+iw==
Date: Fri, 11 Jul 2025 09:18:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Devang Tailor <dev.tailor@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
 exynosautov9
Message-ID: <20250711-nebulous-emu-of-defiance-f9f8a1@krzk-bin>
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
 <CGME20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe@epcas5p4.samsung.com>
 <20250710083434.1821671-2-dev.tailor@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710083434.1821671-2-dev.tailor@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_001850_961558_590B3D45 
X-CRM114-Status: GOOD (  14.33  )
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

On Thu, Jul 10, 2025 at 02:04:32PM +0530, Devang Tailor wrote:
> Add "samsung,exynosautov9-rtc" dedicated compatible for
> on-chip RTC found in ExynosAutov9 SoC.
> 
> Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
> ---
>  Documentation/devicetree/bindings/rtc/s3c-rtc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


