Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F9CC36005
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLddovV/ozkq12OTUAIhgV0Dr4yMCJsz57neSzf1sX4=; b=gw3rFX4+JpYjGasCD8nboLybXr
	QwHUvaxGTPYoXuPaKVDg0guG5FLzsJEY90W0FEoaPj0ayy7xNA81yEsXlAsLoMXh/Tw6RlAaa5xez
	3KVTNJ8gUWGMPLvVR+mQ6vEissNzUSPSws04RgCiLN6hF1X5dX0z1U7wHkkj74CCXx4wQgndqiqQi
	Xpx1orsOI3HK14DGEUHW8a1xjr2Uh1qZN16nBZQHTpVNQTddASb3Xlc+e4mkGbJkH0qBjLTOeP8x9
	2g/rkLIVSmXFe05gXI3pnfD4/ToE4pCgZwwfjZ0zZbxTeqjnxCbrYHcRvpdhEK/Fmnd4OO3mxVNbS
	GiWBdxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twPF7-00000001Who-1QrO;
	Sun, 23 Mar 2025 17:36:13 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twPAh-00000001WFD-3SWK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 17:31:41 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 9EFA5240101
	for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 18:31:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1742751095; bh=OurAn6aCCufPe8wONOg+FSpmWM5jwOYj7w2wk4Opzkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=r5iR9wvLmJ6T22umB9tvcB1t9ewqJyL2aJToiEyOKXBCoNBaT9XfvUD1hhQDxpdLr
	 5R4/P5R760tuVIuAmG/Q/dXSx9jyPKQD8Goq+zpYETfu2OaZfxkZderCj4UxbvZzvu
	 Lk5L7Z6F5UxzOOBt8fcZoqC2JUiCDdTWPMXKxamIWsndHKcDRa9R008qLLfdwWHucR
	 B4BkT0DDRGUOgsZmyRNq/JiL8bcyorr0xdTUF1GQL2IphoDHKim2uvIa6ODRn3sZl6
	 p5zm1/lVM0gfa2326wWhMTPOSlILO4XA+KP0KlVCFlLn7SPbvtu9oHPsRtaKcAhFDw
	 2GhCetTHcV65w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZLNX531ncz9rxG;
	Sun, 23 Mar 2025 18:31:32 +0100 (CET)
Date: Sun, 23 Mar 2025 17:31:32 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: HDMI output (Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee
 3.0)
Message-ID: <Z-BFdMfqVCX4T3NB@probook>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
 <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_103139_998381_5FB96A7E 
X-CRM114-Status: GOOD (  10.15  )
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

On Sun, Mar 23, 2025 at 01:37:52PM +0100, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> Fernsehfee[1] ("TV fairy") 3.0 is a set-top box with HDMI input and
> output ports. It originally ran Android 4.4 and a Linux 3.10 kernel.
> 
> The following features are tested and known to work:
> 
> - Ethernet
> - Power LED (switching between green and red)
> - Power button
> - eMMC
> - SD Card
> - USB
> - Wifi
> 
> The following features are untested or not working:
> 
> - HDMI input and output
> - Infrared remote control input and output

FWIW, with Martin Blumenstingl's meson-mx-integration-6.13-20250112
branch, HDMI output works (albeit not at all resolutions).


Best regards,
J. Neuschäfer

