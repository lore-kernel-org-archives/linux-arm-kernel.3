Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31C1C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFfdqODOKP0RWIPAc71tkrfGHA5qcqV3t3NctuqR68s=; b=3d/uEFdRx3CRU7PJ1/S1k4e+VV
	Lr3ME7CGnz+GYCrGwX1XlHIR6jhScmkfI7qHmYGQlYLQXqZSdTh2yk+OtHKsAX0riPePCBXTWUNP7
	ujGFzg2mrX+MzZPozLadtrrUyQ6xaIS5VDjQJywpz2jFV2t4ZDvEC5fgXbnSreUjKB5F1KYMiCMSS
	+iUGUv7xMk+JRbL15Ydg1kSFTyjPCGt1/FzgviUlXEuAbaIRzxrPxY3yfjhRXVKOlsyCM/PUd+ald
	JWaFKmCFRQjKtVDNt27rnN/xmDmYbbyjCiGozOki+wspJYAdIz/249FK7Z0uyzyMFs7eo25vVRsFX
	9OIxwijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRo1-0000000ArXv-0Ohx;
	Fri, 25 Jul 2025 23:26:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRdz-0000000AqTK-2Wjs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 23:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06639601DC;
	Fri, 25 Jul 2025 23:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70538C4CEE7;
	Fri, 25 Jul 2025 23:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753485362;
	bh=0CgTyp/AOIFev+w3bqrF7PtG85NisSLbf2l1wMOcr1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5YmkPyut2WrcsL/+oo8Mpvw/Ah61bKneGhSEJNDvzrY2/JFfARSxZ2N/WbB1ZzF1
	 Njq6sIcy8S4f+53f/Mj6DS/RGxGeRMcZNAOAtcQiZWnq4tO4g9c2sfeQRlKmkUsuvv
	 gT1Mju8mPMByQB2ezM1wxh36fMOuaroJE5EVs12a69XqUQ7mpujH5BfjV4vD2yYfU2
	 iJMcfF90eUh3C1SRYPb5Z8jQOcC10JyvbZPw/vmHFHEbHGeohwUNADDao4JcVV3eO8
	 azuJ2iaGucU6UV0GTJO2A1eIbk+5mslql+83MMxXaMRlnL/XVnO9bwlA6lExajByqo
	 4MDhEYE4cpQEA==
Date: Fri, 25 Jul 2025 18:16:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>,
	devicetree@vger.kernel.org,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andreas Klinger <ak@it-klinger.de>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ceclan Dumitru <dumitru.ceclan@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Dragos Bogdan <dragos.bogdan@analog.com>,
	Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandru Lazar <alazar@startmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	linux-iio@vger.kernel.org, Stefan Popa <stefan.popa@analog.com>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Dan Robertson <dan@dlrobertson.com>,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 4/4] dt-bindings: iio: light: Simplify interrupts
 property in the example
Message-ID: <175348536123.2013554.16603823674806564381.robh@kernel.org>
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
 <20250724111345.47889-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724111345.47889-8-krzysztof.kozlowski@linaro.org>
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


On Thu, 24 Jul 2025 13:13:49 +0200, Krzysztof Kozlowski wrote:
> dynaimage,al3010 and dynaimage,al3320a are I2C devices, so their
> interrupts are not routed to GIC and rarely first interrupt cell is <0>.
> This looks like copy-paste from some SoC block, so drop it and also for
> readability use known defines instead of hard-coding interrupt flag.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/iio/light/dynaimage,al3010.yaml         | 2 +-
>  .../devicetree/bindings/iio/light/dynaimage,al3320a.yaml        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


