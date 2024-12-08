Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA44E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPDBUnM1DSnAWD8FZMXEdjqn7TwL5IsS1ZLzxkPmzX8=; b=iq5OGuMCJ5RpnISnBeNO4U/YJN
	Uo3OiXgjVcFhIUMe7GiLzXJKb38cJ/XTzVib8Vpv7RGfxdSbpchs0sEIvsjUNUlyrMoCAsZbVHWZC
	U8avCTWTiHw/L2exESiVPI2GDLXoPUZV/r38UJQhK01DVnI/3san2d46zTXVYkg9y3J3FYiaRlBfR
	BLtwXmS/ye7wvmKn9/VSi8fP1OU5eXn2/N2XGqUZJQVfTxCJfSx3pm8AN0KuTmuc6LEC5sJpKFUDM
	J96hZeYRfaxXPa50asbbjz7LmeyBUaYw6uEHBx27lY6S3xTihvIqwMeomC6MpUJVgEHnlRFWEvqf8
	b3vkbQ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKiC-00000005cL2-0IWf;
	Sun, 08 Dec 2024 17:04:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKgS-00000005boo-3iyO;
	Sun, 08 Dec 2024 17:03:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C45C35C4A41;
	Sun,  8 Dec 2024 17:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DBFC4CED2;
	Sun,  8 Dec 2024 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677384;
	bh=yfk7T0TUDNqEF1duZz7ptN/DD8iP4vzBIsj5E+zO3aE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZjVgxFJeKvtcy/DxrsYAciOdNWe+9W3V6CDIYNrd5U9J9KBTxv8YY+KWnSuaM3B2q
	 soRoWaxXE1N/UVErcxg0UzPM++PHSpf5nIIB9mErIX5PcWV10/jr8kp+I/KmRZHOB8
	 iU8yMXZXX4Ar4LM2a+x4xbt0bxARRxHVovS2NTwq4P9LT1yTuGeX/QDnG5Z1FfLdtj
	 sKgq1sTnTxjMjz/PAIoAEAkGKCvOYhobMwUkyvzIdiy9bw+EHP1a32IfV1/ASeOKg2
	 XoLVqQy/r6gdGHZq4UfOQ/aaGNU+JChaQxD1oJi5s8n7BD+iPF28Eh6tFTo4bdbX6J
	 kAQnBY98yrJQQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org, 
 jun.li@nxp.com, alexander.stein@ew.tq-group.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org
In-Reply-To: <20241119105017.917833-1-xu.yang_2@nxp.com>
References: <20241119105017.917833-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH v2] dt-bindings: phy: imx8mq-usb: correct reference to
 usb-switch.yaml
Message-Id: <173367737834.1042266.7257733372756734157.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:32:58 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_090304_982551_75B5C053 
X-CRM114-Status: UNSURE (   4.45  )
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


On Tue, 19 Nov 2024 18:50:17 +0800, Xu Yang wrote:
> The i.MX95 usb-phy can work with or without orientation-switch. With
> current setting, if usb-phy works without orientation-switch, the
> dt-schema check will show below error:
> 
> phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
>         'port' is a required property
>         'ports' is a required property
>         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: imx8mq-usb: correct reference to usb-switch.yaml
      commit: 2318ca5994599bb4d287e9e00ae87e0855cba712

Best regards,
-- 
~Vinod



