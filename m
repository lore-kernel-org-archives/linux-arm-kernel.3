Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2901DF9D0E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXPr6DICSQAjrstqrDQl8dHMx2EjDycoyikzXqoN0vE=; b=cWxlrd63z/5zKgqF70apl+VEDp
	p/excV3Gs1tzyJyeUwgvnGwP/eE9CuCWAgUEpKjyTj3/S7rNk7ObOE53pO+38ZFyl2YuwK/UiPRTj
	cwMTfWurRKGULNL3lj4CYJ+GXxvhpSNQsz9CW1p6YBGjjsA03bHmipbdaaCCZH0P2r8Txi+z/sVGR
	wvkGy2jCHG1+svconFWV/Ebsok2MRiMv3e1ZfpiZIVnmWk16MehEoEDo5vgqIVstXS7QUMWPPQMRw
	pVC7hdwxOp+tTF1zSEoJolUGnv2hKlv5CwPqcktUMeZOdIc4zgfKYqokHa+JeS19Y0PNcpEP7Tx6d
	z24/a/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCga7-000000000cN-2P9g;
	Tue, 14 Apr 2026 16:25:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCga5-000000000cB-2fkZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 16:25:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 664B060018;
	Tue, 14 Apr 2026 16:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FDAC19425;
	Tue, 14 Apr 2026 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776183940;
	bh=oXPr6DICSQAjrstqrDQl8dHMx2EjDycoyikzXqoN0vE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Le96GiwRQmFJpXkrBR1cBOh46m9m12Vv3tth2mtOZn+E/McBgQSC6NTjAm3pzLW8F
	 HTB8OQYqn0LsCwhhCQOu2J8aE33FBef3DHAaVo392gLOBXzSnaitm2oBHKo0vQD8Po
	 Gl1rA8URvIDp06I51J74CENBcfomdPB+K3F535Nm4XQV9PFfN5lv8VWWXeYWZr7O4w
	 KMwe+I1EVfiZfEzGc3xiNhyMnmIW/YjWfjirDW9j7jG8+TVN/s3C+tqlX8c9M2Y8ar
	 zE9Sw31MS0sN9owOuR10RezkhbtR1oyGp6jk3jH0vAaeifMMmbVOkVZQ94GSMRI2fD
	 Q1PBd8udugN3A==
Date: Tue, 14 Apr 2026 17:25:32 +0100
From: Daniel Thompson <danielt@kernel.org>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 1/4] dt-bindings: backlight: Add max25014 support
Message-ID: <ad5qfDzaHZhjZsLs@aspen.lan>
References: <20260407-max25014-v8-0-14eac7ed673a@gocontroll.com>
 <20260407-max25014-v8-1-14eac7ed673a@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-max25014-v8-1-14eac7ed673a@gocontroll.com>
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

On Tue, Apr 07, 2026 at 04:41:42PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

