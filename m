Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891EAC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LGYalmhQwZrxOtGKmdSjC1WD7j0rRgBEPhRoGP+KSU=; b=anxD5SjU6gAzt+uy0GDF5+vocU
	iSOxEv17v3CqUa4AOGi0uwphssHwXvEF6/w8psQiCBkXCDkE8LE4Hkv3UzVhVu8XZxT9R0eWbYVXp
	9p/R0wQFhCNFr+udEWvk+fgQVc29GDTIoHTTJLqGKS+nLbED2Z5pHTyqv5ZtB/PKsDUCwA+vJwFyx
	ZDhMeYZYsmUEV4mq5xnbf4DnASyl/jIweTsOEmRgkj2ZDR4l0M9JX/wAh+IaOkDom+qXT4cPmuhZr
	5KNXuk/XKT3OFz2iX8aoJ9+aaaHnNZEwhFvOK4jLHI2nboeYH5HBKhJlUj0AxvJW6G9Zc4QY1ZJlR
	qxv6Ht6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAgX-00000001MTy-30hT;
	Tue, 04 Aug 2026 08:39:41 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAgU-00000001MSa-3vxK;
	Tue, 04 Aug 2026 08:39:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EF21BFAEB;
	Tue,  4 Aug 2026 11:39:14 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1785832766; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7LGYalmhQwZrxOtGKmdSjC1WD7j0rRgBEPhRoGP+KSU=;
	b=XA+D7KGCymenwT0xyMUSjJEQPPERpnUrMdXzeklq/D4KURrG8s8Jixzmcs2Jvk7Vn8xXgR
	cQt+eV2EPMe5oIRfQD5jQqCBeJUXO4KHluGV62eRFvXPBewayj0KeSE+UOxgYwfufYlVNn
	KEmNM3RSaSxjp/HVnAJRDxBwCKAxBSNIwEa+chdiKERBy4VPmyNJ8fr+3fVdE/0EdL87fU
	80bJCYLBgg/D75n6RLRaf1fB48caXUq50Croscbl8I5LB7eSFNKs730GVx7hz7EjYvwENK
	d3v8Yb0+wU/9Z7ZamYCqowwsHhp83r09HkikMfRX9oagTKpcL4Dr0xxOu07Nxw==
From: Vladislav Leonov <vlad@zlab.su>
To: sjg@chromium.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@nabladev.com,
	heiko@sntech.de,
	hl@rock-chips.com,
	jeffy.chen@rock-chips.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	michael.riesch@collabora.com,
	robh@kernel.org,
	vkoul@kernel.org,
	ziyao@disroot.org,
	Vladislav Leonov <vlad@zlab.su>
Subject: Re: [PATCH v3 3/6] dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
Date: Tue,  4 Aug 2026 11:38:56 +0300
Message-ID: <20260804083856.11447-1-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729133609.3465563-4-sjg@chromium.org>
References: <20260729133609.3465563-4-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_013939_505804_EFAF320E 
X-CRM114-Status: UNSURE (   3.80  )
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

Tested on custom PCB with RV1106G2.
Comparing with the V2 series, GPIO now works without any issues.

Regards,
Vladislav

Tested-by: Vladislav Leonov <vlad@zlab.su>

