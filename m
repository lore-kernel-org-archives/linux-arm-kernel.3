Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF3AD30CC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4izYIh9qVdoDMNSrQyRl8FoseVgdVjFMkef9SQtNJYo=; b=Sc6SDvbNHCgoi6CtvLNPP7Ns/J
	bYMA0xJJs3MRUOfLiM8UfsUVISn55fla76lDL06945gtlJiCYjQHwYpWcoaSWtTPGorlVra4Cst88
	4eTPMc6UsqR0Khs9V1enhhe6konR1xUcqPAQzykjdY+0MGOvIoUvIP3v3di2gkCjzbd6shmwActd2
	7m8Fw8+LS8R/n9imct3MVe+zIXeEHZ3R/KwiQU6vFo15t/zsJ3PoB9exz6KWKxeH4oSmQ+2YeZjD9
	L8YyhAtTSaN0fgWgW6sD357mIiV5/UXbP7xikUSVI+VYnPgwnCm3s4MLPPJsfVnFt5qKPTlurJPLO
	JtaN7ojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm1w-00000007keh-1ARL;
	Tue, 13 Jan 2026 21:34:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm1u-00000007ke1-1hhp;
	Tue, 13 Jan 2026 21:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 787D560017;
	Tue, 13 Jan 2026 21:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0665BC116C6;
	Tue, 13 Jan 2026 21:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340061;
	bh=C8GY8cY1NPh06GheL3PI5yKEb9iGVDbttIMOqkOAQy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S44/Skx2XyfAHnQodwMvo1uWbXWROjumbv+wTGkLh1Bc9mAeNJ62XvVmWlSQAZtFC
	 j4C7rCGG1G+SUOSz42VAxv3RYkBtPqdeK7nMF8H3vcoLyN0lOViTK6aF5E6OH2/nQS
	 RYa3Uva8x00NMfLXCIyJ9xINF9LeC0loeTq9kduVSoCce7clL9I4BIgPW733+ZpktU
	 SzvUJQI+2nBDjkWZdJ87xHxfxPtJeEbmiPbbtIzT3IoNoIORcANvcjROZxJWt/pAce
	 rDhM3TlrUoNFiHXBzVi6XTJoUF6sUYwIqVDk61tSm856OMTWxocAQqT3UdWwneOdp1
	 WP3XPuuXXpT9Q==
Date: Tue, 13 Jan 2026 15:34:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, linux-pm@vger.kernel.org, sboyd@kernel.org,
	conor+dt@kernel.org, kernel@collabora.com, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	ulf.hansson@linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: power: mt7622-power: Add
 MT7622_POWER_DOMAIN_AUDIO
Message-ID: <176834005718.194670.8916534798894456790.robh@kernel.org>
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
 <20260113110012.36984-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113110012.36984-3-angelogioacchino.delregno@collabora.com>
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


On Tue, 13 Jan 2026 12:00:09 +0100, AngeloGioacchino Del Regno wrote:
> Add the missing power domain for the Audio IPs in this SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  include/dt-bindings/power/mt7622-power.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


