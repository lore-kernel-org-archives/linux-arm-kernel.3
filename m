Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7E9D59F57
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 23:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5l4phBTQ5s3tak8rbu73PqDDxyijhO9BxipaFMLBH4=; b=TANJkg3ytf25jbho5NUs4bZRu2
	BsVdnBjYFU1BujBXfEuJ5KbEHbFdMMPLiLHFz6DZb5AgZ9rfz6K4gF13N0k8sFWiHNym64cnzbo2h
	Rl1dDvwzEbqs4XbiPzrTyycyadun0NgwjWbJzUzlZwJPaY08+NNkUi0jyPiytA7G/9I6/ztLv/ASE
	dpOJhOjx8yza2enqwyAyCASljntlqWoA82pSHdSHYgnJFG86tNNp/n8AsDIsi9Rc+xbzE9+x+EvIc
	5E0/LzuPTsDALE1mqm5WCV+uyF/tis25EJzM6iG7tE6KBcQpuZZtnnaPE74WFgm/Fv4teSjsQ81Pg
	AwgbIsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUCDD-00000001CSF-0BHO;
	Fri, 12 Dec 2025 23:06:11 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUCD9-00000001CRn-3ESC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 23:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765580756;
	bh=x5l4phBTQ5s3tak8rbu73PqDDxyijhO9BxipaFMLBH4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jiFkvtOOi1rI+ninI9Q/X+ONt7F0b8K8Rtwkl/uaSOPD7NAZAPpRNpd7GPDC5TIed
	 ITcpORYrpcHFtU2o2l+Zy1N+h6ZB2JsFmCrExwlHN4bxLny2EC+BBe262gzuKEILVs
	 LF2Mv+hq9Y0LnLOLiBRBlK+6VIX27ZX+ch2SPWSBORcBR4lc0a/w6pmqZSFVq2TRoW
	 2gjww3rFueIk87oOb+83aKxIDBVxL3I/IcpyOx5au3kcJTaXPvpYReuuNqW42GMeVg
	 kRmwx2MntlwLb9dcRj9Ad6S7kznj+oalmwbE/kszNE91aXFQdGvYYBXt49KwsoKpX7
	 j0V4K1M6Te7Cg==
Received: from [172.16.11.106] (fpcf41bac9.tkyc510.ap.nuro.jp [207.65.186.201])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A6D3C64DF5;
	Sat, 13 Dec 2025 07:05:50 +0800 (AWST)
Message-ID: <35ec28a70d360b2139742e9f04ff77e4a907cd2b.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 00/16] Eliminate warnings for AST2500 and AST2600
 EVB devicetrees
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Linus Walleij <linusw@kernel.org>, Joel Stanley
 <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Date: Sat, 13 Dec 2025 08:05:43 +0900
In-Reply-To: <20251212150631.GA3997751-robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251212150631.GA3997751-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_150608_031517_56BB8420 
X-CRM114-Status: UNSURE (   9.78  )
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

Hi Rob,

On Fri, 2025-12-12 at 09:06 -0600, Rob Herring wrote:
>=20
> Don't you see warnings for at25:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 89 (atmel,at25): 'size' is a required property
> =C2=A0=C2=A0=C2=A0=C2=A0 89 (atmel,at25): 'pagesize' is a required proper=
ty
> =C2=A0=C2=A0=C2=A0=C2=A0 89 (atmel,at25): 'address-width' is a required p=
roperty
>=20
> These are due to using the deprecated (since 2012) at25,byte-len,=20
> at25,addr-mode, and at25,page-size properties. I think it has been long=
=20
> enough you can just replace them with the new ones.

I don't see them, no. The series targets only the aspeed/aspeed-
ast2{5,6}00-evb.dts files, and neither of them contain at25 nodes. grep
suggests its only IBM platforms:

   > git grep -l at2 ../arch/arm/boot/dts/aspeed/*.dts*
   ../arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
   ../arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
   ../arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
   ../arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
   ../arch/arm/boot/dts/aspeed/ibm-power11-dual.dtsi
   ../arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
   >

Once I've got the pieces of this series merged I'll encourage platform
owners to start cleaning up their own devicetrees on the basis that
there are no longer warnings that aren't their problem.

Thanks for your feedback so far!

Andrew

