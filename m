Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8261EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XO+0wzTAjAArcXNcE3OBEusc8OsKht7P/UpbhTtnGCQ=; b=Ayum51cHwgFefQjzLqCWPfgSh4
	rkTykE/XrhuNI9VUVuiddfd77ZZCC6ejIBpvgEcSKPfooUftjA/eQN6Kg4NoXkJiIZCdYv2+d+3k2
	G6OrY0RWlewXQoFKfGzc/EGigC67DIachfyMZoQGy14+3ObYzZK9270LmDdIkLxqbl6Eu5+ZpFF0C
	jmg6N/DpFVKMHzDbI9xCNlCBr6ow6G60INWOKBSva1trDTm0zTNLsqYefkYzx7G/VbJNiZdS3+tLY
	NHHmHIXHdJL7p3fyxou5kNlnUZf3sDN6hmJ8DcHCZ4Wj/S3qi6XlAQEz+lnxXyRhDWiXWHaH0/SBs
	1yS+0kUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDQi-00000003LUS-0yu9;
	Mon, 17 Mar 2025 16:35:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDKc-00000003Kg2-2xox;
	Mon, 17 Mar 2025 16:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 681DEA4870F;
	Mon, 17 Mar 2025 16:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71585C4CEE3;
	Mon, 17 Mar 2025 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742228929;
	bh=XPfFKF+fFLO8s+Oa/5gdzWV1lUqv56azyZGzYd7AZdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fcAoy11oWtbs9tl2eGNBQQ1nGokJ4IzqOf+jUwoK95t5R2jCTOzSXBI8WEM9j4Osf
	 88KMO1DVkdcNflkshQ1n4kCVsIbvaiKaeEXo2I4DsMHx7W6jybxRxelBvjuNaLkeVl
	 dt5wQqslm2Lk7Sylpv9zCTw+lk18pBI2XYHRVN/N9I6dJft5Ywj3Tgzl6vLeAc6eRX
	 Hkf57mDhlr5cvWC1ejTRPYf2YIdg6M77j+NT9Uoz8G8P6m+zcnjwTf/8woGEn4LDyw
	 hdAfXoYv0Hx2/EA5kUGhwF5PJawUkpDBTJonoM2n1N42Vjck5ZyxkcMAVKCn/y7yL0
	 j3EEF/PonkRhw==
Date: Mon, 17 Mar 2025 11:28:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jiri Slaby <jirislaby@kernel.org>,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/7] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for S6/S7/S7D
Message-ID: <174222892762.176016.11358063656665993798.robh@kernel.org>
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
 <20250317-s6-s7-basic-v1-4-d653384e41f3@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-s6-s7-basic-v1-4-d653384e41f3@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_092850_805941_ECF90580 
X-CRM114-Status: UNSURE (   8.90  )
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


On Mon, 17 Mar 2025 15:16:55 +0800, Xianwei Zhao wrote:
> Amlogic S6/S7/7D SoCs uses the same UART controller as S4 SoCs and G12A.
> There is no need for an extra compatible line in the driver, but
> add S6/S7/S7D compatible line for documentation.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


