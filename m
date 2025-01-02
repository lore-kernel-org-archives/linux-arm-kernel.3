Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613FFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 07:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOtiG3oC4aFYkEGHbZl9KMZ8JAWNFtc9T7OFFkVY14U=; b=OfwWmHtBoK0xDfGNJJkuUvv7Kg
	nfG9tM8qOyuo2d969D+TY50ZqlkbPIb0KcIJTpk4VytJ7GZKjFVkVH1eGCmIkmgKjrF9fG2vr3Mls
	O5IQf7LAgW86ruGzGj+8WAR/lX+0q4mxmWjopdbzt1Kzl5QYYh79VpwdKNBjt0CXuQyhsnKljR0Kv
	rgOC6KrFOwpPojfjnfH6bGd2X0ZY6rTKuQS+6WbqYyQuYYPap/hU+MylkYXCnSLw/mPd4ojyjcXm0
	JIpFL6GN/56o0+ICVR+Fkwk5nUoHy81hkmtmPHDWXXHATnNCDEAUgK+EJRfcVts6zPjDntMyIVO4f
	od1WFLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTG75-00000009tku-45F5;
	Thu, 02 Jan 2025 07:59:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTG5w-00000009tdr-0yuO;
	Thu, 02 Jan 2025 07:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90075A40100;
	Thu,  2 Jan 2025 07:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588C4C4CED0;
	Thu,  2 Jan 2025 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735804694;
	bh=gnlg1iwRA44t0Q9m776Cc0idy3V/9d7L0QBK8wPFtfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lL4vnxZ/baQURW31Bb0YBJziu0sFojruCSFEM/FqDDifOw8IHAvPPWs+Zs20M87uk
	 /ECz7UP4LZd7TSLaqPLNc8yYG3QfJXFLOQTHSWimMC6rUsyklQRXW5KoWABMtVJl97
	 tspPWDjaqE9peupnQdAPpIdMcScVEqx6R//8AMRPtF/qvk2U+1mf4u4w3vzVrQkYaC
	 /pGclTGyDhwm8iqxMyNmLNxr5iLayZzwBAPtgLBShUyfuZY4XwLrtN+xB8XspUtv7M
	 kEv96pw4/O3h9jo6Dd4GV+RLxRnhJph0y9Cu5XR6FP70l/uGx3ORHcsTzrplky5YI/
	 Rve/tqri1/Xyg==
Date: Thu, 2 Jan 2025 08:58:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, 
	mripard@kernel.org, hjc@rock-chips.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: rockchip: Add support for
 RK3576 HDMI TX Controller
Message-ID: <zz5exgmftibayrh7vjfoq6z32xf2bm3ibejb6rc5xpqslejaab@ex4tj5am4hhk>
References: <20241225103741.364597-1-andyshrk@163.com>
 <20241225103741.364597-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241225103741.364597-3-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_235816_337076_2CA5DFDC 
X-CRM114-Status: UNSURE (   8.51  )
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

On Wed, Dec 25, 2024 at 06:37:30PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> RK3576 HDMI TX Controller is very similar to that of RK3588, but with some
> control bits for IO and interrupts status scattered across different GRF.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


