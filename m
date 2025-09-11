Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD15CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 00:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6HRqJKQ35qnhgZrk2aOMpdCfroMKThTD5K3U4AQ0eg=; b=jQOJlv5pe+y31gJsGnkq2+ctJy
	Z3lu8JhL/Hsi2CMAyQP8qK6l5EKY+99bG2bg1Is7N1xSzzMeVK7VsY2rOoGORKTQSzD3aL1XArMLh
	Scyb/wD+JLWWEKlDKilItOJMvls3dWz4moJ0EiFnw5tLCpJpbBciF1S01qFgxmMbGZ80uR4oT8gJY
	0jodEFDezJQSmCPeeFQu0TBJLgwuSh28sL8V6GXi75FtxFaIWF96KXsCRa0cEdOkyFrTguW08XgLS
	cXdnbil08SUBkX4SBJpTqVNxK7hecGz0cdw5IhwsfzS7M9sf+mqy8I5kwttR+cPnjsHY/W/X/DfOu
	K3cWvDHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVVi-0000000HauI-23f1;
	Thu, 11 Sep 2025 00:50:02 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVVf-0000000Has1-25Cr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 00:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=e6HRqJKQ35qnhgZrk2aOMpdCfroMKThTD5K3U4AQ0eg=;
	b=eMwmFZ7eTDio4xTLBQVOu0WsaerTWu9389r4tBcwaN+2Fgi41ZMOr4fP10whD9
	OnCZ1HLG+qpChQySgNVXyAa5Sl0LxBlWb/UKHc/aPoZiOq+P7NS3tR5tOzyU0RR2
	uwG1iOzCurK3OCurBwxHmdcmTlgDEYL79DRXGsg6B9gKk=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgA3ptuoHMJows1eBA--.50607S3;
	Thu, 11 Sep 2025 08:49:46 +0800 (CST)
Date: Thu, 11 Sep 2025 08:49:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 0/4] ARM: dts: clean up most ls1021a CHECK_DTB warning
Message-ID: <aMIcqBHl74Lhy6Dp@dragon>
References: <20250822-ls1021a_dts_warning-v3-0-6b611a2f23a4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-ls1021a_dts_warning-v3-0-6b611a2f23a4@nxp.com>
X-CM-TRANSID: Ms8vCgA3ptuoHMJows1eBA--.50607S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU1HqcUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIAr7YWjCHKpThAAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_174959_920983_5D03085C 
X-CRM114-Status: UNSURE (   6.08  )
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

On Fri, Aug 22, 2025 at 10:49:57AM -0400, Frank Li wrote:
> Frank Li (4):
>       ARM: dts: ls1021a: Rename node name nor to flash
>       ARM: dts: ls1021a: Rename 'mdio-mux-emi1' to 'mdio-mux@54'
>       ARM: dts: ls1021a: Rename esdhc@1560000 to mmc@1560000
>       ARM: dts: ls1021a-tsn: Remove redundant #address-cells for ethernet-switch@1

Applied all, thanks!


