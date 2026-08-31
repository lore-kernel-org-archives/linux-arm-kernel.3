Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13580C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLiAq5/KXSZI20h/rvdNaMKqZ9O3JX0YW/+nEYN+91k=; b=IUtj8iR+qaqxPIaBfVtkbPFRyW
	kirfvXggTLC/++wN5f90lesxYg4iHweJIyYUoA4zrlIhIASVlpQenCwvc7+vL5XPAQz5G4UG1Q5CT
	Tf5NuN+2UiF0cXLrknfdJNZqd7WBxZFEy8NbYV6ZPXmGWJ82IVOU4uHPG0sZ+gs0w2FwWLg2hy+uv
	xp0M+Oz4VRnd/veMr6TgOJgmlWWTF4E+fCiAAhNeGmsoFNVtQRaYFP0ENKooU2WrO1PxKSfUjQ4lg
	v/I8dPVhp3Aohj+1x5TFo09vEa0ObWwOMYezXmVcph64OvjCHWZR7UEmkxhf84GCyaJ+k25lNhzWd
	J7P/ApLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0y6I-00000008zuI-2PQ5;
	Mon, 31 Aug 2026 09:14:46 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0y6B-00000008zsY-3j2Q;
	Mon, 31 Aug 2026 09:14:45 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260831091434euoutp029e0b5101b7efbc915a7572eadc0d73b4~Q2QaCPr-v3238632386euoutp02Q;
	Mon, 31 Aug 2026 09:14:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260831091434euoutp029e0b5101b7efbc915a7572eadc0d73b4~Q2QaCPr-v3238632386euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788167674;
	bh=iLiAq5/KXSZI20h/rvdNaMKqZ9O3JX0YW/+nEYN+91k=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GZlabUyLsSW1C+25w+YhKO0MhPsPRtcYDMi07WTWCTQB3lpOuCDqFZXCQM14Ptsy7
	 TQSbjifeKM68XGtE0BuiOvNLOGCIxiLi+05e3Qnw0OIEva0KuRDANQ/xLyBi4anlm5
	 OmzbdjUJch0CuyvtbCd1SvGFINoXJllFhKXXVFfY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260831091433eucas1p2176fd27eb0eefa971ac954c8ee5c2bd2~Q2QZPHCRf1671916719eucas1p2r;
	Mon, 31 Aug 2026 09:14:33 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260831091431eusmtip24699d34b786382bf1394417845ac07c5~Q2QXht9KL2368923689eusmtip2b;
	Mon, 31 Aug 2026 09:14:31 +0000 (GMT)
Message-ID: <f93b13d4-d6f1-4e75-9fce-926fb0129dca@samsung.com>
Date: Mon, 31 Aug 2026 11:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] MAINTAINERS: Add StarFive JH7110 display
 subsystem entry
To: Icenowy Zheng <uwu@icenowy.me>, Vinod Koul <vkoul@kernel.org>, Neil
	Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko Stuebner
	<heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maudspierings@gocontroll.com>, Graham Markall <hello@big-grey.co.uk>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <d64ff3f2a03473e4263e2f68823c2cb0f7fd1599.camel@icenowy.me>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260831091433eucas1p2176fd27eb0eefa971ac954c8ee5c2bd2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260828134841eucas1p100590973cc6808103c41d0b0fc82573a
X-EPHeader: CA
X-CMS-RootMailID: 20260828134841eucas1p100590973cc6808103c41d0b0fc82573a
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
	<CGME20260828134841eucas1p100590973cc6808103c41d0b0fc82573a@eucas1p1.samsung.com>
	<20260828-jh7110-clean-send-v2-15-331680c8b9d1@samsung.com>
	<d64ff3f2a03473e4263e2f68823c2cb0f7fd1599.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_021440_513265_D6B6E4F7 
X-CRM114-Status: GOOD (  11.59  )
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



On 8/28/26 16:01, Icenowy Zheng wrote:
> 在 2026-08-28五的 15:47 +0200，Michal Wilczynski写道：
>> The JH7110 display subsystem spans a PHY driver, a DRM bridge driver,
>> a parent device and their bindings, and has no existing maintainer
>> entry.
>>
>> Add an entry covering them so patches reach someone who can review
>> them.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  MAINTAINERS | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index
>> 8014b9f8253edf15231df215d1b14063a54a55ec..84ac5cfe61cdf775167cf903386
>> 2724c37946a5f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25778,6 +25778,16 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/net/starfive,jh7110-
>> dwmac.yaml
>>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>>  
>> +STARFIVE JH7110 DISPLAY SUBSYSTEM
>> +M:	Michal Wilczynski <m.wilczynski@samsung.com>
> 
> Feel free to add
> 
> ```
> R: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ```
> 
> if you want. I am interested in this.

Sure, all help is greatly appreciated !

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

> 
> Thanks,
> Icenowy
> 
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/display/bridge/starfive,jh
>> 7110-inno-hdmi-controller.yaml
>> +F:	Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-
>> subsystem.yaml
>> +F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-
>> hdmi-phy.yaml
>> +F:	drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
>> +F:	drivers/phy/starfive/phy-jh7110-inno-hdmi.c
>> +F:	drivers/soc/starfive/jh7110-hdmi-subsystem.c
>> +
>>  STARFIVE JH7110 DPHY RX DRIVER
>>  M:	Jack Zhu <jack.zhu@starfivetech.com>
>>  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> 


