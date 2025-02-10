Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D014C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrDBOPbcZ+135BBVenarKoAQjyTOjCUsDzFGx/AdVUo=; b=XHL4vvEF7l4msg7nYbhG+kAW26
	PR+LiWrE0GcEyfkZa3snjbE+fH6fapDteQZEd3aqf+3exXyPOlcPhZFtjk3AHeyLW55Xkl0z7EKdX
	koaeTAInexPuny4MWm8XfnTKTlzCEzbUr6v2uqC06jydD8VBQzdpZr/8io5xQgVh1tdzIP4Vf7Hep
	H9+wJ5t0ypeOGUJJm1pZcu1PCXlBeBBWDt7+x3inWmvEyIHD7UBGdBV2XE3BiJK4sJ+CwRJF4tnkJ
	+mfy5wGDO9wtKgUAcZ5dOeX5/70roKVFij7LIcrW8AS7WlFK5aMjnfuF4loi80jwuZQirOfOPmdAi
	QG2VS3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRts-0000000HCke-0oer;
	Mon, 10 Feb 2025 11:24:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRYh-0000000H85T-3vie;
	Mon, 10 Feb 2025 11:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NrDBOPbcZ+135BBVenarKoAQjyTOjCUsDzFGx/AdVUo=; b=Mw3VgIuELoF2iFJh7R0UwDQ8/v
	Zwa1Qs/zIjMlPjacRyseLQaAc5ToAuDS2We5wQwb8gkTXoFvpLbtj4QhqRgwd7OxMYMSKdYVfouea
	49wyiBtSXfK/8bBkFCuSA5ltn66s5JnMLTlIcu9TJxMlJRnm6Kphn2Qslc3sjWp/KEgV91BhgRQFj
	7QfuhZ/1XhZqCFhx1K6P7SGnkTxO/7as+CHBcZI+F2EAXn/O6FRTuFx4eLMU7TJu30B8/TzsS5ghv
	6wZlSDE3f17eR6p8PiTvhYmK/sY3nYFMy3NxGJJWCPqkFBddM23FhAyWP2QzUgld04hVJz6KZULo5
	I4cSKvig==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thRYd-00016K-4U; Mon, 10 Feb 2025 12:02:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Val Packett <val@packett.cool>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: rk3188-common: add PCLK_CIF0/PCLK_CIF1
Date: Mon, 10 Feb 2025 12:02:20 +0100
Message-ID: <173918533250.1059791.14073641145045801256.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241205182954.5346-1-val@packett.cool>
References: <20241205182954.5346-1-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_030235_971134_B1823F95 
X-CRM114-Status: UNSURE (   9.18  )
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


On Thu, 05 Dec 2024 15:29:35 -0300, Val Packett wrote:
> Add missing clock IDs for the CIF (Camera InterFace) blocks
> on the RK3188/RK3066.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: rk3188-common: add PCLK_CIF0/PCLK_CIF1
      commit: 7c9804031626c51d4ddbc8c6e82bbd8496cf6e56
[2/2] clk: rockchip: use PCLK_CIF0/1 clock IDs on RK3066
      commit: 4a918309d53f800dd07b94c4a4b1fcdb6289eca5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

