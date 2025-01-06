Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C4FE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7wyUdadEoYLGmcBhlYZBQxE/bFc8L6HId4ivUrzHOQ=; b=SUaUutifS0Jf6HfX84ZFv5sZnB
	Z+qnnkeV3QVe0wPOujFE9kwdcNXYO5mqjWip8F5lxYPitCbJI64a8xWkze/BMSpAnsBM0zCQhOEAD
	azXOBesykXJcjO4gOOqJczqNZvvkYMudEh9QxdjTUF/ZtnatgAtsi3R+vufIijhWdz0aqy+LKRwZp
	UH5UTv1JDP41mLNNKiFaFu6dVP9/jk8Jq4EwSNHoAFJK2osHqPMssbNBepvzIoB4K8N2qSDg0kgJG
	WNr4QjQqUDdB9k3dJ+nclj4cEi/c6FDzZdD6jIPKsTCdwoaUMfvrr4BQpecF/xoWNivjQfrUBnlqP
	kEkVGrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqnX-000000026Dn-3f6R;
	Mon, 06 Jan 2025 17:21:52 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpeD-00000001tjC-415x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:08:11 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506FTvZH025120;
	Mon, 6 Jan 2025 17:07:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	t7wyUdadEoYLGmcBhlYZBQxE/bFc8L6HId4ivUrzHOQ=; b=BNGNVisGo6IoTdnN
	3iDdo2Pi+3vbkNYy3xLrSlFyVYwfymaJnw4unEXO2RAIgeb9qBL/cY165wIWXIFV
	zvBDNRwet3qONWViE4srR6Ky8rS9gs7QwkIQI+P1YkKCh8DAQJfuaelaYl0Nu5/Q
	uM64UZCu4tARtIQUjaP+XsTAYWx/FvZ3AC89m6qfWZcSHNr1gWWP+8Y1kPLaO0i7
	J4gu5ZfIB7ADWPqtGWM6KzpgkqDtUm3vpVOQL1vRqyct2g+yAkm9JHP2TELHeADq
	XDcIqHxLYko2IbkysackZ378Q7t5u17HXgEFnv0knuRCRkrmQtyLoOnV3XnS0nSD
	8Gt63A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 440cbrsdam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:07:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B03014004D;
	Mon,  6 Jan 2025 17:06:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78714276BB8;
	Mon,  6 Jan 2025 17:04:58 +0100 (CET)
Received: from [10.252.22.94] (10.252.22.94) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 17:04:57 +0100
Message-ID: <0335a999-9ff1-4527-a21f-d04392c520b6@foss.st.com>
Date: Mon, 6 Jan 2025 17:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/stm: dsi: use drm_mode_validate_mode() helper
 function
To: Sean Nyekjaer <sean@geanix.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec
	<jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Yannick
 Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.22.94]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_080810_543120_AF1A100F 
X-CRM114-Status: UNSURE (   7.76  )
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


On 11/25/24 14:49, Sean Nyekjaer wrote:
> When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh to
> reguire the requested and the actual px clock to be within 50Hz. A typical
> LVDS display requires the px clock to be within +-10%. In case for HDMI .5%
> tolerance is required. Signed-off-by: Sean Nyekjaer <sean@geanix.com>---


Hi Sean,

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Thanks,
Raphaël



