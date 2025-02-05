Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFF6C02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 00:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWQWzYt8utmoJ+vGnEmbU1n9a9uX+2dxeh0p6epdA/g=; b=ERpdndlfWmD7+TrHjW5oLbgnGZ
	wzdT7QLDjhSSOs2WlxpPy/xu3VF98Er9qvZZCLdZfKyVNVf4/Ge0t0uMP2q2G23CO53dgCkMlWHyC
	kFqksuginTwr+qoIR+K1bDn2AxViOpne+sWkF0qYdte20otOd3U3/pdH5A7OcefIn++RT6x74/eX4
	I5tLVCunsDXyXURQ/xyLEEHXiX0N6Qa9Ijx/emOfokqUHK+QsyZU9a1q6eqF8XwZgGAMLGzDeEtyV
	Lyzb+rBjb593QX9pQMeQYdgaclFq7iUkZJKfBxk93QSnHIQK14UUgOe9x/RaAe6eISJAGA/opNNGr
	iQ/wFSeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSu8-00000001sqm-11gF;
	Wed, 05 Feb 2025 00:04:32 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSqh-00000001sNH-0Ga2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 00:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738713657;
	bh=GWQWzYt8utmoJ+vGnEmbU1n9a9uX+2dxeh0p6epdA/g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G5V0byMamZKCiKzf3lArq4TYeY5xEWC8oOt2fXx/T04duFwgkWOGBbfVgQcbMEZzZ
	 ehkem+9oG4eutuRSWau/YSE9SkJCh1rQ88Zey+Eb9cX0nTpHYDwpSKxkCNJrynFyAN
	 VCE7DcFnp+8JO0OXy0CFmvPzc6Q/jSdFqjIdEYvPiExZXmyPrTUHI25vrocZJoeRJl
	 AUU57qZK5Jx6FzqmErxeDMKftT7YaM1cBJ1Fjjx/i7JNMKCn5Xx60vDAG90IjA1XfA
	 jt9FaxFYR+p18EJ1dFp0WFLxoaRfWYtaCVzBdm+vGHPyiL4kXPdaNKeSGchkbAdtY+
	 FD0cpUz4eeelA==
Received: from [192.168.68.112] (ppp118-210-185-209.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.209])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 992C37104E;
	Wed,  5 Feb 2025 08:00:55 +0800 (AWST)
Message-ID: <fd92f75620e48957c2875cdcfd1285c33d3176e6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v9 1/9] dt-bindings: ipmi: Add binding for IPMB device
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, minyard@acm.org
Cc: andrew@lunn.ch, brgl@bgdev.pl, linus.walleij@linaro.org,
 robh@kernel.org,  krzk+dt@kernel.org, conor+dt@kernel.org, 
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au, 
 devicetree@vger.kernel.org, eajames@linux.ibm.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 05 Feb 2025 10:30:53 +1030
In-Reply-To: <20250204194115.3899174-2-ninad@linux.ibm.com>
References: <20250204194115.3899174-1-ninad@linux.ibm.com>
	 <20250204194115.3899174-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_160059_301226_98AB013C 
X-CRM114-Status: UNSURE (   9.70  )
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

Hi Corey,

On Tue, 2025-02-04 at 13:41 -0600, Ninad Palsule wrote:
> Add device tree binding document for the IPMB device interface.
> This device is already in use in both driver and .dts files.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> =C2=A0.../devicetree/bindings/ipmi/ipmb-dev.yaml=C2=A0=C2=A0=C2=A0 | 56
> +++++++++++++++++++
> =C2=A01 file changed, 56 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-
> dev.yaml

Would you like to take this through the IPMI tree? Otherwise I'm happy
to take it through the BMC tree with your ack.

Andrew


