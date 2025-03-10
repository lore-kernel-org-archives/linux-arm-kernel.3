Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF762C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqfUyv0msFM4sA7nETrYm7WqAsPW914h6jq1wGoMGJs=; b=WScfZKYbVQQ98yfcfbiSDbbA2W
	89JEMaI4in7YrCGgQUfr4E3aRlV+4AREkeUq2U6nzrtUq3YORbp3est2aXuOcD/j8X0ozee/pIqKY
	/cKnL9Li1ubeO+OnQUNX1wS4LuCknd3Nh+nPwRT6OVWoUFueIRwr4L7Dlhni+H3o7oOZSFmW8BF0+
	tOEFphXfWzNlIpM+iyx6re6ePKlbjdVZ1PP4heUzdN7XTkS2JJqBwcUV+xhX+UNP5nBqxAQJL+jyN
	vMNqKzvMTS07Neipxg18KwkN9V2evosXYgBK/v4WQOu0VZqOhU727dJQY21jxFCsG3wjEuHAu83r+
	3W5zZ/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tra0t-00000002CMB-077c;
	Mon, 10 Mar 2025 10:05:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZss-00000002AcJ-2Ba2;
	Mon, 10 Mar 2025 09:57:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30D615C5BE8;
	Mon, 10 Mar 2025 09:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129E6C4CEE5;
	Mon, 10 Mar 2025 09:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741600637;
	bh=XM35sEGq9rPsxDvrLDp2hhBJWfUNe2voFFy34EJh/FY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owiKa/n9XL5IGC0X+K77PmWU9Iy3QL46VKZQNfTyuKKjVkYTh4V67hkN0CGG/ufq3
	 l+hj4A9QQ1oiivy3+ugmqsoZOsDZJXtSS98fzgW/7z5pbPrSzaBesxfLa6K7AtQLrr
	 Zi6BqymX4ILWFQt5MQKhT/NDAfWCwlqspOxOAtRNle8SyLRZcyHI0ptjQcJJkJanji
	 opsHtDAc4APfc5zMnshG46lasStgvLFz61O/jJkBR9UkOHCndcPajaJ4HWMNcNWepH
	 r44S8UqmpxOVY6cEKaw2FnsiDfE6kzoJJmHvoMdougllrjrpmxKDSMKN0NDPHH36Oj
	 d+Z33dXyG+9Rg==
Date: Mon, 10 Mar 2025 10:57:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Wu <david.wu@rock-chips.com>, netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: rockchip-dwmac: Require
 rockchip,grf and rockchip,php-grf
Message-ID: <20250310-striped-perfect-sambar-bdcb3e@krzk-bin>
References: <20250308213720.2517944-1-jonas@kwiboo.se>
 <20250308213720.2517944-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308213720.2517944-2-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_025718_602266_7657FF0E 
X-CRM114-Status: GOOD (  14.76  )
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

On Sat, Mar 08, 2025 at 09:37:13PM +0000, Jonas Karlman wrote:
> All Rockchip GMAC variants typically write to GRF regs to control e.g.
> interface mode, speed and MAC rx/tx delay. Newer SoCs such as RK3562,
> RK3576 and RK3588 use a mix of GRF and peripheral GRF regs.
> 
> Prior to the commit b331b8ef86f0 ("dt-bindings: net: convert
> rockchip-dwmac to json-schema") the property rockchip,grf was listed
> under "Required properties". During the conversion this was lost and
> rockchip,grf has since then incorrectly been treated as optional and
> not as required.
> 
> Similarly, when rockchip,php-grf was added to the schema in the
> commit a2b77831427c ("dt-bindings: net: rockchip-dwmac: add rk3588 gmac
> compatible") it also incorrectly has been treated as optional for all
> GMAC variants, when it should have been required for RK3588, and later
> also for RK3576.
> 
> Update this binding to require rockchip,grf and rockchip,php-grf to
> properly reflect that GRF (and peripheral GRF for RK3576/RK3588) is
> required to control part of GMAC.
> 
> This should not introduce any breakage as all Rockchip GMAC nodes have
> been added together with a rockchip,grf phandle (and rockchip,php-grf
> where required) in their initial commit.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


