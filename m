Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60BFC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoPjalzGoqyxvB+0p/J+zb+6VQQqxoM2/7+E4ZPduTs=; b=pxCz7DPexivcNJAhS+GL/LrH6G
	h0vrRmSKLtpVUsf5uTBXHEOa1iEdqQqskr7AwwmhRiks5T08V7XHTpFR9EZWg3Rlt0QGgqtLN7R51
	9dSpGypXv8Ji6nTBKxvGnmAo1wwWPURAZWLmHL8TJLcUnCZy1BX1cBbzXI94g9bRHrqKjZumHnYFF
	BTTkiTQ3rId7pe25a2QV4CJHXZdGCnNlWawJKFoLmJPK0/1kKK23znpKuhMPfpPJ6LdiiUu9NZu7b
	osHfVkhzrIpc6Q/puvcLU4GJBeFYS1llS7ZSCxc1OxMNWvulG/z2R53LhE6rs53lb4/WFBKwWTK7u
	nhW80w6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6uI-0000000CaYp-2p2Y;
	Fri, 28 Feb 2025 20:24:26 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6fg-0000000CVok-3ViV;
	Fri, 28 Feb 2025 20:09:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D9FF61FFA;
	Fri, 28 Feb 2025 20:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA5CC4CED6;
	Fri, 28 Feb 2025 20:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740773359;
	bh=c+sE0vRTYPK5+zxcrp1859xwPNcSp2Ia8bQxKP+1ue4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOEGFbAikIKhBwP7R8Q1cczMdTxG2DxAm34nkOjMcPQOK34QCTo0FEzUP/5x+cyHh
	 yoDrzdjSR/uzA5F1IGSnyCDE9D5m2gFyKVuoHGADz7HC1xgMX2yii1lbqAW955qv8K
	 h/V412TyHwr8NGysE3uVpzKmmyFmGHl9MGTJt+iYal9u449N1KZ1KvJCKQwj+dGrqj
	 YQEi/S4DxwQYkd8Vp/FIOGDLDyuRRDoAZsGCi3ht8rVqkWJBnEoXp8t5uwU45gEmzS
	 n0VV5lfD09hK8dIoy61eN7hkmnFPpuQxylgWnkstonbpb9CGQXgVJQXz3FMx6NExqU
	 heg1FzlU7dwkA==
Date: Fri, 28 Feb 2025 14:09:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: rockchip,otp: Add support for
 rk3562 and rk3568
Message-ID: <174077335739.3514286.9596779963584656318.robh@kernel.org>
References: <20250227110804.2342976-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227110804.2342976-1-kever.yang@rock-chips.com>
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


On Thu, 27 Feb 2025 19:08:02 +0800, Kever Yang wrote:
> Add compatible entry for the otp controller in rk3562 and rk3568, add schema
> for different clock names for new entry.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2:
> - Update the commit message and add maxItems in schema.
> 
>  .../bindings/nvmem/rockchip,otp.yaml          | 53 ++++++++++++++++---
>  1 file changed, 46 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


