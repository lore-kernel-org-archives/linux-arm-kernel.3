Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7576CE7315E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 12:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qpk5oiK9fJbcLQekbY2icjVWQS6Dd6h/FoictXFczlg=; b=Q2h9eTn6A5b2NV7ZC97Hxc7icc
	DxDWCKWHnCqDQkssOOLhx8prD7AaZ7INr8HlDmN6deoHRgSRHgAYJ7HlGMVo+6WsGkHlT1oRT3xcW
	u5MkxXutmtnmM40Dy/YgTYva+tcEGRzRMpUGlcDtfq95hUCSxpTUUOb/fC+oylWe3UAt0A7mC7eXo
	Rp+Hh5krSCQJ/bH1dG9nToMKZxnPEANITwYAjW86oSE1X2LiUc5SPa9K9v5NYPvEn8SSrN2N15j5P
	n1WKlu73Y213F2Tj+sN1IEf64UnR1B2+/gDHbhxIS4PZLbhTWu7GYh5TnX5iz+/ypzYKSSH0fh+hu
	lI2dfcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsdA-00000004wMh-0dqg;
	Mon, 02 Feb 2026 12:02:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsd7-00000004wLt-2LGN;
	Mon, 02 Feb 2026 12:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770033726;
	bh=P4Io04UTfWHKaU8dn372SXp/ADnhIotls8qbAU8ww58=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lb/Jd4bPneXXo7vP7EXdIy8TlmmoLMvxODxJQdtAIUr57Tpc1ISnxSTmFGNic0HrZ
	 Qzr0238dUk6clzG2Y2jZEhw75Kt/MrkxiebU/LZFeBQtc7thu6F7yWkLjSRptl+IH1
	 63nKVpZir8/aw8X8aveHklPTb6A4lOA998p0giYszrAIzF5rZY1Qh+oUcZPD9CSjSS
	 vsW7yx9EVTDNMLGBevwcHc0/jk+XWYY/M+tdzxT8sjgvoRxR29zalBeHGOEIT9YKf4
	 c5aT4DS/QU9EdricmqvPFJ+hHSiQdTFgrI09/5OecJWKBZFTjAD0y6SnUOZsL0uiKG
	 K3D/RlTtPVO7g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DC8C17E1149;
	Mon,  2 Feb 2026 13:02:05 +0100 (CET)
Message-ID: <a6d810fd-111d-4121-bec1-3c3f9ca53e68@collabora.com>
Date: Mon, 2 Feb 2026 13:02:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: mediatek: Add power domain driver for
 MT8189 SoC
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
 <20260202064820.347550-4-irving-ch.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260202064820.347550-4-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_040209_759555_81D32145 
X-CRM114-Status: UNSURE (   8.15  )
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

Il 02/02/26 07:48, irving.ch.lin ha scritto:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Introduce a new power domain (pmd) driver for the MediaTek mt8189 SoC.
> This driver ports and refines the power domain framework, dividing
> hardware blocks (CPU, GPU, peripherals, etc.) into independent power
> domains for precise and energy-efficient power management.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


