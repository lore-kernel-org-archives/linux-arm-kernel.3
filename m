Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEAF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D8dhUedp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JbenW9WV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IkSHzh93Di3WR58ZIGoCZg1d3wUWxexlPDz7KBUjFFw=; b=D8dhUedp47jryfxwW2Tee6kYER
	TfXX15OiPqokeidfeVZWr4j2Z7z/w4h+IECT8el0zMifgbBhqPYeTW5neH2lEaFJT9R76ywZt956H
	zam3Xk6Aj+14o3bRoi7Cb6zNNlcFo37evjATHCKn1EqooJxyiJfvITyETwevk3mjqIBt8bsi2zCsC
	gP3ci02o/zvAv/Srcb17zD+15rPKJaeIEH9s3noRPd7sFFlhq1VdPBs6lui2SbtvAJgxuhrlzoe1F
	MAyaJif1ZLNAh56e+pHE7uKVDxCz2yt322P/8hL9SXUrG0f5Qtb7/gN5goswT/dgkUxBgnA9pxCBt
	3UwcLM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLoou-00000005nzB-0Hva;
	Tue, 27 Oct 2026 21:35:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLoot-00000005nz3-2kw3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 21:34:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B486F6025A;
	Tue, 27 Oct 2026 21:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B60E1F01825;
	Tue, 27 Oct 2026 21:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793136898;
	bh=IkSHzh93Di3WR58ZIGoCZg1d3wUWxexlPDz7KBUjFFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JbenW9WVAuMCJndPsNDXWqqr/ewlpQbZ+nusWoYAiHmf8cIRQipdpBCNsLrld6ihw
	 cQMDWWIH5AsYW3juytsl2A6oRXwhKVG9vMhel/qkdSShIgPtMLLcO46YLiAxMqI4Mm
	 j5GiXthk+UjZ++AAwfOpAY9bsD2aeFdBvSCI1SsHanyBmb6PKL5t49O9PNeHx53DDy
	 785yJAF0zUi/nZT+cvB5d+PfiSQLkNZvyGFkfs/NPGl6zjoPq/gZV6ieOJuNfp/INr
	 x2NtTF8fHAMKPn7YSkU5ghJuqPoGUjanGyJc4OPtWTbTd9wqPF/0KAE4WmV7igabLq
	 44UIDYCMUvBgQ==
Date: Tue, 27 Oct 2026 16:34:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: krzk@kernel.org, Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stefandoesinger@gmail.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	arnd@arndb.de, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 14/24] dt-bindings: net: Add ZTE ZX279128S MDIO
 controller
Message-ID: <179313689400.1210044.5259450629503672556.robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-15-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-15-ghahramani.navid@gmail.com>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 14 Oct 2026 08:20:54 +0100, Navid Ghahremani wrote:
> Describe the MDIO register block and its work/register clocks. External-
> PHY pin selections use pinctrl rather than direct syscon writes.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  .../bindings/net/zte,zx279128s-mdio.yaml      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


