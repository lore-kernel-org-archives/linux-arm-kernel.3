Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC07CF8860
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kT2Ep2aCHIG+rQN3904FBT5y6GvUbPcRsphVfkAc2no=; b=QkFx2zAlWaNILep3t25kSQh9DS
	XmMtPKLRLJzZHNlEJfn8fXJk100wXEDR+YC1iMiPDdZufGMyLv66xxAorAf532S6Uc9jhmPkLPVB3
	pHq12oDf5wijwFDRZ/USJX3LNUK7WE6G2YFAR/Yac9E0+CHKkvP86YYE93zh2JgS2O67d1tJiyppa
	W4yiOPYo8KJyEua1qx2DKp+e7SWbsUgRAi0tmArhd0RfhraVIwDRr04fupZKQNlxluk+LslAserT1
	Vg2brgL/5Isn4G1R38fB7QdWEPZy9fMxKYIKEh1dbgqFFRp4LLAFIe/WIIFREBNFzjfZND6a+H94I
	v89WKWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM65q-00000006suj-1wbj;
	Thu, 20 Nov 2025 14:57:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM65p-00000006sub-0Gco
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3896260131;
	Thu, 20 Nov 2025 14:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAC8C113D0;
	Thu, 20 Nov 2025 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763650623;
	bh=ZAWEhvuGNxLW528zSSPNsK40qVVkeMvPLNo31hKx7FU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a31r7nz53cyUEYwpuoTtq+Q9RJYSZkSl1zEN4oG+lYTBthELcNwkHF7oYMp0iZgPz
	 K88gFCg+CatZvxK+BzgIPfiOswIfy+KVLcs/lFE/G7r65lmxzKy9UToz1njvtoY+nM
	 eMdTTNSMrPVqi62uPPoN/gR2WltIcHPC9o2dexHw+EK85Lde0F/atyDeor5sbtBZML
	 CLzPqRnpxk7bLY7/AcbMm0VVwI3AnqcNO9CQoZEw98KFHeEqoCo9695+2IeO0nnIRr
	 jDkX4Brb7LKk9Z+a5mkoI2hAmLg2tGunwQOFV7C/H2HjK1gsfw0KehB2tgd2fo06Ar
	 BCJLlF+filw1Q==
Date: Thu, 20 Nov 2025 08:57:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v9 2/7] dt-bindings: memory: introduce DDR4
Message-ID: <176365062162.1254978.3113045721070075271.robh@kernel.org>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
 <20251118-b4-ddr-bindings-v9-2-a033ac5144da@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251118-b4-ddr-bindings-v9-2-a033ac5144da@gmail.com>
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


On Tue, 18 Nov 2025 16:07:58 +0100, Clément Le Goffic wrote:
> From: Clément Le Goffic <clement.legoffic@foss.st.com>
> 
> Introduce JEDEC compliant DDR bindings, that use new memory-props binding.
> 
> The DDR4 compatible can be made of explicit vendor names and part
> numbers or be of the form "ddrX-YYYY,AAAA...-ZZ" when associated with an
> SPD, where (according to JEDEC SPD4.1.2.L-6):
> - YYYY is the manufacturer ID
> - AAAA... is the part number
> - ZZ is the revision ID
> 
> The former form is useful when the SDRAM vendor and part number are
> known, for example, when memory is soldered on the board.
> The latter form is useful when SDRAM nodes are created at runtime by
> boot firmware that doesn't have access to static part number information.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
> ---
>  .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


