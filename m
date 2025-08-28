Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E6DCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPjjQTbKK+GOFeft571XUjklByuU7mPq8ZAarbd6++Q=; b=iNKgAuQxOHJ/crGOXd7zPO/CVF
	YQuCieiGfi3Myex/9C+6mqmX/JapuUyhYJXg/Y9ZPWvp8eFX1RLVPIYjlwXRKIed136Px+eDRss/F
	lfJkwmIx/MqEDFChrgFgeY6NG6bEMBvSCpTR1VzG4S7eAcT3g3xbKweFCtIvznDdfaiJ6GWBQo2h8
	otKYYDFYQc/Ink9Gbwk5Kbtm8tMmS1BJGeLiOAUeQ2UQTeJmVbJWJbVWg5uC2DF/DdifEgj7hH2Ve
	XEZqLb1GR80CAmAAbC96weQBrGo5cpyiCrzT2jsd5MNGBPk7wOZl0kazZ6NSySjVOwFrmXmbyhLmd
	y+5IXiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWP-00000002oIb-3j1L;
	Thu, 28 Aug 2025 18:38:53 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urd50-00000001nja-1XGm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:54:20 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SDfCFR007725;
	Thu, 28 Aug 2025 15:53:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	mPjjQTbKK+GOFeft571XUjklByuU7mPq8ZAarbd6++Q=; b=Q0oqwLoKRdDNOEfi
	IVZqbiFgAAqDatLF7mWMR7cJB8Db0xk+XSNCKy4WBwlVMKBzFiKR6s7KcTd3S4x8
	QhgG607gSR3yzlgfEMiPcGVeXheniD7a+6qHleo3U3/eE1rmYkHuYr33AfFVOtmd
	hxzoBiZjAffiW3gnSalEoPVbqsc3aer8ITuFm/ES5fIfG38i7EZxqIThORKiEoTU
	0Vdh+IeYhMAYGdTsYgychzfrllxaqxcAcXw49Bek0sXdWjDWtGYD6s0ZB/8O/cPq
	/Buo9iX9nsdsYTAIVpswXZ9096OXn0HRJoB2DBVKzfa681N3FfFshsLNVevoshp0
	vQ/xfg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qrkmtm8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 15:53:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 23AD140052;
	Thu, 28 Aug 2025 15:52:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6FD7973586B;
	Thu, 28 Aug 2025 15:51:41 +0200 (CEST)
Received: from [10.48.86.145] (10.48.86.145) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 28 Aug
 2025 15:51:40 +0200
Message-ID: <5ff304d6-4eb8-4b85-b85c-fc48d6ddaa79@foss.st.com>
Date: Thu, 28 Aug 2025 15:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 01/13] dt-bindings: display: st: add two new
 compatibles to LTDC device
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Yannick Fertre
	<yannick.fertre@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
 <20250822-drm-misc-next-v5-1-9c825e28f733@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20250822-drm-misc-next-v5-1-9c825e28f733@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.145]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_065418_887672_1D62E9D3 
X-CRM114-Status: GOOD (  13.32  )
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



On 8/22/25 16:34, Raphael Gallais-Pou wrote:
> The new STMicroelectronics SoC features a display controller similar to
> the one used in previous SoCs.  Because there is additional registers,
> and different mandatory clocks it is incompatible with existing IPs.  On
> STM32MP251, the device only needs two clocks while on STM32MP255 it
> needs four.
> 
> Add the new names to the list of compatible string and handle each
> quirks accordingly.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   .../devicetree/bindings/display/st,stm32-ltdc.yaml | 52 +++++++++++++++++++++-
>   1 file changed, 50 insertions(+), 2 deletions(-)

Hi Raphael,

Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>

note: you may add the v4 acked-by too on this patch.

Thanks
Philippe :-)

