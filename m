Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECE9C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRae16FTMewFnY4A+z3eMOBzVPHBvIAgsebZ5Q3YlCg=; b=iB2dikDxFUJApVs3Pvh1/Rt6v7
	rgdCNfaUjNDtP7Rw4uFbnMhsa3Oy5ZZklotM9SV8GPpHLWB7GojJ0n3qCkmXnBR8JMM0yqXCRX6wo
	MASA5bO49U/RY4rx0TqWUeCijZA7HKy9LPHDHA7jufKc/hZJyYoi6v0djY38vYhXuuJ7xjATsNqy3
	WN19gWDiobR0EcUW50crBSobVEpm02OOnK/raxljvpDBE8PqDpcjrYdKTyo3zv1quo2A0LcHNyUQ1
	JFLDhJrMqvh6JR7EjsZ7vZGvQEFOe21e1FTvG+1I5BGRM2vGGyxJJP5JHTkWIJzDaVaIWLM1Ym+tD
	8pdY/AYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXU5E-0000000Cus5-2Hu1;
	Fri, 04 Jul 2025 00:15:16 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXU1y-0000000Cudm-3PoW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 00:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751587913;
	bh=vRae16FTMewFnY4A+z3eMOBzVPHBvIAgsebZ5Q3YlCg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XeyBwjIMtpLKcmGrtMZ/p6veE7enBFfIx18cUA84QVUnc3r7+KVvnP460pGyRB7Lk
	 fMJQc5WaHrrq7Iuym6bElVh7D+OWhkBVfOywVr61lhmlErWAUPZZZIRsYwjmFk2nq6
	 cdn0uXeYgQvp5oYXwM0j5MlaDHoSZxj7o85AeYJWSWhFzl61fSls/yT3B0fUfgUTv7
	 ZaD6Bf0+6z6CxWov480SlKUpL3V9msSQqoCMoEMwivfplSMEegPQ2ShA0AWew7xGhU
	 hApgTFQZijidnuAvWx93Wdn0n1G7Cr+se8Vc4N+4fEqC6rIa5frvi15iIiT4SOS7Ga
	 EYSuTjqpko4oQ==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4065E6A680;
	Fri,  4 Jul 2025 08:11:52 +0800 (AWST)
Message-ID: <0782e276f6e22a2f590eb905ef2c5617f0870b63.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Jul 2025 09:41:51 +0930
In-Reply-To: <20250702011956.47479-2-jammy_huang@aspeedtech.com>
References: <20250702011956.47479-1-jammy_huang@aspeedtech.com>
	 <20250702011956.47479-2-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_171155_042926_B86196AE 
X-CRM114-Status: UNSURE (   5.41  )
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

On Wed, 2025-07-02 at 09:19 +0800, Jammy Huang wrote:
> Introduce the mailbox module for AST27XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

