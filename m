Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE0AE67807
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 06:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGHRHWeJS1fyqOYk6SMKIsYTqRUn1UDquo8pHRshV3Q=; b=aG0SmpP5D6+5ACAwjh1HzKQrtG
	7CvM3yeGnACvofoJpFZbw+yVYicW60Bh7QKXIGOaa5DM0n4ygwuDiFmud0RURSPiq4f1EvDkTthH+
	ruTOhXL7FWPXfxcHsizsqjl8eYVKUJQQOBfSWpI/FoPgTRpxTUfEjh8C4G0tS5ry0zdV+5H0TTeAA
	IZ190uxR5YxgOSHA675abN6MnQXsFGjzRstaZuCjN7Ysait1zqontN2vqjwckjFAVJxrKzAYkcFjo
	7QczvKG78fVs1IPM0Oxua5O132RA3x4ECrrMbRsjCTwNAR5VJUoIDVLbj2tYFRaJenWq483o7TSkl
	xqLLPKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Tmt-0000000B1SI-254w;
	Sun, 03 Nov 2024 06:08:35 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7TlC-0000000B1KY-43ki
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 06:06:52 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A366cdJ041862;
	Sun, 3 Nov 2024 01:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730613998;
	bh=ZGHRHWeJS1fyqOYk6SMKIsYTqRUn1UDquo8pHRshV3Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TBHHSVFZVGEyse+ezWW6ab6PPcE1luoIDTljMwNtcxO9pbtnOQZyYPNI7FCojI/tS
	 9ZzwtngsXGIbg1EpxQ3fqaUkZdelAaBC5E/u0TNveYqvVqmtnk6tM0W64NuZBHF5E0
	 X0OoVObS4+gkVBOwrs8NpvMDSa5MXU6lc6Zc0M10=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A366cwP124647
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 3 Nov 2024 01:06:38 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 3
 Nov 2024 01:06:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 3 Nov 2024 01:06:38 -0500
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A366Y9C003673;
	Sun, 3 Nov 2024 01:06:35 -0500
Message-ID: <613421dd-ff8f-414f-837c-a43912384336@ti.com>
Date: Sun, 3 Nov 2024 11:36:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-evm: Add dt overlay to disable
 icssg for Linux
To: MD Danish Anwar <danishanwar@ti.com>, <nm@ti.com>
CC: <conor+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kristo@kernel.org>, <srk@ti.com>, Roger Quadros <rogerq@kernel.org>
References: <20241030114458.1358800-1-danishanwar@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20241030114458.1358800-1-danishanwar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_230651_257422_52CDDB45 
X-CRM114-Status: UNSURE (   7.84  )
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



On 30/10/24 17:14, MD Danish Anwar wrote:
> Add k3-am642-evm-icssg1-disable.dtso overlay file that disables
> icssg1-eth from Linux so that icssg peripherals can be used by
> RTOS or some other OS running on R5 core.
> 

NACK,

Firstly, you disable more than ICSSG (eg OSPI why?)

Secondly, if we keep introducing a "disable-xxx" DT overlay to disable
every other component in use by RTOS on R5 (which changes per customer
whims) then we will have explosion of dtso

If there is a corresponding firmware in linux-firmware.git that solves
need of a specific end equipment or usecase, then we can talk.

Regards
Vignesh

[...]

