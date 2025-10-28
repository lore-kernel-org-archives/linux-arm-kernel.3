Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8A0CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 12:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oyd3e2Rs0rWK/DPq9uJlz2vHWL8UpjcVsB/l0OMjeuU=; b=o5eFwb4CJor/xP+JgZv8z1gRGU
	7XRKar4oWE/QSu3vE6jaE0lyImAJ/PB/elhuHwNljQdwcOOXORwaG64GzMeZTTNCYjRctoqk9zLpU
	Wg/rIzfZvGEpvwIxiuU8RhbFL0XuFnmEEZ6+cbbLIXpF7fWzsNYBYTaPSL7O0HJbcy33JOw+zHKOo
	XMDE6SsOag5DCf4Aqu3bwGUkmofjchqZKpTu4X5YPomMYTM+xWEPb5jEFdXKeRG1sBjau3W0UTRbP
	dBePmgRVkgtvEo0ocRx6S+McRyZ03/ZvvtCWpfCLO6pK0y4Jw7yhzZPrhct1dwiNS/TqyMXEOp4tX
	5BZ3hPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDj2O-0000000FxHG-2I1u;
	Tue, 28 Oct 2025 12:42:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDj2M-0000000FxGV-23JD;
	Tue, 28 Oct 2025 12:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761655370;
	bh=u0Rc6uddmvyN6A9OgBxIwz2e4v43ymsLxM3TDcEIbKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=StBeXySmJjGSd1xFRKwCwHY5JXlO8LMuQ6NNDIDliO3nbsaTrwe2GjQ4nC3M5HEi6
	 jF2qtHilep9UT1TEXah25dWzbBVN4RNLz6baHmPXj/PulKUSmgZLkg7TL8d9UXo15P
	 MEd9IThinC+GxvZR9t7QmQ4PrI47cVgmV/7GjQtR8tkgTWacQR3neGIxFzH5Vp6fEu
	 92lf964rtDYc9RFWH+P2lzGUmMfdNUsB3ECMMwqlBe+s2lpG6mt1ikFkBSW7ifizAl
	 bcJk8WFoCc34avz+tVuY9xhY0SsU0jGAftWx4JPZXGp0TP7CnrdutiZ2JCE3XLSdy8
	 SDuHL1eaO3uvw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C49D917E12BA;
	Tue, 28 Oct 2025 13:42:49 +0100 (CET)
Message-ID: <410fa913-e86b-4ffd-9d79-ce804f0271ff@collabora.com>
Date: Tue, 28 Oct 2025 14:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576
 SoCs
To: Mark Brown <broonie@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Aishwarya.TCV@arm.com
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <6f3f126d-72c1-48cb-a9c8-8d354af2a3d5@sirena.org.uk>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <6f3f126d-72c1-48cb-a9c8-8d354af2a3d5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_054254_677579_01F3E5C2 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Mark,

On 10/28/25 2:38 PM, Mark Brown wrote:
> On Wed, Sep 03, 2025 at 09:50:58PM +0300, Cristian Ciocaltea wrote:
>> The first patch in the series implements the CEC capability of the
>> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
>> This is based on the downstream code, but rewritten on top of the CEC
>> helpers added recently to the DRM HDMI connector framework.
> 
> For the past couple of weeks we've been seeing various instability with
> the graphics drivers on the Rock 5B in -next, the most common system is
> that we get faults in code that looks suspiciously relevant to this
> series:
> 
> <6>[   17.353368] rockchip-drm display-subsystem: bound fdd90000.vop (ops vop2_component_ops [rockchipdrm])
> <6>[   17.355237] dwhdmiqp-rockchip fde80000.hdmi: registered DesignWare HDMI QP I2C bus driver
> / # <1>[   17.357803] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000098
> 
> ...
> 
> <4>[   17.372390] Hardware name: Radxa ROCK 5B (DT)
> 
> ...
> 
> <4>[   17.382082] Call trace:
> <4>[   17.382317]  drm_bridge_connector_hdmi_cec_init+0x8/0x38 [drm_display_helper] (P)
> <4>[   17.383003]  drm_bridge_connector_init+0x658/0x678 [drm_display_helper]
> <4>[   17.383612]  dw_hdmi_qp_rockchip_bind+0x35c/0x4d8 [rockchipdrm]
> <4>[   17.384159]  component_bind_all+0x118/0x248
> <4>[   17.384550]  rockchip_drm_bind+0xb4/0x20c [rockchipdrm]
> <4>[   17.385034]  try_to_bring_up_aggregate_device+0x164/0x1d0
> <4>[   17.385528]  component_master_add_with_match+0xc4/0x104
> <4>[   17.386008]  rockchip_drm_platform_probe+0x1f8/0x31c [rockchipdrm]
> 
> (from today's -next, 
> 
> Unfortunately we haven't managed to point at a specific commit, it looks
> like this might be triggered by multiple serieses interacting with each
> other.  I'm not sure what other information might be useful here?

Thanks for reporting, I will investigate.

Regards,
Cristian

