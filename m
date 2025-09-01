Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A0ECA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cM/Eb/zYRQtpmXVh1mowJsQxkbwkg9juaU7jUzz+Fo=; b=TpYVXYpf7DdAqdVWrX1QKZFPDv
	c8DuW0uYXYgSOHm0Pki9auQL9OphcdHYYj7KvSWH/J/CLYYeo1oSRmiyPMNgL+DW7Mnnk1rN7yXZl
	ojB2sdnCc0GC9PDR+6y84iyWnLo7qEuAtVjj+easKIlFEt4HKtjzqa2mOUvAn8KR02MfnQs5bU7M7
	7y5qzmBpQthEjk3JAZWpJIKYGUysYgY7yYzHkluwAz9ajFy6o/tWmdhRQcvU/hGUrbm1AU9V8OQK8
	omMaQOcte9+PjhrH/fWtnCkv1VTkJN6gi8KqbWiCRITwSv9JuCBNBN7QHZzm2trF27fVQvXFE41YA
	ANLRvdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut02u-0000000BbVj-2opq;
	Mon, 01 Sep 2025 08:37:48 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszay-0000000BXMr-0aAs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:08:57 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58188pCQ2327447;
	Mon, 1 Sep 2025 03:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756714131;
	bh=6cM/Eb/zYRQtpmXVh1mowJsQxkbwkg9juaU7jUzz+Fo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bI2mHmKhuTOB1xH1UTA2uufhRkvs4mJZnaOUOiBKF7VKBUnW2g48bsIusZLu0pf6B
	 KO/IWggKRbQ5UecATekgaDZWROFiTu+NFWK/vENmds4Ftf+ZLa2yGTwjgW+xMVsVS9
	 FXtWx/8Z9al+giT1Sgx2hHCzEyK0cUL+ZGrn7Yrg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58188pYT1398511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 03:08:51 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 03:08:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 03:08:50 -0500
Received: from [172.24.231.157] (hp-z2-tower.dhcp.ti.com [172.24.231.157])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58188lWl1864683;
	Mon, 1 Sep 2025 03:08:48 -0500
Message-ID: <25f630c5-8692-4063-9bfc-9f805fd3d3a1@ti.com>
Date: Mon, 1 Sep 2025 13:38:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: ti: Add bootph-all tag to USB PHY
 controllers
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>
References: <20250829074700.1531562-1-h-salunke@ti.com>
 <20250829120347.v2mhce4tntnewrm7@mushy>
Content-Language: en-US
From: Hrushikesh Salunke <h-salunke@ti.com>
In-Reply-To: <20250829120347.v2mhce4tntnewrm7@mushy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_010856_346135_60844FD5 
X-CRM114-Status: GOOD (  13.20  )
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



On 29/08/25 17:33, Nishanth Menon wrote:
> On 13:16-20250829, Hrushikesh Salunke wrote:
>> This patch series adds the bootph-all property to USB0 PHY controller
>> nodes across multiple TI SoCs (AM62, AM62A, AM62P, J722S).
>>
>> The bootph-all tag ensures that these USB PHY controller nodes are
>> available during all boot phases, which is required for USB DFU
>> (Device Firmware Upgrade) boot functionality.
>>
>> This series is based on commit:
>> 8cd53fb40a30 Add linux-next specific files for 20250828
>>
>> Hrushikesh Salunke (3):
>>    arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add bootph-all tag to
>>      usb0-phy-ctrl node
>>    arm64: dts: ti: k3-am62-wakeup: Add bootph-all tag to usb0-phy-ctrl
>>      node
>>    arm64: dts: ti: k3-am62a-wakeup: Add bootph-all tag to usb0-phy-ctrl
>>      node
>>
>>   arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi               | 1 +
>>   arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi              | 1 +
>>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi | 1 +
>>   3 files changed, 3 insertions(+)
>>
>> -- 
>> 2.34.1
>>
> 
> NAK! please do this for the boards that need this capability. bootph
> property at SoC dtsi level are mandatory components for ALL bootmodes
> and all boards.
> 

Thanks for the feedback. As suggested, I will update the patch series to
ensure "bootph-all" property is added only to those board specific dts
files which actually need it rather than the common SoC level dtsi
files.

Regards,
Hrushikesh.

