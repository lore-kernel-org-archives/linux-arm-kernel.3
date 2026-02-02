Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DA1E7314C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hX0PUbR+lxT7TRXS9Chm/elfU2/u8o9ggL96ibrGPc=; b=hK1SPFnQklugpAluPLrcRZxada
	sxgqjg5pp6M020rx4lTRkUKr/Ztb0bgKbR6BT9Bla8nfVribZhgTRA397X744NWns9kIRP9W3Omd/
	ujmPICemk+nANmWGHPDhlMbeHm+iV3RX0KXq2QFR/zJmKWEBih/KoSmrY8fTa5gM4JDqBROZ9ILVF
	PZjfGEOoGBbLiaWZnhpf1BXCn6pZ4Sswx/5N+3T8kElSTr+v9vEPUtTsLOHz8gBn8iyuF3/y0FsZg
	dmh0Kjr2a511UxoYSoNn5mSAD9K0z6boZPVUXeqdrsv65xDdbzHyv5AA7Y/RCzcYRBv5Ey9ap8TBs
	9zh5kgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpza-00000004h4W-1kx3;
	Mon, 02 Feb 2026 09:13:10 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpzW-00000004h48-0Fcb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:13:08 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id F1C9D1FB6B;
	Mon,  2 Feb 2026 10:12:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1770023578;
	bh=5hX0PUbR+lxT7TRXS9Chm/elfU2/u8o9ggL96ibrGPc=; h=From:To:Subject;
	b=pPwsAU1qo9g6dq8d9QhFWcYNw5d8dY9JrAN7vBF3aVS0GevnJFM+aAVmUk0iCOaSi
	 Bm9C9iwSA7LR9mIuGda7Yvr/t62k8sg+V/8YuySnSxDZqhobVFweSMOHPypOBewE6G
	 Y7eEGLYZO60nrwtyrtKNk8eGTgrM2Em0EFGFXQsCCNDcAuIjKRJgT99U8MczTibYKb
	 8EKe5AV5U90SsbUjoAw+8qbOvYxhKPhNQzhzVmjTChjzEJj/i1PzTt9kfe65fXYiLv
	 eDZQ2s9zxKGKNEgUa3aooVFBPLj2Iu0CcbSoseZ6LZYYPQVNgw+pO8NoU7iLDn/Obo
	 Hjk/f3xbNaYKA==
Date: Mon, 2 Feb 2026 10:12:54 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Franz Schnyder <franz.schnyder@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: ti: k3-am69-aquila: Fix DP enable GPIO
Message-ID: <20260202091254.GA33026@francesco-nb>
References: <20260202083604.325060-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202083604.325060-1-fra.schnyder@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_011307_183970_A24314CE 
X-CRM114-Status: UNSURE (   8.60  )
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

On Mon, Feb 02, 2026 at 09:35:59AM +0100, Franz Schnyder wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
> 
> Correct the DP regulator enable GPIO to index 21 on Clover and Dev board.
> The 3.3V DP regulator was not being enabled by the assigned GPIO, as it
> is routed to GPIO index 21 and not 37, which was causing instability
> with displays connected over DP or via an active DP-to-HDMI adapter.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>



