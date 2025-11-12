Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6CFCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 01:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9neEnQq3thnjzjGOw8nSCkjTdV9aE9g14bGC4lf5vE=; b=jO6rFiNQZQJciEzn/HauGi0sj2
	gvbFbsATgVjtO2/QGuq5Te4XXP46mPaZyCVknh8dWInjgaoLPVYvtup8Zz8kRtuXxhvyEMaD7Xw7b
	Z0s1dDHb9Iew+1mQ91fvE69NsnTQUDnmjmprNnIooa+WWGm4lhVYoxm4jQ675bOdyvROO5PQo33Fy
	gUnyY+ouatJJFxbyl57l3C2U5KoT3K16zzvo45ceuRLavufaysFe9hmGYMYnJ1v8SdSgQUCG7X1ym
	815hdB7lQy6MsBcH1Cy58S7RVDloT4quTZu/Z3ZnF22ggdWPC+SVZdyxGrDuKwg9gmOdWxG4v/2w0
	wOuT2YPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ02b-00000007yqr-0hlC;
	Wed, 12 Nov 2025 01:52:57 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ02Y-00000007yqP-3G0x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 01:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=C9neEnQq3thnjzjGOw8nSCkjTdV9aE9g14bGC4lf5vE=;
	b=NqdefhQyq+sZoVxWznWBYZ2OWBn2H2NOGNh/Os3l7rkNzBdk2i26nmATH0wU4P
	4q0YgG+IWidcwRRI6NciXc1/zWQefvi7CKHaEs1D2zFXHaLtglQ7lvHI8/NTmeeZ
	nx7ued2u44pRu9fIGoz21fG+CByCpz55MYqHXBgoBwAa8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXXYde6BNpLQ7yAA--.5484S3;
	Wed, 12 Nov 2025 09:52:32 +0800 (CST)
Date: Wed, 12 Nov 2025 09:52:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/11] PCI: imx6: Add a method to handle CLKREQ#
 override
Message-ID: <aRPoXvIeooNhLpfn@dragon>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
X-CM-TRANSID: Mc8vCgAXXYde6BNpLQ7yAA--.5484S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUo1v3UUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwBx1mkT6GC+PAAA3g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_175255_126287_D22EA1E9 
X-CRM114-Status: UNSURE (   5.15  )
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

On Wed, Oct 15, 2025 at 11:04:17AM +0800, Richard Zhu wrote:
> [PATCH v6 01/11] arm64: dts: imx95-15x15-evk: Add supports-clkreq
> [PATCH v6 02/11] arm64: dts: imx95-19x19-evk: Add supports-clkreq
> [PATCH v6 03/11] arm64: dts: imx8mm-evk: Add supports-clkreq property
> [PATCH v6 04/11] arm64: dts: imx8mp-evk: Add supports-clkreq property
> [PATCH v6 05/11] arm64: dts: imx8mq-evk: Add supports-clkreq property
> [PATCH v6 06/11] arm64: dts: imx8qm-mek: Add supports-clkreq property
> [PATCH v6 07/11] arm64: dts: imx8qxp-mek: Add supports-clkreq

Applied these, thanks!


