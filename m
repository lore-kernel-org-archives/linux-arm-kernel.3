Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73B5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+LOJ+gombIgGwG5VFHwn8O9GEmrVpqWrhBqWRMHkUM=; b=ElNM5nHtAmqR+VyueYOv79FSU7
	0HbE7hWgc2cZJb78ewS+1oXcbfftuoFe3Lj4V4Zzfi9KAiPWW9REtgV0PkCGnZei1v6ODvuNOoeeS
	Q/4Oeub/UH96BsilQvTleB2iSz68cgzjdcLVK6X2IgSBsgCPK4q/lIuz8bJxcTPqt+Pib7Lz9FDqN
	GndshTjulWdR6crQ7LtvEIefZMOOg/OK4/T70wBj6zcZwCPE3RXpAp6nyE7KenX90N+sdnD9R1DKa
	IJg2cc17QOmLZ1uPdeJslQ75nQ6vVTh7+rLozRZBQkwtMrp1V0PiLttND3cERAqckKyipYmloPm63
	sweX21yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGu9-0000000FutG-2O0t;
	Fri, 10 Jan 2025 15:26:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGQ9-0000000FkD7-1Tvp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 14:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i+LOJ+gombIgGwG5VFHwn8O9GEmrVpqWrhBqWRMHkUM=; b=foJPXGsGz5sQHP5NSj/pyeKGuO
	qWhtRuIsNz4qS0fcGZLj/91q5+OWhYzVwbu/gPg0Le72hun7rNt/gLtSGze9c4AaBB+ZV0SPKnX7+
	782ki6hnG1yiondcr9//Z+O3oCDsRF2n1GIwg7v5Khfv+cSxxJ82EzbmI6ORonHypoE9X4vmJIIXP
	eZ/xVSXB99t4tWeyx+vYRYLu6fv/oHXdGtdYR6jV8EKQwt0LCo15VLrKm0hNSY+IQtxG4u7Hdmohr
	9pINb7OMsdpwbqjEZJAgW6ocPfPZXiY3QibpEN+cLhHNhboWKrRyrETRMhK7N8LUV9JJjM5HYC/z9
	LtRAjDjw==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGQ6-00000009obc-08Pq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 14:55:32 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AE6K88025765;
	Fri, 10 Jan 2025 14:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=i+LOJ+
	gombIgGwG5VFHwn8O9GEmrVpqWrhBqWRMHkUM=; b=sHJqOdmcdSdrpGd8AuIzGY
	MFrQCvllj4hEkrUVomjNdrMT+xBN2JKilvHI3xqNhmNaTSXZrv2Jf/67zrtxlO17
	/9IfOB7Q2TyzoS/4o7fSV1L4xAoMF+O43A4xcKVf6El/c6OW5qEuc98VJ+JAZozR
	20BggKe62S5vv29Wl8tneuLygy/S6ZqbDegEI8afL1Z39BLErRcxlLTVHKJ2+djk
	k5c/9Cf1n0XRid31LU5DbyZkSsnpJt+FgVo/6dJ0FkR/v6zbM/OU96ZfyBf8jmqt
	QdDkDaoeAKjdCQsrG83rR169iVZ8mhAIjlEHZJ+BlCRMgCvsNGPd3MddN8V6xgfQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 443515078v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 14:54:52 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50AEspJG031187;
	Fri, 10 Jan 2025 14:54:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 443515078q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 14:54:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50ACiCwC003614;
	Fri, 10 Jan 2025 14:54:50 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfatjww2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 14:54:50 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50AEsnjp64291144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 14:54:50 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD0CD58059;
	Fri, 10 Jan 2025 14:54:49 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04AB158043;
	Fri, 10 Jan 2025 14:54:47 +0000 (GMT)
Received: from [9.61.139.65] (unknown [9.61.139.65])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jan 2025 14:54:46 +0000 (GMT)
Message-ID: <81567190-a683-4542-a530-0fb419f5f9be@linux.ibm.com>
Date: Fri, 10 Jan 2025 08:54:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuimhjog5Zue6KaGOiBbUEFUQ0ggdjIgMDUvMTBdIEFSTTog?=
 =?UTF-8?Q?dts=3A_aspeed=3A_system1=3A_Add_RGMII_support?=
To: Andrew Lunn <andrew@lunn.ch>, Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
        "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
        "edumazet@google.com" <edumazet@google.com>,
        "joel@jms.id.au"
 <joel@jms.id.au>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "minyard@acm.org" <minyard@acm.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
        "robh@kernel.org" <robh@kernel.org>
References: <SEYPR06MB5134CC0EBA73420A4B394A009D122@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
 <b2aec97b-63bc-44ed-9f6b-5052896bf350@linux.ibm.com>
 <59116067-0caa-4666-b8dc-9b3125a37e6f@lunn.ch>
 <SEYPR06MB51344BA59830265A083469489D132@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <8042c67c-04d3-41c0-9e88-8ce99839f70b@lunn.ch>
 <c0b653ea-3fe0-4bdb-9681-bf4e3ef1364a@linux.ibm.com>
 <c05c0476-c8bd-42f4-81da-7fe96e8e503b@lunn.ch>
 <SEYPR06MB5134A63DBE28AA1305967A0C9D1C2@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <9fbc6f4c-7263-4783-8d41-ac2abe27ba95@lunn.ch>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <9fbc6f4c-7263-4783-8d41-ac2abe27ba95@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yBxRhoVKtROkPwpLrEH_vSrRXZ8-RPmL
X-Proofpoint-ORIG-GUID: sRq5wnscmLN25EJIJ55u5_9qYeOUvOt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501100114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_145530_418743_7F797DCE 
X-CRM114-Status: GOOD (  34.41  )
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

Hello Andrew & Jacky,

On 1/10/25 08:04, Andrew Lunn wrote:
>> Agree. You are right. This part is used to create a gated clock.
>> We will configure these RGMII delay in bootloader like U-boot.
>> Therefore, here does not configure delay again.
>> Because AST2600 MAC1/2 RGMII delay setting in scu region is combined to one 32-bit register,
>> MAC3/4 is also. I will also use 'aliase' to get MAC index to set delay in scu.
>>
>> // aspeed-g6.dtsi
>> aliases {
>> 		..........
>> 		mac0 = &mac0;
>> 		mac1 = &mac1;
>> 		mac2 = &mac2;
>> 		mac4 = &mac3;
>> 	};
> I would avoid that, because they are under control of the DT
> developer. You sometimes seen the order changed in the hope of
> changing the interface names, rather than use a udev script, or
> systemd naming scheme.
>
> The physical address of each interface is well known and fixed? Are
> they the same for all ASTxxxx devices? I would hard code them into the
> driver to identify the instance.
>
> But first we need to fix what is broken with the existing DT phy-modes
> etc.
>
> What is the reset default of these SCU registers? 0? So we can tell if
> the bootloader has modified it and inserted a delay?

Jacky,

Here are the values on my system and those are expected that means 
u-boot is setting correct value?

# devmem 0x1E6E2340 32
0x9028A410
# devmem 0x1E6E2348 32
0x00410410
# devmem 0x1E6E234c 32
0x00410410

# devmem 0x1E6E2350 32
0x40104145
# devmem 0x1E6E2358 32
0x00104145
# devmem 0x1E6E235c 32
0x00104145

>
> What i think you need to do is during probe of the MAC driver, compare
> phy-mode and how the delays are configured in hardware. If the delays
> in hardware are 0, assume phy-mode is correct and use it. If the
> delays are not 0, compare them with phy-mode. If the delays and
> phy-mode agree, use them. If they disagree, assume phy-mode is wrong,
> issue a dev_warn() that the DT blob is out of date, and modify
> phy-mode to match the delays in the hardware, including a good
> explanation of what is going on in the commit message to help those
> with out of tree DT files. And then patch all the in tree DT files to
> use the correct phy-mode.

Andrew,

Do we need updates on this description. It doesn't talk about external 
PCB level delays?

https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L77-L90

This is what you explained:

MAC driver reads following phy-mode from device tree. 95% of mac driver 
directly
  pass it to PHY through phy_connect.

rgmii - PCB has long clock lines so delay is added by PCB
         On this mode PHY does nothing.
rgmii-id - PCB doesn't add delay. Either MAC or PHY needs to add the delay
            Add delays in both directions. Some PHY may not add delay in 
that
            case MAC needs to add the delay mask rgmii-id to rgmii.
rgmii-rxid - If there is an extra long TX clock line, but not RX clock,
              you would use rgmii-rxid
rgmii-txid - When there is an extra long RX clock line on the PCB, but not
              the TX clock line, you would use rgmii-txid

Regards,

Ninad

>
> Please double check my logic, just to make sure it is correct. If i
> have it correct, it should be backwards compatible. The one feature
> you loose out on is when the bootloader sets the wrong delays and you
> want phy-mode to actually override it.
>
> When AST2700 comes along, you can skip all this, get it right from the
> start and not need this workaround.
>
> 	Andrew
>

