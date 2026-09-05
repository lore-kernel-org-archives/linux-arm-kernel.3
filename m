Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253D0C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 11:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhTjWhvBY3J0Dewu042nmXY6DyK5b1tOm9obfDRLZyk=; b=Vwb/2FRvkxTUWxqtaldsPa7O/5
	GdfNRReRYF9tCadVn2Udp9tT4YkYylsnHri0bfF9NBrB9ciI6OrLNWW58QrpWwcNN2TsOm9qFVKV9
	/WXmeZFLCipqm9fEZQBFiLb5pPV4qZkzLjEEPfWuqANu5Wgim1z8XUNQFn/T35u9wmwFRWFvZ7CmJ
	8LFfa1ytTNaxuWwoT/R3k8me/TLr1oj9mBp4KJycPyLjQ3f0nFqXhj8gKunPt8Q8psJwuTQf+187q
	59Okzf8poxuMyQytMqz+uRXIGAro7KdvWvyGUkEUNzU8sG6c+f03yOmQKClPTiT4EpT4SM5/PrB8/
	WUEwHbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oSz-000000040nt-1FIk;
	Sat, 05 Sep 2026 11:21:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oSw-000000040nZ-16G5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 11:21:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 867C84E41535;
	Sat,  5 Sep 2026 11:21:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39BB960233;
	Sat,  5 Sep 2026 11:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42EA711C783E9;
	Sat,  5 Sep 2026 13:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788607296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FhTjWhvBY3J0Dewu042nmXY6DyK5b1tOm9obfDRLZyk=;
	b=p3MATlEg/66zDHa22f3ifAmjMncnfKTK4roVoSVT9HLjcgdhTou+zP1J08g7iQ3L4i3NHF
	/O1JGSToy6cOG9JGgS+Ohuhg3ZljinKmyCCUByLouMA275qUVx++CEThKYszMSpLLK05Tw
	xqxstb8mElV5xCn/6u0RV5Yy9efLrsJPeKQyqbLt6M62VemFqH5z6n9RiP3QPub/QfLn8F
	pTN0R0csEWQhLL/6ydW1daxfalqBrdJLJQ6XKqMFb+rzGa+qIx24RbMwJuFwbXRpGCA0LB
	Jxu8T0r6LifhGm/dnw23SQWHe+MceGjV2l1n5SuZdumY665EyC8r1sFec1ejmA==
Message-ID: <a48ec7e7-a2cc-4bb9-96de-69ebae5ba184@bootlin.com>
Date: Sat, 5 Sep 2026 13:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 7/9] net: stmmac: qcom-ethqos: set initial RGMII
 link clock to lowest speed
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
 <20260904-shikra_ethernet-v1-7-a50765996035@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260904-shikra_ethernet-v1-7-a50765996035@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_042146_448498_B59E120C 
X-CRM114-Status: UNSURE (   5.59  )
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

Hi,

On 9/3/26 20:43, Mohd Ayaan Anwar wrote:
> On probe the RGMII link clock is initialised at SPEED_1000, which
> translates to a 250 MHz source clock even when no PHY link is present,
> drawing unnecessary power.
> 
> Initialise at SPEED_10 instead; fix_mac_speed updates the rate once
> a link is established.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


