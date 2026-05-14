Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC02BCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xC2NmmgS0B52UHGVBeLUfnJkhTNcW613mUiGZrRaBus=; b=XKkF9Z6RNHTb3izLTLrpcEc4LZ
	S++acbL3+LvexvcbZaoKlVeBdLwGY0xu6hjchNDEChv7oMVw5iVEv+7Eq5oIPaenmIGTnVh8pEGVX
	1bUaonbgAMHNXAyBzpkt340CmbcH4fYXJZAr4aARvhfBZ1D5Npvr+lXHbI+QriDADZvl6bhpKA9Dj
	k4dDu6+v7avlVTyyBa84ypQ9kauogXcxZrTxT3L4o7XauhMOJoBMMoS9ppHcS+mDLL+YM0HYBCF/d
	lhCXI8iaLfWQURH/An2m9QEIkAmCF8YD9x+2zxpWJbJvWhYsKg7iAMwtl87YzMGyCu2vMLu2gx+rw
	F6SM947A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVzG-00000005aJJ-34F2;
	Thu, 14 May 2026 13:20:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVzD-00000005aIV-1Q0r;
	Thu, 14 May 2026 13:20:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDD2343A57;
	Thu, 14 May 2026 13:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499E3C2BCB3;
	Thu, 14 May 2026 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764822;
	bh=pR9BOXtYiFjzO6X76WSQtBq8aCv5MCF6r7vrgFaR8Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LImBuYoPWhHUqrmOqycIrL78+O4wPmLD2rcwyDU9o+hy2HWQnfdPSGmPuPXAMEulB
	 kXtkb/AxfRRBEaEovssZXkA1hBrdf5v6jmK4RTOkbJaksIscBRLJr001+jt7HSs+MM
	 1CNIJU7WeZcA3ll6PxYSi1Gg266l6cXZ0x1ci8ibEZaeFsXpGKK5JYS7+8nc7nzyRc
	 8wFTbkz+twU85BkEhIJ/4keizknO2kqrDMQXcT9wrwW05Uvf/Nwk4EBSW7xeFKvBbn
	 88jFT8I9DlM0ZNNELKmheSsjaLR9epdO4z9wh1LOp4jb4PImER6noSdjK2CUZGdB8X
	 wrKiEa2RScpHA==
Date: Thu, 14 May 2026 15:20:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 02/16] dt-bindings: iio: adc: mt6359: add mt6323 PMIC
 AUXADC
Message-ID: <20260514-elite-shrew-of-prosperity-b6a25c@quoll>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
 <20260512-mt6323-v2-2-3efcba579e88@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512-mt6323-v2-2-3efcba579e88@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_062025_093969_75536557 
X-CRM114-Status: UNSURE (   9.05  )
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

On Tue, May 12, 2026 at 08:18:16AM +0300, Roman Vivchar wrote:
> The MediaTek mt6323 PMIC includes an AUXADC used for battery voltage,
> temperature, and other internal measurements.
> 
> Add the devicetree binding documentation and the associated header file
> defining the ADC channel constants.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   |  1 +
>  .../dt-bindings/iio/adc/mediatek,mt6323-auxadc.h   | 24 ++++++++++++++++++++++
>  2 files changed, 25 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


