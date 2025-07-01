Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2D2C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 00:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvoathe2minC31qj03ooB60wR+d2j58arkQnnk4R8YA=; b=TsTCa58MEnPl0ixJB2vXf84vaJ
	hf89GedHE4Cdgi0kNplyO3Nf3JlO2DXHzPUEe7GkqX+OHWOvlTQ6w5mkwsidb+lIB35DQNDpKnyPK
	N5Cc35x/VKJkboWBcPRWMErKnKl2meylSPWKaM18VJsUmV71FhEOG2a38TZG0wWaWddI6EbKay/SH
	Vi6Qm2DmGWMtva8JZ8zS5u4ZGrwmrGEQsVvzQr6BczSJUkp5PelDoEgPa0XsQP8H/a5qf0wBdmjrs
	T6TNfipRw4uXs0mcLWA8ILYsDLNiNqeyfFXNTNwgg8DTAXL/hIQmvuz4VOG0KGUEdRwSlKlHySyuz
	GHXVtbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOic-00000003j95-1e7V;
	Tue, 01 Jul 2025 00:19:26 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOgH-00000003j27-01DH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 00:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751329012;
	bh=hvoathe2minC31qj03ooB60wR+d2j58arkQnnk4R8YA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RZWtX3aQ1OJJSOcPc0ETc2Ze7JRQhY1qj+uePmSqazjcFGU5y8b22+UowAKECjvXl
	 rpnm9le3jfroboA1St2+StF5q39pnMd+gjURPYFVRHzvjyY5YW24J9t+E98C6inJUO
	 SsV64c6V2TzTfR+wVCiXnpITnjcM+q0SpkOPbCnR0N+N77skmsVTb5XVoXnXWK1CS9
	 p/oA2+S1pn910DbpDa37e+5KgLnv3AOGq4LrBQAnwO0e94IVZ9LU1mbPH95qF1VPqW
	 ZSycR8mSa82XoEOGAsOCY3j2ElclyPZExZQUgtHDvLGhGS+Cn0XP/yYU097Vd25Cuw
	 dRYhBE2BfTEqw==
Received: from [127.0.1.1] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2C47E640B3;
	Tue,  1 Jul 2025 08:16:50 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Marshall Zhan <marshall_zhan@wiwynn.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250630073138.3315947-1-marshall_zhan@wiwynn.com>
References: <20250630073138.3315947-1-marshall_zhan@wiwynn.com>
Subject: Re: [PATCH v5] ARM: dts: aspeed: yosemite4: add gpio name for uart
 mux sel
Message-Id: <175132901095.54792.12200042730026640443.b4-ty@codeconstruct.com.au>
Date: Tue, 01 Jul 2025 09:46:50 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_171701_561433_65BA6F36 
X-CRM114-Status: UNSURE (   6.59  )
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

On Mon, 30 Jun 2025 15:31:37 +0800, Marshall Zhan wrote:
> Add gpio line name to support multiplexed console
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


