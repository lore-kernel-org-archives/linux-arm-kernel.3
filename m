Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B351C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaTBQSFDY9HqCiNlkTKbGEfGfiR2jHJYb7QJIPYFUTU=; b=i8sSTKF+QKZMc+U5SqJYml7bQU
	wIuUkik9bkcGZHQdYPVVCxdME9trXedMidqt5MJY/eyBYERwo8YqBo2oes7ttpf1+yZtpfJ1ZnOsU
	5XKqU0rh/ORmXStk9+11z7ouluD3e37/LJfwzOFlLbs3EL8vRabUR3l/bM6Pm2vdTEaLIDRExlbDI
	o/4pcOdHHB64nvVH2kwWwdAXErLqLR97Df2Dh4SNK2x8Ej/mgI/RkT3OCQ4wdQTFSujQ2/tuFAH9R
	P8vTunBPphH26wmUP2bk8v9X+oePoAJNFmuKUygjDBKlQoiZVV15QpE0gts0NML7udceOyJCI7sot
	T9Avu2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ZqT-00000007vVl-1PXH;
	Tue, 15 Sep 2026 20:33:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ZqO-00000007vUz-2j89
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 20:33:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7761B4E4063B;
	Tue, 15 Sep 2026 20:33:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 400E2602B0;
	Tue, 15 Sep 2026 20:33:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8614A11C7AFE5;
	Tue, 15 Sep 2026 22:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789504403; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=EaTBQSFDY9HqCiNlkTKbGEfGfiR2jHJYb7QJIPYFUTU=;
	b=jb/LzoNA59kiYJnRzas+LoinY1Sw+b4PsE7rgm/n6GJvhG2pg9BnzQ2sLKCzTIcRpQnuAA
	sA4Jc9hJuw3g/bDDXcCb/voAubto6tXDlnvtwVKMfwXTj4pwh4kXh4VdKoJ+tA9CeUz0ZC
	AbgcFPqQbmWWkdJ2hWRvBxJUqnfZyak+cOKHTrkm308yid/SB83QA73zL4rn14Ubjz4HUu
	Ba+WqXLrxosE10orHQzNUG8XMXsJF7Lkb633gTRGy8EfgzQzwyCV6wagjtLXSuiDoIsJX3
	07g+4RG/qkRjf8a+62XVeiBEb6c8/ku0OM+PIfdNCTPxi0PpEcqVCv6URgfE+g==
Message-ID: <5df35a3e-d2c6-4576-868f-d3194de3deb0@bootlin.com>
Date: Tue, 15 Sep 2026 22:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: allwinner: add H616 EMAC1
To: James Hilliard <james.hilliard1@gmail.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
 <20260915-submit-h616-emac1-v1-v1-1-195de0bb1f8a@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v1-1-195de0bb1f8a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_133333_497430_B2FE0403 
X-CRM114-Status: GOOD (  10.75  )
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

Hi James,

On 9/15/26 21:03, James Hilliard wrote:
> The H616 secondary EMAC uses a separate system-control clock register
> and supports only RMII at 10/100 Mbps. Add its distinct compatible
> without an older fallback, since using the primary EMAC clock register
> would not work.
> 
> Constrain the PHY interface mode to RMII, matching the hardware. The
> EMAC1 clock register also retains the three-bit TX and five-bit RX delay
> chains, so allow the existing Allwinner delay properties for this
> compatible.

I don't think there's such a thing as RMII delays. RMII has a single
clock, contrary to RGMII that has a TX and a RX clock with a 2ns delay
between clock and data.

I think it's just a leftover in this IP from the other variants that
can do RGMII ? You should just be able to drop the comment changes here,
and same goes for the dwmac patch.

Maxime


