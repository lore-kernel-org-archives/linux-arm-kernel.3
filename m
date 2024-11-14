Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23A5D6A22F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 21:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RG1GHuMKWcuonmjsC+qi8OfZV4+4HUh57bb4KUZX6QY=; b=GzH3KwxaimgDFxX+t4os5aqV/n
	o3sYaO6B9l5MqqG7UQ7x/F0kj5tHrKlAVdtsNqDBRyzEmqwo+21RRQ7zP0dI3gj/+S9oYYZkn6cp/
	Rmu4MrKj/rWgub3tomJjpzp74hBYMu5LA7uU171mn7zEzY91YV8bGQcBMrxjTFMW+5dEqd+Rgn9ju
	tAHOwbY/aIFKF/6Nm+qb/0Ll0KXFo16PRh21NfJh6rfLtM4WMqdtyk9j9s3B8QSOTiZEAD54ooZ74
	v/jZn58H6wdPk6px6DPkZKUNhqAVH7dyZEcAqxklbM9oDFa13QSbXfneIbWGb/rT9Jlenh7pfp2eN
	3cGSdMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgzS-00000000pmF-41rG;
	Thu, 14 Nov 2024 21:02:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgxt-00000000pLA-1272
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 21:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73EDB5C5C72;
	Thu, 14 Nov 2024 21:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B0FC4CECD;
	Thu, 14 Nov 2024 21:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618080;
	bh=RG1GHuMKWcuonmjsC+qi8OfZV4+4HUh57bb4KUZX6QY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nf1c8pyxATuPT4X46VFsO4vdktspzDfSWFvirSPUhMWto+qEi5J1JAF70zfiwd8RJ
	 uW+1HASKf1GZXGaFJqUA/P5X3xjZKhCCzaMkj1ftqnkcItHE8nQ42GkMlxpXo4LeVp
	 whUNqVmK0IbPUbiPkvPj/EMT+ogLR++XGPQ3PADSBduy2UsjNCYBvTcc9TV+TybiK9
	 MQwMeq5lAxkEdjXKS16SWh4q8Jv1KMst9DCIbz1dxZHpjz9DkjKXEZuR5fkV8ocnLH
	 EKOKYhG2sOM4+pLKpYJcRLSvqSF8sJNaH1NUMH8pmYX0gsqpzWMZr53Gc3DQC4YJTR
	 FZRm8HN5UDZgg==
Message-ID: <47b2b9acfc19f3d4801e5cdd0e1c040b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-2-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-2-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 2/7] clk: en7523: remove REG_PCIE*_{MEM,MEM_MASK} configuration
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:01:18 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_130121_324692_F34088A7 
X-CRM114-Status: UNSURE (   9.92  )
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

Quoting Lorenzo Bianconi (2024-11-11 16:08:49)
> REG_PCIE*_MEM and REG_PCIE*_MEM_MASK regs (PBUS_CSR memory region) are not
> part of the scu block on the EN7581 SoC and they are used to select the
> PCIE ports on the PBUS, so remove this configuration from the clock driver
> and set these registers in the PCIE host driver instead.
> This patch does not introduce any backward incompatibility since the dts
> for EN7581 SoC is not upstream yet.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next

