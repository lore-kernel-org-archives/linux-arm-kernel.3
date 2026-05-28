Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED03CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSIjaXcduwNYBJCQrGtQKLo8lAav4xOuWF8oe+nqQKU=; b=in4LWeRmT9dYCC17yv5V8C/uTU
	qE27SNnaFDKayye0V6pOFlvA9t9JDAMwPzkho3sx/kCy8lwp/boDgSlZjDDYZG/jq8J/HDJ6wZktn
	O8Gs7Z47NnJYfusFpNjhHSRn9fRwAJ+U4/UxmhajT4XdvYAZBblvNdCiezg5FwKEEhDpNYvbRYbbR
	LE3FIiPp0YFAMzowJD2NzvaoT4YmjmE6xgbrTJKtdFD6tR25IW7fJvzge0F6fpd9+h6juwgfZnRUm
	V7UUKpCHHijxsi1Y9S4sn3CqUpQeSAKn0fDSxRzmTR6SkjZ7w1OZ0nxrTZRSQFe6qUsNhg4TqXpvq
	cZyNZzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVKw-00000005HGv-1d7n;
	Thu, 28 May 2026 07:39:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVKu-00000005HGI-1Pe1;
	Thu, 28 May 2026 07:39:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE02844438;
	Thu, 28 May 2026 07:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3711F000E9;
	Thu, 28 May 2026 07:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779953963;
	bh=DSIjaXcduwNYBJCQrGtQKLo8lAav4xOuWF8oe+nqQKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SVp+0DpWalSi7cdfdBP7UfszYqPQZkiQ6CgIvR+C5PufGehp6wsNS7S0VM2rKBmmi
	 UWPJQ3vKqm4RBEeXpGml01oRpLdtxBrfoZE4yUPu42w4GaJ55oYmHGmjzNFf3PGRCA
	 sOW11CJnfQjqtcUV77j8BsSdZ/gqZBY8L9IAILV5OW0GRpy0hOWKZA309StDLK/L4h
	 NUg72vfoIBA6+gHaG31hdWQwRHkL/TT2QMtgb45jKE8hkvIfSc1oHiH8ZKnTOt+WZU
	 PT1RzASgc0m3MkFpvyB4E8THmx3kdhkOLj3wDel4jEsQSSH6UUNCzlfXlf3no34duc
	 tpNlVtxau+9RA==
Date: Thu, 28 May 2026 09:39:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux@ew.tq-group.com, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v23 5/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501
Message-ID: <20260528-nice-bronze-cat-19be71@quoll>
References: <20260519-dcss-hdmi-upstreaming-v23-0-5615524a9c63@oss.nxp.com>
 <20260519-dcss-hdmi-upstreaming-v23-5-5615524a9c63@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-dcss-hdmi-upstreaming-v23-5-5615524a9c63@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_003924_398638_BD13B43A 
X-CRM114-Status: UNSURE (   8.59  )
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

On Tue, May 19, 2026 at 02:42:28PM +0000, Laurentiu Palcu wrote:
> +    required:
> +      - port@0
> +      - port@1
> +
> +  phy:
> +    description:
> +      Child node describing the Cadence HDP-TX DP/HDMI PHY, which shares
> +      the same MMIO region as the bridge.
> +    $ref: /schemas/phy/fsl,imx8mq-hdptx-phy.yaml#

Another new thing... at v23 you should not have major changes to the
binding.

You do not get separate node, just to instantiate the driver and sharing
the MMIO suggests that this is the same device. Phy reference from your
bridge into the child confirms that this is the same device, so one
device node.

Best regards,
Krzysztof


