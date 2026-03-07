Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71355FC9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 12:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qXYhI7YX+RYnYSppcyuOPuLjHiZGdsQ6C03o06YUSM=; b=gRjEnWiGsGBUtbQb49XMYLxzpK
	9jzVlR/n9CRhnndt7eLBYwBBcd0zZ9xyBXEEsFejjgAxgH9kNxPe/ekUa9OQOkB+LAW4W2quMYRAO
	m3aGC2oZYJMEDSJ/d+8cg2xJeQP57l5YfkiUUC3+3UPxSUrDqkQjwqKw7bVYiv6wJy4MipoC9zTBN
	B0PL2CZPjgPdkjp5/i/txZEBYSQhb+Aph2ZaVNTloMApqJCd/Rj5fLL+de37jev8iaRekLcGtnmMW
	9tx15BZvXy4k+rvxugYzLM5VvT4ajrj51GZVJljI2RExQFox7T+Eq7VA4fMONp7XrpkikXtym4fpv
	QaBvwFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyr8Y-00000005Cf8-0jJw;
	Sat, 07 Mar 2026 12:52:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyr8V-00000005Cej-3xCj;
	Sat, 07 Mar 2026 12:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CDA24447F;
	Sat,  7 Mar 2026 12:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA746C2BC86;
	Sat,  7 Mar 2026 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772887920;
	bh=d/WZmS/jGQFo2oynjtVtCDYfFONQIOxP/6Kxpn9q9rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AyLd1gk2G7AgRX+tHUPjl8pOGW3VWz8v+q8cMc5Q+FBjxt2/znpJYZeXhdkk6pj2l
	 vNne6JdEavw/XvdRyUqZ9Lor7ho8Ahqnwe4epOuX2LiOuCku9zCLig1GOV8qvS4gbZ
	 xwiMpEl4bisydDiyf3UubEra0Z4pV5Ys59Fd7vxQJ4zayDN6xtuHuOeWzGT6X/fCUy
	 mxu9o5lAHXxh14vHwb9Uve65DdVgIk3cw3YJx2vJhE1bMgpBWsiJ6oox/14IDim9ak
	 3XBJ3+ZI09FJXttxqm6RqA/Z1/8iM81QxWBNEfyfCTrCf5UINvk/PSgPQZjIuqaQ64
	 gEo+sfg5xjffA==
Date: Sat, 7 Mar 2026 13:51:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bartosz.golaszewski@oss.qualcomm.com, afaerber@suse.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v2 07/14] dt-bindings: pincfg-node: Add
 input-voltage-microvolt property
Message-ID: <20260307-astonishing-helpful-grouse-b7e968@quoll>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-8-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306075244.1170399-8-eleanor.lin@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_045204_006603_6056B886 
X-CRM114-Status: GOOD (  13.69  )
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

On Fri, Mar 06, 2026 at 03:52:37PM +0800, Yu-Chun Lin wrote:
> From: Tzuyi Chang <tychang@realtek.com>
> 
> Add a generic pin configuration property "input-voltage-microvolt" to
> specify the input voltage level of a pin in microvolts.

Why?

> 
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index a916d0fc79a9..da182c8a1d00 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -162,6 +162,10 @@ properties:
>        this affects the expected delay in ps before latching a value to
>        an output pin.
>  
> +  input-voltage-microvolt:
> +    description: Specifies the input voltage level of the pin in microvolts.
> +      This defines the reference for VIH/VIL.

What is VIH/VIL? Why generic binding would define the voltage of pins
for pin control?

This patch misses actual background why you are doing it and what sort
of common/typical pinctrl setup you describe.

Best regards,
Krzysztof


