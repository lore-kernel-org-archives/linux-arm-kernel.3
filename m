Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC75FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 08:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oho0sC1jSrwodOAVxU/5tmS21hFCt2D3tgPiKyJNKTM=; b=cmIByVUqy7DrdUjfnQ/9T1cdH0
	Cn6zYDXkiviHzk9x7EqfOxpd76qWvm1NcCvAKeYVTNYJTVrVz6aH4zIWKjBI0o/g4AkJii9aEbhRO
	rlIpNiYOmUQ/KPaDclrDUv1uR8A3d3IQZtdcCJzN6q1mQiOxaR5jAYsfCwfzC91p36x0IWxyHKR4R
	GXJehrApUvKmlZwuX8xpL/UDRJnlCUgxztpFDiBj5GvYv6GbPz4cwEtTADj+nrtRrAXSg77CkXoLi
	yp2zK65V7kJ2pDXJXcGJFixTtX1/0JncFFhgkQDZbJVRJrUi8h9XW610QXPClGk7Pud4qz770dmNM
	PKqfljhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJoSB-0000000Ch4N-2nSh;
	Mon, 04 May 2026 08:14:59 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJoS7-0000000Ch2v-19b0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 08:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=oho0
	sC1jSrwodOAVxU/5tmS21hFCt2D3tgPiKyJNKTM=; b=igzrGHO24jzc/UsTN0zg
	k6cmg1FvLo8lJ3A8miK+pZaAKKpQ6uu19CAO5iy6lHLUinLwxeyCfVe5rDMlcWnF
	/s++sfHoy01OHEpo/r0RxwncmAj8bEieyUC8XQkD46/L+iMfdzXAHXKFoSn+CIFm
	NtYPBYc4veraWVbhILTzpEvTAp8RDkh61btSRLCkJnzpYs8lLudJxFVJxyL9lXu/
	wF1mqDfHgSKgTaXbj0aq4E3+LNKqGYPg1LtPXRJA1IERYVO69lBnaFa+FFZ1BRJW
	YZXDOwxaO2KRtXfbOlhAk4wxuISVDWtZuuW7j7jw8oQfr62f+2JzhocJI6wOH4tU
	ow==
Received: (qmail 2098934 invoked from network); 4 May 2026 10:14:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2026 10:14:48 +0200
X-UD-Smtp-Session: l3s3148p1@lQYthvlQEIsujnvR
Date: Mon, 4 May 2026 10:14:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: i2c: amlogic: Add compatible for T7
 SOC
Message-ID: <afhVeP3Y8D4pfkAt@ninjato>
References: <20260424-add-mcu-fan-khadas-vim4-v5-0-afcfa7157b23@aliel.fr>
 <20260424-add-mcu-fan-khadas-vim4-v5-2-afcfa7157b23@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-add-mcu-fan-khadas-vim4-v5-2-afcfa7157b23@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_011455_589316_E412B009 
X-CRM114-Status: UNSURE (   7.63  )
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

On Fri, Apr 24, 2026 at 04:17:33PM +0200, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add the T7 SOC compatible which fallback to AXG compatible.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Applied to for-current, thanks!


