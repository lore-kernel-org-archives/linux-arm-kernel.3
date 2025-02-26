Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9967C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ci5vAe+2l6Sr2oYlsn9z5Et83nVZjCvDi9dpoxa55vw=; b=dv+gBNiAOFd4tfAP3gq5paeoJT
	eQgF+bit+j80z3eOGkcHjSjVpNmIV8Py12WoyO/RtjsTZbdFfFO7p6idDBb24L4LNJEB/KVYcTXxm
	b7F18EAThuSRczr6r6FeojdhfK1IJPe0QEmiec4JEq2mliZZpY2ZwUE6PQH9jkRwcnmP5TrGiUQAK
	YjSeqVpTSS9GEMUuQuqaP7gXfBjIPcijun4NRtZtaa1HEGUm1tBwR9bjIiRsjZlyF/LFXl45C/VWR
	aBcn1QjrzUTeXnZD0h/dNjmHZIYKkDYh2mWeWXGCK0nyw5tL6KN2y/tHk2usQBDcbXOa1I2XV59SA
	bleJzfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHWB-00000003wPz-1paM;
	Wed, 26 Feb 2025 13:32:07 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHUJ-00000003wCF-1vlC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 13:30:12 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QDTklD1469543
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 07:29:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740576586;
	bh=ci5vAe+2l6Sr2oYlsn9z5Et83nVZjCvDi9dpoxa55vw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lQt/OrFSvSN3I0KrMZwPomoSdv1fbWfG8fbc8qC95+isYSmwGnxBm5u6vovHYJ9Ab
	 ZPKgezJfy3+FW1IJLGU94/kdx5yHb1mf+6QKPy36YtUq+8xfoPPEfijfwqdKaqcwvs
	 LmTG93Mah6/tYVDcLhsMdnzAYx3n22veslktRaZQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QDTkC0044010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 07:29:46 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 07:29:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 07:29:46 -0600
Received: from [10.249.129.76] ([10.249.129.76])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QDTZw1013607;
	Wed, 26 Feb 2025 07:29:36 -0600
Message-ID: <5dd84e6e-61c6-4496-811d-cf7af7ace2d2@ti.com>
Date: Wed, 26 Feb 2025 18:59:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Enable HSR driver
To: Meghana Malladi <m-malladi@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>
CC: <elinor.montmasson@savoirfairelinux.com>, <javier.carrasco@wolfvision.net>,
        <ebiggers@google.com>, <biju.das.jz@bp.renesas.com>,
        <quic_tdas@quicinc.com>, <nfraprado@collabora.com>, <arnd@arndb.de>,
        <dmitry.baryshkov@linaro.org>, <krzysztof.kozlowski@linaro.org>,
        <geert+renesas@glider.be>, <quic_bjorande@quicinc.com>,
        <will@kernel.org>, <catalin.marinas@arm.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>,
        "Ravi
 Gunasekaran" <r-gunasekaran@ti.com>
References: <20250226104517.1746190-1-m-malladi@ti.com>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <20250226104517.1746190-1-m-malladi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_053011_554875_AF24E3C8 
X-CRM114-Status: UNSURE (   8.52  )
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



On 2/26/2025 4:15 PM, Meghana Malladi wrote:
> From: Ravi Gunasekaran <r-gunasekaran@ti.com>
> 
> HSR is a redundancy protocol that can be realized with any
> two port ethernet controller.
> 
> Many of TI's K3 SoCs support multi port ethernet controller.
> So enable HSR driver inorder to support this protocol on
> such SoCs.
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>

Reviewed-by: MD Danish Anwar <danishanwar@ti.com>

-- 
Thanks and Regards,
Md Danish Anwar


