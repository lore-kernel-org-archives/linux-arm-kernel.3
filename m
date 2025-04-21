Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFA1C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 18:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaUn+eY7gr75fEUWJMoWO3AZsPk0zuK7MHb7XJsJjB4=; b=4VuQlnG2jtE9sEefI6a3SC9yXS
	1gyEsw27d2wLe+Tv4qzTmUC7JiwECGvwzDWppnZutjGHZlb2vndO0FBF13VfV/+HlLkaHgl2ZUEQ1
	NC61Dw+oDNdgcWrv7TzxWdHd+4/iZE5HwIK1qpKkLzt+t9b0ZdHvTG5lMYAXV2ZBC2Yu1dvym3rjz
	mSKEmK+1yRwbXk/AD5DtSwPrmowOG9Enfhde+Pwoo7SfjlEAlESCXv7lleW+D5QLU3wry+Bm5p0w5
	Ri2pkjwDDaQKAdy5NhZ2dN7vsM3XbywaKWvycONipalTIfzTDun/A1B0dssHItHfKeVc6A0DGyimT
	OL4aFZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vub-00000004uxp-0R8X;
	Mon, 21 Apr 2025 18:30:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vsi-00000004ugZ-27DK;
	Mon, 21 Apr 2025 18:28:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D90343928;
	Mon, 21 Apr 2025 18:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9603AC4CEE4;
	Mon, 21 Apr 2025 18:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745260115;
	bh=Vmtqno/d3qgsFMGiFqBLYpJ2lKOac8MEr3Jk3QpAofc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jtVCiZzMuw4JfoJXQ6RiriRGaQjVarGrsrAXBB3MHs6VkXXmFQfQZlSI1O6dWJFSq
	 WFMjIyduyxG1WpWNzmUHJldjDbCuXUw7MJq1+Kio/r/AwCmBZWBbhA/O7WGaq74EUG
	 sfoEwqmkim5SgAOltHtnAHjYHf6ZjpxCHb70Pj+m+gF9xcP3P3A5/Mbu8MpzDTiMer
	 SMY4vrqxfv290r0cd9VpDWnTPI+pv82F1662ZGpexCyUNAHIOBy89oplvAMST9tbo9
	 xG84mqcEPQ8ZkzKKGpKySiUMGUOdTGZQvb28d6GjhOM3I95S10wEpwncNnbuql5+fO
	 +IRn1TbZchAIg==
Date: Mon, 21 Apr 2025 13:28:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Conor Dooley <conor+dt@kernel.org>, heiko@sntech.de,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Zhang Rui <rui.zhang@intel.com>, linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: rockchip-thermal: Support the RK3562
 SoC compatible
Message-ID: <174526011307.2579990.5987087257843200731.robh@kernel.org>
References: <20250415033940.47914-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415033940.47914-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_112836_560420_C8AF12A6 
X-CRM114-Status: UNSURE (   9.11  )
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


On Tue, 15 Apr 2025 11:39:39 +0800, Kever Yang wrote:
> Add a new compatible for tsadc on RK3562 SoCs.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


