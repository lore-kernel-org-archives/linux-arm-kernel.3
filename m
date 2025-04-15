Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B4DC369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68uuCchRlgkTvYsAsaec3UreWs7xrz+smQbSmpGulzM=; b=CaJv0PKKxRgvtZiaP7Wsy6sYiw
	XIjK1Lg3Ur48v27JQLQ4d05ndZsoSQBLsNhekpN7R/UFwNCevLF4UYK+7a0v23HOiCpaV7e63NHbs
	qNxBaiQXfYztrvlhcXDy5/QNBWJJce7eUU8oRvtlLlcHlARIZzF3/zHqviUcLUtKEcL+CRjXhOI76
	qawSZKZOPFIyZUQrptq4LJrgjojcZEj74Onrj9DR5WSRsvkx2mhL4r80sXAP3TE+QwJzYK70etc4w
	uiY9SYkiYsn6BNUPmtCtmg+qB5ZbuyRNn6c3/sCYYuftsqkDG32NSTpD2RDW0LSgy55rgLPy10vlo
	FNzH1UXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eXy-00000005Yyp-2dhD;
	Tue, 15 Apr 2025 11:33:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dq8-00000005Oxy-3gHx;
	Tue, 15 Apr 2025 10:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744714107;
	bh=CgTZtSnpeBEZpCMbBFIaZGn3QwWWlHR/mJgp6BEyfeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z1Z5ubmsLjUbXF45H/YDyate0WEabrgAxtWqnITNe4AZe8+b4Ke3aUNvnzNa6M+jf
	 0Lr/j/xOs8miKATlJEsQCnnDINXtXLJPhvpR3iV4k2noMV7X3Ii9t0LRLZeCsenJrZ
	 X0fg1LRNTAUDCzundGbkKCLQGV6lmAYvFrfvahKBiBKkfBd+Yjq3MKUsCg5oOCXAFL
	 BHdDaXENi6hf1QoTYs6jtpoBO4WdPUNgN/J2G51nv8ggueii5kTBhzJKYwd5GYcBLG
	 hiwjeMpuSpUgbuSnvJNrmcakF5nAoHSGwE0ovGdp2qw3UPs0YcfGIbk6LRNrj2nzI8
	 spay6QgJ9m8sQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40E9917E09B5;
	Tue, 15 Apr 2025 12:48:26 +0200 (CEST)
Message-ID: <bc094a07-2a4c-4048-8c15-b096db62f142@collabora.com>
Date: Tue, 15 Apr 2025 12:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 17/23] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
 <20250415104321.51149-18-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250415104321.51149-18-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_034829_063876_97F36785 
X-CRM114-Status: GOOD (  11.99  )
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

Il 15/04/25 12:43, AngeloGioacchino Del Regno ha scritto:
> In preparation for adding a new driver for the HDMI TX v2 IP,
> split out the functions that will be common between the already
> present mtk_hdmi (v1) driver and the new one.
> 
> Since the probe flow for both drivers is 90% similar, add a common
> probe function that will be called from each driver's .probe()
> callback, avoiding lots of code duplication.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/gpu/drm/mediatek/Kconfig           |   11 +-
>   drivers/gpu/drm/mediatek/Makefile          |    1 +
>   drivers/gpu/drm/mediatek/mtk_hdmi.c        |  538 +-----
>   drivers/gpu/drm/mediatek/mtk_hdmi.c.orig   | 1769 ++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c |  422 +++++
>   drivers/gpu/drm/mediatek/mtk_hdmi_common.h |  188 +++
>   6 files changed, 2398 insertions(+), 531 deletions(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.c.orig

CK, I just acknowledged that a .orig file slipped through and got sent out with
this patch....

Truly sorry for that, can you please fix that up while applying without having me
send another patchbomb?

Many thanks,
Angelo

>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> 

