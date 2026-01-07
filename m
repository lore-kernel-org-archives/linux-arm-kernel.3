Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A212CFD65A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVIF9KkKAs454Pa94kXvNM5oHQzz5+f7BpY059S8z5c=; b=ZHav6vpG7wduNYeDtwwmtDyw1u
	84f0E/z6jDFJ/XPRdq7vDAD+6Tv8if+4e7ZwrHeUx0tYRdjozkXC6ILem5p3wxPeiJeJCPzhMDTxu
	H4cItpA4EQVwITeXbbNt2O+q+0dGoseYGjE6pDc4cn+lZAaRXnYkDNRM3LJQrUg9iYpnXjINxtQHB
	HrjqmwbJJVD5HFEBBbfJcTEweVmduKVM9b/nXraLfyCo02xD51rk7paTyjp4crvKqvRt0Yguo3kB5
	za3GRke5Im+yytZkqGuXGjf7/QzGlLQtAS7wjkfCP41tR2VGqMyGdJrC/x6ELtlA3/VKZ8u4NHNfo
	prN1y0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWNP-0000000FHZl-0w65;
	Wed, 07 Jan 2026 16:27:15 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWNL-0000000FHZD-3Brg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:27:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GVIF9KkKAs454Pa94kXvNM5oHQzz5+f7BpY059S8z5c=;
	b=c4SVkfPhvMHNd3Z74MTkXrPGsipJ+svqFYYwJ1hUc4S9+K9mb5LiGZk9B+gWdOHmNJzyoXl0j
	ysPXa+dEKSkl7xNmYD0WhWHegf8Vk+p7LxnOpU40XEMVrixEKEnnzkXCS/K0M81w5bSgdhW3v4N
	3kGZEmxaNoKCCFN5enoJjHg=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dmYK372J2z1P7L1;
	Thu,  8 Jan 2026 00:24:39 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmYMh52FGzHnGgg;
	Thu,  8 Jan 2026 00:26:56 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 2993440565;
	Thu,  8 Jan 2026 00:27:03 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 16:27:02 +0000
Date: Wed, 7 Jan 2026 16:27:00 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v2 34/36] Documentation: KVM: Introduce documentation
 for VGICv5
Message-ID: <20260107162700.00006411@huawei.com>
In-Reply-To: <20251219155222.1383109-35-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-35-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082712_008020_A611C5F1 
X-CRM114-Status: UNSURE (   6.13  )
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

On Fri, 19 Dec 2025 15:52:47 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Now that it is possible to create a VGICv5 device, provide initial
> documentation for it. At this stage, there is little to document.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Seems fine to me
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

