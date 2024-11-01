Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854E8D5CC99
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 09:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLbFvxO9wbFKIlHLG0ze0IRckOOUzPQ/fxFGtuwV3QU=; b=oySW3nO5sKEvMjHd9NNz6lVCnS
	pG+/VckOwW5BPwt0GlBSbi2G0jLArAH7m4BhHJY6q6Nq+4lteCRqZe5ugeqxIU2kHgpHnbWWJYK+M
	UXuWdZ8jXu4kNJqiH6z2vzrU0c4lEnpHVijoKf5PaG6TYl/m11grm4wmX/p29lJqhtKVDVdT/f29v
	X9LDY18PTOqLRnoAl2Za3lc8YUYPHvUOUEIbzhp1btZwbdWut1y4HsDncbWXMVblbQkw1Zcp0cTq6
	XEkcazkNGYikJ9pndUQBAcyaHKwSBXVQ5a6nds0WEJTYHYtplQ8Jj8IPfocZpuMWxEkjTFViI/mEA
	wHRUkf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oIx-00000006SbM-3qiu;
	Fri, 01 Nov 2024 09:50:55 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oHD-00000006SDu-3gJR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xLbFvxO9wbFKIlHLG0ze0IRckOOUzPQ/fxFGtuwV3QU=;
	b=CJ3teuCV74Kij0nIv/QJ78QgPOMCAtiUCCmWMjrqSIiBXombK+q+II3fIjoUxH
	xz/sn4mCMGD9Vrb8DyrFFn/aQJpZ2qEgO3nsrKwNM/yStUXwHAsOdUqyPHpTa+v8
	1CSNp8ALf7kvsHnsbwP49vR+/tHhTx85/3YfD7LudL9jk=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXje77oyRnJPxjAQ--.14016S3;
	Fri, 01 Nov 2024 17:48:44 +0800 (CST)
Date: Fri, 1 Nov 2024 17:48:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexander.stein@ew.tq-group.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8: move samsung,burst-clock-frequency
 to imx8mn and imx8mm mba8mx board file
Message-ID: <ZySj+lVvO4eBjDjj@dragon>
References: <20241022220429.1281129-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022220429.1281129-1-Frank.Li@nxp.com>
X-CM-TRANSID: Mc8vCgCXje77oyRnJPxjAQ--.14016S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrW5ZFykAryrAFy5uFW3Wrg_yoWfAFg_CF
	y7Ww1Dur43AwnrKwnIkrW0k34jk343ZrW3Jr1ftrnFyw43u3ZxAFykt3s5AwnrGF4IgrZr
	A3yrAas3A3yfKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8k-PUUUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhqKZWckfBh4iAAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_024908_291204_C4CA2731 
X-CRM114-Status: UNSURE (   8.43  )
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

On Tue, Oct 22, 2024 at 06:04:29PM -0400, Frank Li wrote:
> Move 'samsung,burst-clock-frequency' and 'samsung,esc-clock-frequency'
> properties to i.MX8MN and i.MX8MM mba8mx board file. These properties are
> not applicable to i.MX8MQ MIPI DSI, which uses the compatible string
> 'fsl,imx8mq-nwl-dsi'. The properties are only valid for i.MX8MM and i.MX8MN
> devices with the compatible string 'fsl,imx8mm-mipi-dsim', as described in
> samsung,mipi-dsim.yaml.
> 
> Fix warning:
> /arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000:
>     Unevaluated properties are not allowed ('ports', 'samsung,burst-clock-frequency', 'samsung,esc-clock-frequency' were unexpected)
>         from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


