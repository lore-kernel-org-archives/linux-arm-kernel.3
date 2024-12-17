Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36960E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 11:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=307SwKd/Y/F3nysYP2VgxnqKAi5uGgAZdjNrtNR21mU=; b=V76aBoTuG/BUVS7hB2YO6clNY0
	MfEC6j1EUBbrNVHRfY/jnjfB0eb2kM0m/GRSUazgd5zhxpqLz9RkHYAGmqx34ZaRzMKfwdn5MciVh
	NoWJXTqeO721lELQkUibz0T5crzbC2pP/gi8hktbdKioGrzwEAMQR22iuX5i7fZVHZHJs0gMDrW3Y
	BdZkTaf1O4E41c2+M0yD39XsKS4ao4ZFSJVEOm1loJ55UVhrEJeqPHO/dbg7KasbOxr1OS33Owl3a
	uLBJ1/FgNm3dfTdGME/p/MX0ULCbKNbxP6/VdnL7dUeVv+aCS3juxyF85RmlGts1SlrfqiG3gPkLB
	IiyC+t7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVet-0000000DF3m-3JFH;
	Tue, 17 Dec 2024 11:22:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVdo-0000000DEwo-2fSS;
	Tue, 17 Dec 2024 11:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7624C5C675A;
	Tue, 17 Dec 2024 11:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10141C4CED3;
	Tue, 17 Dec 2024 11:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734434487;
	bh=s5vK3vqWBeHhLp5xzRCQJldT103A0i54JjSN+MTyT8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pv81gis4dLGqoebSqNaB4sZFJMizri+86Nhpo1NOkUH1rzZP+VH9DNfuA11C6b8iD
	 /dEHMm76FjxT05+pB24/5rDtmrSeMHMUKczet63l3PnRqTBv+xkU2L78XzlC+8bDeF
	 xvhqx3BXzlhTB7yNMXPsscARuB4IbdoZflcTDIu7+dUaORt8ZNcBD73GOgnUUaTqIj
	 pci1GPVySE+mDm0JdiViVKnSOvKIg18YdJ6NTtsdL4JioODFoRNfv1Vj7ei7humRmG
	 xD8tJAaw5mVIIarlskCmtr/HD8XTDXTzCAN/GBBPuejOh7v3Gy24gHvlqxGVW8WVtn
	 okjOkklEn4efQ==
Date: Tue, 17 Dec 2024 05:21:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Karan Sanghavi <karansanghvi98@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Alexander Aring <alex.aring@gmail.com>,
	Scott Branden <sbranden@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ray Jui <rjui@broadcom.com>, Eric Anholt <eric@anholt.net>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5] dt-bindings: power: Convert raspberrypi,bcm2835-power
 to Dt schema
Message-ID: <173443448203.859628.7169765786016335364.robh@kernel.org>
References: <20241216-raspberrypi-bcm2835-power-v5-1-222fc244132b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-raspberrypi-bcm2835-power-v5-1-222fc244132b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_032128_714396_361B3D2A 
X-CRM114-Status: GOOD (  11.57  )
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


On Mon, 16 Dec 2024 17:07:00 +0000, Karan Sanghavi wrote:
> Convert the raspberrypi,bcm2835-power binding to Dt schema
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
> ---
> Changes in v5:
> - Added maintainers for the power domain
> - Link to v4: https://lore.kernel.org/r/20241028-raspberrypi-bcm2835-power-v4-1-acf44abd45ff@gmail.com
> 
> Changes in v4:
> - Corrected misindentations and random differences.
> - Link to v3: https://lore.kernel.org/r/20241026-raspberrypi-bcm2835-power-v3-1-6621e075d33f@gmail.com
> 
> Changes in v3:
> - Applied changes as per the feedback received for title and description
> - Removed power label and renamed node to power-controller
> - Moved the file from bindings/soc/bcm to bindings/power
> - Link to v2: https://lore.kernel.org/r/20241022-raspberrypi-bcm2835-power-v2-1-1a4a8a8a5737@gmail.com
> 
> Changes in v2:
> - Added original file maintainers
> - Removed unnecessary headers from example and formating from description
> - Link to v1: https://lore.kernel.org/r/20241019-raspberrypi-bcm2835-power-v1-1-75e924dc3745@gmail.com
> ---
>  .../bindings/power/raspberrypi,bcm2835-power.yaml  | 42 +++++++++++++++++++
>  .../bindings/soc/bcm/raspberrypi,bcm2835-power.txt | 47 ----------------------
>  2 files changed, 42 insertions(+), 47 deletions(-)
> 

Applied, thanks!


