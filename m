Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85336E92704
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1+M+zuQhr9dPrfDTeDV2O9Y5py8ZUZg457Bquv2b9k=; b=b/khakYVqrSkv/s9pERvlfuEaN
	RiP2PLkY8XHrqgUnB3wQL538Vbh1UbD9CTD3nvEPTLtprA3AfkGvaBO3WE1B5O9O8XYqbPxBZmiRE
	fIWBtIB3scRXd/Q7QTnBIFYzc6+qPnbUogzvI64nCAz2bDsPcYcdi/AzkpNsYDveXESUk3MfeHNOQ
	i0ZpNwPQBx+R1jIeQ9y3zfxrYuKeCf2NxjFLpyrckAaQuNkBFcHhVEd/G5sxiVQxs/hnYfV9+MF6W
	qoP2yxcszf9/JiAmOYjMZFgpBVbhbLORntQbKNAKCGHhkr+aYA6J8iH8W1C4t1nhK8853wD2REEPU
	2SF29vTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTky-00000001z9E-2CTR;
	Sat, 27 Dec 2025 12:50:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTkx-00000001z94-03KC;
	Sat, 27 Dec 2025 12:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EEE460010;
	Sat, 27 Dec 2025 12:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A08BC4CEF1;
	Sat, 27 Dec 2025 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766839849;
	bh=NoIiabkLSrEfm+Wn2XfQIhp2qSUkWHgkyhkvdmrWEUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=czEyINwSV/6DJ3pY5shcwPoPwK3alLx1nRFTnjf5SW768UJ26RrFupOJEwMaQcI6P
	 vCoutClLn8Fez7ZsXkieVXWo2ksY4a+IQ7cPjOtX0j92J3ENCWpHQSlwGb8Jgo2lOS
	 gO5LDAxGuHIbrMloAymOBazQyBpdL0/lnCR0kT7dUPVhuFSk+LRu5KYnU2n+D0JeY6
	 5eF79SRu+y3116Ip/NiZ0ls+hz1u3H5ONZxDDVCVyddmOk98r39U16eByR2+PWvbqh
	 7R19EYGNWrRbCXtE9bw/qy4zhsmexDq7O5rNqt9NwZGIwn4Pmcz/dBeMT1/qK8g38+
	 vGJjzkPoF3UXg==
Date: Sat, 27 Dec 2025 13:50:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: mmc: axiado: Add axiado eMMC variant
Message-ID: <20251227-industrious-mammoth-of-culture-ff9dbe@quoll>
References: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com>
 <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-5-5457d0ebcdb4@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-5-5457d0ebcdb4@axiado.com>
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

On Mon, Dec 22, 2025 at 04:45:04PM +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Add device tree binding variant for the Axiado AX3000 Arasan eMMC
> controller. This variant identifies the specific eMMC controller
> implementation used on the AX3000 SoC and enables the appropriate
> driver configuration.
> 
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>

Incorrect DCO chain.


Best regards,
Krzysztof


