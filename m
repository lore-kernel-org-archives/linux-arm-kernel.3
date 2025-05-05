Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652E9C3ABBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pN/hJ2/tR8aIxvF43AzkTdJbZKN49d7SnCAQeO3ZtQg=; b=LqOvRjOcnhooAprYd+3O9fN+PY
	YdIpnzeZoxzuV8mckRyncqDLosJxK5tAJjD6RI459yNcFqyb53hpMYAS2hZclYGxxO5OwpmwQFkdo
	CMmx1kRI6F0qAP2b7+qJs+pJoI7oIzuosgOFi+NPCowH/hFgZ+1AF05VaYeSzil0T88+lpFfPu8v3
	P8Qhw6t5YQdwHL3x78BkDLxFTPcPCyzBt3MiL7LMv+2iyDk7PCaYKRkM9k5lY/td/Zfprha7iLIKg
	TIHF9RwxxG+7QNPgOWsAvUNCzoPbCv0f+260YUarPAwIN7RHB0PiEyAphjIKt4HpRBTNnEqJRVn1A
	To/1sVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvki-00000007S00-19LC;
	Mon, 05 May 2025 13:21:00 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvKI-00000007OrQ-279k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:53:43 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545CrUAs224792
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746449611;
	bh=pN/hJ2/tR8aIxvF43AzkTdJbZKN49d7SnCAQeO3ZtQg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GXsQryc0gX0twUQHUcGdrIE0WENDfK0kglBO5GJNoCUcQQTVvLFBrKGggKfNiHUNt
	 zK6aJl5Wsek/yogbV7WR9joSBNd8/YRihig78uw+b7gR4syz91G8t7ixQd+uLIR971
	 Fhfl+udKKl5Fdi2vFVbn/YlaaZznRtOOzTH65yho=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545CrUCE051150
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 07:53:30 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 07:53:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 07:53:30 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545CrQBW013511;
	Mon, 5 May 2025 07:53:27 -0500
Message-ID: <5d2aa775-a374-419f-b800-e1db96986660@ti.com>
Date: Mon, 5 May 2025 18:23:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1
 on J721E
To: Nishanth Menon <nm@ti.com>, Prasanth Babu Mantena <p-mantena@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250505112731.2515734-1-p-mantena@ti.com>
 <20250505123832.shukji5gfx3erjdq@lustiness>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250505123832.shukji5gfx3erjdq@lustiness>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_055342_600505_3E3B3D9D 
X-CRM114-Status: GOOD (  10.91  )
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

Hi Prasanth

On 5/5/2025 6:08 PM, Nishanth Menon wrote:
> On 16:57-20250505, Prasanth Babu Mantena wrote:
>> J721E SoM has MT25QU512AB Serial NOR flash connected to
>> OSPI1 controller. Enable ospi1 node in device tree.
>>
>> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
>> ---
>> Test log : https://gist.github.com/PrasanthBabuMantena/9dda540dce88282117de7e0e945e24ca
>>   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
>> index e3d0ef6913b2..3112b351c052 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
>> @@ -571,6 +571,7 @@ &usb1 {
>>   };
>>   
>>   &ospi1 {
>> +	status = "okay";
> Follow Documentation/devicetree/bindings/dts-coding-style.rst

Also, please use Fixes tag

Fixes: cb27354b38f3b ("arm64: dts: ti: k3-j721e: Add DT nodes for few 
peripherials"


>
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
>>   
>> -- 
>> 2.34.1
>>

