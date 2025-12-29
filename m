Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B35E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 08:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67pwLLBoTHHBX4RTyB7FiqvZ94xld+8F+iHT3Oc7b0U=; b=nUABvug6PVcfTrUR0yR9AsVUYu
	GwwoPOR58hzEzw9BBKwWW5u5iTfOVTfsLqYnGntjbpCpFbMZW2sqlrUibLrKiFm2r9CLeA5aNo4mG
	HzVdZlqG8pg7OxyisRQX7uqZMfR4DgdOyrA0wyRAOX2I4TSBiZm8gZSlg0RKq9VRKkAj56mWzOQA4
	fZA9s3B0EoA7otW4Szi3kOxy8uujZYw2q9Xtlt0jb7U7ZC5j7PtL0fzaobtUg7eYYoK4+ofNyeVNe
	mQPLCu5Ds93/yakG5UyfBSLmKLXQg+ZaLXZ71geNjO5o4fEXIds73Cmx974XAnGZCiFKn9WyGnqbN
	MNb9FGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8yY-00000003UlJ-3fkP;
	Mon, 29 Dec 2025 08:51:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8yW-00000003Ukv-01Bj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 08:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2E17407E9;
	Mon, 29 Dec 2025 08:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E99AC4CEF7;
	Mon, 29 Dec 2025 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766998292;
	bh=De8M6oUwZaRM6ReeFRBncRB+CAkN4SRlPmejKl4NrD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQ1nwhPQoMfcj88rC2E6YDivr5h//MrtE5ZkanKSuYHDQ3EvjBwHXqS5iuNTuRbH8
	 FHR5hcuZIGTE+rTazLUjXkRJPFZdJ3eVCjA9DkfALQgbohLJJhEtusrkLV2L+tFWvE
	 46M3PYtnCa2V4Ml1Bwznv14KPIzNdswIZCFeCB2wXBZxCuMOPZXFoWDHnYvpjlM65E
	 VbDQ5j0fml+jDNPXT/xTpT+S+tBq9JBL+39+/8dFu50CXroM+Of+bi3vrV2PKsaxAK
	 m4kbZGs8RDz5CTXVLDCq7To+21+FFIUmXfZUChbiha5jwHkM27ccMCh9TZlHBHtleG
	 6xUFIY2J2FQJg==
Date: Mon, 29 Dec 2025 16:51:27 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nxp: imx: Fix mc13xxx LED node names
Message-ID: <aVJBDxyrhCzUgTiL@dragon>
References: <20251118213551.44116-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118213551.44116-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_005136_060483_4FDD4DB3 
X-CRM114-Status: UNSURE (   7.85  )
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

On Tue, Nov 18, 2025 at 03:35:50PM -0600, Rob Herring (Arm) wrote:
> Node names are supposed to be generic and use hexadecimal unit-addresses.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thanks!

