Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B10C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTqL88D0mVFDd1AH4GzigWN+2004RbbVPumKjup+IJs=; b=NkHOI/F0Ka08Te3NK3KpGyqn5w
	5ZTIimJwx9ER/6eulbRE/lUIroLGKIcM/7wlyLeDCKjE+sgazsAisyf9dOI8c09Lutp9zs4YJMrOR
	4wA88dTDXidt7Rm2gwY1t45JOkSZU3XUslBFSN7av1Vw0kPN2nrvAScMlvFOciuqkd3JSBU+5THJA
	OZDuxwXVXGPDC1AFlN3gxeTbd3C8TbFEE6Run4r2TGin0z3o+5+vBCYNZKCZBQ7ZxIGu4LpMD3rar
	kR0qctOEUp44LWZOn96ZGp/BFz+ohtGB84UG4jtVKCNtM6wQpg2hSDTN0YfNBNZivZvMsyZyClo6q
	1syGrC/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2TU-00000004w1H-0RDw;
	Mon, 17 Feb 2025 14:51:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2Jt-00000004u1x-1INI;
	Mon, 17 Feb 2025 14:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739803319;
	bh=Y/OUoWXQe0LCUGR1fAyU/8Gh09AdSOxxx2+M936ATn8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HoezJaMc3mXXjJWwOpOfUj/2Ez8OCiHZobm9z0HqFVZyRHchrIAWIAlXWH02QFBG8
	 Mrzwo/goQiwKCgP5+tIzetmDUkZpM/chpPKaH+CcQJ2QIjFtGfBXN308egTdwFsNsY
	 C7ewE6VU2+Tie+1Db8QnnUzAPh4Dpb8o07lrAIPyATw2qraic4EGTAb+MxgNl/h2cj
	 9XJMujQnizIN7nFHGpGJe5OdwkEpRuA4V03bg5EMaMcgGrlCyJfvdA5nbjgmJpTb2U
	 TjhwZBTot6JFd20anNbdic6iWCpnZru9LLB8dASPE+Xcrnninz6DmcnppVo8e/Lcci
	 LOCBnMF74DmuQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C57E17E154A;
	Mon, 17 Feb 2025 15:41:58 +0100 (CET)
Message-ID: <588ccb13-e37f-43bf-a421-8620ff68a373@collabora.com>
Date: Mon, 17 Feb 2025 15:41:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/42] drm/mediatek: mtk_dpi: Explicitly manage TVD
 clock in power on/off
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 =?UTF-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-10-angelogioacchino.delregno@collabora.com>
 <5eefa246f471f4b9382d6f20a9ea783136bd80c5.camel@mediatek.com>
 <8a6031f901df5139f88fa70e7ecae5be4f66a58d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8a6031f901df5139f88fa70e7ecae5be4f66a58d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_064201_515701_E9FE6A58 
X-CRM114-Status: GOOD (  14.44  )
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

Il 14/02/25 04:31, CK Hu (胡俊光) ha scritto:
> On Fri, 2025-02-14 at 09:51 +0800, CK Hu wrote:
>> On Tue, 2025-02-11 at 12:33 +0100, AngeloGioacchino Del Regno wrote:
>>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>>
>>>
>>> In preparation for adding support for MT8195's HDMI reserved
>>> DPI, add calls to clk_prepare_enable() / clk_disable_unprepare()
>>> for the TVD clock: in this particular case, the aforementioned
>>> clock is not (and cannot be) parented to neither pixel or engine
>>> clocks hence it won't get enabled automatically by the clock
>>> framework.
>>>
>>> Please note that on all of the currently supported MediaTek
>>> platforms, the TVD clock is always a parent of either pixel or
>>> engine clocks, and this means that the common clock framework
>>> is already enabling this clock before the children.
>>> On such platforms, this commit will only increase the refcount
>>> of the TVD clock without any functional change.
>>
>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> One question:
> MT8195 DPI clock is from HDMI, why need to contol TVD clock?
> It seems this patch is redundant.
> 

Ungates the HDMI-generated TVD, that's it.

Regards,
Angelo

> Regards,
> CK
> 
>>
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/gpu/drm/mediatek/mtk_dpi.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> index 5c15c8935916..67504eb874d2 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> @@ -501,6 +501,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
>>>
>>>          mtk_dpi_disable(dpi);
>>>          clk_disable_unprepare(dpi->pixel_clk);
>>> +       clk_disable_unprepare(dpi->tvd_clk);
>>>          clk_disable_unprepare(dpi->engine_clk);
>>>   }
>>>
>>> @@ -517,6 +518,12 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>>>                  goto err_refcount;
>>>          }
>>>
>>> +       ret = clk_prepare_enable(dpi->tvd_clk);
>>> +       if (ret) {
>>> +               dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
>>> +               goto err_engine;
>>> +       }
>>> +
>>>          ret = clk_prepare_enable(dpi->pixel_clk);
>>>          if (ret) {
>>>                  dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
>>> @@ -526,6 +533,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>>>          return 0;
>>>
>>>   err_pixel:
>>> +       clk_disable_unprepare(dpi->tvd_clk);
>>> +err_engine:
>>>          clk_disable_unprepare(dpi->engine_clk);
>>>   err_refcount:
>>>          dpi->refcount--;
>>> --
>>> 2.48.1
>>>
>>
> 




