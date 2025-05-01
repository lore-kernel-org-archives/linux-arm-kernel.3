Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E12BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iW37dc4JV7FI/c08R26nIdXftSnWYFRMw9MuaYDFfGk=; b=XzSxg9bOKhgQOtMU4G2WYmUhFA
	7uWJGuvpjYRcp95Cmw+4CtmTU9o93hLRYw9E9J2otVpiylsA/FNcfinfQfZ3QI1jtZeTJmOzRaFDU
	J9bomGXrd6Ss7QtK2wvLKh/IakbidMjpslyFYH4WuiZKa4xtVDlm2OlShnJZEhft7qrIDDpX2RSv5
	Jkx1LhNfVlnoVwAiQ4KgmKGBz/ZZIuqczFuL7ohp3TI6gdcnMHULnE8xCsSufjh6cSsKAn6gqGf77
	8sO6ROzHPkp7RTh8IhYEH5jvuqGMrt8Ajev5Ijl0pu9hMrEUvrLRifTBKVI/ZNwFwkz7xc2RFwCuA
	6KFNH/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPwp-0000000F5tX-1ye9;
	Thu, 01 May 2025 09:11:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPux-0000000F5lZ-45Vp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 09:09:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A281568463;
	Thu,  1 May 2025 09:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABDAC4CEE3;
	Thu,  1 May 2025 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746090558;
	bh=Ab2Fh2ilzC5IU7gqXpYNCm4x+QzBsCpAZEaO3S+BdKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7nrNs3tbpCki4FheEGOTdohY/wkrwSqL6TUMrwd6jLLdStbV/3RqErns4Qty6Db+
	 8ltaB7n1dTK76PYbri3Po9ZVUUWfxy7aVTcLD6pNP4nlsPJqrQf9+Uhvm4B/Y3yRS4
	 joDuG+WxWAMiMrYsYpPhGtYhljYOvfAEynKiWFU7RTBgkIThwIQBd34M10YkrPLib5
	 YDsy1DzajSoztuICNrtqPuSRT8HBbwV0Yrq10aKuV4jTQMM1aZBr9o18p7jRt6rA7F
	 1rp9oCXCbkfoj4UAZe+0blotSyTjenvL2BroaVTd11+IDgRjowDAd5PKrrb4AdvPI0
	 WJD0rkLb5QADQ==
Date: Thu, 1 May 2025 10:09:13 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] firmware: exynos-acpm: clients (PMIC, clocks, etc.)
 will become children
Message-ID: <20250501090913.GA3627101@google.com>
References: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
 <174530898122.9276.5071475909293812602.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174530898122.9276.5071475909293812602.b4-ty@linaro.org>
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

On Tue, 22 Apr 2025, Krzysztof Kozlowski wrote:

> 
> On Thu, 27 Mar 2025 12:54:26 +0000, André Draszik wrote:
> > ACPM clients (PMIC, clocks, etc.) will be modeled as children of the
> > ACPM interface.
> > 
> > This necessitates two changes in this driver:
> > * child platform_devices from device tree need to be populated here
> > * child drivers will need to be able to get the ACPM handle via a
> >   struct device_node, not via a DT property name
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] firmware: exynos-acpm: populate devices from device tree data
>       https://git.kernel.org/krzk/linux/c/636baba9489a634c956d6f02076af6bc1725c132
> [2/2] firmware: exynos-acpm: introduce devm_acpm_get_by_node()
>       https://git.kernel.org/krzk/linux/c/a8dc26a0ec43fd416ca781a8030807e65f71cfc5

Can this be made available for other subsystems to pull from please?

Without it MFD is currently broken.

Ref: https://lore.kernel.org/all/fd11ee67a3d51aef6305c477b140d911da0b2af4.camel@linaro.org/

-- 
Lee Jones [李琼斯]

