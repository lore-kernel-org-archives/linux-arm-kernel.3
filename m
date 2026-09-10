Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66E1C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEHLUGTnGIvTiSnbPaTYiuHz7Py0xQtY1MUskUwmPWE=; b=bccHyTj8Dyd/PdWv1keDfdj9RX
	EElWEorMYz02NoKrcMoUgVyq2FoTqOju6nu1xvlutrgfRyl4fLoNZhMr+K2QFNDNJP5SJZFfzAzaS
	Of/oaYkvjIpN7zK65KqRwg7f/5dN1ueNQpj4zYLTTUi96pfYyQYbbHsyJ1sY+JgQkillahcuMD3LH
	9FUyYVoXxmyTrOg7wQ997ujRxdxeIj9wzpSCfEUrCCs+aCD+LSgr0WU6zNgnb85SpoZ3xsshA/lrZ
	JM3In7+Uq9ctggWJbPb4JEWH33ZvcIiXazGN2KkP924bRgR9uOPk7quzUr+ECnVZ/TYYm1+lWginx
	VPDgJ2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4kYk-0000000FG7q-3yY2;
	Thu, 10 Sep 2026 19:35:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4kYj-0000000FG7V-34Lh;
	Thu, 10 Sep 2026 19:35:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB11B60213;
	Thu, 10 Sep 2026 19:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF061F000FF;
	Thu, 10 Sep 2026 19:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789068944;
	bh=NEHLUGTnGIvTiSnbPaTYiuHz7Py0xQtY1MUskUwmPWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QHS9bb1g4bOEu914forL0x7kDO1MY6HoyQrVpJA2Zm2D1LVGbRvWNR+VyFLDiCt8N
	 8QfYMhEEX+Kyhwi3OfUTg0Styezbdjj2ltVim1F1O3W2zHp7SODgeElbwy3NAZNPc5
	 wiRrATApSFP8PeH/VYFIgvdZSOF+zS3qaGiLd7m9jRhljhA4bvbX9kj+3F9WuSJhGJ
	 I2Zfaq9CfVBf39UClc+CFWuGgk9fK1saxN3UFa9EyAyGqormI/1bzY47F+OJWLwV5Q
	 wt5/C2qFDN+hrYSbvscC+6dUrPNXBhvdnmDC7mKaFUphaTDcdGaf6UaSraPExJ/Aop
	 7S5VLmQxxIptw==
Date: Thu, 10 Sep 2026 14:35:41 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel
 overlays for Monaco/Lemans EVK
Message-ID: <aqLGFfQ20mCGFkfl@baldur>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
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

On Mon, Sep 07, 2026 at 12:03:52PM +0530, Shashank Maurya wrote:
> Add device tree overlays to enable support for the Raspberry Pi 7-inch
> DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.
> 
> The overlays configure the panel on the primary DSI interface using
> a 2-lane DSI connection and instantiate the panel MCU on the
> corresponding touchscreen I2C bus for each platform. The changes
> allow the Raspberry Pi 7-inch display to be used as an external
> display option on both EVKs without affecting the default platform
> configuration.
> 
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Florian Fainelli <florian.fainelli@broadcom.com>
> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> 
> ---
> Shashank Maurya (2):
>       arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
>       arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay
> 
>  arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
>  .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
>  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
>  3 files changed, 169 insertions(+)
> ---
> base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
> change-id: 20260907-rpi_dts_overlay-58088ffce047
> prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>

The two dts patches in this series clearly relates to those two
regulator patches, which has received change requests.

I would have sent the 4 patches together in a series, but as you didn't
you sent this series with unmet dependencies.

All I can do now is reject this series as well. Please send v2 once the
driver changes has been merged and you have validated this again.

Regards,
Bjorn

> prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
> prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9
> 
> Best regards,
> --  
> Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 

