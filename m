Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0193C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNsobfN3GauaUjaZRzUOXtrCbPSwwJVtEcQ8knqRcVc=; b=ABqH8XX/OQnKdHFuEiSTLcePcU
	VofxkO7VgD85Wxz9E4c68lqK9LY1H41S1/kjoCE0jxOrBa07hmaADOQt/+YaP0sp2SzcYTINn8l2z
	4UYmcZG0ktGrK2cfKxYpscy3X6CsplLqY7R8ylbJetdIrargTDz+fXY6IuJXl2RHNMWYD+tIr2+lM
	k551a4diikVUTtl6UcrX8LjoiV2c4LWCK1ZBAwc2kr897JbHg7D7Dfj3Tp2WnOe0zX+YJJ8O7Lbj/
	5mnIrV87MH8fMJU8RYOiwbyjoyVht7BTrRXKseGqBzE8ia3Mzf1T3fMWji4IisgN/mW3pFDB/Uu/O
	J3Zl7WUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt065-0000000DOlU-2aGJ;
	Fri, 14 Mar 2025 08:08:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszz6-0000000DNdQ-3WYQ;
	Fri, 14 Mar 2025 08:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C76F5C5759;
	Fri, 14 Mar 2025 07:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF472C4CEE3;
	Fri, 14 Mar 2025 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741939295;
	bh=70wuHHsetHGL0OD/EkgwP5SjrI60aviLDRUiNp6RteI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxKlMpaYsSSO8B8lDQwLdpB4UzGrdvlyZaNxFnwda2QCfDMT/4INPK/1RBo3AuILi
	 zeC5XMIn3MnQPZ9hSulmieLPcg06jW5EG8sjcLJh0j4ffqf/o9bSoTR6mYc5p4GwH9
	 PVL/8Nmnm1rThXv3QxLDu/DmTbj54dAaVkrSslfex/4P/+q3bkjDgXfte9LQQREz0Q
	 wHOsUBtRK9ibP5gIzfxDYyd3X6Q/h7cBxPBi72NEn5oQSxYEEaNo8idK6kJu3UrZKH
	 Ioxw5voPBI0qaCa3gzwq4bVcWHkHkmBCKZhx9xs1l0a2FAcuzONsQ6av0YDlzDMZ+a
	 m4L3h6YbwIZ3w==
Date: Fri, 14 Mar 2025 09:01:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zelong Dong <zelong.dong@amlogic.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: amlogic: Add A4 Reset Controller
Message-ID: <20250314-tested-husky-of-force-1ccdca@krzk-bin>
References: <20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com>
 <20250313-a4-a5-reset-v4-2-8076f684d6cf@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-a4-a5-reset-v4-2-8076f684d6cf@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_010136_932098_B05D9BD9 
X-CRM114-Status: UNSURE (   7.20  )
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

On Thu, Mar 13, 2025 at 05:05:35PM +0800, Kelvin Zhang wrote:
>  &apb {
> +	reset: reset-controller@2000 {
> +		compatible = "amlogic,a4-reset",
> +			     "amlogic,meson-s4-reset";
> +		reg = <0x0 0x2000 0x0 0x98>;
> +		#reset-cells = <1>;
> +	};
> +

Why do you have on the bus devices with bus addressing and without it?
What sort of bus is it?

>  	periphs_pinctrl: pinctrl {
>  		compatible = "amlogic,pinctrl-a4";
>  		#address-cells = <2>;

Best regards,
Krzysztof


