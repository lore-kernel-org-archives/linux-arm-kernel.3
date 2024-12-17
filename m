Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D951E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTiyx4rfntofc0k6gFLJAY5Sif0ANTcSMp5CKClJKaU=; b=uiCNcVbiIuw2UNxJvTmAwqhXWW
	fyAXrU6J6EfC0DAIrw/1+xVo2xFQXzInHHV+w++cDhO73ELITTnebBnj72a58zbx+VTKbFyCK80QR
	8r0Gg2XM53NIB1NCqJabMfOUhnM0p3vsWeYqleKFqn8pG+GNm0PBLgpYEmuCJM54Szb5gMPUzd07z
	QYa6yFCtgbg3wxoLUKMo/OdmanpZum/mVkvZX9PJupUD3/+vNybMChiBJ6P4pNdESZAMnkrUv8g/m
	Ns/aCZRBg0pH1sZt9W8jl3AumhJbK9fOcObi72GbXfN7VPtQC+u2QY5+5BZ0GHiRIKpAAGavv4j89
	7G4Kft9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYw5-0000000Dpox-0CGa;
	Tue, 17 Dec 2024 14:52:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYt2-0000000Dp6j-0Pa7;
	Tue, 17 Dec 2024 14:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734446960;
	bh=bxleyRE+0QNYUPGWu6GOO9WL8zmi27WPpMdWVX7EXaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SHgrecisvyvFNYJkC0sG9pe+ZHI+SU1wgFAN6QytjqZ1lScWAnvGDWOB6jwwTeoOY
	 b1mEXOq6aztZ09ZzcxhUuG3Wwzv/0G21T4aw3PxuaYchovpxJD6WhQKz/vKInV7TXt
	 2F9t8c0lhA09WzpPWuQtgwPdwGaOyAgN1L+AguXnrTjPEhlioHJ8U/T1N/js0b6v4H
	 iDUEuJIUtXJSf4+YCLmLEF1SWO717Weax/RRKuIQ26fs0CRlo+rHTHWpp8mCDUe4+/
	 lCHiJr2SCxpRf/Qa93uK7R/Fmww2DmFRMHozhV7TJgvX2j2PGmH9IORwl3A1OUh22+
	 AOVOghZSTbzQA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9389517E377A;
	Tue, 17 Dec 2024 15:49:19 +0100 (CET)
Message-ID: <482ccf9c-fad5-470c-964f-a2c422f79555@collabora.com>
Date: Tue, 17 Dec 2024 15:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
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
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
 <6ed3b9ee742dcf814f35e15d88db538480ba2d48.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6ed3b9ee742dcf814f35e15d88db538480ba2d48.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_064924_324417_F16F7FC6 
X-CRM114-Status: GOOD (  20.02  )
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

Il 17/12/24 10:21, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2024-12-05 at 12:45 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
>> found in MediaTek's MT8195, MT8188 SoC and their variants, and
>> including support for display modes up to 4k60 and for HDMI
>> Audio, as per the HDMI 2.0 spec.
>>
>> HDCP and CEC functionalities are also supported by this hardware,
>> but are not included in this commit and that also poses a slight
>> difference between the V2 and V1 controllers in how they handle
>> Hotplug Detection (HPD).
>>
>> While the v1 controller was using the CEC controller to check
>> HDMI cable connection and disconnection, in this driver the v2
>> one does not.
>>
>> This is due to the fact that on parts with v2 designs, like the
>> MT8195 SoC, there is one CEC controller shared between the HDMI
>> Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
>> adding support to use the CEC HW to wake up the HDMI controllers
>> it is necessary to have support for one TX, one RX *and* for both
>> at the same time.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> [snip]
> 
>> +static void mtk_hdmi_v2_bridge_pre_enable(struct drm_bridge *bridge,
>> +                                         struct drm_bridge_state *old_state)
>> +{
>> +       struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>> +       struct drm_atomic_state *state = old_state->base.state;
>> +       struct drm_connector_state *conn_state;
>> +       union phy_configure_opts opts = {
>> +               .dp = { .link_rate = hdmi->mode.clock * KILO }
>> +       };
>> +
>> +       /* Retrieve the connector through the atomic state */
>> +       hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>> +
>> +       conn_state = drm_atomic_get_new_connector_state(state, hdmi->curr_conn);
>> +       if (WARN_ON(!conn_state))
>> +               return;
>> +
>> +       /*
>> +        * Preconfigure the HDMI controller and the HDMI PHY at pre_enable
>> +        * stage to make sure that this IP is ready and clocked before the
>> +        * mtk_dpi gets powered on and before it enables the output.
> 
> In patch [6/15], you does not power on DPI power in DPI driver.
> Could you point out the code about 'mtk_dpi gets powered on'?
> 

DPI gets powered on in mtk_dpi_bridge_enable() -> mtk_dpi_power_on(dpi)

Cheers,
Angelo

> Regards,
> CK
> 
>> +        */
>> +       hdmi->dvi_mode = !hdmi->curr_conn->display_info.is_hdmi;
>> +       mtk_hdmi_v2_output_set_display_mode(hdmi, &hdmi->mode);
>> +
>> +       /* Reconfigure phy clock link with appropriate rate */
>> +       phy_configure(hdmi->phy, &opts);
>> +
>> +       /* Power on the PHY here to make sure that DPI_HDMI is clocked */
>> +       phy_power_on(hdmi->phy);
>> +
>> +       hdmi->powered = true;
>> +}
>> +
> 
> 



