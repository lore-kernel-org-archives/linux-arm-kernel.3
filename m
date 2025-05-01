Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059D6C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 13:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJ6lAB+25GbNuESw/Y6DXKoF8x+Uw5NonCRDTTLVsd0=; b=NV/SPKhqodvORebu14OA7A/cSA
	Ots8vgDPmuLCJSQDBBtvfKwipfoFDbEoLG4b4ByNNyIB0ZlrOyX9tO54R6+5izcC208Q8+4XiTRZD
	fshXygtwrtYnuX13Ol4nKbfchc5D3H4ulR35Z9q6K1qfj754ZzIfPyWVT/lqJp7a7jOE4fS6hWUFK
	AwXj/jIR48yBeayhxtFio8k6mx8h46fJCpfhw2fkbRloLwYEp1zq+fU5a5+bEVQ0SuiO12rir/ByE
	NqoVZC39ZTBKGera79PQnaRK/hPeIy6DJBtwMdTtNaF1MPFeNBdrw95hTE859MYfLB9DG0yljBVk2
	0n+730SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATvf-0000000Fond-2o6E;
	Thu, 01 May 2025 13:26:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATtl-0000000FoaC-0q8Y;
	Thu, 01 May 2025 13:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bJ6lAB+25GbNuESw/Y6DXKoF8x+Uw5NonCRDTTLVsd0=; b=O93RWYVlcIEJHfYZox89Dpz2We
	i+uD5YrdwVMH9PE9wBEnB18KwRdcss2H4QVZGC84NdxcOcoAq1hr6knfKpwfYGO4xwC9ztGgaNNey
	mOD1k7VTpmeUYV3QcTg10xTGmK2nH44fHDCHy8JUyXqbhm6dRNAxjHXUEUIM4yzb4SHDF0fhStpFm
	9RPB5eU53sJep08mIj/LwElSnRoQoZ11/BazY3inwQyd7b6aJOIvhTfXnkQ53MoknTTgioeGpJFdw
	zmAkNazFMVi0sTvya0JfW8WwkV4wy5LhTf6+Zg1CKEtZVBqrASktFGaGWNYAEccRuFnxm7gkSwYPe
	gfB2JKSA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uATtj-0001q7-No; Thu, 01 May 2025 15:24:19 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: rockchip: Convert RK3399 PCIe PHY to schema
Date: Thu, 01 May 2025 15:24:18 +0200
Message-ID: <3825395.MHq7AAxBmi@diego>
In-Reply-To: <20250415011824.2320039-1-robh@kernel.org>
References: <20250415011824.2320039-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_062421_237336_8848A213 
X-CRM114-Status: UNSURE (   7.34  )
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

Am Dienstag, 15. April 2025, 03:18:23 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Rob Herring (Arm):
> Convert the Rockchip RK3399 PCIe PHY to DT schema format. Move the
> example to the GRF binding as that has the complete block.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



