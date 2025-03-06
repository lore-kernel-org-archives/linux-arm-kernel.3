Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFAEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzemlD2sQIKXs7Hcq2hmMQ0sKdQ15H5dqRwY3cvDAPY=; b=anaGqslza9AIMD4p/DmLZV9OcS
	mlQ7YPN6YudN0/HBZqAHhiB31ki2P44TsMEKQ+CTVamlLBFLRReQbILenhdQoixLTTALSk0KaqWX7
	bPm7ZMpqqxYzKvzoYDRmXa19prIfX9mtZ7wdHfkX/ybvQ6goLpZ7npJjiGyU25T2GH1sKftsFPMZE
	Y9xKrFAS3yT/75uBrHNTNODODbCxSkTaMtHyexpaP5O3JOjwyzhdilEA4+iYwgglZ7CFzqgYAK9DW
	xU+je5Z4qIPAlzwWKIprEwuhx1sTNetRqgdMvSPVEQ5n1VphcRV180QhPbSQ5bRHIX9Dx8BFeL5+W
	gzrxoh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHk0-0000000C7Ez-1UwI;
	Thu, 06 Mar 2025 20:22:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHiK-0000000C73H-3P5q;
	Thu, 06 Mar 2025 20:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741292463;
	bh=GxiDbWNKqgCU+Ke2LkaMoGFA8CQamRLz9lTuH/1CJBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=huKYhB1cXv9cYSWddmu4w08vq6rgbNjAoZOibXwlNZGjgw1NRnpTyWqL235l0T/ct
	 V+JIhNGe8HQs2Pzmk4ARs7Q/e93u6+eKqzbzjfBBB1WU/mne+BugeLhTbJ2TKW2DyP
	 IPVdTzUQI2BwT0lSR9Sc0uc06qY4apBllqOnxrG4Q+n1tQpCEw3b5V+ZEYufI/QQF9
	 Tlu+7BmdXH+N9LSp/fN6c0G+wwLssJAY7sq2+xuJy87/P8C4LPTEhkdqSeDNn8vuo8
	 xKTUZlrOz0LVJSVW8+ulTCi8mPPUqMG4xHBAAGfBXAKfD5BHvJzuZQo500vrz5rwRY
	 qqsos1Rw6j84Q==
Received: from [192.168.1.90] (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4E1817E05C1;
	Thu,  6 Mar 2025 21:21:02 +0100 (CET)
Message-ID: <751f18a4-900b-4644-9ae7-d28fa44888da@collabora.com>
Date: Thu, 6 Mar 2025 22:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: phy-rockchip-samsung-hdptx: Add support for RK3576
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250306-rk3576-hdptx-phy-v1-1-288cc4b0611a@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250306-rk3576-hdptx-phy-v1-1-288cc4b0611a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_122105_010412_918280C2 
X-CRM114-Status: GOOD (  13.93  )
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

Hi,

On 3/6/25 9:29 PM, Nicolas Frattaroli wrote:
> Despite the compatible already being listed in the bindings, the PHY
> driver never gained explicit support for it. This is especially a
> problem because the explicitly listed PHY addresses need to be specified
> for each SoC.
> 
> To solve this, add the compatible, and a PHY config, with the address
> gleaned from rk3576.dtsi.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> I thought this must've been already submitted somewhere, but it wasn't
> in linux-next and searching for the modified file on lore also didn't
> yield any results. I guess this slipped through the cracks, and
> torpedoes HDMI support for RK3576 entirely until merged, so it'd be
> great if this could be merged in time for 6.15.
> 
> Let me know if I'm just very confused and this is already handled in
> some other series that's about to be applied.

I'm not aware of this being submitted as part of another series, that's
probably because commit f08d1c085638 ("phy: phy-rockchip-samsung-hdptx:
Don't use dt aliases to determine phy-id"), which actually changed the
approach of mapping the PHY IDs, has been applied fairly recently.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Cheers,
Cristian

