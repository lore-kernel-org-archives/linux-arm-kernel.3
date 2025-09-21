Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DF3CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 17:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffJbmNoMdn7kDBTm1E/CHINJQhEqcbYTDeeSi9wci2Y=; b=R3g1fBONMB7yp3AoqMTh62MO32
	7oUX5zY6e/85zrIU1wuHKoF2jaV69LD3JDE+5UhwOQCNPaskK1rLCX++HiTIEnkp6wYa/ru739xBL
	t1az6qmEuIC3djPVgF9EqnNheZ+zqcmhAacMDYgVfgtMvL69yP3WlXNF0WyCGoVr4+nbCOWlEP/qd
	xUbNtBn4VLm+9d/g7h7PLyHWm+oi6ecGEGeH3NMCS2fzz8i5pVGnmbj0ZnYQvfWOcUxI1amZRzVN8
	BpWAr7CAboGF0IeWlLKwDL/FB/V1uDC/Qbqlx666ddJ3AvknqsYWdmSPrYtAVl3tJm/G3PnrDiLHQ
	a0rId3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NwM-00000007wJ6-2UI1;
	Sun, 21 Sep 2025 17:33:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NwL-00000007wIw-380S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 17:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BD9B601A3;
	Sun, 21 Sep 2025 17:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C40C113D0;
	Sun, 21 Sep 2025 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758476012;
	bh=ffJbmNoMdn7kDBTm1E/CHINJQhEqcbYTDeeSi9wci2Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SXm8WaH7EWzPNzDqjISh5EFEZHSrGHVTpAT7LTO1FNxPKe9N4QyRlvnd70odZqCFw
	 IyN7rIoruLgjunml+0UHmvWiJ44eKhrBrhhO9v0Lln6yPOEOljbZ6ihcQKkcLxPZVy
	 gwDcYRoSLbOtBUCsWMBW84NI0ELl9w+OxwCypQ3bXw4yHf96HE9iPombWNWufmO1vc
	 7vP4ea2it3ZBzbeCypzfEnQjW2svS8pNW+bqnDKuV5vbWfZt5tkAPK+1ow7gDu/t3d
	 xMdtG9LU/hrNO7CQaVbxHl5yUHvbDsFB1ENMeIfz03sxNq3PDMGRWA1/Pzx3A4YC4K
	 JMVdA/jlVfoXQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250625-upstream_rcc_mp21-v4-2-9368a86c8515@foss.st.com>
References: <20250625-upstream_rcc_mp21-v4-0-9368a86c8515@foss.st.com> <20250625-upstream_rcc_mp21-v4-2-9368a86c8515@foss.st.com>
Subject: Re: [PATCH RESEND v4 2/3] clk: stm32: introduce clocks for STM32MP21 platform
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>, Alok Tiwari <alok.a.tiwari@oracle.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Sun, 21 Sep 2025 10:33:31 -0700
Message-ID: <175847601134.4354.18300374897376083425@lazor>
User-Agent: alot/0.11
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

Quoting Gabriel Fernandez (2025-06-25 02:07:25)
> This driver is intended for the STM32MP21 clock family.
>=20
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
> Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next

