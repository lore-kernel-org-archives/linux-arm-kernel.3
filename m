Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDDFD0BB6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iTiKWhMpK7EIZ0naCr+kTQUdsYOrUwqUBs/Lrr3L1E=; b=IuhGFwdMOD01+99/LJ7k2g3UGO
	82ado2ope9ry9uEeHvz7GdVP2dq09zUC5pfIzdJVv548VpypHaGkaMgWR2ii+UbgTYHYaYMQRUN71
	9ABQfVPgNxgHiy4PtSG6K9uCh0dwAWywonY+mQ7P89CL3wvwnhieEMRLTuFPMmLvkuf2h4XQ2HzIk
	sv41YFUppxy3GBMKoxTl/lrM8J3S0EXYDNlkvHh1CE0Z2t4aHgxbRS+HFFGENHgCHcBEhudpLP3Le
	Q4HrjEI1VkcugytBC5FdNqsxpZe77APKOSv19Jcb0/4mvFJbVk+nwQgdec4jBMLFypG46U8vJSbKW
	Z1Fk+hwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sJo-0000000H6Rj-3Uo8;
	Thu, 24 Oct 2024 07:31:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sFO-0000000H5dY-0S8u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B707A451AA;
	Thu, 24 Oct 2024 07:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F971C4CECC;
	Thu, 24 Oct 2024 07:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729754825;
	bh=dm+M/P4NK/WpteoV6oB24kvkqvdyHw/jnfh7uzPyRMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q09TGzVTI/tJtefI50bhpQ9G/FdeaWNS2eT1/YNRgnzN8EkDfAdfbZYyeZF8mXjba
	 e1bhgOCLl6oVdwkgr0KbGfcr56RheAC6MQELCeC+OXd81RNopNmrPgbMUX65gOO0ns
	 Bjo6jw7wHRT2Q0ML1PK9PrfMghVc8TtGBMQwNRP7WqMV3/GrQpgeknyUC4QqL9sWzT
	 Gu0T6QO/G2+cO+alsPYZ/cCbXcuhVy/LiQYejILbzB6CJXBvhnSisElvRiVbVV5xHa
	 kvkto2YbjZOiHote9KbM5+0reKiD6PDn2Yza3Nc8EHDX5N72PWx9+Ltt6ESS7AKcFu
	 9nRMRa65CxWNg==
Date: Thu, 24 Oct 2024 09:27:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: samsung: Add
 samsung,exynos8895-uart compatible
Message-ID: <2kjgpsms7b2sdxny4s4s5ukg5j2ncaizg2kiqbvgk4rposrpuv@ijthdmntpbfb>
References: <20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com>
 <20241023090902.538040-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023090902.538040-2-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_002706_246982_8F39C820 
X-CRM114-Status: GOOD (  11.78  )
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

On Wed, Oct 23, 2024 at 12:09:01PM +0300, Ivaylo Ivanov wrote:
> Add dedicated samsung,exynos8895-uart compatible to the dt-schema for
> representing uart of the Exynos8895 SoC.
> 
> Like GS101, it has a required DT property samsung,uart-fifosize, but
> it does not exhibit the 32 bit register access limit.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/serial/samsung_uart.yaml   | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


