Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F22CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 00:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsj1k0wHi26GAkypB6QUIJqC1oJwhVzc1i56Db1iD/Q=; b=AeVuA66wTLls2rEeqqYF7sugZ6
	LBRpRVxjen+1xYbrnjbGVk9UIfO3CbhCOB5yfVMhUMl2Nx5kw1LkwnoxYgoJC9ARvMK2jOsgxh/a7
	GFFlm2tyFRGNm1YB9LAYJ8C4+LqnWtj6cC8qmubhMtcnGQU9mA2w2wL3m83c6PNcVc3ek6kQL6K7r
	fiPXUfj36u7vZsZZk1wFhv3j6Vv8EHjg+7t9sfBjxOOJSQkumsLwb6f4/nQpy+DQtIKEG70a0yYoS
	ZwMR8yZDIucqd7XmEJbF/IdUPfU/wfTHRf+jB0+x7mQTkm47QqgdwjF19rzyzw/1pCbviuCDMI6X+
	ObzitG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIfV-0000000HStN-44UR;
	Fri, 05 Jun 2026 00:44:13 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIfS-0000000HSsw-3Bjy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 00:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780620241;
	bh=jsj1k0wHi26GAkypB6QUIJqC1oJwhVzc1i56Db1iD/Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZloprKCoX5TNbNEPdKftTMY6jPQai4UHIv8xuzYMMAW63DXTDsjdtaGphRix8B1EL
	 AIWw4/scrV1UPtHbLqV5OaWdPT8rMfT21f7X8Pe0R8P//3NLgIT7ahtwjIc26E40yn
	 GEuPBXect43k/BQgPksH/3n43NAcxwIe2bNCl66hs/WBuwV9tCxzTm38c6l/bI0ova
	 mRmOr1VUUxbj1SNXcDm7yRjyjleLLu1d0fPWzFQRrp8RDCcpv4vq/9f/plk01hK5zm
	 XuCUQ83LILf14iJSNxuWw2vM4twD7zfH9MXf29u0UjGNHjlZcTiEG+svE/RZndnp6G
	 xGRqX0Bwk0I1Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C193F6013C;
	Fri,  5 Jun 2026 08:43:59 +0800 (AWST)
Message-ID: <91f6780b688285b4c002d2efadc7b297e9d69838.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/3] dt-bindings: mfd: syscon: add
 aspeed,ast2600-i3c-global compatible
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Dawid Glazik	
 <dawid.glazik@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, 	linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	maciej.lawniczak@intel.com
Date: Fri, 05 Jun 2026 10:13:58 +0930
In-Reply-To: <20260425-poised-accomplished-hyena-d2c1a0@quoll>
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
	 <41d66492e1a1d42f6888459288311094c8b7bc51.1777058942.git.dawid.glazik@linux.intel.com>
	 <20260425-poised-accomplished-hyena-d2c1a0@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_174411_020084_7C98D407 
X-CRM114-Status: GOOD (  11.23  )
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

Hi Lee,

On Sat, 2026-04-25 at 11:40 +0200, Krzysztof Kozlowski wrote:
> On Fri, Apr 24, 2026 at 10:21:00PM +0200, Dawid Glazik wrote:
> > Add aspeed,ast2600-i3c-global to the syscon binding compatible
> > lists to document the AST2600 I3C global register syscon node.
> >=20
> > Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> > ---
> > =C2=A0Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for applying the AST2700 SoC1 pinctrl binding[1].

Can you pick this one up too? I've applied the corresponding dts patch
to the BMC tree, it'd be great to address the warning that's currently
produced.

Cheers,

Andrew

[1]: https://lore.kernel.org/all/20260521-pinctrl-single-bit-v5-1-308be2c16=
0fc@aspeedtech.com/


