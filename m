Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A779BCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxYjy7de4BBvokx76hvxygzUMcYYtcxPhs6mdD+tg/o=; b=Q7oW4P4zyqdooOA6VTqboTjKRn
	fzMODwOpzqS2eteCHT7P9uBjVceCiPRBdUlYiZ3vLptujJboMzAIrzQlMXQuNGruPIbhjmLrFkoKu
	MedLBTkcsWmOLjO7gZSMm72REX/QkOvQcxLoi6gF9nDk1dX+XLJoeKMOCufBoHegnW24AJh4WZC4d
	2fc4Yakx52Y5qu8PGPyp4B+IjzZ8r68znRKNvcaz3o9+qHsaBRkvZKD9EU0lSK/XlICwsectQ4h4U
	WAldlhb1HaLgi2W23wBfGJfDyMfxa5qVW18QM/NsWhjLM8DC1RLYiINKRk8xoILwZcyrT78FKCtJU
	VA6IKHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIg4-00000001QJf-2XZv;
	Fri, 22 Aug 2025 03:42:56 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEX9-00000000vDe-3V1o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 23:17:29 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LNH8dL116000;
	Thu, 21 Aug 2025 18:17:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755818228;
	bh=FxYjy7de4BBvokx76hvxygzUMcYYtcxPhs6mdD+tg/o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uB3ZmRHWXlxBkDx2lUhs4SiFQngRmCNt3DVeSHTa1cx3+Ud1xp8aZFHvms37/cdSh
	 SVB+1YCUmu+5A2tl1xJ0Ul5lUv/NJCjmYtEHdXtDqXzY9iF8XI4d5B3mvOZPrP44Ua
	 oqlas05Z+5hAifnjvgkGMp4XMDsm321I9xbleFVg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LNH7Kr2280882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 18:17:08 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 18:17:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 18:17:07 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LNH7dY2613823;
	Thu, 21 Aug 2025 18:17:07 -0500
Message-ID: <145dc871-4d0e-456f-940e-c3c6268e2d92@ti.com>
Date: Thu, 21 Aug 2025 18:17:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: multi_v7_defconfig: Enable more OMAP related
 configs
To: Beleswar Padhi <b-padhi@ti.com>, <linux@armlinux.org.uk>, <arnd@arndb.de>
CC: <krzk@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250819101137.2878336-1-b-padhi@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250819101137.2878336-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_161728_133693_79B5FCB6 
X-CRM114-Status: UNSURE (   8.64  )
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

Hi Beleswar,

On 8/19/25 5:11 AM, Beleswar Padhi wrote:
> This allows us to enable various peripherals in the TI OMAP family
> platforms like AM571X-IDK, AM572X-IDK, AM574X-IDK, AM57XX-BEAGLE-X15,
> AM57XX-EVM using the multi_v7_defconfig, instead of only with the
> OMAP specific defconfigs.
> 
> DRM_PANEL_OSD_OSD101T2587_53TS:
> Enables OSD LCD panel support used in AM57XX evaluation modules.
> 
> SPI_TI_QSPI:
> Enables TI's QSPI master controller driver for accessing flash devices
> on OMAP5 platforms.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

Thanks for the patch, QSPI config is needed for am437x.

Reviewed-by: Judith Mendez <jm@ti.com>


