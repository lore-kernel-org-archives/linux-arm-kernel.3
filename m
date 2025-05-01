Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA93C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 08:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQ5Ffb5t0gvM5vO+W+AtPI2aP5E2bpsXI//twSWFqEI=; b=pDw02ox2tLx4y1+w07ya2wH96B
	IepfKSCoclY3c3mN4dPpKpNYx8d7OFwWMdQw3riRUN0u/nQjtKTNVVaiIu2/41xnl9EmK9m+rMyNk
	6IFTl1gKu/qrjrRLV+f1wgjeBMd8mr68ScEjkuM151EIAN26VGsQaRLylMD/Wjt1b9Pca5t5xBgYH
	A/ZWLjNThIXETklisSIEpgyHmmPEpLxulmY9K2TacLCnCj6Ns95fKmad+95jZu8oW+3GJVLsJQ/hR
	JYT0RqZcO4v1p4iIW3EHgsdBYcfAkXj+kse9d18Uf3VVTVHC9noX8GZMWq8NPk9Kcj4IH/u/jfPtf
	1P2Q5K4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAOvG-0000000F09t-3F1n;
	Thu, 01 May 2025 08:05:34 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAOtM-0000000Ezyf-45DT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 08:03:38 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5D21B25CCA;
	Thu,  1 May 2025 10:03:32 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nN5rKr4dkGB7; Thu,  1 May 2025 10:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746086611; bh=CapM8cFQ+34osfR/nGJn+yrSPaGS7Fi3qUNlij2E3TU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TPMOVxPpnvJbac+WIRnf5SfCs7yLNJnJUK/nnthIjQNNa/4XOsyTvx032ly3BLwhO
	 fXaXxSNf13jkS4M9YE+mDvAAYKCGp9mR7qK8/cQ71m5eNSmmIpFfGZDjerYbo5DwNf
	 6Pu9oPhPyl0R8H4YBiU6p5LOsjAQrbSvd6F9hSV9IvFzBW8DPnDakpfsnd/BqVu9Ka
	 8v+gMXaKuzLVeIaubS/8rfnU0goHq3/8BeGJDtdbSMmXAdSg7eHIR93jQ0WbrKGYUF
	 CSpbi0vXckfih6HRa1sykUZMkvqtCJzx0EHctVaJAvxqQszfcMQADD777SVAYs8nYH
	 nVAt/l5RRGgAw==
MIME-Version: 1.0
Date: Thu, 01 May 2025 08:03:31 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 0/5] Add support for the Exynos7870 SoC, along with
 three devices
In-Reply-To: <9362d6b4-890a-4364-8e51-71ad6fc1e107@kernel.org>
References: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
 <9362d6b4-890a-4364-8e51-71ad6fc1e107@kernel.org>
Message-ID: <ef733cebf014ef3dff1a0d780d289784@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_010337_435083_FF80FFD0 
X-CRM114-Status: GOOD (  12.07  )
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

On 2025-04-16 07:15, Krzysztof Kozlowski wrote:
> On 13/04/2025 20:58, Kaustabh Chakraborty wrote:
>> Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
>> announced in 2016. The chipset was found in several popular mid-range to
>> low-end Samsung phones, released within 2016 to 2019.
>> 
>> This patch series aims to add support for Exynos 7870, starting with the
>> most basic yet essential components such as CPU, GPU, clock controllers,
>> PMIC, pin controllers, etc.
>> 
>> Moreover, the series also adds support for three Exynos 7870 devices via
>> devicetree. The devices are:
>>  * Samsung Galaxy J7 Prime	- released 2016, codename on7xelte
>>  * Samsung Galaxy J6		- released 2018, codename j6lte
>>  * Samsung Galaxy A2 Core	- released 2019, codename a2corelte
>> 
>> Additional features implemented in this series include:
>>  * I2C	- touchscreen, IIO sensors, etc.
>>  * UART	- bluetooth and serial debugging
>>  * MMC	- eMMC, Wi-Fi SDIO, SDCard
>>  * USB	- micro-USB 2.0 interface
>> 
>> Build dependencies are in these sub-series:
>>  * pmu-clocks		A https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org/
> 
> So this patchset waits? Ping me or resend when your dependencies are
> merged. If resending then of course explain why and update dependencies
> list.

Hi, all dependencies are now available in next. I believe you should
be able to merge it now.

Thanks a lot!

> 
> Best regards,
> Krzysztof

