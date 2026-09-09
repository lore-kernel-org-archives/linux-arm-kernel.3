Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F96C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmlMljZT/6fO26V/fEoR8ernMpnUFy1iAPY7wr0dQNs=; b=aGn4dIpfNSPi7DVOt79YwE0qJg
	j99a8ygEIoRG4kkOC65l422iRDQ6XdDIjnqPjMePir1DEgyU4oKG8yQ2E7m003R4ane5Xbt/YNhAX
	1mBn6gXZwlowsF78rz7QwZE4QCAPlEX07wAzr9zzFe6xTZ/Xq4mUkEEijML9/Z6DdWXJNqvo29u50
	cRvzt3sd3B+TYFhkIhsLpt3u5sQoM0tex+2BmMKN1xHcGzmM1BFmE13R1i2+BnQZGxkOteuNGVgTE
	Rj5WzT2/jfzpmk70WYAanrWtnhDFcj04iHLbHYKp2CrIDA6gJ+XaFnF74g4TvuPZPBLWHl0Ul8okb
	yKJQ/4ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LXd-0000000COdw-2mhC;
	Wed, 09 Sep 2026 16:52:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LXc-0000000COde-0Rv6;
	Wed, 09 Sep 2026 16:52:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86590600CB;
	Wed,  9 Sep 2026 16:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32791F000FF;
	Wed,  9 Sep 2026 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788972775;
	bh=GmlMljZT/6fO26V/fEoR8ernMpnUFy1iAPY7wr0dQNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KkhMoR6Gs7IooOaJd6DKs7tUqWc1jCblWwWBcebrdQphPcJfx9IHywVG0VVdPQcZr
	 Ujc+1ZiZDZsZBo0BrfVxc7W0Z7wbJxsVToSLW6b854TSdi/sJPu6STLcXEmkiKy4TS
	 3nkPhpQ1Bl7Z4P9RYdUWzulpKKMbSG40E8yaol2K0HHfVSpDN1gMbN6cbgpBTs9QIy
	 VDePMdyerGmnffIQvv6WecoqTTaLEzerfhfu6+Vu58/WBqIxA/6IEgxAWNKrGKLnDG
	 JgHQbPwgWlMwEFPoMtfE1bMTTELWNN7XggB/FHAP+91OztVhKa6hS689YxKChFNb7r
	 SkgQHw+GkfxQA==
Date: Wed, 9 Sep 2026 18:52:45 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 02/12] phy: phy-mtk-dp: Rename regs to regmap in
 struct mtk_dp_phy
Message-ID: <wvjid3xethoskbttbgy3oy3j7fxnonrnzqg7pqndn32skzp4bt@2q7svyz6ojr7>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-3-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 07, 2026 at 05:42:35PM +0200, AngeloGioacchino Del Regno wrote:
> In preparation to perform further cleanups and to extend the
> driver to support more SoCs, rename the `regs` member to `regmap`
> to improve readability, as this is a common name across many
> kernel drivers for a struct regmap.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

