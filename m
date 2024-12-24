Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA50E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpZHp+NVQII47nk5R3xArR0TPZHVAjKgEjTt74QVvDY=; b=oiToRHxEjWkSKKBsYPjWOtT4Ss
	8UWalHKAmX0cRpTq03fdCUHlWtJryD9+w+a6GbD38fBtzQhjmwczi4QBQ6Ze8lpZ3lKuOi6TSw1gv
	7a73oIepUnOMBM+TlPtP+tz789MHwS8c8aaauM4E/kuhua9GxXKvYSwdg+jiB7Lw7LV/qo6a8PFjt
	yvl0GOyH4mco9jwxcMmOBTbBWNi4Ea4pLngqyqITcAqkBUk8TCm2eRODhJcpjBISDH3R0L4UVnLA0
	omRYX7K3zbF5YpBQuwAjlycTGK/NrIqj9FBHyoYtT/LXavcL47vXKf+NQGTCQLQj6uH0KyAFg0W79
	LoSFwokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2QF-0000000BnOn-3u39;
	Tue, 24 Dec 2024 10:45:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2Mz-0000000Bmq6-1uPD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:42:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 122CB5C53C5;
	Tue, 24 Dec 2024 10:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBE3C4CED0;
	Tue, 24 Dec 2024 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735036952;
	bh=BiLEFi3wUIMXynIvvrJUUlqWnxsog+eEjk5ujxhqeNg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eMWWSZiJGHhpvMsugSJloNQEnZ6UXJpG7Tx/QrnH1/lPwJP0x0/IU5OIwfDDALCK6
	 mcCSN/ehRNaC6fZ0VsyMDrqI95RL29RzH1ggzdCUbUpM9DxhqXgkHFEKDofJZUsnxW
	 MovyYRnRLfOx/mkEfQKL+wiZFTMSxapsS6TBg3MBPCyhf5CrkwxI2hOaRXKis5aj9y
	 Ra7CHalvuTl6U7veGJEc0wrJ0+i/u+CjlWrcKoMZ6vEOHpBG1cytmPFK56gFlP/45/
	 Ga9T/fUMYjdnIPkc6U/xcCiveAg8zxEN4/zjB1vGodt5KnYPfGqYufz4lzttTdWcC+
	 AhiWnbaZ71oGg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Charan Pedumuru <charan.pedumuru@microchip.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241205-xdma-v1-1-76a4a44670b5@microchip.com>
References: <20241205-xdma-v1-1-76a4a44670b5@microchip.com>
Subject: Re: [PATCH] dt-bindings: dma: atmel: Convert to json schema
Message-Id: <173503694919.903491.17046143764457899816.b4-ty@kernel.org>
Date: Tue, 24 Dec 2024 16:12:29 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_024233_541444_1C6CEAD3 
X-CRM114-Status: UNSURE (   7.46  )
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


On Thu, 05 Dec 2024 15:26:18 +0530, Charan Pedumuru wrote:
> Convert old text based binding to json schema.
> Changes during conversion:
> - Add the required properties `clock` and `clock-names`, which were
>   missing in the original binding.
> - Add a fallback for `microchip,sam9x7-dma` and `microchip,sam9x60-dma`
>   as they are compatible with the dma IP core on `atmel,sama5d4-dma`.
> - Update examples and include appropriate file directives to resolve
>   errors identified by `dt_binding_check` and `dtbs_check`.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: dma: atmel: Convert to json schema
      commit: 5d6670033a67b288ffbaa0774966f356b9c4ba5d

Best regards,
-- 
~Vinod



