Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8E3C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YNKQ8XWDNOGkmttM7lmuBkuDKFI1SZERoqQRgu4+Gw=; b=1x/JE9LoM1nQMsh7ds1i4yuWEO
	o1wrdCdN6dzVKwKfJXaXfoNy6m+DpeH9MB2JaaE4VbsYGmC+JUVSaZSi9p6Dz3I6YiPqD1K57c+mK
	Jc4M4JDp5FKUteDObe7V3pXpGUufVoA7cl/hM+7OOKAIqbwUtgdEkEL6mywI58qRpFnDdvfJDH2J1
	ojTaIFg3dMZVMnxwDVjgM8u/LAGU+AY3QPi7CI4n6pQ6BGTPH+Jm8VBJI6Fzor5yODywR4Khx2biJ
	Mdj/+99VzXVDPP3b34veb69/MLfexGtQijaJhOQG/Qf5ehl9N8WfLLJFQhC3FMtW1I9PDWNz+3OuQ
	Bztvcong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zRH-0000000Ek8s-1J2i;
	Thu, 24 Apr 2025 16:28:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ya5-0000000EVaM-2aC5;
	Thu, 24 Apr 2025 15:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1782D6845C;
	Thu, 24 Apr 2025 15:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DE8C4CEE3;
	Thu, 24 Apr 2025 15:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745508820;
	bh=wU9jfyce70/Gvv2ki/06OL17ud+SeMYiIauhmhd6z1g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MSUPMNRpw+9NAbENzEu/+kpPuwRDFbBT5B3WQ6jEWpnVUdLMhWgHBwMRVnbg6HvLp
	 2QhU+fICktAQ8iVtXMB9jSnerbcSQJrM0LikVBpAS6i/kT81Hm5fx7kXKbGXGQcuPu
	 f3DOiCgZuEbUidiRV3U0vNZYphBr9t4toROxbXNtmF7DgcTRh70Og3B22oP/6FWmcj
	 ljppaKAvTLvJJYLm4vZ9KnwnDEYiwGLfuNU460dcn7SD87T9B2pnqKpGYJJhLn+ckE
	 P5uQwsWXmzJkvCDL7IEvaJsjX2D61B/tGTLMrY9+f0MFiT9Im3csqvbG47k4G+Cykt
	 eR9+sf18dq+/A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, mandyjh.liu@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20250416120225.147826-1-angelogioacchino.delregno@collabora.com>
References: <20250416120225.147826-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add
 support for MT6893
Message-Id: <174550881826.1465250.14293935570790727278.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 16:33:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
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

On Wed, 16 Apr 2025 14:02:25 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the scpsys block found in the MediaTek
> Dimensity 1200 (MT6893) SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for MT6893
      commit: ce37cf8b8520aa292d2eb975b009e15e38347351

--
Lee Jones [李琼斯]


