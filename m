Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CBBCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwEcqCsMNqiy9aw7P2GCFi8bIgCOAmNLISzR01/vhJk=; b=dhfmOJO0/6GvBjbKoR9SOC0CZ4
	4/qMRJE5wMmYRx9ak6WOKhKKnjnhNU99EfZDi5v4KtVBvjh+VHLI3dx/qhomaegzOzxb3UmaSQvfn
	AxhBMwL+Vjn2VpUcHjCMq3NXsGDvgI40/5iuMBvNgmbTLw7FJ2JUtouJ83Rw2+sEjIvnBj6Q6ugou
	V9tll06Q+4b75vEAjpTw+uHpa32k3UDHocdCSAH5J/BTfm5a8eo8Oagx/+q2vCaCxZ2eJmk4JiZZH
	DB7djjme4XgcY+nWJzNPqpLIcx2JsDjBFzsuziK7LV9voJqUnUReygKz4eo7zTg7S1JZTDm5FSOUy
	tcUmqs9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwJb-00000002q43-3ZAs;
	Fri, 15 Aug 2025 15:25:59 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsjR-00000002LiL-1Wxa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:36:26 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4c3Kkz03THz6M4tN;
	Fri, 15 Aug 2025 19:34:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id AAF7714010C;
	Fri, 15 Aug 2025 19:36:19 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 15 Aug
 2025 13:36:18 +0200
Date: Fri, 15 Aug 2025 12:36:17 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Koichi Okuno <fj2767dz@fujitsu.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>, Linu Cherian
	<lcherian@marvell.com>, Robin Murphy <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
	<quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Arnd
 Bergmann" <arnd@arndb.de>, "=?ISO-8859-1?Q?N=EDcolas?= \"F. R. A. Prado\""
	<nfraprado@collabora.com>, Thomas Gleixner <tglx@linutronix.de>, "Peter
 Zijlstra" <peterz@infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Message-ID: <20250815123617.0000716c@huawei.com>
In-Reply-To: <20250815034751.3726963-3-fj2767dz@fujitsu.com>
References: <20250815034751.3726963-1-fj2767dz@fujitsu.com>
	<20250815034751.3726963-3-fj2767dz@fujitsu.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_043625_556816_DDA52E59 
X-CRM114-Status: GOOD (  10.55  )
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

On Fri, 15 Aug 2025 12:47:29 +0900
Koichi Okuno <fj2767dz@fujitsu.com> wrote:

> This adds a new dynamic PMU to the Perf Events framework to program and
> control the Uncore PCI PMUs in Fujitsu chips.
> 
> This driver was created with reference to drivers/perf/qcom_l3_pmu.c.
> 
> This driver exports formatting and event information to sysfs so it can
> be used by the perf user space tools with the syntaxes:
> 
> perf stat -e pci_iod0_pci0/ea-pci/ ls
> perf stat -e pci_iod0_pci0/event=0x80/ ls
> 
> FUJITSU-MONAKA PMU Events Specification v1.1 URL:
> https://github.com/fujitsu/FUJITSU-MONAKA
> 
> Signed-off-by: Koichi Okuno <fj2767dz@fujitsu.com>
Hi,

Just the same question on irq affinity as in previous patch.
So likewise if resolved

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>



