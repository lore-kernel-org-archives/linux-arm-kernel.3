Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFDEC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZesZJAirQ8C1ohHkcmwk/SZqiKf5CT9QYrZbudr96z0=; b=emGMcGSGJXSAqBRuM3aZBZ/ul2
	hG9HVarc8f7NZdeviwEXJaFKnTzQ6hIOkQEFrHohcb72YD/+p0kUYMGkrjUKVTptQlr0mH8NlMu9N
	RU5xkqg0gKHZJMoMHKER0H2jb4YfZ+ebLUyiEAmAReec60KSjt6M5HKO+JqEnrKD5iOWBM0ggSQMJ
	nDzwHk0/th4uR9W+pbeYfCCMk2QGCoXh+Ya8A+IiAbeKMvx9ALNZfcZiOC/P3SxMM99lR4OrxN7a4
	VDjCT4BNIXYus6lURohhAvLLB5J/6TjKcJHGgJx/w1XohvRPASq1J7FSXjppL9VyRe8EvYipReLxg
	zHQPu27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoz6-0000000HB9V-2j3u;
	Mon, 21 Jul 2025 11:47:08 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoNo-0000000H2SZ-3Doj;
	Mon, 21 Jul 2025 11:08:38 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LAiMm0014072;
	Mon, 21 Jul 2025 13:07:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZesZJAirQ8C1ohHkcmwk/SZqiKf5CT9QYrZbudr96z0=; b=CzmeFdsk3HJI57lf
	VLKGmGmQh3HC0LKkNuWaKOM3l+4NgchhLNiXV1T8nRre05AknyQJpS7M5wJO9wOm
	XuV1k2bu1IAf90lIDHIllg989ZrLgbM//VIbAEB3C8CVmGZ1d6PXtQjK8WQyEY5m
	LsrRFkiefZARVmwg9N/2WMFwuMBkMOQvNN6UGxBgdturUrOqlLPFtM6UfXoFVwgj
	D8f/bAv0oktn4xffXnsWJJg0khrsCm0nR7tb6Z23OBIbk8dOgTKidpDU07lpa67O
	4a4ELDPBB/W8hNiDKbVLlz6q5YiYEroFt4A8MU30eFbNqlv4XdWBb0licHEpeeyU
	4p57+A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q20j57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 13:07:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3D3E1400A9;
	Mon, 21 Jul 2025 13:04:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26B8B7A321F;
	Mon, 21 Jul 2025 13:03:59 +0200 (CEST)
Received: from [10.130.78.67] (10.130.78.67) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 13:03:57 +0200
Message-ID: <fa07f01b-1e06-48c1-b380-c41a52f741bc@foss.st.com>
Date: Mon, 21 Jul 2025 13:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tommaso Merciai
	<tomm.merciai@gmail.com>,
        Martin Hecht <mhecht73@gmail.com>,
        Mauro Carvalho
 Chehab <mchehab@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Umang Jain
	<umang.jain@ideasonboard.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Riesch
	<michael.riesch@collabora.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>,
        Nicholas Roth <nicholas@rothemail.net>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Paul Elder
	<paul.elder@ideasonboard.com>,
        Matt Ranostay <matt@ranostay.sg>,
        Nas Chung
	<nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Vikash
 Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>,
        Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Matthias Fend
	<matthias.fend@emfend.at>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Ricardo Ribalda
	<ribalda@chromium.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
References: <20250709195348.973873-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250709195348.973873-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.130.78.67]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_040837_091787_E0FEC522 
X-CRM114-Status: UNSURE (   9.34  )
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

Hi Sakari,

On 7/9/25 21:53, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Thierry Reding <treding@nvidia.com> (tegra-vde/h264.c)
> Acked-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> (alvium-csi2.c)
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com> (iris_hfi_queue.c)
> Reviewed-by: Sean Young <sean@mess.org>
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com> (imx219.c)
> ---
> since v1:
> 
> - Remove now-redundant braces from ccs-core.c, ov64a40.c and gpio-ir-recv.c.
> 
> v1 is <20250704075431.3220262-1-sakari.ailus@linux.intel.com> on LMML.
> 

[...]

>  drivers/media/i2c/st-mipid02.c                           | 2 --

[...]

>  drivers/media/i2c/vd55g1.c                               | 4 ----
>  drivers/media/i2c/vd56g3.c                               | 4 ----

[...]

Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

-- 
Regards,
Benjamin

