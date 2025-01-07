Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DA2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSYtMC9XE9pM3J9MdUEmKHJccIvBb/CfycAt5KfDd2o=; b=bB4BMAa351Cet9Z6p3xZpZ53JX
	lEhXDtqKlykL/V/DO06QT11Wamp87GtVSpH2rH28g5yVoGR8ChTghh7UIjboomZDEUgdFiRs0aKBE
	DLyZrv0Zvgq9NTM42/fkZ478w8Mee0gPIRbVuF7Zqe33KoMWFvFrj6QZKFnf17VyN63RBAv2a6xVO
	Pcbr264RJSyAqNud6lp4Wh0cB12mkbD3TaC2CCfoUaF4PaUWPf74p7v9Nj6RbKqnK7eYtOmPyjncJ
	GzZZ98Fsmd8Q0E9JsBpxto4BRTOSkULfAV7r1rUineNJHrYIMU3nK5IjMk5ThrWEHwUhVUaY/zEvw
	I3yqZj7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Rk-00000004y7o-2bu7;
	Tue, 07 Jan 2025 13:16:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9MD-00000004wfx-3shY;
	Tue, 07 Jan 2025 13:10:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA0CFA41194;
	Tue,  7 Jan 2025 13:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C9AC4CEDD;
	Tue,  7 Jan 2025 13:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736255452;
	bh=fLby7RmtqFgkq0hZnNCEPuxeUfnBSBSrwvZ237HZbOs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=WkNBqjpfT7KKhM/f78qZQIFRDy+o42B9Af5XsAHCztHXmckom/t0fkGKdrYbmRfAN
	 +7IIRSchHVmfgB2O/dnady+xriNeJ8GnYZmkaMqmMElfKeVn+W99hKsulP28dDYHY1
	 rbtkoSk+FHuEiEDaKFGutWYq6dne4rkp19x7avvI7Rol7WV9Fln8Itfh3sOKYDmIO8
	 DBzDRxHIdmg2C9dOosm5sz/bp+6Wb0RwbC8H5Strg/UNgVyrK6dZD5Pg1Kf61/xZb/
	 YYR5luvVGVQ4iaNdl1BExAlfGcBnZ/9E2upQ1mym/8nMhW7B1in2N/hPz59gxWiL4b
	 0yRxnP2vAomFA==
Message-ID: <f4686d25-76d5-41b9-b82e-2787917deb89@kernel.org>
Date: Tue, 7 Jan 2025 15:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dt-bindings: net: Correct indentation and style
 in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Marc Kleine-Budde
 <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kalle Valo <kvalo@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Dario Binacchi <dariobin@libero.it>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Brian Norris <briannorris@chromium.org>, Frank Li <Frank.Li@nxp.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org
References: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_051054_035444_7F78CAE9 
X-CRM114-Status: UNSURE (   8.49  )
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



On 07/01/2025 14:56, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---


>  .../bindings/net/ti,k3-am654-cpsw-nuss.yaml   | 20 ++--
>  .../bindings/net/ti,k3-am654-cpts.yaml        | 36 +++----

Reviewed-by: Roger Quadros <rogerq@kernel.org>	# for ti,k3-am654-*

-- 
cheers,
-roger


