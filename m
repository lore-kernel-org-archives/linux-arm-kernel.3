Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE33C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 19:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rhn2Us0y21L3xIlBptTsoF0RkxLh5R04Qv7lXwDF5hA=; b=4y5xVCyjEDuXSMGEBaeXDK3Cg1
	c7quJlbaHDuFSq4VokH/ovWlQE3nHiBzT8ZGCpZNlHxHjTU9s2QVWimtHuIr2bHDZkU00zNc2J0cn
	m+kI8uf+7B0N/XIHhvHzYWdJLBdJahlKuoSv9Tv9BEZcyTcDP1znru2dbxjj2RVAGvg3ysZTcuh9Z
	092VsCmgag4zRo20xsvu4IiWr2z4uSqufmS8YCwcxgU/0XjJrIKTuxE906TlZhx3LAaS0RKOLlr+w
	7091EWxK5w19cI4eMQiJWhlbwf7+pQkvQJGNrx2IOrfGtDCvuR3wQnZ7NxPCPyH+1Sz2aj9ZriV8B
	8XvNhv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcUYC-000000036Ks-2oMv;
	Mon, 27 Jan 2025 19:13:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcUWs-000000036Dx-2bhc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 19:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D68FDA417B7;
	Mon, 27 Jan 2025 19:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60676C4CED2;
	Mon, 27 Jan 2025 19:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738005133;
	bh=L3SiiGUGYpJKCcs/BuywXLrfjhQqmnA6GR2a0coefGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/1SH4e+uUajB5fV42YkeaGwBFaQIWWo+k7S4BsCvVXheIjbXhcMzWyW8PKYlQ8mY
	 9dwb4QdAhwM4LPOtoAsOSN7dXv4uelW5JVVKD0cg/X4tBI9mxNDRAIjf2mzqiOa9UX
	 xU0QAakO1IegktmVFgZkKyPryGNNA1EN+IDVufUgQGLqC5fuupdLbqjvG3MK2FLFkH
	 5QhKHgLQZBQnN/eKBUd1XPT7lzMVyUa/9oL/MNImb5HI1tg+lAInXp6kFNXWTZz+/U
	 vg9h2F5i6/SohxBr8UH68LMB8UGwwmE0ixcOe9UxmSuHzt62kyjyUCd1ZWNcDYcAW4
	 Z2FfCd0JspOUQ==
Date: Mon, 27 Jan 2025 13:12:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
	devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: sun4i-a10-codec: add
 hp-det-gpios
Message-ID: <173800513205.698322.900237271228809143.robh@kernel.org>
References: <20250125070458.13822-1-ryan@testtoast.com>
 <20250125070458.13822-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125070458.13822-2-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_111214_721654_9031E89F 
X-CRM114-Status: GOOD (  13.04  )
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


On Sat, 25 Jan 2025 20:00:11 +1300, Ryan Walklin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Devices integrating Allwinner SoCs may use line-out or headphone jacks
> with jack detection circuits attached to a GPIO. For example, a number
> of Anbernic devices featuring the H700 SoC use this mechanism to switch
> between a headphone jack and an internal speaker.
> 
> Add extra routing endpoints to support this.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> --
> Changelog v1..v2:
> - Remove vendor prefix from hp-det-gpios
> - Amend commit message
> ---
>  .../bindings/sound/allwinner,sun4i-a10-codec.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


