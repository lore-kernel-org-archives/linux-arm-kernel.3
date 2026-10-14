Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D74CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 02:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okdk8hxm0dW/XUwfuxYTgGwSE96/fYrUOqgmlQ1vuHs=; b=2rX51p643fhPOFdJa547KAUDk3
	x2pm/zBk3S0g3aeXpWRo9Pvt66Kjrt7YXJs1LkFOXxfUcbMBB7fZhVHRr+CpFlTHYE250w0VvdxXO
	WQKklhdB93WkCwZcwQJD3u+nviAHFUbkzMBg5DiqMKspwiDDtt//stzEwy8luJJMUwHYd9/ll2soR
	WV+SJQFi7b9RJtt68O+rD1qxTF3YviEAh9++zTh82rBb893n2e9bLdqdt3UlqJ2e2BR5Wzqu4MQpJ
	cM3WeTchTuF81kUrKOSDCSs8IrK56G2SkoWTWtUWSH9KYORM7dsigyeV+8kAE8BZLFtDZCY3ilDZP
	LO7jShvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGp3I-0000000ENhE-2h00;
	Wed, 14 Oct 2026 02:49:12 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGp3F-0000000ENgJ-3cxx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 02:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ok
	dk8hxm0dW/XUwfuxYTgGwSE96/fYrUOqgmlQ1vuHs=; b=oIIglN6gPucGyfVL1t
	WwtCGfdfOtcbKWfbJKEEPpHZIKPJFLpLFh4JrWh/JJyLQnR3j1CuBlsU5Mr62nHf
	4FliQ9fVZrp1kd7rSINBIE/7lxu3cuHkQkACg+2T4DjKN/yWGPTjieSEhz/ozaLB
	YYrs9kuxCrE8yXv4UVqKrRh5c=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3f2Et7c5qnkk1Eg--.60824S2;
	Wed, 14 Oct 2026 10:47:10 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: david@lechnology.com
Cc: brgl@kernel.org,
	linux@armlinux.org.uk,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hppiscas@163.com
Subject: Re: [PATCH v2] ARM: davinci_all_defconfig: enable the current ST7586 symbol
Date: Wed, 14 Oct 2026 10:47:07 +0800
Message-ID: <20261014024707.77051-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <c2dcc1be-ede4-4f80-83ed-3aeb0590f576@lechnology.com>
References: <20260814075624.16639-1-pengpeng@iscas.ac.cn> <c2dcc1be-ede4-4f80-83ed-3aeb0590f576@lechnology.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3f2Et7c5qnkk1Eg--.60824S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUeb18UUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7Q7UnWrO7S6BLgAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_194910_245249_462BDED3 
X-CRM114-Status: UNSURE (   5.82  )
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

Hi David,

Please add:

Fixes: 9b8f32002cdd ("drm/sitronix: move tiny Sitronix drivers to their own subdir")

That commit moved the driver to DRM_ST7586 and made TINYDRM_ST7586 a
promptless compatibility symbol defaulting to n. The old defconfig entry
therefore stopped enabling the driver at that point, before the broken
compatibility layer was subsequently removed.

Thanks for the review,
Pengpeng


