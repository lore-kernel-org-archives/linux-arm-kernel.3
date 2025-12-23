Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B4CE6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRBAcDwm05WUrfxgEcsK8+z8TK79dEQ1pkIeBQHgn7A=; b=R/gyZNobIlLLq6niyyueBeDobC
	7jnSTSnewHFziZEo1LHPYXbJa7rtJ/OozcHiV9TRdKpW+K4YeL2/X0unHfxjv95AStsFPbEVndg75
	MNk4DTXg12lnuGBYBxicsM8aMWlhj5KnZpoa3Oz2hQM9lHPWfVdTp4N2jGqocvzQYjyidXm+ypW6N
	qhg+/bI++nG9yDyJ2OeulanpYAoAE/IbiBDLoUFujVoGCTr5UKS9XHZsdrsnzNSDvqwGJ/eU6gS0y
	9KL0osXp4nJ9aCjrYh105H5dAGOkKbDoE6O9/L92CJ6LCDCIiCBNFaHBcoDEUBZ34pskNYlv0USDi
	txe8WVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6S0-0000000FrSJ-3KOL;
	Tue, 23 Dec 2025 17:45:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6Rw-0000000FrPD-2UdV;
	Tue, 23 Dec 2025 17:45:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 298CB418D6;
	Tue, 23 Dec 2025 17:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E3DC116D0;
	Tue, 23 Dec 2025 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511932;
	bh=QnfHw7gktqMQcpaZBa6HDrlNZ+/FNsdSEG4q/pIYhEA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IsFkJxNq2dX725QpsMGli+i9KLKcfIijkuFrRUdWr79UNEQpmK9ldEIxz8RxuGk+f
	 513pQs6migSmGO6EOWbqvSl9/2Apz6/WtgJWcoU1+uok2ByHrIqkzzZEzkcu/Q+LL8
	 pfpwlEOpSvnqNdyQO5nRPyuECF//0+q5CK1KgUNbiqvtpDlyDVS8MOR4SYB7IpMGBD
	 rgYAzQ29rQklDwTJRzVvwER+9cePLRES3AILfIb0IqUZoTyDvaMtYEX1aodp47KlKM
	 DbtspiiKG4XwjrlezB9KeRPj/1qddmqOgRH+LosSc2xay2Pq8xfCJ7JMaI8t4iePTi
	 Q/bpKEp6ivyOA==
From: Vinod Koul <vkoul@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250910122000.951100-1-amadeus@jmu.edu.cn>
References: <20250910122000.951100-1-amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/1] phy: rockchip: naneng-combphy: use existing DT
 property check for rk3528
Message-Id: <176651192952.759340.11206011301842508188.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:15:29 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_094532_691476_5EB158CB 
X-CRM114-Status: UNSURE (   5.86  )
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


On Wed, 10 Sep 2025 20:20:00 +0800, Chukun Pan wrote:
> The naneng-combphy driver already has DT property checks for
> "rockchip,enable-ssc" and "rockchip,ext-refclk", use it for
> the rk3528_combphy_cfg. Also aligned the indentation of the
> rk3528_combphy_grfcfgs parameters (using tabs).
> 
> 

Applied, thanks!

[1/1] phy: rockchip: naneng-combphy: use existing DT property check for rk3528
      commit: 23c3373af05a3ec268acb02ffe962ac6882c673a

Best regards,
-- 
~Vinod



