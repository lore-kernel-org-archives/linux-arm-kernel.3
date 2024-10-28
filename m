Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AEED339A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMdoqtd5Or4egsm/ysACUyrqRpKWAPTDiHGIU58xz0g=; b=yoFHG2Z9g+HFq5fkODoy7newAW
	Bpjr62b+/G/kd4wPQuRjuhNGPsRv6AU32fN5Kk1PxY7AYy13THdqAHrOb5G3yM/Sa6UxDZOsqVXp4
	WxCZhz7IOYvtHbSXma1zkwBTpS3t9F+Oh4zX481TAZJ+fq4CMjGcbPIzSVa2tP7d0HNqJmFa+lTjf
	ybFXI+sCmAKVLCnXNvanJk+8RYmRKRwrsZBTo4U8e94ki2a9hLpKhrt5P4Be647ulYTWzYyJC/xZL
	ZhvHbsgFBuSHLbS6tf3RURfxv9N8Br2LIPhhGtkKwppjYGgEfDHtuixDPZb9rfefD2UfZihSj923F
	SFK/LEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5T95-0000000BbGl-1qJK;
	Mon, 28 Oct 2024 17:03:11 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5T4t-0000000BakD-1p1K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 16:58:52 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SGwlFS127484;
	Mon, 28 Oct 2024 11:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730134727;
	bh=MMdoqtd5Or4egsm/ysACUyrqRpKWAPTDiHGIU58xz0g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FikjylivUnHNMVaS4gfS000Fxsf5d00p551H8vGEHp3SQXATPCqJhtoeOOEYE7lv6
	 DHGKP2heoAVrCK4AKFbWmlfiUSo0ojKPFufEwpMf/3zoSGLWL8U3rtjzbO1Dlexuol
	 +WyAKNEJ6Ibm5Owy2hjoCQvXT5JhGI/gAhDnxivs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SGwlOW120677;
	Mon, 28 Oct 2024 11:58:47 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 11:58:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 11:58:47 -0500
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SGwh3V128346;
	Mon, 28 Oct 2024 11:58:44 -0500
Message-ID: <3d6f78b8-d6b1-4c11-b87a-3922254ce360@ti.com>
Date: Mon, 28 Oct 2024 22:28:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-*: Add GPIO INTR region in ranges
To: Vaishnav Achath <vaishnav.a@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20240903055733.3483840-1-vaishnav.a@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20240903055733.3483840-1-vaishnav.a@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_095851_597041_6A1733CE 
X-CRM114-Status: UNSURE (   8.85  )
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



On 03/09/24 11:27, Vaishnav Achath wrote:
> Add GPIO Interrupt Router regions in ranges. Although not currently used
> by the Linux TI-SCI INTR driver, these regions should be included in the
> ranges mapping.
> 
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> ---
> 
> This was observed while trying to boot Xen hypervisor on these platforms
> and the mapping failed due to missing GPIO INTR region.
> 
> Keeping all platforms changes in single patch as it is identical and trivial.
> 


Please rebase on top of latest -next


-- 
Regards
Vignesh

