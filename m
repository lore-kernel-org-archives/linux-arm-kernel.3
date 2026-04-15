Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A21FA0C47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIfiro5qa0qdakbKJs/gPCa7//kofURKtoktUaVygDc=; b=z6eVDzLfsaCjzJtIkVfhRNgdtp
	iwTWquc7Yj4wC1M/4jW0cdDd0DaeBRKt1B5y64XJL0c8wGYtSOZAFmLcXf9iYT4HSa3zIYfCFC6dr
	9kIMLq+J54aOgZLQH47+aFY6MZ96EnuskPplEfPjwXah/6PcqEQbEwLz6u5Ab2Rccoq2syJD0Ef3w
	C0I6XKXgKhviLLKczKfgC9cWP8vhmWGbUujetsdIPiKD05Qlc5rVdtPKN0vXVcGK1V7sF42JJnlqw
	JKJxKb+F9qIY8qAea4bspwz5u+vU/zGlsPYnd05o4XXiFQ55tXJF0XnG9C5BJkiJG67y4yDEk9B/Q
	3qXASbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvGS-00000000lut-1oHH;
	Wed, 15 Apr 2026 08:06:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvGR-00000000luf-0s5G;
	Wed, 15 Apr 2026 08:06:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E16A660131;
	Wed, 15 Apr 2026 08:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14785C19424;
	Wed, 15 Apr 2026 08:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776240381;
	bh=MSJUysqVgt1QUFc7uq+PpRAh/iOmjbKOQGfVXqW2iGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nri/vLHGbGnwm6HJFES4MIwV+2lYUglPI6smarMNGpx5Fm+iQQI4QyN368R19Zl7N
	 GciIs+1dMlIduO6Dmh9OO0wcLOel4ZROmLkgN1sJHAjLDmaBNEyt9pzf3epGRuMUHd
	 PzbzteNS4GGoaWNLxOsZpmNkwW4gnXJpe3Ot63JbBIMc07JfRDqWjiB22veA/O1GxY
	 DRag8tiyI7qdBEE9tcYKQ7we+kd6d6ITXOrzCXRJJwty6Bok9xQ0nF7lFVNXTb6/Cm
	 7WE0QKUnzeJEYM+8RvFz2oLIzT0xzi1xZYvnJcVJ3ORajDqdkg1WvlrfIE9r264HRE
	 LrtRMfuGZVr0A==
Date: Wed, 15 Apr 2026 10:06:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Gene Chen <gene_chen@richtek.com>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] regulator: dt-bindings: mt6360: add buck regulator
 supplies
Message-ID: <20260415-spiritual-sloppy-sidewinder-2d394c@quoll>
References: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
 <20260414-mtk-g1200-pmic-cleanup-v1-1-2a7193ed4e93@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414-mtk-g1200-pmic-cleanup-v1-1-2a7193ed4e93@collabora.com>
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

On Tue, Apr 14, 2026 at 01:44:10PM +0200, Louis-Alexis Eyraud wrote:
> MT6360 PMIC provides 2 buck and 6 ldo regulators, that have each one a
> separate supply.
> Currently, the supplies for the ldo regulators are described in the
> dt-bindings but the ones for the buck regulators are not.
> 
> Add the descriptions for these missing supplies.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


