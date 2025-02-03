Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16ADC02190
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 03:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8IcwophMB3hoBBGXT86DKcgpvdtGcA9h2Vz1Sh5RwU=; b=h1t2VofvuND+tNw09qIjF83Wb9
	P7SjgLyLwJ9z64P+rgSwncl0oHTatTkHuEOElZ5I955S8Y2qEMwISnAxepql8yKtO2jXwW+etmCrH
	fEjyJy9udRjT8bLLLnK3d/nP1eOae6szvTYmzdc8vi89wCCKIXsq+VDNByl3Yz7efQy3X5S5IqeCm
	DGxRYpDwFSrv5PIIGh1i5wfGSPrVzm9XvUXH5S0qCz7mX7ZQf7fvf7p9pVC2iYAfrzXXwokct+3Hv
	Cxq0MjuNTaV7aw/5ql9ZrXETWdPVc4yx01jBHqYk9Vn+RQSaa9MIaBc/1jeSxcQVTNe33Mpv7qanw
	NT2dDwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tenSs-0000000EVG5-0hga;
	Mon, 03 Feb 2025 03:49:38 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tenRY-0000000EVC1-0HIc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 03:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738554494;
	bh=n8IcwophMB3hoBBGXT86DKcgpvdtGcA9h2Vz1Sh5RwU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eMdjBFk3KbuTs5LrRrBeRuUqTEk7k4QsMpb/VX5ewByVywkhR5nQEJwluEJ/4pdRE
	 tvN9zct23uahM+UuXIXsQza+rKNiTbRDbn3ORYvLYyr4dlxm7zW/yC11kTCcj/vYiK
	 XyKs6sCqI4rOqRN5/Jdj4rDRnSP/ujlvUaFNOvN83pN13aYHPxQBWhEOzqDk43JlOr
	 PETvdpqQRMN3BdD+L8Z3g2JZRNsWU3yqKAUzhS+C8CSHhxWdGK4U/WlL7JkPXh6Vhw
	 eQwjKpQw+B6mwwH7Ra6Mf0QGmf6u4fVFS2gzIqxCOvZTTYq3+xi5DBMO9haGMa1e5K
	 DkLmHOoJlKxRw==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5B04173C54;
	Mon,  3 Feb 2025 11:48:12 +0800 (AWST)
Message-ID: <0cbefd2b2488b7855fb374ce94facd9f7440b7a6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3] ARM: dts: aspeed: catalina: Update DTS to support
 multiple PDB board sources
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
Date: Mon, 03 Feb 2025 14:18:11 +1030
In-Reply-To: <20250114-potin-catalina-dts-update-20250102-v3-1-14981744b2fe@gmail.com>
References: <20250114-potin-catalina-dts-update-20250102-v3-1-14981744b2fe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_194816_306122_D99F5FF2 
X-CRM114-Status: GOOD (  10.48  )
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

Hi Potin,

On Tue, 2025-01-14 at 14:12 +0800, Potin Lai wrote:
> This patch updates the Catalina device tree to support different
> sources
> of PDB boards.

Can you expand "PDB"?

>=20
> Changes for Main source PDB board
> - Thermal Sensor Monitoring:
> =C2=A0 - Added IOB NIC nodes (TMP421) for thermal sensor monitoring.

Can you expand "IOB"?

> =C2=A0 - Added FIO remote thermal node (TMP75) for thermal sensor
> monitoring.

Can you expand "FIO"?

> - Fan Monitoring and Control:
> =C2=A0 - Add fan p12V power sensor node (MP5990) for sensor monitoring.
> =C2=A0 - Add fan controllers (MAX31790) for fan control and tach
> monitoring.
>=20
> Changes for 2nd source PDB board
> - Fan Monitoring and Control:
> =C2=A0 - Added 2nd source fan controllers (NCT7363) for fan duty control
> and
> =C2=A0=C2=A0=C2=A0 tach monitoring.
> - Power Monitoring:
> =C2=A0 - Added 2nd source HSC nodes (XDP710) for power sensor monitoring.
> - Address Conflicts:
> =C2=A0 - Removed all ina238 nodes due to address conflicts. Moved the
> driver
> =C2=A0=C2=A0=C2=A0 probe for ina238 to userspace.

Can you unpack the issue with the conflicts a little further? What was
going on here?

Andrew

