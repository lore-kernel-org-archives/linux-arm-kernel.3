Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9412AC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kKFXtgRFj32CihsWjF7hA1poQHY1cRog5BUD1B8Vwg=; b=HWWy93w8vnq9ikqwYGPgl9lhx7
	UugpNmSGZHNXENW1IetMJfp8zgrGhVEpf+wpIF7t2d2u6SHQ9kjuQkHEeFu7Meu72BWw0b6pQ+E1D
	CVUQ44un+S2HBqyIWzpwE5gfo2rAdjHgGjrCqWSHVRHYEOteWcXrBrNvmO0ceIYMGOQqKevsExXyE
	bCuPk4mqGY2opddxfdoOomId9HCDKdWnpf85ssKQZu1Dm4LM2r3TaQGu83Z+A/h1bG8yOb3c/eClX
	67q2Hz5NuZw/ybsof7Gp2MwejhbfQfEHX/HYxiCXpyDoBL6YF4prpnbz7aS3tGj0E9/DROXkbieuE
	5CXsGzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCAB-000000067Tr-22oo;
	Tue, 08 Jul 2025 17:31:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBm0-000000063QL-0XMr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BED3845ECB;
	Tue,  8 Jul 2025 17:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEF2C4CEF0;
	Tue,  8 Jul 2025 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751994387;
	bh=8ifDg8SArNC+rBce95rWN32spKeHoIWeM80KoB3c3Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVaTHAoUeICmwkF7/uRzMNm5R5uIma512L2DDSmMoEHSRq+r44f1VNx8+S4qy8lgd
	 8syFIHYpv1dtZt1d9EPoFSBHkLyO4i9pLwZcdro5+YkAnoSOAV8W01s6poVy4+GGtU
	 zKW82Qb9oTr64BWdpwT+cTYcwZundZPQp/Q815t2FyvPu4w27jB3gS/dkukpom4epn
	 0h7xTEMcmFoy1ksQOu5J9dApvmmBpywKXFRJnMTsaPyrGjP4Yz/1kSNPLVwcHe6zD4
	 PRDrx9Dc8GgV5vsLW+dTrnqQfqFg3g37uXe9UyApaHNv+rL0Fn5HYwZsngeyEteR9P
	 j2NIZndUpDMjA==
Date: Tue, 8 Jul 2025 12:06:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: iuncuim <iuncuim@gmail.com>
Cc: Lukasz Luba <lukasz.luba@arm.com>, devicetree@vger.kernel.org,
	Zhang Rui <rui.zhang@intel.com>, Maxime Ripard <mripard@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: nvmem: SID: Add binding for A523 SID
 controller
Message-ID: <175199438588.636779.3304055956997373541.robh@kernel.org>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
 <20250703151132.2642378-2-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703151132.2642378-2-iuncuim@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_100628_187368_8986D150 
X-CRM114-Status: UNSURE (   9.96  )
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


On Thu, 03 Jul 2025 23:11:25 +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> The SID controller should be compatible with A64 and others SoC with 0x200
> offset.
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


