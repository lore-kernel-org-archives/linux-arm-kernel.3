Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF37E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXQeoMhZeyAVRc/yo0AVyndUKaWcFd3lDC4Iv63ykhs=; b=jIlo6F0lQfyvIXTuxaoBxqtxU3
	arWDAS2UvdcYltypqDAi37DQj9KNmru6b5ANvveeQouBdYOvpaXrYyUv2G4NZgR5sQkgU9h7MOj8i
	vqo7CRyMAPC5KGBKboZRua1Ukj+39u3msW1iTuTcK+NFf0C23eSp1NUeiqB3OubbztrQGnbPWwVgd
	cvQQfyg71+g4fpwrfyTYlaz8nbZFWheUzzwc9DUiAxOk347ygDGnEbtBxfiJSpzr9dSmBai7S5HxD
	3yPUWTN42UB3zqjdPmctn+gxYReRLTOqSKhUKWMUfakdbWMPRbK14whzUWQ9MjDWKr8lZHOD+tUe1
	LwP5Fx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5lo-0000000HNcZ-1dnw;
	Fri, 27 Dec 2024 08:32:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5kc-0000000HNOD-3ocS;
	Fri, 27 Dec 2024 08:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13771A4125C;
	Fri, 27 Dec 2024 08:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD139C4CED0;
	Fri, 27 Dec 2024 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735288277;
	bh=1J+WJdIlpcxBIfm9WuI/6Vi2vpa1pvsJuHCfl4h/3ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzxifEoXPYoAubCx4KW/WpzJUbauZZd54NrBpkh0sBV4fzJn0gFzV8wQXgi2cH954
	 Jm3zxXAgT1DKNORuU/xmYsrfJqR/sxWCgtDflOZiQIYsE10AsdJY4gviX0AFqYkKqJ
	 +M8OgphyWpuf/1Ho5WwK/N7lRa0aKZRxikZJTLyiTTZvy/NZzRQ76i/wNZ1RvXjq87
	 7wSPOnD+nKKMATSXGLv4AIscvi4RMbc/rSjrLpD4cJxdeMcUaPGxCCzJwGt5TGFT5Q
	 RE+eFYWw9MfDvdSCuUqWbWx+c9EhHl1mmwkIxfQqw5qeukvXJT96tPULgXvxi/KCtw
	 5EgOIUQreDIlg==
Date: Fri, 27 Dec 2024 09:31:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: power: add power binding header for
 RK3562 SoC
Message-ID: <f32nzf4x4mhmiyvby7b5g5ypre2457a7ziewglhjqfndfxhhnz@qxfagfw3bcsx>
References: <20241224093920.3816071-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224093920.3816071-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_003119_018040_58264538 
X-CRM114-Status: GOOD (  15.08  )
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

On Tue, Dec 24, 2024 at 05:39:19PM +0800, Kever Yang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> According to a description from TRM, add all the power domains.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2:
> - rename to rockchip,rk3562-power.h
> - update the subject
> - use dual license
> 
>  .../dt-bindings/power/rockchip,rk3562-power.h | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)


No, where is the actual binding?

Your split of patches is not bisectable, illogical and not helping.
Bindings always go with the drivers.

>  create mode 100644 include/dt-bindings/power/rockchip,rk3562-power.h
> 
> diff --git a/include/dt-bindings/power/rockchip,rk3562-power.h b/include/dt-bindings/power/rockchip,rk3562-power.h
> new file mode 100644
> index 000000000000..d728c9ee908d
> --- /dev/null
> +++ b/include/dt-bindings/power/rockchip,rk3562-power.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */

And why not license requested by checkpatch?

Best regards,
Krzysztof


