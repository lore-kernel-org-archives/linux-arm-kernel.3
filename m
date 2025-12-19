Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD952D711D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqYj3kp4vGFfgznT+kb079VHKaC8CbgqJJyxx5sA7yk=; b=aE+QLatJyy+4RgHzFQZhumT1i4
	4J/VAjEcvN8bsbAryi42hH2er/d3OA+hR/w/xkQf6T0TJK+5MWotB94IGNIrw3J8NUX8ShQDM4nJg
	kAWERwPXVrxNiIytvrNA+Tt1xCFxu68pK/Onf8H/gTgf+zxoVocQO6vlQeeMHzvnVwdMRRgnYVF0k
	owB6SEy0H8i5XpYKqVQvqhPe3XJfhCXCIjjciHnHPrWcBEI+FBXW6QiBKIIUG+j36vwCeq0rn4OdP
	RSuYAJjCEUYAYAxwYmSWF1SisxEux95q60zB+r8nDPcUkroBMJplPdFQw7vLE61LIvfxm/4knCp5C
	0bCyYexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVcS-00000009paH-1M0k;
	Fri, 19 Dec 2025 08:13:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVcF-00000009pGQ-3kpw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:13:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B6E644483;
	Fri, 19 Dec 2025 08:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EDDC116B1;
	Fri, 19 Dec 2025 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132015;
	bh=cncj1vQbL+/eWAXFExp1zdbbgOCmpPCBhifnAimmpCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKAkW6F4K8Y0wqcLa34tKJxXK+a/KQfH/sVToa3TZKp57+llXfnNMePUJ+lYXgh/B
	 M3NjLpd6IvFrjz+dPOKgv7e+8QR9VZ19Tje8FVa/rWA9utTHqXu9fOekRYhN1eQpay
	 NjfCbZ0YWqgb+Bj0qjfWHUSBe12jPOZsHUzOhdtu02lYJ5JkfvsAVhL05fz683d7wB
	 12AGe95rco4OF1XR1oRhV9B9OvcvMGOzMVArU2BEnnw624d0/74te0zH1lNy9+rGTw
	 2TLU/mvB3h9DvnPA0YEBDan8jlMQp3qJh48RcIne2Cife3WFDHdv85uLc4fOOhuzEJ
	 10Z3NMF/TkkvQ==
Date: Fri, 19 Dec 2025 09:13:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: add i.MX952 EVK board
Message-ID: <20251219-inescapable-powerful-bettong-3e9dbc@quoll>
References: <20251217-imx952-v1-v1-0-a55a7fe2df0b@nxp.com>
 <20251217-imx952-v1-v1-1-a55a7fe2df0b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251217-imx952-v1-v1-1-a55a7fe2df0b@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001337_875166_F44CC430 
X-CRM114-Status: UNSURE (   8.60  )
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

On Wed, Dec 17, 2025 at 09:58:26AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add DT compatible string for NXP i.MX952 EVK board.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


