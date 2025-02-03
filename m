Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B817C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/z4ASPGvHG29j2smT8CHz/eDEu2t74N2Z1nrRNT7dY=; b=PjJx6HflLf5yZi1kilsLHzYdPG
	nr42eVRKMbLYryyaPHRg2X/FD4gUnu6ot4FlNhdOtpCPbye4lpUehFH4HwkZCxALtaRqlMuIOlGfC
	Vw9fCud4jPmlLCKTZxtn6ovWA2+v1xNuNSlXh28R9/0cUU1Qqz1IteRa/2YvioG8CNoPzcgsNKGGo
	0BzJ5JeJbK+vfOgIv5+7lZKU19Ov8LUX7url1CQJ3WX5cZXVXjAnior6hviwlPVaoyRSJ/Q6k/D2q
	EJ3vB5cNtp25u2PYzX2QEnTVhKX14VIohjo1e0l63kSjtQ3I3V5FU0PjSz6/Nz8r2m2hMgQL+OJoG
	4ImRE7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1Fl-0000000GHAd-14O3;
	Mon, 03 Feb 2025 18:33:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1CB-0000000GG55-1tfi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 795F5A41AB6;
	Mon,  3 Feb 2025 18:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17828C4CEE2;
	Mon,  3 Feb 2025 18:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607358;
	bh=WiQw3lRFLXzzurHN7Z2cZ91YvqKN9pKKM/mbocrKS4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wvf52oeTW2qcDtwkUFck2Fynik4Oba2Emu/YBIn4j96LSSmSxw+YnVsLrl8Hqnczd
	 6MAtKj+Mz5sqKpLNoMEz7hrkW95XGRx45Rx7snNYYrkqchhIvFjL8/AWrzmduxSVKH
	 wYvxfpEgrwID/TI2JhyAo74BMxmGo0BjBnJ+3/M7wYVvOIiif7HKhGhcFjkq06A29v
	 8Ie2llK0Q88K/CTZpeykKK9Rn86pZVa/YdiE9AiXQEcxlVG/KxQEoxKqjD00ppcpmb
	 7e0PLh0xVtJWzHUt5I3wiq/6EVKJQimRXMA3a8hdPYJX/JJHXh8AXZ0Tzo8EHooiqU
	 tzZqwrvc1Y3jg==
Date: Mon, 3 Feb 2025 12:29:16 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Sean Anderson <sean.anderson@seco.com>, linux-kernel@vger.kernel.org,
	michal.simek@xilinx.com, Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	git@xilinx.com, monstr@monstr.eu,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] dt-bindings: xilinx: Remove uartlite from xilinx.txt
Message-ID: <173860735538.3354146.9270602675475288843.robh@kernel.org>
References: <cover.1738600116.git.michal.simek@amd.com>
 <aa0b7f9a851c6b8d11f37050f84e0ec69cfa72a2.1738600116.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa0b7f9a851c6b8d11f37050f84e0ec69cfa72a2.1738600116.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102919_556455_07876C59 
X-CRM114-Status: UNSURE (   9.90  )
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


On Mon, 03 Feb 2025 17:28:38 +0100, Michal Simek wrote:
> current-speed description has been added to uartlite description by commit
> 3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for
> synthesis-time parameters") that's why no reason to have in xilinx.txt too.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> 
> Fixes: 3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for synthesis-time parameters")
> ---
> 
>  Documentation/devicetree/bindings/xilinx.txt | 7 -------
>  1 file changed, 7 deletions(-)
> 

Applied, thanks!


