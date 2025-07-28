Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6637FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyHnFzhHfGPVWYtWBHmq/4Wb5XjJqFHdWikvdnddpqs=; b=ysBgdHdZ5JdoEFD6ATduSrFbAV
	+t2GCAR5baOSMxha/f50/rAG5ExRK+9wEtU32kobFUd0jYGT7zmw97O0BIIVAQVgp4v8hsu2AENvp
	6OxniGybOdSlsxP9acLJ/wrjVqvr3Ey6NrYdS0Tq2OArDL41vGE5/5qxcJ1dYcVECxjJtz+jLAKoO
	rO3sg72mwnVSvTTwOa1Hp5TXgMv4fC/iurJEOc5cpxWyVwvX3FKhgiCMWSb7ZC2+Zw0dT/MbWCraa
	1BXXDTGoGBHhb+5FVIOEb/WXghaBAALUCLRTFR2yNb5Q+z+9W6rn09PQQRXF3zrsqCbVSqRbeptpw
	0gH3R0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRXj-0000000F5e6-1QT3;
	Mon, 28 Jul 2025 17:21:43 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQYf-0000000ExQY-00dJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 16:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1753719516;
 bh=YyHnFzhHfGPVWYtWBHmq/4Wb5XjJqFHdWikvdnddpqs=;
 b=WaQKzh3hOSXdXdy5mQgnvyjJb0Na4DnOT1Wz3QITFXm88IPAvrmFyp079cdykUeDZUrRtjVJx
 ZSENRiJNdjJYe4JXICI05YwRKHO9kT+5OVG4ZHd3+dyWRSPLh1VLm8AGfn8s2fBXl40MEV8sH+u
 SVclwYB+Wy90wVx5pyFEBtaxN9ACi9sWvA/1KIzhKRgKL45vOnseXPB2SGTlrPHqdjS2XIIVzSR
 HYpB6ilfBisjD8xYkBrf8iabN/AeVxx7qzKl/kH8QA9DZ9KtKJCGiDzGrTuXPpP2OzCIp0xZO1v
 OlvspV4AuAzSXANiqfp5KQPC4+2AYEmKyAeL2hURatyQ==
X-Forward-Email-ID: 6887a2d9351ec66b15a23cb7
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.8
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <bd253ee7-742b-4fdb-8ce2-4976d4578a3a@kwiboo.se>
Date: Mon, 28 Jul 2025 18:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Add SFC node for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "ziyao@disroot.org" <ziyao@disroot.org>
References: <20250727144409.327740-2-jonas@kwiboo.se>
 <20250728070038.174726-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250728070038.174726-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_091837_132991_95A47B2B 
X-CRM114-Status: GOOD (  10.36  )
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

Hi Chukun,

On 7/28/2025 9:00 AM, Chukun Pan wrote:
> Hi,
> 
>> +		sfc: spi@ffc00000 {
>> +			compatible = "rockchip,sfc";
>> +			reg = <0x0 0xffc00000 0x0 0x4000>;
>> +			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
>> +			clock-names = "clk_sfc", "hclk_sfc";
> 
> The clock* should be placed before interrupts.

Thanks for catching this, will fix in v2.

> BTW, doesn't the sfc node need to configure pinctrl?

Not sure if it make sense to have a default here. fspi_pins is most
likely always used, however fspi_csn0 and/or fspi_csn1 is probably board
specific.

On the Radxa E24C only fspi_csn0 and fspi_pins are used.

Regards,
Jonas

> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 
> 


