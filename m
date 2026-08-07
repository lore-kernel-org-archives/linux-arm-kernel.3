Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E626AC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pztF5ZmE57ytikk6f3PQbP5jBmY/LIYwAmQLXlLbfIs=; b=GwGeGgLLXHErf85RnFUeJ8O42W
	jtPGzGWthQnugZeKpx0SHiPl/1k2F0WczEBPDUT3fwCjDS4Vm5LuZ16KLnYOa20R5BCXm7Kb8+at1
	RVb9I61TXlknUNeQi2YCgUpuhhqriEWNZcgIuuaLanl2I9eWRTo3ruGkT/j97BxCHriwUd4hDOarW
	tVp0xp03Z1IhvRtC3URWc0Q03SVHvvMkAN/zjUo+pS4eZz+5fNjzNIP2mjoj/oVx47XrnpyYx7/9T
	h1jAq7NSkwlCbUSM4r5E1G4npsF1fTkipTyfPQ/YvhtTuYK5+6KuonSpLxKKfgJEfovRoVuK9HygQ
	WBSYkpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHeB-00000007eZ3-3QvA;
	Fri, 07 Aug 2026 10:17:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHeA-00000007eYT-0XOR;
	Fri, 07 Aug 2026 10:17:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5384260A86;
	Fri,  7 Aug 2026 10:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3851F00A3A;
	Fri,  7 Aug 2026 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786097869;
	bh=pztF5ZmE57ytikk6f3PQbP5jBmY/LIYwAmQLXlLbfIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LSB/0X+9XEap2xAfvK4LNYyoEdhiXgPP9zSo9nREqqKzTmHXVX+ZeKhJa0vwnUSB5
	 i11+t2xKrW6i1Fwrl9Gakc4ZcjXtTDn3z8L+qMttvF2zKMpOcJGmDdDjkkr1SKvTuu
	 w/IXBDEuDxONJBMCcgU4kPV69sHLFcdVFwJnxlLTdeEJIiRFmUdfl7dXf+ac8Y7f4N
	 JalGQM2Zr13VhrPy5RXKBfC1btgUdTSK0ck3r1EAbq+52R5ECu0sHlDaGEqii/lp8n
	 R3SuYydG702WEsyHFco/uhIvPBCOtF8F4vumvy8yp9jrSHmLXoWcMAfni7jWsGqM8u
	 JEBc0+WaPprQA==
Date: Fri, 7 Aug 2026 12:17:40 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Document MT8196 MediaTek
 PCI-Express Gen4 S-PHY
Message-ID: <4copgyszdf2tjc7mes3lzw3tnvtn4nn3ossdjbgckaucnfrn52@di74kohvokfz>
References: <20260720152654.92216-1-angelogioacchino.delregno@collabora.com>
 <20260720152654.92216-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720152654.92216-2-angelogioacchino.delregno@collabora.com>
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

On Mon, Jul 20, 2026 at 05:26:53PM +0200, AngeloGioacchino Del Regno wrote:
> This adds bindings for the PCI-Express Gen4 S-PHY found in newer
> MediaTek SoCs, such as MT8196 and its variants.
> 
> In the current "revision 3", depending on the specific port, this
> S-PHY supports up to two lanes of PCI-Express Gen 4 and both EP
> and RC modes.
> It is not clear whether revisions/versions earlier than 3 have
> ever been shipped in any other MediaTek SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

