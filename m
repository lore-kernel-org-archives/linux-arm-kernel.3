Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C08EC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 20:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Wj5mVf8hf9/JYGhaTt3j8Kos5h7baLydgnoqYit03s=; b=gzBcH5VqSC70+Afh4mgOqJ0Z8R
	XDVUpSmwo1IaGIVxShpsckk9VoUfWPO5n0yI/5UW0paETZLKCi6Zz9JgIHrSJJ7Y5SHj5+FJpBEMP
	08iwmcYyfs5ROKsMi/KdbNgqx9iQX0GS9LJcIrCrhZTDQZ6yQ//J/st4hJJC2iUFb8IWLFUA/RxCa
	sP2YgGU7NKykPS96SNNYXkh7eqB3CnciUaUlp6q/OrPlPDPM+ZQCY4FJQZXfSc5yJLGPT6s82btrW
	QVjQVW9SGRH0/kOnx5PCyNIny6g9K89RqVB9RvNgtBPxic/7TPC3ma6d82Lvsdfm2S2F6OVU16d8a
	lbsaH2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7gGr-0000000BsTy-0FyO;
	Wed, 23 Apr 2025 20:00:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7gEr-0000000Bs9N-0ser
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:58:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 818264A6F9;
	Wed, 23 Apr 2025 19:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56DEC4CEE2;
	Wed, 23 Apr 2025 19:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745438312;
	bh=ZE+EzztTUSSYHUKRMcrzjo1dZmr1lvdw/aF918XXCQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ucgK0nclBGDo0bkNslgVdTLV+rdbYtrOkNJyLY2Y1i/SMm+9piNoBL3GMZmxTZCQJ
	 JJI7CuCCtFzHrVCNZwDFJTt+h1kJiNm+33jT3EpZROcEugibNsqJZGzv+gPCvZYBCn
	 bMfZOVDSaT73H2Bgaw+jGNutE7sUBDZxp4O1y6BB+alrI/PXkMeo9a5s2wJcRK0yuA
	 hlWGbu4dA+UfDN4VGogLaJjcUsyDKPIW0qS+kvvknTnT6lYSPJlfW/eUn/FsQl1NFO
	 X8+27KJsEUhNwo5fq7SbI1G1AKiVF3XDhOU4p4iEmQYSkl2bcpn4+EfGn2oJo3m/3a
	 mY6YJy96der0w==
Date: Wed, 23 Apr 2025 14:58:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	asahi@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v3 1/3] dt-bindings: spmi: Add Apple SPMI NVMEM
Message-ID: <174543830880.954251.4323421300724973645.robh@kernel.org>
References: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
 <20250423-spmi-nvmem-v3-1-2985aa722ddc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-spmi-nvmem-v3-1-2985aa722ddc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_125833_267486_E4B9ED6A 
X-CRM114-Status: UNSURE (   8.50  )
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


On Wed, 23 Apr 2025 19:55:13 +0200, Sasha Finkelstein wrote:
> Add bindings for exposing SPMI registers of Apple PMICs as NVMEM cells
> 
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../bindings/nvmem/apple,spmi-nvmem.yaml           | 54 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 55 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


