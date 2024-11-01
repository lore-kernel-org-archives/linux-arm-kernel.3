Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D776E674B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIZ4297mYks9TlNfZB/eCFyx2Nv7liMlVOj3Uim+dgg=; b=P7B9wLTciONjFV+D+lxvOiLSAU
	ty2petwr0/6a2n6Rax99Eb2LYyLuEMMSETcNc3huBpzzMPOzeWXuO3gnPWiiu3iqmZ1rKF3KdoYmd
	c2zTuNn6www67YbA9IKM702FQwaE/nZ5oGXHE54Abxu6C1UxmQ1uYKbKr5gyXaRV1oS+sBGubXYfn
	So7PW4xNObNQJYn5knmsHX3KQ2sDCxzC3WKdNCwfz0RU1WUKzdteiLn2roaCMzy4p5fZVZgwnsVQy
	f6L5WNZMM5Gt2UrV/vBgdWRYdw8VUST6OjAZeuvmjwi31jhLgb/ISBv2YKMePQBXQ6dPfjX4MS6n8
	+ge2pTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6myJ-00000006GCL-2mPU;
	Fri, 01 Nov 2024 08:25:31 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6moa-00000006EL9-4711
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 08:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=pIZ4297mYks9TlNfZB/eCFyx2Nv7liMlVOj3Uim+dgg=;
	b=b1KqIXuO36LLkH4jukpFtZ/rIBd49x54x//dPgK8gHofkebhw4UwICLC6q5WgX
	YmZI9DjdyVt+iezP72zjkg7z6TmUT21jj/n+0QPct7A+quZGWK+5goZG4gut+bq2
	UnnJ70z01kWqBGST65ni7unB6dOIL5o1HIlboqbV7HSfY=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCnxfgMjiRnKmJfAQ--.13668S3;
	Fri, 01 Nov 2024 16:15:10 +0800 (CST)
Date: Fri, 1 Nov 2024 16:15:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: carlos.song@nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	haibo.chen@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH 0/5] arm64: dts: imx: Add LPSPI alias for
 I.MX8ULP/8QXP/8QM/8DXL/93
Message-ID: <ZySOC+STuelEZykQ@dragon>
References: <20241018034532.2552325-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018034532.2552325-1-carlos.song@nxp.com>
X-CM-TRANSID: M88vCgCnxfgMjiRnKmJfAQ--.13668S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrZFWxtF1xJr1DGFWkZw47Jwb_yoW8JF17pF
	W7XFyxKw1qkr4xur4kZFW8Awn3JaykWF1fXr4rt3yYkwn5ur98trW5Kry5KFy7XFW5ZFyY
	yayUJ3yxCwn0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jb5rcUUUUU=
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBWKZWckjIUEMAABsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_011529_378788_3DE0237B 
X-CRM114-Status: GOOD (  12.44  )
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

On Fri, Oct 18, 2024 at 11:45:27AM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Now there is no alias for LPSPI on I.MX8ULP/8QXP/8QM/8DXL/93.
> So spidevB.C index B will be automatically allocated by kernel
> incrementally from zero according to the order of registering
> spi controller. In this case, it is hard to determine spidevB.C
> is spi interface of device C on which LPSPI bus. It will cause
> confusion when operate spi devices in userspace.
> 
> For example, in I.MX93, When LPSPI3 and LPSPI5 are enabled
> without alais:
> 
> :~# ls /dev/spidev*
> /dev/spidev0.0  /dev/spidev1.0
> 
> After LPSPI alais is applied, fixedly B is the LPSPI index and
> C is the spi device index in spidevB.C. They are the pleasant
> spidev names. Directly spidev2.0 is the device0 at LPSPI3 bus
> and spidev4.0 is the device0 at LPSPI5 bus:
> 
> :~# ls /dev/spidev*
> /dev/spidev2.0  /dev/spidev4.0
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> 
> Carlos Song (5):
>   arm64: dts: imx8qxp: Add LPSPI alias
>   arm64: dts: imx8qm: Add LPSPI alias
>   arm64: dts: imx8dxl: Add LPSPI alias
>   arm64: dts: imx8ulp: Add LPSPI alias
>   arm64: dts: imx93: Add LPSPI alias

Applied all, thanks!


