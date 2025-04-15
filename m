Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B429C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaEOvRw7mxU8PaoWNIcRGBLwkDutdz42YI5DGCvWECU=; b=wtOk2oprKXWhNRxmySM9CczwRg
	kIqM8i579FwAnEXs1OBaOgooSYxxObaSqize69a6KeSNfyYhm8Z/ITPLUNUIldgTtxQAXvrUzyKEb
	GT3dMYxg6XCFU6fUdVYfRPmmf6V8/tm7In8Zu7BkAwshseGGkkkekX9lDDMGLwi2ALSCbmuazpEbr
	Dqb+A0+6/xnfEpoNZaQ/LRPksNCjJ0p29FVrhyJqt0Fhg1Wd3dahoxW9o1tTf4c2zlQIrH0D41Vnk
	pYYtRJfEKmbBtoI5wpAY9bCoWOprfES0tN7NoTqX3SYSndJHu9abXA4ReVnI2OSUh53Mv+vZy3nzW
	gJcisA+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kV2-00000006djh-0L7F;
	Tue, 15 Apr 2025 17:55:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4k0M-00000006YRF-3vZA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:23:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 017234A119;
	Tue, 15 Apr 2025 17:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366B6C4CEE9;
	Tue, 15 Apr 2025 17:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744737805;
	bh=yaZo5HTwWyPwFa+BmejUuYfJejNARyfDGIEj1j58WyQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IS5MinAf55aSLnW94s8yMqwZ1wZjb521aXAF1ekUfDYry3IX5VX8gSXuSAiiJzWLZ
	 +lxUetawsjegnCh1PFnhfCbmZxZcW86EdjKAUzBWN/jxJdh8dQk0IkXxWbRSmY3Xr8
	 PbAubgmf+qZnoHBKABjkci4vN+Cgyv6MUeDaCZMvnbzIzYfLUpnLQtj+08//3JuaiE
	 8zRaBsaLsKM0RFen2PV3YTKtRwMBRo+rAMQ3YzTHXmVUFDM/kp+t85cPWCd8DgusQm
	 v267OefCwJny+m1JiLmF8nOfbM+aobn1DqdZ30F2jg2pz2AQQlLBNViH3xdnEnUAtG
	 kNVuNeoJfAMkQ==
From: Lee Jones <lee@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, lee@kernel.org, sre@kernel.org, 
 p.zabel@pengutronix.de, Ryan.Wanner@microchip.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-rtc@vger.kernel.org
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
Subject: Re: (subset) [PATCH v5 00/11] Enable Power Modes Support for
 SAMA7D65 SoC
Message-Id: <174473780295.3016428.18003689351078217968.b4-ty@kernel.org>
Date: Tue, 15 Apr 2025 18:23:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_102326_989700_29EECAD6 
X-CRM114-Status: GOOD (  10.17  )
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

On Mon, 14 Apr 2025 14:41:17 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This patch set adds support for low power modes for the SAMA7D65 SoC and
> the required components and changes for low power modes.
> 
> The series includes changes in the asm code to account for the addtional
> clocks that are in this SoC.
> 
> [...]

Applied, thanks!

[06/11] dt-bindings: mfd: atmel: Add microchip,sama7d65-gpbr
        commit: cf616eb55ba84118d0f8274a3e78dd526ef235a4
[07/11] dt-bindings: mfd: syscon: atmel,sama5d2-secumod: convert to yaml
        commit: da4151479628b170074dadcdcdbb1c042643bd3b
[08/11] dt-bindings: mfd: syscon: add microchip,sama7d65-secumod
        commit: d0eceba4d13341a1d2d52a1ffc31b6987174dfd0

--
Lee Jones [李琼斯]


