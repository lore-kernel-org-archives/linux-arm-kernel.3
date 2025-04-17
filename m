Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91063C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 23:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDH4isnZwqq2l+iCZ39ndDc2NXtb0tzf10xiYUchbHs=; b=rc3e8Ib2M/aQA8YOdSb/u/hSmL
	wxfZHNSeuhP5pQxHwwfSXdVolRaCtfxHDEulZfXfv+5kz/EUOT8A4Y8G6OSdXGu6VjoH3lgy6ocb3
	n/HE0an7L3zHsGX6Gb30eufwJlDqN7fJSWREyG9XCw4IgeJBY9lmNI5o+/zi5vFT6On2F4FwMVDXs
	1Lp3J3o/3N3K0CmiRmjidY5IY4CsoDSAMQRGkbGDRUoq03dYniIj/FmcIo2cZ7sEnxrbjn/Sw30Vt
	JW1QkGovG5cRJNOQSc0b1Z+ZKMba4xUXmqKMPpr5xHwMMCcHmRg+mIaHOKaUfNMyyvKZ8SXWgnkqJ
	msAuOcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YLI-0000000EXR7-2el1;
	Thu, 17 Apr 2025 23:08:24 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YJQ-0000000EXCZ-49ap
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 23:06:30 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HN6NQc834904
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 18:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744931183;
	bh=FDH4isnZwqq2l+iCZ39ndDc2NXtb0tzf10xiYUchbHs=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=nbAkbF5wLX6hxe4DxaxeLsAAV/uVi/bXWeCbb85nh4c25IBr/+PT7F2tCgyaDQeJ/
	 AJDRO5oLTK2z5Vyq3P+vAAIr/b4lLANU6+59lZbNtvC8xbUMMI730k508li5JCaH9O
	 2MZsLTPadlPBjYf7BkpiM4UaVPfo+IotvLtJ9cRA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HN6N7f119497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 18:06:23 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 18:06:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 18:06:23 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HN6N7X128671;
	Thu, 17 Apr 2025 18:06:23 -0500
Message-ID: <4b8dac8a-e6fe-4225-a9e8-ab3b8b9df6f1@ti.com>
Date: Thu, 17 Apr 2025 18:06:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62-lp-sk: Add bootph flag to support
 sd boot
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250203215704.1333881-1-jm@ti.com>
Content-Language: en-US
In-Reply-To: <20250203215704.1333881-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_160629_077889_54C3E567 
X-CRM114-Status: UNSURE (   8.44  )
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

Hi Nishanth,

On 2/3/25 3:57 PM, Judith Mendez wrote:
> In order to boot using SD boot, voltage regulator nodes, io-expander
> nodes, and gpio nodes need to be present in all stages of boot in
> order to do voltage switching, thus add bootph-all flag to these nodes
> to not fail SD boot on am62 lp SK board.
> 
please ignore this patch, I will be adding it to this patch
series when I respin v2:
https://lore.kernel.org/linux-devicetree/20241014194722.358444-1-jm@ti.com/

Thanks,
~ Judith

