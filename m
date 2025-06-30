Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7082AC83000
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 03:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdncWhYOth4XsRh697dCBi3DdkMHRax6Ejf9OY8OaFU=; b=e5OxqR6CjaiPf+FquNYNAOpDbs
	UOEIx3NqzA3LXdKF8uHbOSVBpEEhrpBivtlvxRgsUZwEkaYgxQAotlH8DVremrQim4KNqqOSiTDUB
	qKudVNybT7B5WRzLFnX/G9drHLrWzNt80PCBSVK94CUp2h7iIjhyOwwxo+h88265B1YnQ06ivEk5f
	CJmdGITv7uyWL3F4/nVA61nVHzQ6DmghIAqLNQnWTJOtBVw4OjCAKX5hYmlYTY6N9kj3IqFWi4qti
	XPBhgIvR4jzynZ9TCrAw014syLXOlCFUPFD9Nc5UR1GowNOzDRx2GZCFD6SNuon3029fLHOa79Hd9
	IQpzbv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5MX-000000017z7-12bA;
	Mon, 30 Jun 2025 03:39:21 +0000
Received: from mail-8140.vip.163.com ([60.191.81.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5KC-000000017ln-0dkV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 03:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qdncWhYOth4XsRh697dCBi3DdkMHRax6Ejf9OY8OaFU=;
	b=gvVCSYMTCNoxNh/h6g8VWMVoFtxUr7hJIEcpiUCa1SM+RyIi9/56dcfsrqM8kG
	jg+Q6EPq+v4M1GIa4Kgx1Wt9RXTyzDCcknDaS9p1F9GSMhOvsMb8jjqYHtC6e0++
	advQTP0riI22qgS3Fq/zsrJJVcnw/hA6RciTrNSfTjI/o=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnnw4RBmJouQnOAQ--.13995S3;
	Mon, 30 Jun 2025 11:35:47 +0800 (CST)
Date: Mon, 30 Jun 2025 11:35:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, Frank.Li@nxp.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] update NETC node of i.MX95
Message-ID: <aGIGEVXNyCQZwE4A@dragon>
References: <20250528083433.3861625-1-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528083433.3861625-1-wei.fang@nxp.com>
X-CM-TRANSID: M88vCgAnnw4RBmJouQnOAQ--.13995S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUeksqDUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ98ZWhh4l2X2QABsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_203656_394602_771F83BB 
X-CRM114-Status: GOOD (  11.40  )
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

On Wed, May 28, 2025 at 04:34:30PM +0800, Wei Fang wrote:
> We found that NETC has an overshoot issue, so the drive strength of the
> related pins needs to be reduced. The first two patches are used to fix
> this issue. The third patch adds SMMU support for NETC.
> 
> Wei Fang (3):
>   arm64: dts: imx95-19x19-evk: fix the overshoot issue of NETC
>   arm64: dts: imx95-15x15-evk: fix the overshoot issue of NETC
>   arm64: dts: imx95: add SMMU support for NETC

Applied all, thanks!


