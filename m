Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A31EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 03:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QTGTr741l6XRWzBqb9sbKXm950kSl13DKxY8KjnctU=; b=PAN+fYArIn+Ml9TWoL8FjjEs7Y
	qTJP9yFkdyndWRmhpO+tGTadMjAl5DqrA1J0rR9vIdGwy5f3IQJ94ka+brxNYuVeADvRyTwwnMyAl
	1hFGpythJ3RPgF5ZwmD/64qZFDDXndgIuXz3ojTVs50hEgpjoysC/NDq3KnfRbgGoN5m678AvQ4fZ
	CZR5mYVJNEK/g2kMTuURb7D/k4onmVEIhyItBVIWmGJ3q14GJwewwqm020F3PPzyfayCxwXWyOThW
	YYllwFB8G0QeJBRT1fpcHcML2MXIARoaq0xm8EzCLpt1ntQmRKL2m+i3ItxKWkki1ZP072RNF+lh9
	IQi8EeDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwXPG-00000008xX0-1J4N;
	Wed, 19 Aug 2026 03:56:02 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwXPB-00000008xUa-2a0J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 03:56:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7QTGTr741l6XRWzBqb9sbKXm950kSl13DKxY8KjnctU=;
	b=lIptmsTiAeWTStmNuwWerMhS/P465QRltX9aCA5VyKE7l0fZ5+WiHOZjLGiJOYZe8PaldThDx
	/uFbmQfCfDJAz6GconBqPBVo4BHYIjrqFw56vBLjKtFkr+aVnEMzESrYfwPRT6dhZY9jaLX/D8n
	Z9EQyEraOh85kI0CoCmS9ls=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hPss819kSz1K96b;
	Wed, 19 Aug 2026 11:45:00 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 7049140572;
	Wed, 19 Aug 2026 11:55:41 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 19 Aug 2026 11:55:41 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 19 Aug 2026 11:55:40 +0800
Message-ID: <6A85293C.2010008@hisilicon.com>
Date: Wed, 19 Aug 2026 11:55:40 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Chenghai Huang <huangchenghai2@huawei.com>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>
CC: <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<xuwei5@huawei.com>, <prime.zeng@hisilicon.com>, <liulongfang@huawei.com>,
	<qianweili@huawei.com>, <wangzhou1@hisilicon.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Rob
 Herring" <robh+dt@kernel.org>
Subject: Re: [PATCH] crypto: hisilicon/sec - remove SEC crypto block cipher
 accelerator
References: <20260818083132.1860726-1-huangchenghai2@huawei.com>
In-Reply-To: <20260818083132.1860726-1-huangchenghai2@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_205558_159105_BC56B915 
X-CRM114-Status: GOOD (  13.32  )
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

Hi Chenghai, 

On 2026/8/18 16:31, Chenghai Huang wrote:
> The Hisilicon SEC crypto cipher accelerator has been superseded
> by the newer SEC2 driver (drivers/crypto/hisilicon/sec2/). SEC2
> provides wider algorithm coverage and is the maintained path forward,
> and users have migrated to it.
> 
> The legacy SEC driver has had no active users for some time, and its
> primary maintainer, Jonathan Cameron, has moved on from Huawei and
> is no longer in a position to maintain it. With thanks to Jonathan
> for his contributions to this driver over the years, and with no one
> left to keep it up to date, remove it from the tree.
> 
> This drops the legacy SEC driver together with all of its residual
> configuration, devicetree binding and board description references:
> 
>   - drivers/crypto/hisilicon/sec/
>   - CONFIG_CRYPTO_DEV_HISI_SEC Kconfig option
>   - sec/ entry from drivers/crypto/hisilicon/Makefile
>   - Documentation/devicetree/bindings/crypto/hisilicon,hip06-sec.yaml
>   - hisilicon,hip07-sec device nodes and their supporting mbigen_alg /
>     smmu_alg infrastructure from arch/arm64/boot/dts/hisilicon/hip07.dtsi
> 
> Signed-off-by: Chenghai Huang <huangchenghai2@huawei.com>
> ---
>  .../bindings/crypto/hisilicon,hip06-sec.yaml  |  134 --
>  arch/arm64/boot/dts/hisilicon/hip07.dtsi      |  280 ----

Since no active users, it is fine to me to drop the dts part as well.

Acked-by: Wei Xu <xuwei5@hisilicon.com>

Best Regards,
Wei

