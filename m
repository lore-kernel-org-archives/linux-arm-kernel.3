Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E115CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 02:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ANbRHVMw0mnGda34bSjs+M0HowPfnWkfMAWAlf5L/M=; b=0F1bISfekuxe1IA2hVFXFaqXbA
	FdRuQkdvrWETiaE683fSwvabHMBhCdCG4abojnzvTYjCp8sHutwDDK/INp1wLuh7NUi089tJOhJL9
	zukvUyxD0V1SqqUht7Y3QNaosvzDw6HA66bQCQms5AG6SD0j8EzM2m4NfCYOfqmg0AeonvFM4ynEM
	i9oaf+UN36h5LuONjry3E+jyT1RfjQD76fm3MrQ/jAv3n2sfGN8RUpzFD0UwC4xOSSGZL+kSFDsb4
	1hAAijco8afdklJQ5lsPqNfztGRVyW//rKChA2BqObUh0pgwBYTrVRRZvsZ4HNH2x8eT8U/A5zLq1
	j8xSyiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWqI-00000000LBv-3p4F;
	Thu, 11 Sep 2025 02:15:22 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWqF-00000000LAO-23M2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 02:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=+ANbRHVMw0mnGda34bSjs+M0HowPfnWkfMAWAlf5L/M=;
	b=Z319Chid69hmJgJlrAx+DlYiT5BzkPwCEtdfJrSJDh72JGa4WYTUI2tImqxJkU
	88FJzcvPtm+TslP9pH3WTlSYxo2OWJsLNUag4HAKvp+jqiSqt/0941BS4VXSDMJm
	IfawxAty7uDNu6gMAhmgUmDnLvJI+xZI9Vgc1ancmvPK8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAn5W6RMMJoJIhGBA--.44820S3;
	Thu, 11 Sep 2025 10:14:43 +0800 (CST)
Date: Thu, 11 Sep 2025 10:14:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] ARM: imx: Kconfig: Adjust select after renamed config
 option
Message-ID: <aMIwkWRY5c7tLIxV@dragon>
References: <20250826092901.43141-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826092901.43141-1-lukas.bulwahn@redhat.com>
X-CM-TRANSID: M88vCgAn5W6RMMJoJIhGBA--.44820S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOTmhUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhP6YGjCMJOieQAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_191519_873494_421DBE4F 
X-CRM114-Status: UNSURE (   9.02  )
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

On Tue, Aug 26, 2025 at 11:29:01AM +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 3f490a74a8a1 ("clocksource/drivers/vf-pit: Rename the VF PIT to NXP
> PIT") renames the config VF_PIT_TIMER to NXP_PIT_TIMER, but it misses
> adjusting a reference to VF_PIT_TIMER in arch/arm/mach-imx/Kconfig.
> 
> Adjust the config reference to the new name.
> 
> Fixes: 3f490a74a8a1 ("clocksource/drivers/vf-pit: Rename the VF PIT to NXP PIT")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Applied, thanks!


