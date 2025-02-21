Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BFDC021B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 02:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnJlIFv0UPUzNd+Vm3edQcV3c4YlHIanESgLP3djvo0=; b=J7Z3OqAXQZ8uIIIT2lBIbPjP3M
	3s9++jcUTC5HZJDS9IS0dnFaBX988klsk+2Stc3fJxz9JjN8mXIxqjLeqYQGv90tfpO77oSIuqXpZ
	oHa4mPRrfxHfq89bXijEfNSqx04T1dHgRfii36avCENYbqVCxYc0F/Q/vE/JSR37Pb/wOH3J8toRf
	pzmyme5LqgDP6KOQDPk2EBKWCe5As31yqUFgD3zKChPLP3cIRs7RmQVziiMFw2EryLvSi2MUlEfZR
	bFXWr9hufuGAi8QvRhKRna2C130G9ZqFn1YMWFJQvik29NyZnapCMDysh+/hKnxJ2H6O3Mh8mqMEz
	EnkKaG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlJ9D-00000003tje-3dZL;
	Fri, 21 Feb 2025 02:52:15 +0000
Received: from [203.29.241.158] (helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlJ7i-00000003tTj-0Mdd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 02:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1740106233;
	bh=UnJlIFv0UPUzNd+Vm3edQcV3c4YlHIanESgLP3djvo0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bS3XDmJSaRwxBcjtYnMTwIb+H/BxFKEtm3Pk7VaDsbV19owr6Q+j1opLuCdtqhQjD
	 6+dx3TMF4X+YLGT3ur3e/AynpgFoaPBP+vI223VEgbjjCuBxhzUe2/vHDgY8UUS0cH
	 tpBvqc2ZQBtmnsdWHuqYkOS0I56/E++xdqSsN1+TrdBmEqzThNE3Mt9bOaUCZdn5W/
	 WdhUezPTM4PI7OoUGenB05aasczV9qn3O4nKodwZiLdtHvP0rDpANhShljodZzXkja
	 OkbLOh5h3ULoqcIbv8eNIuBjrOS2om0ynANUpLZCNQDTt2xg1fj4v7QJ7m0hoFy9Ec
	 7ljKn+ys0IO6Q==
Received: from [192.168.53.88] (ppp118-210-81-188.adl-adc-lon-bras32.tpg.internode.on.net [118.210.81.188])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 59BAE76B4D;
	Fri, 21 Feb 2025 10:50:29 +0800 (AWST)
Message-ID: <eec1e53185baeed99e5e0c86875f121ab4d25fd1.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5] ARM: dts: aspeed: yosemite4: add I3C config in DTS
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Fri, 21 Feb 2025 13:20:28 +1030
In-Reply-To: <20250220023233.1686419-1-delphine_cc_chiu@wiwynn.com>
References: <20250220023233.1686419-1-delphine_cc_chiu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_185042_328724_201DF0CB 
X-CRM114-Status: UNSURE (   7.22  )
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

Hi,

On Thu, 2025-02-20 at 10:32 +0800, Delphine CC Chiu wrote:
> From: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>

Typically git's user.name config should reflect your well-known name
(with spaces between your individual names, and without e.g. a -wiwynn
suffix).

>=20
> Set I3C config in yosemite4 DTS.
>=20
> Test plan:
> Tested PLDM GetTID successfully with the I3C hub driver.

How was this successful? Your patch fails to build on top of v6.14-rc1.

Please make sure you're testing against an upstream kernel tree.

Andrew

