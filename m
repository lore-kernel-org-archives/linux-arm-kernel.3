Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A441FD14893
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 04:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mza9GtPsCZLKy+XJqnLyYl8qsw+mGBG9tczLaxgUCDc=; b=Kyfdp5ntN76hhxx1zt3rizxsb1
	dt4wZizLA+j45ppZ/Gv0N3Bj4qSR+PHN/c0NfFcLDTFXs5cTqNvJMa47JWKGSOwlI53Vr4xQWH+wF
	LGUTiCKa8fRUChIMrxwOism2p7v8WOETu+r3A6G6hBE8GD62ou81o1DSpmbtLMnlaRvCQiQDzSvnd
	kN3bOft0jB581O1lbPfr1K9co0nVTwQ1194nDdPNrnLACddvWSt8YTc241xSbmx73Mp6RNYyYowMT
	bbVQd5NuCpL+4pCVKrZT0KZ9o0MneI72tsGGK/a1gA1jxBLP3+em2Vha1U/RmrtAyQizB1LjYE+Y2
	+0FA6rdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdhuk-0000000FvDt-1vWq;
	Thu, 08 Jan 2026 04:46:27 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdhuh-0000000FvDV-2ht1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 04:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767847581;
	bh=mza9GtPsCZLKy+XJqnLyYl8qsw+mGBG9tczLaxgUCDc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TyIxG2bgkBhsdIYW38rKXW++/Ld6xXFCIe4TS/ssxX4Z6i6DG6yxFkEWV/4xZa6Bk
	 mwWrp9aTaGvSzNWsNFyBjrWTCPLjaVLOLuZI4VlauW1WmCDhu2f7KRA/LhY2CpS7/J
	 Ugx2ztmNRyhg00QcRAYpfMOKhkDoHo5I3YFs9J6zxQRV3QBJcIynPzTFk8cSmrnNSw
	 Q7cPtiCGy9sDjTsJlGOTG2CZlZkJ0Wo4om8iFHcPQjwE9vKwYQpL/p0FK7v27V9S/r
	 BiQOfFgZ7IMc/7g6DO4VSokhSlvn+e4luIkP2M9CtsXrjAo+m1YakSCZ/Fo/uBXEzL
	 RjZIhUEG8+QiA==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8DDF879F8C;
	Thu,  8 Jan 2026 12:46:20 +0800 (AWST)
Message-ID: <a0d802a1e450860a9859ce3d456fcce81dde8ba3.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: yosemite5: add x4 E1.S expansion
 board I2C mux
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Jackson
 Liu	 <Jackson.Liu@quantatw.com>
Date: Thu, 08 Jan 2026 15:16:19 +1030
In-Reply-To: <20251222-yv5_add_dvt_e1s_ioexp-v1-1-25ad202d2681@gmail.com>
References: <20251222-yv5_add_dvt_e1s_ioexp-v1-1-25ad202d2681@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_204624_167983_7EA87A02 
X-CRM114-Status: UNSURE (   7.27  )
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

On Mon, 2025-12-22 at 19:25 +0800, Kevin Tung wrote:
> The new hardware design adds two additional E1.S devices behind an
> I2C mux at address 0x73 on bus 10. Add support for this mux in the
> DTS device tree.

Out of curiosity, you're monitoring them with the NVMe-MI basic
management command and not NVMe-MI over MCTP, or is there something
else going on which motivates describing empty mux legs?

Andrew

