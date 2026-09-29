Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E13CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B11N4wmqUEXrSapXqi4bJR3HMzWuEQfMnAAFeMKPzww=; b=heCMla6cKlHouhPwiT7keLdwIX
	Ix+/bBeym4OR4oKv4eDMm51nuu5nVTt1/Sb9nzKsP1Vgt+CaBPSdQGM7zDJN/jsDqcmGD7QD1IR64
	cgth5Jsd9MxVT6AUf6uPMZaURs6DS6VTmpWRF8rJzGoxbiIzsTUQBExmMhMxNFJyirzD+VCoA+WLR
	+osjFnNfQbkXVcIXM05O1a5RTfcHkfvl7OINYmpefse2bMJ0qcAL78Fai5TIEv/JekQgeckbhensQ
	aD4LYsfIoHlnxTLWLK32gT1jFTqDxjAW3pnZXm8qXnTpAeOV9nMZCWcaMApbmDtjdaUvAeAstgrL4
	mpL4LcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfW1-00000004cAK-1V7N;
	Tue, 29 Sep 2026 21:37:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfVz-00000004cA8-3Tj3;
	Tue, 29 Sep 2026 21:37:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B75E40381;
	Tue, 29 Sep 2026 21:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92251F000FF;
	Tue, 29 Sep 2026 21:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790717851;
	bh=B11N4wmqUEXrSapXqi4bJR3HMzWuEQfMnAAFeMKPzww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZerkEkycSvlmUHsTgWUQGweEcC4y0RHzGZa0L/tuN46HLSmtwVgbB4l8+Gw8rQZwb
	 1aPK2Ey+z+0nYuGBNXsfRTEFBWXThtKOMuuCmV8YUyaoPQrayQ1dISHElroIGXZwtU
	 4W+7CcZF+Kiga7iMBkpRfr6j/UpeO9JKk/3vOBA91tgB2qksxNqRlCZXQACMEYi/xT
	 ojALRZ5xRyN3NfEfl+uHsB1KSHEzCRXUANseT+DySFF9biAvaotrzpOqsxLN0TNg8H
	 QDri+cZ3Vn/P9nxre2ce9xRD95ClvU3qd1yiS6eEF6LXsAy6JLWsbIV4x+crt9epDq
	 LMyDUIQTARPgw==
Date: Tue, 29 Sep 2026 16:37:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, mbrugger@suse.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, Julian Braha <julianbraha@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-rpi-kernel@lists.infradead.org, Sean Young <sean@mess.org>,
	Stanimir Varbanov <svarbanov@suse.de>, Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v12 1/2] dt-bindings: pwm: Add Raspberry Pi RP1 PWM
 controller
Message-ID: <179071784935.2855464.8360313388154937675.robh@kernel.org>
References: <cover.1790686331.git.andrea.porta@suse.com>
 <ee0aa89faa14e0073f1271693bae28678652998b.1790686331.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee0aa89faa14e0073f1271693bae28678652998b.1790686331.git.andrea.porta@suse.com>
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


On Tue, 29 Sep 2026 15:02:11 +0200, Andrea della Porta wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> Add the devicetree binding documentation for the PWM
> controller found in the Raspberry Pi RP1 chipset.
> 
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


