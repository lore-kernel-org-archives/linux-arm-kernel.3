Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BEBC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MOiwSNMYf6g66eBoNmB+RtKMVO+a3roUbWBwjk9v4w=; b=ZU+1PD/RaSCBCfSRuyGTjewoDu
	DDWG3HTrfIlOFDb+2K1NIO+D9ZXsNZABQIo1ouW6207jycIT0Yx+xGDxY9YGsE6H93wBJQB1X+bB3
	Umb5M4+WCig4nuqWBhUFGwhzFOh9fHmOoTDza8zREqmRK9OjL2BcF0/pTqUM6fLhlksopZi0x/jht
	Lj9VmGgjZrPvGefA8e7erTUvrT5FGoQ6eXG/e67ufeT8ysyWg5W3VJDLbdmDPsf35ylhQfWJfEne2
	1Cb5h5axPGJkVfCMVcK/xkVFDe54f3httBWEyzYgSfSwG8yGYssAAva/RECKauYnoEzi0WUHmcpY4
	4qa1LQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiQp-000000021mg-0gSG;
	Mon, 07 Jul 2025 09:46:39 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhp3-00000001vrb-37oE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4MOiwSNMYf6g66eBoNmB+RtKMVO+a3roUbWBwjk9v4w=;
	b=AurRTncD139Z5haFbm6bjf2iTepE3+2gT+0dSgaDAowVz86yfCCT24uLKZjKc4
	3lLJ7PUl1z8UMDd+CS/c4FtSixbJpSGvmb6cITZJkMv1683sRUxSW7vHwTVJVHl8
	8fRPhtNOjjQFnQ4o3HIya3M+UYyEH2Okb8PQarksV/BL0=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXL3s7jmtoDg89AA--.26376S3;
	Mon, 07 Jul 2025 17:07:09 +0800 (CST)
Date: Mon, 7 Jul 2025 17:07:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>
Subject: Re: [PATCH v2] ARM: dts: imx6-karo: Replace license text comment
 with SPDX identifier
Message-ID: <aGuOO36kkTWtM2yy@dragon>
References: <20250703-karo-dts-lic-v2-1-329f4c55913e@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703-karo-dts-lic-v2-1-329f4c55913e@prolan.hu>
X-CM-TRANSID: M88vCgDXL3s7jmtoDg89AA--.26376S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryDAF1rtF47GF45GF1rWFg_yoW3ZrXE93
	y0gw1DAw13KF4I9rWfCF1avasrKFWjvF17XwsYvFy7AF98GrZ8WFnYqrn0vrn5GayfJrnr
	CFy5X347CwnrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb9NVDUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNB2nDWhrjj0DhwAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_020738_149748_7C36633B 
X-CRM114-Status: GOOD (  10.50  )
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

On Thu, Jul 03, 2025 at 11:09:24AM +0200, Bence CsÛk·s wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Lothar Waﬂmann <LW@KARO-electronics.de>
> Acked-By: Lothar Waﬂmann <LW@KARO-electronics.de>
> Signed-off-by: Bence CsÛk·s <csokas.bence@prolan.hu>

Applied this v2 instead, thanks!


