Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A87E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdaltNirD+kovkUynHohinLaq4hFNU25F+2RNwvPm+g=; b=ZoWHGUWiuqYyk3xEIhlakdc30D
	HJk1715dQr5onzvElcJkwJBCNpSWPEaRZCBhpSV3Wsemg9j6AVB4Lpw7Ba6aFFPh1DrsiIx9QCm1d
	NHkxU0cmBGONIgEx6MW9iCOOFQmAzxpCH75ByESs63Mya1D8RfuRrAA3ObAX3AMx8A1d8HSrEFy87
	QzB4bsllbiCfguN5b/Ekvy0SYOiiaCdZH49VWq0hQR473QRmTBQIZnqEXxzqyHLec7lnDuqNT694G
	ooEzKZOSdiRuakkAtFG+cARbFWtnH3nIsLqymbx04A2kxAZ+zsxkK+48DtGaSOiuXV7QeTieFZrIW
	2Lxh61uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSEf-0000000Cbv1-2zkp;
	Tue, 17 Dec 2024 07:43:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSD2-0000000CbfL-0svu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 07:41:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 909CB5C6359;
	Tue, 17 Dec 2024 07:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40B1C4CED3;
	Tue, 17 Dec 2024 07:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734421295;
	bh=70sywZhuH7sYVF1lNVXtKGVYFA8RCgLd1FOFxBqxk+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqiyWHzUomXM3/5gl/IVae86Kkcdq9OOSNj+LbSzUWHn9mjxmoOBz7UyqM23lb3Ha
	 /ODBX4MFCO68B+7ktSp2EIlj3m1Wlk72ghRAUsbVX5VJeBA6Dr4H9Ir9St1h21KBs+
	 h91hdjPmctW4gDBFoi2ARe0gDwLbwgh2XIC9kjnE46tV14jZZms/5M4pkfH7Eh10ik
	 /j0ASlr5YmHkaDpcOWC/PJk+gqqWHXqU5BCEze4tz+0wCE4QgNmPNMjynWcr2a95mD
	 rt3JkFtxHtUFhVo7N9FF2JipscsSivQ2LtXkbFsfq1JErEiR+WkSk6OBkmvd1v+Jtl
	 BOEBnHcPRknbA==
Date: Tue, 17 Dec 2024 08:41:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: imx283: Describe sensor address
 using the reg property
Message-ID: <z7nkfmqubqabfxjpffhl4gaztec67xrfaulzd5d43bsyf2ukeb@ebak7s2bmm7j>
References: <20241217032821.1712916-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217032821.1712916-1-david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_234136_293874_7AA1BE9A 
X-CRM114-Status: GOOD (  11.63  )
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

On Mon, Dec 16, 2024 at 10:28:17PM -0500, David Heidelberg wrote:
> Use the reg property instead of text in the description.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx283.yaml         | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml

Same problems.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


