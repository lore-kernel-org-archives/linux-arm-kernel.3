Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCABCC36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 20:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJfgCnXuhBLEgCpzz+cHEU9UnLI0jxUJyQLwQZlIBUY=; b=FvXaQwT3ni+uZmpzuWZkQKpKBk
	MvGSkFyMXDx8PzCTlPmGaBTFc8m7L5hH39m79M+C6Z/O2gnjVgGv32erQSLvwRJNrxL9Tc68bNv+9
	DRGrltollnxIzLgCVyZB3s1L4ZAvDawoTCWNxh7mCuAR96uOoMXOxKV4byDqY9I8A4aj7GsQ1Cz2p
	e+PwBOjnSjcdFBH7N2cUyBu8n5XCbjnzq26jsMgi7WP+A05goNCVva2QjsHcac7yJLxXlQBpYp9WH
	DEYiG8yQB3xHIzQoQozqITEMKii+14HP+moJ62XzWrEdlMncySVNHqofF8hF7tYqOYgPUM8W9csXw
	CPIu3n1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twoHI-00000004AXc-1m3S;
	Mon, 24 Mar 2025 20:20:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twoFZ-00000004AG9-25ry;
	Mon, 24 Mar 2025 20:18:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 432D343B92;
	Mon, 24 Mar 2025 20:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CF9C4CEDD;
	Mon, 24 Mar 2025 20:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742847499;
	bh=NnWv+qAJjyydShD2opgIyPjRUBku9e2zXaoi4Dh+lXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sGbiLowv7wzD93y9r1HB2YDp0gsAInUeOtuyQ50pYwOHxm6jzie0j6Q2IQTQv535S
	 id9QWjB3T128AvmAZMoCdwPSFsfoAPXzaJJbyTk9ZcW85hre46Xx0wYNabn1Vr+YK1
	 9VFx/91shwNAKH/STumDqk18bLOu/6At5QAG3kXuz7tu7jwbOuPY3i6RngMQRRyOAO
	 K8E4PdExxpsozvFLUQnf+vCfxNtdptU9sSdhqNWpxD/qHoGBlCEIXTOi5GPn53uWom
	 fpf5vCW8cKD3F6UhS8l8t7cVd8tAcui+QwxxkDEnCDygd8ntlBNilu1zPX/rI2atRf
	 bHP7BpjpZJt7A==
Date: Mon, 24 Mar 2025 15:18:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Drop unrelated nodes
 from DTS example
Message-ID: <174284749693.804487.17057148980208397199.robh@kernel.org>
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_131821_555211_F68B277D 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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


On Mon, 24 Mar 2025 13:51:04 +0100, Krzysztof Kozlowski wrote:
> Binding example should not contain other nodes, e.g. consumers of
> pinctrl of, because this is completely redundant and adds unnecessary
> bloat.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml      | 10 ----------
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml      |  5 -----
>  2 files changed, 15 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


