Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C3AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQPZApuU3IeYaGKoNYq8nXsQ4YjyiUrdVnp+A2aEZ7c=; b=mKu29xxr1GuHvX
	fL98aN8dzSIG7p4nliLau0sgvQSJm08nUx8hrJGIuTnB38odeKUJRzlJ1IQr3QY0RmyB29eNGUWVS
	0IM8Eq+Sa+IEXXlIhpk4nZaj+DXYCAoY7L37f9ELW/Bm4v8EvsNPbGFoBa4LOZQsJ5mrDPHdNELdJ
	t0tlx36tqndSpNWX/fAhst5McPe83cdJLxtJaRyDlR166ADCRkLuAYIecMEuR293WiICnVL1/xjHq
	A24nRw/qLsviD1UiQrqOWVirgMugVL5rfojKzJYyTWyKN9AnaqNvFADXsZdOrZtFlIC4/73rtvSfC
	mX+bcOcZvSvfm9ijDQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5yN-00000003tiS-1ffD;
	Mon, 16 Jun 2025 09:17:47 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5DJ-00000003nHO-35zw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 08:29:11 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLNQQ2ztvz6L5Gh;
	Mon, 16 Jun 2025 16:26:54 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 25CD01404A9;
	Mon, 16 Jun 2025 16:29:01 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 16 Jun
 2025 10:29:00 +0200
Date: Mon, 16 Jun 2025 09:29:00 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Jie Zhan <zhanjie9@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH v4 1/2] PM / devfreq: Allow devfreq driver to add custom
 sysfs ABIs
Message-ID: <20250616092822.00002233@huawei.com>
In-Reply-To: <20250530081722.280776-2-zhanjie9@hisilicon.com>
References: <20250530081722.280776-1-zhanjie9@hisilicon.com>
	<20250530081722.280776-2-zhanjie9@hisilicon.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_012909_921309_42EFEC9B 
X-CRM114-Status: UNSURE (   5.61  )
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
Cc: yubowen8@huawei.com, linux-pm@vger.kernel.org, zhenglifeng1@huawei.com, liwei728@huawei.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, myungjoo.ham@samsung.com, lihuisong@huawei.com, prime.zeng@hisilicon.com, jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 30 May 2025 16:17:21 +0800
Jie Zhan <zhanjie9@hisilicon.com> wrote:

> Extend the devfreq_dev_profile to allow drivers optionally create
> device-specific sysfs ABIs together with other common devfreq ABIs under
> the devfreq device path.
> 
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
Seems like a good addition to me.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

