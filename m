Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5040C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oIqfV5KvbDI3IxsRZQ0qEeErlbPv5b2bokyql58ZQM=; b=2aCpeyRVp+pULe3SDBrHmosm1V
	9nC+0kwML1JLkOltGpTcMvLiI+MSz6yKJTOsH6/CtekoyD8Oj0c91LtLKIEziLzLW4iCFckAiJRFV
	k8phWHQoeIvn5MV/fLQCCkd4eGJ3CSQodwsSF82/01E8MrBKddZuSPwcGmIoKxIxPBsqQ9XwvTGOy
	HCSAA5W7OBNczBLaBv+5ilTcCLSlOIj44mPlu7v7S9YWI5zQFwGtZiudQGza3EsSqxbCdEd4NkCWz
	wn2EJBqkvNEaIUYjqvi+ELHZVQjgwVua6a/OjULQuisQHnCIdG4XpVTweCkrddJgOROMdpubRuzhZ
	P0W07n+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5U7g-000000019WI-1EuV;
	Sat, 12 Sep 2026 20:14:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5U7D-0000000199M-0dQk;
	Sat, 12 Sep 2026 20:14:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1AD643A8E;
	Sat, 12 Sep 2026 20:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051D81F000FF;
	Sat, 12 Sep 2026 20:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789244062;
	bh=4oIqfV5KvbDI3IxsRZQ0qEeErlbPv5b2bokyql58ZQM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MrX7l1OAJDEXaSi+yO3atB0AhnXcGQZB91SZ1OMJlf9nuUPg0LaizMDHxmtO9ESd1
	 ENnnjy7v09zGy+l1UrIkWhHbi5bZ4sdPXZKrrIJ6deBKpx9XdQ75M3gXqVvoLMUu7Y
	 oJHdkbKGBRtEvT/4WlHwPu+7b/xrjZ0xVW+nNrOk8Ug6jGehXVbmFf7iTq+vuDObOW
	 ufeiU7Tkiw+awST3BRX1jJz59feM+4DiHNTNw4Un7z7Bxq2gG4JVi4AxlLyVxHpK6s
	 HfcwklUKFmx/TVXU/FrKO086thP5Z5n2TmiO4ar8U77taiN7osBwfidpi8vOy97iTW
	 +8084FdwzkMOQ==
Date: Sat, 12 Sep 2026 13:14:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>, David
 Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v4 00/10] net: pcs: add basic support for
 RK3568 XPCS
Message-ID: <20260912131421.2960a12d@kernel.org>
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon,  7 Sep 2026 23:37:03 +0800 Coia Prant wrote:
> This series adds proper SGMII support for the Rockchip RK3568 SoC
> using the integrated Synopsys DesignWare XPCS, along with necessary
> fixes and refactoring in the stmmac core and XPCS driver.

Sending the AI review FYI, please look thru it and judge if any of the
comments are worth respinning for. We're waiting for a review on the
device tree bindings, anyway.

