Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98103CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 02:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nruCB6ibq9+1PRX77kFEv5gkcVE1RGi6EA4xSfKhv1w=; b=sTT94qv3MnOcgAY4m/mu7dDAAy
	ZEJAU9jg+wO/sjLn5BrB5rjq0G3MvdGAZ3y8sIDoKgWWyWqfMdodkvi8zP2JBLkVR1Da+BqUEcYk1
	9Uy6Yoiuk5IaJQ+WZWR9VIdB/23mBuyB0OV2EhCE0ep1At/ILQEPo4p5rntvq1MWCXmLFVgt0D328
	wYCBYXbap6VU4DDO8Z1rTR/zu8azU13mxEX1yxkcXexiJVCtw8KrZZC+IJrm9WrZKEhmyz0+aWRqp
	6y9eHsiHBs1ZrAPlE2DUVJnMEs/4MYUvVlMvexbIh/c3BUIWdBy7zkOc1hESiuLGgFVF6v+gtZsV2
	TwgFpNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRbM-00000000TnC-1KB4;
	Wed, 06 May 2026 02:03:04 +0000
Received: from mail-m15597.qiye.163.com ([101.71.155.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRbI-00000000TlN-3Rrt;
	Wed, 06 May 2026 02:03:03 +0000
Received: from [172.16.12.77] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d3be398c;
	Wed, 6 May 2026 10:02:44 +0800 (GMT+08:00)
Message-ID: <f91f1ebe-c41e-42ae-a860-5e4c99c34784@rock-chips.com>
Date: Wed, 6 May 2026 10:02:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] MAINTAINERS: Track dw-hdmi-qp under Rockchip DRM
 drivers
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20260506-maintainers-rk-drm-upd-v1-1-f67537b4bb29@collabora.com>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20260506-maintainers-rk-drm-upd-v1-1-f67537b4bb29@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9dfb05f30309d6kunmab154c12257ce3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGh1PGlZCGE1IT0NKHx
	gdT0xWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hox6Sfk13RUdtTP3RnPnUTOekDVp54uGomPSD1YHgkTMK5CVz0VJC/BBVQoZGV3Vdynk+HuhiAAqhmY+s0+kCY1dBY4ffmhguQqqw84+EPEylKc9GsfraPyVHI/OggExK4sm1F8bYjqG2zgM+YfrAun2tnj4GNo0BVtf/qwAAoY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=nruCB6ibq9+1PRX77kFEv5gkcVE1RGi6EA4xSfKhv1w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_190301_561293_F7C71060 
X-CRM114-Status: GOOD (  12.99  )
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

Hello,

On 5/6/26 06:31, Cristian Ciocaltea wrote:
> The DW HDMI QP TX library was developed for and is currently only used
> by Rockchip platforms.  Add it to the Rockchip DRM drivers section to
> ensure all relevant parties are kept in the loop on any changes.
> 
> As its file paths fall outside the generic wildcard patterns defined in
> the ARM/Rockchip SoC support section, also add the
> linux-rockchip@lists.infradead.org mailing list to avoid any
> notification gaps.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   MAINTAINERS | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0dfad67f66c0..cb3c8e5fcb21 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8754,11 +8754,14 @@ M:	Sandy Huang <hjc@rock-chips.com>
>   M:	Heiko Stübner <heiko@sntech.de>
>   M:	Andy Yan <andy.yan@rock-chips.com>
>   L:	dri-devel@lists.freedesktop.org
> +L:	linux-rockchip@lists.infradead.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/devicetree/bindings/display/rockchip/
> +F:	drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.*
>   F:	drivers/gpu/drm/ci/xfails/rockchip*
>   F:	drivers/gpu/drm/rockchip/
> +F:	include/drm/bridge/dw_hdmi_qp.h



Acked-by: Andy Yan <andy.yan@rock-chips.com>

>   
>   DRM DRIVERS FOR STI
>   M:	Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
> change-id: 20260506-maintainers-rk-drm-upd-c463f6b04769
> 
> 


