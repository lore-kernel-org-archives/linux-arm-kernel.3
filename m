Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C385C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/Ziscq6uftxkK5aCNjPpGNkK/2AP8HD+Ve3CAkcVOU=; b=svoCQr0ZAzPGjTBucDE/bbD16h
	SMic9nHnpWH0aupOGN2VPLhEtahSPezv25CvWhLGPXNzQWln3HCtOc/iqaRSlX1eBqfGYZrMMpbHi
	oumveFPMbFl2FKe7tpNd5a7xE67d7mQXaFi2PVUqdyZrBJ65UrVvbs485HS3zSF1um932VokPWvg5
	GRiY2Q36uDzh+N0mxZ6P2LEBuLm/jpOE3aa97XxX2zTA6YGrBSKTn3/e44iqjcNgau938nMRyMKhc
	TV7vJvLbbp+O0AeZNZSx7S1Z0elUaGdcb6FfeZ87wXWGgw979QDsSdO5qYZr0ez30ra/TupJa/Iye
	VpJN2/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpT5r-00000004xAf-1nBz;
	Tue, 04 Mar 2025 14:17:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpT4H-00000004wqZ-1492
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FD5E5C5D04;
	Tue,  4 Mar 2025 14:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BA2C4CEE5;
	Tue,  4 Mar 2025 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741097779;
	bh=/fDJuygvLATY6Q6bpD5+xIF7qDmEEvXLXiE7U6NBHak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYy5Z2oEn64OFFVGg6DPbiDhNaP5JXXumw6wRUHkY43uZtj0GplsUuMS5d+bi4FYA
	 7smYu26Yea56FnqLZMzFDNzP4pw1XBAf5jkCbpNeMunjQ/0CCAfbQx4zh6wO8ATreF
	 EKHXDAqdZ0bXXLW/ojVqmaL0ZDBoHncFnufIWjSlUCOer8z6H0x4l0/7j32Go5zXtR
	 BIlr5SJ2nRa6/zvwtwgZjtlOEmKHXxz25cM6gnVWkrB4Ym3aNQkLUjnEhOOUOt4vKO
	 OTWL4zswmmToRF4xhR1C9ugxvdcN9S+9T8FO7wCEW1YZkiREkeevcdmTOyefguAunD
	 oXp4/+IxBdFvA==
Date: Tue, 4 Mar 2025 08:16:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Mark Brown <broonie@kernel.org>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v6 01/10] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
Message-ID: <174109777678.2543384.14004490230937287192.robh@kernel.org>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
 <20250304-bcm59054-v6-1-ae8302358443@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-bcm59054-v6-1-ae8302358443@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_061621_344019_4B7E11FA 
X-CRM114-Status: GOOD (  16.40  )
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


On Tue, 04 Mar 2025 07:20:32 +0100, Artur Weber wrote:
> Convert devicetree bindings for the Broadcom BCM59056 PMU MFD from
> TXT to YAML format. This patch does not change any functionality;
> the bindings remain the same.
> 
> The bindings have been split into two parts: the MFD binding and
> a separate binding for the regulator node, to simplify the addition
> of other models later (which have different regulators).
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v6:
> - Replace mfd/brcm,bcm590xx.yaml with mfd/brcm,bcm59056.yaml
> 
> Changes in v5:
> - Replace mfd/brcm,bcm59056.yaml with mfd/brcm,bcm590xx.yaml in
>   regulator binding description
> 
> Changes in v4:
> - Made $ref use full schema path
> - Cleaned up example
> - Dropped regulator name list comment
> - Changed description of regulator binding to mention BCM59056
>   explicitly
> - Changed "Power Management IC" to "Power Management Unit" to match
>   official Broadcom naming
> - Renamed mfd/brcm,bcm59056.yaml to mfd/brcm,bcm590xx.yaml
> 
> Changes in v3:
> - Moved regulator node to separate binding
> - Removed quotes around compatibles/vbus property
> - Style fixes for example
> ---
>  .../devicetree/bindings/mfd/brcm,bcm59056.txt      | 39 ----------------
>  .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 54 ++++++++++++++++++++++
>  .../bindings/regulator/brcm,bcm59056.yaml          | 51 ++++++++++++++++++++
>  3 files changed, 105 insertions(+), 39 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


