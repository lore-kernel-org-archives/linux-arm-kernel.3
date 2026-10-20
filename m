Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ABA606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 05:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NrouShOr;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dYEGJLl/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBaqtAYhzt9vjT0IOaJ3LEbjNlh/6yFmqmAUZP/n84g=; b=NrouShOrHjPGpjwuremcWs6cs8
	JICrixfkScr6iZPNrYJM2z4yCyUWGB7Pc0gUjGQgm72khkZI1BMZy3KNZGykaZ7F4paWT4hXzZuAv
	fIizEkerAEOeaiNV0TXzgqXf7jjL92VxbcdnCO5wMBnezB+8iAAzzboJpuz6mk/L+EVa24Jo0a8MF
	J1/O/AXJf53IKB6Pd4X9PjePrtqlmfAZA4U7ZDWTzLL3DvsVEvffioxhuD6tv9uf+GMllzu/YlXY4
	bLJ9lTjsbaY+n7zMg9EF2H+ypj9J7pWy8w1//8eGhjYjbq/hR7sTcR1VfYclgdzYHaA+shihmIluX
	rxXayfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2NC-00000008s48-0BvC;
	Tue, 20 Oct 2026 05:26:54 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2N9-00000008s3G-0HC8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 05:26:53 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261020052641epoutp027c14d9d08e8d5d61de28b5627261c25e~gJZuEVdFd0201702017epoutp02X
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 05:26:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261020052641epoutp027c14d9d08e8d5d61de28b5627261c25e~gJZuEVdFd0201702017epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792474001;
	bh=VBaqtAYhzt9vjT0IOaJ3LEbjNlh/6yFmqmAUZP/n84g=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=dYEGJLl/XaI8YLA9R+Ob8BLNL4Oe4NEqVu0yZo7lPIWNUon5CtaJa5P+ABxEeLhKV
	 RdokE3KZAgTDw4/1+B9Sq4zlulMxapQI/9OppFOFp4VWgAJIEdR+igm+327fNAyrrt
	 qJWhR/yoLNGDAg38FHqOgluaTODXTEdRRGI7VbQ0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261020052640epcas5p27161ada23d6deba25cb84e6fcb0165b0~gJZtBVh9C2585725857epcas5p2s;
	Tue, 20 Oct 2026 05:26:40 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4j819q3JvDz2SSKb; Tue, 20 Oct
	2026 05:26:39 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261020052638epcas5p18ff9bffbddf4c8f106a4669f4810370f~gJZrnNRuA1711217112epcas5p1J;
	Tue, 20 Oct 2026 05:26:38 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020052635epsmtip1b24d9cf98f9333c343d2bf34c031fda5~gJZoqwYIG2871028710epsmtip1g;
	Tue, 20 Oct 2026 05:26:35 +0000 (GMT)
Message-ID: <40a922b9-f56f-4fe1-88f5-5bb236735951@samsung.com>
Date: Tue, 20 Oct 2026 10:56:34 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk@kernel.org,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, pritam.sutar@samsung.com,
	andre.draszik@linaro.org, kernel@lvkasz.us, pengpeng@iscas.ac.cn,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <as0G-bk_TKRToOkv@debian>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020052638epcas5p18ff9bffbddf4c8f106a4669f4810370f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260918103249epcas5p49c9b4bf6fd60c28f5f09f0b7b69828b6
References: <CGME20260918103249epcas5p49c9b4bf6fd60c28f5f09f0b7b69828b6@epcas5p4.samsung.com>
	<20260918103147.2628614-1-selvarasu.g@samsung.com> <as0G-bk_TKRToOkv@debian>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_222651_438287_4948086E 
X-CRM114-Status: GOOD (  16.37  )
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/12/2026 9:44 PM, Manivannan Sadhasivam wrote:
> On Fri, Sep 18, 2026 at 04:01:47PM +0530, Selvarasu Ganesan wrote:
>> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
>> creating both UTMI and PIPE3 PHY instances regardless of the SoC
>> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
>> and ExynosAutoV920) provide phy_cfg arrays containing only a single
>> element.
>>
>> On these SoCs, when the loop reaches index 1, the driver reads past the
>> end of the rodata array, populating the second PHY instance with garbage
>> data. Since the configuration structure contains critical function
>> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
>> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
>>
>> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
>> store the actual size of the phy_cfg array for each SoC. Update the
>> probe loop and the xlate function to bound their access against this
>> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
>>
>> Assisted-by: LLM
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>
>> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Reviewed-by: André Draszik <andre.draszik@linaro.org>
>> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Since this patch fixes an OOB issue, it should have a Fixes tag and the stable
> list should be CCed for backporting.

Hi Mani,

Thanks for your reviewing patch.

Sure, I will add fixes and stable tag in the next version.

Thanks,
Selva
>
> - Mani
>

