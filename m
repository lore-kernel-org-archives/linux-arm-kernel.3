Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7475C9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQenP0CxwuCsGNI/69y3lS7YAYOZsk9pBINwUTYU7PI=; b=Ho4YB3ZKRx7EcNH4oDH0ZqCfGl
	fZfK/ZEPFs13UDgchklevNwEgrTZbSgOp5RfbpM1Nus6o7OyK9BuoVg14Wwi/OmoPr1Qg/7BbCpwZ
	xyCFMWXUsuSWUkODEyFvdFYA6YUxCD4TB10lHc1jH4zw6YfSh5Q/+R1OUJMdoge3gccPoZZLi7eqy
	/Jzu//8rbx8ahcPiis3FL8YwOrtQCCEXUiAV/MNXolxwBgCy7/MnyDxEi9p2Q+Dqvn2to/TNQp54B
	/UoIBRv1vad5BtjO3Q59shIydniJVxzKJqsutSNnCbsuo7wntntJGgR2bjEDHajJSHfgE7MjmiB3n
	YeKHeBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJ6Y-00000005YQx-3ZiM;
	Mon, 12 Jan 2026 14:41:14 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJ6W-00000005YPc-0oue
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:41:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sQenP0CxwuCsGNI/69y3lS7YAYOZsk9pBINwUTYU7PI=;
	b=MMHPZ50SetuI/WO9k9oFpO5oheOMvKWMguXiiaA445jiamZTZBYbwwj0W8KG69uAd4f8B/Zot
	Q0cH3R3s/oDcM5NrOjeIY9pFvHmEFPFR0DCnzlyPXppHLofDpTgUMunPHS5HWfX+29H1MO0PTlz
	gUMPbBCv4ueCI75t1ZawqrM=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dqZkQ1hlrz1P6nM;
	Mon, 12 Jan 2026 22:38:38 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqZmy5YBjzJ46BH;
	Mon, 12 Jan 2026 22:40:50 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 4950A40563;
	Mon, 12 Jan 2026 22:41:02 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 14:41:01 +0000
Date: Mon, 12 Jan 2026 14:41:00 +0000
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
Subject: Re: [PATCH v3 07/36] KVM: arm64: gic-v5: Add ARM_VGIC_V5 device to
 KVM headers
Message-ID: <20260112144100.00007cda@huawei.com>
In-Reply-To: <20260109170400.1585048-8-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-8-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_064112_508786_3C811263 
X-CRM114-Status: UNSURE (   7.38  )
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

On Fri, 9 Jan 2026 17:04:41 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> This is the base GICv5 device which is to be used with the
> KVM_CREATE_DEVICE ioctl to create a GICv5-based vgic.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Mostly so I don't bother reading it in a potential v4 and because it's
obviously fine.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

