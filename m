Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D7EEFCD7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrtPvBz5BO5OVJK1N3GqiMDHuB3EZrHaMP8uGfCduio=; b=FIiKn/t0GglfvYiA4fvUrzQ4k1
	R0cdws6xQa3S2r3cmEBiMYit7EGZwtQJpdaiNPNPrtbwY1Ej5FkG4l/yRl+sC8QeQARtHlns3wLfj
	Tynf2YY9Z7Y20HpJrHco8P8ZMjDr8NhMPJ9xNAZ7fTPmSR1nbmNBvPG65lrQSU4tRFFFGJR3ULG/B
	sYs8OqZIO/veOQKVMwrktnHC34d9GH5rA4XFSo64TtX7oDZkQtFEeKd9NXCiF2D2iI7K56ueQNLs5
	xIJP5Uc8wN7Trr/ckEQ2RLLY+i/+/ccb+yq0OJB1DXd9gcL23k47ZipsEoj77woQXSBOe6oOIkltA
	cCv89XCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXsY-000000075yM-283I;
	Mon, 09 Mar 2026 10:30:26 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXsV-000000075xQ-3WwN;
	Mon, 09 Mar 2026 10:30:25 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fTtYy5PyzzHnHKh;
	Mon,  9 Mar 2026 18:30:14 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D32140086;
	Mon,  9 Mar 2026 18:30:18 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Mar
 2026 10:30:16 +0000
Date: Mon, 9 Mar 2026 10:30:15 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Chengwen Feng <fengchengwen@huawei.com>
CC: <linux-pci@vger.kernel.org>, <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sunil V L
	<sunilvl@ventanamicro.com>, Mark Rutland <mark.rutland@arm.com>,
	<linux-acpi@vger.kernel.org>, <wei.huang2@amd.com>,
	<Eric.VanTassell@amd.com>, <wangzhou1@hisilicon.com>,
	<wanghuiqiang@huawei.com>, <liuyonglong@huawei.com>,
	<stable@vger.kernel.org>, <jeremy.linton@arm.com>,
	<sunilvl@oss.qualcomm.com>, <chenhuacai@loongson.cn>,
	<wangliupu@loongson.cn>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <linux-perf-users@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] ACPI: Rename get_acpi_id_for_cpu() to
 acpi_get_cpu_acpi_id() on non-x86
Message-ID: <20260309103015.000070c3@huawei.com>
In-Reply-To: <20260309041659.18815-2-fengchengwen@huawei.com>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
	<20260309041659.18815-1-fengchengwen@huawei.com>
	<20260309041659.18815-2-fengchengwen@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_033024_035885_D44E360D 
X-CRM114-Status: UNSURE (   7.33  )
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

On Mon, 9 Mar 2026 12:16:57 +0800
Chengwen Feng <fengchengwen@huawei.com> wrote:

> To unify the CPU ACPI ID retrieval interface across architectures,
> rename the existing get_acpi_id_for_cpu() function to
> acpi_get_cpu_acpi_id() on arm64/riscv/loongarch platforms.
> 
> This is a pure rename with no functional change, preparing for a
> consistent ACPI Processor UID retrieval interface across all ACPI-enabled
> platforms.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

