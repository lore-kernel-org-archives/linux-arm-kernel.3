Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6191CEFCEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOU0S7R/C48eCf5z1Erg51Ghwrl71NJ7rBkIRjm+AWQ=; b=U1AJMBJYa1u8OOOwWA7rrMqEWA
	34POKXBJEws4UYi/qyVzx+PKwpQGbfL7B6oRhiOqChQN1SLKxmQCs6i05ZqbfLgOht9B/LVpdk3xN
	tKjQnrmIDiIWxcWAWtaIbC2v+fiH/vi3PLyvvIhgMialnC5Zt3QaEqxCPjKYg5Rg9DZrWACgFkHW4
	NLfqewrxlRrfhiP66//FSjQPlp9Ix9SOK9BNOFzoIA6rs32e119xfQrd+cEtmfwTvdi+ZSbTScDO5
	tzbWE1seuZ5FjcAZpWjq0WVZlOcJqlXuCuCBUU02pLHH7yurLEcFG17IFbJxLxv5fRYGocbIwO5WD
	5GZyry3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBoe-0000000DgUh-0Kj8;
	Tue, 06 Jan 2026 18:30:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBod-0000000DgUT-1ogu;
	Tue, 06 Jan 2026 18:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9DAF60147;
	Tue,  6 Jan 2026 18:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78291C116C6;
	Tue,  6 Jan 2026 18:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767724198;
	bh=wNVX7IulzCBkQzn3kkWj0KnrC5s7RfNjvq83HQ/7WuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ef8YQM2LNQq6eiBNXSz7SThHvlUBz987WkGv56drRGEP4fiXfCduAAzcpj9vZvZcU
	 3bgSps3+biPcyABJQNg5exqJCTVu7nRpD+08OWWBrZ8unXslaT62EkjnEeaAzZMTY9
	 MQxoScxhA/goVPXQLN5PLULCszRq/6J9Q5zTM9x3pD98WgRz8KPQuTOQYyHda6Yb+7
	 4p+ftJhsbM4YmXtxJpSXeNwTWnl/A3cmrYwqohaqebrzhtcEbEL7zt8FNrf6tNoyKh
	 orlYfnOFCrgpyjaKU7PA+sb9R3NRYfRpIq43N3MvTdlJl7RjmjpbaL/wm61iz7JpN4
	 RJfsAaXDJeHUg==
Date: Tue, 6 Jan 2026 12:29:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: conor+dt@kernel.org, linux-kernel@vger.kernel.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, rogerq@kernel.org, sjakhade@cadence.com,
	vkoul@kernel.org, srk@ti.com, linux-phy@lists.infradead.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add PHY_TYPE_XAUI definition
Message-ID: <176772419699.2512006.6478554353373580831.robh@kernel.org>
References: <20260104114422.2868321-1-s-vadapalli@ti.com>
 <20260104114422.2868321-2-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104114422.2868321-2-s-vadapalli@ti.com>
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


On Sun, 04 Jan 2026 17:14:17 +0530, Siddharth Vadapalli wrote:
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> XAUI (eXtended Attachment Unit Interface) is a high-speed serial interface
> standard for 10 Gigabit Ethernet (10GbE). It uses four lanes with each
> lane operating at 3.125 Gbps (totaling 10 Gbps), to extend the XGMII
> interface across circuit boards, commonly used in backplanes for
> networking switches and high-performance computing. XAUI is defined as a
> standardized instantiation of XGMII Extender in the IEEE 802.3
> specification.
> 
> Add definition for XAUI PHY type.
> 
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> [s-vadapalli: added detailed description of XAUI in the commit message]
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> v1 of this patch is at:
> https://lore.kernel.org/r/20251224054905.763399-2-s-vadapalli@ti.com/
> Changes since v1:
> - The commit message has been updated to provide a detailed description of
>   XAUI based on feedback from Krzysztof at:
>   https://lore.kernel.org/r/20251227-airborne-energetic-kingfisher-adc4fb@quoll/
> 
> Regards,
> Siddharth.
> 
>  include/dt-bindings/phy/phy.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


