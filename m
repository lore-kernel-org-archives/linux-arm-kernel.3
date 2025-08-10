Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB858C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 17:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvPE3gKFuM4pT7ZNPxvEvbQ0yUs2RSwcbuORd8HJvxM=; b=eJhlCa877TGZE7cySbtKlwXUs5
	tsnDi+qLY+0/Rw1jQjnWhyeOqVGUrEG1HW91Jy7loyXwJZIZFknV2L2pIJvz8bWEexLq1/miehr/F
	mVIC05j/K0DTBrgAZGqQ2c4Vt//CHrI808Rk+AHbtr2Kczwf8/kBTm1EI6V0XzeffiqBTzzjIlpwW
	FM756B5VWtERTbTnIBg2j10MBJTWtOvb+i9cx2gYylzEOPuThF0SfkU2RhrlKwNM31mc+O5kvfD3F
	1oixq//hk2zQGvLewuaYrfk1h4AqBzKtZadqY5CANt09C9L3PJ3Gww5UMSJ8N/dQecL0FtsL4eygG
	DI6G+E3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul9bz-00000005pNn-3Fkq;
	Sun, 10 Aug 2025 17:13:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul9ZS-00000005pDi-0iFs;
	Sun, 10 Aug 2025 17:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4599BA5572A;
	Sun, 10 Aug 2025 17:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE50C4CEEB;
	Sun, 10 Aug 2025 17:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754845855;
	bh=QvPE3gKFuM4pT7ZNPxvEvbQ0yUs2RSwcbuORd8HJvxM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aiM6jR72zDLjMW6IUCTGq0Wf159g/BrA6xyFbbmgY7FQkNnkyUYEaSYC3Fwy0Y2FY
	 31ne1gn5E8mYq3uxFbCE3mbVI0zGsIwsroiamjMOmUefL///6eOr42dWGU2xAEX1Xk
	 dlCyB6dRCPvtTw2sQ/1sTIxHTy7aOVCKEkVv5jwo/mVh250LsGgM22PfdPcX9gPUPt
	 7+P++3vj/qlkB+u3GLhhOVLqWm3BeIp4wnBQd6OiiJ6DmEl1w7L6djshUOPDLGVTMc
	 enJ6+1YivMH4JvzbeIHfE0n7QZ3+DHvCVIxEvYAQFANTLHlhU5iQJf+ylJikaF63sL
	 Z/BqDLklCJdPw==
Message-ID: <cfa890e112de78b7e14f37c8edebd91a3d49b16d.camel@kernel.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: Drop Nicolas from maintaining
 pcie-brcmstb
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Florian Fainelli
	 <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan
 <jim2101024@gmail.com>,  Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring
 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "moderated
 list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, "moderated list:BROADCOM
 BCM2711/BCM2835 ARM ARCHITECTURE"	 <linux-arm-kernel@lists.infradead.org>,
 "open list:BROADCOM STB PCIE DRIVER"	 <linux-pci@vger.kernel.org>
Date: Sun, 10 Aug 2025 19:10:49 +0200
In-Reply-To: <bulofvsxrn7qm7vcuxhweqwlzaf7rkvzsmyg4ox67gi6gc55lg@xl2hlxd5fii5>
References: <20250624231923.990361-1-florian.fainelli@broadcom.com>
	 <20250624231923.990361-2-florian.fainelli@broadcom.com>
	 <bulofvsxrn7qm7vcuxhweqwlzaf7rkvzsmyg4ox67gi6gc55lg@xl2hlxd5fii5>
Autocrypt: addr=nsaenz@kernel.org; prefer-encrypt=mutual;
 keydata=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
 K0vsFJA6LwvvMJooL7dQzwIU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_101058_409119_F237066C 
X-CRM114-Status: UNSURE (   8.59  )
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

On Thu, 2025-07-17 at 18:12 +0530, Manivannan Sadhasivam wrote:
> + Nicolas (who was not CCed)
>=20
> On Tue, Jun 24, 2025 at 04:19:22PM GMT, Florian Fainelli wrote:
> > Nicolas indicated a long time back that he would not have the bandwidth
> > and indeed, has not provided any review or feedback since.
> >=20
>=20
> Nicolas, I hope you are fine with this change. So I'm going ahead and mer=
ging
> it. If you don't feel so, please let me know.

I'm a bit late, but:

Signed-off-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas

