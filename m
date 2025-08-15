Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4DECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O75TYoFU3l7SB9+dU+2ksxp5t72icv8nAZmtyfMyoio=; b=YYU5J0y7d6Rs9B6Yp9dbLStsdU
	b8nAqFPfXxGeVpijTO/QeskdPcrqb7R3G/LJ+rYqzMrfrejol8qb/SETUnaiULv9qOSLsLXY9R+xN
	7jxkmpPisat0up1b1bfgnqN+pMw2o7+FJAAiBxeVEfDQ4tmVtfCx6DIwVSjrcXR6DNqglb7qkG6iV
	/nzcMp9UVN+tAUpv+5q4FJHLoCQt38C0FyovdbGHxdggTH5wVMBVTzQ84xpxxU9jcVzoa2sOmQiE4
	Ea6c82YQKYdo0EJiMpj2G81Ave6MwydYTKMrhMbzbkuG2sRFE3B00ZX+XrxGPHvyy+DvyH8iBnudl
	KKjcoWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwTh-00000002r0q-3jQo;
	Fri, 15 Aug 2025 15:36:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umu4T-00000002Wcj-1Hdm
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 Aug 2025 13:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=O75TYoFU3l7SB9+dU+2ksxp5t72icv8nAZmtyfMyoio=; b=W5WtC6vrem4RBB2l3JA56SZGTZ
	qtl0pyCzIqX3+bjjANRrEu+UVHs4ZYt4ed9eb0qClhJddZYbAL17aFAcwYW3VTAjWXNuq0VYNrwzC
	Wp7X25pVy42beWXS19hX8AkXEGZpqcuvZwQcP85unS+FY2ZB037ZfWrbUFkEjPck/IJCN+DBJiwRk
	seggBGnvYmr1BuUMyWDe+Iup397qAoge5tBmFG4RZcQ4w1Zqz/Tl/lvkb7+/i0Zjb87XicdDEwykZ
	ElGTXfU0oxaihU4Nt+w9or6iSlW9+IFiVQtlcigaUfYqfwq8rsmlxHJ87Xt4ie7DzIbWdwcJHQ1Q2
	ffxJv0fA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umu4P-0000000GiFB-09Pb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 13:02:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 853EE1691;
	Fri, 15 Aug 2025 06:01:58 -0700 (PDT)
Received: from [10.57.1.201] (unknown [10.57.1.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E7183F5A1;
	Fri, 15 Aug 2025 06:00:11 -0700 (PDT)
Message-ID: <995e093f-7b6c-4701-87af-2f4d21b08ada@arm.com>
Date: Fri, 15 Aug 2025 13:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
To: Koichi Okuno <fj2767dz@fujitsu.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Gowthami Thiagarajan <gthiagarajan@marvell.com>,
 Linu Cherian <lcherian@marvell.com>, linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250815034751.3726963-1-fj2767dz@fujitsu.com>
 <20250815034751.3726963-3-fj2767dz@fujitsu.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250815034751.3726963-3-fj2767dz@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_140209_439191_EC258EEC 
X-CRM114-Status: GOOD (  13.79  )
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

On 2025-08-15 4:47 am, Koichi Okuno wrote:
> This adds a new dynamic PMU to the Perf Events framework to program and
> control the Uncore PCI PMUs in Fujitsu chips.
> 
> This driver was created with reference to drivers/perf/qcom_l3_pmu.c.
> 
> This driver exports formatting and event information to sysfs so it can
> be used by the perf user space tools with the syntaxes:
> 
> perf stat -e pci_iod0_pci0/ea-pci/ ls
> perf stat -e pci_iod0_pci0/event=0x80/ ls
> 
> FUJITSU-MONAKA PMU Events Specification v1.1 URL:
> https://github.com/fujitsu/FUJITSU-MONAKA
> 
> Signed-off-by: Koichi Okuno <fj2767dz@fujitsu.com>
> ---
>   .../admin-guide/perf/fujitsu_pci_pmu.rst      |  50 ++
>   Documentation/admin-guide/perf/index.rst      |   1 +
>   drivers/perf/Kconfig                          |   9 +
>   drivers/perf/Makefile                         |   1 +
>   drivers/perf/fujitsu_pci_pmu.c                | 536 ++++++++++++++++++

 From a quick side-by-side skim, this is a copy-paste of the exact same 
driver from patch #1 with s/mac/pci/g applied. Please don't do that. If 
the hardware is functionally the same, then it should just be a single 
driver that can then pick which PMU name and set of event alias 
attributes to use for a given instance based on the ACPI HID match 
(and/or any other ID register info you may have.)

Thanks,
Robin.

