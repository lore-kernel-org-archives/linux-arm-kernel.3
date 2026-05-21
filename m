Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FC4CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeSvtGBh4cwVUpcf4H5O9Hv1BHhD0wSQKZJns6/kAy4=; b=EF90kGJAVTXl9Gl8uaMbrf7gO1
	QEMuM5eMmBrRnMOfCJDHDT0vWl1X6jmKHvj0YMzM89TX5ktS9WggRAd2CaVIdoxLIokGKbMnJsjYs
	9pWnVTTIJqWxnH/RrdY/0PrScnP9ekst+BgEvKx96Dn32j4pxlEELxrye7z+z4zRzWoUT4MID8biv
	rEp8NKbX1RewhNT1HoxKKB38OMcVbFlYdRcFvApNghRSD6ZQDq2Oy2KJSp8Yrs71a6iombBgL9VUY
	B1Bjv21ekIMQY1jeq9bzR9JDMZk9y5lyP3HMAPtszmN6BEa41EACJvbCHDXl5nmJ8CY50g+cCtAQ7
	V3N3qoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ021-00000007MtH-1Xg1;
	Thu, 21 May 2026 09:49:33 +0000
Received: from smtp1.tecnico.ulisboa.pt ([2001:690:2100:1::15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ01y-00000007MsG-3Nh7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:49:32 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id F16D960020E3;
	Thu, 21 May 2026 10:49:26 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id VaVwv1Ns4UOO; Thu, 21 May 2026 10:49:25 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D651360020D7;
	Thu, 21 May 2026 10:49:24 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1779356964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KeSvtGBh4cwVUpcf4H5O9Hv1BHhD0wSQKZJns6/kAy4=;
	b=latHICr6zRUQSjfkSaydTbcYJ+bX+E3GXuhr7oNHQ7G4NNFDFTj1Ebi9ASn7jW8o9Ed9AN
	xvppIpjSU6pKo75lQgfoIpJjX2Kr3qgn0+0+iJ8AIhmQ4Osu9UDyIxozaPZOteHVU31/qk
	DereUVugwzHiyCJpVBUrMJO3g/fwNXLBWELozd1tOEgARjmChQWywLp0Z/ULrBjKVRSePy
	YUms/kjWzEqnDqY/J1ge646Ye5uhL1OxDnPr/etG/X0uBT6QsrPeu1ZgP/1SWC4B1wAVNc
	mlxsGIuMvINX0lAAMRRZXOmSW1GIUn/calPcLkN1KiSy0Re7mRz4CBSA93Vcvg==
Received: from [192.168.96.1] (unknown [89.214.153.114])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 10C613600A2;
	Thu, 21 May 2026 10:49:21 +0100 (WEST)
Message-ID: <2dceac0d-8a1f-440b-ad9c-cff14a9a56f5@tecnico.ulisboa.pt>
Date: Thu, 21 May 2026 11:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on
 Pixel C
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>
 <ag65LXrLLbbeTbTb@orome>
 <367bb557-81a0-4286-8788-0e7272cc4d02@tecnico.ulisboa.pt>
 <ag7TenB3GrdLABuk@orome>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <ag7TenB3GrdLABuk@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024930_984786_C215AFD1 
X-CRM114-Status: GOOD (  14.75  )
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



On 5/21/26 11:43, Thierry Reding wrote:
> On Thu, May 21, 2026 at 11:23:11AM +0200, Diogo Ivo wrote:
>>
>>
>> On 5/21/26 09:52, Thierry Reding wrote:
>>> On Thu, May 14, 2026 at 04:47:21PM +0200, Diogo Ivo wrote:
>>>> On Pixel C, shutdown must be handled by the MAX77620 PMIC rather
>>>> than the PSCI SYSTEM_OFF call, whose firmware implementation is:
>>>>
>>>> __dead2 void tegra_system_off(void)
>>>> {
>>>>           ERROR("Tegra System Off: operation not handled.\n");
>>>>           panic();
>>>> }
>>>
>>> Ugh... sounds very familiar. We have similar stub implementations on
>>> Jetson TX1 and/or Nano, if I remember correctly. Luckily newer platforms
>>> seem to have proper implementations for these.
>>
>> Yes, on my TX1 I was encountering the same problem. However in that case
>> is it possible to update the firmware with a proper implementation?
> 
> I tried, but there were complications, both technical and logistical
> because of the point in the product lifecycle. At this point I don't
> think it will happen, unfortunately.

Ah, I see. Then in that case this approach seems like a viable option
for those platforms :)

Best regards,
Diogo

> Thierry

