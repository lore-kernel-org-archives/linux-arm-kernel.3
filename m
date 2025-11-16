Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DE5CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2Tzy4wpEnBc0N39re5MYS8e6Cpyy1OT/u1kY6JsWT4=; b=WBBU6GGb0jzCwsXKpNmnLE2M03
	AJ7dJeUK5zbIQ3mJgL9YLLB9bsnWzSMjQuBc2mMZU5SyZoQXc3qAE4AbItXJLDQxAxTIRkKpEiIY7
	ircO3+Dwg8QWuRvX5cNMsUv4qDSnMoOJj0Ghnsnq7mjBQnWlMg5VBhEiCY54Y0HkV0Uyu0LpzzagD
	ftHe2M1Fbf8CnMCk0fvxafy8H8pRa+ZO61Fm1W93WHQLxjstJ/LHqz0V+uqPDyg0UK1/pRMGoD8ry
	L5fr//HiQ9QA+gX5D5Gcjl0gCFnl9Kqcdaezlshxb72A8/UlP15fxVRhUtkJYadh/QaTOSvH1k4ez
	nYPMwqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKboq-0000000Ecfk-1RbK;
	Sun, 16 Nov 2025 12:25:27 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbom-0000000EcfR-2SpO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 12:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=b2Tzy4wpEnBc0N39re5MYS8e6Cpyy1OT/u1kY6JsWT4=;
	b=gbE7CM0NAwSA09/hPaYqd21DLNQ39SGc+N7sEA4KoeUHRwGOlm6GF/W5hlEwlJ
	Wd0LVyxzpZ8znLc/wDxdoiLXIGn/f28f5RVE3nkUOLL74fmgmMaK8/ZtqqypcUF6
	gqp6HZcYfY3/FohbeCd3OfoGZZuW2sLTndSv8lHHUuPBI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCHw0agwhlp52glAg--.8033S3;
	Sun, 16 Nov 2025 20:25:06 +0800 (CST)
Date: Sun, 16 Nov 2025 20:25:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: jan.petrous@oss.nxp.com
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Enric Balletbo i Serra <eballetb@redhat.com>
Subject: Re: [PATCH v3] arm64: dts: freescale: Add GMAC Ethernet for S32G2
 EVB and RDB2 and S32G3 RDB3
Message-ID: <aRnCoAjkfti12We1@dragon>
References: <20251103-nxp-s32g-boards-v3-1-b51db0b8b3ff@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-nxp-s32g-boards-v3-1-b51db0b8b3ff@oss.nxp.com>
X-CM-TRANSID: Ms8vCgCHw0agwhlp52glAg--.8033S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrAryrCr17tF1DZr48JF48Crg_yoWxWwc_Cr
	y7GF4kAasrAFZ7Xa4rKw45XFnYga15J348Jws8Xr12qas5G34DZFn8t34Yv3yfZFZ5A342
	9wnYvr10ya4ayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjHmh5UUUUU==
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOAJ53mkZwqJzCwAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_042521_399338_C7A260D5 
X-CRM114-Status: UNSURE (   7.82  )
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

On Mon, Nov 03, 2025 at 10:24:01AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Add support for the Ethernet connection over GMAC controller connected to
> the Micrel KSZ9031 Ethernet RGMII PHY located on the boards.
> 
> The mentioned GMAC controller is one of two network controllers
> embedded on the NXP Automotive SoCs S32G2 and S32G3.
> 
> The supported boards:
>  * EVB:  S32G-VNP-EVB with S32G2 SoC
>  * RDB2: S32G-VNP-RDB2
>  * RDB3: S32G-VNP-RDB3
> 
> Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Applied, thanks!


