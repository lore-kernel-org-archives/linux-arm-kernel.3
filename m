Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0FAF01807
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTDhRSomg8rz7nCouJ9UcvE6lJ4VpWjCS1f4Ir4/3cg=; b=BlZCrDEucQrzT+PhPqiaCzL5sc
	Yez3tTHAFyG72PghgnMFoS+NlkwrPWPuDgJzoPeNbnIxyxQhGpgG1ac/wwev/w4nwhT617aN6dq0A
	mXIyORx/XHRCi4fwq4QeiY5hH+DrH/RbMfkMzVxhzJ3U7GmUQAx2QGQwaX0tMaYeKB3uav7pWNHZj
	Mj4m4LlYLd3W8R+Y6J/V+5RE9HYOCJ+bQMMWGrtPU48LoJPXxV2CQPMmhGm95q9tFnFJcnQz5VcNB
	zrM+qyd/6jMyx5K7KhsG0qRGy/clt/79eKmWb5YTbSdKsUJc1SbxS1xPDjozskt6GNWs+zUKl60th
	4q3r28Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ6l-00000003D0S-2Ulm;
	Fri, 06 Mar 2026 08:00:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ6g-00000003D01-1XGP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 08:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EBD140700;
	Fri,  6 Mar 2026 08:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA98CC4CEF7;
	Fri,  6 Mar 2026 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784021;
	bh=iD/VzlwDTwkJdaLubLGKVtxVDTiATyldptYt3Eq4+W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGLxPXBEPp4RLYM+7FzuxdhtMJt2EG85Qr6Y7+8IOyLDCQ5sdzHvaxmcZMw4zeUHq
	 O/rMnUHNJxeACFOaI7z6W5N0C6QjPjpuMt1qK03C8NVzvn1xqisygTzEP+mO/Lggm5
	 XQryoRPXV5Byzv8ON+wizR5s9ENCmsYLiWClAmL2BA/84MKyPPdo4Wlgive7/2pNMU
	 DQMbN+EL+vy2HKkGb8J2fdNaaR+qBCz5cEGfZMQ5ydBQeCYfq+m7e8ONO8636bYqd4
	 rk8fCVoteI0IPeDkQJOXw6Z74wVIWgpsroBs9lVXCAYgDk7cTd0Nl2KAFRuhBrOmON
	 bN87DPyCATJOQ==
Date: Fri, 6 Mar 2026 09:00:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, shawnguo@kernel.org, laurent.pinchart+renesas@ideasonboard.com, 
	antonin.godard@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: arm: fsl: change incorrect
 VAR-SOM-MX6UL references
Message-ID: <20260306-observant-banana-wapiti-90adef@quoll>
References: <20260305180651.1827087-1-hugo@hugovil.com>
 <20260305180651.1827087-5-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305180651.1827087-5-hugo@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_000022_428963_B2EA8C03 
X-CRM114-Status: GOOD (  14.00  )
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

On Thu, Mar 05, 2026 at 01:06:19PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> There is no Variscite module named VAR-SOM-MX6UL, but there is VAR-SOM-MX6

And binding does not speak about VAR-SOM-MX6UL, so I find your commit
msg extra confusing. It took me way too much time to decipher why you
are doing this and this should be just simple correction of name to
match the product expressed by compatible.

BTW, the DTSI also has wrong name.

> and also VAR-SOM-6UL, so it is confusing at first to know to which one it
> refers to. The imx6ul-var-som* dts/dtsi supports only the VAR-SOM-6UL [1],
> not VAR-SOM-MX6 [2], so modify comments and model descriptions accordingly.
> 
> Link  https://dev.variscite.com/var-som-6ul [1]
> Link: https://dev.variscite.com/var-som-mx6 [2]
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


