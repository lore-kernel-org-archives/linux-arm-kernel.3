Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FE1C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOjDOFEhlsTImGLsJI/rUZqmI0roj2CuUej1rjQIuPs=; b=swxLY0a9m5382e
	f/V7E+xxc8a3R3BnNgkNqmbrB2kE4wi/BkOwWb1WWxso6pPpbWhBtVeQo4hVkmlSvYTMk3UaGaO/Y
	U5DCZK6c0KOQ/ioUUgZa9Xqz7XP2sOhNLJqrpN8h475x6TYJpwSn0y6A+1npQM22u6cjIsiiDtcXT
	WfPidJXj2unLar3FQiUAqXsplQeTYLMS/t79uY1ITZapVprBmrI/QHVOXZP03LebBauWoxYyFYXft
	D+qE1zX/ABkqjI6yCZcg76pvek3eDhJbWz6/sQxo8bV7h2P3LUKVMj4VV952u/qjLqaFlrqTJzPKO
	e6xFvbmxIxvknzz+4aFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqGf-00000003wMQ-0bGo;
	Tue, 11 Feb 2025 13:25:37 +0000
Received: from iris.vrvis.at ([92.60.8.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpwD-00000003sX2-0bZD;
	Tue, 11 Feb 2025 13:04:30 +0000
Received: from whiskey.org.vrvis.lan ([10.42.2.171])
	by iris.vrvis.at with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(ESMPT Server)
	(envelope-from <valentin@vrvis.at>)
	id 1thpvc-0004QS-0h;
	Tue, 11 Feb 2025 14:03:57 +0100
Message-ID: <f64ee4ee-7e56-4423-813e-b87e023e893d@vrvis.at>
Date: Tue, 11 Feb 2025 14:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
To: Vinod Koul <vkoul@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
 <173831716590.670164.5196739962949646746.b4-ty@kernel.org>
Content-Language: en-US, de-AT-frami
From: Valentin Kleibel <valentin@vrvis.at>
In-Reply-To: <173831716590.670164.5196739962949646746.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_050429_189751_A0768B85 
X-CRM114-Status: UNSURE (   9.29  )
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

>> Chukun Pan (1):
>>    phy: rockchip: naneng-combphy: compatible reset with old DT
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] phy: rockchip: naneng-combphy: compatible reset with old DT
>        commit: bff68d44135ce6714107e2f72069a79476c8073d

Thanks for your work!
We found your patch after NVMes stopped working on a rock 3A with newer 
kernels and successfully applied it to kernel 6.1.128 (currently in debian).

As the commit breaking NVMe functionality on rk3568 platforms 
(fd3ac6e80497 "phy: rockchip: naneng-combphy: fix phy reset") was 
already backported to 6.1.y, 6.6.y, 6.12.y it would be great to have 
this fix in these releases as well.

Best regards,
Valentin

