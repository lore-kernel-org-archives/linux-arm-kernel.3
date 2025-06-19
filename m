Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97038C73C66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8MldPwbwsdIkwE8tzK40xr/dxkO1GNTeWs2e/Byr+M=; b=dyfGUnCjRkib9ZVSD3mMN5d5UO
	UzTPmoVM6Q8/2gVY5ZjqQWMX/JZDjPiYcY95XAx+vs0TWiLBi6C1Zun0tt2brHDSjR0eoQKWxxOnW
	eCC2UpCF63PhXloZ9mnEzS9NcSsakKQkDlD1VA1YuiTQGUAczafECB92SaDuET/LxVaJ8zlW3AEtS
	uegEcn1ITde1qawYVNB2rUuthp+H9S0rACFFl49A458rZ37J8LujrcATQ1Qbz85HbdCHgTse3pIzm
	Xrk4bEwwW67OPSm/aEuSGmH1iWwVGQInZHinV59Q2OF299ehLmSJ9W3rOVYBmj9NCEePDt4UhMUXf
	lWQE2vzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAnv-0000000CSWV-2A6B;
	Thu, 19 Jun 2025 08:39:27 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAA7-0000000CMxp-2H8L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=D8MldPwbwsdIkwE8tzK40xr/dxkO1GNTeWs2e/Byr+M=;
	b=Of2bD993b5NP6aOpy9wWGxOojcUgkQJnZVIcN9+oqdrChJ2XG4QVhla/HNkDCd
	C3bKt714JU+Eb9xNPq5SYdM3H/bRZ1LFkkJ3daNjQpeBDCvNIu/+ECK30uNhKhTo
	sjyBQX5rEsERgHseWn7ruNlyuj+O457Ei1oixj8dnZXeg=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnfU8Bw1NoXtX_AA--.28682S3;
	Thu, 19 Jun 2025 15:57:55 +0800 (CST)
Date: Thu, 19 Jun 2025 15:57:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev
Subject: Re: [PATCH] arm64: defconfig: add S32G RTC module support
Message-ID: <aFPDAYCwA7I7yipt@dragon>
References: <20250526165041.2486330-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526165041.2486330-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID: Mc8vCgDnfU8Bw1NoXtX_AA--.28682S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAZxZWhTjfbDTwAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_005819_900970_654194CE 
X-CRM114-Status: UNSURE (   8.04  )
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

On Mon, May 26, 2025 at 07:50:41PM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> The RTC hardware module present on S32G based SoCs tracks clock time
> during system suspend and it is used as a wakeup source on S32G2/S32G3
> architecture.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied, thanks!


