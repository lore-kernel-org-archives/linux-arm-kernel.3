Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8323ED116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 05:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OUggPqa+4n3ZAqjjz/lVWJkGP1fI2SKTJns/S57wDo=; b=B20uwS3phFqJZc5t1G5oU6SmKI
	AGUFRBKYgpvDEvuPXTnzqK+afxnJQVIKFA+KcxJzdTFOTg4yxxMlsrc1uLLFI9xOvQd6yPKOG+jFQ
	yH5/8CkCwN1ptZkPjWhRcGwrJ8dyNc+E22YUcw9cNqrhjb6cZX3LZfBDBMq5hnHmk1TyjFd/l8V4f
	gKR3cY2neEseKAecwTrfXlnawQn0FOlEyPMn708JGWCqT5Zh/Dja8RUGsqFU/ZYpfCg5ZyhtNtxpW
	6oH2bOOAAfNr9EeYrhv/ZNPke3GtCxOGFhGlLYnx2E50b8xaYlFpYvBdn93hWg3Nieo30f1Xzp9O/
	gSkTMfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOqqM-0000000HaZd-1sRo;
	Fri, 28 Nov 2025 05:16:30 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOqqJ-0000000HaXk-012S;
	Fri, 28 Nov 2025 05:16:28 +0000
X-QQ-mid: zesmtpip2t1764306931t09c9b483
X-QQ-Originating-IP: xUrhIoZX/6tn9sXRO/7GnvHddUx4UhJcB3arw2WWo4s=
Received: from [IPV6:240f:10b:7440:1:54db:6346 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 13:15:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11110066794902672146
Message-ID: <585D6D29DF1A6436+9b5db091-8d6e-42a5-ab8f-4b152f82ac54@radxa.com>
Date: Fri, 28 Nov 2025 14:15:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
To: Niklas Cassel <cassel@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20251111105100.869997-8-cassel@kernel.org>
 <mt7miqkipr4dvxemftq6octxqzauueln252ncrcwy6i2t7wfhi@jtwokeilhwsi>
 <aSRli_Mb6qoQ9TZO@ryzen>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <aSRli_Mb6qoQ9TZO@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NyuCELaSACDhe27yPH8syQNwE/GIHnbaQx/Li9kExZexeMyuifZGQPn4
	9TdY8w4ZjRG9BzBEe5dCYQ3LHFidtlda+DKxAQkNAOEP3vX9RM6PY1vEPcglZmf8j56neRI
	BERt6wzpgQV2RxE6lSJSulgwxD03/gpd9QDAcuvJXlkNIDrGalMzJKxy7fk0GL09/KYag6c
	4M/h6LDAZhUAky2BVxO0cGSAv4dhcz8u9pgwBi2DCdKouZDeYYKyaxuvO//ynRPTR9xanYU
	LzrIIiweLwOv7vu2zQypkOfi+p7R9U6qgk6hgsJCwopOxtFUOHu1dfZepFOz+ZKwyZRBXXg
	cTWgRD6P5+bDAN0djmcUjUMtk3qwKteZ4d7sqTM8WzfwHZfvYaQxfNsM6jYnNc1KseHwZOH
	xG0PTWMh/eMXV7sJ1Xv+OMgwEO6m952++WJh52Hf+IxNyjc/6uXkGBcYE9Vlh7UW4RkLD8S
	GYsGek5nz/kRPsL/D6RODK/q7XV3TQtKDHxIoZOXUGdFdwegLzSO8g/51Vla/ZvfgEX9Osu
	Zvg2aCSI20f1dbIxGBW90S3ZR0rAGHBkA3iryBxJCidz/zJYzgZlTLf8k8AeX8YK69FGZHN
	6cZlXtuFdxhDk39Bc+cPlj/ys9N7JbgOSgShs381y32ztj91+NUnToFUwN434/1hLD1QVD8
	3JyecM+fcw9PL/u9K9BoYOXgrdAH0vvsntBtLWu9GGSlcBu5h/NkHkFSCM6jkwWg0kFU5/s
	F1ymydk4xPNaBIZ5QPEucxmXaUX8CkW+7cqs5r+CAnDxmBXjmyu4jIXbSOYgVYj3lDuAOMj
	cf2GtaqD90WWxkMhxPIDDs2hQ0ERNpnIPWIQfLDqfuCaUfsfhiQ2+VQ0jGLam10Hqyu54gv
	rEwCoJpWTWIC6ANbO/2Dhq8B6CVE19wBk8jOkh2kGu+eM0t2muimT1647Va8gA0qCLJlH38
	2TFTnGJRfSZUQCsEn+NYw1xZEMTD/slJmkONIOnHIbC1nZ1K2xHHPLlfwKXqRN962erowAO
	51RGPNhaBHHhmai1qIteHMia+HIZA=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_211627_345968_FF4C703C 
X-CRM114-Status: GOOD (  16.49  )
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

Hi Niklas,

On 11/24/25 23:02, Niklas Cassel wrote:
> On Mon, Nov 24, 2025 at 06:07:44PM +0530, Manivannan Sadhasivam wrote:
>> While I suggested to revert the link up IRQ patch for rockchip earlier, I didn't
>> expect to drop the support for Qcom. The reason is, on Qcom SoCs, we have not
>> seen a case where people connect a random PCIe switch and saw failures. Most of
>> the Qcom usecases were around the M.2 and other proprietary connectors. There is
>> only one in-house PCIe switch that is being actively used in our products, but
>> so far, none of the bootloaders have turned them ON before kernel booting. So
>> kernel relies on the newly merged pwrctrl driver to do the job. Even though it
>> also suffers from the same resource allocation issue, this series won't help in
>> any way as pwrctrl core performs rescan after the switch power ON, and by that
>> time, it will be very late anyway.
>>
>> So I'm happy to take the rockhip patches from this series as they fix the real
>> issue that people have reported. But once the pwrctrl rework series gets merged,
>> and the rockchip drivers support them, we can bring back the reverted changes.
> 
> FUKAUMI Naoki, just to confirm:

Should I try
  "PCI: dwc: Make Link Up IRQ logic handle already powered on PCIe switches"
  https://lore.kernel.org/r/20251127134318.3655052-2-cassel@kernel.org

instead of below approaches/patches?

> Neither my suggested approach:
> https://lore.kernel.org/linux-pci/aRHdeVCY3rRmxe80@ryzen/
> 
> nor Shawn's suggested approach:
> https://lore.kernel.org/linux-pci/dc932773-af5b-4af7-a0d0-8cc72dfbd3c7@rock-chips.com/
> 
> worked for you?
> 
> 
> If so, I don't see many alternative but for Mani to apply patch 1 and
> patch 2 from this series.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Kind regards,
> Niklas
> 



