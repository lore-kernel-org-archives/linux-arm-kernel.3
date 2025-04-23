Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6261EC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzzkEOBXDh+piPM2LHp9ijT67snKUFf4u8dLi/vH66A=; b=hk7LiS7acdSJZ+TGeE95sqYuxV
	aQVfhqzKcIj3JbJ/vo3STiD8vxhcT4Td1oXGQi1dKhZvhb+GFVgE2sqdL/p+wcQi8PQ8EDmaIw6JD
	rpe3Zv9fko8D8R2k0viYNCwiL/P8wn1D33cbGzRkDDPyvcookQhw4/f1B33xI0wa8/+P9TIJfAZGy
	fW/g/lN4TAL5XgTQf186rS90CLKex+LlQeLuwuoO2Xbe8SacZzFMuUIfU9jcub4mr9/+dENF7UiCA
	HESEQKX9e8ZzURRiOb4eZvnkNG/kL0FK0V7nYdYPChE97UQ3LvL12Bmh03vObaWBccG9F0XJfBt8Q
	8vzoHetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e7u-0000000BMPg-2xLY;
	Wed, 23 Apr 2025 17:43:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bxW-0000000AxQn-3plz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:24:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 217485C5E88;
	Wed, 23 Apr 2025 15:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06D5C4CEE2;
	Wed, 23 Apr 2025 15:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421861;
	bh=MGkSDAhmsttNEFpJt61N5qgZgDOhGEDQKGrmLoEGji8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2MfFQT34oLMAfbpJVPfDpvwGmvcGh/TuufkBrvtdvQ+wp63PV7M3qQKVsVOwYoKa
	 X9n3Pn+LUi83ar1QffPqYBT946ICCF2dt1yhqP52ONfcaPmd6xQo75YxT5mtkIJNfy
	 13JXoSeG/V7oytYAxNAlCp8vIAxHjcwYgNLYLWGyHnPDEtLDHgZzXX/ZTzM0JOP/9D
	 QkbO4i/7WAycKSJKdmmO9N2WakwKAhP9PwU9lSWhWdKfg/R9Im/QyUptOLvZB/Hk+a
	 sUkoSfCggUA/CKcHS42UfruWqzkTUBMHujQpKxM5qahvydJ57GzOWodhepSqm2Aa9j
	 f24LBdQ7bHY3A==
Date: Wed, 23 Apr 2025 10:24:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: via,vt8500-intc:
 Convert to YAML
Message-ID: <174542185825.550926.14913949740445861454.robh@kernel.org>
References: <20250418-via_intc_binding-v2-1-b649ce737f71@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-via_intc_binding-v2-1-b649ce737f71@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_082423_005203_F7ED7101 
X-CRM114-Status: GOOD (  12.27  )
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


On Fri, 18 Apr 2025 17:57:25 +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia interrupt
> controller as YAML schema.
> 
> The original textual version did not contain information about the
> usage of 'interrupts' to describe the connection of a chained
> controller to its parent, add it here. A chained controller can
> trigger up to 8 different interrupts (IRQ0~7) on its parent.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Split the series from v1 into separate bindings patches so as not to
> spam all the subsystems with unrelated changes, per Rob's suggestion
> 
> Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com/
> ---
>  .../interrupt-controller/via,vt8500-intc.txt       | 16 -----
>  .../interrupt-controller/via,vt8500-intc.yaml      | 76 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 77 insertions(+), 16 deletions(-)
> 

Applied, thanks!


