Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5224DCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OANMSXSGbzYV2Jbq+Hxc7epsRFSMcP+fVcz9O3WcUGU=; b=vNQ1GvY4StJbv+JV7W7D/XJwSy
	ksjBhN7AjOAvTBTkB9Dh+SH3NL38KcV9ql25YJO8aCmWcovB5Nsp9nIWtA6fGPRrgf4YtQSIdfmlV
	/3p5Qegc+w5oj1TPqHo6PqSyBgzdbWe7hhmChfREkeRU8QoWdfDPzJMdkycdpSP01kEu/k+YJd/rD
	87/0T6bUBrNrDN1RQMSxDHG+ynIf5lDOPfWeXmgSfyEHx0Dz+u6cwkaP51FCMT2hpQzkdCT1Wg4Ru
	6me09DLdi6VIL9dBi+4TJG//jw8EZ60ttoP3u1XD1/58Z6OROTNiyg+z9s4Um1zzIcnGHksB4yEfl
	S4neAX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVvA-000000006bR-17O5;
	Thu, 11 Sep 2025 01:16:20 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVv7-000000006a1-2Gp3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=OANMSXSGbzYV2Jbq+Hxc7epsRFSMcP+fVcz9O3WcUGU=;
	b=c5JzhewptWMmVhFVc7D/bgU2nsO8dbCyPPfwINcNGBHwYqR3TrZ/Q3qX5iHOfA
	auFAozEiNugEZkdS/J1vWTW4pFBoL7YJ4Bycbih6s/6FJkRK1h0CIGqtwzv7YSCQ
	+pt7t9r8fyfmCdA3XER6FLSaVt0Yd4XBJAH03VqD1Lnhc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCn1rLRIsJokvRNBA--.58394S3;
	Thu, 11 Sep 2025 09:16:03 +0800 (CST)
Date: Thu, 11 Sep 2025 09:16:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: dts: mba6ul: Add MicIn routing
Message-ID: <aMIi0WuQQJpyJYXG@dragon>
References: <20250822134955.3321137-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822134955.3321137-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgCn1rLRIsJokvRNBA--.58394S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUouWlUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxOH7GjCItPSEwAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_181617_945528_2BBBFDE7 
X-CRM114-Status: UNSURE (   7.81  )
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

On Fri, Aug 22, 2025 at 03:49:54PM +0200, Alexander Stein wrote:
> MicIn is connected to IN3_L. Add routing including the Mic Bias.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


