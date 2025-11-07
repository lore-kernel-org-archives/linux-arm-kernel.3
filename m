Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAFECCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 07:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BIZW6zsgf2IfgERnfAUZlz9upn3prG9+yv+TqVhQps=; b=vji6FVEZftKnMJlTGghdcxQBs5
	4ToPCy3Y3ZRzyGbwayc+lC12fQLB9wWMVRUoyX/HNFzX4Mg9kz0/AvSAVB6zsC0T9tgIKCmNw8/7r
	xPpKnIinS41r9d2aaTgjnlsTSHCTW+tTLpjPWufu7IYfU7EP2V+ecYOERPA8Eqnvx9ElhrA1OP5xq
	aPBdLE77i/wHwf3BSv/l4ZPF45XMMQpfPQRJu6BM6gBpJLy6C6geMau1w62LiYNbS8MDKK2xavCNO
	n1ClwdYJZfoe/Es9PW4toJS8r61Ieyu14HU9abl2vRGU85Djynb8QXqQptl8sDbhxoY4+XYgURc1V
	ytKiXt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHGsQ-0000000GnQ6-1H8e;
	Fri, 07 Nov 2025 07:27:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHGsO-0000000GnPv-2KsM;
	Fri, 07 Nov 2025 07:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82FBE60143;
	Fri,  7 Nov 2025 07:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DF0C4CEF8;
	Fri,  7 Nov 2025 07:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762500435;
	bh=gXGpZa9uWm0bQqtVqxWjBvVDTcrH0MAmYNONlowLZEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B77wSxCEFnZz8RglgJn1dvttGvTASh129gGwtPt4uS/iSM2d2FidrLULS8egkjuGm
	 UElZi/4gAqXDWBnKavjQD/+j5u03LXouNyybz+vW5CNfb7VS1S9rXdA1ho2Rt4eWC2
	 Q6Ymv30aWHLJTf/IiXKX5uceIVQL8NobFNkry9RLjkYpnG6pL/ml+SyuGQZGan4YbE
	 S2y8sXhJxHVP6MlAx6qISoJ92BDqopd6Rn0g4A0qmhHEvxMIAa5nsn1maTvRVc4XUD
	 WWpYcbSdX7CTTfQLMiSS9rPfBX86GrB5TpNAzYabLl/2YESjst83rs1NT7N3yFkQ2B
	 MRcVVSuwgylsA==
Date: Fri, 7 Nov 2025 08:27:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Richard Cochran <richardcochran@gmail.com>, Qiqi Wang <qiqi.wang@mediatek.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v3 01/21] dt-bindings: clock: mediatek: Add MT8189 clock
 definitions
Message-ID: <20251107-hidden-idealistic-bullfrog-8f0c91@kuoka>
References: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
 <20251106124330.1145600-2-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106124330.1145600-2-irving-ch.lin@mediatek.com>
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

On Thu, Nov 06, 2025 at 08:41:46PM +0800, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add device tree bindings for the clock of MediaTek MT8189 SoC.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---
>  .../bindings/clock/mediatek,mt8189-clock.yaml |  90 +++
>  .../clock/mediatek,mt8189-sys-clock.yaml      |  58 ++
>  .../dt-bindings/clock/mediatek,mt8189-clk.h   | 580 ++++++++++++++++++

This one was not tested, though, so dropping from patchwork...

Best regards,
Krzysztof


