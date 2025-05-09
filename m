Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB33C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPlOYtBazf98uWZHxWpdn4kV8cJsQLj4ZpKTkdWd44U=; b=w2Y70l7V5gtXyATP/rA1ZdejZ2
	7bzv1irXLdpqT4pg0tF0wF4lCSgpwbWb3M4ApZFU7utmDwm/jBYR9TcODkWA6JLGnce6IqDs7ZrS/
	wsr4iuqIaQa52Rz5soVV+SaDl2jV8YxT20Gn38C5V5gKE/x3AUIB5E8x3xAUzVtI8eHynIGYfDHEz
	fSqhHUK2uqx7tW116j4ltTWfuLFmyk+LGEZ8lVSNv3Q/ggUQ2J38/5tW8JbL2FUU+vGMBKxdFlm43
	iKxf7rnZX3LLlMxsxuMq6yaYMHAjbm6vIKypX3o36iH8uY2fPVvTGgEsd5Wh7WbyNOZ+5ayMKUZMC
	LvKTJCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU83-00000004jMn-3WoC;
	Fri, 09 May 2025 20:15:31 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDP7H-000000040GA-45o6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oPlOYtBazf98uWZHxWpdn4kV8cJsQLj4ZpKTkdWd44U=;
	b=CAQD5QrCGozhLcpHXuJIkNPy0br7JHKOGqMxioVLuJXJ+uMSG8o8WB6qdujPvn
	sVt5Qn9NJecoUJJ7DO4kKog3/jnunrHXckX7hbzvSaXuJCu0kk86T4JBarYja0Y4
	PVopQAyz/2dotQLiOa/SkXRlk6wkw2lh+aTp9OiV5Rrxw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDn3_MIFx5o9kGtAA--.4244S3;
	Fri, 09 May 2025 22:54:01 +0800 (CST)
Date: Fri, 9 May 2025 22:53:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: mxs: use padconfig macros
Message-ID: <aB4XB+OcNBCkcW3m@dragon>
References: <20250507141504.1332054-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507141504.1332054-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID: Ms8vCgDn3_MIFx5o9kGtAA--.4244S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwxhlDUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwpIZWgd37XrywAAsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_075424_404701_902679E4 
X-CRM114-Status: UNSURE (   7.93  )
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

On Wed, May 07, 2025 at 04:14:58PM +0200, Dario Binacchi wrote:
> Convert mx2{3,8} dts files to use the padconfig macros defined in
> mxs-pinfunc.h.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied, thanks!


