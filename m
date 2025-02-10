Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D68C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hi+zM/F3UPS/XVMHyz50Sp+75EK5uXTJeFBcm77MWsI=; b=hGt5GTwivZvro52VvXIK2YqkAp
	Gn9IQxK5R/6Z0a00vUpxRS4ZcxIIk+344caAwew05bTp3Lfy1/9g3M1jqNJ8j2F9CNsBNQFhnz3+9
	fdQo58Sv9/nvNGTDNYMHHKWcBEuc5o7nNSLsjSsnRwdyDilUfsFoilAnWIp02eAxp1TgdK2+dt2Vl
	gHvVBaL+E2qotLdBVNb+j8Ae4VJIziStpo8LpdLD/GcdtjCfPVcRbaLdRPUOQj4d4cTkfghdggzuX
	DmfdbYevt/9m6igM3SF1AmERMDNOa5MzrnJxOV1xT/zYoZ005dNRhlCSFxXuIBhwNuuHzY7R+xBJ5
	B19doSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQjQ-0000000GwRG-193p;
	Mon, 10 Feb 2025 10:09:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQdP-0000000Guvv-0h5J;
	Mon, 10 Feb 2025 10:03:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECCB35C49B0;
	Mon, 10 Feb 2025 10:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CA7C4CEE5;
	Mon, 10 Feb 2025 10:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739181802;
	bh=3qI78dSTgjezorW3Ya+Br1RW/kymvh01hDyW5ZpBCgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cx/wuaXVFgPCx8jZ1bW4nazcSY5RlQYySWTJXTltFkV/5ld9k/js6nMZXzZg4YMrg
	 /ivsmp2fHYGxN/+Etk2N+cLEtyfw43A+6I6xtIRJwNqeV5kCGisyM5UnSJJqiLzdxe
	 RCYms7WiGR+lHK01AiNNOYd73PCXyTvFTKTCRh8hS63HszDc62+LnrgbjogHawTTMj
	 GfbN3hX1w9vozO/hjXbIn1EIWJV+ctbSs6t4MOv0JdRFg6zpRKlWchtxp61pSXKHLj
	 7dAVCVYMExThWFQuP0vzYWSnSUlhHxGUnzgOQ0EyEFFnYR7OTp/Fte117dHT+6wojt
	 evupnaYZH69JA==
Date: Mon, 10 Feb 2025 11:03:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, daniel@fooishbar.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v13 11/13] dt-bindings: display: vop2: Add missing
 rockchip,grf property for rk3566/8
Message-ID: <20250210-vermilion-bittern-of-diversity-cd4ef9@krzk-bin>
References: <20250206064457.11396-1-andyshrk@163.com>
 <20250206064552.11466-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206064552.11466-1-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_020323_256706_A6EFE43E 
X-CRM114-Status: UNSURE (   9.05  )
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

On Thu, Feb 06, 2025 at 02:45:48PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The clock polarity of RGB signal output is controlled by GRF, this
> property is already being used in the current device tree, but
> forgot to describe it as a required property in the binding file.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


