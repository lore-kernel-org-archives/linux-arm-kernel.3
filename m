Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F9CCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vkKMxf17e38diTrd8d7LZ5FzwArRfBMVD8++NmkNFY=; b=T9PvKHKdSuqJTmlEfWBpjGJMtA
	s4KfEQzqq74kgIA8rOWJdnORI234U1q/kSonr22/5l6KupUzpaQ6RtUVNRcwMh5UKM2+G0Iwcp5se
	JXBNODWPv2FUPjUDWjMMCIbvVWLULv5oP6Fesewca1jgU2aEVXNRZp8JU3KvAXHDLPjmMKdg30hRD
	26O5YrOlfaUh3+jGqCoy96UOcmJUoARjrV4OXhs0HsBybpil87ErC45BqFqgXRcwv1dldIT7gwNYB
	QdEsoX4vukaNubH/GJQYdMPgw3rNkAM3kqQ5QDuXansefnoBccbzBxKvRFZXVHs5Jx3zysghubheh
	brXlfRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIoky-00000007GMH-0H8B;
	Tue, 11 Nov 2025 13:50:00 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIokv-00000007GLN-0JEx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 13:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=2vkKMxf17e38diTrd8d7LZ5FzwArRfBMVD8++NmkNFY=;
	b=eWREf8iXLuLd9plb6jnp4QaIo7pbi+FuTcQL/YI0+h1TazDRMOCjwfyHburar7
	wOvk+GmqVGKEFqr90TwEpAJVOX3NixI1qYQUhMrKV8Gv96nlvA7A+xCJmPuZxMx0
	zGk4qSFKoX0B2fl6Jhrj/tVYrkMl9lf7TYciVLi2qQTqE=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAHhmfpPhNpH63GAQ--.5223S3;
	Tue, 11 Nov 2025 21:49:31 +0800 (CST)
Date: Tue, 11 Nov 2025 21:49:29 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Fix ethernet PHY
 address
Message-ID: <aRM-6aREP-hrnio0@dragon>
References: <20251026121730.13197-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026121730.13197-1-laurent.pinchart@ideasonboard.com>
X-CM-TRANSID: M88vCgAHhmfpPhNpH63GAQ--.5223S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUza9aUUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAvoTmkTPutIKAAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_054957_417271_951630EE 
X-CRM114-Status: UNSURE (   7.45  )
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

On Sun, Oct 26, 2025 at 02:17:29PM +0200, Laurent Pinchart wrote:
> The RTL8211E ethernet PHY on the Debix Model A board it located at
> address 1. Replace the broadcast address with the correct unicast
> address.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks!


