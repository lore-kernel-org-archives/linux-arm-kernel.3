Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CD7C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6EziXFSk8NbTx/1V+mCgjnx9+FiwrLm4eimV4AStAs=; b=qKz3OiZfHe77M6yY10U2lPGum3
	IipehsFGMxQ7WtFzyr/hRoL7v6H/cK9pk1VJ4GQSrKZwzjUJHFGjLxWH+3eDVwT63ESJQ5uoqnXet
	+UZ8aUWvw4H46+5gfRNZ22FcUN4gV24CjH08Pas23F8p70dvOLGU6IJUPwA7bbMdAzAbj7+8NQ+mF
	yBJyfM+FJa+o20Eyy3uJO0cldkFLjmdm16KHmxttGcImh45awRV20hiQRFy+FrCIQoe8VkvoQEIqG
	RLk2fwJUq3s0+XisvqrZMZMjsEPJp9VY0CEuc9DlbtKmRuXc57KYsGaZ0wV2ZdVL2Rf0IBuxCnJ6A
	s/G/Yy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6X-00000002eHU-3EJN;
	Fri, 02 May 2025 17:23:17 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtfR-00000002aTq-24Np
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:55:18 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542GtCsn271542
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746204912;
	bh=k6EziXFSk8NbTx/1V+mCgjnx9+FiwrLm4eimV4AStAs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iKKYORQjlCx7jiQqyBxRbkSiU80TGKBlXfqTcdVoGJo5z2VMRvsTXstGgLm8b5PqH
	 /DhhIutb0xc+SUQOloMg8ZvR2oj6OJR258KabN6pP3Ibfc1phfkKMXCDKY6kkwPjwW
	 dPxwDkGCnS2mBJOxSQwKsZpQhiDHnzK5LOi+jgQI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542GtCqs109949
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:55:12 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:55:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:55:12 -0500
Received: from [10.250.35.60] ([10.250.35.60])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542GtBu7060727;
	Fri, 2 May 2025 11:55:11 -0500
Message-ID: <b7fdd7bf-dad9-4b54-9091-f11c89e39c0e@ti.com>
Date: Fri, 2 May 2025 11:55:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: ti: Add pinctrl entries for AM62D2
 family of SoCs
To: Paresh Bhagat <p-bhagat@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>
References: <20250502153915.734932-1-p-bhagat@ti.com>
 <20250502153915.734932-3-p-bhagat@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250502153915.734932-3-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_095517_653362_F91A74BA 
X-CRM114-Status: GOOD (  13.17  )
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

On 5/2/25 10:39 AM, Paresh Bhagat wrote:
> Update k3-pinctrl file to include pin definitions for AM62D2 family of
> SoCs.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-pinctrl.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index cac7cccc1112..0cf57179c974 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -63,6 +63,9 @@
>   #define AM62AX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>   #define AM62AX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
>   
> +#define AM62DX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
> +#define AM62DX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
> +

Your board DTS file is including k3-am62a.dtsi, so you are using the AM62A pinmux
controller and should use its macros (AM62AX_*).

Andrew

>   #define AM62PX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>   #define AM62PX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
>   

