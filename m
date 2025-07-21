Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD1CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 09:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyWrAx0qfoeFOd6QPNZwc9PAMy/3ai7CwStF3uhwLDA=; b=rLksZnqrVFvo8irG5d3H07B6RL
	VH16LFkeaJKa9Ez9QjbL8DyR7T1jqB2j+xE/laZQdGNl4JuZ1W2CQJgB7m7xARwKri4DskvAu+J90
	V53KqdSv1v3Wf8SgyGqXedCRYg+d3QCuy2V+dCard98l80IMKdZgoYtGliW1AkDLIsaZF7x+zmdq/
	oJnmj9Hl0tkhRrDEaWdFbN7KDkBhGTgxw1J6UFMv1nVSaXoalamzxa6T6CPGoHMrdjf48vESmtMHg
	gC/a5NyH6xr4UicRZAMXrlfKRBPrNzXzNgluLnPhZaoF8dlJAjUPdhDOp8WOTpEQamxwfrU4EmGHE
	MeiQC82w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmvT-0000000GpFi-2GEn;
	Mon, 21 Jul 2025 09:35:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmQo-0000000Gk2v-1wOt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 09:03:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73C26A527D0;
	Mon, 21 Jul 2025 09:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91394C4CEED;
	Mon, 21 Jul 2025 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753088613;
	bh=2WyU0FIwwAaqd7wKJ14a9HbxLjKc9PEgGxTV9aHjfwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HkOy6hTH5OkSNlT+Ks1wifmkI4AbOHdrXmvPN0zXOiYQEw8c30+iPdqSyFsAl2LKV
	 gEIl4zbosH9WaOKEquHdrKFCkwi2vfa1AQKd6127Vl9woCogY6Yy6ZF/AE9wagCw7b
	 YIJ0OvPYGoa3JLETOoM8wTwgqei4JM0gQ+3EzfGrcNbMuJbMcZOlkenp9Zv5NpdU4a
	 vl5UmzhnsZ7a4Stjzkg47tMX82ydOP7X3YKDUIOQtTLwnGF3ySqhccVuPrIa2y6KL0
	 9nabpSOiCrhhX+GCnafaIiYJLEvmYt84BSfIbaWorS58FnF+dSIoUX4Xdrz4PFw6i6
	 9ssz9OAyrbFTQ==
Date: Mon, 21 Jul 2025 11:03:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 04/12] dt-bindings: display: sun4i: Add compatible
 strings for H616 TCON TOP
Message-ID: <20250721-heretic-solid-firefly-05ce87@kuoka>
References: <20250720085047.5340-1-ryan@testtoast.com>
 <20250720085047.5340-5-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720085047.5340-5-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_020334_572068_716C2F81 
X-CRM114-Status: GOOD (  10.24  )
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

On Sun, Jul 20, 2025 at 08:48:42PM +1200, Ryan Walklin wrote:
> Add compatible string for allwinner,sun50i-h616-tcon-top with a
> fallback string of allwinner,sun50i-h6-tcon-top.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> --
> Changelog v1..v2:
> - Add H616 TCON TOP compatible.
> ---
>  .../display/allwinner,sun8i-r40-tcon-top.yaml       | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


