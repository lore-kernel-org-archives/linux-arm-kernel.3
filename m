Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35B5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Z/ghqtSxTnabmnPBzhQOfIW7A+38kbe+7KssL6Gyw0=; b=UTRdbnmfCq3FF4OsP3ue7mXhWW
	l9E/LtvssG6bb8+rWmotX8uvd+pCONW6ZJdoKYv75FClz4PThwrTUAB0yh1uVUtT/Tkb5KueiwCHW
	cwuNR4Lh67PUpX/T69ut3exDnVL2lvfEwusQulCl4R1jLtLdbbenwG4mU//LbTWk6gdvhJVJ1PwBR
	5Pgy0r/wan5n+iSbClntDUN+sdGNIkSoJMafmKz7SIK45R87aQEkeZgvSzIhudrjldBpHLPZPrZXC
	XwWrKh+wwMDdKNU/R208dYsej7qAHj71O9QTIvf/zDrsOQVMw7LGQ/xrgS8dv73jZ6uXV7NiVNH3d
	rR5EyLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrqw-0000000FGPU-1iun;
	Wed, 19 Feb 2025 21:43:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrpS-0000000FG2N-1Wfj;
	Wed, 19 Feb 2025 21:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D7715C5C71;
	Wed, 19 Feb 2025 21:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E82C4CED1;
	Wed, 19 Feb 2025 21:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740001321;
	bh=MaNSLEh2lxgU6f14YdTbvhpQpN1QDoQniPT9z9CW54E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4JYosSZl2iv95aFKCoDpHX2qIof0HN5UG74BJxqR32jQSI/1ka1o5YajAAeXAi/v
	 MFmIGEAEJXwi+uh70T0/iJoF+B758rwBESxablb2cMqv/4JZJQ8qBnh4E4mrSXVI/o
	 BGpfi8YMDS+dYbaaoQNHmQN7y30sOXoUd1zP2mlDLHHZrRuZjurI6ljZe/ayElw5x4
	 YOx1OHSbairIEopQQh256xMjnyq7EVA/1H2VAMt+0rPLe15hVfydeadhfCNlPCGpvd
	 n7E1AmC/FFf32MPq3HmrpxtqS790hnWBOIhsRW0Jcn17kglYXbmenU8g16Zae8lBnm
	 /As5ZJBV2GX/g==
Date: Wed, 19 Feb 2025 15:42:00 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: pinctrl: Add support for Amlogic A4
 SoC
Message-ID: <174000131935.3003574.5536314067516042941.robh@kernel.org>
References: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
 <20250212-amlogic-pinctrl-v5-1-282bc2516804@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-amlogic-pinctrl-v5-1-282bc2516804@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_134202_457993_A4E9D9A8 
X-CRM114-Status: UNSURE (   9.46  )
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


On Wed, 12 Feb 2025 13:20:50 +0800, Xianwei Zhao wrote:
> Add the dt-bindings for Amlogic pin controller, and add a new
> dt-binding header file which document the GPIO bank names of
> Amlogic A4 SoC.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       | 126 +++++++++++++++++++++
>  include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  46 ++++++++
>  2 files changed, 172 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


