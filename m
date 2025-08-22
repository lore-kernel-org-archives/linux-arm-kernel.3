Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC03ECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UISHobrNh95ObNFh3tYCD32MPVeq0eeo9WH+Sn/Lp0Y=; b=vmsYaXfxTlv1v0AQPRkKNHlZvo
	yKIjmRSeSPAufGaEhCMTuexgcXVbg9cgUqbj6gTbpHrBKwXdwqrUvPUBzKK9mqazFR0/va6/TxP7U
	sNuvDoFE8L4Vz7QD5S9eIgZVO3lrZaF1YSOpO+ERVuN+PH82RPw4nw2jp0pbYvxS4ijpeNop7yROS
	ev7x99sO2ib3gzUsnFxoeRegBSPXtByv4Bc04RUBBcwmUIolQN5PEdJbqp+wQudPYBfPZrwSXwsxE
	raa/33R7cj5igXttKqLofTwamwPWMjRUvxmb9TJh8otuBn0qbOCH16wmMs9P08O/SU/HJqpkMwVKt
	9Sd/FqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSd2-00000002nJI-1RO1;
	Fri, 22 Aug 2025 14:20:28 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNNP-00000001y7W-46KV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 08:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=UISHobrNh95ObNFh3tYCD32MPVeq0eeo9WH+Sn/Lp0Y=;
	b=CDohxI7/RTmNtk8Lq7gKdoNqYdZtzyyReCeYNx73wEYD8wMw167gSXfwt5tQd/
	JDlfrLT9jjz5H6kFKQFyaeizeUAoQyh6GfZah4uYeVwr33C21BrE2r+9I1lkehM2
	Zm1nrpgc14EhL3vqRhZtb2rw8EoMmo67Gu+Km438xHpJI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCHJdqPLahoTvcnAw--.15193S3;
	Fri, 22 Aug 2025 16:42:57 +0800 (CST)
Date: Fri, 22 Aug 2025 16:42:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peng.fan@nxp.com, richardcochran@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, ulf.hansson@linaro.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, frieder.schrempf@kontron.de,
	primoz.fiser@norik.com, othacehe@gnu.org,
	Markus.Niebel@ew.tq-group.com, alexander.stein@ew.tq-group.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, netdev@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	Frank.Li@nxp.com
Subject: Re: [PATCH v8 08/11] arm64: defconfig: enable i.MX91 pinctrl
Message-ID: <aKgtj9UVLnuoJzrj@dragon>
References: <20250806114119.1948624-1-joy.zou@nxp.com>
 <20250806114119.1948624-9-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806114119.1948624-9-joy.zou@nxp.com>
X-CM-TRANSID: Ms8vCgCHJdqPLahoTvcnAw--.15193S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU1a0PUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBKzGWioLZLpOwAA3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_014400_332994_1F0BEF78 
X-CRM114-Status: UNSURE (   5.92  )
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

On Wed, Aug 06, 2025 at 07:41:16PM +0800, Joy Zou wrote:
> Enable i.MX91 pinctrl driver for booting the system.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Applied, thanks!


