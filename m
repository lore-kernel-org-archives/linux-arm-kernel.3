Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B95E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TF2JYwQ3ddTmk2Tq1TIeZcuitoYPDB/Ua6PB/RP6p8U=; b=L1iCtt2s+3qpNsJAL43rr9+Ei/
	m+kXF6T88yEAA5D1HifQJSSllx6s1tMdG12aYwf4wuLD+tlEA0/ZYkuQggJA+wXkw4/mqZQBPAkzp
	1u7LpPlb9UOxAvc7Wk7VCOznN5LyPqv/SheU/rz3mbo8akJiO7/s6Sf6JItf6asyx9QWuCuh8HiPZ
	f9IjGsJEdOwN0/VzVnjTUaHkPVTSGf8whbxvtvFHCgOQ28bu3iJsEbo9tU0yvfRlF0El9KSGM4bkX
	9oVaiH6rksRRXi6dtRFV3Viw21QwqIkj/vDQlZ+68xG6vSckzcz4BRQ5DH/O97QSExxmUr/QY9mFl
	CgDmUX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdzb-0000000Cc6K-0khL;
	Fri, 03 Jan 2025 09:29:19 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdwu-0000000CbVI-2RTo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 09:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1735896383; x=1736501183; i=wahrenst@gmx.net;
	bh=TF2JYwQ3ddTmk2Tq1TIeZcuitoYPDB/Ua6PB/RP6p8U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bMhT5xHVHgsyex4rBWg+xYQIITaD0o4tVpEgdD3vEdV3bQIxwevPNa5/XcmN1Pbi
	 ORVzWPtgUes/Iy3Mihn0/eiRsRfEPe4TUGW2oQaBimR+auOUwF9ne+dzuqmwHvN/N
	 bg02DCWdZIjZr9tAP+5khGnlcpEiDfR1namcYiN1LhZwzWUoFrrvg1TUDF+goPYDy
	 Zyae/OmA+za/U4LNPAIFmEJnE/Y5RY69aiR4pGcWuyCvbA+M6eL+G8N64f66V21WL
	 YEoAfshWCF5nLfZkIsrvquYDKaqMzKPu9ryE4LPratsLAvMngBM56IX6nQ1J/CUqA
	 sh/6DxDRmZkqZ7FA2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.106] ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlw3N-1tt2vk2SPr-00duq9; Fri, 03
 Jan 2025 10:26:23 +0100
Message-ID: <2f67c714-bdc4-468c-a867-d77e8c61291c@gmx.net>
Date: Fri, 3 Jan 2025 10:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable pinctrl-based I2C mux
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20241217193356.111102-1-wahrenst@gmx.net>
 <20241217195010.GE23470@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20241217195010.GE23470@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Urki19SCIX3pBMW+oUQbJz3XWD1iGcYBDzjES7l857QkdOmwOg9
 mikMaS49pYwSrPa9VuHhsT9/VW9bPFqsGwyEDqp5WTCN8uvVcA/tJY/qefxGlFl2EB4o2Xm
 V6muqd/RnN7DkweuWj/8rYbb6ch0oBn3KACKtGlHAoAT97aCno6e9M0zqOk4e+I54McP1ie
 4UZjSQO6mC6mdqXVFoHDA==
UI-OutboundReport: notjunk:1;M01:P0:ifdn5oDJ2xI=;/ji1LLcFfsp1aHzt3+VI09KJJgJ
 6mY90jY4FJPaEMgW95QRW/EzYGvlid0KJJnVKmlzFa2qtWzgcxMab584qgqzIos+BWHoPdbdz
 1ODFh04jjNBn7iVxdFk7792yNXRwohTQT6jEStAX/EX10eGa43qEC2+38f0ajfCORckNsqMXD
 uUt5L6N095WutvH5xqHazlcXoPD3LEazA/XzHUAwDzQ8X7VvBLCMaOl4yyBzWv6ylWbPtcghH
 awvY9HWNxeaRwRBe2uxJAqgaxxDol+1gBkwSsINyBju3UR/j3QtRrPJQSI6WfL1QiuPMxCbef
 S2YKih+4kDxooCkNBZ7zevzDnD4/ZAyDs4nwFyBAe+KtimPMXqwiXrTUABo8mZopE721QLXFx
 fID/ZqvShHG52vbXAThFyaOlFh4QCPvIJ4V6n21BWaeJCrYCd+jmvOZOyxK9kIIHAxd7Sl8NZ
 WWqlefZawnY+WUCiYXpgDgMRIFP8qdnYObCsTBifAhbDxOtX9swpz7DWIVFmFuQFCnbuXLiEa
 YDbXKoI+i8a/IgIIiRSeqYUI3WlTvKgBf6goxtKcZx0nzjH6gXyCP8DP7/ul2jKuIaBlzNSjA
 lincK/JkGlxY0Ui7L11aqPpcklIbLu4qXMw7rznY59psnQ5wpv0OAvMJaoCAd3s5RKNcYbxDb
 BLyV2XzPW6/WI2RhwN2AaNOkttbLHteqA1GuB13K5cTs/dsf5KNzP2v0TIyjxbipCgwXFCexL
 80zdr+yJO1YnzPYIqaWD52Pc90O1gBtXq9baJXXL4ZzCPGhxnjYsDzZyOvo4OjpKpEyiMyKul
 m+1lJc5m34I8UcZ3Zxb4hqNI9Kq6L3aF0GDQ3BBr9rK65rvwFMhAR8l9Js9F6Gg6olztOLvgl
 4wrho688wMZtQc5E79ZQ/PBkUEMipETANsBhAeG84UJH8FQFIO0o1OIv0GHQBEFzpDl0XBxzS
 Z8+KEnIqOE/kN6eu3BCqcxxWeanzpTMwdGtIwxdscPRw/sPX/XCdlaAZWuJUTjyX7ysaVA1NI
 N9qIrGzAxHBvzY1u8YnkLmZxITCK3g1CYonr/mfD/1TUEfo8lwEfqXHb9FNDBITAqWqHUbscG
 RR9nT5cv0tNki3riBT9RxJz54xDOxb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_012632_987711_D93BC925 
X-CRM114-Status: UNSURE (   8.41  )
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

Hi Florian,

Am 17.12.24 um 20:50 schrieb Laurent Pinchart:
> On Tue, Dec 17, 2024 at 08:33:56PM +0100, Stefan Wahren wrote:
>> The commit 84b1d6cc3e4c ("ARM: dts: bcm2711-rpi: Add pinctrl-based
>> multiplexing for I2C0") introduced multiplexing for I2C on BCM2711-based
>> Raspberry Pi boards. Unfortunately we missed to enable the necessary
>> driver in the defconfig.
>>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Link: https://lore.kernel.org/linux-devicetree/961b3d43-b4c9-4573-82d7-844aa129d994@notapiano/
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
I wish you a happy new year. Do you plan to pick this up for 6.14?



