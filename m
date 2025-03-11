Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E22C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 02:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vu8ImCGFXxixxPjXVj8rCcNTzrcJTAnVmtD+X7Jq1DU=; b=Vl00wUu4aubFtbYLc/JXakqcGh
	u3FrIkQo1N2rla8pC2s45SPjPBfqGvANLsH/Odvf5jleP0quMqiqx7qsWSBXNk+YV8KzNPGVbAGuO
	hBM/Kx1bU8sPUM696ZtwiBlmyczliAuAd143UQV+nLrtnlDNS0RqDCIOHQ8US//5wNy3dYPuUbZs6
	HQ/jnV6Gy74fUsDk8ClTtsdjCyExgLH6r/bh0IH4btjfqmJs27DbK4XygSP0Fd3xZzKzsW2VkWmbW
	Uoj0PnojAANom/Cy8Cm/nUrwBrTcVs2jHpwm70biK8GmzdSzwf5EiiXQN/O4W0L3EWHqJc6JSi7wL
	jDavLBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trovF-00000004Nzu-2jSV;
	Tue, 11 Mar 2025 02:00:45 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trosh-00000004Now-1eAM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 01:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Vu8ImCGFXxixxPjXVj8rCcNTzrcJTAnVmtD+X7Jq1DU=;
	b=WUHI9WuPN7rT1+u1uLXB/B7G2OXGNzSnKPBG9QaC9MH9mW7YKu9TSowR1cSTxL
	Nk3c2Ba6yw5gYTSzza1xUMw2JJbCEL0f62GPSiWKHjo2FCr2nCwKucnaoEk4mRKt
	ziVFN5ENCE0UaOhPDWb4HHHljpo2EXPQgnFsUbKm6yqac=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnj9SemM9nu9OuAA--.43884S3;
	Tue, 11 Mar 2025 09:57:52 +0800 (CST)
Date: Tue, 11 Mar 2025 09:57:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: dts: imx53-mba53: Fix the PCA9554 compatible
Message-ID: <Z8+YnsJ20SJe7YhC@dragon>
References: <20250220133153.2380248-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220133153.2380248-1-festevam@gmail.com>
X-CM-TRANSID: M88vCgDnj9SemM9nu9OuAA--.43884S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7Vc_DUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgkNZWfPVKnC7wAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_185807_788887_509634F0 
X-CRM114-Status: UNSURE (   8.49  )
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

On Thu, Feb 20, 2025 at 10:31:53AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> gpio-pca95xx.yaml documents 'nxp,pca9554', so use this compatible
> to fix the following dt-schema warning:
> 
> failed to match any schema with compatible: ['pca9554']
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


