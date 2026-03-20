Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9284E1091936
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HksfWzlHk6dele1zogLUK4VGQgN8Vyx8RkRQlrQ+GM=; b=JvRthTeLL5rPmxzHtYIArME0EL
	Go2WK49wUXWfOiILKxd8JTEZBCjzpfM9v72DxsB1w6Jf9uzNW1H+Tey8ECiJ0eSnr/GWe0USeZ8l+
	S8pZyCFyRj29hqr0UkBV8lrYawcBmiN+lo1t0M5rODNS0XYzrkQ/p8a95IMfzst2gQGynw1+22QiJ
	Fl2JKTyO6LHZTj3rtd1bnutYBlR5hAIKsR6QyjQ2ITDdcneAaCyc0yx28XuvV3528K5Q7wOhdjLJg
	14Y6eVfjA+k4j+mHbOsY+eghYxkSaUcF8djfBYmshrzGywLcZkN+UpfKDnXiIrwS3mCwNwh5QX67k
	P9JWftOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WDR-0000000CU0T-1ZcN;
	Fri, 20 Mar 2026 09:32:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WDP-0000000CU0A-40qa;
	Fri, 20 Mar 2026 09:32:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 223F560126;
	Fri, 20 Mar 2026 09:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D63C2BCAF;
	Fri, 20 Mar 2026 09:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773999142;
	bh=VUjusfcWNiioomQAMpt7H/sMIh5fMEuv5eVS+PwYWq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gEOhjXMFIf3NChhI6op7n7IJf161dj7gEQyIVIByBCzBOc5B8gMj6GUrRCNkqKPXP
	 OeS8S4cvr+rpFtXSEDrBDL1JeAjT2SJ9QEVyHmGze0VTBYJVvC/i2l5Ri6gXoaLDVt
	 EsQCPr1hnkpP/0LIH9WM5eQoqid52bCzzcpcxUuF8unIVJEBrqtn052N6yxALFWtZn
	 6r6SLoxsq0LHZLEoNK8j+jpNX53Qqpn7HAyfdnMP3LLNaITUugc0kgfcXCs+dDyPK5
	 01m1EWaDKJXX+9zqa3bknfLdpnoNTXlRSDL0fnoSVKyl+HbSV0u6gxHiTbtr8318BG
	 7HYozUeS8ByOg==
Date: Fri, 20 Mar 2026 10:32:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] regulator: dt-bindings: mt6359: Drop regulator-name
 pattern restrictions
Message-ID: <20260320-fresh-sloth-of-chemistry-ec938f@quoll>
References: <20260320072440.2403318-1-wenst@chromium.org>
 <20260320072440.2403318-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320072440.2403318-2-wenst@chromium.org>
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

On Fri, Mar 20, 2026 at 03:24:34PM +0800, Chen-Yu Tsai wrote:
>    "^ldo_v(aud|io|aux|rf|m)18$":
>      type: object
>      $ref: regulator.yaml#
> -
> -    properties:
> -      regulator-name:
> -        pattern: "^v(aud|io|aux|rf|m)18$"
> -
>      unevaluatedProperties: false
>  
>    "^ldo_vsim[12]$":

With this, the contents of all of the patternProperties is the same, so
you could as well combine few of them into 2-3 groups to make it smaller.

But I am fine with this as is.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


