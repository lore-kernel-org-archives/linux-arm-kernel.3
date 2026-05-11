Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9515DCD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXceaiO3zArjKsknNI38ZeLBmnQpu2eG167CB0kb/gY=; b=q9SCHiiwKlBfwMtXl1Iu9IfYqL
	ai8ikeGeJ5zTQwWLesqSDRBuFXDdCepjrZCGeum19sJdIwZEZZEfumQraH14zxX7ArTZEnjIjizwS
	qBQWThDV8MQ2JNt7IDBH8sZRTgVEbiSqNiDj4R2vFg1Bq+xt8/69+MiI3bVupPUw2vgcCz+qWJ8IF
	fWsAJmPyIAQVMx3CUIO3FuLWX/TtTN5IJ07z1XK4LONzp/1HKUD5EEdg/VUr6hSQTHxjKr8DcC2CW
	pK+gR5GLCNK7g5tcSte9/UiRqoipaWJEPniN9cX3O+uBqeCwMBQQVNrV76fjGsr3klgR3E6g8HVJf
	5fAf2R6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN4N-0000000Cx9T-2NYg;
	Mon, 11 May 2026 09:36:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN4A-0000000CwxS-2sWQ;
	Mon, 11 May 2026 09:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492199;
	bh=24y8Yk+6S4aEezTTwMP1/h8UK3CpDNuHCkyaph+CGPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e4zaLhlE0T6OinxvwmvScVoSGJWEvZqxl4ZTQvUS+hRwqgmzn1xeaZvpi44cMJ26l
	 zweHhIjYRQwuUhnrgyGm9V/VvDXxW+lLiSCI2ThwsXbkUShQtAVtZQwfZ7mfCct/1Q
	 dBatf4zS6Im8vT2cYydey4HTbXdWRcWocBrZL65We7KwYyZsDhA5g6/m+J5pvSUCSZ
	 +XS87GbLLPX8BlkFtR1uMB1WwPuk8Eb4HNs+gDctoYzZBK5e2zBYvG/w4bmIQz/vnc
	 8ksxPMgdH20boNz2PA0eX60be/4XuydqUGuaH4l24a2g1JLlwRnY9esB+HpgtqXLIs
	 jfgOAV1JulKfA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 56A9917E1537;
	Mon, 11 May 2026 11:36:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260430120725.241779-1-wenst@chromium.org>
References: <20260430120725.241779-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA
 bounce buffer to host
Message-Id: <177849219930.115964.12285046748812181326.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:36:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_023646_994861_26F3BCC7 
X-CRM114-Status: UNSURE (   8.26  )
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

On Thu, 30 Apr 2026 20:07:24 +0800, Chen-Yu Tsai wrote:
> The DMA bounce buffer is attached to the PCIe host controller, i.e. all
> PCIe DMA transfers should use it.
> 
> Move it from the PCIe (WiFi) device node down to the PCIe host
> controller node.
> 
> 
> [...]

Applied to v7.1-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer to host
      commit: 0f91911b61d06fc02a058ff7fb0a27e53f7b1136

Cheers,
Angelo



