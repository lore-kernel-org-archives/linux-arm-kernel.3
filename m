Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F43C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLPpA/gcRmpXDXV2yY8m0R7nGrqtXPany5t0qp4lJv8=; b=YWRL5e4GabRGEyExv6naJir4SP
	0Vm9uy8gWHG2/fZKyX+3CmLEoHUWemQeGFHmCWTYM3VkL2Fz7g8jWf2VjhYREnP50N1ZJ3guATSjU
	LpKTAYhefCyLsdAzbFADSm3+qYGvNHp0kawJBeSOS+b1rkhjOF++GfQVuEr45QzxeHyTgKZTwXe4D
	YWAFaNrJEJHUJaK34TLyZFNyv9VS7zUKvOSUc4WrxvhVkKz8F5RRB80+0kb4B4sHlyhzYcr6DZhiw
	hZg70Gd6JdQpxkFM78VEK3NazgbCMOrq8HhA4KcDwkyd6zbndK/2EqMMJcG45ZRVtQkO1G+lHB/2s
	zlQnAVUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ECA-00000007wkY-2cag;
	Thu, 03 Apr 2025 06:36:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EAF-00000007wBy-1z63;
	Thu, 03 Apr 2025 06:35:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0EB75C64E5;
	Thu,  3 Apr 2025 06:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776B1C4CEE3;
	Thu,  3 Apr 2025 06:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743662096;
	bh=qRM3eG6gqLVGutDjiR2oQQ4su3EUaT75uA7KTA4luMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ic7VPpVbqDl+foe4m6vFPehXrEaNTdi6Fn3uQKFgASy7+TZXiOAWo9cHZLLtV2uQ4
	 U6A0a4ir7DbesULikeqlrXDugQQXaPnY9xf+mtJfIIlKZsI9HY1+lKnj9jTnKNup3h
	 VISQvK+3JPQzvfUtXTZsZSKlHwOndyyQSxNpUU12qFn891JZOisLp5HkLUalRF4JP7
	 L/9EeEkAB9SApAhYYQpaHOlHCTZfpHs1LUgUqfJXAXcSjQGn0mts8WiQoEmnJwoQ7x
	 NJA9ZmIbnTiFWBfGN2ujLCTXwg4pufVuK1BAWXNz8sD8vSkSf6v2BE7ZKJa6gxkeK1
	 /oN04mr+AN4CQ==
Date: Thu, 3 Apr 2025 08:34:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, hjc@rock-chips.com, mripard@kernel.org, 
	neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: display: rockchip,inno-hdmi:
 Document GRF for RK3036 HDMI
Message-ID: <20250403-first-dandelion-orca-ed9bbe@krzk-bin>
References: <20250402123150.238234-1-andyshrk@163.com>
 <20250402123150.238234-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402123150.238234-3-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_233459_579548_D0371492 
X-CRM114-Status: GOOD (  10.40  )
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

On Wed, Apr 02, 2025 at 08:31:36PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> HDMI on RK3036 use GRF control the HSYNC/VSYNC polarity, but this part
> is missing when it first landing upstream.
> 
> Document that it is mandatory for RK3036 HDMI.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - First included in v2

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


