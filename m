Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A073C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJs1+ehY2s+0e3frgO9K7e9frCW+boURmZwCvbrXBFY=; b=xm7akSB8oU7Tg/ICqT4L+DhQ2E
	bgG7TM74/jFu/IMXCctOd0wETkTtH0TZJRipawhUlglXQoG1+APpuntMpirCl+Xda352yhqeqyyU1
	oynsAvKp+Xo+HlCx46rZDBTzespN3wVlgcLThCFSgJspy3jiYQGz8sfoZm9XcPDdlYW8TEarT1+T9
	6V8fvnRcFCeQyy0TED98T2E4JbB1rI9mPRA8TWVkcba5yvnsIwmlwEbtPoEDB2EbsUj/3Xslj/0Vf
	cyJ7T1PTgDMBVrmXGNdWhsGmoW4hVH1cI/LICFFEBi8s0JvCJc2Z0ju+aota84tGXtURcUyxqMv7U
	2pVntDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4H5s-0000000BdpB-0ack;
	Wed, 09 Sep 2026 12:08:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4H5o-0000000Bdm6-04pE;
	Wed, 09 Sep 2026 12:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788955673;
	bh=PwIlSwSM7h+MN41R9Si1MKcCm0Qfa5bRXV3O0jodI3c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mzHr1nKLDjRnxLOfoVcdGso5TFOWy5n9imJFT2xbri5GZIG5TsbjufX2Pix08dHOQ
	 u7u3Tw9ZrtmH0vum+Rae/G/nUdgc4h9xh1hUrQRvuGASoSe6kTR4zBnZxwxpKkNaUB
	 AVxW7JYsm+1m/kPlUb+wPaSCi1oMgPfzLLd9hLNku2BFDblhe6oLGOjCqGs9KbZHiV
	 D+rp/Ir0TeFyGKYWIKK1Mf0XqtUpHBONBuWhkCfNcOt2oAUTSo26hy/jCutKU4DEFM
	 J/IkEOPOEg/4+h8rV+6N2V95potscJK8BApi6ZpQZpKfsaUzqwY/xpa18psSM4r4h1
	 k2S9ABsrEZjvw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 951EF17E0D81;
	Wed, 09 Sep 2026 14:07:52 +0200 (CEST)
Message-ID: <4daba0e8-c661-440a-930e-fe11c5870fb8@collabora.com>
Date: Wed, 9 Sep 2026 14:07:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] PHY: MediaTek DP PHY refactor and MT8196 eDP
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_050756_244988_97426D9F 
X-CRM114-Status: GOOD (  26.07  )
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

On 7/7/26 17:42, AngeloGioacchino Del Regno wrote:
> Changes in v3:
>   - Added missing bitfield.h, pm_runtime.h includes (Sashiko)
>   - Set calibration data before registering PHY (Sashiko)
>   - Enable PM Runtime before creating PHY device (Sashiko)
>   - Continue poweroff if some write fails, but still return failure
>     as that would be a partial poweroff anyway (Sashiko)
>   - Added zero driving params to fix default calibration data setting (Sashiko)
>   - Added NULL check on device_Get_match_data (Sashiko)
> 

PHY maintainers, gentle ping.

Cheers,
Angelo


> Changes in v2:
>   - Fixed register offsets for ANA phy in MT8196
>   - Set/clear FORCE_VOLT_SWING_EN bit when configuring and resetting
>     the voltage swing registers
>   - Fixed endianness issue in call to nvmem_read_u16 (Sashiko)
>   - Added early exit during lanes disablement if none are enabled to
>     avoid out-of-bounds bitwise shift (Sashiko)
>   - Removed useless call to pm_runtime_get_sync() in probe(), which
>     also fixes issues pointed out by Sashiko
>   - Fixed wrong dig vs ana register array usage in power_on/off (Sashiko)
> 
> 
> This series performs major refactoring on the MediaTek DisplayPort PHY
> driver, makes it probe with devicetree instead of getting registered
> by the mtk_dp DRM driver, adds power_on/off() callbacks, and honors
> the phy configure opts' set_lanes and set_voltages for, respectively,
> varying the number of lanes and setting the voltage pre-emphasis and
> swing on the PHY, for each lane.
> 
> This driver now also properly gets the PHY (EYE) Calibration Data from
> NVMEM (eFuse array) if provided, instead of getting it (improperly)
> injected by the mtk_dp driver.
> 
> Additionally, all of the driving parameters calculations and most of
> the other register definitions were refactored to greatly enhance the
> human readability of this code.
> 
> As a last step, this also transfers the register offsets for both the
> digital and analog phy registers in arrays assigned to soc specific
> data, in an effort to both introduce support for new minor revisions
> of the MediaTek DisplayPort PHY and to have a clearer view of the
> register related differences between those (for example, it is easily
> understandable that the analog part remained exactly the same between
> MT8195 and MT8196, but the digital part gets a slight update).
> 
> Speaking of which, as a last step, this also adds support for the
> MT8196 SoC (and its derivatives), which uses this PHY only for its
> Embedded DisplayPort (eDP) IP (spoiler: the DP one seems to be way
> too different and requiring an entirely new PHY driver).
> 
> In this state, this driver can also easily support the MT8189 SoC
> with a few lines of code: even though I do have clean code to add
> support for this one, I was not (*yet*) able to test it on upstream
> based kernels, and for this reason I decided to leave that one out
> for now (but it's coming later for sure).
> 
> NOTE!
> Despite all the apparently breaking changes in the refactoring, full
> compatibility with older MTK_DP driver and with old devicetrees was
> retained and carefully tested on multiple platforms!
> 
> P.S.: I am aware of the BUILD_DRIVING_PARAM_0( 0, 2, 4, 7) checkpatch
> warning and I didn't fix it in bigger favor of human readability.
> 
> AngeloGioacchino Del Regno (12):
>    dt-bindings: phy: Document MT8195 and MT8196 DisplayPort PHYs
>    phy: phy-mtk-dp: Rename regs to regmap in struct mtk_dp_phy
>    phy: phy-mtk-dp: Allow probing with devicetree match
>    phy: phy-mtk-dp: Migrate register offsets to SoC specific pdata
>    phy: phy-mtk-dp: Implement power_on and power_off PHY callbacks
>    phy: phy-mtk-dp: Support set_lanes in configure and properly cleanup
>    phy: phy-mtk-dp: Support setting volt swing and preemphasis values
>    phy: phy-mtk-dp: Add support for digital and analog calibration
>    phy: phy-mtk-dp: Rewrite and document default driving param macros
>    phy: phy-mtk-dp: Add bitrate register val definitions to SoC data
>    phy: phy-mtk-dp: Add PHYD Lane EN register mask to SoC data
>    phy: phy-mtk-dp: Add support for MT8196 eDP PHY
> 
>   .../bindings/phy/mediatek,mt8195-dp-phy.yaml  |  77 ++
>   drivers/phy/mediatek/phy-mtk-dp.c             | 882 ++++++++++++++++--
>   2 files changed, 862 insertions(+), 97 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml
> 


