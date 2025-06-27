Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A57C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ck+DzOXAxdqOO+jxI+vUNr8Y2kNlJLXxkINzJ1YAIWw=; b=ZFzeNV/+AflH/BW3QQRxEe2oXm
	lEiYlOhGbxcGq23eG0UU2saQFx4G7fs7OxUHTHplv+mvCv2KnDATY5RlxbROv4KEPxPD6WyOSERiQ
	FYOg/oA5+D8ShMMQMu1egBHyamnMgzXyeRC2zvLr29jdOUMbfbcHj01N3jkwFphDgCM/LpC/yedtf
	tdhx1KTdaI2OmTBDccq+8ZYQAH84lo+02r1udWWX8xje1SwPMSTpL/jSrJVA+96TozZEd+DyiqZhF
	3WK6QMNzjITv/knoZak095fMCVDasmp0HSoP4wb81hRFBldg7YBOdED4Qt8y9jrgU8TmbgHpaI4hw
	9lnuSSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUxGz-0000000DF1f-1oD6;
	Fri, 27 Jun 2025 00:48:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwbC-0000000D9sg-2Wmu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 00:05:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB07D458E0;
	Fri, 27 Jun 2025 00:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEC7C4CEEB;
	Fri, 27 Jun 2025 00:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750982745;
	bh=Ck+DzOXAxdqOO+jxI+vUNr8Y2kNlJLXxkINzJ1YAIWw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GXOOh3NA9gmywj39wIs+aigKeNMeViNksWSk/5y28zohFx5WMCY1eLtcSzpdzXU87
	 VX3w9Xk1/v3Oyt/q4VsNpOGuxQYZYFkaBuDSV+pQcMu0oOwVZZAAl0H/Jx2/hp78+Q
	 4G7cybaPKiRznAIICJW+8KA38s8MPCywWbABM/BgXMHHikQ0I8mg+H0p0RiRLuo2ch
	 vm7SeUCxCVzi61OIuPKt7oBnydhcGEx7lDXQ7GsmwPy04yjNnlv2NWJZtgeUNFjqCo
	 cPSSlOVHksN5Kiqwb/wa/AXUQPbIzka2jCmLDz48p7Nl4hz3cr5m2s4BWC7P3rbHV1
	 4alWUEk09msug==
Date: Thu, 26 Jun 2025 17:05:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, Matthew Gerlach
 <matthew.gerlach@altera.com>, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Mun Yew Tham
 <mun.yew.tham@altera.com>
Subject: Re: [PATCH v6] dt-bindings: net: Convert socfpga-dwmac bindings to
 yaml
Message-ID: <20250626170543.6696868d@kernel.org>
In-Reply-To: <20250626234119.GA1398428-robh@kernel.org>
References: <20250613225844.43148-1-matthew.gerlach@altera.com>
	<20250623111913.1b387b90@kernel.org>
	<20250626234119.GA1398428-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_170546_658735_E8DB7B20 
X-CRM114-Status: UNSURE (   8.61  )
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

On Thu, 26 Jun 2025 18:41:19 -0500 Rob Herring wrote:
> No need to ping us. Like netdev, you can check the PW queue:
>=20
> https://patchwork.ozlabs.org/project/devicetree-bindings/list/

Thanks, noted!

> In any case, we're a bit behind ATM.
>=20
>=20
> It looks like we have 2 competing conversions of this binding. This one=20
> and this one which I reviewed:
>=20
> https://lore.kernel.org/all/20250624191549.474686-1-dinguyen@kernel.org/
>=20
> Looks like there are some differences which need resolving, so I revoke=20
> my review. Will follow-up separately on both.

=F0=9F=91=8D=EF=B8=8F

