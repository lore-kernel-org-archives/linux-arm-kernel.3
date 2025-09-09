Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42823CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kH++1lRd3b590KtsiJ2DGXmZpkwvUsmHCqZRXED4GfU=; b=0/o7T2QvjM0020JLGicgZrKPQA
	tHN5Tl2Ll3cbGL45Ks+M2BwzitkgwLNWPdRoVQlDkqc+Xqaf4KkOU/2qlNfw34GtdnHe116hx4r/y
	f0zo5qOqSvIjB+KNllv6//uj83F3k8m59mBxheAm4QEzF7Of4/9HaJ3XnxvC3ipJUXHscb9fgSBJ8
	kKAq5Vqef9gyvSQ4LV+y1UIqJZlceOSBCFl0oTvS4QvaEJtZ1BRk5I54eiQ4wYmmk6YiC+zjnEL77
	XM33NfhfK4rPH/9Fu4CnvS0bjOTzC63PnIzdZq8zWMbQvoPW6pI5gHrJTdMdGcCXlUkNj6bH+WJxx
	BL2WOZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26E-000000094He-3Cik;
	Tue, 09 Sep 2025 17:25:47 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0ai-00000008GtE-3M78
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 15:49:12 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 29FD9A09D7;
	Tue,  9 Sep 2025 17:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=kH++1lRd3b590KtsiJ2D
	GXmZpkwvUsmHCqZRXED4GfU=; b=TCqAfMX7NO3TWA7vFyNOiUSla1GlfKUSPtYl
	wdZ1JPQSS9MvP/QTzGcSyKx5FDr6B4yim9+RftMGuqx6UwkA1dIrKdEZOS5F6hPL
	j44u9gRKE5TiDng3lY8jOy2yKXjJyEhoUjz8Vd8YHyy1Wtve1JZFVGRMM0LPrs4i
	H6K45Z0WiVV0iXf5Vu82DWR/0Ic+BIRhRs//mCd1DgCi21DGLhpjOdfLZgKJp7H8
	tElGF6gUYcFHQFeidp+GZWrHvca5RLG+3YBCXxBR66d0VZtpwT4GlThNLlLFLUDO
	AmcfISk945iKEsVEhxhHTl54lSRGMhkxEzUFXd42MMrnpgsnAAu4HOq+DfzQT90e
	q8FLU/owU0Vdg+BgWRTVz1NkT4+Mb3M9CJQ9BT7UrOKH5djtTDrOehSVwUkYEP64
	LDtlSKJliHgY6rzunur9xFXINR5UOPN6aI4BRv8fwoHXeuNd8YaaMP7Y7uHRyIzW
	jMs2abbwkYXHfQAAqwvyhDgknrb1YEblPDZpQJhOHGxThXaGiu6cNMS/F2erw3Er
	QqIIJBWFHUaaCCBFq0iDvbS0wplWphEXyHA65mdnbLcpsYUNd9YQcXzZYeSBLdtT
	Rxzs2iVkHQaot20y4TWUphcn/oYuiMJMi9YA4Vw6RIEetZfDdhWlntaampQP/EML
	GvjVSdQ=
Message-ID: <b48844bc-07f3-4fc1-8486-8968bf6d2362@prolan.hu>
Date: Tue, 9 Sep 2025 17:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] ARM: dts: imx53-usbarmory: Replace license text
 comment with SPDX identifier
To: Andrej Rosano <andrej.rosano@reversec.com>, Andrej Rosano
	<andrej@inversepath.com>, Andrea Barisani <andrea@inversepath.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob Herring
	<robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>
References: <20250814-imx-misc-dts-lic-v2-0-faff7db49a5f@prolan.hu>
 <20250814-imx-misc-dts-lic-v2-2-faff7db49a5f@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250814-imx-misc-dts-lic-v2-2-faff7db49a5f@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.2]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E627464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_084910_042109_1B4EC239 
X-CRM114-Status: UNSURE (   7.97  )
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

Hi,

On 2025. 08. 14. 9:47, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Andrej Rosano <andrej@inversepath.com>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

+To: Andrea Barisani <andrea@inversepath.com>

Andrej, Andrea, do you agree with this?

Thanks,
Bence


