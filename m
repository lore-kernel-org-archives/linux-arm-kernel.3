Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5352E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNwzpL+BPINQJWoCjLecjK+jDtGkY87rOoq7mOpqYBM=; b=Ci+e+ZEK26ecQc9tNP2SnEURVY
	r0umb/Yu8xfgC2FIecYmoZ6eoo5QohYLdyTxFvcP9tTCT8EzrIiWKm97smdgzJFQOUanRcCPton+I
	2F7ytEHwqTRM3L8IAZVheBSTrFYtmbtPySM16LPuy5kgN/EE/+2RxoLHI+LX2aRVKUixaPqqc48KF
	2eWg5yfhd78o9xG55xrhHY8hvhV6jneDj/sx2gM2446TcmxIxoOhJBXtiW6j3Mue4sBkf3oHpcJfX
	ywA5eWKdAiMQhqmSfQVDyhljwVQxuUHxpchYcw5I43R8TRhuIfBJeyO7qvxe2Fkij8sWhPsRsgtWs
	A0pKt3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLee-0000000AXF3-2Hbg;
	Thu, 02 Jan 2025 13:54:28 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLdV-0000000AX8K-37Of
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 13:53:19 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 502DrCpC063687;
	Thu, 2 Jan 2025 07:53:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735825992;
	bh=NNwzpL+BPINQJWoCjLecjK+jDtGkY87rOoq7mOpqYBM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uHTYlj/SkhF1u7t2MlRcZqC2Ai9ewWMC2xSvuBFLltQb8rTA/kXExsYaINMFXJgcF
	 tkgPHyN8bWx+3+T2qJvdLV5jkyF5+qwXDA5puPu1CPawQtaMb+qjapUJ0J47kY+2SY
	 fQzgl74t/KPd+4+PxxhP0o1HyR/P7KjicMSTSE4k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502DrCHL121728;
	Thu, 2 Jan 2025 07:53:12 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 07:53:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 07:53:12 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502DrB4c005294;
	Thu, 2 Jan 2025 07:53:12 -0600
Date: Thu, 2 Jan 2025 19:23:10 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Enric Balletbo i Serra <eballetb@redhat.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dasnavis Sabiya <sabiya.d@ti.com>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
Message-ID: <c73edt6zrcg2qx6jxvlpszjlpb62pgq6ypytsur27ep4biq6tn@olk7mtnqk4s4>
References: <20241204-am69sk-dt-usb-v2-1-d59b2ac45c6e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241204-am69sk-dt-usb-v2-1-d59b2ac45c6e@redhat.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_055317_968564_97DAAD9A 
X-CRM114-Status: UNSURE (   9.56  )
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

On Wed, Dec 04, 2024 at 12:05:26PM +0100, Enric Balletbo i Serra wrote:
> From: Dasnavis Sabiya <sabiya.d@ti.com>
> 
> AM69 SK board has two stacked USB3 connectors:
>    1. USB3 (Stacked TypeA + TypeC)
>    2. USB3 TypeA Hub interfaced through TUSB8041.
> 
> The board uses SERDES0 Lane 3 for USB3 IP. So update the
> SerDes lane info for PCIe and USB. Add the pin mux data

nitpick: s/SerDes/SERDES to keep it consistent with the convention
followed at all other places.

> and enable USB 3.0 support with its respective SERDES settings.
> 
> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

