Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56741606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LmTgj9xq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys2DVtay
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uZAzQD3NCDsQzqPuFgmDjjdCBahkZSM5RmkMZCYlJFY=; b=LmTgj9xqng/g3mGQZc3Fe0kVQV
	2p3MqESVYV6iJtKlPDm+rUJNM8MUgswvuZRHeTlOdRjZsfkEMTDPoD8R1miYehQuvSwZ0fEXxZk6f
	hQqH8Do7VtxPXV6t+njoPhRr4fTwrEDj709beEs3F6vQHv0/1GtEirl2VE4nX9x5YmJHISk2SPo3K
	w+BgyIpr9Lsev3Pi3OYfcMmBj/pWsyFKYarBxvYUWbJ9/NgCXVRNICha9Yg+kpvI/6DNeUArH+k6W
	bVcjl4H72QFZXRtbn/I+p40X+GzHtltFbTijVoy2DoKzqBaBfPhZZljmewg4J9GLzo4lLwmdR0yeF
	vEf8sCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp6p-0000000C58y-3pms;
	Fri, 30 Oct 2026 16:05:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp6o-0000000C58m-1tDc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:05:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A53B543DB8;
	Fri, 30 Oct 2026 16:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1411F00A16;
	Fri, 30 Oct 2026 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376337;
	bh=uZAzQD3NCDsQzqPuFgmDjjdCBahkZSM5RmkMZCYlJFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ys2DVtaykIf8upzP0HOwFZBGfM5HSojAz3l5DKgLslNcPrc/7pNLi7vNFgzr7i1Jm
	 5ROTY6NM1BIgESdijMBa/EapHHZTPw/ECqrYPsH4QN+rZKvMvOZMlOS4SIO4rkNQjI
	 re1J83gjGakCLNjCg8HIIWV75jROwz2EhT8Lxk6kQkOFx0zsSrtrOSVwqjp7fyTHwz
	 cX0xoOA3ITXuwSELry4Ev+e3u+T9sgblWOZkmIs3+5ScjfXpNlXazGMAIuppUwXTdk
	 5IWWdFTx89M4oMiXCquasqA5593n/wQLX2W5KouPT7VECh1V4RSwxHF5bVWuOuCWtD
	 DWKEpPo8vlTbQ==
Date: Fri, 30 Oct 2026 11:05:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos5515
Message-ID: <179337633410.249047.14547696442462866080.robh@kernel.org>
References: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
 <20261020-for-next-lucky7-pinctrl-v2-1-b6b0e6065452@member.fsf.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-for-next-lucky7-pinctrl-v2-1-b6b0e6065452@member.fsf.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 20 Oct 2026 01:02:34 +0100, Aiden Isik wrote:
> Document the Exynos5515 pinctrl compatible string.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


