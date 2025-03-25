Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0113C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLimjQcM6iFyIxMkBOQtsVCSZObu+6TN2wfTYGJmIHA=; b=rYJOFZljp2yQDmIz5v7AyhLrwn
	SwDetllZCelTX8qxM69p9jkQKGbxz1sYJ2f2jCeC/tAYxfH49U8hBexnnntxDMHuz9Vk6hyKQHOxp
	ZHUuqUPAVrbzdb1VQPrDbX2frWr8qMSz2HzhCleifa9Qumfda7HN9slFyYSDxBbXEA2hM24V5SlcA
	nxuHSuaDaoFO2IGFlAH4uclfNyn4We1UF/PmcWHASZ0yZwUkY3Wkn49xYXPqjKZRw9yqYqNIER6dw
	4grDCxDTrTuM/qbcxJwNTvc/bUuB0l3VJBMc0Kz0VfSMsMc6bLJVNszAAcaKsZJeV5KI8TYZjFO67
	7MN4n+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5sn-00000006HnH-0sb6;
	Tue, 25 Mar 2025 15:08:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5qb-00000006HTG-1zyV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:05:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D31E43C45;
	Tue, 25 Mar 2025 15:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41210C4CEE4;
	Tue, 25 Mar 2025 15:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742915139;
	bh=pxDDzt3nXUXBJ/7Nv/uhVEfW6KoJT8d7Gu3T3cGsCac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKdFWddW8jtX6bS9n8hjOA976IYOYP7nA6athtLfM+7hFY0ixM+smcB30Vj+9uSF7
	 ktsCSkppAznydPwy03iNQ1gukIoxNeM41eVmsgJ0a1M1cbbSLCfNpyInFrSqUl/Aw5
	 jMObZVGVY+cSvnVNsEYx1xIGvGY9gyG5Uey708/ZV16iPutpSKHhN3to+upNO6Uayq
	 P7J91fFRG5NZImijGtk6IlwSccukWf9jUYE92yLjebGO0eGmmuGVtwyPTUNpx2qSig
	 fK5o4aukrUrMzRpwOqmSb/Qjc5r2MDTrSClmITbLV/IdmO9iXR5XzQ+AV/w0BGfTKD
	 23m9njrR00J6A==
Date: Tue, 25 Mar 2025 10:05:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Cc: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <gradenovic@ultratronik.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: stm32: Document Ultratronik's
 Fly board DT binding
Message-ID: <174291508527.2051452.5158369080088647376.robh@kernel.org>
References: <20250325110409.2323611-1-goran.radni@gmail.com>
 <20250325110409.2323611-3-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250325110409.2323611-3-goran.radni@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_080545_537585_F03EB6A5 
X-CRM114-Status: GOOD (  11.30  )
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


On Tue, 25 Mar 2025 12:04:06 +0100, Goran Rađenović wrote:
> From: Goran Rađenović <gradenovic@ultratronik.de>
> 
> This commit documents ultra-fly-sbc devicetree binding based on
> STM32MP157 SoC.
> 
> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring (Arm) <robh@kernel.org>




