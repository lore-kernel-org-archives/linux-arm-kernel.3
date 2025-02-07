Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B66C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 12:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hb1BL9HTKTtLH1zeyF/ibnMzCyaoavTXsXdsLMI6yWg=; b=VpuS6gLadu2B8a+DjmfrQjOuQw
	VyAtBO08ih/USMtHYkIcwZDWHjawbobnnwCqJhbxmDdgKoYLrDQmD8KbMA3fsfly/FWd4HLD+CGVX
	hhmRxmFiJPl2htLSaG6ZJmSO2mjhUVR9z+1c+L+qGQMzTC0IoxLV4odd+D+eVKxQPEEpUXa6ANEZT
	R3UDjXvOqKCzPE0lmsrdmoJQRZV2wbrTWUTSTgLmmtUJf6w9MBeSGHIMKi4m/H7HOzSYcjrwDzO3q
	fGk8hQtH3OG49Z+x9fXcs/TMGKldS1YuUy6qdWf+URcW2Eyk6Y4rU8Qu8+76u1HPpB4bRnTXkPdXy
	/OTDfigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNdn-00000009XVZ-083a;
	Fri, 07 Feb 2025 12:39:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNcQ-00000009XMU-275i
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Feb 2025 12:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Hb1BL9HTKTtLH1zeyF/ibnMzCyaoavTXsXdsLMI6yWg=; b=oAXdhWoxhJ72HHuGyVu9YcZIbB
	bFkYlrx8SP1zgDPCHdqwTob8EyDT4IuLLH2u76KrtWZiPXA+KjSuxBHo8NvOlKJnJ2mXDnXMGonCT
	bnQu/NAob2rFbqzaqbMAoTSJAFS+yy7tEuqvARQ1/6q90XEuZ7/DUDpy2jPphq+8as5P5IZjUtfwV
	/FyYqvwL/+MXQodL5+AnOu3YNhA4eXjPnUTo9K1PKfExxUCtvWkXkPovGqB8jN/rs4BLndb5wIQ/f
	EQ8hHEb5KffgjzqYtqRZlPpHqtKIp5NrFT7wqqS4ew9kNacRE4GmE0ndLQZNuJFcvnYsph44z9/Se
	c4KE94ug==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNcM-0000000HAol-3vTX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 12:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738931880; x=1770467880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hb1BL9HTKTtLH1zeyF/ibnMzCyaoavTXsXdsLMI6yWg=;
  b=i/lCHUA7ryt9GS3AXjmIPJRJBS8Qxw0RrtrwO7lSTb5DSMA0a9ZS1JoJ
   WL0nfdgNcRal9jfR7gEs71CjfnSMzsKCsWnI2xOZJplwWL/sGHKdLUCxz
   uN2rahWM+JJW0KWRwshMRtlB/6Qq7dHdLrs8ewldaTxtKH7dp8QE7ZWev
   m8ZxQMi3dB1B7AUGg8Rlyacir6F5GKy++/WQBV3dtTVQX7DNRZqLGUWEe
   eeHPsmEUpb5ZZgOWUq3DuaxtB10ENw/+gxONvBUqef/q6LyV+pFASkvPN
   LRw5CZ/A+LCZPj1kVbibVur8U4k0USTLsIapUTAaNATyLtAffVcuTdt8O
   Q==;
X-CSE-ConnectionGUID: Sg42n2ozS4C4fhhAH4VPGg==
X-CSE-MsgGUID: jQSFvGScTA6Nn+RVtwt9Gg==
X-IronPort-AV: E=Sophos;i="6.13,267,1732575600"; 
   d="scan'208";a="41643350"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 13:37:34 +0100
X-CheckPoint: {67A5FE8C-43-727D2C21-EE1B71AA}
X-MAIL-CPID: 1E6721796D650DEE10A7DEEE738D12C6_5
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9884B167399;
	Fri,  7 Feb 2025 13:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738931848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hb1BL9HTKTtLH1zeyF/ibnMzCyaoavTXsXdsLMI6yWg=;
	b=I1/z7SKqrPX2qN6C5RiE/udQgARQgIi1j+FAtEhyXMgksxFGgHeGeoA+rs+40fd9orRLWg
	evVtGx5cAHqAkcNInDsomMTCCSaEiG6Oxcih+ogR+ni/+g/QOHub8Nrj+F+rvEs8Wj9W+J
	g2cyhZnxfSmghza5625asIvgAD6EV6okFThIaAbuX/fRCsCE8ntJCPm6XvQsTxJFJWay4d
	4wcLWC2lES23ablBxxCOzSKEnc1TbQxvJucOOcDLZJFsJjSt+6HBI2x0UJ4a37YOKwRfTw
	xXNhKI+GBnWHQJucW7BXfW/7i+VmtB6OyUM7YHaA0t68UJuAR7VvAiskgA4mhQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-controller references
Date: Fri, 07 Feb 2025 13:37:27 +0100
Message-ID: <8037692.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250207120213.GD14860@localhost.localdomain>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com> <20250207083616.1442887-5-alexander.stein@ew.tq-group.com> <20250207120213.GD14860@localhost.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_123759_590802_C9BC74A9 
X-CRM114-Status: GOOD (  14.17  )
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

Hi Peng,

Am Freitag, 7. Februar 2025, 13:02:13 CET schrieb Peng Fan:
> On Fri, Feb 07, 2025 at 09:36:09AM +0100, Alexander Stein wrote:
> >Mark ocotp as a access-controller and add references on peripherals
> >which can be disabled (fused).
>=20
> I am not sure whether gpcv2 changes should be included in this patchset
> or not. Just add access-controller for fused IP will not work.

Well, I was able to successfully boot a i.MX8M Nano DualLite.

> i.MX8M BLK-CTRL/GPC will hang if the related power domain is still touched
> by kernel. The pgc can't power up/down because clock is gated.=20

Well, with GPU node disabled, no one should enable the power domain.
But to be on the safe side I would also add access-controllers to the
corresponding power domains as well.

> This comment also apply to i.MX8MM/P.

Sure. Do you have any information what is actually disabled by those fused?
It seems it's the IP and their power domains. Anything else?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



