Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9130C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 18:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqx6OvTXdU0f9pU2nJLaZn6w5mtSJ6LW0/pV++t6mtY=; b=w37BThtr6qsriVV9C8Lq2bSPPd
	eyb3nS1dDfAe5QdWc2iMTPWbk/AXGIhpR7SJjML5R6k8R0g+SK0wBqSQWs5Z2fjPxlzcjfbuCBD8B
	8OPcRjerbApVahAFl3KGWxc043sOylFfZGULY9SySXfaA5p+tx7avn3Kpcym4L+exJVhG811Ri0qa
	zjbHVe3gMhbi3Bv7shroLBFBiGSUI875sRnb4np36/H4fYbDyCzmabvtrNCrmU2qZsoiWmvNWIrz5
	IHtTybBDLWusi8N5tKQy4ODq4ezpDR/rfRdOZTw830NDkPECsN/TAcqBAR0nmJ4DUOGIKsV/fSVGx
	HswKOnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqbFu-0000000FxFQ-26Tm;
	Sun, 02 Aug 2026 18:49:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqbFs-0000000FxEQ-21lI;
	Sun, 02 Aug 2026 18:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pqx6OvTXdU0f9pU2nJLaZn6w5mtSJ6LW0/pV++t6mtY=; b=qXH0XFF7kupYbVbAa44dTR3mGv
	s6jajJK0z15KaxMFV/lnA3KbmpaV3a7B2SlLb5Vn0WfTvswg1lRZv3hWHMEe5z1hGoCTqiJZ6Ozhb
	1KXW3EgImXjKExczg00gwXTNxXXBfUqxNifQWjAv3j5NzymSXBFtCNp7rgrqX9ACEmR4QTzm/KYCa
	1ZySyqmMwn3BwWwJ8LGOCbK2yEuen0JVTWV681emNDdDpNjzTzyEe1jaKy2wWqRnK3PBgDW56W+yB
	tL99UcUQn5rdvgWV8H/DQjU7yPqPVbiz2kcywz9DsZzoRsEbBKgrYTOZ69KhdSnGnS9N5gNNtGmSA
	K34xLpvw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: Correct white-space style
Date: Sun,  2 Aug 2026 20:49:38 +0200
Message-ID: <178569657651.1403346.13086086653286299708.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801210247.383632-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210247.383632-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_114948_602126_65D3BA60 
X-CRM114-Status: UNSURE (   7.93  )
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


On Sat, 01 Aug 2026 23:02:48 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
> 
> 

Applied, thanks!

[1/2] ARM: dts: rockchip: Correct white-space style
      commit: 1a17f391c139567e2fac6894c6b43f5978e915c8
[2/2] arm64: dts: rockchip: Correct white-space style
      commit: 49ee9e9a51b85113b741bf97d9131d0416316f04

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

