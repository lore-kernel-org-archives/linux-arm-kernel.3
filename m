Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502E8C982CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SE4zEGARKaWXJ0MZBWdIn9hbiHWoWVVykzUlnL6+jOE=; b=xDOUq4PwU3GE8UpZZaL2Q9Sn6i
	golaXj6gGPqWiySqIPZDgpeacuepdI/bDGTIyfFAMOvWmJ1nYUsXIcrqHIlAXQQyZ3eU70ly1gDtX
	kZNVSFXQg8F5oUaCOvg64PFwnmZcLEnSKrBWDzLkq6NzBoAPgWMFrMZDqP7ADzOgx1ch7YsVx1RgY
	fEnWdJvKK8H69PEJUBUNZo8Uhjr/vtHnm2yBJYlq1RV3kG0qzZv7dEoYZdVNX/lz5CrGhhjsY05aj
	Jn2H8fHfQvaXyIe2beOvZtvRxRp2//bM0+lwsacxgZNeVa0bL9CDEtHsuSTDVuX8GhbgtON7Hw1iv
	Ig9lkodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglSA-0000000EK7E-3RAI;
	Fri, 16 Jan 2026 15:09:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglS9-0000000EK6g-1gk3;
	Fri, 16 Jan 2026 15:09:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8E3B4352E;
	Fri, 16 Jan 2026 15:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0FEC116C6;
	Fri, 16 Jan 2026 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768576172;
	bh=JaycEg4pEUBARbXys6lFHpvRjjDORrRS0xEzYaJP3/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bn+ZQ6/SjS86BFNGVsh5LR0MQLdrS94iE39QOjb8kNzERTkYjbHv6uGJLIsNx+PfL
	 rXlgG7UuzYjU27UX54GD5i3ds5Z+2atDjusGzKgzSP8qQEX8KBXfQuX3CX6DpmTlnS
	 g/IQkQkW95qkVfg47/rW3JsrsPUhOOYWAlttYchuZB8m0oS8Exg0rauZNUBBU4305n
	 fWB1gZpgNG9OTrDs8R6mytg+qRr1rYV1SZpvgOA3yxwLZIod+CxyoofLCz0nbprUsS
	 d9PBqrLA2tf/5kGh7yhTelwbDv/NHyvPA2mSf5wORTjh9LnrTYskk/iap3ZFjwGt2j
	 IAQV5jNV3sksA==
Date: Fri, 16 Jan 2026 09:09:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: julien.massot@collabora.com, tudor.ambarus@linaro.org,
	devicetree@vger.kernel.org, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-sound@vger.kernel.org, broonie@kernel.org, krzk+dt@kernel.org,
	miquel.raynal@bootlin.com, linux-mediatek@lists.infradead.org,
	conor+dt@kernel.org, vigneshr@ti.com, eugen.hristev@linaro.org,
	richard@nod.at, pratyush@kernel.org, lgirdwood@gmail.com,
	mwalle@kernel.org, jiaxin.yu@mediatek.com, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, shane.chien@mediatek.com
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and
 clock-names
Message-ID: <176857617091.1608125.5751888135752689568.robh@kernel.org>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_070933_463059_AB601C55 
X-CRM114-Status: UNSURE (   7.91  )
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


On Thu, 15 Jan 2026 13:56:22 +0100, AngeloGioacchino Del Regno wrote:
> Both clocks and clock-names are missing (a lot of) entries: add
> all the used audio clocks and their description and also fix the
> example node.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 176 ++++++++++++++++--
>  1 file changed, 162 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


