Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CDEE77199
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AldtL0vIimc22sbNsqvIOxcuxMNVL4re4FHw05kxe60=; b=cTOYx73cw13XOwflbGSddqRpUE
	MfCWaMc+HTRiZRvR4qIn0Jyf/8waKdto2CS81CmSrjM4j0IQmgcat5fmmaEKkQpj805lyb2bMVDoS
	WbYtaKaYuYQ/pXHvIclrb+IeyrWzjzF+CSYaB4c6yVDFeH8tzYet1Iozb1/OtXq64sGxxOut/bwsb
	4bEpXhskxBd2TXrxK+FkL2+sBwPuBiPEz3SLfjVm8lObl3A7aZ+q71+X+YSVGxh2WqsZjAORZD1QQ
	7J0MgkXCv4plVwUfHwaeHv7X9HKP/M4CPn0pAtvVjJCICOZ65fDT0RlypSAaqigKJv3F1pOdS2thg
	MpNc+F9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnj7-00000001V22-2OCf;
	Mon, 06 Jan 2025 14:05:05 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnf4-00000001UAG-2YQh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:00:55 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506Cn9Ul002226;
	Mon, 6 Jan 2025 15:00:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	AldtL0vIimc22sbNsqvIOxcuxMNVL4re4FHw05kxe60=; b=Tn1ftUbXZ8g3ldk6
	awUFDDyLy4nQk40i8/8SB/Wcwha8F9e2DEmOBf14ICeyLCsrmQ87UqJm48MMmd2g
	4MUKKqeBkzT+GK6kP1v6HSnVCOdTNLEooMQbpd1PncYLftu3vLNDrUvfSeAi7CTj
	/Kf1sYIN4/7NErFOPGVcYReESirOyZzxkT2fJ7ekBSCStH28iaVc18D87jE/MyBB
	bWzQ24WEUUPJYSJvLsPBUvoj4uhrBTP8aROp+4+MzVjQsDcXW6fidZwwS+VW38Rw
	pp59wNtHyt0O8WnH5rh2EY92rO4cky0lGNdMbhl7SLbcAseHrK1J28opQQH7uOe4
	LGunqg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ygtmm9gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 15:00:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9BFDF40048;
	Mon,  6 Jan 2025 14:59:28 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 336FE27607A;
	Mon,  6 Jan 2025 14:58:31 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 14:58:30 +0100
Message-ID: <c7afa129-5938-4c5b-9e77-97c67ca2ff96@foss.st.com>
Date: Mon, 6 Jan 2025 14:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ARM: config: stm32: Remove useless flags
To: Arnd Bergmann <arnd@arndb.de>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Petr Mladek <pmladek@suse.com>, Yoann
 Congal <yoann.congal@smile.fr>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <soc@kernel.org>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
 <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_060054_937715_21003803 
X-CRM114-Status: GOOD (  12.57  )
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

Hi Arnd

On 12/20/24 17:47, Arnd Bergmann wrote:
> On Fri, Dec 20, 2024, at 13:55, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Running "make savedefconfig" highlights that some flags are no more used,
>> remove them.
>> Remove some flags to reduce the kernel image size as STM32 MCU's board
>> embeds low amount of RAM.
>>
>> Changes in V2:
>>    _ squash patches 2-7
>>    _ split patch 1 in three parts and add epxlanations about flags removal.
> 
> Looks good to me, thanks for the update. I assume the plan is to
> have this in another pull request rather than me picking up the
> patches directly, right?

I don't plan to send a second round so you can take it directly.

Thanks
Alex

> 
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

