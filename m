Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37553C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DabvRdYFWGduGnW6eb29i9SQxqUOvxHEet2tbUqVCSU=; b=TgnSeLZec+4848p2QjDjXU51nQ
	J97Oe9KgM94jTzuU7HdM2JzTckS8G1cuINk87qZH0vMCPE758VGuYScBCa1oCsafKKSdNnGuvEi6d
	28n3vStmadEmvGB8eQXmaG+Wjs07mUukZ5jDgblWqVzYsZrRAi8Du+mqYnXYX+L/RJYWBoVyk2NAq
	r5IHFutKXgaDHYzPmF/CHvXP9LTCWYovr7sa2CjHSvf5GiM/6fV2O4/1V1x0OWCpDXjtqTdJW4SuX
	KPswVWFVersR63emhcclc2xn7f8rxo0ocQ8MhARIm/bplC+xkt6OnlUVw6vUjEdoc66QmIUtLC7Lp
	8q1twcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eL0-00000008Xjj-1g9Q;
	Tue, 29 Apr 2025 06:21:02 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eJ2-00000008XFA-3Kif
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:19:03 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53T6IZbb3603302
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 01:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745907515;
	bh=DabvRdYFWGduGnW6eb29i9SQxqUOvxHEet2tbUqVCSU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PV9bzNe75ccEsbtETXF8C6hyk2cn4dKQVf4Q45xzanGRw3kWUO36g+BoLsQPe7b3Z
	 e0hjn7fT/RWZQiJyezcDVK0rkZk2fv8KO7fsY+j4kG78p9I/wbaEgmUECVLR3NNJI1
	 g+oU+8Lpn2jHOn2eM1TRUW/Q6sNMkGN3XDdlyJGk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53T6IZVe099945
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 01:18:35 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 01:18:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 01:18:35 -0500
Received: from [172.24.19.207] (lt9560gk3.dhcp.ti.com [172.24.19.207])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53T6ITaV009260;
	Tue, 29 Apr 2025 01:18:30 -0500
Message-ID: <5a5584be-670c-46f1-a66a-3b95ef81cf1c@ti.com>
Date: Tue, 29 Apr 2025 11:48:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH] arm64: defconfig: Enable XDP socket
 support for high-performance networking
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <quic_tdas@quicinc.com>,
        <nfraprado@collabora.com>, <arnd@arndb.de>, <lumag@kernel.org>,
        <geert+renesas@glider.be>, <bjorn.andersson@oss.qualcomm.com>,
        <will@kernel.org>, <catalin.marinas@arm.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250428121025.246119-1-m-malladi@ti.com>
 <1df9b47a-d20e-4755-9b30-75d8ff150551@linaro.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <1df9b47a-d20e-4755-9b30-75d8ff150551@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_231900_986704_58CB367E 
X-CRM114-Status: GOOD (  13.54  )
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

Hi Krzysztof,

On 4/28/2025 6:18 PM, Krzysztof Kozlowski wrote:
> On 28/04/2025 14: 10, Meghana Malladi wrote: > From: MD Danish Anwar 
> <danishanwar@ ti. com> > > Enable CONFIG_XDP_SOCKETS to allow for 
> eXpress Data Path (XDP) socket > support specifically on TI SoC 
> platforms such as the AM64x
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> updqN51OXC2bwCXOvJOJf0uHOQ4u3JTTnIdRY_6gd786E07eEGpwtXIyCGLsDPJV6_rRmpwjb3dBOwY_bDAu4CiUT0pGPU8$>
> ZjQcmQRYFpfptBannerEnd
> 
> On 28/04/2025 14:10, Meghana Malladi wrote:
>> From: MD Danish Anwar <danishanwar@ti.com>
>> 
>> Enable CONFIG_XDP_SOCKETS to allow for eXpress Data Path (XDP) socket
>> support specifically on TI SoC platforms such as the AM64x and AM65x.
>> This enables the use of XDP sockets for high-performance, low-latency
>> networking applications, allowing for efficient processing of network
>> packets and improved overall system performance.
> 
> High performance, low-latency network applications do not use defconfig.
> That's a development config.
> 

Oh got it, will drop upstreaming this patch then. Thanks.

> Best regards,
> Krzysztof
> 

-- 
Thanks,
Meghana Malladi


