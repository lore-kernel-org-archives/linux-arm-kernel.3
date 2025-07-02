Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A13C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6uuRBxXrjF0Ae2i4iwLQbYWtBNxDN7FCHlkGJdSue0=; b=yyZdKxhc6TjPEUI9o1b3735yZh
	Bhrdu7Yg2JMmkhJaa4rSBfA9Gjwx/N9lH6J3nPytJSw5vtTKZn4ZpgLTKZLPKad84vZJrcP0O7M4q
	9LCLMmZaG9U2VTr5IxrgG0FZCVGnObt7XAVEH+yy0Ijxx8lVp+/MsDBz9f/Ac1MO31GWXJAbdHuPi
	4WlsgEUKXw2D9VqELW+zKf0cSANqnua/eA7i33n+P/m3MUDGoVQ27lSMoycdg3r3nahW/5CUThoSd
	Umd7svevIFMzJhqYaF+vYy6Rv8BI1xcBzZcoHH/VI6jUKCgChvElsHNJmSMVuSput7L9E/bkan1W4
	UpDGHhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvIw-000000084ou-2LQc;
	Wed, 02 Jul 2025 11:07:06 +0000
Received: from proxy25215.mail.163.com ([103.129.252.15] helo=proxy41135.mail.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWudX-00000007wd9-3Twk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 10:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=y6uuRBxXrjF0Ae2i4iwLQbYWtBNxDN7FCHlkGJdSue0=;
	b=UUNchQHJYtiIreHerLC+4ldDYXQdm980I6yqLnHndHjhim136KwOAMoGGgLC5D
	x90VxOOmhp2O9LworOeZEvAox/NWhcdnoMvGOBb9lRY//EoLGRSOODYdrOu1uJCl
	O5mOYo/4330hbwt/F0E4fwz7q32mYCX7H+9IGBtQqOVLI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnpuOLCGVorhUqAA--.26800S3;
	Wed, 02 Jul 2025 18:23:09 +0800 (CST)
Date: Wed, 2 Jul 2025 18:23:07 +0800
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
Subject: Re: [resend v2 1/1] arm64: dtsi: imx93: add edma error interrupt
 support
Message-ID: <aGUIi62j+5btTDME@dragon>
References: <20250616181259.1989295-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616181259.1989295-1-Frank.Li@nxp.com>
X-CM-TRANSID: Ms8vCgCnpuOLCGVorhUqAA--.26800S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzSdyUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIA6Y-WhlCI7XAQAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_032420_114923_D3B37E3A 
X-CRM114-Status: UNSURE (   6.63  )
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

On Mon, Jun 16, 2025 at 02:12:59PM -0400, Frank Li wrote:
> From: Joy Zou <joy.zou@nxp.com>
> 
> Add edma error irq for imx93.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Reviewed-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
> Tested-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Changed subject prefix to "arm64: dts: imx93: ...", and applied.

Shawn


