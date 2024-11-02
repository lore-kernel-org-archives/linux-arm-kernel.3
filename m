Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD09E677EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 06:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VIcPO/qvZo2Yecv6kglkByNG81C4qnffnZZIqE0ty4=; b=MV8x/CkLy/eE7Lm2l0VeI05+UU
	6BcjRVaMsKS5GnmekvW7Jvmmhr0+w8EJ9SPpsIwJNzUEkKJHp4utk4NMMADudNN92Ao66v0jYGccP
	5kGGxv52/2OwesQ9tE0GsC4uWsf/8Lx2xnWteYlVOOYNIH0GsmtO62aBWEqwN6goDcvgeFnXtHcBT
	VefOIVKW6YgRpp5x4ijWdAMzUAMco15uZy6249v3KQpeSbAN6aur7goZmrnBH0+CYS4nxfER3Bzw7
	btwC6hIYkCJKtZdxxpKqzTtGsXwGVT9+gmeOTMiOOg/gu3OYD/Mdp68Z1gygoj+R+lIDVNr3TT8jb
	7RHo3rMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t77xY-00000009Aqk-1Jzj;
	Sat, 02 Nov 2024 06:50:08 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t77vq-00000009Afm-3OQg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 06:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0VIcPO/qvZo2Yecv6kglkByNG81C4qnffnZZIqE0ty4=;
	b=mpYFZX3EkeqHbGE6w69j1mVPnOKV0cTtvf2l9CHxyPE3mRWdV/8O9bRu92EIht
	LUN9HixVth3IQ8gnMwACWp/HRoHaGyRwg89YKnHiXtKrflsE64Vk3n99ZAZoIgHr
	5WlnD49YjNwJi0BGftdbXhLbV0kYqCix/9D9u8OcUlMU4=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBHi8gnyyVnUm9+AQ--.14872S3;
	Sat, 02 Nov 2024 14:48:09 +0800 (CST)
Date: Sat, 2 Nov 2024 14:48:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: imx8qxp-mek: replace hardcode 0 with
 IMX_LPCG_CLK_0
Message-ID: <ZyXLJ0RbHqCIym3R@dragon>
References: <20241025220810.1833819-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025220810.1833819-1-Frank.Li@nxp.com>
X-CM-TRANSID: Ms8vCgBHi8gnyyVnUm9+AQ--.14872S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBOLZWclrIE-mQAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_234823_195324_CEA2891F 
X-CRM114-Status: UNSURE (   7.37  )
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

On Fri, Oct 25, 2024 at 06:08:08PM -0400, Frank Li wrote:
> Update clock settings to use the macro IMX_LPCG_CLK_0 instead of the
> hardcoded value 0. The first argument of lpcg is indices, not index.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!


