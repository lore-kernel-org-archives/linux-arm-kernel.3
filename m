Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49748CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCpr5TzyOFeRuqU82QBgsAybOuX0sXWBwEO+eHNweII=; b=iNIBgwuoa9WD6YxFeC6R5VgLoN
	EYnZRqfEu8imkfEf/bKLoSU7UL3kkUtBj8eh2/wpKCuJTw75lijetHo1S0DOV/EyiCm1ZuNgLwmbf
	x2CfQ/YxI/ECl2zAF90kejkQ0xnpiZW+Be8WWa2ShWhKhO/t4TmIibmmPf8SFGQ6ruMuji0cM8tVL
	UEDBwClQtxnwR0X/cqaRreFIO+a1TbtTcCcBylq93YrDS1X7AVBzgxEdEFy9wZvYun2ZkyZB9zuzO
	TfSvBZcz+NdAmtKXVvUZ1ej23XoEBC7N6kwLLWLcOgaG6mupYW9duT6yYtWxBv8IbuX68vuFZCVge
	8Q5losmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cYb-00000005ghN-11tF;
	Tue, 30 Sep 2025 15:46:25 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cYX-00000005geR-37vQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 15:46:23 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250930154613euoutp014b49312e3ceb3e480cfc18939f86aa42~qGfukt1bt3256932569euoutp01a
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 15:46:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250930154613euoutp014b49312e3ceb3e480cfc18939f86aa42~qGfukt1bt3256932569euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759247173;
	bh=iCpr5TzyOFeRuqU82QBgsAybOuX0sXWBwEO+eHNweII=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GEmo2aaV3Fhb+h0H+OL88S5Un3zCHcz7kvEcOruc4TmXpXvHdpKjLwI7cEBp7asMO
	 muCNuGSqnMlJSRFBKwmUe+kxce/c8fhUiZy+mBT4fvst9i7T4SLjLU0Jge/xzV09V9
	 trHRBO20Um+o+53qS3gt/u6DVrintZBeymx0x8lo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250930154612eucas1p2cf5b43435487dc8e6b19b60d1a3801ef~qGft4sFWT2800928009eucas1p2c;
	Tue, 30 Sep 2025 15:46:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250930154610eusmtip1200c7ebad2fc47c80d082b3f7ac27ab7~qGfryC8yB2715127151eusmtip1T;
	Tue, 30 Sep 2025 15:46:09 +0000 (GMT)
Message-ID: <75d06769-4896-4095-9969-03a517705196@samsung.com>
Date: Tue, 30 Sep 2025 17:46:09 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_08/29=5D_media=3A_mfc=3A_Add_Exynos?=
 =?UTF-8?Q?=E2=80=91MFC_driver_probe_support?=
To: Krzysztof Kozlowski <krzk@kernel.org>, Himanshu Dewangan
	<h.dewangan@samsung.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
	alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
	ih0206.lee@samsung.com, jehyung.lee@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930154612eucas1p2cf5b43435487dc8e6b19b60d1a3801ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9
X-EPHeader: CA
X-CMS-RootMailID: 20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9
References: <CGME20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9@epcas5p4.samsung.com>
	<20250930040348.3702923-1-h.dewangan@samsung.com>
	<20250930040348.3702923-9-h.dewangan@samsung.com>
	<CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_084622_045861_A293950F 
X-CRM114-Status: GOOD (  18.24  )
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

On 30.09.2025 07:54, Krzysztof Kozlowski wrote:
> On Tue, 30 Sept 2025 at 12:56, Himanshu Dewangan <h.dewangan@samsung.com> wrote:
>> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
>>
>> Introduce a new Kconfig entry VIDEO_EXYNOS_MFC for the Samsung
>> Exynos MFC driver that supports firmware version 13 and later.
>> Extend the top‑level Samsung platform Kconfig to disable the legacy
>> S5P‑MFC driver when its firmware version is > v12 and to select the
>> new Exynos‑MFC driver only when VIDEO_SAMSUNG_S5P_MFC is not enabled.
>>
>> Add exynos-mfc Kconfig and Makefile for probe functionality and creation
>> of decoder and encoder device files by registering the driver object
>> exynos_mfc.o and other relevant source files.
>>
>> Provide header files mfc_core_ops.h and mfc_rm.h containing core
>>    operation prototypes, resource‑manager helpers,
>>    and core‑selection utilities.
>>
>> Add a configurable option MFC_USE_COREDUMP to enable core‑dump
>> support for debugging MFC errors.
>>
>> These changes bring support for newer Exynos‑based MFC hardware,
>> cleanly separate it from the legacy S5P‑MFC driver, and lay the
>> groundwork for future feature development and debugging.
>>
> No, NAK. Existing driver is well tested and already used on newest
> Exynos SoC, so all this new driver is exactly how you should not work
> in upstream. You need to integrate into existing driver.
>
> Samsung received this review multiple times already.

Please don't be so categorical. The MFC hardware evolved quite a bit 
from the ancient times of S5PV210 SoC, when s5p-mfc driver was designed. 
The feature list of the new hardware hardly matches those and I really 
don't see the reason for forcing support for so different hardware in a 
single driver. Sometimes it is easier just to have 2 separate drivers if 
the common part is just the acronym in the hardware block name...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


