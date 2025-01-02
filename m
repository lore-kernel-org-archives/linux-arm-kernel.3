Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5213E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRZ8FXw4iHjviFludAoJ2ihjNIrRaUrBvAQv9Ni8mpg=; b=om968KciV9oapjhomAurRGT+C0
	h2OcOdK+B5gIcwGx3uhSDvT57jezoQ8X+SlUHbPKg2TQnLWlLy8ieuxNZALlDeRExQOJQImVx+vEe
	MtwYqge4bj64C/+JQX2IyYB+hTaCjOZrjh7E3iUdGa7KJ4akqJDVkgFBZv6VuIP/qPHio8JT+0X6w
	SO+QbE5aloVwnpH5/8B5PIRzmi16f3hfb2mDwzAJIanrwqoPsCcEskPmecLFf6V52qW1DZZ3e4YyH
	rdv6EiEF0Gxl6dBDW0nnTkY/+znvt5nNRW+Ks4YvJcCZmA+jyw0UkqzJQ+uUyfmDMVQWq06k/iEKo
	B9S6ydVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTGYw-00000009vqY-2FX5;
	Thu, 02 Jan 2025 08:28:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTGWs-00000009vay-3WRX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 08:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D575DA40F02;
	Thu,  2 Jan 2025 08:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E9EC4CED0;
	Thu,  2 Jan 2025 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735806365;
	bh=a/jkkhb22rDc0sD75YrgckrNRNFXB+uJYJPu/qpNb34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJIduz3j/Mgsc+RQLc2lRQPnBT3B2RDVJm/v94aXsLOaj5plXcXia+0kQ+H0BoGo+
	 g9MA7qg0yRsm5cX4rTyksx67XUKH80Tr17YM9IWqKUKyAkJdR3HYgy2+7vnQnAqO1w
	 tobC0mH2jpwTUCT+Afehy+yopQeNNPqHXbPzGvY4d6/kLLWzVWFfYun/LJ1rr7kwKn
	 UgI3PIeztxP9Il6HKi5qfFRzwGFSTl7vYpr+VVh6eLA3kF9I3wV7M4OOmNZ3oup/xu
	 k05ZAmB1jN4UhvOsAe33F4RKoWOHWYYqLga/nYDdYgIA0K3G1UI8bGISk2LlvS9COX
	 3Dwxc0Ntoor8g==
Date: Thu, 2 Jan 2025 09:26:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] dt-bindings: clock: st,stm32mp1-rcc: complete the
 reference path
Message-ID: <gtisijd2uxatrfu6yppkv4zeddilmsxjoqiaugxqregfyqgbed@4dryamubwyqx>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
 <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_002606_944614_882B803D 
X-CRM114-Status: UNSURE (   9.56  )
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

On Tue, Dec 31, 2024 at 04:01:41PM +0100, Dario Binacchi wrote:
> All other paths referenced in the file follow a scheme starting from the
> Linux root. The patch adjusts the single file that deviated from this
> scheme, making it consistent with the others.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


