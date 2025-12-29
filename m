Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2B4D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xhhaTRQrG7bevnfNFq4027A3kYfOASqW9m2qnkDxRU=; b=fF+KjpbNSh2tVm2GzRVMri34uG
	s84VKlu2NiKCWOtPQgCvQ2xU3XQmhCjefvFaP28XfkgR3lHaLY6wJeA1QjKC6DvgqXJtBFeuVBjTO
	Mz2Sx/k2UFl2i9Bg4AFvAIl15cbb4obeW/LpLY+f0s0NfWCcdSd7q+SY0CYmZTTOPtX5qcaur5OUe
	Vo1VPf5mfTqs5oxS+L4XHJChyuaeYMFG7MnerhM805EgpAUP+FiH/4Z78sDVPtGxVIH5GcVDD3+nD
	+EGSS9xjoXWbG72L44kj0K772O4sdGjQpZRbyOOdswYa+iJzcibBv/Otp5im/fikybXZhLAWv0c21
	khylkQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCCy-00000003f2l-1czg;
	Mon, 29 Dec 2025 12:18:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCCx-00000003f29-0c0k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 12:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA57260010;
	Mon, 29 Dec 2025 12:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D621C4CEF7;
	Mon, 29 Dec 2025 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767010720;
	bh=ueoVSPNquBLMs0IZHz5jDUIbmWSHbnPAzQ+YsxDPZPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQwECaomc48RpCqWU9YQLRZNTXhZKcNHZEFeKlJ7z7X65t5ql8JjVc1ZklSUIaeUW
	 bJfeZbYvpIhxXQq2PGv1wJ2zcrWs7V1GoO43KLZpGuYId/CO2ZN+VCtweFauvaOXho
	 JKW7K9fQ3xSapIKC0wpP+TRav4+Kp+ik6WSMp04jSFY0V1YtxPvi2Lp2anrFCRoxyc
	 fs/nZJ2X7KxcDdgLMjuoTUHgRUFGIJiIOBmYEp7QMaSWxDb2Kd05hAfXjvcMPnzoGK
	 z3dJunan7VxXBJkt6BPAulB1y6SGnnmaSir4f55YbBCa+BpRb3B2sOD3InIe7YlI52
	 O/HNXl74VrgwQ==
Date: Mon, 29 Dec 2025 20:18:33 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, frank.li@nxp.com
Subject: Re: [PATCH v2] arm64: dts: imx943-evk: add flexcan support
Message-ID: <aVJxmWaSgG1-dEdo@dragon>
References: <20251119-dts-v2-1-e8f8d91280dd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-dts-v2-1-e8f8d91280dd@nxp.com>
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

On Wed, Nov 19, 2025 at 11:34:18AM +0800, Haibo Chen wrote:
> Add flexcan2 and flexcan4, and related phys support.
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied, thanks!

