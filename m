Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D57ACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 18:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaHzCuM95aqSqMHe5/9SbaGe4NmnIJDlb8i2lDsMSUE=; b=lkp0Tx53GO5lGABoE+z3o4K8Lk
	YFcB1+ZqGiJAMlS4tu53HVFCfttgD8LsVd4YALClBpkb6voRyDwKkj0v5UmxU8qOTgyLyEswcvOS6
	ZJF8IZQEp7tZunAczUXO21GdSsScpE1WcTiUFlNK6j19WAVL1YLwXCQq1n7C/pLZPUBI7JbXc6PLp
	iDH0kjLXoIN7cnDSZHsK5MvJSYK+ZvzU9lbnoAl+Aw+1XXzc90I4+0Fp8Q+zcSu/CNxvkjS1C+ja4
	BbzvI3P1iQG646RCCtPvZXVAUriZsLpdzLUUBxy3Ynhn9d0UkbFTU/003Vw/xnm2Q+8o++jhVqM5o
	qtv1FU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7I7x-00000009AAx-2HYo;
	Fri, 10 Oct 2025 18:46:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7I7v-00000009AAp-3RHh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 18:46:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C4EF602D1;
	Fri, 10 Oct 2025 18:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880D9C4CEF1;
	Fri, 10 Oct 2025 18:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760121962;
	bh=/RQkKmofIpTcP5IxDbViET4LQva955Hk1A6mQ8+698A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJpSuy6QLNiZepjO1i/r9yn4XyKjK8af2RMEVi9vJQPOa0cQBGykqdlOd7ezfx4Qm
	 VQO3orKj+KV4q88mxx4V5o0G/RZ96P4dPmuaMIEBgZkCcFoHg1hqwRKzxo7FC+jWCL
	 bTLHHdOu7OoNEAUpHCynugIsv/3xe6w2/ja6emg0JRBnLatxMx9WUCruDnQzIZoeiM
	 r/MPvV0zCUiU4/bDOSe2zqfReyPbY3X4ZlnBVHFxI/HU3BPOy6tozCndzzuQPr3zOt
	 PynJpJjbpWo7WGC2TC4qe5rFzVNLnmSiIQRnZ60mz+WvclrN541aqTH20dg4epely8
	 Nyolnk19KiaQw==
Date: Fri, 10 Oct 2025 13:46:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	linux-renesas-soc@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: bus: allwinner,sun50i-a64-de2: don't
 check node names
Message-ID: <176012195864.688896.9808018119386389754.robh@kernel.org>
References: <20251009183835.5533-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009183835.5533-2-wsa+renesas@sang-engineering.com>
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


On Thu, 09 Oct 2025 20:37:43 +0200, Wolfram Sang wrote:
> Node names are already and properly checked by the core schema. No need
> to do it again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
> * dropped superfluous '^.*' from the regex
> 
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


