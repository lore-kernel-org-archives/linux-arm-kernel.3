Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55772CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmQBt7P2Kn0Io0KbERzB0bMS4Qfw0eQOzIjOmBYJhVE=; b=HqaPuvVdVB0vohgjM9tBH8RCXc
	w9/HeCVNmpNSigedBrJfGFMp53KAo02F4h043NG5K4IXxAX9Kom5HrKE5jGKI2EdYXSCtDN1cYqXz
	RqcxXVHe3hAkfEfTN72FO7c8BQHcrfqkIVP63cZ0Ynf+9x8EY1SNbZ5M1UZc0xUMf2nDSknECB/QV
	XFG2syd2H3LuA9Sr0iRANl38BtTYu/bfqbRmE29z6dT+jSLKnPMLgYDUzIpeQ3zPk6IZPfkq1fOlc
	W+q/vQ+m5XArpZ8GhIot60s4tBq2jTHlRv1hN+HUljFIAHnklTWCb9jYz6T+JgLRWIvXE6Apg9rqK
	bfOD04gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcK8b-00000007X5n-3cy3;
	Wed, 24 Jun 2026 09:43:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcK8a-00000007X5Z-3pmG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:43:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99C5B44025;
	Wed, 24 Jun 2026 09:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A070A1F000E9;
	Wed, 24 Jun 2026 09:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782294196;
	bh=CmQBt7P2Kn0Io0KbERzB0bMS4Qfw0eQOzIjOmBYJhVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RuXE8ETsiYdf/BYMy07f+nmvmgv5OeYMGl4o2FVqeg9X6ft3YXRusep8wyxM2rC+W
	 llE2wP5bjOqvWPEpakRTgk9Drf4ZhW38ubz7DOZbIQkdi36GBVHMhxElH16M6AWWby
	 q/UIbzfkf+qCpshD0jIGs5HkUNm7YgvNd8fBUxXDL50Xg6eQVucege54nFyRp3fNUA
	 ZtSlG3K2mXFwNVQNTpsmiMZNOHRuyStj66JklCq6keN/zEgxJKGcpBpeFpcRj/cGoF
	 ueM0gAXvK6VgpggwlnhUSV0VwSMGjWK2P5r5Ec8AzWctPbvYsaK1mWvFH4ChVfFqKk
	 i5MppQzcYxCVQ==
Date: Wed, 24 Jun 2026 11:43:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, neil.armstrong@linaro.org, 
	jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, 
	kristo@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	thierry.reding@gmail.com, sam@ravnborg.org, leonardo.costa@toradex.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: display: panel-lvds: Add compatible for
 Opto Logic SCX1001511GGC49
Message-ID: <20260624-sociable-infrared-manatee-0e847a@quoll>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
 <20260623195741.495734-3-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623195741.495734-3-leoreis.costa@gmail.com>
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

On Tue, Jun 23, 2026 at 04:57:38PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> The Opto Logic SCX1001511GGC49 is a 10.1" WXGA (1280x800) TFT LCD LVDS
> panel.
> 
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


