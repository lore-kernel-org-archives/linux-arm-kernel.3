Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38CFEB28D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 07:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBqrw6KQmFjJQqDQ9j7AIyHa+3x4OD6xXOFjm0uAkJc=; b=d/Mdz3ZexnGyvHiuA74mDmkxqC
	QLxmAPkcWjygv8gcd7iOMGQJZOOv2UHJgL28voHRfpaDZ1Hqw6MR7eq1hOpPC03UDm652vyxs5XYR
	ZOllbUVpbHfTL8wouc9pVoC6sZCXTE6T+1vZmCV229az3e9uV7tPQHkUr4SedPuLVFOxcStJ+e5Wt
	dxUsDTBygSmPU7/YoiscJck8yNF5by+3AYi/YmKolTD8qeNSFB4ZKOBwq9+2Qo7b49IDt1Bt9y1q1
	uDs7CY0fv0VsCZSVi5BFHvi3FGjuwRFC86+nsKXw+FS0JYERB1CMuv9IlA/1i14aen46+PxCn+HJl
	mLzerwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voGcp-0000000B0S7-3DE5;
	Fri, 06 Feb 2026 07:51:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voGco-0000000B0Rw-0kOL;
	Fri, 06 Feb 2026 07:51:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EBA660010;
	Fri,  6 Feb 2026 07:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F98DC116C6;
	Fri,  6 Feb 2026 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770364292;
	bh=xqbUcSUTpk4arpBV33lwK63+MR69RzUxztVajpd6IpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVRCeEVX4NnXHRYQVZb6WuR31nT0YfJbSMQsc1IcIk8zKF8I/rQVkHGNZ7yMt85oH
	 uaW92gF7XGyL5HjlgYujTjtl5o0vA3beeM4Tw1zXc+SFo1F2LITXUy2R33r61TxLha
	 lwxdLdpD6dfpnwu1HrudaJunjOsnm6G81QxyCyAdK3ss54QFXw5TBA/KPspq/LLyom
	 7cykMPEMtKp+YBVZI159knhhpF6QEW0uHe9DL/ByJNx2OnU1gOr3Tu+IRBWjgmHx3A
	 Xl7S/fpVsOXwZl0MWkbOcfxyJ3+HPPjfA1a9//G7+eANpq+7+XBuuZR3ndEo24lHYU
	 /zqtO/fv1OvhA==
Date: Fri, 6 Feb 2026 08:51:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, heiko@sntech.de, alchark@gmail.com, 
	andrzej.hajda@intel.com, conor+dt@kernel.org, cristian.ciocaltea@collabora.com, 
	airlied@gmail.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
	kever.yang@rock-chips.com, krzk+dt@kernel.org, Laurent.pinchart@ideasonboard.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, neil.armstrong@linaro.org, 
	nicolas.frattaroli@collabora.com, robh@kernel.org, rfoss@kernel.org, hjc@rock-chips.com, 
	sebastian.reichel@collabora.com, simona@ffwll.ch, tzimmermann@suse.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: rockchip: Add rk3576
 DisplayPort
Message-ID: <20260206-transparent-primitive-pig-7ea2f8@quoll>
References: <20260206010421.443605-1-andyshrk@163.com>
 <20260206010421.443605-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206010421.443605-2-andyshrk@163.com>
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

On Fri, Feb 06, 2026 at 09:04:11AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The DisplayPort found on RK3576 is very similar to that of RK3588,
> but work in dual pixel mode. And itself does not depend on the I2S
> clock or the SPDIF clock when transmit audio.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> ---
> 
> Changes in v3:
> - Fix compatible order

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


