Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62562CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 06:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nywbj1GmIo1vgiKWswuM4lSij33lzYXkd1kFYWRKBHE=; b=DIXxdztdfzBE6FZ48sMhy5K1mw
	j1wzjF5PnfB5gpTQ+AVFV0jijAFy3/sX3dV0TnMVl7YSOlYG8BWPqhaT5MOSwGZ2VYijwKnZ/YBSo
	Gbv7glAJGwkAPZ6httN5Kqf0UEREESIhh9Liwk6Eh1xjarDnRuLRV2QwKPjZAJ3NreAMMIidGOFbi
	sNWxTXM3+uSaaNw+KxWORzxIp9YZQRgqpiX8GXMn7ssCBnda5efgZ+oLQf6I11kRz7Psx3equgqwA
	xMVFIpAQjQizqGLYTwkVfkYhQ9wrHC888euo7SnjxPLTLp8dKh8+bTshu+FVuP+WJMshnTMY1bIC5
	entJRBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Inu-0000000FdxX-2wo2;
	Wed, 24 Sep 2025 06:16:38 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Ins-0000000Fdx8-0v9A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 06:16:37 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58O6GYD71148723
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 01:16:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758694594;
	bh=nywbj1GmIo1vgiKWswuM4lSij33lzYXkd1kFYWRKBHE=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=RcX95w0wnQJ0NKSkrv1EcJ6LBg5qemH5pib5NpGB6hR7CAWUKLtEVnoGXzzTymcGR
	 46c1aJwjrx3HIytK9Be60cF9fXvxvrb1uxGO/+kpOth4/aRAOMFmwwXJJdgxv4oo9s
	 pbwm7xcjTqZ0fe/JiSfIBF0651mzGB9TF2GIzRhw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58O6GXSm1647484
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 01:16:33 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 01:16:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 01:16:33 -0500
Received: from [172.24.233.249] (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58O6GUvq1270769;
	Wed, 24 Sep 2025 01:16:31 -0500
Message-ID: <ddc882bd-fd7e-41ac-a455-87d5e6be7e89@ti.com>
Date: Wed, 24 Sep 2025 11:46:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tiL6.12 PATCH 0/4] UPSTREAM: AM62D2-EVM updates
From: Paresh Bhagat <p-bhagat@ti.com>
To: <vigneshr@ti.com>, <praneeth@ti.com>
CC: <bb@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <khasim@ti.com>,
        <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>
References: <20250923020530.467462-1-p-bhagat@ti.com>
Content-Language: en-US
In-Reply-To: <20250923020530.467462-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_231636_474164_8CDC79A7 
X-CRM114-Status: GOOD (  12.88  )
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

Hi,


This patch series needs a small change. I will send a v2 in some time. 
So please don't merge.


On 23/09/25 07:35, Paresh Bhagat wrote:
> This series includes
>
> - Backport of upstream changes including k3-am62d2.dtsi, regulators etc.
> - USB padconfig fixes.
> - Addition of AM62D2 to ti-cpufreq driver and backlist entry to prevent
>    duplicate device creation.
>
> Boot Logs
> https://gist.github.com/paresh-bhagat12/38a2ac9a91b7cbae644d2d2f21b4308c
>
> Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
> Schematics Link-https://www.ti.com/lit/zip/sprcal5
>
> Paresh Bhagat (4):
>    UPSTREAM: arm64: dts: ti: k3-am62d2: Update dts with upstream
>    UPSTREAM: arm64: dts: ti: k3-am62d2-evm: Fix USB padconfig
>    UPSTREAM: cpufreq: dt-platdev: Blacklist ti,am62d2 SoC
>    UPSTREAM: cpufreq: ti: Add support for AM62D2
>
>   arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 120 +++++++++++++----------
>   arch/arm64/boot/dts/ti/k3-am62d2.dtsi    |  20 ++++
>   drivers/cpufreq/cpufreq-dt-platdev.c     |   1 +
>   drivers/cpufreq/ti-cpufreq.c             |   2 +
>   4 files changed, 92 insertions(+), 51 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>

