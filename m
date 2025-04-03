Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2680EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XR45S0HUEDpv2q2LNWLE4ja8oPcqVCf1Au0aQYJyk0k=; b=DsRlwQmpbmJLipd3At/aV7Rvuh
	XUEOQ9Lq/Q9L9lYAGqqauF1S1ovfIc9naWSwPsoHkA/0KgoIZTq1EUifwxJyLZfKw6yULUfSD3oCv
	xQFDhGqHrzpss5KcBdCkgk6KPsAdad3FRUUmVg2qfJxxLR3tPgQJJ5B2N7P6aMBR+pSuLTRuMPguz
	GL2L/VW8q18FX3giuhSwwccD1xnYlf/h1q7zdyL6zQaFcSJxRrDxCnW7eJD1QcMpX7TVjOltAk4As
	cwYQHjmYOhnh97HyoyV0U3pM35yaQUhIIxI9H0js+r5MP17cTdWFFWapi3No8oj612vHl6GZefbW0
	OH0KATwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EJB-00000007xsy-45n4;
	Thu, 03 Apr 2025 06:44:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EHR-00000007xbC-3GEv;
	Thu, 03 Apr 2025 06:42:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E31F768424;
	Thu,  3 Apr 2025 06:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC26CC4CEE3;
	Thu,  3 Apr 2025 06:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743662544;
	bh=Mm5UvShqJfS6Bo3gBY57Tk/+isrXqZzI84v5T2TgGyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qgce0Ewgkd+Cumb5f6U4T1HhR7WHTnXMeJrlK6+7f+dxtNnJnHGzn4rG1Mh0jfzKG
	 GYtkJizV2zO7Q72uwCvGV+9tZ7MjW203gozPMAbCeIkZnsgByXUV8z2r4qJ1sEcryJ
	 0RX3uL8ze5r0AjY4Ymw5pMLgaJum8G4C9JgeHAZwZMjMg60yGnZf9DZiVvrnA2uncK
	 TTDMv92scWRTufXVLVNFCgXkbUkZZHANAES+VwsOK7DGMrgpmPDjadzPqVXME1DnVt
	 96T/3vhXiBiJsHJydOyNmnrUJcYxXPYniJ1sxotmez8xtYriIU6Ck4lRHhZfRByenT
	 hz65jzoVWTjgg==
Date: Thu, 3 Apr 2025 08:42:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, heiko@sntech.de, hjc@rock-chips.com, 
	mripard@kernel.org, naoki@radxa.com, stephen@radxa.com, 
	cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, 
	yubing.zhang@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh@kernel.org, 
	sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: display: simple-bridge: Add ra620
 compatible
Message-ID: <20250403-big-hog-from-ganymede-6aa617@krzk-bin>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-5-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403033748.245007-5-andyshrk@163.com>
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

On Thu, Apr 03, 2025 at 11:37:32AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> RA620 is a DP to HDMI bridge converter from RADXA, which first
> found be used on ROCK 5 ITX.
> 
> This chip can be used without involving software.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - First introduced in this version.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


