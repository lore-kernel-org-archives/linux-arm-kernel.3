Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AE9C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Q/G0xr2UV1pLa86nUPTbls3sq2RH3jNgpwveDN2VyI=; b=aILZn9d5hMPMMHmNa6g1FfNdGB
	wjP5LdisQITt07eXWWjoQkWNHF8RNSOLr7ssCIWCEVi9lRAdzqlic21/OKbuowll3vSdZHRWyf6yu
	Oy+5ADPIZuApALMyziT0JekaJtfShAaelhtVo5/XGfKqSs1iVEnlLPl38O/NcJJVF2lZYOAIZXLP3
	VjjJNNpDVSOArFEJnxfbaSqmVbxwEWVVqIoeIMIPL1QdInXHBllYx+myASIZMiuA6R4IoBAHSQ/e2
	NaSwT7Xj0lTwOl0jq3axMRzcmFVlH6MIwcIRejc505TXlvTP3+OtshJUVcVmNR8svuVgFF7h+yut0
	f++WP9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkPM-00000003bHO-3lcB;
	Mon, 24 Mar 2025 16:12:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkNV-00000003ayA-0dsL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2970AA4A352;
	Mon, 24 Mar 2025 16:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42D5C4CEDD;
	Mon, 24 Mar 2025 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742832615;
	bh=VRNuMZ46YoefRymfk92bpusxS2YiPpYOHdDtSJvUv28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihDM1LzcyF7ntp/L6yv553qVXhlfA2d21lvEo2ba33p7z5XZxNhVG6BXieL8rA0rf
	 hHLHAn1CFEkTehALove7hl1eijCG/cuefvE6IIEkdGJhIyS+RTSk0GYtnrsl6Kct3U
	 mCNRwfIym40mhLadEy6sXjEUdJAEPY3+bKQSpIx0VHlikBVxrVnguI5PNp5cL54NWi
	 QzIu9/OYTN3o74c3AxAxILmJ1QhagtOTQKTMVgljsQ6SM4TLwwaztInWEbgS5hL2A1
	 A2jEUCr3mRkcx6mhlPcKEUuF0FIc8iu1iM4UdFPPPlY6WRM+jJeJfYDg253Jp8JA43
	 Op41GcNd0aiMQ==
Date: Mon, 24 Mar 2025 11:10:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Cc: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <gradenovic@ultratronik.de>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: stm32: Document Ultratronik's
 Fly board DT binding
Message-ID: <174283261429.162935.4991717491782236222.robh@kernel.org>
References: <20250321111821.361419-1-goran.radni@gmail.com>
 <20250321111821.361419-4-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321111821.361419-4-goran.radni@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_091017_252261_0777A09B 
X-CRM114-Status: UNSURE (   8.17  )
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


On Fri, 21 Mar 2025 12:18:18 +0100, Goran Rađenović wrote:
> From: Goran Rađenović <gradenovic@ultratronik.de>
> 
> This commit documents ultra-fly-sbc devicetree binding based on
> STM32MP157 SoC.
> 
> Signed-off-by: Goran Rađenović <gradenovic@ultratronik.de>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


