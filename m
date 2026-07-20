Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412FDC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 06:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bx3gsttsL8btelDKsQYDh+3/bOavT+Adp9VCPD3qd+A=; b=FxI4vHr1vAg2LG3qTfeJUT83V0
	+avi5oGrMhOXPArj8foWPZBiYkdLlGtTGMNd5gqUGfijS1tQUWInokfluwFHnD5kybAnrNwp+shRY
	Eu5qQ5gxsnuZU7iUoHgQ8RTOcw22jDATwIFPWXT8zauGlw/5oCdZe2j0kRoSJfyqoMbqk3U93PTQC
	vpOr2ERTl4c7YhXetpUeB1jCnTB5CmtDy34t5E7QKF6bl0gZnUC50w5rlTfEUl5sav+0kYuiKX6a5
	aeI40hoTDsyc/QVaswe1dpeDNcvNyUmTcLHIz6bgKvkVin17MM1hjgRNpr5U+wQI/P+ySyuervLDh
	ybvn5exA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhRM-00000005wdE-0Xt0;
	Mon, 20 Jul 2026 06:25:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhRL-00000005wcS-0HM0;
	Mon, 20 Jul 2026 06:25:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 78196414BB;
	Mon, 20 Jul 2026 06:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6067E1F000E9;
	Mon, 20 Jul 2026 06:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784528722;
	bh=Bx3gsttsL8btelDKsQYDh+3/bOavT+Adp9VCPD3qd+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YsQIgxybjrk7faLE++FmKSV3ktlpxiJL32be2JLGgMb/ND86aiUyGL7NiY1XAB/YA
	 lrVvjp2czMVRHPZU7d9TSLg6WaPv/EBRoBRRzcDL8ubHITPS/D9C7LYx6/WI/7A/rt
	 8f7N0tATE6JTt+f6qXLZSTDMKpk1kfz5FierAP7Qj56tR5Cj1gnJKkHSw/GuJ1im7z
	 x/Ew3EAtPk6Ce7asZGpgojsjaAApQ+gSA+d6muRqzIh7VU+02LDudV36PY8tvSBw8v
	 QrwX68E5CEdXpux2RYsGZzhC6cS//KOTGJ8H/J/jlaEOI0f0/6k8CbIvx3L6GI6NO3
	 UjYIIZTHv2chQ==
Date: Mon, 20 Jul 2026 08:25:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: reset: Add MT6589 toprgu reset IDs
Message-ID: <20260720-gabby-strategic-goose-b61c4e@quoll>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
 <20260717163959.714561-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717163959.714561-2-l.scorcia@gmail.com>
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

On Fri, Jul 17, 2026 at 06:39:12PM +0200, Luca Leonardo Scorcia wrote:
> Add reset constants for the 12 MT6589 toprgu resets.


This is not a single-patch patchset. Seven patches.

So one posting per 24h, so we actually have a possibility to review it.

> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../reset/mediatek,mt6589-resets.h            | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
> 
> diff --git a/include/dt-bindings/reset/mediatek,mt6589-resets.h b/include/dt-bindings/reset/mediatek,mt6589-resets.h
> new file mode 100644
> index 000000000000..ee08c39df513
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt6589-resets.h


Why is this header being added outside of patch documenting compatible?
You have entire commit msg to say something useful instead of repeating
the subject.

Best regards,
Krzysztof


