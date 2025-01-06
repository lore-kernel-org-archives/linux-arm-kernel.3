Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7904CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 23:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tk3HDO1RXmeaTn7h2NrgJSeAsieiLy4mYuakR1M3QUM=; b=OfF3BKTlNPQZUHXlw8DeGn6BdI
	AROhxBXA7opNulkCbfoldyf4qfJ1A8YL06EA7oUx7Ev+avk7sORLVxtZMNH0hsKkEBEMIw1GAt/8x
	yjGEQSZG/12AeaFflODQCXH1rw1WY1PeW7ZyZg3BGmKpV36SCdjn9wrxpmCN3MR+MpGTXye1J9WYW
	/0+/PpeluyH9LcAE4zT3rbUiflM8QwszxRFl18ZskRsN5i+4LhLhoFZFwhKJCaYAGpRT1d6QmJDVj
	fIXo/fywCx+Nd6vGqjVd7MXDh+QgkTxKmbp32hoCoiSpBvz/wrDzbCue8iPfwVdHQYkuw/A5GkQBU
	xXoQUGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUwqq-00000002yVD-14vp;
	Mon, 06 Jan 2025 23:49:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUwpY-00000002yEb-3wEE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 23:48:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3FB4A41F22;
	Mon,  6 Jan 2025 23:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D870C4CED2;
	Mon,  6 Jan 2025 23:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736207299;
	bh=tk3HDO1RXmeaTn7h2NrgJSeAsieiLy4mYuakR1M3QUM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tW/AKC6rNfoqOpvbWeLnrdjUDMiKmSwl4o1aQoVgYauhNo+xou3nvavqPDWZkDa31
	 511k/EZe95NFxJUXku6B0yMdmCeVEOIXh0qwoyiERB6kDx2e1JCB7TGpZghX/npBf1
	 8hGUNVt/NvC15uni0XXfzmGIu9o2o5PerRJNlJ5ETOzvEJbVgeW0XzB0sUJ1i7vTFb
	 MkXNG35uMqtH3krjS6gLEdfF1sYZT3JHF2weYHaQpoKR636ZElQqJE6DvmgvVsV8Ko
	 MMz7fthSGcYAAxscWvzO18NA/vYKsj2Zt6EpOTKEZmlWjlvV6P2yw0gXNQwnBb+4xl
	 +2obtLht1PDPw==
Message-ID: <c35f062bd6a9310df7bd5b5e3ac4cd24.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com> <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: st,stm32mp1-rcc: complete the reference path
From: Stephen Boyd <sboyd@kernel.org>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Mon, 06 Jan 2025 15:48:17 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_154821_037630_FED4134D 
X-CRM114-Status: UNSURE (   7.96  )
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

Quoting Dario Binacchi (2024-12-31 07:01:41)
> All other paths referenced in the file follow a scheme starting from the
> Linux root. The patch adjusts the single file that deviated from this
> scheme, making it consistent with the others.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Applied to clk-next

