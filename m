Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71600CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgotZdYlH2qKqrRa2TbL0w5hWHoJ5dB0jsdcBzEktJ0=; b=wp+yyhtBBVD+qQRx5LdVuyjfuZ
	khMcS9v+SrI/pcHY4HIw2sI6UcfrWShxcpsh3qYfTMwJGD18u2tKwT3svwx5mNqlZu2fVS2EozkL8
	pdy5nUB4jYQiVFmSqtx1be/BUJSflQGh+/Czx2cn1BbA4+ejKbBLzU9qLcvZTg/oA7peUbUvNi4sJ
	EndcRaoMFK972PWz+P7Rlx5YGfjMnsBDi1QXRpYh2sv1dUrbfrNdFTq0ToYniitjkhAvgDTRZrQ5N
	MvkoDJVwzkUm00asYVMBPrrXt7AOFpFxh8dXKWXE1POxdRmDo0j4o2TVQofwNV19VhQItAAsZfjfd
	XH7Uyg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWs6-00000005UDv-41iF;
	Thu, 28 May 2026 09:17:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWs3-00000005UDT-3vPP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 09:17:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1DD243E19;
	Thu, 28 May 2026 09:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22481F000E9;
	Thu, 28 May 2026 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779959862;
	bh=qgotZdYlH2qKqrRa2TbL0w5hWHoJ5dB0jsdcBzEktJ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=G39SLCoO708ZpB7BZ0deCrXa0MoEvYNiaXQGa7URhHwKCprWVZGwC8gHG/xhxwV+S
	 fM6bgUNlI/xT7JtVeLvYyZcP+d3pH8uThHDzTDIBct0PzYLg0eHw9uaWcPl6q4l4L3
	 vASYVAF4nh7pBGdJA1j/FBVAPwvYRCRTljf5yFXE7hHj7nlXqcCr4OamD1aJIQ+IB1
	 txOZBM40UukQ5ZTOxmZAKC0PhXRbfxEkVezY41g8U4sfuZOHZ0I1lLwNllFCxPyZPH
	 nxYX0ZJNG9rqP+Cm/6ulJbof8M+Lh4dICsUDuaruYZbyqGJyBuSS3jAAHCSA8xL9Qi
	 1KvkJBfehCHdQ==
Date: Thu, 28 May 2026 10:17:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Subject: [PATCH 0/3] iio: adc: Add Axiado SARADC
 driver
Message-ID: <20260528101732.034f57ab@jic23-huawei>
In-Reply-To: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
References: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_021744_024358_E99C0CEF 
X-CRM114-Status: GOOD (  17.61  )
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

On Thu, 28 May 2026 01:10:22 -0700
Petar Stepanovic <pstepanovic@axiado.com> wrote:

> This series adds support for the SAR ADC controller found on Axiado
> AX3000 and AX3005 SoCs.
> 
> The controller is a 10-bit ADC. AX3000 has sixteen input channels and
> AX3005 has eight input channels. The driver uses SoC match data to
> select the number of available channels for each compatible.
> 
> The driver supports single-shot voltage reads through the IIO subsystem
> and uses the reference voltage regulator for scale calculation.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
Hi Petar

Welcome to the IIO subsystem.

I guess you already noticed, but something went wrong with your
patch title.

If this is an issue with a company email system or similar, consider
using the b4 tool and the web gateway that works with as it avoids
any corruption of threads or similar.

Thanks,

Jonathan

> ---
> Petar Stepanovic (3):
>       dt-bindings: iio: adc: add Axiado AX3000/AX3005 SARADC
>       iio: adc: add Axiado SARADC driver
>       MAINTAINERS: add Axiado SARADC driver entry
> 
>  .../bindings/iio/adc/axiado,ax3000-saradc.yaml     |  58 ++++++
>  MAINTAINERS                                        |   8 +
>  drivers/iio/adc/Kconfig                            |  11 ++
>  drivers/iio/adc/Makefile                           |   1 +
>  drivers/iio/adc/axiado_saradc.c                    | 218 +++++++++++++++++++++
>  5 files changed, 296 insertions(+)
> ---
> base-commit: 51f0c0b8545b23963afd5d43a8f56ee05bfa54da
> change-id: 20260508-axiado-ax3000-ax3005-saradc-151aed5d25da
> 
> Best regards,


