Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C7FD64091
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCkinHV4o/Z8WXD5zsl0dBRO7f0JEpD6oavIfp41WI8=; b=UMfDJdlcUP7NL1yhvt+bxoch5l
	Ax9/9oj6GJiC0Y9OLw7gXnejQpfMlG8+OATeGiQtwGWeA0oJ3lix/ns1XcL0niDUWbMinpYhpR/uT
	emSCNCdWfQQA069Syb6ZiiI6K8Sj02vWcRBAxAZl7gMHC4vahMjSaOXsuSMpz/Qv5hDMPmXlzk2o7
	t+sB7GxzgKIR7Ln8Roj5PoygJOdT9zUGKfEevwBQb64CNLwQTQWrhfJPnGu86uW5IGYQmbCfYklCq
	mOLH3q7xxRC1PuAUx8yG9KIu0Y/+h97PlqmvDwGIJaxICcMAvdBNtnpFXiK20JCz6BxrpbyGu1j12
	Vppf5c/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVn3N-00000006MX3-0FTf;
	Wed, 17 Dec 2025 08:38:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVn3L-00000006MWw-10BP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D3DD6018C;
	Wed, 17 Dec 2025 08:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F371C4CEF5;
	Wed, 17 Dec 2025 08:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960714;
	bh=SEK/Xv/Xpl1SB8LM/NKk5Oox72KsTiMyeOEPmpwl2Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGnkKpV2D3o8VjP+EFMXDZJCBrR4/A1B7x+1gZzdquyGkCynph7xWWEcSoois7nEL
	 N/Fpz80eBfX63qEt881a4/ji2jVta/Z1riZFlgfrsP8DXi9NwiXAYKS5VesBcLqzrU
	 1Dg4eXua9UczMKDOqVOx/HBA35vs/uocPrDye3XcqyWPS87W4el6XmX9d2Sg8stedu
	 NoAkDOSnMhz4RlEs/CdQsOtgo9UPdbdMI2hVCJJ3+JPgAc2frvMBEQWhHOVbR1lzfy
	 1eqf+AhUjXpWJJeWttIYzGJVvzaRzF/zpNXsUltVP6QI1ShPtspIBj+4WjV2o4tiIJ
	 aSf0kpmmtmRAQ==
Date: Wed, 17 Dec 2025 09:38:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, dharma.b@microchip.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: atmel,hlcdc: Add sama7d65
 compatible string
Message-ID: <20251217-secret-beluga-of-patience-3ba530@quoll>
References: <20251215090639.346288-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215090639.346288-1-manikandan.m@microchip.com>
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

On Mon, Dec 15, 2025 at 02:36:38PM +0530, Manikandan Muralidharan wrote:
> Add LCD compatible string for sama7d65.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


