Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4758DC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LSSgAVnxemyLKnDHH2XvGz1hoE8mivtd7FyCCesj/k=; b=zrzWuB8VMV2kbBPp6RcClmalzh
	bkNbZ7Z/tE/RX1A51XB7dMgX5Bh0eDKAPFVyOENmDKEy3bh0UY26Owk1/pZ27TLPjVhNwpQQX0KtQ
	v9+UAntlg9+uRkBCkQy+dyWQ1rOa9IciFMntPmqBmRf9fVv5zkBYg0Df1eDOzh09cgAdGoND/6q1R
	f2MA1Wxm2JCsu7Mc8LL9mZFcdAyFgUfqyeTd+0z6keM1LZrCDzRCZF4R2lYE128FxrnFGE00OXjQx
	qwiY94yx+/NgImA5DHmvgBnoxe3MpjSs7YMgWXBCXVOa/y/rrHJyDLn1EaomdNdWe/eA2m6WEt4sb
	5eG8ezTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAT4R-0000000Fg7D-0UPg;
	Thu, 01 May 2025 12:31:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASbZ-0000000FLUt-0Gzw;
	Thu, 01 May 2025 12:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4EAF68468;
	Thu,  1 May 2025 12:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CC3C4CEE3;
	Thu,  1 May 2025 12:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746100888;
	bh=wO38hj0kH5wwFVV788X9fXlS0WBLehhmfHhlpKQsYvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r91DJqwzqLwYugfxG2pb0c35WvYMJaYiQSAzcjSB9ovMk/EnuGFWt2MzM/ytGRGdC
	 wAZKGYA+vz/s77fg7aQPZpAlRKcIT/igILGZ14jGoQZRtnvMqHOqkLkJwPy7JSpIpu
	 XDcukosA/Y5OgnMQVJEm1UnxIJQM61jiR71p9iyLgVv43hbMZ2gAbN2M6b5oOH8MEX
	 eADFKDx06fKC+QJCJEL2g+i88z65RYvJRGtPFmWl9dLMhjXRqk6a3+1YKebnYI0UTa
	 HUNw7+7h0Z7T1NnKcVsO1ulcz0ucQy6ZlItp/CCK3/P4KLZaEHM+QCaMeinOSEse5R
	 h5ur5t/0ba74w==
Date: Thu, 1 May 2025 14:01:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, 
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: imx8mq-usb: add imx95 tuning
 support
Message-ID: <20250501-incredible-skylark-of-awe-e0c2cc@kuoka>
References: <20250430094502.2723983-1-xu.yang_2@nxp.com>
 <20250430094502.2723983-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430094502.2723983-2-xu.yang_2@nxp.com>
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

On Wed, Apr 30, 2025 at 05:45:00PM GMT, Xu Yang wrote:
> The parameter value of below 3 properties are USB PHY specific. i.MX8MP
> and i.MX95 USB PHY has different meanings. This will enlarge parameters
> value and add constraints for them.
> 
>  - fsl,phy-tx-vref-tune-percent
>  - fsl,phy-tx-rise-tune-percent
>  - fsl,phy-comp-dis-tune-percent
> 
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v3:
>  - keep original unchanged
>  - enlarge value for some properties of i.MX95
> Changes in v2:
>  - keep widest constraints

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


