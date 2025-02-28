Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1569DC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fldfvu5+Zn2RhUYEzgqi8j4Vy5NXO4+RAM/nyE19SUk=; b=Uw3hNIxGbX3zTbqwXwIcuhLAzT
	To3HDzcIr/ZxzAjjjjHIm5eBCGUOywNacrFjHiZeEuYPSBO/8ncGB/vDr7bIALOerc9dJQJzmXrw8
	3eSxwASnV4NqtHg7qV3FT3/6PshP2KWY5bVglBrwYlbbecONHgrQrpM8B1XLvFTy/AMuXPJ3q3TYf
	VCc9m9Uh1v7xOIp2KBFiPe2Lh4bJJGv84KbNUmdgRU9Ic6Rx3xACcdQgE8scSkB+NmOBYat+9RTXh
	VLBs7eeFxJvRi8kmGbn9yH/5f+uV0TWlxfJ6d1uFHTFfmIo21poTY4DOiScAvEpD/zcgvBShxlSJU
	ZwWpEeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7Dy-0000000Ce1X-2O4J;
	Fri, 28 Feb 2025 20:44:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mo-0000000CYU7-00A6;
	Fri, 28 Feb 2025 20:16:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C18AE61FF4;
	Fri, 28 Feb 2025 20:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0823C4CEE2;
	Fri, 28 Feb 2025 20:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740773801;
	bh=082XE8EtV16kXCGx5pMhPt6eqzhKH8L0hxga2Z++y8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYGOir2hYbW0RMZuK4Q+icdavzLYVBTAX9Kgxo/XQWeXUGuud2lOqMt8xs1iyiEqf
	 A2kfWLLc24JCkcIqf+Y7z0irChDWjGsGz3FLTtAIHqzZt73W1QZocn/PPLCbMrYw9E
	 Q9qMIt054bxKGubE+PuNvJYr/mptQvvM9JVdJz04r2oc7sB3jA+NsIWB31CJ4DAWXW
	 1vp6hkzzCkuUPiKgCBOrxubIsow8/EEiJtktnnFQpaC0HIWh69p+8NcSoTCG5uxoba
	 2nRPiFaFVMw3CCrK4puo7MEFMztlEkvRl3TQt4pm08WTSOVxXDB3qZ2/Y6fgITNKON
	 HG5l5uh3hgNdA==
Date: Fri, 28 Feb 2025 14:16:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	heiko@sntech.de, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 04/15] dt-bindings: i2c: i2c-rk3x: Add rk3562 support
Message-ID: <174077379803.3586340.1454205623159814222.robh@kernel.org>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
 <20250227111913.2344207-5-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227111913.2344207-5-kever.yang@rock-chips.com>
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


On Thu, 27 Feb 2025 19:19:02 +0800, Kever Yang wrote:
> rk3562 i2c compatible to the existing rk3399 binding.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> 
> Changes in v3:
> - Collect review tag
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


